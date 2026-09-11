import test from 'node:test';
import assert from 'node:assert/strict';
import { SourceSelection, visibleSourceFiles, visibleSourceDirectories, directoryStatisticsText, sourceStatisticsText, sourceStatisticsStamp, hierarchyExpansionBlock, sourceFileStates } from '../web/model.js';

test('statistics request only visible original files without changing the draft', () => {
  const file = path => ({ path, type: 'file' });
  const model = new SourceSelection([
    file('KBs/tiny.kif'),
    { path: 'KBs/group', type: 'directory', children: [file('KBs/group/a.krf'),
      { path: 'KBs/group/nested', type: 'directory', children: [file('KBs/group/nested/b.metta')] }] },
  ], ['KBs/group/a.krf'], 8);
  assert.deepEqual(visibleSourceFiles(model, new Set()), ['KBs/tiny.kif']);
  assert.deepEqual(visibleSourceFiles(model, new Set(['KBs/group'])), ['KBs/tiny.kif', 'KBs/group/a.krf']);
  assert.deepEqual(visibleSourceFiles(model, new Set(['KBs/group', 'KBs/group/nested'])),
    ['KBs/tiny.kif', 'KBs/group/a.krf', 'KBs/group/nested/b.metta']);
  assert.deepEqual(model.selectedFiles(), ['KBs/group/a.krf']);
  assert.equal(model.generation, 8);
  assert.equal(model.dirty, false);
});

test('statistics never turn missing coverage or failed counts into zero', () => {
  assert.equal(sourceStatisticsText({ state: 'unavailable' }), 'Statistics unavailable');
  assert.equal(sourceStatisticsText({ state: 'missing' }), 'Statistics missing');
  const base = { state: 'partial', counts: { assertions: 20, contentMTs: 1, referencedMTs: null, predicateFunctions: 4 },
    coverage: { references: 'unavailable' } };
  assert.match(sourceStatisticsText(base), /referenced MTs unavailable/u);
  assert.doesNotMatch(sourceStatisticsText(base), /0 referenced/u);
  assert.match(sourceStatisticsText({ ...base, counts: { ...base.counts, referencedMTs: 2 }, coverage: { references: 'partial' } }),
    /≥ 2 referenced MTs \(relations\)/u);
  assert.match(sourceStatisticsText({ ...base, counts: { ...base.counts, referencedMTs: 0 }, coverage: { references: 'relation_endpoints' } }),
    /0 referenced MTs \(relations\)/u);
  assert.match(sourceStatisticsText({ state: 'partial', counts: { assertions: -1 } }), /assertions unavailable/u);
});

test('snapshots disclose freshness and timestamps explicitly', () => {
  assert.match(sourceStatisticsStamp({ state: 'stale', generatedAt: 1700000000 }), /Stale snapshot — source changed/u);
  assert.match(sourceStatisticsStamp({ state: 'partial', generatedAt: null }), /timestamp unavailable/u);
  assert.match(sourceStatisticsStamp({ state: 'snapshot', generatedAt: Infinity }), /timestamp unavailable/u);
});

test('recorded hierarchy expansion is cycle-safe and bounded, not an inference traversal', () => {
  assert.match(hierarchyExpansionBlock('x_A', ['x_A', 'x_B'], 2), /Cycle/u);
  assert.match(hierarchyExpansionBlock('x_A', Array.from({ length: 8 }, (_, i) => `x_Depth${i}`), 8), /Depth limit/u);
  assert.match(hierarchyExpansionBlock('x_A', [], 80), /Expansion limit/u);
  assert.equal(hierarchyExpansionBlock('mt:x_ContextFn(x_A)', ['x_A'], 2), null);
  assert.equal(hierarchyExpansionBlock('x_B', ['x_A'], 1), null);
});

test('collapsed visible directories aggregate their contents, independent of selection', () => {
  const model = new SourceSelection([{ path: 'KBs/group', type: 'directory', children: [
    { path: 'KBs/group/a.kif', type: 'file' },
    { path: 'KBs/group/nested', type: 'directory', children: [{ path: 'KBs/group/nested/b.krf', type: 'file' }] },
  ] }]);
  assert.deepEqual(visibleSourceDirectories(model, new Set()), ['KBs/group']);
  assert.deepEqual(visibleSourceDirectories(model, new Set(['KBs/group'])), ['KBs/group', 'KBs/group/nested']);
  model.setSelected('KBs/group', true);
  model.setSelected('KBs/group/a.kif', false);
  assert.deepEqual(visibleSourceDirectories(model, new Set()), ['KBs/group']);
  const counts = { assertions: 6, contentMTs: 1, referencedMTs: 2, predicateFunctions: 3 };
  assert.match(directoryStatisticsText({ state: 'collecting', counts }), /^Observed: 6 assertions/u);
  assert.match(directoryStatisticsText({ state: 'snapshot', counts }), /1 distinct content MTs/u);
  assert.match(directoryStatisticsText({ state: 'partial', counts: { assertions: null } }), /assertions unavailable/u);
});

test('cached, indexed and loaded are independent; directory states ignore the draft', () => {
  const file = (path, cached, indexed) => ({ type: 'file', path, states: { cached, indexed, loaded: false } });
  const model = new SourceSelection([{ path: 'KBs/group', type: 'directory', children: [
    file('KBs/group/cached.kif', true, false),
    file('KBs/group/indexed.krf', false, true),
    { path: 'KBs/group/nested', type: 'directory', children: [
      file('KBs/group/nested/loaded.metta', false, false), file('KBs/group/nested/unknown.meld', null, null),
    ] },
  ] }], ['KBs/group/cached.kif'], 7);
  const active = ['KBs/group/nested/loaded.metta'];
  const before = sourceFileStates(model, active);
  assert.deepEqual(['cached', 'indexed', 'loaded'].map(key => before.get(active[0])[key]), [false, false, true]);
  assert.deepEqual(['cached', 'indexed', 'loaded'].map(key => before.get('KBs/group/indexed.krf')[key]), [false, true, false]);
  assert.equal(before.get('KBs/group/cached.kif').loaded, false);
  assert.deepEqual(before.get('KBs/group').coverage,
    { total: 4, cached: 1, indexed: 1, loaded: 1, startup: 0,
      cachedUnknown: 1, indexedUnknown: 1, loadedUnknown: 0, startupUnknown: 4,
      warnings: 0, errors: 0, sizeBytes: 0, warningsUnknown: 4, errorsUnknown: 4, sizeBytesUnknown: 4 });
  model.setSelected('KBs/group', true);
  assert.deepEqual(sourceFileStates(model, active), before);
  assert.equal(model.generation, 7);
  assert.equal(model.dirty, true);
});
