import test from 'node:test';
import assert from 'node:assert/strict';
import {
  TVA_FAMILIES, DEFAULT_TVA_FAMILIES, normalizeTVAFamilies, createTVAFamilyRegistry,
  annotationSummary, cycPropertyUnion, selectTVARows, createTVAClient,
  createTVASettingsController, validateTVASettingsPatch, TVA_SETTING_FIELDS,
  ASSERTION_PRIOR_FIELDS, assertionPriorSummary,
  createAssertionAnnotationController, createNativePairController,
  validateAssertionAnnotationPatch, validateNativePair,
} from '../web/native-tva.js';

const tick = () => new Promise(resolve => setImmediate(resolve));
const deferred = () => {
  let resolve, reject;
  const promise = new Promise((yes, no) => { resolve = yes; reject = no; });
  return { promise, resolve, reject };
};
const effective = (summary, rest = {}) => ({
  status: 'initialized', origin: 'atom', supplier: 'x_Entity', recordRevision: 'record-1',
  recordCount: 1, summary, ...rest,
});
const native = value => ({ renderer: 'native_data', kind: typeof value === 'number' ? 'number' : typeof value === 'boolean' ? 'boolean' : 'atom', value });
const missing = () => effective(null, { status: 'uninitialized', origin: null, supplier: null, recordCount: 0 });
const row = (entity, context = null, revision = 'r1') => ({
  entity, context, revision,
  families: {
    nars: { family: 'nars', effective: effective({ renderer: 'nars_truth_value', frequency: .5, confidence: 0 }) },
    opencog: { family: 'opencog', effective: missing() },
    cyc: { family: 'cyc', properties: [] },
  },
});
const batch = (request, revision = 'r1') => ({
  revision, context: request.context, items: request.entities.map(entity => row(entity, request.context, revision)),
  total: request.entities.length, offset: 0, limit: 200,
});
const detail = request => ({ revision: 'r1', ...request, effective: effective(native(false), { recordRevision: request.recordRevision }),
  records: [{ data: { type: 'atom', value: 'false' }, text: 'false.\n' }] });
const settingsReply = (context = null, revision = 'r1', overrides = {}) => {
  const keys = Object.keys(TVA_SETTING_FIELDS);
  const global = Object.fromEntries(keys.map(key => [key, missing()]));
  return { context, revision, global, effective: { ...global }, overrides: Object.fromEntries(keys.map(key => [key, overrides[key] ?? false])) };
};
const editorReply = (context = null, revision = 'r1', generation = 7, identity = 'source-1') => ({
  entity: 'a123', context, revision, generation, identity,
  recorded: { monotonicity: [':MONOTONIC'], direction: [':FORWARD'] },
  overrides: { monotonicity: missing(), direction: missing() },
  effective: { monotonicity: effective(native(':MONOTONIC'), { origin: 'source' }),
    direction: effective(native(':FORWARD'), { origin: 'source' }) },
});
const pairReply = (context = null, revision = 'r1', replacementRequired = false) => {
  const e = replacementRequired ? effective({ renderer: 'native_data', kind: 'compound', functor: 'vendor', arity: 3 })
    : effective({ renderer: 'nars_truth_value', frequency: .5, confidence: 0 }, { origin: 'default' });
  return { context, revision, families: { nars: { exact: e, effective: e, replacementRequired, editable: !replacementRequired } } };
};

test('typed assertion and native pair validators reject arbitrary fields, missing parts and nonfinite values', () => {
  assert.deepEqual(validateAssertionAnnotationPatch({ monotonicity: ':DEFAULT', direction: null }),
    { monotonicity: ':DEFAULT', direction: null });
  for (const patch of [{ direction: 'call(halt)' }, { monotonicity: 0 }, { arbitrary: ':DEFAULT' }]) {
    assert.throws(() => validateAssertionAnnotationPatch(patch));
  }
  assert.deepEqual(validateNativePair('nars', { frequency: '0', confidence: '.97' }), { frequency: 0, confidence: .97 });
  assert.deepEqual(validateNativePair('opencog', { strength: 1, confidence: '0e0' }), { strength: 1, confidence: 0 });
  for (const value of [false, null, [], '', ' ', '-1', '1.01', 'Infinity', '1e9999', '0x1', NaN]) {
    assert.throws(() => validateNativePair('nars', { frequency: value, confidence: 0 }));
  }
  assert.throws(() => validateNativePair('nars', { frequency: 0 }));
  assert.throws(() => validateNativePair('nars', { frequency: 0, confidence: 0, evidence: 100 }));
  assert.throws(() => validateNativePair('cyc', { strength: 0, confidence: 0 }));
});

