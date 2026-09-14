import test from 'node:test';
import assert from 'node:assert/strict';
import {spawn} from 'node:child_process';
import {once} from 'node:events';
import {existsSync} from 'node:fs';
import {fileURLToPath} from 'node:url';
import {launchChromium} from '../../tests/chromium.mjs';

const root = fileURLToPath(new URL('../../../../', import.meta.url));
const python = fileURLToPath(new URL('../.venv/Scripts/python.exe', import.meta.url));
const executable = process.env.LOGOS_CHROME || 'C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe';
const pause = milliseconds => new Promise(resolve => setTimeout(resolve, milliseconds));

async function startFixture() {
  const child = spawn(python, ['-m', 'prolog.ow_dr.operator_bridge.tests.fixture_embed'],
    {cwd: root, windowsHide: true, stdio: ['ignore', 'pipe', 'pipe']});
  let stderr = '', output = '';
  child.stderr.on('data', chunk => { stderr += chunk; });
  const config = await new Promise((resolve, reject) => {
    const timeout = setTimeout(() => reject(new Error('Synthetic fixture startup timed out. ' + stderr)), 15000);
    child.once('error', error => { clearTimeout(timeout); reject(error); });
    child.once('exit', code => { clearTimeout(timeout); reject(new Error(`Fixture exited ${code}: ${stderr}`)); });
    child.stdout.on('data', chunk => {
      output += chunk;
      if (output.includes('\n')) {
        clearTimeout(timeout);
        try { resolve(JSON.parse(output.split('\n')[0])); } catch (error) { reject(error); }
      }
    });
  }).catch(error => { child.kill(); throw error; });
  return {...config, async close() {
    if (child.exitCode !== null) return;
    let timer;
    const exited = once(child, 'exit').finally(() => clearTimeout(timer));
    await fetch(config.parentURL + '/fixture/stop', {method: 'POST'}).catch(() => {});
    await Promise.race([exited, new Promise(resolve => { timer = setTimeout(resolve, 10000); })]);
    if (child.exitCode === null) {
      child.kill();
      throw new Error('Synthetic fixture did not exit cleanly.');
    }
    if (child.exitCode !== 0) throw new Error('Synthetic fixture cleanup failed: ' + stderr);
  }};
}

