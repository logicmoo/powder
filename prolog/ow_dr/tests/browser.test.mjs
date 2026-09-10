import test from 'node:test';
import assert from 'node:assert/strict';
import { APIError, SourceSelection, VersionTracker, apiErrorSummary, canonicalPath, compilationIssues, contextRequestValue, fileMeasure, mergeStartupSources, normalizeContextInput, pageRange, parseRoute, positiveInteger, requestJSON, supportedSource } from '../web/model.js';
import { DEFAULT_SETTINGS, loadSettings, saveSettings, validateSettings } from '../web/settings.js';
import { APP_BASE, apiPath, appPath } from '../web/paths.js';

const file = (path, attributes = {}) => ({ type: 'file', path, name: path.split('/').at(-1), sizeBytes: 1024, ...attributes });
const nodes = [
  { type: 'directory', path: 'KBs/alpha', name: 'alpha', children: [
    file('KBs/alpha/a.kif'), file('KBs/alpha/b.krf'),
    { type: 'directory', path: 'KBs/alpha/deep', name: 'deep', children: [
      file('KBs/alpha/deep/c.metta'), file('KBs/alpha/deep/c.metta.pl'),
    ] },
  ] },
  file('KBs/tinyKB.kif'),
  { type: 'directory', path: 'KBs/empty', name: 'empty', children: [] },
];

test('source catalog excludes companions, traversal, absolute paths and duplicates', () => {
  const model = new SourceSelection([...nodes,
    file('KBs/tinyKB.kif'), file('KBs/tinyKB.kif.pl'), file('KBs/tinyKB.kif.pl.tmp'),
    file('KBs/tinyKB.kif.index.pl'), file('KBs/tinyKB.kif.pl.lock'),
    file('KBs/../private.krf'), file('C:\\private\\s.kif'), file('elsewhere/source.kif'),
  ]);
  assert.deepEqual(model.files, ['KBs/alpha/a.kif', 'KBs/alpha/b.krf', 'KBs/alpha/deep/c.metta', 'KBs/tinyKB.kif']);
  assert.equal(canonicalPath('KBs\\alpha\\a.kif'), 'KBs/alpha/a.kif');
  for (const path of ['/KBs/a.kif', 'KBs/../a.kif', 'KBs//a.kif', 'KBs/./a.kif', 'KBs/a:stream.kif', 'KBs/a\0.kif']) {
    assert.equal(canonicalPath(path), null, path);
  }
  assert.ok(supportedSource('KBs/TEST.KIF'));
  assert.ok(!supportedSource('KBs/TEST.KIF.pl'));
});

test('active manifest initializes directory tri-state without changing the manifest', () => {
  const active = ['KBs/alpha/a.kif', 'KBs\\tinyKB.kif'];
  const model = new SourceSelection(nodes, active, 12);
  assert.equal(model.generation, 12);
  assert.deepEqual(model.selectedFiles(), ['KBs/alpha/a.kif', 'KBs/tinyKB.kif']);
  assert.deepEqual(model.state('KBs/alpha'), { checked: false, indeterminate: true, disabled: false, selected: 1, total: 3 });
  assert.deepEqual(active, ['KBs/alpha/a.kif', 'KBs\\tinyKB.kif']);
  assert.equal(model.dirty, false);
});

test('clicking an indeterminate directory selects all and child exclusions remain concrete', () => {
  const model = new SourceSelection(nodes, ['KBs/alpha/a.kif']);
  model.setSelected('KBs/alpha');
  assert.equal(model.state('KBs/alpha').checked, true);
  assert.equal(model.state('KBs/alpha/deep').checked, true);
  const changes = model.setSelected('KBs/alpha/deep/c.metta', false);
  assert.deepEqual(changes, ['KBs/alpha/deep/c.metta', 'KBs/alpha/deep', 'KBs/alpha']);
  assert.equal(model.state('KBs/alpha').indeterminate, true);
  assert.deepEqual(model.selectedFiles(), ['KBs/alpha/a.kif', 'KBs/alpha/b.krf']);
  assert.ok(model.selectedFiles().every(path => supportedSource(path)));
  assert.equal(model.dirty, true);
});

