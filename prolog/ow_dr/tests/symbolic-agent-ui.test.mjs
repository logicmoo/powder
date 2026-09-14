import test from 'node:test';
import assert from 'node:assert/strict';
import { createServer } from 'node:http';
import { spawn } from 'node:child_process';
import { readFile } from 'node:fs/promises';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';
import { launchChromium } from './chromium.mjs';
import { linkedMts, controlAvailability, symbolicText, mergeEvents, SYMBOLIC_STORAGE } from '../web/symbolic-agent.js';
const here = dirname(fileURLToPath(import.meta.url));
const symbol = value => ({ type: 'symbol', value });
const wire = term => ({ schema: 'powder.symbolic-term.v1', term });
test('explicit MT selection, cumulative state and unresolved actions', () => {
  assert.deepEqual(linkedMts(' x_OneMt \nx_OneMt\nx_TwoMt'), ['x_OneMt', 'x_TwoMt']);
  assert.equal(controlAvailability(null).send, false);
  assert.equal(controlAvailability({ phase: 'awaiting_input' }).send, true);
  assert.equal(controlAvailability({ phase: 'running' }, true).continue, false);
  assert.equal(controlAvailability({ phase: 'awaiting_action', pending: { stage: 'dispatched' } }).continue, false);
  assert.equal(controlAvailability({ phase: 'interrupted', pending: { kind: 'action' } }).resume, false);
  assert.equal(controlAvailability({ phase: 'interrupted', pending: { kind: 'action', stage: 'planned' } }).resume, true);
  for (const stage of ['unknown', 'dispatched'])
    assert.equal(controlAvailability({ phase: 'interrupted', pending: { kind: 'action', stage } }).resume, false);
  assert.equal(controlAvailability({ phase: 'awaiting_input' }, false, true).send, false);
  assert.equal(controlAvailability({ phase: 'awaiting_input' }, false, true).stop, true);
  assert.equal(controlAvailability({ phase: 'stopped' }).resume, false);
  assert.ok(Object.values(SYMBOLIC_STORAGE).every(key => key.startsWith('powder.cyc.')));
});
test('wire rendering never evaluates markup and preserves structured variables', () => {
  assert.equal(symbolicText(wire({ type: 'compound', functor: 'x_pair', args: [
    symbol('x_Thing'), { type: 'variable', id: 0 }, { type: 'string', value: '<img src=x>' },
  ] })), '(pair Thing ?0 "<img src=x>")');
  assert.deepEqual(mergeEvents([{ sequence: 2 }, { sequence: 1 }], [{ sequence: 2, updated: true }]),
    [{ sequence: 1 }, { sequence: 2, updated: true }]);
});
test('real isolated host: constrained form and undispatched read/write resume', {
  skip: !process.env.LOGOS_CHROME, timeout: 90000,
}, async () => {
  const child = spawn('swipl', ['-q', '-s', join(here, 'symbolic-agent-browser-fixture.pl'),
    '-g', 'symbolic_agent_browser_fixture:main', '-t', 'halt'], { stdio: ['pipe', 'pipe', 'pipe'], windowsHide: true });
  let diagnostics = '', browser;
  child.stderr.on('data', data => { diagnostics = (diagnostics + data).slice(-8000); });
  const exited = new Promise(resolve => { child.once('exit', resolve); child.once('error', () => resolve(-1)); });
  try {
    const port = await new Promise((resolve, reject) => {
      let output = '';
      const timer = setTimeout(() => reject(Error(`Isolated SWI host did not start: ${diagnostics}`)), 15000);
      child.once('error', error => { clearTimeout(timer); reject(error); });
      child.once('exit', code => { clearTimeout(timer); reject(Error(`Isolated SWI host exited ${code}: ${diagnostics}`)); });
      child.stdout.on('data', data => {
        output += data;
        const match = output.match(/\{"port":(\d+)\}/u);
        if (match) { clearTimeout(timer); resolve(Number(match[1])); }
      });
    });
    browser = await launchChromium(process.env.LOGOS_CHROME);
    const click = label => browser.evaluate(`[...document.querySelectorAll('button')].find(b=>b.textContent===${JSON.stringify(label)}).click()`);
    const fill = (name, value) => browser.evaluate(`{const n=document.querySelector('[name="${name}"]');n.value=${JSON.stringify(value)};n.dispatchEvent(new Event('input',{bubbles:true}))}`);
    const phase = expected => browser.wait(`cyc.getState().status===${JSON.stringify(expected)}&&!cyc.getState().pending`);
    await browser.send('Page.navigate', { url: `http://127.0.0.1:${port}/` });
    await browser.wait(`!!window.cyc&&document.querySelector('[name="cyc-profile"]').options.length===3`);
    assert.deepEqual(await browser.evaluate(`fixtureRequests.map(r=>r.path)`), ['symbolic/status']);
    await browser.evaluate(`{const p=document.querySelector('[name="cyc-profile"]');p.value='cyc-starter-v1';p.dispatchEvent(new Event('change'))}`);
    await click('Start'); await phase('awaiting_input');
    await fill('cyc-message', 'new todo'); await click('Send'); await phase('awaiting_form');
    assert.equal(await browser.evaluate(`document.querySelector('[name="title"]').maxLength`), 256);
    await fill('title', 'A'.repeat(257));
    await browser.evaluate(`document.querySelector('.cyc-requests form').requestSubmit()`);
    assert.equal(await browser.evaluate(`fixtureRequests.filter(r=>r.path==='symbolic/form').length`), 0);
    assert.match(await browser.evaluate(`cyc.getState().error.message`), /256/u);
    await browser.evaluate(`cyc.deactivate();cyc.activate()`); await phase('awaiting_form');
    assert.equal(await browser.evaluate(`document.querySelector('[name="title"]').value.length`), 257);
    const rejection = await browser.evaluate(`(async()=>{
      const s=fixtureLatest.run;
      const response=await fetch(symbolicFixtureApiBase+'symbolic/form',{method:'POST',
        headers:{'Content-Type':'application/json'},body:JSON.stringify({id:s.id,conversation:s.conversation,
          revision:s.revision,callId:'oversized-direct-fixture',values:{title:'A'.repeat(257),description:''}})});
      return {status:response.status,body:await response.json()};
    })()`);
    assert.equal(rejection.status, 422); assert.equal(rejection.body.error.code, 'symbolic_form_invalid');
    await click('Refresh state'); await phase('awaiting_form');
    assert.equal(await browser.evaluate(`document.querySelector('[name="title"]').value.length`), 257);
    await fill('title', 'A'.repeat(256));
    await browser.evaluate(`document.querySelector('.cyc-requests form').requestSubmit()`); await phase('running');
    await click('Continue'); await phase('awaiting_action');
    const planned = await browser.evaluate(`fixtureLatest.run.pending.callId`);
    await click('Interrupt'); await phase('interrupted');
    assert.equal(await browser.evaluate(`[...document.querySelectorAll('button')].find(b=>b.textContent==='Resume').disabled`), false);
    await click('Resume'); await phase('awaiting_action');
    assert.equal(await browser.evaluate(`fixtureLatest.run.pending.callId`), planned);
    assert.equal(await browser.evaluate(`fixtureLatest.run.pending.stage`), 'planned');
    await click('Continue'); await phase('running');
    await click('Continue'); await phase('awaiting_action');
    await click('Interrupt'); await phase('interrupted');
    await click('Resume'); await phase('awaiting_action');
    await click('Continue'); await phase('running');
    await click('Continue'); await phase('awaiting_input');
    await click('TODOs'); await click('Refresh TODOs'); await browser.wait(`!cyc.getState().pending`);
    assert.equal(await browser.evaluate(`fixtureLatest.result.total`), 1);
    assert.equal(await browser.evaluate(`fixtureLatest.result.items[0].data.title`), 'A'.repeat(256));
    assert.equal(await browser.evaluate(`fixtureLatest.result.items[0].data.status`), 'open');
    assert.equal(await browser.evaluate(`cyc.getState().unknownOutcome`), false);
    assert.deepEqual(browser.exceptions, []);
  } finally {
    if (browser) await browser.close();
    child.stdin.end('\n');
    const timer = setTimeout(() => child.kill(), 5000);
    const code = await exited; clearTimeout(timer);
    assert.equal(code, 0, diagnostics);
  }
});
test('isolated browser lifecycle, separate drafts, forms, evidence and uncertain recovery', {
  skip: !process.env.LOGOS_CHROME, timeout: 90000,
}, async () => {
  const requests = [], runs = new Map(), receipts = new Map();
  let latest, dropResponse = false, holdNextRead = false, releaseRead;
  const server = createServer(async (req, res) => {
    const url = new URL(req.url, 'http://127.0.0.1');
    if (url.pathname === '/') {
      res.setHeader('Content-Type', 'text/html');
      res.end(await readFile(join(here, 'symbolic-agent-browser-fixture.html')));
      return;
    }
    if (url.pathname === '/symbolic-fixture-config.js') {
      res.setHeader('Content-Type', 'text/javascript'); res.end("window.symbolicFixtureApiBase='/api/';"); return;
    }
    if (['/style.css', '/symbolic-agent.css', '/symbolic-agent.js'].includes(url.pathname)) {
      res.setHeader('Content-Type', url.pathname.endsWith('.js') ? 'text/javascript' : 'text/css');
      res.end(await readFile(join(here, '..', 'web', url.pathname.slice(1)))); return;
    }
    if (!url.pathname.startsWith('/api/symbolic/')) { res.statusCode = 404; res.end(); return; }
    let raw = ''; for await (const chunk of req) raw += chunk;
    const body = raw ? JSON.parse(raw) : null, action = url.pathname.slice('/api/symbolic/'.length);
    requests.push({ action, body, params: Object.fromEntries(url.searchParams) });
    let reply;
    if (action === 'status') reply = { profiles: [{ id: 'cyc-starter-v1', label: 'Cyc starter — limited app-owned profile',
      description: 'Finite declarative dialogue and typed open-TODO creation.', examples: ['hello', 'help', 'new todo'] }] };
    else if (action === 'start') {
      if (body.agent === 'x_Unavailable') {
        res.statusCode = 422; reply = { error: { code: 'knowledge_unavailable', message: 'Loaded agent definition unavailable' } };
      } else {
        latest = { run: { id: `run:${runs.size + 1}`, conversation: body.conversation, revision: 'r1',
          phase: 'awaiting_input', status: 'created', steps: 0, actions: 0, turns: 0,
          source: { knowledgeAgent: body.profile ? 'x_PowderCycStarter' : body.agent, definitionMt: body.definitionMt },
          state: wire(symbol('x_AwaitCommand')), pending: null, knowledge: 'snapshot_bound' },
        events: [], eventTotal: 0 };
        runs.set(latest.run.id, latest); reply = latest;
      }
    } else if (action === 'request-status') reply = { receipt: receipts.get(url.searchParams.get('callId')) ?? { status: 'unknown' } };
    else if (action === 'conversation') {
      if (holdNextRead) { holdNextRead = false; await new Promise(resolve => { releaseRead = resolve; }); }
      reply = runs.get(url.searchParams.get('id'));
    }
    else if (action === 'todos' || action === 'audit') reply = { result: { items: [{ title: 'Actual fixture application record' }], total: 1 } };
    else if (action === 'receipt') reply = { receipt: { status: 'unknown', commit: null } };
    else if (['send', 'continue', 'interrupt', 'resume', 'stop', 'form'].includes(action)) {
      latest = runs.get(body.id);
      if (action === 'send') {
        latest.run.phase = body.text === 'form please' ? 'awaiting_form' : body.text === 'approval please' ? 'awaiting_approval' : 'awaiting_input';
        latest.run.pending = body.text === 'form please'
          ? { kind: 'form', key: wire(symbol('x_TestForm')), fields: [{ name: 'note', type: 'String' }] }
          : body.text === 'approval please' ? { kind: 'approval', supported: false, message: 'Trusted receipt adapter not installed.' } : null;
        latest.events.push({ sequence: latest.events.length + 1, kind: 'transition',
          callId: `symbolic-http/${body.callId}`,
          request: { input: wire({ type: 'compound', functor: 'text', args: [{ type: 'string', value: body.text }] }) },
          semantic: wire({ type: 'compound', functor: 'dialogue_proof', args: [symbol('a123')] }),
          messages: [{ text: '<img src=x onerror=alert(1)> known response', proof: ['a123'] }], action: null });
      } else if (action === 'interrupt') latest.run.phase = 'interrupted';
      else if (action === 'stop') latest.run.phase = 'stopped';
      else { latest.run.phase = 'awaiting_input'; latest.run.pending = null; }
      latest.run.status = 'running'; latest.run.revision += 'x'; latest.run.turns += 1;
      latest.eventTotal = latest.events.length; reply = latest;
    }
    if (body?.callId && !reply?.error) receipts.set(body.callId, {
      status: 'committed', commit: { result: { id: latest.run.id } },
    });
    if (dropResponse && body) {
      dropResponse = false; res.setHeader('Content-Type', 'application/json'); res.end('['); return;
    }
    res.setHeader('Content-Type', 'application/json'); res.end(JSON.stringify(reply));
  });
  await new Promise(resolve => server.listen(0, '127.0.0.1', resolve));
  const browser = await launchChromium(process.env.LOGOS_CHROME);
  const click = label => browser.evaluate(`[...document.querySelectorAll('button')].find(b=>b.textContent===${JSON.stringify(label)}).click()`);
  const fill = (name, value) => browser.evaluate(`{const n=document.querySelector('[name="${name}"]');n.value=${JSON.stringify(value)};n.dispatchEvent(new Event('input',{bubbles:true}))}`);
  try {
    await browser.send('Page.navigate', { url: `http://127.0.0.1:${server.address().port}/` });
    await browser.wait(`!!window.cyc`);
    await browser.wait(`document.querySelector('[name="cyc-profile"]').options.length===3`);
    assert.deepEqual(requests.map(r => r.action), ['status'], 'mount may discover profiles but must not start or load knowledge');
    assert.deepEqual(await browser.evaluate(`({sequence:cyc.getState().sequence,error:cyc.getState().error,conversationId:cyc.getState().conversationId})`),
      { sequence: 0, error: null, conversationId: null });
    await browser.evaluate(`{const p=document.querySelector('[name="cyc-profile"]');p.value='loaded';p.dispatchEvent(new Event('change'))}`);
    await fill('cyc-agent', 'x_Unavailable'); await fill('cyc-definition-mt', 'x_DefMt');
    await fill('cyc-linked-mts', 'x_GrammarMt\nx_GrammarMt');
    await click('Start'); await browser.wait(`document.body.textContent.includes('Loaded agent definition unavailable')`);
    assert.equal(await browser.evaluate(`cyc.getState().unknownOutcome`), false);
    assert.match(await browser.evaluate(`cyc.getState().error.message`), /definition unavailable/u);
    await fill('cyc-agent', 'x_TestAgent'); await click('Start');
    await browser.wait(`cyc.getState().runId==='run:1'&&!cyc.getState().pending`);
    assert.deepEqual(requests.filter(r => r.action === 'start').at(-1).body.linkedMts, ['x_GrammarMt']);
    await fill('cyc-message', 'draft kept 😀');
    const count = requests.length;
    await browser.evaluate(`cyc.deactivate();cyc.activate()`);
    await browser.wait(`!cyc.getState().pending`);
    assert.deepEqual(requests.slice(count).map(r => r.action), ['conversation'], 'reactivation reads but never starts work');
    assert.equal(await browser.evaluate(`document.querySelector('[name="cyc-message"]').value`), 'draft kept 😀');
    await click('Send'); await browser.wait(`!cyc.getState().pending&&document.querySelector('.cyc-transcript').textContent.includes('known response')`);
    assert.equal(await browser.evaluate(`document.querySelectorAll('.cyc-transcript img').length`), 0);
    assert.equal(await browser.evaluate(`document.querySelector('[name="cyc-message"]').value`), '');
    const observed = await browser.evaluate(`cyc.getState().sequence`);
    await click('Refresh state'); await browser.wait(`!cyc.getState().pending`);
    assert.equal(await browser.evaluate(`cyc.getState().sequence`), observed);
    assert.equal(await browser.evaluate(`cyc.getState().unread`), 0, 'an unchanged poll is not unread');
    holdNextRead = true; await click('Refresh state'); await browser.wait(`cyc.getState().pending`);
    await browser.evaluate(`cyc.deactivate()`);
    latest.events.push({ sequence: latest.events.length + 1, kind: 'transition', messages: [] });
    latest.eventTotal = latest.events.length;
    releaseRead();
    await browser.wait(`!cyc.getState().pending&&cyc.getState().unread===1`);
    assert.equal(await browser.evaluate(`cyc.getState().sequence`), observed + 1);
    await browser.evaluate(`cyc.activate()`); await browser.wait(`!cyc.getState().pending`);
    assert.equal(await browser.evaluate(`cyc.getState().sequence`), observed + 1);
    assert.equal(await browser.evaluate(`cyc.getState().unread`), 0);
    await click('Proofs'); assert.match(await browser.evaluate(`document.getElementById(document.querySelector('[role="tab"][aria-selected="true"]').getAttribute('aria-controls')).textContent`), /Event 1/u);
    await click('TODOs'); await click('Refresh TODOs');
    await browser.wait(`document.body.textContent.includes('Actual fixture application record')`);
    await fill('cyc-message', 'form please'); await click('Send');
    await browser.wait(`document.querySelector('[name="note"]')`);
    await fill('note', 'Unsent form draft');
    await browser.evaluate(`cyc.deactivate();cyc.activate()`); await browser.wait(`!cyc.getState().pending`);
    assert.equal(await browser.evaluate(`document.querySelector('[name="note"]').value`), 'Unsent form draft');
    assert.equal(await browser.evaluate(`document.querySelector('[name="note"]').disabled`), false);
    await browser.evaluate(`document.querySelector('[name="note"]').value='Verified input';document.querySelector('.cyc-requests form').requestSubmit()`);
    await browser.wait(`requestsDone=cyc.getState().status==='awaiting_input'&&!cyc.getState().pending`);
    assert.deepEqual(requests.find(r => r.action === 'form').body.values, { note: 'Verified input' });
    await fill('cyc-message', 'form please'); await click('Send');
    await browser.wait(`document.querySelector('[name="note"]')&&!cyc.getState().pending`);
    assert.equal(await browser.evaluate(`document.querySelector('[name="note"]').value`), '', 'a new form does not reuse a submitted draft');
    await browser.evaluate(`document.querySelector('[name="note"]').value='Second form';document.querySelector('.cyc-requests form').requestSubmit()`);
    await browser.wait(`cyc.getState().status==='awaiting_input'&&!cyc.getState().pending`);
    await fill('cyc-message', 'approval please'); await click('Send');
    await browser.wait(`document.body.textContent.includes('Approval adapter unavailable')`);
    assert.equal(requests.some(r => r.action === 'approval'), false);
    await click('Interrupt'); await browser.wait(`cyc.getState().status==='interrupted'&&!cyc.getState().pending`);
    await click('Resume'); await browser.wait(`cyc.getState().status==='awaiting_input'&&!cyc.getState().pending`);
    await fill('cyc-message', 'unsent first');
    await click('Knowledge'); await click('Start');
    await browser.wait(`cyc.getState().runId==='run:2'&&!cyc.getState().pending`);
    assert.equal(await browser.evaluate(`cyc.getState().sequence`), 0, 'sequence belongs to this conversation, not the controller lifetime');
    await fill('cyc-message', 'second draft');
    await browser.evaluate(`const p=document.querySelector('[aria-label="Cyc conversations"]');p.value='run:1';p.dispatchEvent(new Event('change'))`);
    await browser.wait(`cyc.getState().runId==='run:1'&&!cyc.getState().pending`);
    assert.ok(await browser.evaluate(`cyc.getState().sequence`) >= observed + 1);
    assert.equal(await browser.evaluate(`document.querySelector('[name="cyc-message"]').value`), 'unsent first');
    dropResponse = true;
    await click('Send'); await browser.wait(`cyc.getState().unknownOutcome&&!cyc.getState().pending`);
    const sendCount = requests.filter(r => r.action === 'send').length;
    await click('Inspect uncertain request'); await browser.wait(`!cyc.getState().unknownOutcome&&!cyc.getState().pending`);
    assert.equal(requests.filter(r => r.action === 'send').length, sendCount, 'recovery must inspect, never replay');
    await click('Stop'); await browser.wait(`cyc.getState().status==='stopped'&&!cyc.getState().pending`);
    await click('Knowledge');
    const beforeProfileStart = requests.length;
    await browser.evaluate(`{const p=document.querySelector('[name="cyc-profile"]');p.value='cyc-starter-v1';p.dispatchEvent(new Event('change'))}`);
    assert.equal(requests.length, beforeProfileStart, 'profile selection executes nothing');
    await click('Start'); await browser.wait(`cyc.getState().runId==='run:3'&&!cyc.getState().pending`);
    const starterRequest = requests.filter(r => r.action === 'start').at(-1).body;
    assert.equal(starterRequest.profile, 'cyc-starter-v1');
    assert.equal('agent' in starterRequest || 'linkedMts' in starterRequest, false);
    await browser.send('Emulation.setDeviceMetricsOverride', { width: 390, height: 844, deviceScaleFactor: 1, mobile: true });
    assert.equal(await browser.evaluate(`document.documentElement.scrollWidth<=innerWidth`), true);
    await browser.evaluate(`cyc.destroy();window.cyc=make({active:false});document.querySelector('main').append(cyc.element)`);
    assert.equal(await browser.evaluate(`cyc.getState().active`), false);
    assert.equal(await browser.evaluate(`document.querySelectorAll('.symbolic-agent').length`), 1);
    assert.equal(await browser.evaluate(`states.every((s,index)=>Number.isSafeInteger(s.sequence)&&s.sequence>=0&&typeof s.status==='string'
      &&(s.conversationId===null||typeof s.conversationId==='string')&&('error'in s)
      &&states.slice(0,index).filter(p=>p.conversationId===s.conversationId).every(p=>p.sequence<=s.sequence))`), true);
    assert.deepEqual(browser.exceptions, []);
  } catch (error) {
    error.message += `\nBrowser exceptions: ${JSON.stringify(browser.exceptions)}`; throw error;
  } finally { await browser.close(); await new Promise(resolve => server.close(resolve)); }
});
