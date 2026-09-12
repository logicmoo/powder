import { renderDecodedText } from './decoded-text.js';
import { renderExpression, expressionText } from './render.js';

/**
 * Native TVA components. The host owns routes, selection, generation and transport.
 * fetchSummaries({entities,context,options},{signal}) returns native_batch's DTO;
 * fetchDetail({entity,context,family,property,recordRevision},{signal}) returns
 * native_detail's DTO. Context must be a canonical key or explicit null.
 * Inspectors never synthesize/merge/seed records. Typed editors require explicit
 * saves through authorized host callbacks; native data is never executed.
 */
export const TVA_FAMILIES = Object.freeze([
  Object.freeze({ id: 'nars', label: 'NARS', checkboxLabel: 'Show TVA NARS' }),
  Object.freeze({ id: 'opencog', label: 'OpenCog/PLN', checkboxLabel: 'Show TVA OpenCog/PLN' }),
  Object.freeze({ id: 'cyc', label: 'Cyc', checkboxLabel: 'Show TVA Cyc' }),
]);
export const DEFAULT_TVA_FAMILIES = Object.freeze({ nars: false, opencog: false, cyc: false });
export const ASSERTION_PRIOR_FIELDS = Object.freeze({
  asserted_positive_truth: 'Asserted-formula prior truth',
  asserted_monotonic_confidence: 'MONOTONIC prior confidence',
  asserted_default_confidence: 'DEFAULT prior confidence',
});
export const TVA_SETTING_FIELDS = Object.freeze({
  monotonic_strength: 'Monotonic source mapping strength',
  default_strength: 'Default source mapping strength',
  direction: 'Direction',
  utility: 'Configured utility',
  missing_assertion_strength: 'Missing assertion strength',
  ...ASSERTION_PRIOR_FIELDS,
});
const own = (value, key) => value != null && Object.hasOwn(value, key);
const plain = value => value && typeof value === 'object' && !Array.isArray(value) ? value : {};
const finite = value => typeof value === 'number' && Number.isFinite(value);
const unit = value => finite(value) && value >= 0 && value <= 1;
const compareText = (a, b) => a < b ? -1 : a > b ? 1 : 0;
const abortError = () => new DOMException('Annotation request cancelled', 'AbortError');
const staleError = () => Object.assign(new Error('Annotations changed. Refresh to read the current revision.'), { code: 'stale_annotations' });
const isAbort = error => error?.name === 'AbortError';
const originLabels = Object.freeze({ atom: 'Atom', mt: 'Mt', default: 'Default' });
const statusLabels = Object.freeze({
  initialized: 'Initialized', uninitialized: 'Uninitialized', conflict: 'Conflict',
  invalid: 'Invalid', unsupported: 'Unsupported', error: 'Error', unknown: 'Unknown',
});

function abortable(promise, signal) {
  return new Promise((resolve, reject) => {
    const cancelled = () => reject(abortError());
    if (signal.aborted) cancelled();
    else signal.addEventListener('abort', cancelled, { once: true });
    Promise.resolve(promise).then(resolve, reject).finally(() => signal.removeEventListener('abort', cancelled));
  });
}

export function normalizeTVAFamilies(value, previous = DEFAULT_TVA_FAMILIES, families = TVA_FAMILIES) {
  return Object.fromEntries(families.map(({ id }) => [
    id, typeof value?.[id] === 'boolean' ? value[id] : previous?.[id] === true,
  ]));
}

function element(doc, tag, className, text) {
  const node = doc.createElement(tag);
  if (className) node.className = className;
  if (text !== undefined) node.textContent = String(text);
  return node;
}

export function createTVAVisibilityControls(presentation, {
  document: doc = globalThis.document, signal, registry = TVA_FAMILY_REGISTRY,
} = {}) {
  const definitions = [...registry.values()];
  const group = element(doc, 'fieldset', 'presentation-fieldset native-tva-visibility');
  group.append(element(doc, 'legend', null, 'Native truth-value annotations'),
    element(doc, 'p', 'muted', 'Show native annotations independently of detail expansion, spacing, and observed rule utility.'));
  const choices = element(doc, 'div', 'presentation-field-choices');
  const inputs = new Map();
  for (const { id, checkboxLabel, label: familyLabel } of definitions) {
    const label = element(doc, 'label', 'presentation-choice');
    const input = element(doc, 'input');
    input.type = 'checkbox';
    input.name = `tva-${id}`;
    input.addEventListener('change', () => presentation.set({ tvaFamilies: { [id]: input.checked } }));
    inputs.set(id, input);
    label.append(input, element(doc, 'span', null, checkboxLabel ?? `Show TVA ${familyLabel}`));
    choices.append(label);
  }
  group.append(choices);
  group.dispose = presentation.subscribe(value => {
    const families = normalizeTVAFamilies(value.tvaFamilies, DEFAULT_TVA_FAMILIES, definitions);
    for (const [id, input] of inputs) input.checked = families[id];
  }, { signal });
  return group;
}

function nativeShape(summary) {
  if (!summary || summary.renderer !== 'native_data') return { text: 'Native record · unknown schema', fields: {} };
  let text;
  if (own(summary, 'value')) text = typeof summary.value === 'string' ? JSON.stringify(summary.value) : String(summary.value);
  else if (summary.kind === 'list') text = summary.length === 0 ? '[]' : `List · ${summary.length} items`;
  else if (summary.kind === 'dict') text = `Dict · ${summary.size} entries`;
  else if (summary.kind === 'compound') text = `${summary.functor}${summary.functorTruncated ? '…' : ''}/${summary.arity}`;
  else text = `${summary.kind ?? 'Native record'}${summary.representation ? ` · exact ${summary.representation}` : ''}${own(summary, 'length') ? ` · ${summary.length} characters` : ''}`;
  return { text, fields: own(summary, 'value') ? { value: summary.value } : {}, native: true,
    ...(summary.kind === 'string' && typeof summary.value === 'string' ? { decodedString: summary.value } : {}) };
}

function pairAdapter(renderer, field, label) {
  return summary => {
    if (summary?.renderer !== renderer || !unit(summary[field]) || !unit(summary.confidence)) return nativeShape(summary);
    return {
      text: `${label} ${summary[field]} · confidence ${summary.confidence}${summary.confidence === 0 ? ' · no evidence' : ''}`,
      fields: { [field]: summary[field], confidence: summary.confidence },
      noEvidence: summary.confidence === 0,
    };
  };
}

/** Adapters are per-family and may be replaced/extended without changing the inspector. */
export function createTVAFamilyRegistry(additions = []) {
  const summaries = {
    nars: pairAdapter('nars_truth_value', 'frequency', 'Frequency'),
    opencog: pairAdapter('opencog_stv', 'strength', 'Strength'),
    cyc: nativeShape,
  };
  const registry = new Map(TVA_FAMILIES.map(family => [family.id, { ...family, summarize: summaries[family.id] }]));
  for (const adapter of additions) {
    if (!adapter || typeof adapter.id !== 'string' || typeof adapter.label !== 'string' || typeof adapter.summarize !== 'function') {
      throw new TypeError('A family adapter requires id, label and summarize(summary)');
    }
    registry.set(adapter.id, Object.freeze({ ...adapter }));
  }
  return registry;
}
export const TVA_FAMILY_REGISTRY = createTVAFamilyRegistry();

export function annotationSummary(family, effective, registry = TVA_FAMILY_REGISTRY) {
  const status = typeof effective?.status === 'string' ? effective.status : 'unknown';
  const label = statusLabels[status] ?? `Unknown status: ${status}`;
  const adapter = registry.get(family);
  const value = status === 'initialized' ? (adapter?.summarize(effective.summary) ?? nativeShape(effective.summary)) : { text: label, fields: {} };
  return {
    ...value, status, origin: effective?.origin ?? null,
    originLabel: effective?.origin == null ? null : originLabels[effective.origin] ?? `Unknown origin: ${effective.origin}`,
    supplier: effective?.supplier ?? null,
  };
}

export function cycPropertyUnion(rows) {
  return [...new Set(rows.flatMap(row => (row?.families?.cyc?.properties ?? []).map(item => item.property)))]
    .filter(value => typeof value === 'string').sort(compareText);
}

function effectiveFor(row, family, property) {
  return family === 'cyc' ? row?.families?.cyc?.properties?.find(item => item.property === property)?.effective
    : row?.families?.[family]?.effective;
}

/**
 * Sorting never compares NARS frequency to OpenCog strength or coerces falsy data.
 * Cyc scalar values are comparable only within one property and one requested type.
 * Missing, conflicting and incomparable values remain last in either direction.
 */