test('assertion save preserves independent dirty selections after conflicts and rereads identity/generation', async () => {
  const calls = [], saved = [];
  let snapshot = editorReply(), conflict = true;
  const editor = createAssertionAnnotationController({ entity: 'a123',
    readAssertion: async request => { assert.equal(request.entity, 'a123'); return snapshot; },
    saveAssertion: async request => {
      calls.push(request);
      if (conflict) throw Object.assign(new Error('Assertion generation conflict'), { status: 409 });
      return editorReply(null, 'r3', 8, 'source-2');
    }, onSaved: reply => saved.push(reply),
  });
  await editor.load(); assert.equal(calls.length, 0);
  editor.edit('monotonicity', ':DEFAULT'); editor.edit('direction', null);
  assert.equal(await editor.save(), false);
  assert.deepEqual(editor.get().draft, { monotonicity: ':DEFAULT', direction: null });
  assert.deepEqual(calls[0], { entity: 'a123', context: null, patch: { monotonicity: ':DEFAULT', direction: null },
    revision: 'r1', generation: 7, identity: 'source-1' });
  snapshot = editorReply(null, 'r2', 8, 'source-2'); await editor.load(); conflict = false;
  assert.equal(editor.get().dirty, true); assert.equal(await editor.save(), true);
  assert.equal(calls[1].identity, 'source-2'); assert.equal(calls[1].generation, 8); assert.equal(calls[1].revision, 'r2');
  assert.equal(editor.get().dirty, false); assert.equal(saved.length, 1);
  editor.edit('direction', ':BACKWARD'); await editor.save();
  assert.deepEqual(calls[2].patch, { direction: ':BACKWARD' });
  editor.dispose();
});

test('assertion controller rejects switched identity, retains context drafts and aborts stale reads', async () => {
  const gate = deferred(), controller = new AbortController();
  let old = true;
  const editor = createAssertionAnnotationController({ entity: 'a123', signal: controller.signal,
    readAssertion: ({ context }) => old && context === null ? gate.promise : Promise.resolve(editorReply(context)),
    saveAssertion: async () => ({ ...editorReply('x_Mt'), entity: 'a999' }),
  });
  const first = editor.load(); old = false; await editor.setContext('x_Mt');
  editor.edit('monotonicity', ':MONOTONIC');
  gate.resolve(editorReply()); await first;
  assert.equal(editor.get().context, 'x_Mt');
  assert.equal(await editor.save(), false); assert.equal(editor.get().dirty, true);
  assert.match(editor.get().error.message, /Invalid editor response/u);
  await editor.setContext(null); assert.equal(editor.get().dirty, false);
  await editor.setContext('x_Mt'); assert.equal(editor.get().draft.monotonicity, ':MONOTONIC');
  controller.abort(); assert.equal(await editor.save(), false);
});

test('native pair edits send a whole canonical pair and explicit zeros, retaining drafts on revision conflict', async () => {
  let snapshot = pairReply('mt:x_MtFn(x_A)'), conflict = true;
  const writes = [];
  const editor = createNativePairController({ family: 'nars', initialContext: snapshot.context,
    readPairs: async () => snapshot,
    savePair: async request => { writes.push(request); if (conflict) throw new Error('Revision conflict'); return pairReply(snapshot.context, 'r3'); },
  });
  await editor.load(); assert.equal(writes.length, 0);
  editor.edit('frequency', '0'); assert.equal(await editor.save(), false);
  assert.deepEqual(writes[0].pair, { frequency: 0, confidence: 0 });
  assert.equal(editor.get().draft.frequency, '0');
  snapshot = pairReply(snapshot.context, 'r2'); await editor.load(); conflict = false; await editor.save();
  assert.equal(writes[1].revision, 'r2'); assert.equal(editor.get().dirty, false);
  editor.edit('clear', true); await editor.save(); assert.equal(writes[2].pair, null);
  assert.equal(writes[2].replace, false); editor.dispose();
});

