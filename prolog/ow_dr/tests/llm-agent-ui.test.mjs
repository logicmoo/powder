import test from 'node:test';
import assert from 'node:assert/strict';
import { createServer } from 'node:http';
import { readFile } from 'node:fs/promises';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';
import { launchChromium } from './chromium.mjs';
import { modelOptions, selectedKeys, canChat } from '../web/llm-knowledge-agent.js';
const here = dirname(fileURLToPath(import.meta.url));
test('model choice never falls back and scope keys are concrete', () => {
  assert.deepEqual(modelOptions(['other'], 'missing').map(x => x.id), ['missing', 'other']);
  assert.deepEqual(selectedKeys(' x_A \nx_A\n x_B\n'), ['x_A', 'x_B']);
  assert.equal(canChat({ conversation: { status: 'ready' }, text: 'Hi', approved: false }), false);
  assert.equal(canChat({ conversation: { status: 'running' }, text: 'Hi', approved: true }), false);
  assert.equal(canChat({ conversation: { status: 'ready' }, text: 'Hi', approved: true }), true);
  assert.equal(canChat({ conversation: { status: 'failed', calls: [{ state: 'unknown' }] },
    text: 'Hi', approved: true }), false);
});
test('isolated browser: explicit model refresh, consent, snapshots and text-only controls', {
  skip: !process.env.LOGOS_CHROME, timeout: 60000,
}, async () => {
  const requests = [];
  let settings = { model: 'gpt-5.6-sol', baseURL: 'http://127.0.0.1:8801/v1', revision: 'r1',
    budgets: { rounds: 4, calls: 8, tokens: 2048, seconds: 60, historyBytes: 65536, outputBytes: 32768 } };
  let conversation;
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
          onConversationChange:value=>{window.lastConversation=value}});
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
    const action = url.pathname.slice('/api/llm/'.length); requests.push({ action, body });
    let result;
    if (action === 'settings') result = settings;
    else if (action === 'prompt') result = { content: 'Synthetic fixture prompt', revision: 'p1', rawHash: 'p1' };
    else if (action === 'models') result = { items: ['gpt-5.6-sol', 'fixture-other'], selected: settings.model, selectedAvailable: true };
    else if (action === 'settings/save') { settings = { ...settings, ...body.settings, revision: 'r2' }; result = settings; }
    else if (action === 'grounding/preview') result = { id: 'fixture-grant', hash: 'fixture-hash',
      entries: [{ material: { term: 'x_Synthetic', text: 'Synthetic approved evidence' }, evidence: [{ id: 'a-fixture', revision: 'r-fixture' }] }] };
    else if (action === 'grounding/approve') result = { id: 'fixture-grant', approved: true };
    else if (action === 'todos') result = { available: true, items: [{ title: 'Synthetic local task' }] };
    else if (action === 'start') {
      conversation = { id: 'c-fixture', identity: 'llm', status: 'ready', revision: 0, model: settings.model,
        promptHash: 'p1', messages: [], scope: body.scope, events: [], audit: [], calls: [],
        registry: { available: false, limitation: 'No fixture registry' }, todos: { available: false, reason: 'Unavailable' } };
      result = conversation;
    } else if (action === 'chat') {
      conversation = { ...conversation, status: 'running', revision: 1,
        messages: [{ role: 'user', content: body.text }, { role: 'assistant', content: '<img src=x onerror=alert(1)> fixture' }] };
      result = conversation;
    } else if (action === 'interrupt') { conversation = { ...conversation, status: 'interrupted' }; result = conversation; }
    else if (action === 'stop') { conversation = { ...conversation, status: 'closed' }; result = conversation; }
    else if (action === 'conversation') result = conversation;
    else { res.statusCode = 400; result = { error: { message: 'Fixture action not implemented' } }; }
    res.setHeader('Content-Type', 'application/json'); res.end(JSON.stringify(result));
  });
  await new Promise(resolve => server.listen(0, '127.0.0.1', resolve));
  const browser = await launchChromium(process.env.LOGOS_CHROME);
  const click = label => browser.evaluate(`[...document.querySelectorAll('button')].find(b=>b.textContent===${JSON.stringify(label)}).click()`);
  try {
    await browser.send('Page.navigate', { url: `http://127.0.0.1:${server.address().port}/` });
    await browser.wait(`document.querySelector('[name="llm-model"]')?.value==='gpt-5.6-sol'`);
    assert.deepEqual(requests.map(r => r.action).sort(), ['prompt', 'settings']);
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
    await browser.wait(`document.querySelector('.llm-feedback').textContent.includes('Preview and approve')`);
    assert.equal(requests.some(r => r.action === 'start'), false);
    await click('Preview grounding locally');
    await browser.wait(`document.querySelector('.llm-grounding-preview').textContent.includes('Synthetic approved evidence')`);
    assert.equal(requests.some(r => r.action === 'chat' || r.action === 'start'), false);
    assert.equal(requests.find(r => r.action === 'grounding/preview').body.requests.length, 2);
    await click('Approve exactly this nonsensitive preview');
    await browser.wait(`document.querySelector('.llm-feedback').textContent.includes('Exact preview approved')`);
    await browser.evaluate('teacher.deactivate();teacher.activate()');
    await click('Start new conversation');
    await browser.wait(`document.body.textContent.includes('prompt p1')`);
    assert.equal(requests.find(r => r.action === 'start').body.scope.grant, 'fixture-grant');
    await click('Todos'); await click('Refresh local TODOs');
    await browser.wait(`document.querySelector('.llm-local-todos').textContent.includes('Synthetic local task')`);
    assert.equal(requests.some(r => r.action === 'chat'), false);
    assert.equal(await browser.evaluate('location.hash'), '#/agent-chips?active=teacher');
    assert.equal(await browser.evaluate('lastConversation.agent'), 'llm-knowledge');
    await browser.evaluate(`const t=document.querySelector('[name="llm-message"]');t.value='Synthetic fixture';t.dispatchEvent(new Event('input'))`);
    assert.equal(await browser.evaluate(`[...document.querySelectorAll('button')].find(b=>b.textContent==='Chat').disabled`), true);
    await browser.evaluate(`const c=document.querySelector('[name="llm-export-consent"]');c.checked=true;c.dispatchEvent(new Event('change'))`);
    await click('Chat');
    await browser.wait(`document.body.textContent.includes('<img src=x onerror=alert(1)> fixture')`);
    assert.equal(await browser.evaluate(`document.querySelectorAll('.llm-message img').length`), 0);
    await click('Events');
    await browser.evaluate(`document.querySelector('[name="llm-message"]').value='Unsent teacher draft';
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
    await click('Raw JSON');
    assert.equal(await browser.evaluate(`document.querySelector('[id$="-raw-json"]').hidden`), false);
    for (const width of [1280, 390]) {
      await browser.send('Emulation.setDeviceMetricsOverride', { width, height: 900, deviceScaleFactor: 1, mobile: width < 500 });
      assert.equal(await browser.evaluate(`document.documentElement.scrollWidth<=innerWidth`), true);
    }
    assert.equal(await browser.evaluate(`document.querySelectorAll('audio,video,[name*=voice],[name*=microphone]').length`), 0);
    assert.deepEqual(browser.exceptions, []);
  } finally { await browser.close(); server.closeAllConnections(); await new Promise(resolve => server.close(resolve)); }
});