export function selectTVARows(rows, {
  family, property = null, field = 'entity', type = 'number', order = 'asc',
  status = 'all', origin = 'all', query = '', min, max,
} = {}) {
  if (!['asc', 'desc'].includes(order)) throw new TypeError('Invalid sort order');
  if (!['entity', 'origin', 'status', 'frequency', 'confidence', 'strength', 'value'].includes(field)) throw new TypeError('Invalid annotation sort field');
  const scoped = field !== 'entity' || status !== 'all' || origin !== 'all' || min !== undefined || max !== undefined;
  if (scoped && (!TVA_FAMILY_REGISTRY.has(family) || (family === 'cyc' && typeof property !== 'string'))) {
    throw new TypeError('Select one family and, for Cyc, one exact property');
  }
  const fields = { nars: ['frequency', 'confidence'], opencog: ['strength', 'confidence'], cyc: ['value'] };
  if (fields[family] && !['entity', 'origin', 'status', ...fields[family]].includes(field)) throw new TypeError('Fields are not interchangeable between families');
  if (![min, max].every(value => value === undefined || finite(value))) throw new TypeError('Numeric bounds must be finite');
  if ((min !== undefined || max !== undefined) && !fields[family]?.includes(field)) throw new TypeError('Numeric bounds require a numeric family field');
  if (!['number', 'string', 'boolean'].includes(type)) throw new TypeError('Invalid comparable value type');
  const search = String(query).toLowerCase();
  const value = row => {
    if (field === 'entity') return row.entity;
    const effective = effectiveFor(row, family, property);
    if (field === 'origin') return originLabels[effective?.origin];
    if (field === 'status') return effective?.status;
    if (effective?.status !== 'initialized') return undefined;
    const v = annotationSummary(family, effective).fields[field];
    if (typeof v !== type || (type === 'number' && !finite(v))) return undefined;
    return v;
  };
  return rows.map((row, index) => ({ row, index, value: value(row) })).filter(({ row, value: v }) => {
    const effective = effectiveFor(row, family, property);
    return (status === 'all' || effective?.status === status) && (origin === 'all' || effective?.origin === origin)
      && (!search || `${row.entity}\n${cycPropertyUnion([row]).join('\n')}`.toLowerCase().includes(search))
      && (min === undefined || finite(v) && v >= min) && (max === undefined || finite(v) && v <= max);
  }).sort((a, b) => {
    const missingA = a.value === undefined || a.value === null, missingB = b.value === undefined || b.value === null;
    if (missingA !== missingB) return missingA ? 1 : -1;
    const comparison = missingA ? 0 : compareText(a.value, b.value);
    return comparison * (order === 'desc' ? -1 : 1) || compareText(a.row.entity, b.row.entity) || a.index - b.index;
  }).map(item => item.row);
}

function contextKey(context) {
  if (context !== null && (typeof context !== 'string' || !context)) throw new TypeError('An explicit currentMt key or null is required');
  return context;
}
function entityKey(target) {
  const key = typeof target === 'string' ? target : target?.entity;
  if (typeof key !== 'string' || !key) throw new TypeError('A canonical term, NAT, or assertion entity key is required');
  return key;
}
function lru(maxEntries, maxBytes) {
  const entries = new Map();
  let bytes = 0;
  return {
    get(key) {
      const item = entries.get(key);
      if (item) { entries.delete(key); entries.set(key, item); }
      return item?.value;
    },
    set(key, value) {
      const size = JSON.stringify(value).length * 2;
      const old = entries.get(key);
      if (old) { entries.delete(key); bytes -= old.size; }
      if (size > maxBytes) return;
      entries.set(key, { value, size }); bytes += size;
      while (entries.size > maxEntries || bytes > maxBytes) {
        const oldest = entries.keys().next().value;
        bytes -= entries.get(oldest).size; entries.delete(oldest);
      }
    },
    clear() { entries.clear(); bytes = 0; },
    stats: () => ({ entries: entries.size, bytes }),
  };
}

export function createTVAClient({
  fetchSummaries, fetchDetail, revision = null, generation = null,
  maxSummaryEntries = 512, maxDetailEntries = 48, maxSummaryBytes = 2 * 1024 * 1024,
  maxDetailBytes = 4 * 1024 * 1024, maxBatchSize = 200, concurrency = 4,
} = {}) {
  if (typeof fetchSummaries !== 'function' || typeof fetchDetail !== 'function') throw new TypeError('Both annotation transports are required');
  for (const limit of [maxSummaryEntries, maxDetailEntries, maxSummaryBytes, maxDetailBytes, maxBatchSize, concurrency]) {
    if (!Number.isInteger(limit) || limit < 1) throw new TypeError('Cache and concurrency limits must be positive integers');
  }
  maxBatchSize = Math.min(maxBatchSize, 200);
  const summaries = lru(maxSummaryEntries, maxSummaryBytes), details = lru(maxDetailEntries, maxDetailBytes);
  const pending = new Map(), listeners = new Set(), controllers = new Set();
  let epoch = 0, disposed = false, scheduled = false, active = 0;
  let expectedRevision = revision, currentRevision = revision, currentGeneration = generation;
  const jobs = [];
  function finish(entry, error, value) {
    if (pending.get(entry.key) === entry) pending.delete(entry.key);
    for (const waiter of [...entry.waiters]) waiter.finish(error, value);
  }
  function join(entry, signal) {
    return new Promise((resolve, reject) => {
      const waiter = {
        finish(error, value) {
          if (!entry.waiters.delete(waiter)) return;
          signal?.removeEventListener('abort', cancelled);
          error ? reject(error) : resolve(value);
        },
      };
      const cancelled = () => {
        waiter.finish(abortError());
        if (!entry.waiters.size) {
          if (pending.get(entry.key) === entry) pending.delete(entry.key);
          if (entry.batch && entry.batch.every(item => !item.waiters.size)) entry.controller?.abort();
        }
      };
      entry.waiters.add(waiter);
      if (signal?.aborted) cancelled();
      else signal?.addEventListener('abort', cancelled, { once: true });
    });
  }
  function validateEnvelope(reply, context, started) {
    if (disposed || started !== epoch) throw abortError();
    if (!reply || reply.context !== context || typeof reply.revision !== 'string') throw new Error('Invalid annotation response identity or revision');
    if (expectedRevision !== null && reply.revision !== expectedRevision) throw staleError();
    if (own(reply, 'generation') && currentGeneration !== null && reply.generation !== currentGeneration) throw staleError();
    if (currentRevision !== null && currentRevision !== reply.revision) { summaries.clear(); details.clear(); }
    currentRevision = reply.revision;
  }
  function pump() {
    while (!disposed && active < concurrency && jobs.length) {
      const job = jobs.shift();
      active++;
      Promise.resolve().then(job).catch(() => {}).finally(() => { active--; pump(); });
    }
  }
  function schedule() {
    if (scheduled) return;
    scheduled = true;
    queueMicrotask(() => {
      scheduled = false;
      const groups = new Map();
      for (const entry of pending.values()) {
        if (entry.kind !== 'summary' || entry.queued) continue;
        entry.queued = true;
        const key = JSON.stringify([entry.context, entry.property]);
        if (!groups.has(key)) groups.set(key, []);
        groups.get(key).push(entry);
      }
      for (const group of groups.values()) for (let i = 0; i < group.length; i += maxBatchSize) {
        const batch = group.slice(i, i + maxBatchSize);
        jobs.push(() => runSummaryBatch(batch));
      }
      pump();
    });
  }
  async function runSummaryBatch(batch) {
    batch = batch.filter(entry => entry.waiters.size);
    if (!batch.length) return;
    const controller = new AbortController(), started = epoch;
    controllers.add(controller);
    for (const entry of batch) { entry.batch = batch; entry.controller = controller; }
    try {
      const { context, property } = batch[0];
      const reply = await abortable(fetchSummaries({
        entities: batch.map(entry => entry.entity), context,
        options: { limit: 200, ...(property !== null ? { family: 'cyc', property } : {}) },
      }, { signal: controller.signal }), controller.signal);
      if (controller.signal.aborted) throw abortError();
      validateEnvelope(reply, context, started);
      if (!Array.isArray(reply.items)) throw new Error('Invalid annotation batch');
      const rows = new Map(reply.items.map(row => [row.entity, row]));
      for (const entry of batch) {
        const row = rows.get(entry.entity);
        if (!row || row.context !== context || row.revision !== reply.revision) {
          finish(entry, new Error('Annotation summary missing or mismatched; not Uninitialized'));
        } else {
          if (entry.waiters.size) summaries.set(entry.key, row);
          finish(entry, null, row);
        }
      }
    } catch (error) { for (const entry of batch) finish(entry, error); }
    finally { controllers.delete(controller); }
  }
  const summary = (target, context, { signal, property = null } = {}) => {
    const entity = entityKey(target); contextKey(context);
    if (property !== null && typeof property !== 'string') throw new TypeError('Cyc property must be exact text');
    if (disposed || signal?.aborted) return Promise.reject(abortError());
    const key = JSON.stringify(['summary', epoch, entity, context, property]);
    const cached = summaries.get(key);
    if (cached) return Promise.resolve(cached);
    let entry = pending.get(key);
    if (!entry) {
      entry = { kind: 'summary', key, entity, context, property, waiters: new Set() };
      pending.set(key, entry); schedule();
    }
    return join(entry, signal);
  };
  const detail = (request, { signal } = {}) => {
    const { entity, context, family, property = null, recordRevision } = request;
    entityKey(entity); contextKey(context);
    if (typeof family !== 'string' || typeof recordRevision !== 'string') throw new TypeError('Family and record revision are required');
    if (disposed || signal?.aborted) return Promise.reject(abortError());
    const key = JSON.stringify(['detail', epoch, entity, context, family, property, recordRevision]);
    const cached = details.get(key);
    if (cached) return Promise.resolve(cached);
    let entry = pending.get(key);
    if (!entry) {
      entry = { kind: 'detail', key, waiters: new Set() };
      pending.set(key, entry);
      const controller = new AbortController(), started = epoch;
      entry.controller = controller; entry.batch = [entry]; controllers.add(controller);
      jobs.push(async () => {
        try {
          if (!entry.waiters.size || controller.signal.aborted) throw abortError();
          const reply = await abortable(fetchDetail({ entity, context, family, property, recordRevision }, { signal: controller.signal }), controller.signal);
          if (controller.signal.aborted) throw abortError();
          validateEnvelope(reply, context, started);
          if (reply.entity !== entity || reply.family !== family || reply.property !== property
            || reply.effective?.recordRevision !== recordRevision || !Array.isArray(reply.records)) throw staleError();
          if (entry.waiters.size) details.set(key, reply);
          finish(entry, null, reply);
        } catch (error) { finish(entry, error); }
        finally { controllers.delete(controller); }
      });
      queueMicrotask(pump);
    }
    return join(entry, signal);
  };
  function invalidate(next = {}) {
    epoch++;
    if (own(next, 'revision')) expectedRevision = currentRevision = next.revision;
    else expectedRevision = currentRevision = null;
    if (own(next, 'generation')) currentGeneration = next.generation;
    summaries.clear(); details.clear(); jobs.length = 0;
    for (const controller of controllers) controller.abort();
    controllers.clear();
    for (const entry of [...pending.values()]) finish(entry, abortError());
    for (const listener of listeners) listener({ revision: currentRevision, generation: currentGeneration });
  }
  return {
    summary, detail, invalidate,
    subscribe(listener) { listeners.add(listener); return () => listeners.delete(listener); },
    stats: () => ({ summary: summaries.stats(), detail: details.stats(), pending: pending.size }),
    dispose() { disposed = true; listeners.clear(); invalidate(); },
  };
}

