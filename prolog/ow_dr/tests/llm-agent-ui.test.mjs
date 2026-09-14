import test from 'node:test';
import assert from 'node:assert/strict';
import { createServer } from 'node:http';
import { readFile } from 'node:fs/promises';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';
import { launchChromium } from './chromium.mjs';
import { modelOptions, selectedKeys, canChat, teacherDrafts } from '../web/llm-knowledge-agent.js';
const here = dirname(fileURLToPath(import.meta.url));
test('model choice never falls back and scope keys are concrete', () => {
  assert.deepEqual(modelOptions(['other'], 'missing').map(x => x.id), ['missing', 'other']);
  assert.deepEqual(selectedKeys(' x_A \nx_A\n x_B\n'), ['x_A', 'x_B']);
  assert.equal(canChat({ conversation: { status: 'ready' }, text: 'Hi', approved: false }), false);
  assert.equal(canChat({ conversation: { status: 'running' }, text: 'Hi', approved: true }), false);
  assert.equal(canChat({ conversation: { status: 'ready' }, text: 'Hi', approved: true }), true);
  assert.equal(canChat({ conversation: { status: 'failed', calls: [{ state: 'unknown' }] },
    text: 'Hi', approved: true }), false);
  assert.equal(canChat({ conversation: { status: 'ready', scope: {
    terms: [], readMts: ['x_UnapprovedMt'], writeMts: [], grant: null,
  } }, text: 'Hi', approved: false }), false);
  assert.equal(canChat({ conversation: { status: 'outcome_unknown' }, text: 'Hi', approved: true }), false);
});
test('draft persistence isolates conversations and cannot restore consent or malformed data', () => {
  const store = new Map(), storage = { getItem: key => store.get(key), setItem: (key, value) => store.set(key, value) };
  const drafts = teacherDrafts(storage);
  drafts.write('one', 'First 😀'); drafts.write('two', 'Second');
  assert.equal(drafts.read('one'), 'First 😀');
  assert.equal(drafts.read('two'), 'Second');
  assert.deepEqual(JSON.parse(store.get('powder.teacher.draft.v1:one')), { text: 'First 😀' });
  storage.setItem('powder.teacher.draft.v1:one', '{"text":"Restored","approved":true,"grant":"old"}');
  assert.equal(drafts.read('one'), 'Restored');
  storage.setItem('powder.teacher.draft.v1:one', 'invalid');
  assert.equal(drafts.read('one'), '');
  assert.equal(teacherDrafts({ getItem() { throw Error('blocked'); } }).read('one'), '');
  assert.equal(teacherDrafts({ setItem() { throw Error('quota'); } }).write('one', 'a'), false);
});
test('isolated browser: exact consent, model selection, drafts, history and local controls', {
  skip: !process.env.LOGOS_CHROME, timeout: 60000,
}, async () => {
  const requests = [];
  let settings = { model: 'gpt-5.6-sol', baseURL: 'http://127.0.0.1:8801/v1', revision: 'r1',
    budgets: { rounds: 4, calls: 8, tokens: 2048, seconds: 60, historyBytes: 65536, outputBytes: 32768 } };
  let conversation;
  let failReads = false;
  let failSettings = false;
  const conversations = new Map();
  const server = createServer(async (req, res) => {
    const url = new URL(req.url, 'http://localhost');
    if (url.pathname === '/') {
      res.setHeader('Content-Type', 'text/html');
      res.end(`<!doctype html><html lang="en"><meta name="viewport" content="width=device-width"><title>LLM fixture</title>
        <link rel="stylesheet" href="/style.css"><main></main><script type="module">
        import {createLLMKnowledgeAgent} from '/llm-knowledge-agent.js';
        function element(tag, props={}, ...children) {const n=document.createElement(tag);
          for(const [k,v] of Object.entries(props)) {if(k.startsWith('on'))n.addEventListener(k.slice(2),v);
            else if(k in n)n[k]=v;else n.setAttribute(k,v)}
          for(const c of children.flat(Infinity))if(c!==null&&c!==undefined&&c!==false)n.append(c instanceof Node?c:document.createTextNode(String(c))); return n;}
        const api=async(path,params={},options={})=>{const u=new URL('/api/'+path,location.href);
          for(const[k,v]of Object.entries(params))u.searchParams.set(k,v);
          const r=await fetch(u,{...options,headers:{'Content-Type':'application/json'},body:options.body?JSON.stringify(options.body):undefined});
          const b=await r.json();if(!r.ok)throw Error(b.error.message);return b;};
        window.controller=new AbortController();
        const host={api,element,
          button:(text,click,className='button')=>element('button',{type:'button',className,onclick:click},text),
          heading:(title,body)=>element('header',{className:'page-heading'},element('div',{},element('h1',{},title),element('p',{},body)))};
        window.teacher=await createLLMKnowledgeAgent(host,{signal:controller.signal,
          onConversationChange:value=>{window.lastConversation=value},
          onStateChange:value=>{window.lastState=value}});
        window.createTeacher=options=>createLLMKnowledgeAgent(host,options);
        document.querySelector('main').append(teacher.element);
        </script></html>`);
      return;
    }
    if (['/style.css', '/llm-knowledge-agent.css', '/llm-knowledge-agent.js'].includes(url.pathname)) {
      res.setHeader('Content-Type', url.pathname.endsWith('.js') ? 'text/javascript' : 'text/css');
      res.end(await readFile(join(here, '..', 'web', url.pathname.slice(1)))); return;
    }
    if (!url.pathname.startsWith('/api/llm/')) { res.statusCode = 404; res.end(); return; }
    let text = ''; for await (const chunk of req) text += chunk;
    const body = text ? JSON.parse(text) : null;
    const action = url.pathname.slice('/api/llm/'.length);
    requests.push({ action, body, params: Object.fromEntries(url.searchParams) });
    let result;
    if (action === 'settings') {
      if (failSettings) { res.statusCode = 503; result = { error: { message: 'Synthetic initial disconnection' } }; }
      else result = settings;
    }
    else if (action === 'prompt') result = { content: 'Synthetic fixture prompt', revision: 'p1', rawHash: 'p1' };
    else if (action === 'models') result = { items: ['gpt-5.6-sol', 'fixture-other'], selected: settings.model, selectedAvailable: true };
    else if (action === 'settings/save') { settings = { ...settings, ...body.settings, revision: 'r2' }; result = settings; }
    else if (action === 'grounding/preview') result = { id: 'fixture-grant', hash: 'fixture-hash',
      binding: { ...body, model: settings.model, promptHash: 'p1', settingsRevision: settings.revision,
        provider: settings.baseURL }, messages: [{ role: 'user', content: body.text }], tools: [],
      expiresAt: Date.now() / 1000 + 300, notice: 'Synthetic exact local preview.',
      entries: [{ material: { term: 'x_Synthetic', text: 'Synthetic approved evidence' }, evidence: [{ id: 'a-fixture', revision: 'r-fixture' }] }] };
    else if (action === 'grounding/approve') result = { id: 'fixture-grant', status: 'approved' };
    else if (action === 'conversations') result = { items: [...conversations.values()], total: conversations.size };
    else if (action === 'todos') result = { available: true, items: [{ title: 'Synthetic local task' }],
      undoActions: [{ action: 'kee_undo', changeset: 'fixture-change', revision: 'fixture-revision' }] };
    else if (action === 'todos/undo') result = { committed: true, changeset: 'fixture-undo' };
    else if (action === 'receipt') result = { status: 'unknown', callId: url.searchParams.get('callId'),
      localState: 'unknown', commit: null, notice: 'Unknown may still commit. No retry or unblocking.' };
    else if (action === 'start') {
      conversation = { id: `c-fixture${conversations.size ? `-${conversations.size}` : ''}`,
        createdAt: Date.now() / 1000, identity: 'llm', status: 'ready', revision: 0, sequence: 0, model: settings.model,
        promptHash: 'p1', messages: [], scope: body.scope, events: [], audit: [], calls: [],
        registry: { available: false, limitation: 'No fixture registry' }, todos: { available: false, reason: 'Unavailable' } };
      result = conversation;
      conversations.set(conversation.id, conversation);
    } else if (action === 'chat') {
      conversation = { ...conversation, status: 'running', revision: 1, sequence: 1,
        calls: [{ id: 'synthetic-recorded-call', name: 'kee_todo_create', state: 'unknown', receiptInspectable: true }],
        messages: [{ role: 'user', content: body.text }, { role: 'assistant', content: '<img src=x onerror=alert(1)> fixture' }] };
      result = conversation;
    } else if (action === 'interrupt') { conversation = { ...conversation, status: 'interrupted', sequence: conversation.sequence + 1 }; result = conversation; }
    else if (action === 'stop') { conversation = { ...conversation, status: 'closed', sequence: conversation.sequence + 1 }; result = conversation; }
    else if (action === 'conversation') {
      if (failReads) { res.statusCode = 503; result = { error: { message: 'Synthetic disconnected transport' } }; }
      else result = conversations.get(url.searchParams.get('id'))?.id === conversation.id
        ? conversation : conversations.get(url.searchParams.get('id'));
    }
    else { res.statusCode = 400; result = { error: { message: 'Fixture action not implemented' } }; }
    res.setHeader('Content-Type', 'application/json'); res.end(JSON.stringify(result));
  });
  await new Promise(resolve => server.listen(0, '127.0.0.1', resolve));
  const browser = await launchChromium(process.env.LOGOS_CHROME);
  const click = label => browser.evaluate(`[...document.querySelectorAll('button')].find(b=>b.textContent===${JSON.stringify(label)}).click()`);
  try {
    await browser.send('Page.navigate', { url: `http://127.0.0.1:${server.address().port}/` });
    await browser.wait(`document.querySelector('[name="llm-model"]')?.value==='gpt-5.6-sol'`);
    await browser.wait(`document.querySelector('.llm-history p').textContent.includes('0 of 0')`);
    assert.deepEqual(requests.map(r => r.action).sort(), ['conversations', 'prompt', 'settings']);
    await click('Refresh models');
    await browser.wait(`document.querySelector('[name="llm-model"]').options.length===2`);
    await browser.evaluate(`document.querySelector('[name="llm-model"]').value='fixture-other'`);
    await click('Save agent settings');
    await browser.wait(`document.body.textContent.includes('Agent settings saved')`);
    assert.equal(settings.model, 'fixture-other');
    assert.equal(requests.some(r => r.action === 'chat'), false);
    await browser.evaluate(`history.replaceState(null,'','/#/agent-chips?active=teacher')`);
    await browser.evaluate(`for(const [name,value] of [['llm-term-keys','x_Synthetic'],['llm-read-mts','x_FixtureMt']]) {
      const input=document.querySelector('[name="'+name+'"]');input.value=value;input.dispatchEvent(new Event('input'));}`);
    await click('Start new conversation');
    await browser.wait(`teacher.getState().conversationId==='c-fixture'`);
    await browser.wait(`document.querySelector('.llm-feedback').textContent.includes('Conversation started')`);
    assert.equal(await browser.evaluate('teacher.getState().sequence'), 0);
    assert.equal(await browser.evaluate('teacher.getState().error'), null);
    const readyReads = requests.filter(r => r.action === 'conversation').length;
    await browser.evaluate('teacher.deactivate();teacher.activate();new Promise(resolve=>setTimeout(resolve,300))');
    assert.ok(requests.filter(r => r.action === 'conversation').length > readyReads, 'reactivation reads even a ready conversation');
    assert.equal(await browser.evaluate('teacher.getState().sequence'), 0, 'a refresh is not a new event');
    await browser.evaluate(`const t=document.querySelector('[name="llm-message"]');t.value='Synthetic fixture';t.dispatchEvent(new Event('input'))`);
    await click('Preview grounding locally');
    await browser.wait(`document.querySelector('.llm-grounding-preview').textContent.includes('Synthetic approved evidence')`);
    assert.equal(requests.some(r => r.action === 'chat'), false);
    assert.equal(requests.find(r => r.action === 'grounding/preview').body.requests.length, 2);
    assert.equal(requests.find(r => r.action === 'grounding/preview').body.conversation, 'c-fixture');
    assert.equal(await browser.evaluate(`[...document.querySelectorAll('button')].find(b=>b.textContent==='Approve exact preview').disabled`), true);
    await click('Approve exact preview');
    assert.equal(requests.some(r => r.action === 'grounding/approve'), false);
    await browser.evaluate('teacher.deactivate();teacher.activate()');
    assert.equal(await browser.evaluate(`document.querySelector('.llm-grounding-preview').textContent.includes('Synthetic approved evidence')`), true);
    assert.deepEqual(requests.find(r => r.action === 'start').body.scope,
      { terms: ['x_Synthetic'], readMts: ['x_FixtureMt'], writeMts: [], grant: null });
    await click('Todos'); await click('Refresh local TODOs');
    await browser.wait(`document.querySelector('.llm-local-todos').textContent.includes('Synthetic local task')`);
    assert.equal(requests.some(r => r.action === 'chat'), false);
    await browser.evaluate(`[...teacher.element.querySelectorAll('button')].find(b=>b.textContent.startsWith('Undo ')).click()`);
    await browser.wait(`document.querySelector('.llm-feedback').textContent.includes('Local changeset committed')`);
    assert.equal(requests.find(r => r.action === 'todos/undo').body.id, 'c-fixture');
    assert.equal(requests.find(r => r.action === 'todos/undo').body.action, 'kee_undo');
    await click('Preview this turn locally');
    await browser.wait(`document.querySelector('.llm-feedback').textContent.includes('Local preview ready')`);
    assert.equal(await browser.evaluate('location.hash'), '#/agent-chips?active=teacher');
    assert.equal(await browser.evaluate('lastConversation.agent'), 'llm-knowledge');
    assert.equal(await browser.evaluate(`[...document.querySelectorAll('button')].find(b=>b.textContent==='Chat').disabled`), true);
    await browser.evaluate(`const c=document.querySelector('[name="llm-export-consent"]');c.checked=true;c.dispatchEvent(new Event('change'))`);
    await click('Approve exact preview');
    await browser.wait(`[...document.querySelectorAll('button')].find(b=>b.textContent==='Chat').disabled===false`);
    await click('Chat');
    await browser.wait(`document.body.textContent.includes('<img src=x onerror=alert(1)> fixture')`);
    assert.equal(await browser.evaluate(`document.querySelectorAll('.llm-message img').length`), 0);
    await click('Audit'); await click('Inspect durable receipt');
    await browser.wait(`document.querySelector('.llm-local-receipt').textContent.includes('Observed: unknown')`);
    assert.equal(requests.find(r => r.action === 'receipt').params.callId, 'synthetic-recorded-call');
    assert.equal(requests.filter(r => r.action === 'chat').length, 1);
    assert.equal(requests.find(r => r.action === 'chat').body.grant, 'fixture-grant');
    assert.equal(await browser.evaluate('lastState.status'), 'running');
    assert.equal(await browser.evaluate('lastState.sequence'), 1);
    await click('Events');
    await browser.evaluate(`document.querySelector('[name="llm-message"]').value='Unsent teacher draft';
      document.querySelector('[name="llm-message"]').dispatchEvent(new Event('input'));
      document.querySelector('[name="llm-prompt"]').value='Uncommitted prompt draft';
      document.querySelector('[name="llm-term-keys"]').value='x_UnsentScope';
      document.querySelector('[name="llm-rounds"]').value='6';
      teacher.deactivate()`);
    const pausedRequests = requests.length;
    await browser.evaluate('new Promise(resolve=>setTimeout(resolve,1800))');
    assert.equal(requests.length, pausedRequests, 'inactive chip must not keep polling');
    assert.equal(await browser.evaluate('teacher.element.hidden'), true);
    assert.equal(await browser.evaluate('teacher.getState().disposed'), false);
    assert.equal(requests.some(r => ['stop', 'interrupt'].includes(r.action)), false);
    await browser.evaluate('teacher.activate()');
    assert.equal(await browser.evaluate(`document.querySelector('[name="llm-message"]').value`), 'Unsent teacher draft');
    assert.equal(await browser.evaluate(`document.querySelector('[name="llm-prompt"]').value`), 'Uncommitted prompt draft');
    assert.equal(await browser.evaluate(`document.querySelector('[name="llm-rounds"]').value`), '6');
    assert.equal(await browser.evaluate(`document.querySelector('[name="llm-term-keys"]').value`), 'x_UnsentScope');
    assert.equal(await browser.evaluate(`[...teacher.element.querySelectorAll('[role="tab"]')].find(b=>b.textContent==='Events').getAttribute('aria-selected')`), 'true');
    assert.equal(await browser.evaluate(`teacher.element.querySelector('.llm-local-todos').textContent.includes('Synthetic local task')`), true);
    assert.equal(await browser.evaluate(`teacher.element.querySelector('.llm-local-receipt').textContent.includes('Observed: unknown')`), true);
    await browser.evaluate(`(async()=>{window.otherTeacher=await createTeacher({active:false});
      document.querySelector('main').append(otherTeacher.element)})()`);
    assert.equal(await browser.evaluate(`otherTeacher.getState().conversationId`), null);
    assert.equal(await browser.evaluate(`teacher.getState().conversationId`), 'c-fixture');
    assert.equal(await browser.evaluate(`const ids=[...document.querySelectorAll('[id]')].map(e=>e.id);new Set(ids).size===ids.length`), true);
    await browser.evaluate('otherTeacher.destroy()');
    assert.equal(await browser.evaluate('teacher.getState().disposed'), false);
    assert.equal(requests.filter(r => r.action === 'chat').length, 1);
    await click('Interrupt turn');
    await browser.wait(`document.body.textContent.includes('interrupted')`);
    await browser.evaluate('teacher.deactivate()');
    const beforeIdleRefresh = requests.length;
    conversation = { ...conversation, status: 'closed', revision: conversation.revision + 1,
      sequence: conversation.sequence + 1 };
    await browser.evaluate('teacher.activate()');
    await browser.wait(`teacher.getState().status==='closed'&&teacher.getState().sequence===3`);
    assert.equal(await browser.evaluate('lastState.sequence'), 3);
    assert.ok(requests.slice(beforeIdleRefresh).every(r => r.action === 'conversation'),
      'resuming a completed view reads newer remote state without starting or replaying work');
    await click('Raw JSON');
    assert.equal(await browser.evaluate(`document.querySelector('[id$="-raw-json"]').hidden`), false);
    for (const width of [1280, 390]) {
      await browser.send('Emulation.setDeviceMetricsOverride', { width, height: 900, deviceScaleFactor: 1, mobile: width < 500 });
      assert.equal(await browser.evaluate(`document.documentElement.scrollWidth<=innerWidth`), true);
    }
    assert.equal(await browser.evaluate(`document.querySelectorAll('audio,video,[name*=voice],[name*=microphone]').length`), 0);
    failReads = true;
    await click('Reconnect status');
    await browser.wait(`teacher.getState().status==='disconnected'`);
    assert.equal(await browser.evaluate('lastState.connection'), 'disconnected');
    assert.equal(await browser.evaluate('typeof lastState.error'), 'string');
    const beforeReconnectSequence = await browser.evaluate('teacher.getState().sequence');
    failReads = false;
    await click('Reconnect status');
    await browser.wait(`document.querySelector('.llm-feedback').textContent.includes('Status reconnected')`);
    assert.equal(await browser.evaluate('teacher.getState().sequence'), beforeReconnectSequence);
    assert.equal(await browser.evaluate('teacher.getState().error'), null);
    assert.equal(requests.filter(r => r.action === 'chat').length, 1);
    await browser.evaluate(`(async()=>{teacher.destroy();window.restored=await createTeacher({
      route:{params:new URLSearchParams('conversation=c-fixture')},active:false});
      document.querySelector('main').append(restored.element)})()`);
    assert.equal(await browser.evaluate(`restored.element.querySelector('[name="llm-message"]').value`), 'Unsent teacher draft');
    assert.equal(await browser.evaluate(`restored.element.querySelector('[name="llm-export-consent"]').checked`), false);
    assert.equal(await browser.evaluate(`[...restored.element.querySelectorAll('button')].find(b=>b.textContent==='Chat').disabled`), true);
    assert.equal(requests.filter(r => r.action === 'chat').length, 1);
    await click('Start new conversation');
    await browser.wait(`restored.getState().conversationId==='c-fixture-1'`);
    await browser.wait(`document.querySelector('.llm-history p').textContent.includes('2 of 2')`);
    assert.equal(await browser.evaluate('restored.getState().sequence'), 0, 'the new conversation has its own event count');
    assert.equal(await browser.evaluate(`restored.element.querySelector('[name="llm-message"]').value`), '');
    await browser.evaluate(`const input=restored.element.querySelector('[name="llm-message"]');
      input.value='Second isolated draft';input.dispatchEvent(new Event('input'));
      restored.element.querySelector('[name="llm-history"]').value='c-fixture'`);
    await click('Open conversation');
    await browser.wait(`restored.getState().conversationId==='c-fixture'`);
    assert.equal(await browser.evaluate('restored.getState().sequence'), 3, 'a stale history response cannot reduce the conversation event count');
    assert.equal(await browser.evaluate(`restored.element.querySelector('[name="llm-message"]').value`), 'Unsent teacher draft');
    assert.equal(await browser.evaluate(`restored.element.querySelector('[name="llm-export-consent"]').checked`), false);
    failSettings = true;
    await browser.evaluate(`(async()=>{window.failedTeacher=await createTeacher({active:false});
      document.querySelector('main').append(failedTeacher.element)})()`);
    assert.equal(await browser.evaluate(`failedTeacher.getState().connection`), 'disconnected');
    failSettings = false;
    await browser.evaluate(`[...failedTeacher.element.querySelectorAll('button')].find(b=>b.textContent==='Reconnect status').click()`);
    await browser.wait(`failedTeacher.getState().connection==='connected'`);
    assert.equal(requests.filter(r => r.action === 'chat').length, 1);
    await browser.evaluate('failedTeacher.destroy()');
    assert.deepEqual(browser.exceptions, []);
  } catch (error) { console.error(browser.exceptions); throw error; }
  finally { await browser.close(); server.closeAllConnections(); await new Promise(resolve => server.close(resolve)); }
});
