import test from 'node:test';
import assert from 'node:assert/strict';
import { occurrenceFileHref } from '../web/term-file-context.js';

test('unloaded file navigation preserves term and filters only that file', () => {
  const term = 'nat:x_ActionModelMtFn(x_Freeciv-TheGame)';
  const href = occurrenceFileHref(term, 'unloaded', 'KBs/a file.krf');
  const params = new URLSearchParams(href.split('?')[1]);
  assert.match(href, /^#\/definitions\?/u);
  assert.equal(params.get('term'), term);
  assert.equal(params.get('scope'), 'unloaded');
  assert.equal(params.get('source'), 'KBs/a file.krf');
  assert.equal(params.get('facet'), 'semantic');
  assert.ok(!href.includes('/load'));
});
test('definition facet remains explicit and does not change identity', () => {
  const href = occurrenceFileHref('x_p', 'loaded', 'KBs/p.krf', 'definition');
  const params = new URLSearchParams(href.split('?')[1]);
  assert.equal(params.get('term'), 'x_p');
  assert.equal(params.get('facet'), 'definition');
});