/** Native data is not KB syntax. Only decoded string leaves use the shared decoder. */
export function renderNativeTVAData(data, { document: doc = globalThis.document } = {}) {
  const root = element(doc, 'code', 'native-tva-data');
  let remaining = 100000;
  function write(value, parent, depth) {
    if (--remaining < 0 || depth > 128) { parent.append(doc.createTextNode('[display limit; use exact record below]')); return; }
    const list = (items, open, close, callback = write) => {
      parent.append(doc.createTextNode(open));
      (items ?? []).forEach((item, index) => {
        if (index) parent.append(doc.createTextNode(', '));
        callback(item, parent, depth + 1);
      });
      parent.append(doc.createTextNode(close));
    };
    switch (value?.type) {
      case 'string':
        parent.append(doc.createTextNode('"'), renderDecodedText(value.value, { document: doc }), doc.createTextNode('"'));
        break;
      case 'atom': parent.append(doc.createTextNode(String(value.value))); break;
      case 'number': parent.append(doc.createTextNode(String(value.value))); break;
      case 'integer':
      case 'rational': parent.append(doc.createTextNode(String(value.text))); break;
      case 'list': list(value.items, '[', ']'); break;
      case 'compound':
        parent.append(doc.createTextNode(String(value.functor)));
        list(value.args, '(', ')');
        break;
      case 'dict':
        write(value.tag, parent, depth + 1);
        list(value.entries, '{', '}', (entry, holder, level) => {
          write(entry.key, holder, level); holder.append(doc.createTextNode(': ')); write(entry.value, holder, level);
        });
        break;
      default: parent.append(doc.createTextNode('[unknown native schema; inspect exact record below]'));
    }
  }
  write(data, root, 0);
  return root;
}

function reference(doc, key, expression, host, kind) {
  const render = host.reference;
  if (render) {
    const node = render({ key, expression: expression ?? null, kind });
    if (node) return node;
  }
  if (expression) {
    const result = (host.renderExpression ?? renderExpression)(expression, { document: doc });
    if (key !== null) result.title = key;
    return result;
  }
  return element(doc, 'code', 'native-tva-key', key === null
    ? kind === 'context' ? 'No current MT (MT fallback skipped)' : 'Supplying key unavailable'
    : key);
}

function appendOrigin(holder, effective, doc, host) {
  const model = annotationSummary('', effective);
  if (model.originLabel) {
    const source = element(doc, 'span', 'native-tva-origin', `${model.originLabel}: `);
    source.append(reference(doc, model.supplier, effective.supplierExpression, host, 'supplier'));
    holder.append(source);
  } else if (effective?.status !== 'uninitialized') {
    holder.append(element(doc, 'span', 'muted', 'Supplying origin unavailable'));
  }
}

function errorPanel(doc, error, retry) {
  const panel = element(doc, 'div', 'native-tva-error');
  panel.setAttribute('role', 'alert');
  panel.append(element(doc, 'span', null, error?.message ?? String(error)));
  if (retry) {
    const button = element(doc, 'button', 'text-button', 'Retry');
    button.type = 'button'; button.addEventListener('click', retry); panel.append(button);
  }
  return panel;
}

/**
 * A separate configured-prior view of assertion_interpretation's assertionPrior.
 * It neither fetches nor derives a prior from native annotations. Hosts may show
 * it under an independent assertionPrior presentation field, not a TVA family.
 * Original expression/polarity/category and assertion-marker colours stay owned
 * by the source renderer. No observation count or negative inverse is invented.
 */
export function assertionPriorSummary(interpretation) {
  const prior = interpretation?.assertionPrior ?? interpretation;
  if (prior?.kind !== 'configured_assertion_prior') return { status: 'unknown', text: 'Configured assertion prior unavailable', prior: null };
  if (prior.reason === 'not_loaded_assertion') return { status: 'unsupported', text: 'Not a loaded assertion; no asserted-formula prior is assigned.', prior };
  if (prior.reason === 'source_false_without_canonical_negation') return {
    status: 'unsupported', text: 'Source marks this assertion false, but no canonical negated formula is available. No positive-formula prior is inferred.', prior,
  };
  if (!['positive', 'negative'].includes(prior.polarity)) return { status: 'unsupported', text: 'Assertion polarity is unknown; no prior is inferred.', prior };
  if (prior.observed !== false || prior.affectsNativeTVA !== false || prior.materialized !== false || prior.scope !== 'asserted_formula') return {
    status: 'unknown', text: 'Prior contract unavailable; native annotations remain separate.', prior,
  };
  return { status: statusLabels[prior.status] ? prior.status : 'unknown',
    text: statusLabels[prior.status] ?? 'Unknown prior status', prior };
}

/** Compact counterpart of the full prior inspector; notation is supplied by the backend. */
export function renderAssertionPriorInline(interpretation, { document: doc = globalThis.document } = {}) {
  const model = assertionPriorSummary(interpretation), prior = model.prior;
  const root = element(doc, 'p', 'native-tva native-tva-prior-inline');
  root.dataset.priorStatus = model.status;
  const scope = prior?.polarity === 'negative'
    ? 'whole asserted negated formula (not its positive counterpart)' : 'whole asserted formula';
  root.append(doc.createTextNode(`Configured prior · ${scope}: `));
  let count = 0;
  if (model.status === 'initialized') {
    for (const [family, label] of [['nars', 'NARS'], ['opencog', 'OpenCog']]) {
      const value = prior.families?.[family];
      if (value?.kind !== 'configured_assertion_prior' || value.scope !== 'asserted_formula'
        || value.derived !== true || value.stored !== false || value.status !== 'initialized'
        || typeof value.notation !== 'string') continue;
      if (count++) root.append(doc.createTextNode(' · '));
      root.append(doc.createTextNode(`${label} `), element(doc, 'code', null, value.notation));
    }
  }
  if (!count) root.append(doc.createTextNode(model.status === 'initialized' ? 'Derived family summaries unavailable' : model.text));
  root.append(doc.createTextNode(' · configuration, not observed evidence or a stored native record.'));
  return root;
}

export function renderAssertionPrior(interpretation, { document: doc = globalThis.document, ...host } = {}) {
  const model = assertionPriorSummary(interpretation), prior = model.prior;
  const root = element(doc, 'section', 'native-tva native-tva-prior');
  root.setAttribute('aria-label', 'Configured asserted-formula prior');
  root.dataset.priorStatus = model.status;
  root.append(element(doc, 'h3', null, 'Configured asserted-formula prior'),
    renderAssertionPriorInline(interpretation, { document: doc }),
    element(doc, 'p', 'muted', 'Applies to the entire assertion linked below, including its negation. Separate from genuine native records, mapped strength, utility, and observation counts.'));
  const scope = element(doc, 'div', 'native-tva-scope');
  scope.append(element(doc, 'span', null, 'Current MT: '));
  if (own(interpretation, 'context') && (interpretation.context === null || typeof interpretation.context === 'string')) {
    scope.append(reference(doc, interpretation.context, interpretation.contextExpression, host, 'context'));
  } else scope.append(element(doc, 'span', null, 'Not supplied; no context inferred.'));
  root.append(scope);
  if (prior) {
    const source = element(doc, 'p', 'native-tva-prior-category');
    source.append(element(doc, 'span', null, `Source polarity: ${prior.polarity ?? 'unknown'} · Source category: `),
      element(doc, 'code', null, Array.isArray(prior.sourceMonotonicity) && prior.sourceMonotonicity.length
        ? prior.sourceMonotonicity.join(', ') : 'Unspecified'));
    root.append(source);
  }
  if (!prior || !['positive', 'negative'].includes(prior.polarity) || model.status === 'unsupported' || model.status === 'unknown') {
    root.append(element(doc, 'p', 'native-tva-prior-status', model.text));
  } else {
    root.append(element(doc, 'p', 'native-tva-prior-status', model.text));
    const values = element(doc, 'dl', 'properties native-tva-prior-values');
    for (const [key, label] of [['truth', 'Formula truth configuration'], ['confidence', 'Formula confidence configuration']]) {
      const effective = prior[key], value = annotationSummary('cyc', effective);
      const dd = element(doc, 'dd');
      dd.append(element(doc, 'span', null, value.text), doc.createTextNode(' · '));
      appendOrigin(dd, effective, doc, host);
      if (typeof effective?.property === 'string') dd.append(doc.createTextNode(' · '), element(doc, 'code', null, effective.property));
      values.append(element(doc, 'dt', null, label), dd);
    }
    root.append(values);
  }
  if (typeof prior?.reason === 'string' && model.status !== 'initialized') root.append(element(doc, 'p', 'muted', `Reason: ${prior.reason}`));
  if (host.sourceLink && prior?.source) {
    root.append(host.sourceLink(prior.source.file, prior.source.line, undefined, prior.source.column));
  }
  return root;
}

