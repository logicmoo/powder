import test from 'node:test';
import assert from 'node:assert/strict';
import { createServer } from 'node:http';
import { readFile, writeFile } from 'node:fs/promises';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';
import { launchChromium } from './chromium.mjs';

const here = dirname(fileURLToPath(import.meta.url));
const web = join(dirname(here), 'web');
const chrome = process.env.LOGOS_CHROME || process.env.CHROME_PATH || 'C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe';
const html = `<!doctype html><html lang="en"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="/style.css"><link rel="stylesheet" href="/presentation.css"><link rel="stylesheet" href="/classic-layout.css">
<style>.app-shell{display:flex;flex-direction:column;min-height:100vh}.workspace{flex:1;min-height:0}#top{display:flex;flex-direction:row;flex-wrap:wrap;position:static;height:auto;align-self:stretch;align-items:center;gap:16px;padding:10px;border-bottom:1px solid #aaa}#top nav{display:flex;gap:14px}main{padding:16px}#editor{min-height:90px}#ordinary-content{min-height:0}</style>
</head><body><div class="app-shell"><header id="top" class="sidebar global-navigation"><strong>powder</strong><nav aria-label="Main"><a href="#/overview">Overview</a><a href="#/search">Search</a><a href="#/settings">UI Settings</a></nav></header><div class="workspace"><main id="content" tabindex="-1"><h1>Presentation component test</h1><p>Synthetic assertions, not corpus evidence.</p><textarea id="editor" aria-label="Dirty editor stand-in">unsaved buffer</textarea><div id="ordinary-content"></div></main></div></div>
<script type="module">
import {createPresentationStore,renderUISettings} from '/presentation.js';
import {createClassicLayout} from '/classic-layout.js';
import {createAssertionView} from '/assertion-view.js';
import {renderExpression,expressionText,routeHref} from '/render.js';
const make=(tag,text,className)=>{const e=document.createElement(tag);if(text!==undefined)e.textContent=text;if(className)e.className=className;return e};
window.sourceCalls=[];window.propertyCalls=[];window.diagnosticCalls=[];
const callbacks={
 sourceLink:(path,line,label,column)=>{sourceCalls.push({path,line,label,column});const s=make('span',undefined,'source-file-display');const a=make('a',path+':'+line,'source-link');a.href='#/source?path='+encodeURIComponent(path);const badge=make('span',' | loaded | ','file-badges');const p=make('button','Properties','file-properties');s.append(a,badge,p);return s},
 mtLink:(mt)=>{const a=make('a',mt.replace(/^x_/,''),'mt-link');a.href=routeHref('microtheory',{mt});return a},
 mappingLink:id=>{const a=make('a',id,'mapping-link');a.href=routeHref('mappings',{row:id});return a},
 propertyList:(properties)=>{propertyCalls.push(properties.map(p=>p.name));const dl=make('dl',undefined,'properties');for(const p of properties)dl.append(make('dt',p.name),make('dd',JSON.stringify(p.value)));return dl},
 diagnosticsPanel:(record,{entries})=>{diagnosticCalls.push(entries.map(e=>e.severity));const s=make('section',undefined,'assertion-diagnostics');for(const e of entries)s.append(make('p',e.message,'diagnostic-'+e.severity));return s},
};
window.presentation=createPresentationStore();window.renderUISettings=renderUISettings;
window.view=createAssertionView(callbacks);
const symbol=value=>({type:'symbol',value:'x_'+value});
const app=(head,...args)=>({type:'application',head:symbol(head),args});
window.nat={...app('ExampleConstructor',symbol('Case'),{type:'string',value:'A "quote"\\n<script>not executable</scr'+'ipt>'}),denotesNat:true,natKey:'nat:full-constructor-and-arguments'};
window.item={id:'a60a2418202240',kind:'rule',mt:'x_ExampleMt',source:'KBs/synthetic.krf',line:12,column:3,
 expression:app('isa',nat,symbol('Thing')),predicate:{arity:2},names:['?X'],mappingRows:['example-row'],
 properties:[{name:'direction',value:':BACKWARD'},{name:'warnings',value:['Stored warning']},{name:'errors',value:['Blocking error remains visible']},{name:'raw_import',value:'x'.repeat(5000)}],
 ruleUtility:{id:'a60a2418202240',total:1,items:[{observed:true,identityState:'current',generation:1,
  calls:3,results:4,answersHelped:2,proofOccurrences:3,resultsPerCall:4/3,coverage:'observed_queries',
  inclusiveCost:{wallSeconds:.2,cpuSeconds:.1,inferences:50}}]}};
window.card=view.card(item);
window.groups=view.groups([item,{...item,id:'a60a2418202241'},{...item,id:'a60a2418202242',mt:'x_OtherMt'}],{offset:25});
document.querySelector('#ordinary-content').append(card,groups);
window.editor=document.querySelector('#editor');window.originalMain=document.querySelector('main');
window.originalNav=document.querySelector('#top nav');
window.editorEvents=0;editor.addEventListener('input',()=>editorEvents++);
window.layout=createClassicLayout({content:originalMain,presentation,header:document.querySelector('#top'),context:{
 title:'Example term index',coverage:'page',shown:3,total:90,sections:[
 {title:'Assertions and predicates',items:[{label:'isa',term:'x_isa',count:3},{label:'Argument 1',href:'#/term?term=x_Thing&role=argument',count:2},{label:'First assertion',id:item.id}]},
 {title:'Microtheories',items:[{label:'ExampleMt',mt:'x_ExampleMt',count:2},{label:'OtherMt',mt:'x_OtherMt',count:1}]}
 ]}});
layout.setStatus('Synthetic test fixture · no KB was loaded');
window.ready=true;
</script></body></html>`;

