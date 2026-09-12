import test from 'node:test';
import assert from 'node:assert/strict';
import { DEFAULT_TERM_GROUPS, normalizeTermGroups, selectedTermGroups } from '../web/term-categories.js';

test('category defaults exclude external symbols, not unknown terms', () => {
  assert.equal(DEFAULT_TERM_GROUPS.external_symbols, false);
  for (const [key, value] of Object.entries(DEFAULT_TERM_GROUPS)) if (key !== 'external_symbols') assert.equal(value, true);
});
test('explicit URL selection wins, including no selected groups', () => {
  const none = selectedTermGroups(new URLSearchParams('types=none'), DEFAULT_TERM_GROUPS);
  assert.equal(Object.values(none).some(Boolean), false);
  const some = selectedTermGroups(new URLSearchParams('types=functions,microtheories'), DEFAULT_TERM_GROUPS);
  assert.deepEqual(Object.keys(some).filter(key => some[key]), ['functions', 'microtheories']);
  assert.throws(() => selectedTermGroups(new URLSearchParams('types=made-up'), DEFAULT_TERM_GROUPS));
});
test('partial preference updates preserve other category choices', () => {
  const first = normalizeTermGroups({ external_symbols: true, predicates: false });
  const next = normalizeTermGroups({ collections: false }, first);
  assert.equal(next.external_symbols, true);
  assert.equal(next.predicates, false);
  assert.equal(next.collections, false);
  assert.equal(next.functions, true);
});