test('unknown native forms require explicit replacement and both typed fields; no extra fields are lost implicitly', async () => {
  const writes = [];
  const editor = createNativePairController({ family: 'nars',
    readPairs: async () => pairReply(null, 'r1', true),
    savePair: async request => { writes.push(request); return pairReply(null, 'r2'); },
  });
  await editor.load(); editor.edit('frequency', 0); editor.edit('confidence', 0);
  assert.equal(await editor.save(), false); assert.equal(writes.length, 0);
  assert.match(editor.get().error.message, /Explicitly choose replacement/u);
  editor.discard(); editor.edit('replace', true); assert.equal(await editor.save(), false);
  assert.equal(writes.length, 0);
  editor.edit('frequency', 0); editor.edit('confidence', 0); assert.equal(await editor.save(), true);
  assert.deepEqual(writes[0], { context: null, family: 'nars', pair: { frequency: 0, confidence: 0 }, revision: 'r1', replace: true });
  editor.dispose();
});

test('typed editor does not double-submit or move context while a save is pending', async () => {
  const gate = deferred(); let calls = 0;
  const editor = createAssertionAnnotationController({ entity: 'a123',
    readAssertion: async () => editorReply(),
    saveAssertion: () => { calls++; return gate.promise; },
  });
  await editor.load(); editor.edit('direction', ':FORWARD'); const saved = editor.save();
  assert.equal(await editor.save(), false);
  await assert.rejects(editor.setContext('x_Mt'), /Wait/u);
  assert.equal(calls, 1); gate.resolve(editorReply(null, 'r2')); await saved; editor.dispose();
});

test('family registry is extensible and visibility defaults are independently off', () => {
  assert.deepEqual(TVA_FAMILIES.map(item => item.label), ['NARS', 'OpenCog/PLN', 'Cyc']);
  assert.equal(TVA_FAMILIES[1].checkboxLabel, 'Show TVA OpenCog/PLN');
  assert.deepEqual(DEFAULT_TVA_FAMILIES, { nars: false, opencog: false, cyc: false });
  assert.deepEqual(normalizeTVAFamilies({ nars: true }, { nars: false, opencog: true, cyc: false }), { nars: true, opencog: true, cyc: false });
  assert.deepEqual(normalizeTVAFamilies({ nars: 1, opencog: 'true' }), DEFAULT_TVA_FAMILIES);
  const registry = createTVAFamilyRegistry([{ id: 'custom', label: 'Other', summarize: () => ({ text: 'Custom native family', fields: {} }) }]);
  assert.equal(annotationSummary('custom', effective({}), registry).text, 'Custom native family');
});

test('native frequency, strength and confidence are adapted only for matching native schemas', () => {
  assert.equal(annotationSummary('nars', effective({ renderer: 'nars_truth_value', frequency: 0, confidence: 0 })).text,
    'Frequency 0 · confidence 0 · no evidence');
  assert.equal(annotationSummary('opencog', effective({ renderer: 'opencog_stv', strength: 0, confidence: 1 })).text,
    'Strength 0 · confidence 1');
  assert.equal(annotationSummary('nars', effective({ renderer: 'opencog_stv', strength: .3, confidence: 0 })).noEvidence, undefined);
  assert.equal(annotationSummary('opencog', effective({ renderer: 'vendor', confidence: 0 })).noEvidence, undefined);
  assert.equal(annotationSummary('nars', effective({ renderer: 'nars_truth_value', frequency: .3 })).text, 'Native record · unknown schema');
  assert.equal(annotationSummary('nars', effective(native(false))).text, 'false');
  assert.equal(annotationSummary('opencog', effective({ renderer: 'native_data', kind: 'list', length: 0 })).text, '[]');
});