/**
 * Returns its own small DOM subtree, never replaces host content. target is a key
 * or {entity,expression?,source?}. The caller must supply currentMt (including null).
 * dispose()/route signal cancel work; setVisible(false) pauses detached/hidden rows.
 * Public refresh() invalidates the shared client; internal presentation updates
 * reuse caches. Prefer one client.invalidate({revision,generation}) per host event.
 */
export function createTVAInspector({
  client, target, currentMt, families = DEFAULT_TVA_FAMILIES, presentation,
  document: doc = globalThis.document, signal, registry = TVA_FAMILY_REGISTRY,
  property = null, visible = true, inline = false, ...host
} = {}) {
  let entity = entityKey(target), context = contextKey(currentMt), currentTarget = target;
  const definitions = [...registry.values()];
  let enabled = normalizeTVAFamilies(presentation?.get()?.tvaFamilies ?? families, DEFAULT_TVA_FAMILIES, definitions);
  let requestController, run = 0, dead = false, row = null;
  const expanded = new Set(), detailControllers = new Map();
  const root = element(doc, 'section', 'native-tva');
  root.setAttribute('aria-label', 'Native truth-value annotations');
  const isVisible = () => visible && !doc.hidden && !dead;
  function cancel() {
    run++; requestController?.abort();
    for (const controller of detailControllers.values()) controller.abort();
    detailControllers.clear();
  }
  function renderDetail(container, reply) {
    container.replaceChildren();
    if (!reply.records.length) container.append(element(doc, 'p', 'muted', 'No stored record.'));
    for (const record of reply.records) {
      const block = element(doc, 'div', 'native-tva-record');
      block.append(renderNativeTVAData(record.data, { document: doc }));
      const raw = element(doc, 'pre', 'compiled-prolog native-tva-raw', record.text);
      const copy = element(doc, 'button', 'copy-button', 'Copy exact native record');
      copy.type = 'button';
      copy.addEventListener('click', async () => {
        try {
          const copyText = host.copyText ?? (text => doc.defaultView.navigator.clipboard.writeText(text));
          await copyText(record.text);
          copy.textContent = 'Copied';
        } catch (error) {
          copy.textContent = 'Copy failed — select the record below';
          if (!block.querySelector('[role="alert"]')) block.append(errorPanel(doc, error));
        }
      });
      block.append(copy, raw);
      if (host.provenance && record.provenance) block.append(host.provenance(record.provenance));
      container.append(block);
    }
  }
  function familyEntry(family, prop, effective) {
    const id = JSON.stringify([family, prop]), adapter = registry.get(family);
    const model = annotationSummary(family, effective, registry);
    const block = element(doc, inline ? 'div' : 'details', `native-tva-entry${inline ? ' native-tva-inline' : ''}`);
    block.dataset.family = family; if (prop !== null) block.dataset.property = prop;
    const heading = element(doc, inline ? 'span' : 'summary');
    const summary = element(doc, 'span', 'native-tva-summary');
    if (own(model, 'decodedString')) summary.append(doc.createTextNode('"'),
      renderDecodedText(model.decodedString, { document: doc }), doc.createTextNode('"'));
    else summary.textContent = model.text;
    heading.append(element(doc, 'strong', null, `${adapter?.label ?? family}${prop !== null ? ` · ${prop}` : ''}`),
      summary);
    appendOrigin(heading, effective, doc, host);
    block.append(heading);
    if (inline) return block;
    const content = element(doc, 'div', 'native-tva-detail');
    block.append(content);
    let loaded = false, attempt = 0;
    async function load() {
      if (!block.open || !root.contains(block) || !isVisible() || !enabled[family] || loaded) return;
      detailControllers.get(id)?.abort();
      const controller = new AbortController(), token = run, local = ++attempt;
      detailControllers.set(id, controller);
      content.replaceChildren(element(doc, 'p', 'muted', 'Loading full native record…'));
      try {
        if (typeof effective?.recordRevision !== 'string') throw new Error('Record revision unavailable; refresh annotations.');
        const reply = await client.detail({ entity, context, family, property: prop, recordRevision: effective.recordRevision }, { signal: controller.signal });
        if (controller.signal.aborted || token !== run || local !== attempt || !enabled[family] || !block.open) return;
        renderDetail(content, reply); loaded = true;
      } catch (error) {
        if (!isAbort(error) && token === run && local === attempt && enabled[family] && block.open) content.replaceChildren(errorPanel(doc, error, load));
      } finally { if (detailControllers.get(id) === controller) detailControllers.delete(id); }
    }
    block.addEventListener('toggle', () => {
      if (block.open) { expanded.add(id); load(); }
      else { expanded.delete(id); detailControllers.get(id)?.abort(); detailControllers.delete(id); }
    });
    if (expanded.has(id)) block.open = true;
    return block;
  }
  function paint() {
    root.replaceChildren();
    root.hidden = !visible || !Object.values(enabled).some(Boolean);
    if (root.hidden || !row) return;
    const scope = element(doc, 'div', 'native-tva-scope');
    scope.append(element(doc, 'span', null, 'Current MT: '),
      reference(doc, context, row.contextExpression, host, 'context'));
    if (!inline) root.append(scope);
    for (const [family, adapter] of registry) {
      if (!enabled[family]) continue;
      const data = row.families?.[family];
      if (family === 'cyc') {
        if (!Array.isArray(data?.properties)) { root.append(errorPanel(doc, new Error('Cyc properties unavailable; not Uninitialized'))); continue; }
        if (!data.properties.length) {
          root.append(element(doc, 'p', 'muted', 'Cyc · Uninitialized: no property keys at this entity, current MT, or Default.'));
          continue;
        }
        const section = element(doc, 'div', 'native-tva-cyc');
        let search = '';
        const renderProperties = () => {
          for (const [key, controller] of detailControllers) {
            if (JSON.parse(key)[0] === 'cyc') { controller.abort(); detailControllers.delete(key); }
          }
          list.replaceChildren();
          const rows = [...data.properties].sort((a, b) => compareText(a.property, b.property))
            .filter(item => item.property.toLowerCase().includes(search));
          if (!rows.length) list.append(element(doc, 'p', 'muted', 'No matching Cyc properties.'));
          for (const item of rows) list.append(familyEntry(family, item.property, item.effective));
        };
        const list = element(doc, 'div', 'native-tva-property-list');
        if (data.properties.length > 4) {
          const label = element(doc, 'label', 'native-tva-property-search', 'Find Cyc property ');
          const input = element(doc, 'input'); input.type = 'search'; input.placeholder = 'Exact or partial property name';
          input.addEventListener('input', () => { search = input.value.toLowerCase(); renderProperties(); });
          label.append(input); section.append(label);
        }
        renderProperties(); section.append(list); root.append(section);
      } else if (data?.effective) root.append(familyEntry(family, null, data.effective));
      else root.append(errorPanel(doc, new Error(`${adapter.label} summary unavailable; not Uninitialized`)));
    }
    if (host.sourceLink && typeof currentTarget === 'object' && currentTarget.source) {
      const source = currentTarget.source;
      root.append(host.sourceLink(source.file, source.line, undefined, source.column));
    }
  }
  async function refresh({ invalidate = false } = {}) {
    if (dead) return;
    if (invalidate) { client.invalidate(); return; }
    cancel(); row = null; paint();
    if (!isVisible() || !Object.values(enabled).some(Boolean)) return;
    const token = run, controller = new AbortController(); requestController = controller;
    root.append(element(doc, 'p', 'muted', 'Loading native annotations…'));
    root.setAttribute('aria-busy', 'true');
    try {
      const reply = await client.summary(entity, context, { signal: controller.signal, property });
      if (token !== run || controller.signal.aborted || !isVisible()) return;
      row = reply; paint();
    } catch (error) {
      if (!isAbort(error) && token === run && isVisible()) root.replaceChildren(errorPanel(doc, error, () => refresh({ invalidate: true })));
    } finally { if (token === run) root.setAttribute('aria-busy', 'false'); }
  }
  const unsubscribe = client.subscribe(() => refresh());
  const unsubscribePresentation = presentation?.subscribe(value => {
    const next = normalizeTVAFamilies(value.tvaFamilies, DEFAULT_TVA_FAMILIES, definitions);
    if (JSON.stringify(next) === JSON.stringify(enabled)) return;
    enabled = next; refresh();
  }, { immediate: false });
  const visibilityChanged = () => { if (doc.hidden) cancel(); else refresh(); };
  doc.addEventListener('visibilitychange', visibilityChanged);
  Object.assign(root, {
    setContext(next) { contextKey(next); if (next === context) return; context = next; refresh(); },
    setTarget(next, mt) { entity = entityKey(next); context = contextKey(mt); currentTarget = next; expanded.clear(); refresh(); },
    setFamilies(next) { enabled = normalizeTVAFamilies(next, enabled, definitions); refresh(); },
    setVisible(next) { if (visible === Boolean(next)) return; visible = Boolean(next); refresh(); },
    refresh: ({ invalidate = true } = {}) => refresh({ invalidate }),
    dispose() {
      if (dead) return;
      dead = true; cancel(); unsubscribe(); unsubscribePresentation?.();
      doc.removeEventListener('visibilitychange', visibilityChanged);
      signal?.removeEventListener('abort', root.dispose);
    },
  });
  if (signal?.aborted) root.dispose();
  else { signal?.addEventListener('abort', root.dispose, { once: true }); refresh(); }
  return root;
}

