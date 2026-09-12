import test from 'node:test';
import assert from 'node:assert/strict';
import { createServer } from 'node:http';
import { readFile } from 'node:fs/promises';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';
import { launchChromium } from './chromium.mjs';

const web = join(dirname(dirname(fileURLToPath(import.meta.url))), 'web');
const html = `<!doctype html><html><head><link rel="stylesheet" href="/style.css"></head>
<body><nav id="global">Unchanged global navigation</nav><aside id="left"></aside>
<main><h1>onlyUnloaded</h1><div id="sentences"></div></main><button id="load">Explicit fixture load</button>
<script type="module">
import {createTermFileContext} from '/term-file-context.js';
import {renderSourceFile} from '/source-files.js';
window.loaded=false;window.generation=1;window.writes=[];window.activeFiles=[];window.reads=[];
const source='KBs/only-unloaded.krf';
const el=(tag,attrs={},...children)=>{const n=document.createElement(tag);
 for(const [key,value] of Object.entries(attrs)){if(value==null)continue;
 if(key==='className')n.className=value;else if(key.startsWith('on'))n.addEventListener(key.slice(2),value);
 else if(['open','disabled','checked'].includes(key))n[key]=value;else n.setAttribute(key,value);}
 for(const child of children.flat(Infinity))if(child!==false&&child!=null)n.append(child);return n;};
const link=(text,name,params={},className='')=>el('a',{href:'#/'+name+'?'+new URLSearchParams(params),className},text);
const button=(text,fn,className='')=>el('button',{type:'button',onclick:fn,className},text);
const api=async(path,params)=>{
 reads.push({path,params});
 if(path!=='catalog/files')throw new Error('Unexpected fixture API');
 const yes=params.scope==='all'||(params.scope==='loaded')===loaded;
 return {term:'x_onlyUnloaded',scope:params.scope,total:yes?1:0,counts:{all:1,loaded:loaded?1:0,unloaded:loaded?0:1},
 items:yes?[{source,loaded,indexed:true,matchingAssertions:1,semanticOccurrences:2,definitionAssertions:0}]:[],
 generation,revision:'index-r1',coverage:{freshFiles:1,expectedFiles:1,complete:true},offset:0,limit:20};};
const metadata={get:()=>({type:'file',startup:false,loaded,cached:true,indexed:true,
 warnings:0,errors:0,sizeBytes:40,lineCount:1,diagnosticEvidence:'fixture',sizeEvidence:'fixture'})};
const field=(item,href)=>renderSourceFile(item.source,()=>el('a',{href,className:'source-link'},'only-unloaded.krf'),
 metadata,{element:el,compact:true,properties:(_path,target)=>target.append(el('p',{},'Source and index identity: index-r1'))}).node;
const controller=new AbortController();
document.querySelector('#left').append(createTermFileContext({element:el,api,link,button,file:field},
 {term:'x_onlyUnloaded',route:{name:'term',params:new URLSearchParams('term=x_onlyUnloaded')},signal:controller.signal}));
window.addEventListener('hashchange',()=>{const p=new URLSearchParams(location.hash.split('?')[1]);
 if(p.get('source')===source&&p.get('term')==='x_onlyUnloaded')document.querySelector('#sentences').textContent='(onlyUnloaded a a) · assertion a123 · index-r1';});
document.querySelector('#load').onclick=()=>{writes.push({action:'explicit-load',source});loaded=true;generation++;
 activeFiles=[source];window.dispatchEvent(new CustomEvent('powder-generation-change',{detail:{generation}}));};
</script></body></html>`;

test('unloaded left entry browses and inspects without load; explicit transition refreshes counts', async () => {
  const server = createServer(async (request, response) => {
    const name = new URL(request.url, 'http://fixture').pathname.slice(1);
    if (!name) { response.setHeader('Content-Type', 'text/html'); response.end(html); return; }
    if (!/^[\w-]+\.(?:js|css|json)$/u.test(name)) { response.statusCode = 404; response.end(); return; }
    try {
      response.setHeader('Content-Type', name.endsWith('.js') ? 'text/javascript'
        : name.endsWith('.json') ? 'application/json' : 'text/css');
      response.end(await readFile(join(web, name)));
    } catch { response.statusCode = 404; response.end(); }
  });
  await new Promise(resolve => server.listen(0, '127.0.0.1', resolve));
  const browser = await launchChromium(process.env.LOGOS_CHROME || 'C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe');
  try {
    await browser.send('Page.navigate', { url: `http://127.0.0.1:${server.address().port}/` });
    await browser.wait('document.querySelector("#left").innerText.includes("UNLOADED occurrences (1 files)") && document.querySelector("#left .source-link")');
    await browser.evaluate('document.querySelector("#left .source-link").click()');
    await browser.wait('document.querySelector("#sentences").innerText.includes("assertion a123")');
    await browser.evaluate('document.querySelector("#left .source-properties-button").click()');
    assert.match(await browser.evaluate('document.querySelector("#left").innerText'), /Source and index identity: index-r1/u);
    assert.deepEqual(await browser.evaluate('({writes,activeFiles,generation})'), { writes: [], activeFiles: [], generation: 1 });
    assert.equal(await browser.evaluate('document.querySelector("#global").innerText'), 'Unchanged global navigation');
    await browser.evaluate('document.querySelector("#load").click()');
    await browser.wait('document.querySelector("#left").innerText.includes("Loaded occurrences (1 files)") && document.querySelector("#left").innerText.includes("UNLOADED occurrences (0 files)")');
    assert.equal(await browser.evaluate('writes.length'), 1);
    assert.deepEqual(browser.exceptions, []);
  } finally {
    await browser.close();
    await new Promise(resolve => server.close(resolve));
  }
});