test('backend whole payload selection is not merged and falsy values never become uninitialized', () => {
  for (const family of TVA_FAMILIES.map(item => item.id)) {
    for (const value of [0, false, '']) {
      const data = effective(native(value), { origin: 'mt', supplier: 'nat:x_ContextFn(x_A)' });
      const before = structuredClone(data);
      const result = annotationSummary(family, data);
      assert.equal(result.status, 'initialized');
      assert.equal(result.originLabel, 'Mt');
      assert.equal(result.supplier, 'nat:x_ContextFn(x_A)');
      assert.deepEqual(data, before);
    }
    assert.equal(annotationSummary(family, missing()).text, 'Uninitialized');
    assert.equal(annotationSummary(family, effective(null, { status: 'conflict', recordCount: 2 })).text, 'Conflict');
    assert.equal(annotationSummary(family, { status: 'invalid' }).text, 'Invalid');
    assert.equal(annotationSummary(family, {}).text, 'Unknown');
    assert.match(annotationSummary(family, { status: 'transport_error' }).text, /Unknown status/);
  }
});

test('Cyc union is dynamic, independent properties and explicit missing properties remain visible', () => {
  const first = row('x_One'), second = row('x_Two');
  first.families.cyc.properties = [
    { property: 'zero', effective: effective(native(0), { origin: 'atom' }) },
    { property: 'default-only', effective: effective(native(false), { origin: 'default', supplier: 'default' }) },
  ];
  second.families.cyc.properties = [
    { property: 'empty', effective: effective({ renderer: 'native_data', kind: 'list', length: 0 }, { origin: 'mt' }) },
    { property: 'requested-absent', effective: missing() },
  ];
  assert.deepEqual(cycPropertyUnion([first, second]), ['default-only', 'empty', 'requested-absent', 'zero']);
  assert.deepEqual(cycPropertyUnion([first]), ['default-only', 'zero']);
  assert.equal(annotationSummary('cyc', second.families.cyc.properties[1].effective).text, 'Uninitialized');
});

test('sort/filter stays inside comparable family and property, preserves missing-last and deterministic ties', () => {
  const values = [undefined, 0, false, 1, 0, '2'];
  const rows = values.map((value, index) => {
    const data = row(`x_${index}`);
    data.families.cyc.properties = [{ property: 'utility', effective: value === undefined ? missing() : effective(native(value)) }];
    return data;
  });
  assert.deepEqual(selectTVARows(rows, { family: 'cyc', property: 'utility', field: 'value', order: 'desc' }).map(item => item.entity),
    ['x_3', 'x_1', 'x_4', 'x_0', 'x_2', 'x_5']);
  assert.deepEqual(selectTVARows(rows, { family: 'cyc', property: 'utility', field: 'value', type: 'boolean' }).map(item => item.entity),
    ['x_2', 'x_0', 'x_1', 'x_3', 'x_4', 'x_5']);
  assert.equal(selectTVARows(rows, { family: 'cyc', property: 'utility', field: 'value', min: 0, max: 0 }).length, 2);
  assert.equal(selectTVARows(rows, { query: 'utility' }).length, 6);
  assert.throws(() => selectTVARows(rows, { field: 'strength' }), /one family/);
  assert.throws(() => selectTVARows(rows, { family: 'nars', field: 'strength' }), /not interchangeable/);
  assert.throws(() => selectTVARows(rows, { family: 'cyc', property: 'utility', field: 'value', min: Infinity }), /finite/);
});