test('directory toggles update descendants and ancestors without duplicates', () => {
  const model = new SourceSelection(nodes);
  for (let repeat = 0; repeat < 20; repeat++) {
    model.setSelected('KBs/alpha', true);
    model.setSelected('KBs/alpha/deep', false);
    assert.equal(model.selected.size, 2);
    assert.equal(model.state('KBs/alpha').selected, 2);
    model.setSelected('KBs/alpha', false);
    assert.equal(model.selected.size, 0);
    assert.equal(model.state('KBs/alpha').selected, 0);
  }
});

test('failed load has no implicit reset; successful replacement can unload the last source', () => {
  const model = new SourceSelection(nodes, ['KBs/tinyKB.kif'], 4);
  model.setSelected('KBs/tinyKB.kif', false);
  assert.deepEqual(model.selectedFiles(), []);
  assert.deepEqual([...model.active], ['KBs/tinyKB.kif']);
  assert.equal(model.generation, 4);
  assert.ok(model.dirty);
  model.reset([], 5);
  assert.deepEqual(model.selectedFiles(), []);
  assert.deepEqual([...model.active], []);
  assert.equal(model.generation, 5);
  assert.equal(model.dirty, false);
});

test('publication confirms a queued draft without discarding later source edits', () => {
  const model = new SourceSelection(nodes, ['KBs/tinyKB.kif'], 4);
  model.setSelected('KBs/alpha/a.kif', true);
  const submitted = model.selectedFiles();
  assert.deepEqual([...model.active], ['KBs/tinyKB.kif']);
  assert.equal(model.generation, 4);
  model.setSelected('KBs/alpha/b.krf', true);
  model.updateActive(submitted, 5, true);
  assert.deepEqual([...model.active], submitted);
  assert.deepEqual(model.selectedFiles(), ['KBs/alpha/a.kif', 'KBs/alpha/b.krf', 'KBs/tinyKB.kif']);
  assert.equal(model.state('KBs/alpha').selected, 2);
  assert.equal(model.generation, 5);
  assert.ok(model.dirty);
  model.updateActive(model.selectedFiles(), 6, true);
  assert.equal(model.dirty, false);
  model.updateActive([], 5, true);
  assert.equal(model.generation, 6);
  assert.equal(model.active.size, 3);
});

test('resetting a draft during a queued load survives publication even when previously clean', () => {
  const model = new SourceSelection(nodes, ['KBs/tinyKB.kif'], 4);
  model.setSelected('KBs/alpha/a.kif', true);
  const submitted = model.selectedFiles();
  model.reset(['KBs/tinyKB.kif'], 4);
  assert.equal(model.dirty, false);
  model.updateActive(submitted, 5, true);
  assert.deepEqual(model.selectedFiles(), ['KBs/tinyKB.kif']);
  assert.deepEqual([...model.active], submitted);
  assert.equal(model.state('KBs/alpha').selected, 0);
  assert.ok(model.dirty);
});

test('unload publication updates a clean selection and preserves an independent dirty draft', () => {
  const model = new SourceSelection(nodes, ['KBs/tinyKB.kif'], 4);
  model.updateActive([], 5);
  assert.deepEqual(model.selectedFiles(), []);
  assert.equal(model.dirty, false);
  model.setSelected('KBs/alpha/a.kif', true);
  model.updateActive(['KBs/tinyKB.kif'], 6);
  assert.deepEqual(model.selectedFiles(), ['KBs/alpha/a.kif']);
  assert.deepEqual([...model.active], ['KBs/tinyKB.kif']);
  assert.equal(model.state('KBs/alpha').indeterminate, true);
});

