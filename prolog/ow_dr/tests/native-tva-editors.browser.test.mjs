import test from 'node:test';
import assert from 'node:assert/strict';
import { createServer } from 'node:http';
import { readFile, writeFile } from 'node:fs/promises';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';
import { launchChromium } from './chromium.mjs';

const here = dirname(fileURLToPath(import.meta.url)), web = join(dirname(here), 'web');
const chrome = process.env.LOGOS_CHROME || process.env.CHROME_PATH || 'C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe';
const html = `<!doctype html><html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="/style.css"><link rel="stylesheet" href="/presentation.css"><link rel="stylesheet" href="/native-tva.css">
<title>Isolated native editors</title></head><body><main>
<h1>Native annotation editor fixture</h1><p>Synthetic records only. No application server or user KB.</p>
<textarea id="unrelated" aria-label="Unrelated source buffer">unsaved buffer</textarea>
<div class="assertion-view" data-assertion-id="a123"><a class="assertion-ball" href="#fixture">●</a> (not (p A))</div>
<div id="assertion-editor"></div><div id="settings"></div></main>
<script type="module">
import {renderAssertionAnnotationEditor,renderTVASettings,TVA_SETTING_FIELDS} from '/native-tva.js';
import {colorAssertionBalls} from '/assertion-markers.js';
const symbol=value=>({type:'symbol',value});
const expression={type:'application',head:symbol('x_not'),args:[{type:'application',head:symbol('x_p'),args:[symbol('x_A')]}]};
const source={id:'a123',expression,properties:[{name:'monotonicity',value:':MONOTONIC'},{name:'direction',value:':FORWARD'}]};
window.context='mt:x_MtFn(x_FullContext)';window.revision=1;window.generation=2;window.identity='source-one';
window.calls={assertion:[],pair:[],detail:[],refresh:[]};window.fail=false;
const own=Object.hasOwn, overrides={};
const values=new Map([[null,{nars:{frequency:.5,confidence:0},opencog:{vendor:true}}]]);
const effective=(summary,origin='default',supplier='default')=>({status:'initialized',origin,supplier,recordRevision:'record-'+revision,recordCount:1,summary});
const scalar=value=>({renderer:'native_data',kind:typeof value==='number'?'number':'atom',value});
const missing=()=>({status:'uninitialized',origin:null,supplier:null,recordRevision:'record-'+revision,recordCount:0,summary:null});
const exact=(key)=>own(overrides,key)?effective(scalar(overrides[key]),'atom','a123'):missing();
const readAssertion=async({context})=>({entity:'a123',context,revision:'r'+revision,generation,identity,
 recorded:{monotonicity:[':MONOTONIC'],direction:[':FORWARD']},
 overrides:{monotonicity:exact('monotonicity'),direction:exact('direction')},
 effective:{monotonicity:own(overrides,'monotonicity')?exact('monotonicity'):effective(scalar(':MONOTONIC'),'source','a123'),
 direction:own(overrides,'direction')?exact('direction'):effective(scalar(':FORWARD'),'source','a123')},
 layers:{mt:null,global:{monotonicity:missing(),direction:effective(scalar(':BACKWARD')),missing_assertion_strength:effective(scalar(':DEFAULT'))}}});
window.editor=renderAssertionAnnotationEditor({entity:'a123',readAssertion,
 saveAssertion:async body=>{
  calls.assertion.push(body);
  if(fail||body.revision!=='r'+revision||body.generation!==generation||body.identity!==identity)
   throw Object.assign(new Error('Revision / assertion identity conflict'),{status:409});
  for(const[key,value]of Object.entries(body.patch)){if(value===null)delete overrides[key];else overrides[key]=value}
  revision++;return readAssertion(body);
 },
 onSaved:reply=>{calls.refresh.push(reply.revision);colorAssertionBalls(document,[{...source,strengthCategory:reply.effective.monotonicity}])}
});
document.querySelector('#assertion-editor').append(editor);colorAssertionBalls(document,[source]);
const pairSummary=(family,record)=>record.vendor?{renderer:'native_data',kind:'compound',functor:'vendor_record',arity:3}
 :family==='nars'?{renderer:'nars_truth_value',...record}:{renderer:'opencog_stv',...record};
const readPairs=async({context})=>({context,revision:'r'+revision,families:Object.fromEntries(['nars','opencog'].map(family=>{
 const record=values.get(context)?.[family], selected=record??values.get(null)?.[family],origin=record&&context!==null?'mt':'default';
 const e=selected?effective(pairSummary(family,selected),origin,origin==='mt'?context:'default'):missing();
 return[family,{exact:record?e:missing(),effective:e,editable:!record?.vendor,replacementRequired:record?.vendor===true,
 detail:{entity:context??'default',context:null,family,property:null,recordRevision:e.recordRevision}}];
}))});
window.readPairs=readPairs;
const readSettings=async({context})=>{const global=Object.fromEntries(Object.keys(TVA_SETTING_FIELDS).map(key=>[key,missing()]));
 return {context,revision:'r'+revision,global,effective:{...global},overrides:Object.fromEntries(Object.keys(global).map(key=>[key,false]))}};
window.settings=renderTVASettings({readSettings,saveSettings:async()=>{throw new Error('Not exercised')},
 microtheories:[{key:context,expression:{type:'application',head:symbol('x_MtFn'),args:[symbol('x_FullContext')]}}],
 readPairs,savePair:async body=>{
  calls.pair.push(body);if(body.revision!=='r'+revision)throw Object.assign(new Error('Native store revision conflict'),{status:409});
  const scoped={...(values.get(body.context)??{})};
  if(scoped[body.family]?.vendor&&!body.replace)throw new Error('Explicit replacement required');
  if(body.pair===null)delete scoped[body.family];else scoped[body.family]=body.pair;
  values.set(body.context,scoped);revision++;return readPairs(body);
 },
 fetchDetail:async body=>{
  calls.detail.push(body);const scoped=body.entity==='default'?null:body.entity;
  const record=values.get(scoped)?.[body.family]??values.get(null)?.[body.family];
  const text=record.vendor?'vendor_record("<script>literal</scr'+'ipt>",false,[]).':'stv('+record.strength+','+record.confidence+').';
  return {records:[{text,data:{type:'string',value:text}}]};
 },
 onSaved:reply=>calls.refresh.push(reply.revision)
});
document.querySelector('#settings').append(settings);window.pairs=settings.querySelector('.native-tva-pair-settings');
window.input=(selector,value)=>{const input=document.querySelector(selector);input.value=value;input.dispatchEvent(new Event(input.tagName==='SELECT'?'change':'input',{bubbles:true}))};
window.button=(root,text)=>[...root.querySelectorAll('button')].find(button=>button.textContent===text);
window.nativeValues=values;window.ready=true;
</script></body></html>`;

