import assert from 'node:assert/strict';
import { writeFile } from 'node:fs/promises';
import { join } from 'node:path';
import { launchChromium } from './chromium.mjs';

const [address, expectedPID, screenshotDirectory] = process.argv.slice(2);
const url = new URL(address);
assert.ok(['127.0.0.1', 'localhost'].includes(url.hostname));
assert.ok(!['3050', '3051'].includes(url.port));
const information = await fetch(new URL('/_checkpoint_fixture/info', url)).then(reply => reply.json());
assert.equal(information.pid, Number(expectedPID));
assert.match(information.fixture, /[\\/]\.checkpoint-native-[^\\/]+[\\/]case$/);
const browser = await launchChromium(process.env.LOGOS_CHROME);
try {
  await browser.send('Emulation.setDeviceMetricsOverride',
    { width: 1360, height: 1100, deviceScaleFactor: 1, mobile: false });
  url.hash = '#/settings';
  await browser.send('Page.navigate', { url: url.href });
  await browser.wait(`document.querySelector('.checkpoint-settings input[name="checkpoint-name"]') !== null`);
  await browser.wait(`document.body.textContent.includes('No saved states yet')`);
  assert.equal(await browser.evaluate(`document.querySelectorAll('.checkpoint-settings').length`), 1);
  assert.equal(await browser.evaluate(`document.querySelector('#navigation [data-route="settings"]').getAttribute('aria-current')`), 'page');
  let idleSamples = 0;
  const idleDeadline = Date.now() + 10000;
  while (idleSamples < 3) {
    const current = await fetch(new URL('/_checkpoint_fixture/info', url)).then(reply => reply.json());
    idleSamples = current.activity.active === 0 && !current.activity.exclusive ? idleSamples + 1 : 0;
    assert.ok(Date.now() < idleDeadline, `Fixture did not become idle: ${JSON.stringify(current.activity)}`);
    await new Promise(resolve => setTimeout(resolve, 100));
  }
  const previousOperations = await browser.evaluate(`[...document.querySelectorAll('[data-operation-id]')].map(row=>row.dataset.operationId)`);
  await browser.evaluate(`document.querySelector('.checkpoint-settings input[name="checkpoint-name"]').value='Native fixture';document.querySelector('.checkpoint-create').requestSubmit()`);
  const deadline = Date.now() + 180000;
  while (!await browser.evaluate(`document.querySelector('.checkpoint-image') !== null`)) {
    const failed = await browser.evaluate(`[...document.querySelectorAll('[data-operation-id]')].some(row=>!${JSON.stringify(previousOperations)}.includes(row.dataset.operationId)&&row.textContent.includes('create: failed'))`);
    assert.equal(failed, false, await browser.evaluate(`document.querySelector('.checkpoint-settings').textContent`));
    assert.ok(Date.now() < deadline, 'Real saved-state validation timed out');
    await new Promise(resolve => setTimeout(resolve, 200));
  }
  assert.equal(await browser.evaluate(`document.body.textContent.includes('Native fixture')`), true);
  assert.equal(await browser.evaluate(`document.querySelectorAll('.checkpoint-trial').length`), 0);
  assert.equal(await browser.evaluate(`document.querySelectorAll('.checkpoint-image').length`), 1);
  for (const [name, width, height] of [['desktop', 1360, 1100], ['mobile', 390, 844]]) {
    await browser.send('Emulation.setDeviceMetricsOverride',
      { width, height, deviceScaleFactor: 1, mobile: width < 500 });
    assert.equal(await browser.evaluate('document.documentElement.scrollWidth <= document.documentElement.clientWidth'), true);
    if (screenshotDirectory) {
      const image = await browser.send('Page.captureScreenshot');
      await writeFile(join(screenshotDirectory, `checkpoint-application-${name}.png`), Buffer.from(image.data, 'base64'));
    }
  }
  await browser.evaluate(`location.hash='#/ui-settings'`);
  await browser.wait(`document.querySelector('.checkpoint-settings') === null && document.querySelector('[aria-busy="true"]') === null`);
  assert.equal(await browser.evaluate(`document.querySelectorAll('.checkpoint-settings').length`), 0);
  console.log('Real application Settings created and validated one saved state; desktop/mobile navigation passed.');
} finally {
  await browser.close();
}
