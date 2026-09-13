import test from 'node:test';
import assert from 'node:assert/strict';
import { createServer } from 'node:http';
import { readFile } from 'node:fs/promises';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';
import { launchChromium } from './chromium.mjs';
import { APP_BASE } from '../web/paths.js';

const web = join(dirname(dirname(fileURLToPath(import.meta.url))), 'web');
const target = 'KBs/target.krf', kept = 'KBs/kept.krf', editor = 'KBs/editor.krf';
const symbol = value => ({ type: 'symbol', value });
const badge = '#content .assertion-view .source-file-display [data-kind="loaded"]';

test('shared file badges load only on activation, track tasks and retain routes, focus and dirty buffers', { timeout: 60000 }, async () => {
  let generation = 1, active = [kept], job, nextError, fileReads = 0;
  const startup = { known: true, paths: [kept], evidence: 'configured_startup' };
  const writes = [];
  const record = path => ({ path, type: 'file', name: path.split('/').at(-1), lineCount: 2, sizeBytes: 25,
    states: { loaded: active.includes(path), cached: false, indexed: true },
    diagnostics: { warnings: 0, errors: 0 } });
  const status = () => ({ generation, startup, files: active.map(record), counts: { assertions: active.length, terms: 2, predicates: 1, microtheories: 1 } });
  const item = () => ({ id: 'a123', source: target, line: 1, mt: 'x_TestMt', loaded: active.includes(target),
    expression: { type: 'application', head: symbol('x_p'), args: [symbol('x_target')] },
    names: [], properties: [], mappingRows: [] });
  const coverage = { complete: true, freshFiles: 3, expectedFiles: 3 };
  const server = createServer(async (request, response) => {
    try {
      const url = new URL(request.url, 'http://fixture');
      const path = url.pathname.slice(APP_BASE.length);
      let body;
      if (request.method === 'POST') {
        const chunks = [];
        for await (const chunk of request) chunks.push(chunk);
        body = JSON.parse(Buffer.concat(chunks));
        writes.push({ path, body });
      }
      const json = (value, code = 200) => { response.writeHead(code, { 'Content-Type': 'application/json' }); response.end(JSON.stringify(value)); };
      switch (path) {
        case 'api/status': return json(status());
        case 'api/version': return json({ version: 'fixture-fixed' });
        case 'api/kb/catalog': return json({ nodes: [target, kept, editor].map(record), active, generation, startup });
        case 'api/kb/file-info':
          fileReads++;
          return json({ generation, startup, items: JSON.parse(url.searchParams.get('paths')).map(record) });
        case 'api/catalog/status': return json({ projection: { available: true }, lookupDirectory: { available: true }, coverage });
        case 'api/catalog/term': {
          const visible = url.searchParams.get('scope') !== 'unloaded' || !active.includes(target);
          return json({ term: 'x_target', expression: symbol('x_target'), files: visible ? [{ source: target, sentences: 1, loaded: active.includes(target) }] : [],
            items: visible ? [item()] : [], total: visible ? 1 : 0, occurrences: visible ? 1 : 0, offset: 0, limit: 25, coverage });
        }
        case 'api/catalog/files': return json({ term: 'x_target', items: [], total: 0, counts: { all: 1, loaded: active.includes(target) ? 1 : 0, unloaded: active.includes(target) ? 0 : 1 },
          generation, revision: 'fixture', coverage });
        case 'api/kb/dependencies': return json({ path: target, section: 'summary', status: 'unavailable', total: 0, items: [] });
        case 'api/kb/statistics/detail': return json({ path: target, state: 'unavailable', items: [], total: 0 });
        case 'api/tva/status': return json({ revision: 'fixture' });
        case 'api/tva/summary': return json({ items: [], revision: 'fixture', generation });
        case 'api/kb/file-load':
          if (nextError) { const error = nextError; nextError = null; return json({ error }, 409); }
          assert.deepEqual(Object.keys(body).sort(), ['generation', 'path']);
          assert.equal(body.generation, generation);
          job = { id: `job-${writes.length}`, state: 'queued' };
          return json({ accepted: true, jobId: job.id, state: job.state });
        case 'api/tasks/result': return json({ ...job });
        case 'api/source/editor': return json({ path: editor, text: '(p original)\n', revision: 'a'.repeat(64), encoding: 'iso_latin_1',
          newline: 'lf', bom: false, sizeBytes: 13, editable: true });
        default:
          if (path.startsWith('api/')) return json({ error: { message: `Unexpected fixture endpoint: ${path}` } }, 404);
          if (path && !/^[\w.-]+\.(?:js|css|json)$/u.test(path)) { response.writeHead(404); response.end(); return; }
          response.setHeader('Content-Type', !path ? 'text/html' : path.endsWith('.js') ? 'text/javascript' : path.endsWith('.json') ? 'application/json' : 'text/css');
          response.end(await readFile(join(web, path || 'index.html')));
      }
    } catch (error) { response.writeHead(500); response.end(String(error)); }
  });
  await new Promise(resolve => server.listen(0, '127.0.0.1', resolve));
  const browser = await launchChromium(process.env.LOGOS_CHROME || 'C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe');
  const evalJS = expression => browser.evaluate(expression);
  const poll = () => evalJS('document.dispatchEvent(new Event("visibilitychange"))');
  const label = part => evalJS(`getComputedStyle(document.querySelector(${JSON.stringify(`${badge} .source-load-${part}`)})).visibility`);
  const key = async (name, code) => {
    await browser.send('Input.dispatchKeyEvent', { type: 'keyDown', key: name, code, windowsVirtualKeyCode: name === 'Enter' ? 13 : 32,
      text: name === 'Enter' ? '\r' : ' ' });
    await browser.send('Input.dispatchKeyEvent', { type: 'keyUp', key: name, code, windowsVirtualKeyCode: name === 'Enter' ? 13 : 32 });
  };
  const route = '#/definitions?term=x_target&scope=unloaded&source=KBs%2Ftarget.krf';
  try {
    await browser.send('Page.navigate', { url: `http://127.0.0.1:${server.address().port}${APP_BASE}${route}` });
    await browser.wait(`document.querySelector(${JSON.stringify(badge)})?.textContent.includes('Not loaded') && document.querySelector('main').getAttribute('aria-busy') === 'false'`);
    await browser.wait('document.querySelector("#content .source-file-display [data-kind=cached]").textContent === "Not cached"');
    assert.equal(await label('rest'), 'visible');
    assert.equal(await label('action'), 'hidden');
    assert.equal(await evalJS(`document.querySelector(${JSON.stringify(badge)}).getAttribute('aria-label')`), `Load whole file ${target} now`);
    const rect = await evalJS(`(()=>{const n=document.querySelector(${JSON.stringify(badge)});n.scrollIntoView({block:'center'});const r=n.getBoundingClientRect();return {x:r.x+r.width/2,y:r.y+r.height/2,width:r.width};})()`);
    await browser.send('Input.dispatchMouseEvent', { type: 'mouseMoved', x: rect.x, y: rect.y });
    assert.equal(await label('action'), 'visible');
    assert.equal(await label('rest'), 'hidden');
    assert.equal(await evalJS(`document.querySelector(${JSON.stringify(badge)}).getBoundingClientRect().width`), rect.width);
    assert.deepEqual(writes, []);
    await browser.send('Input.dispatchMouseEvent', { type: 'mouseMoved', x: 0, y: 0 });
    await browser.send('Input.dispatchKeyEvent', { type: 'keyDown', key: 'Tab', windowsVirtualKeyCode: 9 });
    await browser.send('Input.dispatchKeyEvent', { type: 'keyUp', key: 'Tab', windowsVirtualKeyCode: 9 });
    await evalJS(`document.querySelector(${JSON.stringify(badge)}).focus()`);
    assert.equal(await label('action'), 'visible');
    assert.deepEqual(writes, []);

    // Force a metadata refresh while focus is on the second (loaded) badge.
    await evalJS(`document.querySelector(${JSON.stringify(badge)}).closest('.source-file-display').querySelector('.source-properties-button').click(); document.querySelector(${JSON.stringify(badge)}).focus()`);
    await browser.wait('document.querySelector("#content .file-dependencies") !== null');
    assert.equal(await evalJS('document.activeElement.dataset.kind'), 'loaded');
    assert.deepEqual(writes, []);
    await key('Enter', 'Enter');
    await browser.wait(`document.querySelector(${JSON.stringify(badge)}).getAttribute('aria-disabled') === 'true'`);
    await evalJS(`document.querySelector(${JSON.stringify(badge)}).click();document.querySelector(${JSON.stringify(badge)}).click()`);
    await browser.wait('document.querySelector("#notice").textContent.includes("Whole-file loading queued")');
    assert.equal(writes.length, 1);
    assert.deepEqual(writes[0], { path: 'api/kb/file-load', body: { path: target, generation: 1 } });
    assert.equal(await evalJS('document.activeElement.dataset.kind'), 'loaded');
    assert.deepEqual(active, [kept]); assert.deepEqual(startup.paths, [kept]);
    job.state = 'running'; await poll();
    await browser.wait(`document.querySelector(${JSON.stringify(badge)}).textContent.includes('Loading')`);
    job.state = 'failed'; job.error = { message: 'Fixture compilation failed' }; await poll();
    await browser.wait('document.querySelector("#content .file-metadata-error")?.textContent.includes("Fixture compilation failed")');
    assert.equal(await evalJS(`document.querySelector(${JSON.stringify(badge)}).getAttribute('aria-disabled')`), 'false');
    nextError = { code: 'generation_conflict', message: 'Fixture concurrent generation change' };
    const clickPoint = await evalJS(`(()=>{const n=document.querySelector(${JSON.stringify(badge)});n.scrollIntoView({block:'center'});const r=n.getBoundingClientRect();return {x:r.x+r.width/2,y:r.y+r.height/2};})()`);
    await browser.send('Input.dispatchMouseEvent', { type: 'mousePressed', ...clickPoint, button: 'left', clickCount: 1 });
    await browser.send('Input.dispatchMouseEvent', { type: 'mouseReleased', ...clickPoint, button: 'left', clickCount: 1 });
    await browser.wait('document.querySelector("#content .file-metadata-error")?.textContent.includes("concurrent generation")');
    assert.deepEqual(active, [kept]);

    generation = 2; active.push('KBs/concurrent.krf');
    await evalJS(`document.querySelector(${JSON.stringify(badge)}).focus()`);
    await key(' ', 'Space');
    await browser.wait('document.querySelector("#notice").textContent.includes("Whole-file loading queued")');
    assert.equal(writes.length, 3);
    assert.equal(writes[2].body.generation, 2);
    active.push(target); generation++; job.state = 'succeeded'; delete job.error; await poll();
    await browser.wait(`document.querySelector(${JSON.stringify(badge)}).textContent === 'Loaded now'`);
    assert.equal(await evalJS('document.activeElement.dataset.kind'), 'loaded');
    assert.equal(await evalJS('location.hash'), route);
    assert.match(await evalJS('document.querySelector("#notice").textContent'), /loaded successfully.*Unloaded filter excludes loaded files/u);
    assert.match(await evalJS('document.querySelector("#notice a").href'), /scope=loaded/u);
    assert.deepEqual(active, [kept, 'KBs/concurrent.krf', target]);

    // A pending whole-file load must not recreate an open, dirty source editor.
    await browser.route(`#/source?path=${encodeURIComponent(editor)}`);
    await browser.wait('document.querySelector(".cm-content[contenteditable=true]") !== null');
    await evalJS('window.originalEditor = document.querySelector(".cm-content"); originalEditor.focus()');
    await browser.send('Input.insertText', { text: '; unsaved fixture\n' });
    await evalJS('window.dirtyText = originalEditor.textContent');
    const editorBadge = `#content [data-source-file="${editor}"] [data-kind="loaded"]`;
    await evalJS(`document.querySelector(${JSON.stringify(editorBadge)}).click()`);
    await browser.wait('document.querySelector("#notice").textContent.includes("Whole-file loading queued")');
    job.state = 'cancelled'; job.error = { message: 'Fixture cancellation' }; await poll();
    await browser.wait('document.querySelector("#content .file-metadata-error")?.textContent.includes("Fixture cancellation")');
    assert.equal(await evalJS(`document.querySelector(${JSON.stringify(editorBadge)}).getAttribute('aria-disabled')`), 'false');
    await evalJS(`document.querySelector(${JSON.stringify(editorBadge)}).click()`);
    await browser.wait('document.querySelector("#notice").textContent.includes("Whole-file loading queued")');
    active.push(editor); generation++; job.state = 'succeeded'; await poll();
    await browser.wait(`document.querySelector(${JSON.stringify(editorBadge)}).textContent === 'Loaded now'`);
    assert.equal(await evalJS('document.querySelector(".cm-content") === originalEditor && originalEditor.textContent === dirtyText'), true);
    assert.deepEqual(startup.paths, [kept]);
    assert.ok(fileReads > 0);
    assert.ok(writes.every(write => write.path === 'api/kb/file-load'));
    assert.deepEqual(browser.exceptions, []);
  } finally {
    await browser.close();
    await new Promise(resolve => server.close(resolve));
  }
});