test('typed native editors: conflicts, independent clear, whole-pair consent, MT inheritance and responsive layout', { timeout: 90000 }, async () => {
  const server = createServer(async (request, response) => {
    if (request.url === '/') { response.writeHead(200, { 'content-type': 'text/html' }); response.end(html); return; }
    const name = request.url.slice(1);
    if (!/^[a-z-]+\.(?:js|css)$/u.test(name)) { response.writeHead(404); response.end(); return; }
    try {
      const data = await readFile(join(web, name));
      response.writeHead(200, { 'content-type': name.endsWith('.js') ? 'application/javascript' : 'text/css' }); response.end(data);
    } catch { response.writeHead(404); response.end(); }
  });
  await new Promise(resolve => server.listen(0, '127.0.0.1', resolve));
  let browser;
  try {
    browser = await launchChromium(chrome);
    await browser.send('Emulation.setDeviceMetricsOverride', { width: 1180, height: 900, deviceScaleFactor: 1, mobile: false });
    await browser.send('Page.navigate', { url: `http://127.0.0.1:${server.address().port}/` });
    await browser.wait('window.ready && editor.controller.get().snapshot && pairs.controllers.every(c=>c.get().snapshot)');
    assert.equal(await browser.evaluate('calls.assertion.length+calls.pair.length'), 0);
    assert.match(await browser.evaluate('editor.textContent'), /Recorded source: :MONOTONIC/u);
    assert.match(await browser.evaluate('editor.textContent'), /Global missing-strength policy: ":DEFAULT"/u);
    assert.equal(await browser.evaluate('document.querySelector("[name=assertion-override-monotonicity]").value'), '');
    assert.equal(await browser.evaluate('document.querySelector("[name=native-pair-nars-frequency]").value'), '0.5');
    assert.equal(await browser.evaluate('document.querySelector("[name=native-pair-opencog-strength]").disabled'), true);
    assert.equal(await browser.evaluate('document.querySelector(".assertion-ball").dataset.marker'), 'false');
    for (const [name, width] of [['desktop', 1180], ['mobile', 390]]) {
      await browser.send('Emulation.setDeviceMetricsOverride', { width, height: 900, deviceScaleFactor: 1, mobile: width < 600 });
      assert.equal(await browser.evaluate('document.documentElement.scrollWidth<=innerWidth'), true, `${name} must not overflow`);
      if (process.env.NATIVE_TVA_SCREENSHOTS === '1') {
        const shot = await browser.send('Page.captureScreenshot', { format: 'png', captureBeyondViewport: true });
        await writeFile(join(here, `.native-editors-${name}.png`), Buffer.from(shot.data, 'base64'));
      }
    }
    await browser.evaluate(`input('[name=assertion-override-monotonicity]',':DEFAULT');input('[name=assertion-override-direction]',':BACKWARD');
      window.fail=true;button(editor,'Save assertion overrides').click()`);
    await browser.wait('editor.controller.get().error');
    assert.deepEqual(await browser.evaluate('calls.assertion[0].patch'), { monotonicity: ':DEFAULT', direction: ':BACKWARD' });
    assert.equal(await browser.evaluate('document.querySelector("[name=assertion-override-monotonicity]").value'), ':DEFAULT');
    assert.match(await browser.evaluate('editor.textContent'), /Unsaved selections are kept/u);
    await browser.evaluate(`window.fail=false;window.generation=3;window.identity='source-two';editor.refresh()`);
    await browser.wait('!editor.controller.get().loading');
    await browser.evaluate(`button(editor,'Save assertion overrides').click()`);
    await browser.wait('!editor.controller.get().saving && !editor.controller.get().dirty');
    assert.deepEqual(await browser.evaluate('[calls.assertion.at(-1).generation,calls.assertion.at(-1).identity]'), [3, 'source-two']);
    assert.match(await browser.evaluate('editor.textContent'), /Saved effective: ":DEFAULT" · Atom override/u);
    assert.equal(await browser.evaluate('document.querySelector(".assertion-ball").dataset.marker'), 'false');
    await browser.evaluate(`input('[name=assertion-override-monotonicity]','');button(editor,'Save assertion overrides').click()`);
    await browser.wait('!editor.controller.get().saving && !editor.controller.get().dirty');
    assert.deepEqual(await browser.evaluate('calls.assertion.at(-1).patch'), { monotonicity: null });
    assert.match(await browser.evaluate('editor.textContent'), /Saved effective: ":MONOTONIC" · Recorded source/u);
    assert.equal(await browser.evaluate('document.querySelector("[name=assertion-override-direction]").value'), ':BACKWARD');

    await browser.evaluate('pairs.refresh()');
    await browser.wait('pairs.controllers.every(c=>!c.get().loading)');
    await browser.evaluate(`input('[name=native-pair-nars-frequency]','0');input('[name=native-pair-nars-confidence]','0');
      button(pairs,'Save NARS whole pair').click()`);
    await browser.wait('calls.pair.length===1 && !pairs.controllers[0].get().saving');
    assert.deepEqual(await browser.evaluate('calls.pair[0].pair'), { frequency: 0, confidence: 0 });
    assert.equal(await browser.evaluate('nativeValues.get(null).opencog.vendor'), true);
    await browser.evaluate('pairs.querySelector("[data-pair-family=opencog] details").open=true');
    await browser.wait('pairs.querySelector(".native-tva-raw")');
    assert.match(await browser.evaluate('pairs.querySelector(".native-tva-raw").textContent'), /vendor_record/u);
    assert.equal(await browser.evaluate('pairs.querySelectorAll("script").length'), 0);
    await browser.evaluate(`document.querySelector('[name=native-pair-opencog-replace]').click();
      input('[name=native-pair-opencog-strength]','.2');input('[name=native-pair-opencog-confidence]','0');
      button(pairs,'Save OpenCog/PLN whole pair').click()`);
    await browser.wait('calls.pair.length===2 && !pairs.controllers[1].get().saving');
    assert.equal(await browser.evaluate('calls.pair.at(-1).replace'), true);
    assert.deepEqual(await browser.evaluate('nativeValues.get(null).opencog'), { strength: .2, confidence: 0 });
    await browser.wait('pairs.querySelector(".native-tva-raw").textContent==="stv(0.2,0)."');

    await browser.evaluate(`input('[name=tva-settings-context]',context)`);
    await browser.wait('pairs.controllers.every(c=>c.get().context===context&&!c.get().loading)');
    assert.equal(await browser.evaluate('document.querySelector("[name=native-pair-nars-frequency]").disabled'), true);
    assert.match(await browser.evaluate('pairs.textContent'), /Global record/u);
    await browser.evaluate(`button(pairs,'Override whole pair for this MT').click();input('[name=native-pair-nars-frequency]','.8');
      button(pairs,'Save NARS whole pair').click()`);
    await browser.wait('calls.pair.length===3 && !pairs.controllers[0].get().saving');
    assert.deepEqual(await browser.evaluate('calls.pair.at(-1).pair'), { frequency: .8, confidence: 0 });
    assert.equal(await browser.evaluate('calls.pair.at(-1).context===context'), true);
    await browser.evaluate(`button(pairs,'Clear MT record · inherit global pair').click();button(pairs,'Save NARS whole pair').click()`);
    await browser.wait('calls.pair.length===4 && !pairs.controllers[0].get().saving');
    assert.equal(await browser.evaluate('calls.pair.at(-1).pair'), null);
    assert.equal(await browser.evaluate('Object.hasOwn(nativeValues.get(context),"nars")'), false);
    assert.equal(await browser.evaluate('nativeValues.get(null).nars.frequency'), 0);
    assert.equal(await browser.evaluate('document.querySelector("#unrelated").value'), 'unsaved buffer');
    assert.equal(await browser.evaluate('calls.refresh.length'), 6);
    assert.deepEqual(browser.exceptions, []);
  } finally { await browser?.close(); await new Promise(resolve => server.close(resolve)); }
});