test('empty directories are disabled and catalog construction rejects false ancestry', () => {
  const model = new SourceSelection([...nodes, { type: 'directory', path: 'KBs/other', children: [file('KBs/escape.kif')] }]);
  assert.equal(model.state('KBs/empty').disabled, true);
  assert.equal(model.state('KBs/empty').checked, false);
  assert.deepEqual(model.setSelected('KBs/missing'), []);
  assert.equal(model.records.has('KBs/escape.kif'), false);
});

test('large shallow trees keep exact selection counts', () => {
  const children = Array.from({ length: 10000 }, (_, index) => file(`KBs/large/${index}.kif`));
  const model = new SourceSelection([{ type: 'directory', path: 'KBs/large', children }]);
  model.setSelected('KBs/large', true);
  model.setSelected('KBs/large/5000.kif', false);
  assert.equal(model.state('KBs/large').selected, 9999);
  assert.equal(model.selectedFiles().length, 9999);
  assert.ok(!model.selected.has('KBs/large/5000.kif'));
});

test('startup Select All uses complete discovery and canonical identities without losing external entries', () => {
  const files = Array.from({ length: 405 }, (_, index) => file(`KBs/all/${index}.krf`,
    { canonicalPath: `C:/repo/KBs/all/${index}.krf` }));
  const catalog = { canonicalRoot: 'C:/repo', pathCaseSensitive: false, nodes: [
    { type: 'directory', path: 'KBs/all', children: [...files,
      file('KBs/all/derived.krf.pl'), file('KBs/all/derived.krf.qlf'), file('KBs/all/derived.krf.pl.qlf'), file('KBs/all/derived.krf.inventory.json')] },
  ] };
  const existing = ['c:\\REPO\\kbs\\all\\0.krf', 'KBs/all/./0.krf', 'D:/other/KBs/all/0.krf'];
  const selected = mergeStartupSources(existing, catalog);
  assert.equal(selected.length, 406);
  assert.deepEqual(selected.slice(0, 2), [existing[0], existing[2]]);
  assert.ok(selected.includes('C:/repo/KBs/all/404.krf'));
  assert.deepEqual(mergeStartupSources(selected, catalog), selected);
  assert.throws(() => mergeStartupSources(existing, { nodes: files }), /Update the server/u);
  assert.equal(existing.length, 3);
});

test('URL state preserves filters and safely bounds pagination', () => {
  const route = parseRoute('#/mappings?q=%23%24Thing&basis=guess&confidence=medium&offset=50&limit=20&row=id');
  assert.equal(route.name, 'mappings');
  assert.equal(route.params.get('q'), '#$Thing');
  assert.equal(route.params.get('basis'), 'guess');
  assert.equal(route.params.get('row'), 'id');
  assert.equal(route.offset, 50);
  assert.equal(route.limit, 20);
  assert.equal(parseRoute('').name, 'overview');
  assert.equal(parseRoute('#/search?offset=-5&limit=0').offset, 0);
  assert.equal(parseRoute('#/search?offset=-5&limit=0').limit, 400);
  assert.equal(parseRoute('#/search?limit=10000').limit, 400);
  assert.equal(parseRoute('#/search?offset=Infinity').offset, 0);
  assert.equal(positiveInteger('1.5', 3), 3);
});

test('shared mount keeps app assets and API requests below the nested powder subtree', () => {
  assert.equal(APP_BASE, '/swish/powder/');
  assert.equal(apiPath('status'), '/swish/powder/api/status');
  assert.equal(apiPath('prolog/query'), '/swish/powder/api/prolog/query');
  assert.equal(appPath('settings.json'), '/swish/powder/settings.json');
});