test('summary client coalesces rows without N+1 requests, deduplicates, and separates explicit contexts', async () => {
  const calls = [];
  const client = createTVAClient({
    fetchSummaries: async request => { calls.push(request); return batch(request); },
    fetchDetail: async () => { throw new Error('Not expanded'); },
  });
  assert.throws(() => client.summary('x_NoContext'), /explicit/);
  const first = client.summary('x_One', null), same = client.summary('x_One', null);
  const second = client.summary('x_Two', null), mt = client.summary('x_One', 'mt:x_ContextFn(x_A)');
  await Promise.all([first, same, second, mt]);
  assert.equal(calls.length, 2);
  assert.deepEqual(calls[0].entities, ['x_One', 'x_Two']);
  assert.equal(calls[1].context, 'mt:x_ContextFn(x_A)');
  assert.equal((await client.summary('x_One', null)).context, null);
  assert.equal(calls.length, 2);
  assert.equal(client.stats().detail.entries, 0);
  client.dispose();
});

test('batch sizes and cache memory are bounded; explicit missing Cyc property reaches backend', async () => {
  const calls = [];
  const client = createTVAClient({
    maxBatchSize: 2, concurrency: 1, maxSummaryEntries: 2,
    fetchSummaries: async request => { calls.push(request); return batch(request); }, fetchDetail: async request => detail(request),
  });
  await Promise.all(Array.from({ length: 5 }, (_, n) => client.summary(`x_${n}`, null)));
  assert.deepEqual(calls.map(item => item.entities.length), [2, 2, 1]);
  assert.equal(client.stats().summary.entries, 2);
  await client.summary('x_One', null, { property: 'missing-property' });
  assert.deepEqual(calls.at(-1).options, { limit: 200, family: 'cyc', property: 'missing-property' });
  client.dispose();
});

test('one aborted subscriber does not cancel other rows; last subscriber cancels shared transport', async () => {
  const transport = deferred(), signals = [];
  const client = createTVAClient({
    fetchSummaries: async (request, { signal }) => { signals.push(signal); await transport.promise; return batch(request); },
    fetchDetail: async request => detail(request),
  });
  const a = new AbortController(), b = new AbortController();
  const first = client.summary('x_One', null, { signal: a.signal });
  const second = client.summary('x_Two', null, { signal: b.signal });
  const firstRejected = assert.rejects(first, { name: 'AbortError' });
  await tick(); a.abort();
  assert.equal(signals[0].aborted, false);
  transport.resolve(); await firstRejected; await second;
  client.dispose();
  const late = deferred(); let transportSignal;
  const other = createTVAClient({
    fetchSummaries: async (request, { signal }) => { transportSignal = signal; await late.promise; return batch(request); },
    fetchDetail: async request => detail(request),
  });
  const c = new AbortController(), request = other.summary('x_One', null, { signal: c.signal });
  const rejection = assert.rejects(request, { name: 'AbortError' });
  await tick(); c.abort(); await rejection;
  assert.equal(transportSignal.aborted, true);
  late.resolve(); await tick();
  assert.equal(other.stats().summary.entries, 0);
  other.dispose();
});

test('lazy full record caches bind revision+context and invalidation rejects stale late responses', async () => {
  let calls = 0;
  const client = createTVAClient({
    fetchSummaries: async request => batch(request),
    fetchDetail: async request => { calls++; return detail(request); }, maxDetailEntries: 1,
  });
  await client.summary('x_One', null);
  assert.equal(calls, 0);
  const request = { entity: 'x_One', context: null, family: 'nars', property: null, recordRevision: 'record-1' };
  assert.equal((await client.detail(request)).records[0].text, 'false.\n');
  await client.detail(request); assert.equal(calls, 1);
  await client.detail({ ...request, context: 'x_OtherMt', recordRevision: 'record-2' });
  assert.equal(calls, 2); assert.equal(client.stats().detail.entries, 1);
  await client.detail(request); assert.equal(calls, 3);
  client.invalidate({ revision: 'r1', generation: 2 });
  await client.detail(request); assert.equal(calls, 4);
  client.dispose();
  const late = deferred();
  const stale = createTVAClient({ fetchSummaries: async request => { await late.promise; return batch(request); }, fetchDetail: async request => detail(request) });
  const pending = stale.summary('x_One', null), rejection = assert.rejects(pending, { name: 'AbortError' });
  await tick(); stale.invalidate({ revision: 'new', generation: 3 }); late.resolve(); await rejection; await tick();
  assert.equal(stale.stats().summary.entries, 0);
  stale.dispose();
});

