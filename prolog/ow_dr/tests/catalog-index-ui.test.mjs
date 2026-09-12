import test from 'node:test';
import assert from 'node:assert/strict';
import { catalogParameters, catalogCoverageText, catalogAssertionHref } from '../web/catalog-index.js';

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