test('400 defaults and validated preferences persist and drive page limits', () => {
  let stored = null;
  const storage = { getItem: () => stored, setItem: (_, value) => { stored = value; } };
  assert.deepEqual(loadSettings(storage), { pageSize: 400, queryLimit: 400 });
  const saved = saveSettings(storage, { pageSize: '125', queryLimit: '350' });
  assert.deepEqual(loadSettings(storage), saved);
  assert.equal(parseRoute('#/predicates', saved).limit, 125);
  assert.equal(parseRoute('#/predicates?limit=400', saved).limit, 400);
  for (const invalid of [0, -1, 401, 1.5, '', 'no', true]) {
    assert.throws(() => saveSettings(storage, { ...DEFAULT_SETTINGS, pageSize: invalid }));
    assert.deepEqual(loadSettings(storage), saved);
  }
  assert.throws(() => validateSettings({ pageSize: 400, queryLimit: 1001 }));
  assert.throws(() => saveSettings({ setItem: () => { throw new Error('Storage unavailable'); } }, DEFAULT_SETTINGS), /Storage unavailable/u);
});

test('query MT input preserves canonical keys and passes source expressions without prefixing', () => {
  const key = "mt:x_ContextFn('x_A & B',x_nested(x_C))";
  const display = '(ContextFn |A & B| (nested C))';
  assert.equal(normalizeContextInput(key), key);
  assert.equal(normalizeContextInput(`  ${display}  `), display);
  assert.equal(normalizeContextInput('tinyKB'), 'x_tinyKB');
  assert.equal(normalizeContextInput('x_tinyKB'), 'x_tinyKB');
  assert.equal(normalizeContextInput('  '), '');
  assert.equal(contextRequestValue({ key, display }, display), key);
  const otherKey = "mt:x_OtherContextFn('x_A & B',x_nested(x_C))";
  assert.equal(contextRequestValue({ key: otherKey, display }, display), otherKey);
  assert.equal(contextRequestValue({ key, display }, display, true), display);
  assert.equal(contextRequestValue({ key, display }, ''), '');
  assert.equal(contextRequestValue({ key, display: '' }, ''), key);
  assert.equal(contextRequestValue({ key, display: '' }, '', true), '');
  const route = parseRoute(`#/query?mt=${encodeURIComponent(key)}`);
  assert.equal(route.params.get('mt'), key);
});

test('pagination handles empty KBs, last pages and offsets beyond the result set', () => {
  assert.deepEqual(pageRange(0, 0, 50), { start: 0, end: 0, previous: 0, next: 50, hasPrevious: false, hasNext: false });
  assert.deepEqual(pageRange(52, 50, 50), { start: 51, end: 52, previous: 0, next: 100, hasPrevious: true, hasNext: false });
  assert.equal(pageRange(10, 50, 50).end, 0);
});

test('line counts and fallback size have distinct units and handle zero', () => {
  const plain = value => String(value);
  assert.equal(fileMeasure({ lineCount: 0, sizeBytes: 1024 }, plain), '0 lines');
  assert.equal(fileMeasure({ lineCount: 150, sizeBytes: 2048 }, plain), '150 lines');
  assert.equal(fileMeasure({ lineCount: null, sizeBytes: 1536 }, plain), '1.5 KB');
  assert.equal(fileMeasure({ sizeBytes: 0 }, plain), '0 KB');
  assert.equal(fileMeasure({}, plain), 'Size unavailable');
});

test('live-reload tracker seeds without refreshing and ignores missing versions', () => {
  const tracker = new VersionTracker();
  assert.equal(tracker.observe(undefined), false);
  assert.equal(tracker.observe('v1'), false);
  assert.equal(tracker.observe('v1'), false);
  assert.equal(tracker.observe(''), false);
  assert.equal(tracker.observe('v2'), true);
  assert.equal(tracker.observe('v2'), false);
  assert.equal(new VersionTracker().observe('v2'), false);
});

test('JSON client submits exact concrete paths with optimistic generation and no caching', async () => {
  let request;
  const status = { generation: 8, files: [] };
  const response = await requestJSON(apiPath('kb/load'), {
    method: 'POST', body: { files: [], generation: 7 },
    fetch: async (url, options) => {
      request = { url, options };
      return { ok: true, status: 200, json: async () => status };
    },
  });
  assert.equal(request.url, '/swish/powder/api/kb/load');
  assert.equal(request.options.cache, 'no-store');
  assert.equal(request.options.credentials, 'same-origin');
  assert.equal(request.options.headers['Content-Type'], 'application/json');
  assert.deepEqual(JSON.parse(request.options.body), { files: [], generation: 7 });
  assert.deepEqual(response, status);
});