function settingScalar(effective) {
  return effective?.status === 'initialized' && own(effective.summary, 'value') ? effective.summary.value : undefined;
}

export function validateTVASettingsPatch(draft) {
  const patch = {};
  for (const [field, value] of Object.entries(draft)) {
    if (!own(TVA_SETTING_FIELDS, field)) throw new TypeError(`Setting is not editable: ${field}`);
    if (value === null) { patch[field] = null; continue; }
    if (field === 'missing_assertion_strength') {
      if (![':DEFAULT', ':MONOTONIC'].includes(value)) throw new TypeError('Choose DEFAULT or MONOTONIC, or clear the missing-strength policy.');
      patch[field] = value;
    } else if (field === 'direction') {
      if (![':FORWARD', ':BACKWARD'].includes(value)) throw new TypeError('Choose Forward or Backward, or clear direction.');
      patch[field] = value;
    } else {
      const text = typeof value === 'string' ? value.trim() : value;
      const number = typeof text === 'number' ? text
        : typeof text === 'string' && /^(?:\d+(?:\.\d*)?|\.\d+)(?:[eE][+-]?\d+)?$/u.test(text) ? Number(text) : NaN;
      if (!unit(number)) throw new TypeError(`${TVA_SETTING_FIELDS[field]} must be a finite number from 0 to 1, or cleared.`);
      patch[field] = number;
    }
  }
  return patch;
}

/**
 * readSettings({context},{signal}) and saveSettings({context,patch,revision},{signal})
 * return native_settings's DTO. null selects global settings. Saves contain only
 * explicitly edited allowlisted keys. A rejected save never replaces a draft.
 */
export function createTVASettingsController({
  readSettings, saveSettings, initialContext = null, signal, onSaved, maxDraftContexts = 32,
} = {}) {
  if (typeof readSettings !== 'function' || typeof saveSettings !== 'function') throw new TypeError('Settings read and save callbacks are required');
  const entries = new Map(), listeners = new Set();
  if (!Number.isInteger(maxDraftContexts) || maxDraftContexts < 1) throw new TypeError('Draft context limit must be a positive integer');
  let context = contextKey(initialContext), loading = false, saving = false, error = null, disposed = false;
  let controller, serial = 0;
  const entry = () => {
    if (!entries.has(context)) {
      if (entries.size >= maxDraftContexts) {
        const clean = [...entries].find(([, value]) => !Object.keys(value.draft).length);
        if (!clean) throw new Error('Save or discard a settings draft before opening another MT.');
        entries.delete(clean[0]);
      }
      entries.set(context, { snapshot: null, draft: {} });
    }
    return entries.get(context);
  };
  const state = () => {
    const current = entry();
    return { context, snapshot: current.snapshot, draft: { ...current.draft },
      dirty: Object.keys(current.draft).length > 0, loading, saving, error };
  };
  const notify = () => { const current = state(); for (const listener of listeners) listener(current); };
  function accept(reply) {
    if (!reply || reply.context !== context || typeof reply.revision !== 'string'
      || !reply.effective || !reply.global || !reply.overrides
      || Object.keys(TVA_SETTING_FIELDS).some(field => !own(reply.effective, field)
        || !own(reply.global, field) || typeof reply.overrides[field] !== 'boolean')) {
      throw new Error('Invalid settings response; previous input is preserved.');
    }
    return reply;
  }
  async function load() {
    if (disposed || saving) return;
    controller?.abort(); controller = new AbortController();
    const token = ++serial, local = controller;
    loading = true; error = null; notify();
    try {
      const reply = await readSettings({ context }, { signal: local.signal });
      if (disposed || token !== serial || local.signal.aborted) return;
      entry().snapshot = accept(reply);
    } catch (reason) { if (!isAbort(reason) && token === serial) error = reason; }
    finally { if (token === serial) { loading = false; notify(); } }
  }
  async function save() {
    if (disposed || saving || loading) return false;
    const current = entry();
    if (!current.snapshot || !Object.keys(current.draft).length) return false;
    let patch;
    try { patch = validateTVASettingsPatch(current.draft); }
    catch (reason) { error = reason; notify(); return false; }
    controller?.abort(); controller = new AbortController();
    const token = ++serial, local = controller, revision = current.snapshot.revision;
    saving = true; error = null; notify();
    try {
      const reply = await saveSettings({ context, patch, revision }, { signal: local.signal });
      if (disposed || token !== serial || local.signal.aborted) return false;
      current.snapshot = accept(reply); current.draft = {};
      try { onSaved?.(reply); }
      catch (reason) { error = Object.assign(new Error(`Settings saved, but the host refresh failed: ${reason.message}`), { saved: true }); }
      return true;
    } catch (reason) {
      if (!isAbort(reason) && token === serial) error = reason;
      return false;
    } finally { if (token === serial) { saving = false; notify(); } }
  }
  const api = {
    get: state, load, save,
    async setContext(next) {
      contextKey(next);
      if (saving) throw new Error('Wait for the explicit save to finish before changing settings context.');
      const before = context; context = next;
      try { entry(); } catch (reason) { context = before; throw reason; }
      return load();
    },
    edit(field, value) {
      if (!own(TVA_SETTING_FIELDS, field)) throw new TypeError('This native property is read-only');
      if (disposed || saving) return;
      entry().draft[field] = value; error = null; notify();
    },
    clear(field) { api.edit(field, null); },
    discard() { if (saving) return; entry().draft = {}; error = null; notify(); },
    subscribe(listener) { listeners.add(listener); listener(state()); return () => listeners.delete(listener); },
    dispose() {
      disposed = true; serial++; controller?.abort(); entries.clear(); listeners.clear();
      signal?.removeEventListener('abort', api.dispose);
    },
  };
  if (signal?.aborted) api.dispose();
  else signal?.addEventListener('abort', api.dispose, { once: true });
  return api;
}

const ASSERTION_ANNOTATION_FIELDS = Object.freeze({
  monotonicity: ['Strength', ':DEFAULT', ':MONOTONIC'],
  direction: ['Direction', ':FORWARD', ':BACKWARD'],
});
export function validateAssertionAnnotationPatch(draft) {
  const patch = {};
  for (const [key, value] of Object.entries(draft)) {
    if (!own(ASSERTION_ANNOTATION_FIELDS, key)
      || value !== null && !ASSERTION_ANNOTATION_FIELDS[key].slice(1).includes(value)) {
      throw new TypeError('Choose DEFAULT/MONOTONIC strength, FORWARD/BACKWARD direction, or Use source / inherit.');
    }
    patch[key] = value;
  }
  return patch;
}
export function validateNativePair(family, values) {
  const field = family === 'nars' ? 'frequency' : family === 'opencog' ? 'strength' : null;
  if (!field || Object.keys(values).sort().join(',') !== [field, 'confidence'].sort().join(',')) {
    throw new TypeError('A native pair requires both family-specific fields.');
  }
  return Object.fromEntries([field, 'confidence'].map(key => {
    const text = typeof values[key] === 'string' ? values[key].trim() : values[key];
    const value = typeof text === 'number' ? text : typeof text === 'string'
      && /^(?:\d+(?:\.\d*)?|\.\d+)(?:[eE][+-]?\d+)?$/u.test(text) ? Number(text) : NaN;
    if (!unit(value)) throw new TypeError(`${key} must be a finite number from 0 to 1.`);
    return [key, value];
  }));
}

