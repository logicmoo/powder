import test from 'node:test';
import assert from 'node:assert/strict';
import { createServer } from 'node:http';
import { spawn } from 'node:child_process';
import { readFile } from 'node:fs/promises';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';
import { launchChromium } from './chromium.mjs';
import { linkedMts, controlAvailability, symbolicText, mergeEvents, eventTimeMillis, elapsedText, SYMBOLIC_STORAGE } from '../web/symbolic-agent.js';
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
  assert.equal(controlAvailability({ phase: 'awaiting_input', status: 'created' }).send, true);
  assert.equal(controlAvailability({ phase: 'awaiting_input', status: 'created' }).resume, false);
  const forkable = { phase: 'awaiting_input', pending: null, fork: { supported: true, allowed: true } };
  assert.equal(controlAvailability(forkable).fork, true);
  assert.equal(controlAvailability(forkable, true).fork, false);
  assert.equal(controlAvailability(forkable, false, true).fork, false);
  assert.equal(controlAvailability({ phase: 'awaiting_input' }).fork, false, 'old backend fails closed');
  for (const phase of ['running', 'awaiting_action', 'awaiting_form', 'awaiting_approval', 'gap', 'interrupted', 'stopped'])
    assert.equal(controlAvailability({ ...forkable, phase }).fork, false);
  assert.equal(controlAvailability({ ...forkable, pending: { kind: 'action', stage: 'planned' } }).fork, false);
  assert.ok(Object.values(SYMBOLIC_STORAGE).every(key => key.startsWith('powder.cyc.')));
});
test('wire rendering never evaluates markup and preserves structured variables', () => {
  assert.equal(symbolicText(wire({ type: 'compound', functor: 'x_pair', args: [
    symbol('x_Thing'), { type: 'variable', id: 0 }, { type: 'string', value: '<img src=x>' },
  ] })), '(pair Thing ?0 "<img src=x>")');
  assert.deepEqual(mergeEvents([{ sequence: 2 }, { sequence: 1 }], [{ sequence: 2, updated: true }]),
    [{ sequence: 1 }, { sequence: 2, updated: true }]);
});
test('timing uses typed ledger seconds and never fabricates invalid durations', () => {
  assert.equal(eventTimeMillis({ time: 1700000000.125 }), 1700000000125);
  assert.equal(eventTimeMillis({ time: 0 }), 0);
  for (const time of [undefined, null, '1700000000', '2026-01-01', -1, Infinity, NaN, 1e100])
    assert.equal(eventTimeMillis({ time }), null);
  for (const duration of [undefined, null, -1, NaN, Infinity]) assert.equal(elapsedText(duration), 'unknown');
  assert.equal(elapsedText(0), '0s');
  assert.equal(elapsedText(61000), '1m 1s');
  assert.equal(elapsedText(3661000), '1h 1m');
  assert.equal(elapsedText(90061000), '1d 1h');
});
test('real isolated host: chat-first New/Previous, symbolic greeting, forms and safe resume', {
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
    const choose = id => browser.evaluate(`{const p=document.querySelector('[aria-label="Cyc conversations"]');p.value=${JSON.stringify(id)};p.dispatchEvent(new Event('change'))}`);
    await browser.send('Page.navigate', { url: `http://127.0.0.1:${port}/` });
    await browser.wait(`!!window.cyc&&document.querySelector('[name="cyc-profile"]').options.length===3`);
    assert.deepEqual(await browser.evaluate(`fixtureRequests.map(r=>r.path)`), ['symbolic/status']);
    assert.equal(await browser.evaluate(`document.querySelector('.cyc-inspector').hidden`), true);
    assert.equal(await browser.evaluate(`document.querySelector('[aria-label="Cyc conversations"]').options[0].text`), 'New conversation');
    assert.equal(await browser.evaluate(`[...document.querySelectorAll('button')].find(b=>b.textContent==='Branch conversation').disabled`), true);
    assert.match(await browser.evaluate(`document.querySelector('.cyc-fork-reason').textContent`), /saved conversation/u);
    await fill('cyc-message', 'Keep this unsent draft');
    await click('Say something'); await phase('awaiting_input');
    const first = await browser.evaluate(`({id:cyc.getState().runId,conversation:cyc.getState().conversationId})`);
    assert.deepEqual(await browser.evaluate(`fixtureRequests.map(r=>r.path)`), ['symbolic/status', 'symbolic/start', 'symbolic/send']);
    assert.equal(await browser.evaluate(`fixtureRequests.at(-1).body.text`), 'hello');
    assert.match(await browser.evaluate(`document.querySelector('.cyc-transcript').textContent`), /Hello\. I am Cyc's limited declarative starter/u);
    assert.equal(await browser.evaluate(`document.querySelector('.cyc-message time').dateTime===new Date(fixtureLatest.events.find(e=>e.request?.input?.term?.functor==='text').time*1000).toISOString()`), true);
    assert.match(await browser.evaluate(`document.querySelector('.cyc-elapsed').textContent`), /recorded .*\(ledger\).*not recorded/u);
    assert.match(await browser.evaluate(`document.querySelector('.cyc-message time').title`), /not message acceptance or execution duration/u);
    assert.equal(await browser.evaluate(`cyc.getState().draft`), 'Keep this unsent draft');
    await browser.evaluate(`window.fixtureHoldForkReply=true`);
    await click('Branch conversation');
    await browser.wait(`typeof fixtureReleaseForkReply==='function'`);
    assert.equal(await browser.evaluate(`document.querySelector('[aria-label="Cyc conversations"]').disabled`), true);
    assert.equal(await browser.evaluate(`getComputedStyle([...document.querySelectorAll('button')].find(b=>b.textContent==='Branch conversation')).borderStyle`), 'dashed');
    await choose('');
    assert.equal(await browser.evaluate(`cyc.getState().runId`), first.id, 'selection is pinned during a fork write');
    await browser.evaluate(`cyc.deactivate();cyc.activate();fixtureReleaseForkReply()`);
    await browser.wait(`!cyc.getState().pending&&cyc.getState().runId!==${JSON.stringify(first.id)}`);
    const branch = await browser.evaluate(`({id:cyc.getState().runId,conversation:cyc.getState().conversationId,run:fixtureLatest.run})`);
    assert.equal(branch.run.source.host.lineage.parentRun, first.id);
    assert.equal(branch.run.nativeEventSequence, 0);
    assert.equal(await browser.evaluate(`cyc.getState().draft`), 'Keep this unsent draft');
    assert.equal(await browser.evaluate(`document.querySelectorAll('.cyc-inherited').length`), 2);
    assert.match(await browser.evaluate(`document.querySelector('.cyc-identity').textContent`), /conversation branch/u);
    await fill('cyc-message', 'Branch-only unsent draft');
    await browser.evaluate(`window.fixtureDropForkReply=true`);
    await click('Branch conversation');
    await browser.wait(`!cyc.getState().pending&&cyc.getState().unknownOutcome`);
    assert.equal(await browser.evaluate(`cyc.getState().runId`), branch.id, 'lost fork reply cannot replace the parent view');
    const uncertain = await browser.evaluate(`JSON.parse(localStorage.getItem('powder.cyc.pending.v1'))`);
    assert.equal(uncertain.body.conversation, branch.conversation);
    assert.notEqual(uncertain.body.newConversation, branch.conversation);
    await choose(first.id); await phase('awaiting_input');
    assert.equal(await browser.evaluate(`cyc.getState().unknownOutcome`), true, 'parent refresh cannot resolve a child receipt');
    await click('Inspect uncertain request'); await phase('awaiting_input');
    assert.equal(await browser.evaluate(`cyc.getState().conversationId`), uncertain.body.newConversation);
    assert.equal(await browser.evaluate(`cyc.getState().draft`), 'Branch-only unsent draft');
    assert.equal(await browser.evaluate(`cyc.getState().unknownOutcome`), false);
    assert.equal(await browser.evaluate(`fixtureRequests.filter(r=>r.path==='symbolic/fork').length`), 2, 'recovery only reads');
    await choose(first.id); await phase('awaiting_input');
    assert.equal(await browser.evaluate(`cyc.getState().draft`), 'Keep this unsent draft');
    const beforeNew = await browser.evaluate(`fixtureRequests.length`);
    await choose('');
    assert.equal(await browser.evaluate(`fixtureRequests.length`), beforeNew);
    assert.equal(await browser.evaluate(`cyc.getState().conversationId`), null);
    await fill('cyc-message', 'help');
    await choose(first.id); await phase('awaiting_input');
    assert.equal(await browser.evaluate(`cyc.getState().conversationId`), first.conversation);
    assert.equal(await browser.evaluate(`cyc.getState().draft`), 'Keep this unsent draft');
    await choose('');
    assert.equal(await browser.evaluate(`cyc.getState().draft`), 'help');
    await click('Send'); await phase('awaiting_input');
    assert.notEqual(await browser.evaluate(`cyc.getState().runId`), first.id);
    assert.deepEqual(await browser.evaluate(`[...document.querySelectorAll('.cyc-message')].filter(n=>n.querySelector('h3').textContent==='You → Cyc').map(n=>n.querySelector('pre').textContent)`), ['help']);
    await choose(first.id); await phase('awaiting_input');
    await fill('cyc-message', 'new todo'); await click('Send'); await phase('awaiting_form');
    assert.equal(await browser.evaluate(`[...document.querySelectorAll('button')].find(b=>b.textContent==='Branch conversation').disabled`), true);
    assert.match(await browser.evaluate(`document.querySelector('.cyc-fork-reason').textContent`), /Finish the workflow/u);
    assert.equal(await browser.evaluate(`document.querySelector('[name="title"]').maxLength`), 256);
    assert.equal(await browser.evaluate(`document.querySelector('[name="title"]').checkVisibility()`), true);
    assert.equal(await browser.evaluate(`document.querySelector('.cyc-inspector').hidden`), true);
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
    await browser.evaluate(`cyc.deactivate();cyc.activate()`); await phase('awaiting_form');
    assert.equal(await browser.evaluate(`document.querySelector('[name="title"]').value.length`), 257);
    await fill('title', 'A'.repeat(256));
    await browser.evaluate(`document.querySelector('.cyc-requests form').requestSubmit()`); await phase('running');
    await click('Continue'); await phase('awaiting_action');
    assert.match(await browser.evaluate(`document.querySelector('.cyc-fork-reason').textContent`), /Resolve the action outcome/u);
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
    const completed = await browser.evaluate(`fixtureLatest.run`);
    await click('Branch conversation'); await phase('awaiting_input');
    assert.equal(await browser.evaluate(`fixtureLatest.run.actions`), completed.actions);
    assert.equal(completed.actions, 2);
    assert.equal(await browser.evaluate(`fixtureLatest.run.steps`), completed.steps);
    assert.equal(await browser.evaluate(`fixtureLatest.events.some(e=>e.inherited&&e.action?.status==='committed')`), true);
    await click('Settings'); await click('TODOs'); await click('Refresh TODOs'); await browser.wait(`!cyc.getState().pending`);
    assert.equal(await browser.evaluate(`fixtureLatest.result.total`), 1);
    assert.equal(await browser.evaluate(`fixtureLatest.result.items[0].data.title`), 'A'.repeat(256));
    assert.equal(await browser.evaluate(`fixtureLatest.result.items[0].data.status`), 'open');
    assert.equal(await browser.evaluate(`cyc.getState().unknownOutcome`), false);
    await choose(''); await click('Knowledge');
    await browser.evaluate(`{const p=document.querySelector('[name="cyc-profile"]');p.value='loaded';p.dispatchEvent(new Event('change'))}`);
    await fill('cyc-agent', 'x_NoAuthoredAgent'); await fill('cyc-definition-mt', 'x_NoAuthoredMt');
    await fill('cyc-message', 'Custom draft stays here');
    await click('Settings'); await click('Send');
    await browser.wait(`!cyc.getState().pending&&!!cyc.getState().error`);
    assert.equal(await browser.evaluate(`cyc.getState().runId`), null);
    assert.equal(await browser.evaluate(`cyc.getState().draft`), 'Custom draft stays here');
    assert.equal(await browser.evaluate(`fixtureRequests.at(-1).body.agent`), 'x_NoAuthoredAgent');
    assert.equal(await browser.evaluate(`document.querySelectorAll('.cyc-message').length`), 0);
    await click('Settings'); await click('Knowledge');
    const authored = await browser.evaluate(`symbolicFixtureLoadedProfile`);
    await fill('cyc-agent', authored.agent); await fill('cyc-definition-mt', authored.definitionMt);
    await fill('cyc-linked-mts', authored.linkedMts.join('\n'));
    await fill('cyc-message', 'Custom profile draft is not submitted');
    await click('Settings'); await click('Say something'); await phase('gap');
    assert.equal(await browser.evaluate(`fixtureLatest.run.source.knowledgeAgent`), authored.agent);
    assert.equal(await browser.evaluate(`fixtureRequests.at(-1).body.text`), 'hello');
    assert.equal(await browser.evaluate(`cyc.getState().draft`), 'Custom profile draft is not submitted');
    assert.match(await browser.evaluate(`document.querySelector('.cyc-feedback').textContent`), /knowledge gap/u);
    assert.equal(await browser.evaluate(`[...document.querySelectorAll('.cyc-message h3')].some(n=>n.textContent==='Cyc')`), false, 'missing initiation knowledge must not fabricate an agent reply');
    assert.doesNotMatch(await browser.evaluate(`document.querySelector('.cyc-transcript').textContent`), /limited declarative starter/u);
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
  let latest, dropResponse = false, holdNextRead = false, releaseRead, holdNextWrite = false, releaseWrite, wrongNextRead = false;
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
      if (wrongNextRead) { wrongNextRead = false; reply = structuredClone(reply); reply.run.conversation = 'wrong-response-conversation'; }
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
    if (holdNextWrite && body) { holdNextWrite = false; await new Promise(resolve => { releaseWrite = resolve; }); }
    res.setHeader('Content-Type', 'application/json'); res.end(JSON.stringify(reply));
  });
  await new Promise(resolve => server.listen(0, '127.0.0.1', resolve));
  const browser = await launchChromium(process.env.LOGOS_CHROME);
  const click = label => browser.evaluate(`[...document.querySelectorAll('button')].find(b=>b.textContent===${JSON.stringify(label)}).click()`);
  const fill = (name, value) => browser.evaluate(`{const n=document.querySelector('[name="${name}"]');n.value=${JSON.stringify(value)};n.dispatchEvent(new Event('input',{bubbles:true}))}`);
  const choose = id => browser.evaluate(`{const p=document.querySelector('[aria-label="Cyc conversations"]');p.value=${JSON.stringify(id)};p.dispatchEvent(new Event('change'))}`);
  const appearance = label => browser.evaluate(`(()=>{const b=[...document.querySelectorAll('button')].find(b=>b.textContent===${JSON.stringify(label)}),s=getComputedStyle(b);return {disabled:b.disabled,background:s.backgroundColor,color:s.color,border:s.borderTopStyle,opacity:s.opacity,cursor:s.cursor,shadow:s.boxShadow,transform:s.transform}})()`);
  try {
    await browser.send('Emulation.setDeviceMetricsOverride', { width: 1280, height: 900, deviceScaleFactor: 1, mobile: false });
    await browser.send('Page.navigate', { url: `http://127.0.0.1:${server.address().port}/` });
    await browser.wait(`!!window.cyc`);
    await browser.wait(`document.querySelector('[name="cyc-profile"]').options.length===3`);
    await browser.evaluate(`(()=>{window.clockIntervals=new Set();const start=window.setInterval.bind(window),stop=window.clearInterval.bind(window);
      window.setInterval=(fn,delay,...args)=>{const id=start(fn,delay,...args);clockIntervals.add(id);return id};
      window.clearInterval=id=>{clockIntervals.delete(id);stop(id)}})()`);
    assert.deepEqual(requests.map(r => r.action), ['status'], 'mount may discover profiles but must not start or load knowledge');
    assert.deepEqual(await browser.evaluate(`({sequence:cyc.getState().sequence,error:cyc.getState().error,conversationId:cyc.getState().conversationId})`),
      { sequence: 0, error: null, conversationId: null });
    assert.equal(await browser.evaluate(`cyc.getState().settingsOpen`), false);
    assert.equal(await browser.evaluate(`document.querySelector('.cyc-chat').getBoundingClientRect().width/document.querySelector('.cyc-workspace').getBoundingClientRect().width>0.98`), true);
    await browser.wait(`(()=>{const bs=[...document.querySelectorAll('button')],s=bs.find(b=>b.textContent==='Send'),g=bs.find(b=>b.textContent==='Settings');return !g.disabled&&getComputedStyle(g).backgroundColor!==getComputedStyle(s).backgroundColor})()`);
    const disabledSend = await appearance('Send'), enabledSettings = await appearance('Settings');
    assert.equal(disabledSend.disabled, true);
    assert.equal(disabledSend.border, 'dashed', 'disabled controls have a non-color visual cue');
    assert.equal(disabledSend.opacity, '1', 'disabled labels stay readable');
    assert.equal(disabledSend.cursor, 'not-allowed');
    assert.notEqual(disabledSend.background, enabledSettings.background);
    assert.notEqual(disabledSend.color, enabledSettings.color);
    assert.equal(await browser.evaluate(`[...document.querySelectorAll('button')].some(b=>b.textContent==='Enqueue')`), false);
    assert.equal((await appearance('Say something')).disabled, false, 'explicit initiation does not need a typed draft');
    assert.match(await browser.evaluate(`document.querySelector('.cyc-control-reason').textContent`), /Write a message to enable Send/u);
    const sendCenter = await browser.evaluate(`(()=>{const b=[...document.querySelectorAll('button')].find(b=>b.textContent==='Send');b.scrollIntoView({block:'center'});const r=b.getBoundingClientRect();return {x:r.x+r.width/2,y:r.y+r.height/2}})()`);
    await browser.send('Input.dispatchMouseEvent', { type: 'mouseMoved', ...sendCenter });
    assert.deepEqual(await appearance('Send'), disabledSend, 'hover must not restore an active appearance');
    await click('Send');
    assert.deepEqual(requests.map(r => r.action), ['status'], 'disabled Send cannot create a conversation');
    assert.equal(await browser.evaluate(`document.querySelectorAll('.cyc-chat input[type="checkbox"]').length`), 0);
    await fill('cyc-message', 'Visual state check');
    await browser.wait(`[...document.querySelectorAll('button')].find(b=>b.textContent==='Send').disabled===false`);
    assert.equal((await appearance('Send')).border, 'solid', 'enabled Send regains the normal button treatment');
    await fill('cyc-message', '');
    await browser.send('Emulation.setEmulatedMedia', { features: [{ name: 'forced-colors', value: 'active' }] });
    assert.equal((await appearance('Send')).border, 'dashed', 'high contrast preserves the disabled-state cue');
    await browser.send('Emulation.setEmulatedMedia', { features: [] });
    await click('Settings'); assert.equal(await browser.evaluate(`cyc.getState().settingsOpen`), true);
    assert.equal((await appearance('Refresh state')).border, 'dashed', 'disabled secondary controls use the same treatment');
    assert.equal(await browser.evaluate(`getComputedStyle(document.querySelector('.cyc-workspace')).gridTemplateColumns.split(' ').length`), 2);
    await browser.evaluate(`document.querySelector('.cyc-inspector').dispatchEvent(new KeyboardEvent('keydown',{key:'Escape',bubbles:true}))`);
    assert.equal(await browser.evaluate(`document.activeElement.textContent`), 'Settings');
    assert.equal(await browser.evaluate(`document.activeElement.getAttribute('aria-expanded')`), 'false');
    await click('Settings');
    await browser.evaluate(`{const p=document.querySelector('[name="cyc-profile"]');p.value='loaded';p.dispatchEvent(new Event('change'))}`);
    assert.equal((await appearance('Say something')).disabled, true, 'an incomplete loaded profile cannot initiate or fall back');
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
    assert.equal(await browser.evaluate(`document.querySelector('.cyc-message-time').textContent`), 'Recorded time unavailable');
    assert.match(await browser.evaluate(`document.querySelector('.cyc-elapsed').textContent`), /time unavailable/u);
    latest.events.at(-1).time = (Date.now() + 60000) / 1000;
    await click('State'); await click('Refresh state'); await browser.wait(`!cyc.getState().pending`);
    assert.match(await browser.evaluate(`document.querySelector('.cyc-elapsed').textContent`), /elapsed unavailable \(clock differs\)/u);
    delete latest.events.at(-1).time;
    await click('Refresh state'); await browser.wait(`!cyc.getState().pending`);
    assert.match(await browser.evaluate(`document.querySelector('.cyc-elapsed').textContent`), /time unavailable/u);
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
    await choose('');
    assert.equal(await browser.evaluate(`cyc.getState().sequence`), 0);
    assert.equal(await browser.evaluate(`cyc.getState().runId`), null);
    await click('Knowledge'); await click('Start');
    await browser.wait(`cyc.getState().runId==='run:2'&&!cyc.getState().pending`);
    assert.equal(await browser.evaluate(`cyc.getState().sequence`), 0, 'sequence belongs to this conversation, not the controller lifetime');
    await fill('cyc-message', 'second draft');
    await choose('run:1');
    await browser.wait(`cyc.getState().runId==='run:1'&&!cyc.getState().pending`);
    assert.ok(await browser.evaluate(`cyc.getState().sequence`) >= observed + 1);
    assert.equal(await browser.evaluate(`document.querySelector('[name="cyc-message"]').value`), 'unsent first');
    dropResponse = true;
    await click('Send'); await browser.wait(`cyc.getState().unknownOutcome&&!cyc.getState().pending`);
    const sendCount = requests.filter(r => r.action === 'send').length;
    assert.match(await browser.evaluate(`document.querySelector('.cyc-elapsed').textContent`), /Outcome unknown/u);
    assert.equal(await browser.evaluate(`typeof JSON.parse(localStorage.getItem('powder.cyc.pending.v1')).localSubmittedAt`), 'number');
    const beforeCold = await browser.evaluate(`clockIntervals.size`);
    await browser.evaluate(`(()=>{const copy=new Map(Object.keys(localStorage).filter(k=>k.startsWith('powder.cyc.')).map(k=>[k,localStorage.getItem(k)]));
      window.coldCyc=make({active:false,storage:{getItem:k=>copy.get(k)??null,setItem:(k,v)=>copy.set(k,v)}})})()`);
    assert.equal(await browser.evaluate(`clockIntervals.size`), beforeCold, 'inactive reconstruction creates no timer');
    assert.match(await browser.evaluate(`coldCyc.element.querySelector('.cyc-elapsed').textContent`), /Elapsed unavailable after reload/u);
    await browser.evaluate(`coldCyc.destroy()`);
    assert.equal(await browser.evaluate(`clockIntervals.size`), beforeCold, 'destroying another view preserves the original timer');
    await click('Stop'); await browser.wait(`cyc.getState().status==='stopped'&&!cyc.getState().pending`);
    assert.equal(await browser.evaluate(`cyc.getState().unknownOutcome`), true, 'Stop must retain the earlier uncertain request');
    assert.equal(await browser.evaluate(`JSON.parse(localStorage.getItem('powder.cyc.pending.v1')).action`), 'send');
    await click('Inspect uncertain request'); await browser.wait(`!cyc.getState().unknownOutcome&&!cyc.getState().pending`);
    assert.equal(requests.filter(r => r.action === 'send').length, sendCount, 'recovery must inspect, never replay');
    await choose('');
    await click('Knowledge');
    const beforeProfileStart = requests.length;
    await browser.evaluate(`{const p=document.querySelector('[name="cyc-profile"]');p.value='cyc-starter-v1';p.dispatchEvent(new Event('change'))}`);
    assert.equal(requests.length, beforeProfileStart, 'profile selection executes nothing');
    await click('Start'); await browser.wait(`cyc.getState().runId==='run:3'&&!cyc.getState().pending`);
    const starterRequest = requests.filter(r => r.action === 'start').at(-1).body;
    assert.equal(starterRequest.profile, 'cyc-starter-v1');
    assert.equal('agent' in starterRequest || 'linkedMts' in starterRequest, false);
    await fill('cyc-message', 'third draft');
    holdNextRead = true; releaseRead = null;
    await click('State'); await click('Refresh state'); await browser.wait(`cyc.getState().pending`);
    for (let i = 0; !releaseRead && i < 100; i++) await new Promise(resolve => setTimeout(resolve, 10));
    assert.equal(typeof releaseRead, 'function');
    await choose('');
    assert.equal(await browser.evaluate(`cyc.getState().runId`), null);
    await fill('cyc-message', 'new draft during stale read');
    await choose('run:2'); await browser.wait(`cyc.getState().runId==='run:2'&&!cyc.getState().pending`);
    releaseRead();
    await browser.evaluate(`new Promise(resolve=>setTimeout(resolve,100))`);
    assert.equal(await browser.evaluate(`cyc.getState().runId`), 'run:2');
    assert.equal(await browser.evaluate(`cyc.getState().draft`), 'second draft');
    const secondConversation = await browser.evaluate(`cyc.getState().conversationId`);
    wrongNextRead = true; await click('Refresh state');
    await browser.wait(`!cyc.getState().pending&&cyc.getState().error?.code==='symbolic_identity_mismatch'`);
    assert.equal(await browser.evaluate(`cyc.getState().conversationId`), secondConversation);
    assert.equal(await browser.evaluate(`cyc.getState().draft`), 'second draft');
    await click('Refresh state'); await browser.wait(`!cyc.getState().pending&&!cyc.getState().error`);
    holdNextWrite = true; releaseWrite = null;
    await click('Send'); await browser.wait(`cyc.getState().pending`);
    for (let i = 0; !releaseWrite && i < 100; i++) await new Promise(resolve => setTimeout(resolve, 10));
    assert.equal(typeof releaseWrite, 'function');
    const heldRequestCount = requests.length;
    assert.match(await browser.evaluate(`document.querySelector('.cyc-elapsed').textContent`), /Elapsed \d+s since submission.*Awaiting response/u);
    const beforeClock = await browser.evaluate(`({sequence:cyc.getState().sequence,callbacks:states.length})`);
    await browser.evaluate(`window.realDateNow=Date.now;Date.now=()=>realDateNow()-86400000`);
    await browser.wait(`/Elapsed [1-9]\\d*s since submission/.test(document.querySelector('.cyc-elapsed').textContent)`);
    assert.equal(requests.length, heldRequestCount, 'the clock must not poll the API');
    assert.deepEqual(await browser.evaluate(`({sequence:cyc.getState().sequence,callbacks:states.length})`), beforeClock, 'ticks are not messages or state events');
    await browser.evaluate(`Date.now=realDateNow;cyc.deactivate()`);
    assert.equal(await browser.evaluate(`clockIntervals.size`), 0, 'inactive views do not keep a display timer');
    await browser.evaluate(`cyc.activate()`);
    assert.equal(await browser.evaluate(`clockIntervals.size`), 1, 'reactivation resumes one timer from the original monotonic anchor');
    await browser.evaluate(`Object.defineProperty(document,'hidden',{configurable:true,value:true});document.dispatchEvent(new Event('visibilitychange'))`);
    assert.equal(await browser.evaluate(`clockIntervals.size`), 0, 'a hidden document pauses the display timer');
    await browser.evaluate(`delete document.hidden;document.dispatchEvent(new Event('visibilitychange'))`);
    assert.equal(await browser.evaluate(`clockIntervals.size`), 1, 'visibility resumes exactly one timer');
    assert.equal((await appearance('Interrupt')).disabled, true);
    assert.equal((await appearance('Interrupt')).border, 'dashed');
    assert.equal((await appearance('Say something')).disabled, true);
    assert.equal((await appearance('Say something')).border, 'dashed');
    assert.match(await browser.evaluate(`document.querySelector('.cyc-control-reason').textContent`), /no enqueue queue or mid-step cancellation/u);
    assert.equal(await browser.evaluate(`document.querySelector('.cyc-control-reason').checkVisibility()`), true);
    assert.match(await browser.evaluate(`[...document.querySelectorAll('button')].find(b=>b.textContent==='Interrupt').title`), /Wait for the response/u);
    await click('Interrupt'); await click('Send'); await click('Say something');
    assert.equal(requests.length, heldRequestCount, 'disabled actions are neither executed nor queued');
    await choose('');
    assert.equal(await browser.evaluate(`cyc.getState().runId`), 'run:2', 'a write pins its conversation identity');
    releaseWrite(); await browser.wait(`!cyc.getState().pending`);
    await choose('');
    assert.equal(await browser.evaluate(`cyc.getState().draft`), 'new draft during stale read');
    dropResponse = true;
    const beforeLostStartSends = requests.filter(r => r.action === 'send').length;
    await click('Send'); await browser.wait(`cyc.getState().unknownOutcome&&!cyc.getState().pending`);
    assert.equal(requests.filter(r => r.action === 'send').length, beforeLostStartSends, 'lost Start must not send the queued text');
    assert.equal(await browser.evaluate(`cyc.getState().runId`), null);
    await click('Inspect uncertain request'); await browser.wait(`!cyc.getState().unknownOutcome&&!cyc.getState().pending`);
    assert.equal(requests.filter(r => r.action === 'send').length, beforeLostStartSends, 'recovery never resumes the Start/Send chain');
    assert.equal(await browser.evaluate(`cyc.getState().runId`), 'run:4');
    assert.equal(await browser.evaluate(`cyc.getState().draft`), 'new draft during stale read');
    await click('Send'); await browser.wait(`!cyc.getState().pending`);
    assert.equal(requests.filter(r => r.action === 'send').length, beforeLostStartSends + 1);
    await browser.send('Emulation.setDeviceMetricsOverride', { width: 390, height: 844, deviceScaleFactor: 1, mobile: true });
    assert.equal(await browser.evaluate(`document.documentElement.scrollWidth<=innerWidth`), true);
    assert.equal((await appearance('Send')).border, 'dashed', 'mobile retains the visible disabled state');
    await click('Settings');
    assert.equal(await browser.evaluate(`document.documentElement.scrollWidth<=innerWidth`), true);
    await choose(''); await fill('cyc-message', 'Persisted New conversation draft');
    await browser.evaluate(`cyc.destroy();window.cyc=make({active:false});document.querySelector('main').append(cyc.element)`);
    assert.equal(await browser.evaluate(`clockIntervals.size`), 0);
    assert.equal(await browser.evaluate(`cyc.getState().active`), false);
    assert.equal(await browser.evaluate(`document.querySelectorAll('.symbolic-agent').length`), 1);
    assert.equal(await browser.evaluate(`cyc.getState().runId`), null);
    assert.equal(await browser.evaluate(`cyc.getState().draft`), 'Persisted New conversation draft');
    assert.equal(await browser.evaluate(`cyc.getState().settingsOpen`), false);
    assert.equal(await browser.evaluate(`location.hash`), '', 'conversation and Settings choices do not navigate the shell');
    assert.equal(await browser.evaluate(`states.every((s,index)=>Number.isSafeInteger(s.sequence)&&s.sequence>=0&&typeof s.status==='string'
      &&(s.conversationId===null||typeof s.conversationId==='string')&&('error'in s)
      &&states.slice(0,index).filter(p=>p.conversationId===s.conversationId).every(p=>p.sequence<=s.sequence))`), true);
    assert.deepEqual(browser.exceptions, []);
  } catch (error) {
    error.message += `\nBrowser exceptions: ${JSON.stringify(browser.exceptions)}`; throw error;
  } finally { await browser.close(); await new Promise(resolve => server.close(resolve)); }
});