test('shared presentation components preserve live DOM, accessible Classic layout and metadata rendering', { timeout: 90000 }, async () => {
  const server = createServer(async (request, response) => {
    if (request.url === '/') { response.writeHead(200, { 'content-type': 'text/html' }); response.end(html); return; }
    const file = request.url.slice(1);
    if (!/^[a-z-]+\.(?:js|css|json)$/.test(file)) { response.writeHead(404); response.end(); return; }
    try {
      const bytes = await readFile(join(web, file));
      response.writeHead(200, { 'content-type': file.endsWith('.js') ? 'application/javascript' : file.endsWith('.json') ? 'application/json' : 'text/css' });
      response.end(bytes);
    } catch { response.writeHead(404); response.end(); }
  });
  await new Promise(resolve => server.listen(0, '127.0.0.1', resolve));
  let browser;
  try {
    browser = await launchChromium(chrome);
    await browser.send('Emulation.setDeviceMetricsOverride', { width: 1180, height: 800, deviceScaleFactor: 1, mobile: false });
    await browser.send('Page.navigate', { url: `http://127.0.0.1:${server.address().port}/#/term?term=x_ActionModelMtFn` });
    await browser.wait('window.ready === true');
    assert.equal(await browser.evaluate('presentation.get().classic'), true);
    assert.equal(await browser.evaluate('document.querySelector("#top .classic-toggle input").checked'), true);
    assert.equal(await browser.evaluate('getComputedStyle(layout.frame).display'), 'grid');
    assert.equal(await browser.evaluate('location.hash'), '#/term?term=x_ActionModelMtFn');
    await browser.evaluate('presentation.set({classic:false})');
    await browser.evaluate(`window.visualSignature=()=>({
      palette:['--page','--surface','--ink','--muted','--link','--link-hover','--line','--radius'].map(key=>getComputedStyle(document.documentElement).getPropertyValue(key)),
      components:['body','#content','#content h1','.assertion-primary .expression','.assertion-primary .expression a.expr-symbol','.mt-collapse'].map(selector=>{
        const style=getComputedStyle(document.querySelector(selector));
        return ['fontFamily','fontSize','color','backgroundColor','borderRadius','textDecorationLine'].map(key=>style[key]);
      })
    });window.originalVisualStyle=visualSignature()`);
    assert.equal(await browser.evaluate("getComputedStyle(card.querySelector('[data-field=source]')).display"), 'none');
    assert.equal(await browser.evaluate("getComputedStyle(card.querySelector('[data-field=diagnostics]')).display"), 'none');
    assert.notEqual(await browser.evaluate("getComputedStyle(card.querySelector('[data-blocking]')).display"), 'none');
    assert.equal(await browser.evaluate("document.querySelectorAll('#ordinary-content script').length"), 0);
    assert.equal(await browser.evaluate("card.querySelector('.expr-string').textContent.includes('not executable')"), true);
    assert.equal(await browser.evaluate("card.querySelector('a.expr-nat').getAttribute('aria-label')"), 'Browse this complete non-atomic term');
    assert.equal(await browser.evaluate("new URLSearchParams(card.querySelector('a.expr-nat').hash.split('?')[1]).get('term')"), 'nat:full-constructor-and-arguments');
    assert.equal(await browser.evaluate("card.querySelector('.assertion-primary .expression code').firstChild.nodeType"), 3);
    assert.equal(await browser.evaluate("card.querySelector('.assertion-ball').getBoundingClientRect().width >= 24"), true);
    assert.equal(await browser.evaluate("new URLSearchParams(card.querySelector('.assertion-ball').hash.split('?')[1]).get('id')"), 'a60a2418202240');
    assert.equal(await browser.evaluate("propertyCalls.some(names=>names.includes('raw_import'))"), false);

    await browser.evaluate("editor.focus();editor.value='dirty changed buffer';editor.setSelectionRange(3,7);editor.dispatchEvent(new Event('input'));window.initialHash=location.hash;document.querySelector('#top .classic-toggle input').click()");
    await browser.wait('document.documentElement.classList.contains("classic-mode")');
    assert.equal(await browser.evaluate('document.querySelector("main") === originalMain && document.querySelector("#editor") === editor'), true);
    assert.equal(await browser.evaluate('editor.value'), 'dirty changed buffer');
    assert.equal(await browser.evaluate('editorEvents'), 1);
    assert.equal(await browser.evaluate('editor.selectionStart'), 3);
    assert.equal(await browser.evaluate('editor.selectionEnd'), 7);
    assert.equal(await browser.evaluate('location.hash === initialHash'), true);
    assert.equal(await browser.evaluate('document.querySelector("#top nav").parentElement.id'), 'top');
    assert.equal(await browser.evaluate('document.querySelector("#top nav") === originalNav'), true);
    assert.equal(await browser.evaluate('document.querySelector("#top").getBoundingClientRect().bottom <= layout.frame.getBoundingClientRect().top'), true);
    assert.match(await browser.evaluate('layout.index.textContent'), /Current page only/);
    assert.match(await browser.evaluate('layout.index.textContent'), /3 shown of 90/);
    assert.equal(await browser.evaluate('layout.index.querySelectorAll("nav").length'), 0);
    assert.equal(await browser.evaluate('getComputedStyle(layout.index).overflowY'), 'auto');
    assert.equal(await browser.evaluate('getComputedStyle(originalMain).overflowY'), 'auto');
    assert.deepEqual(await browser.evaluate('visualSignature()'), await browser.evaluate('originalVisualStyle'));
    const proportion = await browser.evaluate('layout.index.getBoundingClientRect().width/layout.frame.getBoundingClientRect().width');
    assert(proportion > .28 && proportion < .32);
    await browser.evaluate('layout.divider.focus();layout.divider.dispatchEvent(new KeyboardEvent("keydown",{key:"ArrowRight",shiftKey:true,bubbles:true,cancelable:true}))');
    assert.equal(await browser.evaluate('presentation.get().split'), 35);
    assert.equal(await browser.evaluate('layout.divider.getAttribute("aria-valuenow")'), '35');
    await browser.evaluate('layout.divider.dispatchEvent(new KeyboardEvent("keydown",{key:"Home",bubbles:true,cancelable:true}))');
    assert.equal(await browser.evaluate('presentation.get().split'), 20);
    const drag = await browser.evaluate('(()=>{const a=layout.divider.getBoundingClientRect(),b=layout.frame.getBoundingClientRect();return {x:a.x+a.width/2,y:a.y+30,target:b.x+b.width*.4}})()');
    await browser.send('Input.dispatchMouseEvent', { type: 'mousePressed', x: drag.x, y: drag.y, button: 'left', clickCount: 1 });
    await browser.send('Input.dispatchMouseEvent', { type: 'mouseMoved', x: drag.target, y: drag.y, button: 'left', buttons: 1 });
    assert.equal(await browser.evaluate('presentation.get().split'), 20);
    await browser.send('Input.dispatchMouseEvent', { type: 'mouseReleased', x: drag.target, y: drag.y, button: 'left', clickCount: 1 });
    assert(Math.abs(await browser.evaluate('presentation.get().split') - 40) < 1);
    await browser.evaluate('presentation.set({split:30,fields:{source:true,id:true,mt:true,properties:true,strength:true,ruleUtility:true}})');
    assert.notEqual(await browser.evaluate("getComputedStyle(card.querySelector('[data-field=source]')).display"), 'none');
    assert.equal(await browser.evaluate("card.querySelector('[data-field=source] .source-file-display').textContent"), 'KBs/synthetic.krf:12 | loaded | Properties');
    assert.deepEqual(await browser.evaluate('sourceCalls[0]'), { path: 'KBs/synthetic.krf', line: 12, column: 3 });
    assert.notEqual(await browser.evaluate("getComputedStyle(card.querySelector('[data-field=ruleUtility]')).display"), 'none');
    assert.match(await browser.evaluate("card.querySelector('[data-field=ruleUtility]').textContent"), /Unique returned answers helped \(per-query distinct, summed across queries\)/);
    assert.match(await browser.evaluate("card.querySelector('[data-field=ruleUtility]').textContent"), /non-additive/);
    assert.equal(await browser.evaluate("view.ruleUtility({items:[]})"), null);
    assert.match(await browser.evaluate("view.ruleUtility({items:[{observed:false,identityState:'current',calls:null}]}).textContent"), /unknown, not zero/);
    assert.equal(await browser.evaluate("groups.querySelectorAll('.assertion-group').length"), 2);
    assert.match(await browser.evaluate("groups.querySelector('.assertion-group-heading').textContent"), /2 on this page · continued view/);
    await browser.evaluate("groups.querySelector('.mt-collapse').click()");
    assert.equal(await browser.evaluate("getComputedStyle(groups.querySelector('.assertion-group-items')).display"), 'none');
    await browser.evaluate("presentation.set({fields:{mt:false}})");
    assert.notEqual(await browser.evaluate("getComputedStyle(groups.querySelector('.assertion-group-items')).display"), 'none');
    await browser.evaluate("card.querySelector('details.assertion-properties').open=true");
    await browser.wait("card.querySelector('.assertion-metadata') !== null");
    assert.equal(await browser.evaluate("propertyCalls.some(names=>names.includes('raw_import'))"), false);
    await browser.evaluate("card.querySelector('.assertion-metadata details').open=true");
    await browser.wait("propertyCalls.some(names=>names.includes('raw_import'))");

    await browser.evaluate("window.detail=view.card(item,{detail:true});document.querySelector('#ordinary-content').append(detail);presentation.reset()");
    assert.notEqual(await browser.evaluate("getComputedStyle(detail.querySelector('[data-field=source]')).display"), 'none');
    assert.notEqual(await browser.evaluate("getComputedStyle(detail.querySelector('[data-field=properties]')).display"), 'none');
    assert.equal(await browser.evaluate("detail.querySelector('.assertion-metadata details').open"), false);
    assert.equal(await browser.evaluate('document.querySelector("#editor") === editor && editor.value === "dirty changed buffer"'), true);
    assert.equal(await browser.evaluate('document.querySelector("#top nav") === originalNav'), true);
    assert.equal(await browser.evaluate('presentation.get().classic'), true);
    assert.equal(await browser.evaluate('document.querySelector("#top .classic-toggle input").checked'), true);

    await browser.evaluate("window.settings=renderUISettings(presentation);originalMain.append(settings);settings.querySelector('[name=field-source]').click();settings.querySelector('[name=classic]').click()");
    assert.equal(await browser.evaluate("getComputedStyle(card.querySelector('[data-field=source]')).display === 'none'"), false);
    assert.equal(await browser.evaluate("settings.querySelector('h1').textContent"), 'UI Settings');
    assert.equal(await browser.evaluate("settings.textContent.includes('Reload changed files')"), false);
    await browser.evaluate("settings.querySelector('button').click()");
    assert.equal(await browser.evaluate("settings.querySelector('[name=field-source]').checked"), false);
    assert.equal(await browser.evaluate("settings.querySelector('[name=classic]').checked"), true);
    await browser.evaluate("settings.dispose();settings.remove();detail.remove();presentation.set({classic:true,fields:{mt:true}})");
    await browser.evaluate("(()=>{const input=layout.index.querySelector('input');input.value='OtherMt';input.dispatchEvent(new Event('input'));})()");
    assert.equal(await browser.evaluate("layout.index.querySelectorAll('.classic-index-section:not([hidden])').length"), 1);
    assert.match(await browser.evaluate("layout.index.querySelector('.classic-filter-count').textContent"), /1 matching/);
    await browser.evaluate("(()=>{const input=layout.index.querySelector('input');input.value='';input.dispatchEvent(new Event('input'));})()");
    await browser.evaluate(`layout.setTermContext({
      term:'x_ActionModelMtFn',coverage:'complete',
      onViewpointFilters:()=>{window.filterOpened=true},
      nav:{sections:[
        {key:'documentation',label:'Documentation',count:0},
        {key:'definition',label:'Definitional Info',count:1},
        {key:'lexical',label:'Lexical Info',count:2},
        {key:'relations',label:'Applicable Relations',count:3},
        {key:'knowledge',label:'All Asserted Knowledge',count:4},
        {key:'assertions',label:'All KB Assertions',count:5},
        {key:'gafs',label:'All GAFs',count:3}],
        arguments:[{position:1,count:5,predicates:[{term:'x_isa',count:3,microtheories:[{mt:'x_ExampleMt',count:2}]}]},
          {position:2,count:0,predicates:[]}]}
    })`);
    assert.equal(await browser.evaluate('layout.index.querySelector(".classic-current-term").textContent'), 'ActionModelMtFn');
    assert.match(await browser.evaluate('layout.index.textContent'), /Complete index for this context/);
    assert.match(await browser.evaluate('layout.index.textContent'), /Documentation \(0\)/);
    assert.match(await browser.evaluate('layout.index.textContent'), /All GAFs \(3\)/);
    assert.equal(await browser.evaluate('layout.index.querySelectorAll(".classic-index-branch").length'), 3);
    await browser.evaluate("layout.index.querySelector('.classic-index-action').click()");
    assert.equal(await browser.evaluate('window.filterOpened'), true);
    await browser.evaluate("layout.index.querySelectorAll('.classic-index-branch')[1].querySelector('summary').click()");
    assert.equal(await browser.evaluate("layout.index.querySelectorAll('.classic-index-branch')[1].open"), true);
    const mtFilter = await browser.evaluate(`(()=>{const link=[...layout.index.querySelectorAll('a')].find(a=>a.textContent==='ExampleMt');return Object.fromEntries(new URLSearchParams(link.hash.split('?')[1]));})()`);
    assert.deepEqual(mtFilter, { term: 'x_ActionModelMtFn', arg: '1', predicate: 'x_isa', mt: 'x_ExampleMt' });
    if (process.env.PRESENTATION_SCREENSHOTS) {
      const shot = await browser.send('Page.captureScreenshot', { format: 'png' });
      await writeFile(join(here, 'presentation-desktop.png'), Buffer.from(shot.data, 'base64'));
    }
    await browser.send('Emulation.setDeviceMetricsOverride', { width: 390, height: 844, deviceScaleFactor: 1, mobile: true });
    await browser.evaluate('new Promise(resolve=>requestAnimationFrame(()=>requestAnimationFrame(resolve)))');
    assert.equal(await browser.evaluate('document.documentElement.scrollWidth <= innerWidth'), true);
    assert.equal(await browser.evaluate('getComputedStyle(layout.divider).display'), 'none');
    assert.equal(await browser.evaluate('getComputedStyle(layout.frame).flexDirection'), 'column');
    if (process.env.PRESENTATION_SCREENSHOTS) {
      const shot = await browser.send('Page.captureScreenshot', { format: 'png' });
      await writeFile(join(here, 'presentation-mobile.png'), Buffer.from(shot.data, 'base64'));
    }
    await browser.evaluate('layout.destroy()');
    assert.equal(await browser.evaluate('originalMain.parentElement.classList.contains("workspace")'), true);
    assert.equal(await browser.evaluate('document.querySelector("#editor") === editor'), true);
    assert.deepEqual(browser.exceptions, []);
    await browser.send('Page.reload');
    await browser.wait('window.ready === true && !!document.querySelector(".classic-workspace")');
    assert.equal(await browser.evaluate('presentation.get().classic'), true);
    assert.equal(await browser.evaluate('presentation.get().fields.mt'), true);
    assert.equal(await browser.evaluate('document.querySelector("#top .classic-toggle input").checked'), true);
  } finally {
    await browser?.close();
    await new Promise(resolve => server.close(resolve));
  }
});