function typedEditorController({ read, write, accept, request, initialContext = null, signal, onSaved }) {
  let context = contextKey(initialContext), loading = false, saving = false, error = null, dead = false, serial = 0, pending;
  const entries = new Map(), listeners = new Set();
  const entry = () => {
    if (!entries.has(context)) {
      if (entries.size >= 32) {
        const clean = [...entries].find(([, e]) => !Object.keys(e.draft).length);
        if (!clean) throw new Error('Save or discard a draft before opening another MT.');
        entries.delete(clean[0]);
      }
      entries.set(context, { snapshot: null, draft: {} });
    }
    return entries.get(context);
  };
  const get = () => ({ context, ...entry(), draft: { ...entry().draft }, loading, saving, error,
    dirty: Object.keys(entry().draft).length > 0 });
  const notify = () => { for (const listener of listeners) listener(get()); };
  async function perform(save) {
    if (dead || saving || save && loading) return false;
    const current = entry();
    if (save && (!current.snapshot || !Object.keys(current.draft).length)) return false;
    let body;
    try { body = save ? request(context, current.snapshot, current.draft) : { context }; }
    catch (reason) { error = reason; notify(); return false; }
    pending?.abort(); pending = new AbortController();
    const local = pending, token = ++serial;
    loading = !save; saving = save; error = null; notify();
    try {
      const result = await (save ? write : read)(body, { signal: local.signal });
      if (dead || token !== serial || local.signal.aborted) return false;
      if (!accept(result, context)) throw new Error('Invalid editor response. Existing selections were preserved.');
      current.snapshot = result;
      if (save) {
        current.draft = {};
        try { await onSaved?.(result); }
        catch (reason) { error = Object.assign(new Error(`Saved, but visible annotation refresh failed: ${reason.message}`), { saved: true }); }
      }
      return true;
    } catch (reason) {
      if (!isAbort(reason) && token === serial) error = reason;
      return false;
    } finally { if (token === serial) { loading = false; saving = false; notify(); } }
  }
  const controller = {
    get, load: () => perform(false), save: () => perform(true),
    edit(key, value) { if (!dead && !saving) { entry().draft[key] = value; error = null; notify(); } },
    discard() { if (!saving) { entry().draft = {}; error = null; notify(); } },
    async setContext(next) {
      contextKey(next);
      if (saving) throw new Error('Wait for this explicit save before changing its MT context.');
      const previous = context; context = next;
      try { entry(); } catch (reason) { context = previous; throw reason; }
      return perform(false);
    },
    subscribe(listener) { listeners.add(listener); listener(get()); return () => listeners.delete(listener); },
    dispose() { dead = true; serial++; pending?.abort(); listeners.clear(); entries.clear(); },
  };
  if (signal?.aborted) controller.dispose();
  else signal?.addEventListener('abort', controller.dispose, { once: true });
  return controller;
}

/** Typed assertion-ID overrides. Every save sends revision + generation + identity. */
export function createAssertionAnnotationController({ entity, readAssertion, saveAssertion, ...options }) {
  return typedEditorController({ ...options,
    read: (body, requestOptions) => readAssertion({ entity, ...body }, requestOptions),
    write: saveAssertion,
    accept: (reply, context) => reply?.entity === entity && reply.context === context
      && typeof reply.revision === 'string' && typeof reply.identity === 'string'
      && Number.isSafeInteger(reply.generation) && reply.recorded && reply.overrides && reply.effective,
    request: (context, snapshot, draft) => ({ entity, context, patch: validateAssertionAnnotationPatch(draft),
      revision: snapshot.revision, generation: snapshot.generation, identity: snapshot.identity }),
  });
}
/** Typed whole-pair writes only; replacing an unknown exact record requires explicit consent. */
export function createNativePairController({ family, readPairs, savePair, ...options }) {
  if (!['nars', 'opencog'].includes(family)) throw new TypeError('Unknown native pair family.');
  const field = family === 'nars' ? 'frequency' : 'strength';
  return typedEditorController({ ...options, read: readPairs, write: savePair,
    accept: (reply, context) => reply?.context === context && typeof reply.revision === 'string'
      && reply.families?.[family]?.exact && reply.families[family].effective,
    request: (context, snapshot, draft) => {
      const item = snapshot.families[family], replace = draft.replace === true;
      if (item.replacementRequired && !replace) throw new Error('This native record is preserved. Explicitly choose replacement before saving.');
      const model = annotationSummary(family, item.effective).fields;
      const pair = draft.clear === true ? null : validateNativePair(family, {
        [field]: own(draft, field) ? draft[field] : model[field],
        confidence: own(draft, 'confidence') ? draft.confidence : model.confidence,
      });
      return { context, family, pair, revision: snapshot.revision, replace };
    },
  });
}

function editorActions(doc, controller, label) {
  const root = element(doc, 'div', 'native-tva-settings-actions');
  const save = element(doc, 'button', 'button', label), read = element(doc, 'button', 'button secondary', 'Read latest (keep edits)');
  const discard = element(doc, 'button', 'button secondary', 'Discard edits');
  for (const button of [save, read, discard]) button.type = 'button';
  save.addEventListener('click', () => controller.save()); read.addEventListener('click', () => controller.load());
  discard.addEventListener('click', () => controller.discard()); root.append(save, read, discard);
  const feedback = element(doc, 'p', 'native-tva-settings-feedback'); feedback.setAttribute('aria-live', 'polite');
  controller.subscribe(state => {
    save.disabled = state.loading || state.saving || !state.snapshot || !state.dirty;
    read.disabled = state.loading || state.saving; discard.disabled = state.saving || !state.dirty;
    feedback.setAttribute('role', state.error ? 'alert' : 'status');
    feedback.textContent = state.error ? `${state.error.message}${state.error.saved ? '' : ' Unsaved selections are kept. Read latest, review, then save again.'}`
      : state.loading ? 'Reading recorded and effective values…' : state.saving ? 'Saving explicit overrides…'
        : state.dirty ? 'Unsaved changes.' : state.snapshot ? 'Recorded state loaded. Nothing changes until you save.' : 'Values unavailable.';
  });
  return [root, feedback];
}
function effectiveDescription(effective) {
  const label = effective?.origin === 'atom' ? 'Atom override' : effective?.origin === 'source' ? 'Recorded source'
    : effective?.origin === 'mt' ? 'Mt record' : effective?.origin === 'default' ? 'Global record' : 'No supplier';
  return `${annotationSummary('cyc', effective).text} · ${label}`;
}

export function renderAssertionAnnotationEditor({ document: doc = globalThis.document, ...options }) {
  const root = element(doc, 'section', 'native-tva-assertion-editor');
  root.setAttribute('aria-label', 'Assertion strength and direction overrides');
  root.append(element(doc, 'h2', null, 'Assertion strength and direction'),
    element(doc, 'p', 'muted', 'Atom overrides win recorded source metadata. Use source / inherit removes only that override. Formula, execution and assertion ID never change; negative assertions stay negative.'));
  const controller = createAssertionAnnotationController(options), controls = new Map();
  for (const [key, [title, ...choices]] of Object.entries(ASSERTION_ANNOTATION_FIELDS)) {
    const group = element(doc, 'div', 'native-tva-setting'), label = element(doc, 'label', null, title);
    const select = element(doc, 'select'); select.name = `assertion-override-${key}`;
    for (const [value, text] of [['', 'Use source / inherit'], ['unsupported', 'Invalid/conflicting override — choose replacement'], ...choices.map(value => [value, value.slice(1)])]) {
      const option = element(doc, 'option', null, text); option.value = value; option.disabled = value === 'unsupported'; select.append(option);
    }
    select.addEventListener('change', () => controller.edit(key, select.value || null)); label.append(select);
    const clear = element(doc, 'button', 'text-button', 'Clear override · use source / inherit'); clear.type = 'button';
    clear.addEventListener('click', () => controller.edit(key, null));
    const info = element(doc, 'div', 'native-tva-setting-effective');
    group.append(label, clear, info); root.append(group); controls.set(key, { select, clear, info });
  }
  root.append(...editorActions(doc, controller, 'Save assertion overrides'));
  controller.subscribe(state => {
    root.setAttribute('aria-busy', String(state.loading || state.saving));
    for (const [key, control] of controls) {
      const saved = state.snapshot?.overrides[key];
      const value = own(state.draft, key) ? state.draft[key] : saved?.status === 'uninitialized' ? null
        : settingScalar(saved) ?? 'unsupported';
      control.select.value = value ?? ''; control.select.disabled = state.saving || !state.snapshot;
      control.clear.disabled = state.saving || !state.snapshot;
      if (!state.snapshot) { control.info.textContent = 'Recorded state not loaded.'; continue; }
      const recorded = state.snapshot.recorded[key], effective = state.snapshot.effective[key];
      control.info.replaceChildren(
        element(doc, 'p', null, `Recorded source: ${recorded.length ? recorded.map(value => typeof value === 'string' ? value : JSON.stringify(value)).join(' / ') : 'Not specified'}`),
        element(doc, 'p', null, `Exact Atom override: ${annotationSummary('cyc', saved).text}`),
        element(doc, 'p', null, `Saved effective: ${effectiveDescription(effective)}`));
      if (effective?.supplier && options.reference) control.info.append(options.reference({
        key: effective.supplier, expression: effective.supplierExpression, kind: 'supplier',
      }));
      const layers = state.snapshot.layers;
      if (layers) {
        control.info.append(element(doc, 'p', null, `Current MT exact: ${layers.mt ? annotationSummary('cyc', layers.mt[key]).text : 'Skipped — no current MT'}`),
          element(doc, 'p', null, `Global exact: ${annotationSummary('cyc', layers.global[key]).text}`));
        if (key === 'monotonicity') control.info.append(element(doc, 'p', null,
          `Global missing-strength policy: ${annotationSummary('cyc', layers.global.missing_assertion_strength).text}`));
      }
    }
  });
  Object.assign(root, { controller, setContext: context => controller.setContext(context),
    refresh: () => controller.load(), dispose: () => controller.dispose() });
  if (!options.signal?.aborted) controller.load();
  return root;
}

