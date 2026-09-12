import test from 'node:test';
import assert from 'node:assert/strict';
import { createServer } from 'node:http';
import { readFile, writeFile } from 'node:fs/promises';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';
import { launchChromium } from './chromium.mjs';
import { checkpointAddress } from '../web/checkpoints.js';

const here = dirname(fileURLToPath(import.meta.url));

test('checkpoint links stay on a local canonical application address', () => {
  assert.equal(checkpointAddress(4050, 'http://localhost:3050/swish/openworld_dr/?old=1#old'),
    'http://localhost:4050/swish/openworld_dr/#/settings');
  for (const port of [0, 65536, '4050', NaN]) assert.equal(checkpointAddress(port, 'http://localhost/'), null);
  assert.equal(checkpointAddress(4050, 'http://evil.invalid/'), null);
});

test('real browser keeps create, select, trial, cancel and explicit takeover separate', {
  skip: !process.env.LOGOS_CHROME, timeout: 60000,
}, async () => {
  const requests = [];
  let catalog = { generation: 4, revision: 'initial', selected: 'none',
    instance: { role: 'active' }, items: [], operations: [], runs: [] };
  let operation, sequence = 0, failSelect = false;
  const server = createServer(async (request, response) => {
    try {
      const url = new URL(request.url, 'http://localhost');
      if (url.pathname === '/') {
        response.setHeader('Content-Type', 'text/html');
        response.end(`<!doctype html><html lang="en"><meta name="viewport" content="width=device-width">
          <title>Saved states fixture</title><link rel="stylesheet" href="/style.css">
          <main id="main"></main><script type="module">
          import {renderCheckpointSettings} from '/checkpoints.js';
          window.controller = new AbortController();
          const api = async (path, params = {}, options = {}) => {
            const url = new URL('/api/' + path, location.href);
            Object.entries(params).forEach(([key,value]) => url.searchParams.set(key,value));
            const response = await fetch(url, {...options,headers:{'Content-Type':'application/json'},
              body:options.body === undefined ? undefined : JSON.stringify(options.body)});
            const result = await response.json();
            if (!response.ok) throw new Error(result.error.message);
            return result;
          };
          document.querySelector('main').append(renderCheckpointSettings({api,signal:controller.signal}));
          </script></html>`);
        return;
      }
      if (['/checkpoints.js', '/checkpoints.css', '/style.css'].includes(url.pathname)) {
        response.setHeader('Content-Type', url.pathname.endsWith('.js') ? 'text/javascript' : 'text/css');
        response.end(await readFile(join(here, '..', 'web', url.pathname.slice(1))));
        return;
      }
      let text = '';
      for await (const chunk of request) text += chunk;
      const body = text ? JSON.parse(text) : null;
      const action = url.pathname.split('/').at(-1);
      requests.push({ action, body });
      response.setHeader('Content-Type', 'application/json');
      let reply;
      if (action === 'catalog') reply = catalog;
      else if (action === 'create' || action === 'try') {
        operation = { id: `operation-${++sequence}`, phase: 'running', action, message: 'Validation is running.' };
        catalog.operations = [operation];
        reply = operation;
      } else if (action === 'select') {
        if (failSelect) {
          response.statusCode = 409;
          response.end(JSON.stringify({ error: { message: 'Selection changed elsewhere; refresh before retrying.' } }));
          return;
        }
        catalog.selected = body.id;
        catalog.items.forEach(item => { item.selectedNextStart = item.id === body.id; });
        reply = catalog;
      } else if (action === 'cancel') {
        catalog.runs[0] = { ...catalog.runs[0], phase: 'cancelled', message: 'Owned trial closed.' };
        reply = catalog.runs[0];
      } else if (action === 'promote') {
        catalog.runs[0] = { ...catalog.runs[0], phase: 'promoting', message: 'Verifying original ports…' };
        reply = catalog.runs[0];
      } else if (action === 'status' && url.searchParams.has('run')) {
        catalog.runs[0] = { ...catalog.runs[0], phase: 'promoted', message: 'Replacement verified.' };
        reply = catalog.runs[0];
      } else if (action === 'status') {
        operation = { ...operation, phase: 'completed', message: 'Validated successfully.' };
        if (operation.action === 'create') {
          catalog.items = [{ id: 's-fixture', name: '<img src=x onerror=alert(1)> private fixture',
            counts: { assertions: 12 }, files: [{ path: 'KBs/fixture.krf', count: 12 }],
            generation: 4, sizeBytes: 12345678, createdAt: 1700000000,
            stateHash: 'a'.repeat(64), path: '.logos-state/saved-states/s-fixture/image.state',
            configuration: { settings: { startupConfigured: true, startupFiles: ['KBs/fixture.krf'] },
              sourcePacks: [{ name: 'Saved composition', roots: ['KBs/fixture.krf'] }] },
            checkpoint: { runtime: { debug: { enabled: true, port: 4053 } } },
            available: true, selectedNextStart: false }];
        } else {
          catalog.runs = [{ id: `trial-${sequence}`, checkpoint: 's-fixture', phase: 'trial_ready', revision: 1,
            primary: 4050, temporary: 4052, targets: [{ port: 4050 }, { port: 4051 }],
            message: 'Candidate verified; original instance remains untouched.' }];
        }
        catalog.operations = [operation]; reply = operation;
      } else throw new Error(`Unexpected fixture request ${url}`);
      response.end(JSON.stringify(reply));
    } catch (error) { response.statusCode = 500; response.end(JSON.stringify({ error: { message: error.message } })); }
  });
  await new Promise(resolve => server.listen(0, '127.0.0.1', resolve));
  const browser = await launchChromium(process.env.LOGOS_CHROME);
  const { send, evaluate, wait } = browser;
  const click = label => evaluate(`[...document.querySelectorAll('button')].find(b=>b.textContent===${JSON.stringify(label)}).click()`);
  try {
    await send('Emulation.setDeviceMetricsOverride', { width: 1360, height: 950, deviceScaleFactor: 1, mobile: false });
    await send('Page.navigate', { url: `http://127.0.0.1:${server.address().port}/` });
    await wait(`document.body.textContent.includes('No saved states yet')`);
    await evaluate(`document.querySelector('input[name="checkpoint-name"]').value='Private fixture'; document.querySelector('form').requestSubmit()`);
    await wait(`document.querySelector('.checkpoint-image') !== null`);
    assert.equal(requests.some(item => item.action === 'select' || item.action === 'try' || item.action === 'promote'), false);
    assert.equal(await evaluate(`document.querySelectorAll('.checkpoint-image img').length`), 0);
    assert.equal(await evaluate(`document.body.textContent.includes('Captured startup selection') && document.body.textContent.includes('Saved composition — roots: KBs/fixture.krf')`), true);
    await click('Select for next launch');
    await wait(`document.body.textContent.includes('Selected for next launch')`);
    assert.equal(requests.some(item => item.action === 'try' || item.action === 'promote'), false);
    await click('Try in a new console');
    await wait(`document.querySelector('.checkpoint-consent') !== null`);
    assert.equal(await evaluate(`document.querySelector('.checkpoint-consent input').checked`), false);
    assert.equal(await evaluate(`document.querySelector('.checkpoint-consent').textContent.includes('debug port 4053')`), true);
    assert.equal(await evaluate(`document.querySelector('.checkpoint-trial').textContent.includes('Debug port 4053 is deferred')`), true);
    assert.equal(await evaluate(`[...document.querySelectorAll('button')].find(b=>b.textContent==='Take over original ports').disabled`), true);
    assert.equal(requests.some(item => item.action === 'promote'), false);
    await click('Close trial');
    await wait(`document.body.textContent.includes('Owned trial closed')`);
    assert.equal(await evaluate(`document.querySelectorAll('.checkpoint-trial a').length`), 0);
    await click('Try in a new console');
    await wait(`document.querySelector('.checkpoint-consent') !== null`);
    await evaluate(`document.querySelector('details').open=true`);
    for (const [name, width, height] of [['desktop', 1360, 1100], ['mobile', 390, 844]]) {
      await send('Emulation.setDeviceMetricsOverride', { width, height, deviceScaleFactor: 1, mobile: width < 500 });
      assert.equal(await evaluate('document.documentElement.scrollWidth <= document.documentElement.clientWidth'), true);
      if (process.env.LOGOS_SCREENSHOTS) {
        const image = await send('Page.captureScreenshot');
        await writeFile(join(here, `.checkpoint-ui-${name}.png`), Buffer.from(image.data, 'base64'));
      }
    }
    await evaluate(`document.querySelector('.checkpoint-consent input').click()`);
    await click('Take over original ports');
    await wait(`document.body.textContent.includes('Replacement verified')`);
    assert.deepEqual(requests.find(item => item.action === 'promote').body,
      { run: 'trial-3', revision: 1, confirm: 'take-over-original-ports' });
    failSelect = true;
    await click('Use normal source startup next time');
    await wait(`document.querySelector('[role="alert"]')?.textContent.includes('Selection changed elsewhere')`);
    catalog = { ...catalog, instance: { role: 'candidate' } };
    await click('Refresh');
    await wait(`document.body.textContent.includes('Read-only until explicitly promoted')`);
    assert.equal(await evaluate(`[...document.querySelectorAll('button')].find(b=>b.textContent==='Try in a new console').disabled`), true);
    catalog = { ...catalog, instance: null,
      automation: { executionPaused: true, reason: 'Checkpoint execution is paused in this fixture.' } };
    await click('Refresh');
    await wait(`document.body.textContent.includes('Normal configured source startup is unchanged')`);
    for (const label of ['Create saved state', 'Select for next launch', 'Try in a new console']) {
      assert.equal(await evaluate(`[...document.querySelectorAll('button')].find(b=>b.textContent===${JSON.stringify(label)}).disabled`), true);
    }
    await evaluate('controller.abort()');
  } finally {
    await browser.close();
    await new Promise(resolve => server.close(resolve));
  }
});