test('JSON client presents structured busy/stale errors without treating them as success', async () => {
  await assert.rejects(requestJSON(apiPath('kb/load'), {
    fetch: async () => ({ ok: false, status: 409, json: async () => ({ error: { code: 'stale_generation', message: 'Refresh before replacing this generation.' } }) }),
  }), error => error instanceof APIError && error.code === 'stale_generation' && error.status === 409 && error.message.includes('Refresh'));
});

test('JSON errors retain 15 actionable issues and aggregate counts without successful result records', async () => {
  const issues = Array.from({ length: 15 }, (_, index) => ({
    source: `KBs/source-${index}.krf`, line: 13, column: 17, message: `Source error ${index + 1}`,
    status: 'failed', errors: [`Source error ${index + 1}`], warnings: [], notices: [],
    mappingRows: [{ type: 'errors', message: `Source error ${index + 1}` }],
  }));
  const counts = { failed: 15, busy: 0, generated: 0, cacheHits: 42 };
  const payload = { code: 'compile_failed', message: '15 source(s) failed to compile.', counts, issues,
    results: Array.from({ length: 42 }, (_, index) => ({ source: `cached-${index}`, status: 'cache_hit' })),
  };
  await assert.rejects(requestJSON(apiPath('kb/load'), {
    fetch: async () => ({ ok: false, status: 422, json: async () => ({ error: payload }) }),
  }), error => {
    assert.deepEqual(error.counts, counts);
    assert.deepEqual(error.issues, issues);
    assert.equal(error.results, undefined);
    assert.equal(error.issues[0].column, 17);
    assert.equal(compilationIssues(error).length, 15);
    assert.equal(apiErrorSummary(error), '15 source(s) failed to compile.');
    return true;
  });
});

test('structured compile counts replace legacy raw dumps with concise failure and busy summaries', () => {
  const raw = `Unknown error term compile_incomplete(summary{${'cached(success),'.repeat(1800)}})`;
  const error = new APIError(raw, 'compile_failed', 422, { counts: { failed: 15, cacheHits: 42 } });
  assert.ok(raw.length > 24900);
  assert.equal(apiErrorSummary(error), '15 source(s) failed to compile.');
  assert.ok(apiErrorSummary(error).length < 100);
  const busy = new APIError(raw, 'busy', 503, { counts: { failed: 0, busy: 2, cacheHits: 42 } });
  assert.equal(apiErrorSummary(busy), '2 source(s) are busy. Retry after the other compiler finishes.');
  assert.equal(apiErrorSummary(new APIError('Specific source error', 'invalid_input', 400)), 'Specific source error');
});

test('only failed, busy and unspecified issues are displayed, never cached or generated successes', () => {
  const error = { issues: [
    { source: 'A', status: 'failed' }, { source: 'B', status: 'busy' }, { source: 'C' },
    { source: 'D', status: 'cache_hit' }, { source: 'E', status: 'generated' }, { source: 'F', status: 'success' },
  ] };
  assert.deepEqual(compilationIssues(error).map(issue => issue.source), ['A', 'B', 'C']);
});

test('JSON client differentiates network errors, invalid responses and cancellation', async () => {
  await assert.rejects(requestJSON(apiPath('status'), { fetch: async () => { throw new Error('offline'); } }), { code: 'connection_failed' });
  await assert.rejects(requestJSON(apiPath('status'), {
    fetch: async () => ({ ok: false, status: 500, json: async () => { throw new Error('html'); } }),
  }), { code: 'invalid_response', status: 500 });
  const abort = new DOMException('Aborted', 'AbortError');
  await assert.rejects(requestJSON(apiPath('query'), { fetch: async () => { throw abort; } }), error => error === abort);
});
