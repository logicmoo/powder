import test from 'node:test';
import assert from 'node:assert/strict';
import { readFile } from 'node:fs/promises';
import { APP_BASE, API_BASE, appPath, apiPath } from '../web/paths.js';

test('shared configuration uses the exact openworld_dr mount for assets and APIs', () => {
  assert.equal(APP_BASE, '/swish/openworld_dr/');
  assert.equal(API_BASE, '/swish/openworld_dr/api/');
  assert.equal(apiPath('kb/statistics'), `${APP_BASE}api/kb/statistics`);
  assert.equal(appPath('paths.json'), `${APP_BASE}paths.json`);
  assert.equal(appPath(), APP_BASE);
});

test('HTML entry assets resolve inside the mount instead of the origin root', async () => {
  const html = await readFile(new URL('../web/index.html', import.meta.url), 'utf8');
  const css = html.match(/<link rel="stylesheet" href="([^"]+)"/u)?.[1];
  const script = html.match(/<script type="module" src="([^"]+)"/u)?.[1];
  assert.equal(new URL(css, `http://localhost:3050${APP_BASE}`).pathname, appPath('style.css'));
  assert.equal(new URL(script, `http://localhost:3050${APP_BASE}`).pathname, appPath('app.js'));
});
