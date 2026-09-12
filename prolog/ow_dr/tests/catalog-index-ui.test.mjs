import test from 'node:test';
import assert from 'node:assert/strict';
import { CATALOG_GROUPS, catalogParameters, catalogCoverageText, catalogAssertionHref, catalogJobText, catalogContextHref } from '../web/catalog-index.js';
import { launchChromium } from './chromium.mjs';
import { APP_BASE } from '../web/paths.js';

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
test('legacy remainder filters do not label unknown types as ontological individuals', () => {
  const route = { params: new URLSearchParams('group=individuals'), offset: 0, limit: 25 };
  assert.equal(catalogParameters(route).group, 'typed_other');
});
test('lexical word filtering is explicitly a naming convention', () => {
  const choice = CATALOG_GROUPS.find(([key]) => key === 'lexical_words');
  assert.match(choice[1], /name convention/u);
  const route = { params: new URLSearchParams('group=lexical_words'), offset: 0, limit: 25 };
  assert.equal(catalogParameters(route).group, 'lexical_words');
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

test('published all-file catalog serves real unloaded evidence without changing the live generation', {
  skip: !process.env.OPENWORLD_CATALOG_TEST_URL, timeout: 360000,
}, async t => {
  const base = new URL(APP_BASE, process.env.OPENWORLD_CATALOG_TEST_URL);
  const basicOnly = process.env.OPENWORLD_CATALOG_BASIC_ONLY === '1';
  const timings = {};
  t.after(() => t.diagnostic(JSON.stringify({ basicOnly, timings })));
  const read = async (path, label = path) => {
    const started = performance.now();
    const response = await fetch(new URL(`api/${path}`, base), { signal: t.signal });
    const data = await response.json();
    timings[label] = Math.round((performance.now() - started) * 10) / 10;
    assert.equal(response.status, 200, JSON.stringify(data));
    return data;
  };
  const before = await read('status');
  const status = await read('catalog/status', 'catalogStatusColdMs');
  assert.equal(status.complete, true);
  assert.equal(status.projection.available, true);
  if (process.env.OPENWORLD_CATALOG_EXPECTED_FILES) {
    assert.equal(status.freshFiles, Number(process.env.OPENWORLD_CATALOG_EXPECTED_FILES));
    assert.equal(status.expectedFiles, Number(process.env.OPENWORLD_CATALOG_EXPECTED_FILES));
  }
  await read('catalog/status', 'catalogStatusWarmMs');
  const term = process.env.OPENWORLD_CATALOG_TEST_TERM ?? 'x_resultIsa';
  const searchPath = `catalog/search?q=${encodeURIComponent(term)}&limit=100`;
  let found;
  if (!basicOnly) {
    const search = await read(searchPath, 'searchColdMs');
    await read(searchPath, 'searchWarmMs');
    found = search.items.find(item => item.term === term);
    assert.ok(found, `Indexed ${term}`);
    assert.ok(found.typeEntries.length, 'Recorded types are inspectable');
  }
  const path = `catalog/term?term=${encodeURIComponent(term)}&limit=2`;
  const all = await read(`${path}&scope=all`, 'definitionsAllMs');
  await read(`${path}&scope=all`, 'definitionsWarmMs');
  const loaded = await read(`${path}&scope=loaded`, 'definitionsLoadedMs');
  const unloaded = await read(`${path}&scope=unloaded`, 'definitionsUnloadedMs');
  if (found) assert.equal(all.total, found.definitions);
  assert.equal(all.total, loaded.total + unloaded.total);
  assert.equal(all.occurrences, loaded.occurrences + unloaded.occurrences);
  assert.ok(unloaded.total > 2, 'Unloaded definition evidence spans pages');
  const next = await read(`${path}&scope=unloaded&offset=2`, 'definitionsNextPageMs');
  assert.equal(next.total, unloaded.total);
  assert.ok(next.items.every(item => !unloaded.items.some(first => first.id === item.id)));
  const item = unloaded.items[0];
  assert.equal(item.loaded, false);
  assert.ok(item.positions.length && item.properties.length);
  const detail = await read(`catalog/assertion?${new URLSearchParams({ term, source: item.source, id: item.id })}`, 'unloadedAssertionMs');
  assert.deepEqual(detail.expression, item.expression);
  assert.equal(detail.loaded, false);
  const mt = await read(`catalog/term?${new URLSearchParams({ term: item.mt, facet: 'context', scope: 'unloaded', limit: '2' })}`, 'unloadedMTMs');
  assert.ok(mt.items.length && mt.items.every(entry => entry.mt === item.mt && !entry.loaded));
  if (process.env.LOGOS_CHROME) {
    const browser = await launchChromium(process.env.LOGOS_CHROME);
    const waitForPage = async title => {
      const deadline = performance.now() + 90000;
      while (performance.now() < deadline) {
        t.signal.throwIfAborted();
        if (await browser.evaluate(`document.querySelector("h1")?.textContent === ${JSON.stringify(title)} && document.querySelector("main").getAttribute("aria-busy") === "false"`)) return;
        if (browser.exceptions.length) throw new Error(JSON.stringify(browser.exceptions));
        await new Promise(resolve => setTimeout(resolve, 250));
      }
      throw new Error(`Catalog page did not settle: ${await browser.evaluate('document.querySelector("main").innerText')}`);
    };
    try {
      const browserStarted = performance.now();
      await browser.send('Emulation.setDeviceMetricsOverride', { width: 1360, height: 950, deviceScaleFactor: 1, mobile: false });
      const initial = basicOnly ? `#/definitions?${new URLSearchParams({ term, scope: 'unloaded', limit: '2' })}`
        : `#/catalog?q=${encodeURIComponent(term)}`;
      await browser.send('Page.navigate', { url: new URL(initial, base).href });
      const title = basicOnly ? 'Definitional Info' : 'All-file term index';
      await waitForPage(title);
      timings.browserStartupMs = Math.round(performance.now() - browserStarted);
      if (!basicOnly) assert.ok(await browser.evaluate('document.querySelector(".data-table tbody a") !== null'));
      await browser.evaluate(`location.hash = ${JSON.stringify(`#/definitions?${new URLSearchParams({ term, scope: 'unloaded', limit: '2' })}`)}`);
      await waitForPage('Definitional Info');
      assert.ok(await browser.evaluate('document.querySelectorAll(".assertion-view").length === 2'));
      assert.ok(await browser.evaluate('document.querySelector(".catalog-positions summary")?.textContent.includes("Matching structural positions")'));
      assert.ok(await browser.evaluate('document.querySelector(".assertion-group-heading").textContent.includes("All indexed MT assertions")'));
      assert.match(await browser.evaluate('document.querySelector(".assertion-ball").getAttribute("href")'), /^#\/catalog-assertion/u);
      await browser.evaluate(`location.hash = ${JSON.stringify(catalogAssertionHref(item, term))}`);
      await waitForPage('Catalog assertion');
      assert.ok(await browser.evaluate('document.querySelector(".assertion-view .expression a") !== null'));
      assert.equal(await browser.evaluate('document.querySelector("main").textContent.includes("x_cid")'), false);
      for (const [width, height, mobile] of [[1360, 950, false], [390, 844, true]]) {
        await browser.send('Emulation.setDeviceMetricsOverride', { width, height, deviceScaleFactor: 1, mobile });
        assert.equal(await browser.evaluate('document.documentElement.scrollWidth <= document.documentElement.clientWidth'), true);
      }
      assert.deepEqual(browser.exceptions, []);
    } finally {
      await browser.close();
    }
  }
  const after = await read('status');
  assert.equal(after.generation, before.generation);
  assert.deepEqual(after.files, before.files);
  assert.deepEqual(after.counts, before.counts);
  t.diagnostic(JSON.stringify({ basicOnly, term, coverage: status.freshFiles, definitions: all.total, unloaded: unloaded.total, timings }));
});