export function renderNativePairSettings({ document: doc = globalThis.document, readPairs, savePair, fetchDetail, ...options }) {
  const root = element(doc, 'section', 'native-tva-pair-settings'), controllers = [];
  root.append(element(doc, 'h3', null, 'Native NARS and OpenCog records'),
    element(doc, 'p', 'muted', 'Each save replaces one complete native pair. These values are separate from Cyc assertion-prior confidence. Unsupported layouts, extras and exact numeric forms stay read-only unless explicitly replaced.'));
  for (const family of ['nars', 'opencog']) {
    const field = family === 'nars' ? 'frequency' : 'strength', label = family === 'nars' ? 'NARS' : 'OpenCog/PLN';
    const controller = createNativePairController({ ...options, family, readPairs, savePair,
      onSaved: async reply => { await options.onSaved?.(reply); for (const other of controllers) if (other !== controller) other.load(); } });
    controllers.push(controller);
    const group = element(doc, 'fieldset', 'presentation-fieldset native-tva-pair');
    group.dataset.pairFamily = family; group.append(element(doc, 'legend', null, label));
    const origin = element(doc, 'p', 'muted'), inputs = new Map(), fields = element(doc, 'div', 'native-tva-pair-fields');
    for (const key of [field, 'confidence']) {
      const title = element(doc, 'label', null, key[0].toUpperCase() + key.slice(1));
      const input = element(doc, 'input'); input.name = `native-pair-${family}-${key}`;
      Object.assign(input, { type: 'number', min: '0', max: '1', step: 'any', inputMode: 'decimal' });
      input.addEventListener('input', () => controller.edit(key, input.value)); title.append(input); fields.append(title); inputs.set(key, input);
    }
    const replacement = element(doc, 'label', 'presentation-choice'), consent = element(doc, 'input'); consent.type = 'checkbox';
    consent.name = `native-pair-${family}-replace`; consent.addEventListener('change', () => controller.edit('replace', consent.checked));
    replacement.append(consent, element(doc, 'span', null, 'Explicitly replace/remove this unsupported or conflicting whole record'));
    const create = element(doc, 'button', 'button secondary'); create.type = 'button';
    create.addEventListener('click', () => controller.edit('override', true));
    const clear = element(doc, 'button', 'text-button', 'Clear MT record · inherit global pair'); clear.type = 'button';
    clear.addEventListener('click', () => controller.edit('clear', true));
    const inspect = element(doc, 'details', 'native-tva-pair-inspector'), detail = element(doc, 'div');
    inspect.append(element(doc, 'summary', null, 'Inspect complete native record'), detail);
    let inspectedKey = null, pendingKey = null, detailRequest;
    async function loadDetail() {
      if (!inspect.open || !fetchDetail) return;
      const item = controller.get().snapshot?.families[family];
      if (!item) return;
      const key = JSON.stringify(item.detail);
      if (key === inspectedKey || key === pendingKey) return;
      detailRequest?.abort(); detailRequest = new AbortController(); const local = detailRequest;
      pendingKey = key;
      detail.textContent = 'Reading native record…';
      try {
        const result = await fetchDetail(item.detail, { signal: local.signal });
        if (local.signal.aborted) return;
        detail.replaceChildren();
        for (const record of result.records) detail.append(renderNativeTVAData(record.data, { document: doc }),
          element(doc, 'pre', 'native-tva-raw', record.text));
        inspectedKey = key;
      } catch (error) { if (!isAbort(error) && !local.signal.aborted) detail.replaceChildren(errorPanel(doc, error)); }
      finally { if (detailRequest === local) pendingKey = null; }
    }
    inspect.addEventListener('toggle', loadDetail);
    group.append(origin, replacement, fields, create, clear, inspect, ...editorActions(doc, controller, `Save ${label} whole pair`));
    controller.subscribe(state => {
      const item = state.snapshot?.families[family], exists = item && item.exact.status !== 'uninitialized';
      const editable = Boolean(item && !state.saving && !state.draft.clear
        && (item.replacementRequired ? state.draft.replace === true : exists || state.draft.override));
      const model = item ? annotationSummary(family, item.effective) : null;
      origin.textContent = item ? `${model.text} · ${item.effective.origin === 'mt' ? 'Mt record' : item.effective.origin === 'default' ? 'Global record' : 'Uninitialized'}${state.draft.clear ? ' · Clear pending' : ''}`
        : 'Native record not loaded.';
      replacement.hidden = !item?.replacementRequired; consent.checked = state.draft.replace === true; consent.disabled = state.saving;
      create.hidden = Boolean(exists); create.disabled = !item || state.saving;
      create.textContent = state.context === null ? 'Create global whole pair' : 'Override whole pair for this MT';
      clear.hidden = state.context === null; clear.disabled = !exists || state.saving;
      inspect.hidden = !fetchDetail || !item || item.effective.status === 'uninitialized';
      const key = item ? JSON.stringify(item.detail) : null;
      if (key !== inspectedKey && key !== pendingKey) {
        detailRequest?.abort(); pendingKey = null; inspectedKey = null; detail.replaceChildren();
        if (!inspect.hidden) loadDetail();
      }
      for (const [key, input] of inputs) {
        input.disabled = !editable;
        const value = own(state.draft, key) ? state.draft[key] : model?.fields[key] ?? '';
        if (input.value !== String(value)) input.value = value;
      }
    });
    options.signal?.addEventListener('abort', () => detailRequest?.abort(), { once: true });
    root.append(group);
  }
  Object.assign(root, { controllers,
    setContext: context => Promise.all(controllers.map(controller => controller.setContext(context))),
    refresh: () => Promise.all(controllers.map(controller => controller.load())),
    discard: () => controllers.forEach(controller => controller.discard()),
    dispose: () => controllers.forEach(controller => controller.dispose()),
    busy: () => controllers.some(controller => controller.get().saving),
  });
  if (!options.signal?.aborted) root.refresh();
  return root;
}

/**
 * listMicrotheories({offset,limit},{signal}) must return complete paginated
 * {items:[{key,expression?}],total}. No display label is used as an identity.
 * Parent may instead pass microtheories:[...] when it already has the full list.
 * Cyc configuration and optional typed native whole-pair editors remain separate.
 */
