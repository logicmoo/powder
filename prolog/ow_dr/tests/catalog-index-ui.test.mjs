import test from 'node:test';
import assert from 'node:assert/strict';
import { catalogParameters, catalogCoverageText, catalogAssertionHref, catalogJobText, catalogContextHref } from '../web/catalog-index.js';

test('all indexed files are the default and request scopes are explicit', () => {
  const route = { params: new URLSearchParams('term=x_p'), offset: 0, limit: 200 };
  assert.deepEqual(catalogParameters(route, true), {
    term: 'x_p', scope: 'all', facet: 'definition', source: '', mt: '', offset: 0, limit: 100,
  });
  route.params.set('scope', 'unloaded');
  assert.equal(catalogParameters(route).scope, 'unloaded');
  route.params.set('scope', 'made-up');
  assert.throws(() => catalogParameters(route), /Unknown/u);
});
test('partial coverage cannot be presented as complete', () => {
  assert.match(catalogCoverageText({ expectedFiles: 1117, freshFiles: 237, complete: false }), /237 of 1117.*Incomplete/u);
  assert.match(catalogCoverageText({ expectedFiles: 1117, freshFiles: 1117, complete: true }), /Complete file coverage/u);
});
test('unloaded assertion links use catalog detail instead of a broken live ID link', () => {
  const item = { id: 'a123', source: 'KBs/some file.krf', loaded: false };
  const url = new URL(catalogAssertionHref(item, 'nat:x_Fn(x_a)'), 'http://localhost/');
  assert.match(url.hash, /^#\/catalog-assertion/u);
  const params = new URLSearchParams(url.hash.split('?')[1]);
  assert.equal(params.get('source'), item.source);
  assert.equal(params.get('term'), 'nat:x_Fn(x_a)');
  assert.equal(catalogAssertionHref({ ...item, loaded: true }, 'x_p'), '#/assertion?id=a123');
});
test('source completion is distinct from query publication and unknown counters stay unknown', () => {
  assert.match(catalogJobText('Source catalog', { state: 'succeeded', completed: 978, total: 978 }), /Source catalog: succeeded.*978 of 978/u);
  assert.match(catalogJobText('Query publication', { state: 'running', phase: 'postings', completed: 0, total: 978 }), /Query publication: running.*postings.*0 of 978/u);
  assert.match(catalogJobText('Query publication', { state: 'interrupted', completed: null }), /\? of \?/u);
});
test('catalog MT navigation includes unloaded context assertions with the selected scope', () => {
  const url = new URL(catalogContextHref('mt:(x_Fn x_A)', 'unloaded'), 'http://localhost/');
  assert.match(url.hash, /^#\/definitions/u);
  const params = new URLSearchParams(url.hash.split('?')[1]);
  assert.equal(params.get('term'), 'mt:(x_Fn x_A)');
  assert.equal(params.get('scope'), 'unloaded');
  assert.equal(params.get('facet'), 'context');
});