test('mismatched/missing summary or detail responses are errors, never uninitialized', async () => {
  const client = createTVAClient({
    fetchSummaries: async request => ({ ...batch(request), items: [] }),
    fetchDetail: async request => ({ ...detail(request), context: 'x_WrongMt' }),
  });
  await assert.rejects(client.summary('x_One', null), /not Uninitialized/);
  await assert.rejects(client.detail({ entity: 'x_One', context: null, family: 'nars', recordRevision: 'r' }), /identity/);
  client.dispose();
  const revision = createTVAClient({
    revision: 'current', fetchSummaries: async request => batch(request, 'old'), fetchDetail: async request => detail(request),
  });
  await assert.rejects(revision.summary('x_One', null), { code: 'stale_annotations' });
  revision.dispose();
});

test('a cancelled transport that ignores AbortSignal cannot starve the next visible context', async () => {
  const late = deferred();
  const client = createTVAClient({
    concurrency: 1,
    fetchSummaries: async request => {
      if (request.context === 'x_OldMt') await late.promise;
      return batch(request);
    },
    fetchDetail: async request => detail(request),
  });
  const controller = new AbortController();
  const old = client.summary('x_One', 'x_OldMt', { signal: controller.signal });
  const rejection = assert.rejects(old, { name: 'AbortError' });
  await tick(); controller.abort();
  const current = await client.summary('x_One', 'x_CurrentMt');
  assert.equal(current.context, 'x_CurrentMt');
  await rejection; late.resolve(); await tick();
  assert.equal(client.stats().summary.entries, 1);
  client.dispose();
});

test('settings allow only approved config, preserve zero vs clear, and never invent seed or ordering', () => {
  assert.deepEqual(validateTVASettingsPatch({}), {});
  assert.deepEqual(validateTVASettingsPatch({ monotonic_strength: '0', default_strength: '.9', utility: null, direction: ':BACKWARD' }),
    { monotonic_strength: 0, default_strength: .9, utility: null, direction: ':BACKWARD' });
  assert.throws(() => validateTVASettingsPatch({ utility: '' }), /finite/);
  assert.throws(() => validateTVASettingsPatch({ utility: false }), /finite/);
  assert.throws(() => validateTVASettingsPatch({ utility: Infinity }), /finite/);
  assert.throws(() => validateTVASettingsPatch({ utility: '-.1' }), /finite/);
  assert.throws(() => validateTVASettingsPatch({ direction: '' }), /direction/);
  assert.throws(() => validateTVASettingsPatch({ nars: '.5' }), /not editable/);
  assert.deepEqual(Object.keys(ASSERTION_PRIOR_FIELDS), ['asserted_positive_truth', 'asserted_monotonic_confidence', 'asserted_default_confidence']);
  assert.deepEqual(validateTVASettingsPatch({ asserted_positive_truth: '0', asserted_monotonic_confidence: '.97', asserted_default_confidence: null }),
    { asserted_positive_truth: 0, asserted_monotonic_confidence: .97, asserted_default_confidence: null });
  assert.throws(() => validateTVASettingsPatch({ asserted_monotonic_confidence: '1.01' }), /finite/);
});

