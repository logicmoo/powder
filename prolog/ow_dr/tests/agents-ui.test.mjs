import test from 'node:test';
import assert from 'node:assert/strict';
import { createServer } from 'node:http';
import { readFile } from 'node:fs/promises';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';
import { launchChromium } from './chromium.mjs';
import { AGENT_ROLES, agentKey, unreadState } from '../web/agents.js';

const here = dirname(fileURLToPath(import.meta.url));
test('four roles and unread cursors are independent of polls and conversation resets', () => {
  assert.deepEqual(AGENT_ROLES.map(role => role.id), ['teacher', 'cyc', 'copilot', 'codex']);
  assert.equal(agentKey('untrusted'), 'teacher');
  const seen = unreadState({}, { conversationId: 'a', sequence: 10 }, true);
  assert.equal(unreadState(seen, { conversationId: 'a', sequence: 10 }).unread, 0);
  assert.equal(unreadState(seen, { conversationId: 'a', sequence: 12 }).unread, 2);
  assert.equal(unreadState(seen, { conversationId: 'b', sequence: 2 }).unread, 2);
  assert.equal(unreadState(seen, { conversationId: 'a', sequence: 9 }).unread, 0);
  assert.equal(unreadState(seen, { conversationId: 'a', sequence: 12 }, true).unread, 0);
});

test('four-chip workspace keeps separate live controllers, drafts, errors and keyboard selection', {
  skip: !process.env.LOGOS_CHROME, timeout: 60000,
}, async () => {
  const server = createServer(async (request, response) => {
    const url = new URL(request.url, 'http://localhost');
    if (url.pathname === '/') {
      response.setHeader('Content-Type', 'text/html');
      response.end(`<!doctype html><html lang="en"><meta name="viewport" content="width=device-width">
        <title>Four agent controller fixture</title><link rel="stylesheet" href="/agents.css">
        <main></main><script type="module">
        import {createAgentWorkspace,AGENT_ROLES} from '/agents.js';
        function element(tag,props={},...children) {
          const node=document.createElement(tag);
          for(const [key,value]of Object.entries(props)) {
            if(key.startsWith('on'))node.addEventListener(key.slice(2),value);
            else if(key in node)node[key]=value;else node.setAttribute(key,value);
          }
          for(const child of children.flat(Infinity))if(child!=null)node.append(child);
          return node;
        }
        const host={element,heading:(title,text)=>element('header',{},element('h1',{},title),text),
          button:(label,onclick,className)=>element('button',{type:'button',onclick,className},label),
          api:async()=>({operatorBridge:{origin:'http://operator.localhost:8063'}})};
        window.starts=[];window.destroyed=[];window.states={};window.callbacks={};
        const loaders=Object.fromEntries(AGENT_ROLES.map(({id})=>[id,async(host,options)=>{
          starts.push(id);
          if(id==='codex'&&!window.retryCodex)throw Error('403: operator pairing required');
          states[id]={status:'ready',conversationId:id,sequence:0};
          callbacks[id]=value=>{states[id]={...states[id],...value};options.onStateChange(states[id]);};
          const input=element('textarea',{'aria-label':id+' draft'});
          const element_=element('section',{},input);
          return {element:element_,getState:()=>states[id],activate(){element_.hidden=false},
            deactivate(){element_.hidden=true},destroy(){destroyed.push(id)}};
        }]));
        window.workspace=createAgentWorkspace(host,{loaders});
        document.querySelector('main').append(workspace.element);
        workspace.activate();
        </script></html>`);
      return;
    }
    if (['/agents.js', '/agents.css'].includes(url.pathname)) {
      response.setHeader('Content-Type', url.pathname.endsWith('.js') ? 'text/javascript' : 'text/css');
      response.end(await readFile(join(here, '..', 'web', url.pathname.slice(1))));
      return;
    }
    response.writeHead(404).end();
  });
  await new Promise(resolve => server.listen(0, '127.0.0.1', resolve));
  const browser = await launchChromium(process.env.LOGOS_CHROME);
  try {
    await browser.send('Page.navigate', { url: `http://127.0.0.1:${server.address().port}/` });
    await browser.wait('window.starts?.length===1');
    assert.deepEqual(await browser.evaluate('starts'), ['teacher']);
    assert.equal(await browser.evaluate('document.querySelectorAll(".agent-chip").length'), 4);
    await browser.evaluate(`document.querySelector('[aria-label="teacher draft"]').value='Teacher-only draft';
      document.querySelector('#agent-chip-cyc').click()`);
    await browser.wait('window.starts?.length===2');
    await browser.evaluate(`document.querySelector('[aria-label="cyc draft"]').value='Cyc-only draft';
      callbacks.teacher({sequence:2})`);
    assert.equal(await browser.evaluate('document.querySelector("#agent-chip-teacher .agent-chip-unread").textContent'), '2 unread');
    await browser.evaluate('callbacks.teacher({sequence:2})');
    assert.equal(await browser.evaluate('document.querySelector("#agent-chip-teacher .agent-chip-unread").textContent'), '2 unread');
    await browser.evaluate('document.querySelector("#agent-chip-teacher").click()');
    assert.equal(await browser.evaluate('document.querySelector(\'[aria-label="teacher draft"]\').value'), 'Teacher-only draft');
    assert.equal(await browser.evaluate('document.querySelector("#agent-chip-teacher .agent-chip-unread").textContent'), '0 unread');
    await browser.evaluate('workspace.deactivate();workspace.activate({params:new URLSearchParams("agent=cyc")})');
    assert.equal(await browser.evaluate('document.querySelector(\'[aria-label="cyc draft"]\').value'), 'Cyc-only draft');
    assert.deepEqual(await browser.evaluate('starts'), ['teacher', 'cyc']);
    await browser.evaluate(`document.querySelector('#agent-chip-cyc').dispatchEvent(
      new KeyboardEvent('keydown',{key:'ArrowRight',bubbles:true}))`);
    await browser.wait('window.starts?.includes("copilot")');
    assert.equal(await browser.evaluate('document.activeElement.id'), 'agent-chip-copilot');
    await browser.evaluate('document.querySelector("#agent-chip-codex").click()');
    await browser.wait('document.body.textContent.includes("403: operator pairing required")');
    assert.match(await browser.evaluate('document.querySelector("#agent-panel-codex").textContent'), /No conversation/);
    await browser.evaluate(`window.retryCodex=true;document.querySelector('#agent-panel-codex button').click()`);
    await browser.wait('window.states.codex?.status==="ready"');
    assert.deepEqual(await browser.evaluate('destroyed'), []);
    await browser.evaluate('workspace.destroy()');
    assert.deepEqual((await browser.evaluate('destroyed')).sort(), ['codex', 'copilot', 'cyc', 'teacher']);
    assert.deepEqual(browser.exceptions, []);
  } finally {
    await browser.close();
    await new Promise(resolve => server.close(resolve));
  }
});
