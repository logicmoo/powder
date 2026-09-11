import test from 'node:test';
import assert from 'node:assert/strict';
import { writeFile } from 'node:fs/promises';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';
import { launchChromium } from './chromium.mjs';

const base = process.env.OPENWORLD_TEST_URL;
const executable = process.env.LOGOS_CHROME;
const here = dirname(fileURLToPath(import.meta.url));

test('live SWI backend and frontend agree, with optional explicit scratch-source unload', {
  skip: !base || !executable, timeout: 90000,
}, async t => {
  const timings = {};
  const failures = [];
  const check = async (label, action) => {
    try { await action(); }
    catch (error) { failures.push(`${label}: ${error.message}`); t.diagnostic(`${label}: ${error.message}`); }
  };
  const request = async (path, body, expected = 200) => {
    const started = performance.now();
    const response = await fetch(`${base}${path}`, {
      ...(body === undefined ? {} : { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(body) }),
    });
    timings[path] = Math.round((performance.now() - started) * 10) / 10;
    const json = await response.json();
    assert.equal(response.status, expected, `${path}: ${JSON.stringify(json)}`);
    return json;
  };
  const status = await request('/api/status');
  assert.ok(status.counts.assertions > 0);
  const [search, predicates, mappings] = await Promise.all([
    request('/api/search?q=Human&limit=5'), request('/api/predicates?limit=5'),
    request('/api/mappings?limit=5'),
  ]);
  assert.ok(search.items.length);
  assert.ok(predicates.items.every(item => Number.isInteger(item.arity)));
  assert.ok(mappings.items.length);
  const unscoped = await request('/api/query', { query: '(isa ?X ?Y)', mt: '', limit: 3, timeout: 3 });
  assert.ok(unscoped.solutions.length);
  const assertion = { mt: unscoped.solutions[0].mt, id: unscoped.solutions[0].proof[0].id };
  await check('Term API', async () => assert.ok((await request('/api/term?term=x_isa&limit=3')).items.length));
  await check('MT API', async () => {
    const mt = await request(`/api/microtheory?mt=${encodeURIComponent(assertion.mt)}&limit=3`);
    assert.ok(mt.items.every(item => item.mt === assertion.mt));
  });
  await check('Assertion API', async () => {
    const detail = await request(`/api/assertion?id=${encodeURIComponent(assertion.id)}`);
    assert.equal(detail.id, assertion.id);
    assert.ok(detail.expression.type);
  });
  const guesses = await request('/api/mappings?basis=guess&confidence=medium&limit=5');
  assert.ok(guesses.items.every(item => item.basis === 'guess' && item.confidence === 'medium'));
  const query = await request('/api/query', { query: '(isa ?X ?Y)', mt: assertion.mt, limit: 3, timeout: 3 });
  assert.ok(query.solutions.length > 0);
  assert.ok(query.solutions.every(solution => solution.mt === assertion.mt));
  assert.ok(query.solutions.some(solution => solution.proof.length));
  const badPage = await request('/api/search?offset=-1', undefined, 400);
  assert.ok(badPage.error?.code && badPage.error?.message);
  for (const [path, mime] of [['/', /text\/html/iu], ['/style.css', /text\/css/iu], ['/app.js', /(?:text|application)\/javascript/iu],
    ['/render.js', /(?:text|application)\/javascript/iu], ['/model.js', /(?:text|application)\/javascript/iu],
    ['/diagnostics.js', /(?:text|application)\/javascript/iu]]) {
    const response = await fetch(`${base}${path}`);
    assert.equal(response.status, 200, `${path} serves`);
    assert.match(response.headers.get('content-type') ?? '', mime, `${path} MIME`);
    assert.match(response.headers.get('cache-control') ?? '', /no-store|no-cache/iu, `${path} is not stale-cached`);
  }

  const browser = await launchChromium(executable);
  const { send, evaluate, wait, route } = browser;
  const noOverflow = async () => assert.equal(await evaluate('document.documentElement.scrollWidth <= document.documentElement.clientWidth'), true, 'No horizontal page overflow');
  try {
    await send('Emulation.setDeviceMetricsOverride', { width: 1360, height: 950, deviceScaleFactor: 1, mobile: false });
    await send('Page.navigate', { url: base });
    await wait('document.querySelector("h1")?.textContent === "Knowledge overview" && document.querySelector("main").getAttribute("aria-busy") === "false"');
    assert.equal(await evaluate('document.title'), 'Knowledge overview · powder');
    await noOverflow();
    if (process.env.LOGOS_SCREENSHOTS) {
      const image = await send('Page.captureScreenshot');
      await writeFile(join(here, '.browser-live-desktop.png'), Buffer.from(image.data, 'base64'));
    }
    await route('#/search?q=Human');
    assert.ok(await evaluate('document.querySelectorAll("tbody a").length > 0'));
    await route('#/predicates');
    assert.ok(await evaluate('document.querySelectorAll("tbody tr").length > 0'));
    await check('Term browser view', async () => {
      await route('#/term?term=x_isa&limit=5');
      assert.ok(await evaluate('document.querySelectorAll(".expression a").length > 0'));
      assert.ok(!(await evaluate('document.querySelector("main").textContent')).includes('x_cid'));
    });
    await check('MT browser view', async () => {
      await route(`#/microtheory?mt=${encodeURIComponent(assertion.mt)}&limit=5`);
      assert.equal(await evaluate('document.querySelectorAll(".mt-block").length'), 1);
    });
    await check('Assertion browser view', async () => {
      await route(`#/assertion?id=${encodeURIComponent(assertion.id)}`);
      assert.ok(await evaluate('document.querySelector(".provenance-section").textContent.includes("Original variable names")'));
    });
    await route('#/mappings?basis=guess&confidence=medium');
    assert.ok(await evaluate('document.querySelectorAll(".badge.guess").length > 0'));
    await route(`#/mappings?row=${encodeURIComponent(mappings.items[0].id)}`);
    assert.equal(await evaluate('document.querySelectorAll(".selected-mapping").length'), 1);
    await route(`#/query?mt=${encodeURIComponent(assertion.mt)}`);
    await evaluate('document.querySelector("textarea").value = "(isa ?X ?Y)"; document.querySelector(\'input[name="limit"]\').value = "3"; document.querySelector(".query-form").requestSubmit()');
    await wait('document.querySelectorAll(".solution").length > 0 || document.querySelector(".query-results .error-panel")');
    assert.equal(await evaluate('document.querySelector(".query-results .error-panel")?.textContent ?? ""'), '');
    assert.ok(await evaluate('document.querySelectorAll(".proof .expression").length > 0'));
    await evaluate('document.querySelector("textarea").value = "("; document.querySelector(".query-form").requestSubmit()');
    await wait('document.querySelector(".query-results .error-panel") !== null');
    assert.ok(await evaluate('document.querySelector(".query-results .error-code").textContent.length > 0'));
    await route('#/sources');
    const catalog = await request('/api/kb/catalog');
    assert.ok(catalog.nodes.length);
    const before = await evaluate('Array.from(document.querySelectorAll(".source-tree input")).filter(input => input.checked).length');
    await evaluate('document.querySelector(".source-tree input:not(:disabled)").click()');
    assert.ok(await evaluate('document.querySelector(".draft-count").textContent.includes("unsaved selection")'));
    await route('#/overview');
    await route('#/sources');
    assert.ok(await evaluate('document.querySelector(".draft-count").textContent.includes("unsaved selection")'));
    await evaluate('document.querySelector(".source-actions .secondary").click()');
    assert.equal(await evaluate('Array.from(document.querySelectorAll(".source-tree input")).filter(input => input.checked).length'), before);
    const catalogFiles = nodes => nodes.flatMap(node => node.type === 'file' ? [node] : catalogFiles(node.children ?? []));
    const originalTiny = catalogFiles(catalog.nodes).find(node => node.name.toLowerCase() === 'tinykb.kif');
    assert.ok(originalTiny);
    await route(`#/source?path=${encodeURIComponent(originalTiny.path)}&line=90`);
    assert.ok(await evaluate('document.querySelector(".highlighted-line code").textContent.includes("(instance")'));
    await send('Emulation.setDeviceMetricsOverride', { width: 390, height: 844, deviceScaleFactor: 1, mobile: true });
    await noOverflow();
    await route(`#/query?mt=${encodeURIComponent(assertion.mt)}`);
    await evaluate('document.querySelector("textarea").value = "(isa ?X ?Y)"; document.querySelector(\'input[name="limit"]\').value = "3"; document.querySelector(".query-form").requestSubmit()');
    await wait('document.querySelectorAll(".solution").length > 0');
    await noOverflow();
    if (process.env.LOGOS_SCREENSHOTS) {
      const image = await send('Page.captureScreenshot');
      await writeFile(join(here, '.browser-live-mobile.png'), Buffer.from(image.data, 'base64'));
    }
    await route('#/mappings?basis=guess&limit=3');
    await noOverflow();
    const unchanged = await request('/api/status');
    assert.equal(unchanged.generation, status.generation, 'Live verification never loads/unloads a source');
    assert.deepEqual(unchanged.files, status.files);
    assert.deepEqual(browser.exceptions, []);
    if (process.env.OPENWORLD_TEST_UNLOAD_LAST === '1' && !failures.length) {
      assert.equal(status.files.length, 1, 'Explicit unload validation requires one scratch source');
      assert.match(status.files[0].path.replaceAll('\\', '/'), /\/corpus-smoke\/tinyKB\.kif$/iu,
        'Refuse to unload an unrelated active manifest');
      await route('#/sources');
      await evaluate('const control = document.querySelector(".loaded-files .unload-button"); control.click(); control.click()');
      await wait('document.querySelector(".loaded-section .empty-state h2")?.textContent === "No sources loaded" || document.querySelector("#notice.error-notice:not([hidden])")');
      assert.equal(await evaluate('document.querySelector("#notice.error-notice:not([hidden])")?.textContent ?? ""'), '');
      assert.equal(await evaluate('document.querySelectorAll(".loaded-files .unload-button").length'), 0);
      const unloaded = await request('/api/status');
      assert.equal(unloaded.generation, status.generation + 1);
      assert.deepEqual(unloaded.files, []);
      assert.equal(unloaded.counts.assertions, 0);
      assert.equal((await request('/api/search?limit=3')).total, 0);
      assert.equal((await request('/api/predicates?limit=3')).total, 0);
      await route('#/overview');
      assert.ok(await evaluate('document.querySelector(".empty-state").textContent.includes("Choose KB Sources")'));
      const stillEmpty = await request('/api/status');
      assert.deepEqual(stillEmpty.files, [], 'Navigating overview must not reload the default KB');
      t.diagnostic('Explicit scratch-source unload succeeded; live server is intentionally left empty.');
    }
    t.diagnostic(`Actual API timings (ms): ${JSON.stringify(timings)}`);
    assert.deepEqual(failures, [], 'All live endpoints and views must satisfy their contracts');
  } finally {
    await browser.close();
  }
});
