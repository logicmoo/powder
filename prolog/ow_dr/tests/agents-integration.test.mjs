import test from 'node:test';
import assert from 'node:assert/strict';
import { spawn } from 'node:child_process';
import { get } from 'node:http';
import { mkdtemp, rm } from 'node:fs/promises';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';
import { launchChromium } from './chromium.mjs';
import { APP_BASE } from '../web/paths.js';

const here = dirname(fileURLToPath(import.meta.url));
const httpGet = (url, headers = {}) => new Promise((resolve, reject) => {
  const request = get(url, { headers, agent: false }, response => {
    let text = '';
    response.setEncoding('utf8');
    response.on('data', chunk => { text += chunk; });
    response.on('error', reject);
    response.on('end', () => resolve({ status: response.statusCode, headers: response.headers, text }));
  });
  request.setTimeout(15000, () => request.destroy(Error(`HTTP timeout: ${url.pathname}`)));
  request.on('error', reject);
});
test('real app serves four-role workspace without loading KBs or contacting a model', {
  skip: !process.env.LOGOS_CHROME, timeout: 120000,
}, async () => {
  const directory = await mkdtemp(join(here, '.agents-http-'));
  const child = spawn('swipl', ['-q', '-s', join(here, 'agents_http_fixture.pl')], {
    stdio: ['pipe', 'pipe', 'pipe'], windowsHide: true,
    env: { ...process.env, POWDER_AGENT_STATE: directory, POWDER_KEE_STATE_DIR: join(directory, 'kee'),
      POWDER_NATIVE_TVA_FILE: join(directory, 'native.pl'), POWDER_LLM_BASE_URL: 'http://127.0.0.1:1/v1' },
  });
  let output = '', errors = '', browser;
  child.stdout.on('data', data => { output += data; });
  child.stderr.on('data', data => { errors += data; });
  try {
    const port = await new Promise((resolve, reject) => {
      const timeout = setTimeout(() => { clearInterval(poll); reject(Error(`Fixture failed to start: ${errors}`)); }, 30000);
      const poll = setInterval(() => {
        const found = /AGENTS_TEST_PORT=(\d+)/u.exec(output);
        if (found) { clearTimeout(timeout); clearInterval(poll); resolve(Number(found[1])); }
      }, 25);
      child.once('error', reject);
    });
    const origin = `http://127.0.0.1:${port}`;
    const base = new URL(APP_BASE, origin).href;
    const request = async (path, status = 200, headers = { Origin: origin }) => {
      const response = await httpGet(new URL(`api/${path}`, base), headers);
      const body = JSON.parse(response.text);
      assert.equal(response.status, status, JSON.stringify(body));
      return body;
    };
    const before = await request('status');
    assert.equal(before.counts.assertions, 0);
    const descriptor = await request('agents');
    assert.equal(descriptor.agents.length, 4);
    assert.equal(descriptor.operatorBridge.autoStart, false);
    await request('agents', 403, { Origin: 'http://untrusted.example' });
    await request('llm/settings', 403, { Origin: 'http://untrusted.example' });
    const settings = await request('llm/settings');
    assert.equal(settings.model, 'gpt-5.6-sol');
    for (const file of ['agents.js', 'agents.css', 'llm-knowledge-agent.js']) {
      const response = await httpGet(new URL(file, base));
      assert.equal(response.status, 200, file);
      assert.match(response.headers['content-type'], file.endsWith('.css') ? /text\/css/u : /javascript/u);
    }
    browser = await launchChromium(process.env.LOGOS_CHROME);
    await browser.send('Page.navigate', { url: `${base}#/agents` });
    await browser.wait('document.querySelectorAll(".agent-chip").length===4');
    await browser.wait('document.querySelector(\'[name="llm-model"]\')?.value==="gpt-5.6-sol"');
    await browser.wait('document.querySelector("#generation-state").textContent.includes("Generation 0")');
    await browser.evaluate(`document.querySelector('[name="llm-message"]').value='Private local draft, never sent';
      document.querySelector('[name="llm-message"]').dispatchEvent(new Event('input'))`);
    await browser.route('#/overview');
    assert.equal(await browser.evaluate('document.title'), 'Knowledge overview · powder');
    await browser.route('#/agents?agent=teacher');
    assert.equal(await browser.evaluate('document.querySelector(\'[name="llm-message"]\').value'), 'Private local draft, never sent');
    assert.equal(await browser.evaluate('document.querySelectorAll(".llm-agent").length'), 1);
    assert.equal(await browser.evaluate('document.querySelector(".agents-workspace").hidden'), false);
    const symbolic = await request('symbolic/status');
    assert.equal(symbolic.model, false);
    assert.ok(symbolic.profiles.some(profile => profile.id === 'cyc-starter-v1'));
    await browser.route('#/agents?agent=cyc');
    await browser.wait('document.querySelector(\'[name="cyc-profile"] option[value="cyc-starter-v1"]\')!==null');
    assert.equal(await browser.evaluate('document.querySelectorAll(".classic-context-index a[href*=\'agents?agent=\']").length'), 4);
    await browser.evaluate(`document.querySelector('[name="cyc-profile"]').value='cyc-starter-v1';
      document.querySelector('[name="cyc-profile"]').dispatchEvent(new Event('change'));
      [...document.querySelectorAll('.symbolic-agent button')].find(button=>button.textContent==='Knowledge').click();
      [...document.querySelectorAll('.symbolic-agent button')].find(button=>button.textContent==='Start').click()`);
    await browser.wait('document.querySelector(".cyc-feedback").textContent.includes("Recorded awaiting_input")');
    await browser.evaluate(`document.querySelector('[name="cyc-message"]').value='hello';
      document.querySelector('[name="cyc-message"]').dispatchEvent(new Event('input'));
      document.querySelector('.cyc-composer').requestSubmit()`);
    await browser.wait('document.querySelector(".cyc-transcript").textContent.includes("Hello")');
    await browser.route('#/agents?agent=copilot');
    await browser.wait('document.querySelectorAll("iframe.operator-agent-frame").length===1');
    assert.match(await browser.evaluate('document.querySelector("iframe.operator-agent-frame").src'), /\/embed\?provider=copilot$/u);
    await browser.evaluate('window.retainedFrame=document.querySelector("iframe.operator-agent-frame")');
    await browser.route('#/overview');
    await browser.route('#/agents?agent=copilot');
    assert.equal(await browser.evaluate('retainedFrame===document.querySelector("iframe.operator-agent-frame")&&retainedFrame.isConnected'), true);
    await browser.route('#/agents?agent=codex');
    await browser.wait('document.querySelectorAll("iframe.operator-agent-frame").length===2');
    assert.match(await browser.evaluate('document.querySelectorAll("iframe.operator-agent-frame")[1].src'), /\/embed\?provider=codex$/u);
    await browser.route('#/agents?agent=teacher');
    assert.equal(await browser.evaluate('document.querySelector(\'[name="llm-message"]\').value'), 'Private local draft, never sent');
    const after = await request('status');
    assert.equal(after.generation, before.generation);
    assert.deepEqual(after.files, before.files);
    assert.deepEqual(browser.exceptions, []);
  } finally {
    await browser?.close();
    child.stdin.end('\n');
    if (child.exitCode === null) {
      await new Promise(resolve => {
        const timer = setTimeout(() => { child.kill(); resolve(); }, 5000);
        child.once('exit', () => { clearTimeout(timer); resolve(); });
      });
    }
    await rm(directory, { recursive: true, force: true, maxRetries: 5, retryDelay: 100 });
  }
});
