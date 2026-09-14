import test from 'node:test';
import assert from 'node:assert/strict';
import { createServer } from 'node:http';
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
test('isolated browser lifecycle, separate drafts, forms, evidence and uncertain recovery', {
  skip: !process.env.LOGOS_CHROME, timeout: 90000,
}, async () => {
  const requests = [], runs = new Map(), receipts = new Map();
  let latest, dropResponse = false;
  const server = createServer(async (req, res) => {
    const url = new URL(req.url, 'http://127.0.0.1');
    if (url.pathname === '/') {
      res.setHeader('Content-Type', 'text/html');
      res.end(`<!doctype html><html lang="en"><meta name="viewport" content="width=device-width"><title>Cyc isolated fixture</title>
        <link rel="stylesheet" href="/style.css"><main></main><script type="module">
        import {createSymbolicAgent} from '/symbolic-agent.js';
        function element(tag,props={},...children){const n=document.createElement(tag);
          for(const[k,v]of Object.entries(props)){if(v===undefined)continue;
            if(k.startsWith('on'))n.addEventListener(k.slice(2),v);else if(k in n)n[k]=v;else n.setAttribute(k,v)}
          for(const c of children.flat(Infinity))if(c!==null&&c!==undefined&&c!==false)n.append(c instanceof Node?c:document.createTextNode(String(c)));return n;}
        const api=async(path,params={},options={})=>{const u=new URL('/api/'+path,location.href);
          for(const[k,v]of Object.entries(params))u.searchParams.set(k,v);
          const r=await fetch(u,{...options,headers:{'Content-Type':'application/json'},body:options.body?JSON.stringify(options.body):undefined});
          const b=await r.json();if(!r.ok)throw Object.assign(Error(b.error.message),{status:r.status});return b;};
        const host={api,element,button:(text,click,className='button')=>element('button',{type:'button',className,onclick:click},text),
          heading:(title,body)=>element('header',{className:'page-heading'},element('div',{},element('h1',{},title),element('p',{},body)))};
        window.make=options=>createSymbolicAgent(host,options);
        window.cyc=make({onStateChange:value=>window.lastState=value});document.querySelector('main').append(cyc.element);
        </script></html>`);
      return;
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
    if (action === 'start') {
      if (body.agent === 'x_Unavailable') {
        res.statusCode = 422; reply = { error: { code: 'knowledge_unavailable', message: 'Loaded agent definition unavailable' } };
      } else {
        latest = { run: { id: `run:${runs.size + 1}`, conversation: body.conversation, revision: 'r1',
          phase: 'awaiting_input', status: 'created', steps: 0, actions: 0, turns: 0,
          source: { knowledgeAgent: body.agent, definitionMt: body.definitionMt },
          state: wire(symbol('x_AwaitCommand')), pending: null, knowledge: 'snapshot_bound' },
        events: [], eventTotal: 0 };
        runs.set(latest.run.id, latest); reply = latest;
      }
    } else if (action === 'request-status') reply = { receipt: receipts.get(url.searchParams.get('callId')) ?? { status: 'unknown' } };
    else if (action === 'conversation') reply = runs.get(url.searchParams.get('id'));
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
    assert.equal(requests.length, 0, 'mount must not create a run or load knowledge');
    await fill('cyc-agent', 'x_Unavailable'); await fill('cyc-definition-mt', 'x_DefMt');
    await fill('cyc-linked-mts', 'x_GrammarMt\nx_GrammarMt');
    await click('Start'); await browser.wait(`document.body.textContent.includes('Loaded agent definition unavailable')`);
    assert.equal(await browser.evaluate(`cyc.getState().unknownOutcome`), false);
    await fill('cyc-agent', 'x_TestAgent'); await click('Start');
    await browser.wait(`cyc.getState().runId==='run:1'&&!cyc.getState().pending`);
    assert.deepEqual(requests.filter(r => r.action === 'start').at(-1).body.linkedMts, ['x_GrammarMt']);
    await fill('cyc-message', 'draft kept 😀');
    const count = requests.length;
    await browser.evaluate(`cyc.deactivate();cyc.activate()`);
    assert.equal(requests.length, count);
    assert.equal(await browser.evaluate(`document.querySelector('[name="cyc-message"]').value`), 'draft kept 😀');
    await click('Send'); await browser.wait(`!cyc.getState().pending&&document.querySelector('.cyc-transcript').textContent.includes('known response')`);
    assert.equal(await browser.evaluate(`document.querySelectorAll('.cyc-transcript img').length`), 0);
    assert.equal(await browser.evaluate(`document.querySelector('[name="cyc-message"]').value`), '');
    await click('Proofs'); assert.match(await browser.evaluate(`document.getElementById(document.querySelector('[role="tab"][aria-selected="true"]').getAttribute('aria-controls')).textContent`), /Event 1/u);
    await click('TODOs'); await click('Refresh TODOs');
    await browser.wait(`document.body.textContent.includes('Actual fixture application record')`);
    await fill('cyc-message', 'form please'); await click('Send');
    await browser.wait(`document.querySelector('[name="note"]')`);
    await browser.evaluate(`document.querySelector('[name="note"]').value='Verified input';document.querySelector('.cyc-requests form').requestSubmit()`);
    await browser.wait(`requestsDone=cyc.getState().status==='awaiting_input'&&!cyc.getState().pending`);
    assert.deepEqual(requests.find(r => r.action === 'form').body.values, { note: 'Verified input' });
    await fill('cyc-message', 'approval please'); await click('Send');
    await browser.wait(`document.body.textContent.includes('Approval adapter unavailable')`);
    assert.equal(requests.some(r => r.action === 'approval'), false);
    await click('Interrupt'); await browser.wait(`cyc.getState().status==='interrupted'&&!cyc.getState().pending`);
    await click('Resume'); await browser.wait(`cyc.getState().status==='awaiting_input'&&!cyc.getState().pending`);
    await fill('cyc-message', 'unsent first');
    await click('Knowledge'); await click('Start');
    await browser.wait(`cyc.getState().runId==='run:2'&&!cyc.getState().pending`);
    await fill('cyc-message', 'second draft');
    await browser.evaluate(`const p=document.querySelector('[aria-label="Cyc conversations"]');p.value='run:1';p.dispatchEvent(new Event('change'))`);
    await browser.wait(`cyc.getState().runId==='run:1'&&!cyc.getState().pending`);
    assert.equal(await browser.evaluate(`document.querySelector('[name="cyc-message"]').value`), 'unsent first');
    dropResponse = true;
    await click('Send'); await browser.wait(`cyc.getState().unknownOutcome&&!cyc.getState().pending`);
    const sendCount = requests.filter(r => r.action === 'send').length;
    await click('Inspect uncertain request'); await browser.wait(`!cyc.getState().unknownOutcome&&!cyc.getState().pending`);
    assert.equal(requests.filter(r => r.action === 'send').length, sendCount, 'recovery must inspect, never replay');
    await click('Stop'); await browser.wait(`cyc.getState().status==='stopped'&&!cyc.getState().pending`);
    await browser.send('Emulation.setDeviceMetricsOverride', { width: 390, height: 844, deviceScaleFactor: 1, mobile: true });
    assert.equal(await browser.evaluate(`document.documentElement.scrollWidth<=innerWidth`), true);
    await browser.evaluate(`cyc.destroy();window.cyc=make({active:false});document.querySelector('main').append(cyc.element)`);
    assert.equal(await browser.evaluate(`cyc.getState().active`), false);
    assert.equal(await browser.evaluate(`document.querySelectorAll('.symbolic-agent').length`), 1);
    assert.deepEqual(browser.exceptions, []);
  } catch (error) {
    error.message += `\nBrowser exceptions: ${JSON.stringify(browser.exceptions)}`; throw error;
  } finally { await browser.close(); await new Promise(resolve => server.close(resolve)); }
});