test('cross-site embedded native adapters: pairing, typed handshake, isolation, permissions and replay', {
  timeout: 120000, skip: !existsSync(executable) || !existsSync(python),
}, async () => {
  const fixture = await startFixture();
  const browser = await launchChromium(executable);
  const {send, evaluate, wait} = browser;
  const stats = async () => (await fetch(fixture.parentURL + '/fixture/stats')).json();
  async function frame(provider) {
    let target;
    for (let i = 0; i < 100 && !target; i++) {
      const targets = await send('Target.getTargets', {}, null);
      target = targets.targetInfos.find(item => item.type === 'iframe' && item.url.endsWith(`provider=${provider}`));
      if (!target) await pause(50);
    }
    assert.ok(target, `${provider} isolated frame target`);
    const {sessionId} = await send('Target.attachToTarget', {targetId: target.targetId, flatten: true}, null);
    const run = async expression => {
      const result = await send('Runtime.evaluate', {expression, awaitPromise: true, returnByValue: true}, sessionId);
      if (result.exceptionDetails) throw new Error(JSON.stringify(result.exceptionDetails));
      return result.result.value;
    };
    const until = async expression => {
      for (let i = 0; i < 200; i++) {
        try { if (await run(expression)) return; } catch { /* Native form navigation replaces the context. */ }
        await pause(50);
      }
      throw new Error(`Frame condition failed: ${expression}\n${await run('document.body.innerText')}`);
    };
    return {run, until};
  }
  async function pair(child) {
    await child.until('document.querySelector("#pair-submit")?.disabled === false');
    await child.run(`document.getElementById('phrase').value = 'isolated fixture pairing phrase'; document.getElementById('pair-submit').click()`);
    await child.until('document.querySelector("#bridge")?.textContent === "Online"');
  }
  try {
    await send('Network.enable');
    await send('Network.setCookie', {name: 'powder_operator_session', value: 'synthetic-cookie-not-an-embed-capability',
      url: fixture.bridgeURL, httpOnly: true, sameSite: 'Strict'});
    await send('Emulation.setDeviceMetricsOverride', {width: 1200, height: 900, deviceScaleFactor: 1, mobile: false});
    await send('Page.navigate', {url: fixture.parentURL});
    await wait('window.states?.copilot?.status === "pairing" && window.framesByProvider?.codex');
    assert.deepEqual(await evaluate('framesByProvider.codex.getState()'), {
      provider:'codex', status:'not_loaded', conversationId:null, sequence:0, error:null, connected:false, unread:0,
    });
    assert.equal(await evaluate('document.querySelectorAll(".operator-agent-frame")[1].getAttribute("src")'), null,
      'inactive controller does not navigate an iframe before chip selection');
    await evaluate('document.getElementById("codex").click()');
    await wait('window.states?.codex?.status === "pairing"');
    let copilot = await frame('copilot');
    const codex = await frame('codex');
    await evaluate('document.getElementById("copilot").click()');
    assert.equal((await stats()).copilotStarts, 0);
    assert.equal((await stats()).codexStarts, 0);
    await pair(copilot);
    await pair(codex);
    assert.equal((await stats()).copilotStarts, 0, 'pairing cannot start native Copilot');
    assert.equal((await stats()).codexStarts, 0, 'pairing cannot start native Codex');
    assert.equal((await stats()).embedCookiesReceived, false, 'cross-site requests are cookie-independent');
    assert.equal(await copilot.run('document.cookie'), '', 'HttpOnly cookie stays unavailable');
    assert.equal(await copilot.run('localStorage.length + sessionStorage.length'), 0);
    assert.equal(await copilot.run('document.querySelector("#embed-bootstrap")'), null);
    assert.match(await copilot.run('document.getElementById("identity").textContent'), /fixture-copilot-model/);
    assert.match(await codex.run('document.getElementById("identity").textContent'), /fixture-codex-model/);
    assert.match(await copilot.run('document.getElementById("identity").textContent'), /native_cli_managed/);
    const initialState = await evaluate('framesByProvider.copilot.getState()');
    assert.match(initialState.conversationId, /^[a-f0-9-]{36}$/);
    assert.equal(initialState.sequence, 0);
    assert.equal(initialState.error, null);
    await pause(1000);
    assert.equal((await evaluate('framesByProvider.copilot.getState()')).sequence, 0, 'heartbeats are not conversation events');
    assert.equal(await evaluate(`(() => {try { return !!document.querySelector('iframe').contentWindow.document; } catch { return false; }})()`), false);
    assert.equal(await evaluate(`fetch('${fixture.bridgeURL}/embed/api/copilot/status', {
      method:'POST', headers:{'Content-Type':'application/json'}, body:'{}'
    }).then(()=>true,()=>false)`), false, 'parent has no authenticated CORS API');

    // Real sibling window: correct parent origin and known nonce, wrong event.source.
    await evaluate(`(() => {
      const hello = messages.filter(m=>m.type==='hello' && m.provider==='copilot').at(-1);
      const sibling = document.createElement('iframe'); sibling.id='sibling';
      sibling.srcdoc = '<script>parent.document.querySelector(".operator-agent-frame").contentWindow.postMessage('
        + JSON.stringify({...hello,type:'lifecycle',active:false}) + ', ${JSON.stringify(fixture.bridgeURL)})<\\/script>';
      document.body.append(sibling);
    })()`);
    const before = await evaluate('framesByProvider.copilot.getState()');
    const hello = await evaluate("messages.filter(m=>m.type==='hello' && m.provider==='copilot').at(-1)");
    await copilot.run(`window.dispatchEvent(new MessageEvent('message', {
      source:parent, origin:'http://attacker.invalid', data:${JSON.stringify({...hello, type:'lifecycle', active:false})}
    }))`);
    await evaluate(`document.querySelector('.operator-agent-frame').contentWindow.postMessage(
      ${JSON.stringify({...hello, type:'command', active:true, kind:'start_session'})}, '${fixture.bridgeURL}')`);
    await pause(300);
    assert.equal((await stats()).copilotStarts, 0, 'postMessage cannot start commands');
    assert.equal((await stats()).copilotPrompts, 0);
    assert.equal((await evaluate('framesByProvider.copilot.getState()')).status, before.status);

    await copilot.run('document.getElementById("start").click()');
    await copilot.until('document.getElementById("copilot").textContent === "idle"');
    await codex.run('document.getElementById("start").click()');
    await codex.until('document.getElementById("conflict").hidden === false');
    assert.equal((await stats()).codexStarts, 0, 'second provider needs explicit Start anyway');
    await codex.run('document.getElementById("start-anyway").click()');
    await codex.until('document.getElementById("copilot").textContent === "idle"');
    await copilot.run(`document.getElementById('prompt').value='copilot unsent draft'; document.getElementById('prompt').dispatchEvent(new Event('input'))`);
    await pause(600);
    assert.equal(await codex.run('document.getElementById("prompt").value'), '');
    await evaluate('document.getElementById("codex").click()');
    await codex.run(`document.getElementById('prompt').value='permission'; document.getElementById('composer').requestSubmit()`);
    await codex.until('document.querySelectorAll("#permissions button").length === 2');
    assert.equal(await copilot.run('document.querySelectorAll("#permissions button").length'), 0);
    await codex.run('window.fixturePermissionButton = document.querySelector("#permissions button:last-child"); fixturePermissionButton.focus()');
    await pause(900);
    assert.equal(await codex.run('fixturePermissionButton.isConnected && document.activeElement === fixturePermissionButton'), true,
      'output heartbeats preserve keyboard focus for explicit permissions');
    await codex.run('document.querySelector("#permissions button:last-child").click()');
    await codex.until('document.getElementById("transcript").textContent.includes("permission accept")');
    assert.equal((await stats()).copilotPrompts, 0);
    assert.equal((await stats()).codexPrompts, 1);

    await evaluate('document.getElementById("copilot").click()');
    await copilot.run(`document.getElementById('prompt').value='fixture'; document.getElementById('composer').requestSubmit()`);
    await copilot.until('document.getElementById("transcript").textContent.includes("fixture output")');
    await wait('framesByProvider.copilot.getState().unread === 0');
    await evaluate('document.getElementById("codex").click()');
    await copilot.run(`document.getElementById('prompt').value='synthetic unread'; document.getElementById('composer').requestSubmit()`);
    await wait('framesByProvider.copilot.getState().unread === 1');
    const unseen = await evaluate('framesByProvider.copilot.getState()');
    assert.ok(unseen.sequence > initialState.sequence);
    assert.equal(unseen.conversationId, initialState.conversationId);
    assert.equal(await evaluate('framesByProvider.codex.getState().unread'), 0);
    await evaluate('document.getElementById("copilot").click()');
    await wait('framesByProvider.copilot.getState().unread === 0');
    assert.equal((await evaluate('framesByProvider.copilot.getState()')).sequence, unseen.sequence,
      'reactivation keeps the conversation event watermark');
    const counts = await stats();
    await copilot.run('document.getElementById("logout").click()');
    await copilot.until('document.getElementById("pair-retry").hidden === false');
    await copilot.run('document.getElementById("pair-retry").click()');
    await pair(copilot);
    await copilot.until('document.getElementById("transcript").textContent.includes("fixture output")');
    assert.equal((await stats()).copilotPrompts, counts.copilotPrompts, 're-pair replays output without commands');
    assert.equal((await stats()).copilotStarts, counts.copilotStarts);
    assert.equal((await stats()).codexStarts, counts.codexStarts);
    await copilot.run(`document.getElementById('prompt').value='durable pending draft'; document.getElementById('prompt').dispatchEvent(new Event('input'))`);
    await pause(600);
    await copilot.run('document.getElementById("logout").click()');
    await copilot.run('document.getElementById("pair-retry").click()');
    await pair(copilot);
    await copilot.until('document.getElementById("prompt").value === "durable pending draft"');

    const messages = await evaluate('window.messages');
    assert.ok(messages.every(message => message.channel === 'powder.operator.embed.v1'));
    assert.ok(messages.every(message => Object.keys(message).every(key =>
      ['channel','type','provider','nonce','revision','status','connected','unread','conversationId','sequence','error'].includes(key))));
    assert.ok(!JSON.stringify(messages).includes('fixture output'));
    assert.ok(!JSON.stringify(messages).includes('capability'));
    assert.ok(await copilot.run('document.documentElement.scrollWidth <= document.documentElement.clientWidth'));
    await send('Emulation.setDeviceMetricsOverride', {width: 390, height: 844, deviceScaleFactor: 1, mobile: true});
    assert.ok(await copilot.run('document.documentElement.scrollWidth <= document.documentElement.clientWidth'));

    // Parent refuses replayed, foreign-window, foreign-provider and extra-field status.
    const latest = messages.filter(m=>m.type==='state' && m.provider==='copilot').at(-1);
    const original = await evaluate('JSON.stringify(framesByProvider.copilot.getState())');
    await evaluate(`window.dispatchEvent(new MessageEvent('message', {origin:'${fixture.bridgeURL}',
      source:document.querySelector('.operator-agent-frame').contentWindow,
      data:${JSON.stringify({...latest, revision:0, unread:999})}}))`);
    await evaluate(`window.dispatchEvent(new MessageEvent('message', {origin:'${fixture.bridgeURL}',
      source:window, data:${JSON.stringify({...latest, revision:99999, unread:999})}}))`);
    await evaluate(`window.dispatchEvent(new MessageEvent('message', {origin:'http://attacker.invalid',
      source:document.querySelector('.operator-agent-frame').contentWindow,
      data:${JSON.stringify({...latest, revision:99999, unread:999})}}))`);
    await evaluate(`window.dispatchEvent(new MessageEvent('message', {origin:'${fixture.bridgeURL}',
      source:document.querySelector('.operator-agent-frame').contentWindow,
      data:${JSON.stringify({...latest, revision:99999, unread:999, provider:'codex'})}}))`);
    await evaluate(`window.dispatchEvent(new MessageEvent('message', {origin:'${fixture.bridgeURL}',
      source:document.querySelector('.operator-agent-frame').contentWindow,
      data:${JSON.stringify({...latest, revision:99999, unread:999, command:'prompt'})}}))`);
    await evaluate(`window.dispatchEvent(new MessageEvent('message', {origin:'${fixture.bridgeURL}',
      source:document.querySelector('.operator-agent-frame').contentWindow,
      data:${JSON.stringify({...latest, revision:99999, sequence:0})}}))`);
    assert.equal(await evaluate('JSON.stringify(framesByProvider.copilot.getState())'), original);
    await evaluate('lifetimes.copilot.abort(); framesByProvider.codex.destroy()');
    assert.equal(await evaluate('document.querySelectorAll(".operator-agent").length'), 0,
      'app lifetime signal destroys only its controller');
    for (let i=0;i<50 && Object.values((await stats()).connections).some(Boolean);i++) await pause(100);
    assert.deepEqual((await stats()).connections, {copilot:0,codex:0});

    // A different origin on the same loopback listener is not the configured parent.
    await send('Page.navigate', {url: fixture.parentURL.replace('localhost','127.0.0.1')});
    await wait('window.framesByProvider?.copilot');
    await pause(700);
    assert.deepEqual(await evaluate('window.messages'), [], 'wrong parent receives no handshake');
    const blockedFrame = await frame('copilot');
    assert.equal(await blockedFrame.run('document.querySelector("#pair-form")'), null,
      'CSP blocks the pairing document under a wrong parent');
    await send('Page.navigate', {url: fixture.bridgeURL + '/'});
    await wait('document.getElementById("phrase")');
    await evaluate(`document.getElementById('phrase').value='isolated fixture pairing phrase'; document.querySelector('form button').click()`);
    await wait('document.getElementById("bridge")?.textContent === "Online"');
    const {cookies} = await send('Network.getCookies', {urls:[fixture.bridgeURL]});
    assert.ok(cookies.some(cookie => cookie.name === 'powder_operator_session'
      && cookie.httpOnly && cookie.sameSite === 'Strict'));
    assert.equal((await stats()).copilotPrompts, counts.copilotPrompts, 'standalone recovery also only replays');
  } finally {
    await browser.close();
    await fixture.close();
  }
});
