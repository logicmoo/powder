import test from 'node:test';
import assert from 'node:assert/strict';
import { spawn } from 'node:child_process';
import { mkdir, readFile, rm, writeFile } from 'node:fs/promises';
import { existsSync } from 'node:fs';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';
import { launchChromium } from './chromium.mjs';

const here = dirname(fileURLToPath(import.meta.url));
const pause = ms => new Promise(resolve => setTimeout(resolve, ms));
const chrome = [process.env.LOGOS_CHROME, process.env.CHROME_PATH,
  'C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe',
  'C:\\Program Files (x86)\\Microsoft\\Edge\\Application\\msedge.exe'].find(path => path && existsSync(path));

test('real rule utility API reaches assertion detail, query totals and proof cards', { timeout: 120000 }, async () => {
  assert(chrome, 'An existing Chrome/Edge installation is required for this browser test.');
  const scratch = join(here, `.rule-utility-browser-${process.pid}-${Date.now()}`);
  await mkdir(scratch);
  const readyPath = join(scratch, 'ready.json');
  const child = spawn(process.env.SWIPL || 'swipl', ['-q', '-s', join(here, 'rule_utility_browser_child.pl'), '--', readyPath],
    { cwd: here, stdio: ['pipe', 'pipe', 'pipe'], windowsHide: true });
  let output = '', browser, ready;
  child.stdout.on('data', data => { output += data; });
  child.stderr.on('data', data => { output += data; });
  try {
    for (let i = 0; i < 300 && !ready; i++) {
      if (child.exitCode !== null) throw new Error(`Fixture server exited: ${output}`);
      try { ready = JSON.parse(await readFile(readyPath, 'utf8')); } catch { await pause(50); }
    }
    assert(ready, `Fixture server did not start: ${output}`);
    const origin = `http://127.0.0.1:${ready.port}`;
    const endpoint = `${origin}${ready.base}api/rule-utility?id=a710&generation=70`;
    const api = async () => {
      const response = await fetch(endpoint);
      assert.equal(response.status, 200);
      return response.json();
    };
    browser = await launchChromium(chrome);
    await browser.send('Emulation.setDeviceMetricsOverride', { width: 1280, height: 900, deviceScaleFactor: 1, mobile: false });
    await browser.send('Page.navigate', { url: `${origin}${ready.base}#/assertion?id=a710` });
    await browser.wait("document.querySelector('.rule-utility-panel')?.getAttribute('aria-busy') === 'false'");
    assert.match(await browser.evaluate("document.querySelector('.rule-utility-panel').textContent"), /unknown, not zero/);
    const before = await api();
    assert.equal(before.items[0].calls, null);
    assert.equal(before.lifetime.completedQueries, 0);
    await browser.evaluate("window.originalStorage=JSON.stringify(localStorage);document.querySelector('.rule-utility-panel input[type=checkbox]').click()");
    await browser.wait("document.querySelector('.rule-classic-stv') !== null && document.querySelector('.rule-utility-panel').getAttribute('aria-busy') === 'false'");
    assert.match(await browser.evaluate("document.querySelector('.rule-classic-stv').textContent"), /Unavailable: no comparable application trials/);
    assert.equal(await browser.evaluate('JSON.stringify(localStorage) === originalStorage'), true);
    assert.equal((await api()).lifetime.completedQueries, 0, 'Read-only inspection must not invent execution.');

    await browser.route('#/query');
    await browser.evaluate("document.querySelector('textarea[name=query]').value='(pick ?X)';document.querySelector('.query-form').requestSubmit()");
    await browser.wait("document.querySelector('.query-results [data-utility-scope=query]') !== null && document.querySelectorAll('.query-results .solution').length === 2");
    assert.match(await browser.evaluate("document.querySelector('.query-results [data-utility-scope=query]').textContent"), /this query/);
    assert.equal(await browser.evaluate("document.querySelectorAll('.shared-proof-steps .assertion-field-ruleUtility [data-utility-scope=query]').length"), 2);
    assert.match(await browser.evaluate("document.querySelector('.shared-proof-steps .assertion-field-ruleUtility').textContent"), /not measurements of this individual proof step/);
    const measured = await api();
    assert.equal(measured.items[0].calls, 1);
    assert.equal(measured.items[0].results, 2);
    assert.equal(measured.items[0].applicationEvidence.positiveApplications, 1);
    assert.equal(measured.items[0].provenance.basis, 'matching_loaded_assertion');

    await browser.route('#/assertion?id=a710');
    await browser.wait("document.querySelector('.rule-utility-panel')?.getAttribute('aria-busy') === 'false'");
    assert.match(await browser.evaluate("document.querySelector('.rule-utility-panel').textContent"), /cumulative/);
    assert.match(await browser.evaluate("document.querySelector('.rule-utility-panel').textContent"), /Source bytes matched the loaded source hash/);
    await browser.evaluate("document.querySelector('.rule-utility-panel input[type=checkbox]').click()");
    await browser.wait("document.querySelector('.rule-classic-stv')?.textContent.includes('Usefulness strength')");
    assert.match(await browser.evaluate("document.querySelector('.rule-classic-stv').textContent"), /800/);

    await browser.evaluate(`window.originalFetch=window.fetch;window.failUtilityOnce=true;
      window.fetch=(input,options)=>{if(failUtilityOnce && String(input).includes('api/rule-utility')){failUtilityOnce=false;return Promise.reject(new Error('Isolated network failure'));}return originalFetch(input,options);};
      document.querySelector('.rule-utility-panel > button').click();`);
    await browser.wait("document.querySelector('.rule-utility-panel [role=status]').textContent.includes('unavailable')");
    await browser.evaluate("window.fetch=originalFetch;document.querySelector('.rule-utility-panel > button').click()");
    await browser.wait("document.querySelector('.rule-utility-panel [role=status]').textContent.includes('Cumulative since')");
    assert.equal((await api()).items[0].calls, 1, 'Retrying a read must not execute the rule.');

    await browser.evaluate(`window.conflictOnce=true;window.fetch=(input,options)=>{
      if(conflictOnce && String(input).includes('api/rule-utility')){conflictOnce=false;return Promise.resolve(new Response(JSON.stringify({error:{code:'generation_conflict',message:'Fixture publication changed the generation.'}}),{status:409,headers:{'content-type':'application/json'}}));}
      return originalFetch(input,options);};document.querySelector('.rule-utility-panel > button').click();`);
    await browser.wait("document.querySelector('.rule-utility-body a')?.textContent.includes('Reload assertion detail')");
    await browser.evaluate("window.fetch=originalFetch;document.querySelector('.rule-utility-body a').click()");
    await browser.wait("document.querySelector('.rule-utility-panel')?.getAttribute('aria-busy') === 'false' && document.querySelector('.rule-utility-panel [role=status]').textContent.includes('Cumulative since')");

    // Component-only pagination fixture; it never creates or stores observations.
    await browser.evaluate(`(async()=>{
      const {createAssertionView}=await import(${JSON.stringify(`${ready.base}assertion-view.js`)});
      const plain=text=>{const node=document.createElement('span');node.textContent=text??'';return node;};
      const view=createAssertionView({sourceLink:plain,mtLink:plain,mappingLink:plain,
        diagnosticsPanel:()=>null,propertyList:()=>document.createElement('dl')});
      const actual=await (await fetch(${JSON.stringify(endpoint)})).json();
      window.pageReads=[];window.pageAbort=new AbortController();
      window.pagingFixture=view.utilityPanel({id:'a710',generation:70,signal:pageAbort.signal,
        loadPage:async params=>{pageReads.push(params);return {...actual,total:11,
          items:params.offset===0?Array.from({length:10},()=>actual.items[0]):actual.items};}});
      pagingFixture.id='paging-fixture';document.body.append(pagingFixture);
    })()`);
    await browser.wait("pagingFixture.getAttribute('aria-busy') === 'false'");
    await browser.evaluate("pagingFixture.querySelector('.pagination button:last-child').click()");
    await browser.wait("pageReads.at(-1).offset === 10 && pagingFixture.getAttribute('aria-busy') === 'false'");
    assert.equal(await browser.evaluate("pagingFixture.querySelector('.pagination button:last-child').disabled"), true);
    await browser.evaluate("pagingFixture.querySelector('.pagination button:first-child').click()");
    await browser.wait("pageReads.at(-1).offset === 0 && pagingFixture.getAttribute('aria-busy') === 'false'");
    assert.equal(await browser.evaluate('pageReads.every(read=>read.generation===70 && read.id==="a710" && read.check_source===true)'), true);
    await browser.evaluate('pageAbort.abort();pagingFixture.remove()');
    await browser.evaluate("document.querySelector('.rule-utility-panel input[type=checkbox]').click()");
    await browser.wait("document.querySelector('.rule-classic-stv')?.textContent.includes('Usefulness strength')");

    const artifacts = process.env.RULE_UTILITY_ARTIFACTS;
    if (artifacts) await mkdir(artifacts, { recursive: true });
    for (const [name, width, height, mobile] of [['desktop', 1280, 900, false], ['mobile', 390, 844, true]]) {
      await browser.send('Emulation.setDeviceMetricsOverride', { width, height, deviceScaleFactor: 1, mobile });
      await browser.evaluate("document.querySelector('.rule-utility-panel').scrollIntoView()");
      await pause(120);
      assert(await browser.evaluate('document.documentElement.scrollWidth <= innerWidth + 2'), `${name} page overflows`);
      if (artifacts) {
        const shot = await browser.send('Page.captureScreenshot', { format: 'png' });
        await writeFile(join(artifacts, `${name}.png`), Buffer.from(shot.data, 'base64'));
      }
    }
    assert.deepEqual(browser.exceptions, []);
  } finally {
    await browser?.close();
    child.stdin.end('stop\n');
    await Promise.race([new Promise(resolve => child.once('exit', resolve)), pause(5000)]);
    if (child.exitCode === null) child.kill();
    if (ready?.directory?.toLowerCase().startsWith(here.toLowerCase())) await rm(ready.directory, { recursive: true, force: true });
    await rm(scratch, { recursive: true, force: true });
  }
});