test('configured assertion prior stays separate, source labels untouched, negative has no inverse', () => {
  const nativeTVA = row('a60a2418202240');
  const before = structuredClone(nativeTVA);
  const assertionPrior = {
    kind: 'configured_assertion_prior', status: 'initialized', polarity: 'positive',
    observed: false, affectsNativeTVA: false, sourceMonotonicity: [':MONOTONIC'],
    truth: effective(native(1), { property: 'asserted_positive_truth', origin: 'default', supplier: 'default' }),
    confidence: effective(native(.97), { property: 'asserted_monotonic_confidence', origin: 'mt', supplier: 'nat:x_ContextFn(x_A)' }),
  };
  assert.equal(assertionPriorSummary({ assertionPrior }).status, 'initialized');
  assert.equal(assertionPriorSummary({ assertionPrior: { ...assertionPrior, polarity: 'negative' } }).status, 'unsupported');
  assert.match(assertionPriorSummary({ ...assertionPrior, polarity: 'negative' }).text, /No prior is inferred for its positive counterpart/);
  assert.equal(assertionPriorSummary({ ...assertionPrior, polarity: 'unknown' }).status, 'unsupported');
  assert.equal(assertionPriorSummary({ ...assertionPrior, observed: true }).status, 'unknown');
  assert.equal(assertionPriorSummary({ ...assertionPrior, status: 'conflict' }).status, 'conflict');
  assert.equal(assertionPriorSummary({}).status, 'unknown');
  assert.deepEqual(nativeTVA, before);
  assert.equal(nativeTVA.families.nars.effective.summary.confidence, 0);
  assert.deepEqual(assertionPrior.sourceMonotonicity, [':MONOTONIC']);
});

test('settings writes are explicit revision patches, conflicts retain unsaved input and contextual drafts', async () => {
  const reads = [], writes = [];
  let revision = 'r1', fail = true;
  const controller = createTVASettingsController({
    readSettings: async ({ context }) => { reads.push(context); return settingsReply(context, revision); },
    saveSettings: async request => {
      writes.push(request);
      if (fail) throw Object.assign(new Error('native_tva_revision_conflict'), { status: 409 });
      return settingsReply(request.context, 'r3');
    },
  });
  await controller.load();
  assert.deepEqual(controller.get().draft, {});
  assert.equal(controller.get().snapshot.effective.direction.status, 'uninitialized');
  assert.equal(writes.length, 0);
  controller.edit('utility', '0'); controller.clear('direction');
  assert.equal(await controller.save(), false);
  assert.deepEqual(controller.get().draft, { utility: '0', direction: null });
  assert.deepEqual(writes[0], { context: null, revision: 'r1', patch: { utility: 0, direction: null } });
  await controller.setContext('mt:x_ContextFn(x_A)');
  controller.edit('default_strength', '.2');
  await controller.setContext(null);
  assert.deepEqual(controller.get().draft, { utility: '0', direction: null });
  revision = 'r2'; await controller.load();
  assert.deepEqual(controller.get().draft, { utility: '0', direction: null });
  fail = false; assert.equal(await controller.save(), true);
  assert.equal(writes[1].revision, 'r2'); assert.equal(controller.get().dirty, false);
  await controller.setContext('mt:x_ContextFn(x_A)');
  assert.deepEqual(controller.get().draft, { default_strength: '.2' });
  assert.equal(reads.includes('mt:x_ContextFn(x_A)'), true);
  controller.dispose();
});

test('fast settings context change ignores stale response, no autosave, no assumed global values', async () => {
  const slow = deferred();
  const controller = createTVASettingsController({
    readSettings: async ({ context }) => {
      if (context === null) await slow.promise;
      return settingsReply(context, context === null ? 'old' : 'new');
    },
    saveSettings: async () => { throw new Error('Unexpected autosave'); },
  });
  const first = controller.load();
  await controller.setContext('x_CurrentMt'); slow.resolve(); await first;
  assert.equal(controller.get().snapshot.context, 'x_CurrentMt');
  assert.equal(controller.get().snapshot.revision, 'new');
  assert.equal(controller.get().snapshot.effective.utility.status, 'uninitialized');
  controller.edit('utility', '0');
  assert.equal(controller.get().dirty, true);
  controller.dispose();
});

test('host notification failure does not pretend a successfully saved draft was retained', async () => {
  const controller = createTVASettingsController({
    readSettings: async () => settingsReply(),
    saveSettings: async () => settingsReply(null, 'saved'),
    onSaved: () => { throw new Error('Host view detached'); },
  });
  await controller.load(); controller.edit('utility', '0');
  assert.equal(await controller.save(), true);
  assert.equal(controller.get().dirty, false);
  assert.equal(controller.get().error.saved, true);
  assert.equal(controller.get().snapshot.revision, 'saved');
  controller.dispose();
});