export function renderTVASettings({
  document: doc = globalThis.document, signal, readSettings, saveSettings,
  listMicrotheories, microtheories, initialContext = null, onSaved, resetDefaults,
  readPairs, savePair, fetchDetail, ...host
} = {}) {
  const root = element(doc, 'section', 'native-tva-settings');
  root.append(element(doc, 'h2', null, 'Annotation defaults and source interpretation'),
    element(doc, 'p', 'muted', 'Explicitly save global values or independent per-MT overrides. Native pairs and configured assertion priors are separate. No save changes formulas, execution or observed rule utility.'));
  let pairs;
  const settings = createTVASettingsController({ readSettings, saveSettings, initialContext, signal,
    onSaved: reply => { onSaved?.(reply); pairs?.refresh(); } });
  if (readPairs && savePair) pairs = renderNativePairSettings({ document: doc, signal, initialContext,
    readPairs, savePair, fetchDetail, onSaved: reply => { onSaved?.(reply); settings.load(); } });
  const scope = element(doc, 'label', 'native-tva-context', 'Settings scope');
  const picker = element(doc, 'select'); picker.name = 'tva-settings-context';
  const globalOption = element(doc, 'option', null, 'Global defaults'); globalOption.value = ''; picker.append(globalOption);
  scope.append(picker);
  const scopeIdentity = element(doc, 'div', 'native-tva-scope');
  const catalogStatus = element(doc, 'div', 'muted');
  root.append(scope, scopeIdentity, catalogStatus);
  const fields = element(doc, 'div', 'native-tva-settings-fields');
  const priorGroup = element(doc, 'fieldset', 'presentation-fieldset native-tva-prior-settings');
  priorGroup.append(element(doc, 'legend', null, 'Configured assertion priors — separate from native TVA'),
    element(doc, 'p', 'muted', 'Priors apply to the whole asserted formula, including (not …), never to its positive counterpart. The effective strength category selects confidence; these settings are not observed evidence, observation counts, or another native fallback. The truth setting retains its existing storage key asserted_positive_truth.'));
  const priorFields = element(doc, 'div', 'native-tva-settings-fields');
  priorGroup.append(priorFields);
  const controls = new Map();
  let snapshotIdentity = null, dead = false;
  for (const [key, label] of Object.entries(TVA_SETTING_FIELDS)) {
    const group = element(doc, 'div', 'native-tva-setting');
    const title = element(doc, 'label', null, label);
    const holder = element(doc, 'div', 'native-tva-setting-controls');
    const use = element(doc, 'label', 'presentation-choice');
    const check = element(doc, 'input'); check.type = 'checkbox'; check.name = `tva-override-${key}`;
    const useText = element(doc, 'span');
    use.append(check, useText);
    const input = element(doc, ['direction', 'missing_assertion_strength'].includes(key) ? 'select' : 'input');
    input.name = `tva-setting-${key}`;
    // Wrapping the input keeps labels unique even when settings are embedded twice.
    title.append(input);
    if (key === 'missing_assertion_strength') {
      for (const [value, text] of [['', 'Uninitialized — no missing-strength policy'], [':DEFAULT', 'DEFAULT'], [':MONOTONIC', 'MONOTONIC']]) {
        const option = element(doc, 'option', null, text); option.value = value; input.append(option);
      }
      group.append(element(doc, 'p', 'muted', 'Global category used only when assertion strength is absent. Explicit or invalid labels are not overwritten; no source record is changed.'));
    } else if (key === 'direction') {
      for (const [value, text] of [['', 'Uninitialized — choose a direction'], [':FORWARD', 'Forward'], [':BACKWARD', 'Backward']]) {
        const option = element(doc, 'option', null, text); option.value = value; input.append(option);
      }
    } else { input.type = 'number'; input.min = '0'; input.max = '1'; input.step = 'any'; input.inputMode = 'decimal'; }
    input.addEventListener('input', () => settings.edit(key, input.value));
    const clear = element(doc, 'button', 'text-button');
    clear.type = 'button'; clear.addEventListener('click', () => settings.clear(key));
    check.addEventListener('change', () => {
      if (!check.checked) settings.clear(key);
      else {
        const effective = settings.get().snapshot?.effective?.[key];
        settings.edit(key, settingScalar(effective) ?? '');
      }
    });
    holder.append(use, clear);
    const effective = element(doc, 'div', 'native-tva-setting-effective muted');
    group.append(title, holder, effective);
    (own(ASSERTION_PRIOR_FIELDS, key) ? priorFields : fields).append(group);
    controls.set(key, { input, check, clear, effective, useText, group });
  }
  if (pairs) root.append(pairs);
  root.append(fields, priorGroup);
  const actions = element(doc, 'div', 'native-tva-settings-actions');
  const save = element(doc, 'button', 'button', 'Save annotation settings'); save.type = 'button';
  const reload = element(doc, 'button', 'button secondary', 'Read latest (keep edits)'); reload.type = 'button';
  const discard = element(doc, 'button', 'button secondary', 'Discard these edits'); discard.type = 'button';
  actions.append(save, reload, discard);
  const feedback = element(doc, 'p', 'native-tva-settings-feedback');
  feedback.setAttribute('role', 'status'); feedback.setAttribute('aria-live', 'polite');
  root.append(actions, feedback);
  const reset = typeof resetDefaults === 'function' ? element(doc, 'button', 'button secondary', 'Reset global defaults') : null;
  if (reset) {
    reset.type = 'button';
    reset.title = 'Restore the approved native global records, Backward direction, DEFAULT missing strength and configured priors. Atom and MT overrides are preserved.';
    reset.addEventListener('click', async () => {
      const current = settings.get();
      if (current.saving || pairs?.busy() || !current.snapshot) return;
      let written = false;
      root.inert = true;
      reset.disabled = true;
      try {
        const reply = await resetDefaults({ revision: current.snapshot.revision }, { signal });
        written = true;
        settings.discard();
        pairs?.discard();
        await settings.load();
        await pairs?.refresh();
        onSaved?.(reply);
        feedback.textContent = 'Global defaults restored. Atom/MT overrides, source assertions and the loaded KB are unchanged.';
      } catch (error) {
        feedback.textContent = written ? `Global defaults were saved, but refresh failed: ${error.message}` : `Global defaults were not reset: ${error.message}`;
        feedback.setAttribute('role', 'alert');
      } finally { root.inert = false; reset.disabled = false; }
    });
    actions.append(reset);
  }
  const catalog = new Map();
  function addMt(item) {
    const key = entityKey(item.key);
    if (catalog.has(key)) {
      if (item.expression) {
        catalog.set(key, item);
        const option = [...picker.options].find(choice => choice.value === key);
        if (option) option.textContent = expressionText(item.expression, { pretty: false });
      }
      return;
    }
    catalog.set(key, item);
    const option = element(doc, 'option', null, item.expression ? expressionText(item.expression, { pretty: false }) : key);
    option.value = key; picker.append(option);
  }
  if (initialContext !== null) addMt({ key: initialContext });
  picker.addEventListener('change', async () => {
    try {
      if (pairs?.busy()) throw new Error('Wait for the native pair save before changing scope.');
      const context = picker.value === '' ? null : picker.value;
      await settings.setContext(context); await pairs?.setContext(context);
    }
    catch (error) { feedback.textContent = error.message; feedback.setAttribute('role', 'alert'); }
  });
  save.addEventListener('click', () => settings.save());
  reload.addEventListener('click', () => settings.load());
  discard.addEventListener('click', () => settings.discard());
  const unsubscribe = settings.subscribe(state => {
    if (dead) return;
    picker.value = state.context ?? ''; picker.disabled = state.saving;
    if (reset) { reset.hidden = state.context !== null; reset.disabled = state.saving || !state.snapshot; }
    const snapshot = state.snapshot;
    scopeIdentity.replaceChildren(element(doc, 'span', null, state.context === null ? 'Global defaults' : 'MT override: '));
    if (state.context !== null) scopeIdentity.append(reference(doc, state.context,
      snapshot?.contextExpression ?? catalog.get(state.context)?.expression, host, 'context'));
    for (const [key, control] of controls) {
      control.group.hidden = key === 'missing_assertion_strength' && state.context !== null;
      const drafted = own(state.draft, key);
      const enabled = drafted ? state.draft[key] !== null : snapshot?.overrides?.[key] === true;
      const value = drafted ? enabled ? state.draft[key]
        : state.context === null ? undefined : settingScalar(snapshot?.global?.[key])
        : settingScalar(snapshot?.effective?.[key]);
      control.check.checked = enabled;
      control.input.disabled = !enabled || state.saving || !snapshot;
      control.check.disabled = state.saving || !snapshot;
      control.clear.disabled = state.saving || !snapshot || !enabled;
      if (control.input.value !== String(value ?? '')) control.input.value = value ?? '';
      control.useText.textContent = state.context === null ? 'Set global value' : 'Override for this MT';
      control.clear.textContent = state.context === null ? 'Clear global value' : 'Use global default';
      if (snapshotIdentity !== snapshot) {
        control.effective.replaceChildren();
        if (snapshot) {
          const effective = snapshot.effective[key], model = annotationSummary('cyc', effective);
          control.effective.append(element(doc, 'span', null, `Saved effective: ${model.text} · `));
          appendOrigin(control.effective, effective, doc, host);
          if (state.context !== null) control.effective.append(element(doc, 'span', null,
            ` · Global: ${annotationSummary('cyc', snapshot.global[key]).text}`));
        } else control.effective.textContent = 'Saved effective value not loaded.';
      }
    }
    snapshotIdentity = snapshot;
    save.disabled = state.saving || state.loading || !snapshot || !state.dirty;
    reload.disabled = state.saving || state.loading;
    discard.disabled = state.saving || !state.dirty;
    root.setAttribute('aria-busy', String(state.loading || state.saving));
    feedback.setAttribute('role', state.error ? 'alert' : 'status');
    const conflict = state.error && (state.error.status === 409 || /conflict/iu.test(`${state.error.code} ${state.error.message}`));
    feedback.textContent = state.error
      ? `${conflict ? 'Revision conflict. ' : ''}${state.error.message}${state.error.saved ? '' : ' Unsaved input is preserved.'}${conflict ? ' Read latest, review, then explicitly save again.' : ''}`
      : state.loading ? 'Reading saved settings…' : state.saving ? 'Saving explicit changes…'
        : `${state.dirty ? 'Unsaved edits. ' : ''}${snapshot ? `Server store revision: ${snapshot.revision}` : 'Settings unavailable.'}`;
  });
  const catalogController = new AbortController();
  async function loadCatalog() {
    try {
      catalogStatus.textContent = 'Loading complete MT choices…';
      if (microtheories) microtheories.forEach(addMt);
      else if (listMicrotheories) {
        let offset = 0, total = Infinity;
        const seen = new Set();
        while (offset < total) {
          const reply = await listMicrotheories({ offset, limit: 200 }, { signal: catalogController.signal });
          if (dead || catalogController.signal.aborted) return;
          if (!Array.isArray(reply?.items) || !Number.isInteger(reply.total) || reply.total < 0
            || (!reply.items.length && offset < reply.total)) throw new Error('Incomplete microtheory catalog.');
          if (total !== Infinity && total !== reply.total) throw new Error('Microtheory catalog changed while reading. Reopen settings to retry.');
          total = reply.total;
          for (const item of reply.items) {
            const key = entityKey(item.key);
            if (seen.has(key)) throw new Error('Microtheory catalog repeated a page; choices are incomplete.');
            seen.add(key); addMt(item);
          }
          offset += reply.items.length;
        }
        if (seen.size !== total) throw new Error('Incomplete microtheory catalog.');
      }
      if (!dead) {
        catalogStatus.textContent = listMicrotheories || microtheories ? `${catalog.size} MT choices (atomic and compound).` : 'MT catalog not supplied by host.';
        // Re-render the selected full identity after its AST becomes available.
        if (settings.get().context !== null) {
          const key = settings.get().context;
          scopeIdentity.replaceChildren(element(doc, 'span', null, 'MT override: '), reference(doc, key, catalog.get(key)?.expression, host, 'context'));
        }
      }
    } catch (error) {
      if (!isAbort(error) && !dead) catalogStatus.replaceChildren(errorPanel(doc, error));
    }
  }
  Object.assign(root, {
    controller: settings,
    refresh: () => settings.load(),
    dispose() {
      if (dead) return;
      dead = true; catalogController.abort(); unsubscribe(); settings.dispose(); pairs?.dispose();
      signal?.removeEventListener('abort', root.dispose);
    },
  });
  if (signal?.aborted) root.dispose();
  else {
    signal?.addEventListener('abort', root.dispose, { once: true });
    settings.load(); loadCatalog();
  }
  return root;
}
