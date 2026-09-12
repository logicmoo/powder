import test from 'node:test';
import assert from 'node:assert/strict';
import { createServer } from 'node:http';
import { readFile } from 'node:fs/promises';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';
import { launchChromium } from './chromium.mjs';

const web = join(dirname(dirname(fileURLToPath(import.meta.url))), 'web');
const chrome = process.env.LOGOS_CHROME || process.env.CHROME_PATH || 'C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe';
const html = `<!doctype html><html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="/style.css"><link rel="stylesheet" href="/presentation.css"><link rel="stylesheet" href="/native-tva.css">
<title>Isolated native annotation component fixture</title></head><body><main>
<h1>Native annotation component fixture</h1><p>Synthetic isolated records, never user KB data.</p>
<textarea id="editor" aria-label="Unrelated unsaved editor">unsaved source buffer</textarea>
<div id="controls"></div><div id="inspectors"></div><div id="settings"></div></main>
<script type="module">
import {createTVAClient,createTVAInspector,createTVAVisibilityControls,renderTVASettings,renderAssertionPrior,normalizeTVAFamilies,DEFAULT_TVA_FAMILIES} from '/native-tva.js';
import {renderExpression} from '/render.js';
const symbol=value=>({type:'symbol',value});
const compound={type:'application',head:symbol('x_MtFn'),args:[symbol('x_FullArgument'),{type:'string',value:'complete context'}]};
window.contextKey='mt:x_MtFn(x_FullArgument,"complete context")';
window.calls={summary:[],detail:[],source:[],copied:[],writes:[],reads:[],catalog:[]};
window.gates=[];
const effective=(summary,rest={})=>({status:'initialized',origin:'atom',supplier:'x_Selected',recordRevision:'record-'+window.revision,recordCount:1,summary,...rest});
const missing=()=>effective(null,{status:'uninitialized',origin:null,supplier:null,recordCount:0});
const native=value=>({renderer:'native_data',kind:typeof value==='number'?'number':typeof value==='boolean'?'boolean':'atom',value});
window.revision='r1';
const makeRow=(entity,context)=>({entity,context,revision,
 contextExpression:context===contextKey?compound:context===null?null:symbol(context),
 families:{
 nars:{family:'nars',effective:effective({renderer:'nars_truth_value',frequency:0,confidence:0},{origin:context===null?'default':'mt',supplier:context??'default',supplierExpression:context===contextKey?compound:null})},
 opencog:{family:'opencog',effective:effective({renderer:'native_data',kind:'list',length:0},{origin:'default',supplier:'default'})},
 cyc:{family:'cyc',properties:[
 {property:'utility',effective:effective(native(false),{origin:context===null?'default':'mt',supplier:context??'default'})},
 {property:'zero',effective:effective(native(0))},
 {property:'inherited-list',effective:effective({renderer:'native_data',kind:'list',length:0},{origin:'default',supplier:'default'})},
 {property:'requested-missing',effective:missing()},
 {property:'vendor',effective:effective({renderer:'native_data',kind:'compound',functor:'vendor_record',arity:1})},
 {property:'conflicted',effective:effective(null,{status:'conflict',recordCount:2})}
 ]}}});
window.presentation=(()=>{
 let state={density:'dense',fields:{source:true},tvaFamilies:{...DEFAULT_TVA_FAMILIES},pageSize:37};
 const listeners=new Set();
 return {get:()=>structuredClone(state),set:patch=>{state={...state,...patch,tvaFamilies:normalizeTVAFamilies(patch.tvaFamilies,state.tvaFamilies)};
 for(const listener of listeners)listener(structuredClone(state));return state},
 subscribe:(listener,{immediate=true,signal}={})=>{if(signal?.aborted)return()=>{};listeners.add(listener);if(immediate)listener(structuredClone(state));
 const off=()=>listeners.delete(listener);signal?.addEventListener('abort',off,{once:true});return off}};
})();
window.client=createTVAClient({
 fetchSummaries:async(request,{signal})=>{
  calls.summary.push({...request,signal});
  if(window.failSummary)throw new Error('Native annotation transport unavailable');
  if(window.delaySummary)await new Promise(resolve=>gates.push(resolve));
  return {revision,context:request.context,items:request.entities.map(entity=>makeRow(entity,request.context)),total:request.entities.length};
 },
 fetchDetail:async(request,{signal})=>{
  calls.detail.push({...request,signal});
  if(window.delayDetail)await new Promise(resolve=>gates.push(resolve));
  const text='vendor_record("<script>window.nativeInjected=true</scr'+'ipt>",false,0,[]).\\n';
  return {revision,...request,effective:effective(native(false),{recordRevision:request.recordRevision}),
  records:[{data:{type:'compound',functor:'vendor_record',args:[{type:'string',value:'\\\\n <img src=x onerror=window.nativeInjected=true> \\u001b[31mred\\u001b[0m'}, {type:'atom',value:'false'},{type:'number',value:0},{type:'list',items:[]}]},text}]};
 }
});
window.routeController=new AbortController();
window.controls=createTVAVisibilityControls(presentation,{signal:routeController.signal});
document.querySelector('#controls').append(controls);
const sourceLink=(file,line,label,column)=>{calls.source.push({file,line,label,column});const link=document.createElement('a');link.textContent=file+':'+line;link.href='#/source?file='+encodeURIComponent(file);link.className='source-link';return link};
window.first=createTVAInspector({client,target:{entity:'x_Selected',source:{file:'KBs/isolated.krf',line:19,column:2}},currentMt:null,presentation,signal:routeController.signal,sourceLink,copyText:async text=>calls.copied.push(text)});
window.second=createTVAInspector({client,target:'a60a2418202240',currentMt:null,presentation,signal:routeController.signal});
document.querySelector('#inspectors').append(first,second);
window.originalEditor=document.querySelector('#editor');window.originalMain=document.querySelector('main');
window.settingRevision='s1';window.conflict=true;window.saved=new Map();
const keys=['monotonic_strength','default_strength','direction','utility','missing_assertion_strength','asserted_positive_truth','asserted_monotonic_confidence','asserted_default_confidence'];
window.showPrior=polarity=>{
 const prior={kind:'configured_assertion_prior',status:polarity==='negative'?'unsupported':'initialized',reason:polarity==='negative'?'negative_assertion_prior_unspecified':'configured_asserted_positive',
 polarity,source:{assertionId:'a60a2418202240',file:'KBs/isolated.krf',line:21},sourceMonotonicity:[':MONOTONIC'],observed:false,affectsNativeTVA:false,
 truth:polarity==='negative'?null:effective(native(1),{property:'asserted_positive_truth',origin:'default',supplier:'default'}),
 confidence:polarity==='negative'?null:effective(native(.97),{property:'asserted_monotonic_confidence',origin:'mt',supplier:contextKey,supplierExpression:compound})};
 document.querySelector('.native-tva-prior')?.remove();
 const view=renderAssertionPrior({assertionPrior:prior,context:contextKey,contextExpression:compound},{sourceLink});document.querySelector('main').append(view);return view;
};
const settingsReply=context=>{
 const values=saved.get(context)??{}, globals=saved.get(null)??{};
 const global=Object.fromEntries(keys.map(key=>[key,Object.hasOwn(globals,key)?effective(native(globals[key]),{origin:'default',supplier:'default'}):missing()]));
 return {context,revision:settingRevision,global,
 effective:Object.fromEntries(keys.map(key=>[key,Object.hasOwn(values,key)?effective(native(values[key]),{origin:context===null?'default':'mt',supplier:context??'default'}):global[key]])),
 overrides:Object.fromEntries(keys.map(key=>[key,Object.hasOwn(values,key)]))};
};
window.settings=renderTVASettings({
 signal:routeController.signal,
 readSettings:async({context})=>{calls.reads.push(context);return settingsReply(context)},
 saveSettings:async request=>{
  calls.writes.push(request);
  if(conflict)throw Object.assign(new Error('Store changed since this revision'),{status:409,code:'native_tva_revision_conflict'});
  const values={...(saved.get(request.context)??{})};
  for(const [key,value] of Object.entries(request.patch)){if(value===null)delete values[key];else values[key]=value}
  saved.set(request.context,values);settingRevision='s'+(Number(settingRevision.slice(1))+1);return settingsReply(request.context);
 },
 listMicrotheories:async request=>{
  calls.catalog.push(request);return {items:request.offset===0?[{key:'x_AtomicMt',expression:symbol('x_AtomicMt')}]:[{key:contextKey,expression:compound}],total:2};
 }
});
document.querySelector('#settings').append(settings);
window.ready=true;
</script></body></html>`;

test('native annotation fixtures: independent toggles, lazy native details, lifecycle, contexts and explicit settings', { timeout: 90000 }, async () => {
  const server = createServer(async (request, response) => {
    if (request.url === '/') { response.writeHead(200, { 'content-type': 'text/html' }); response.end(html); return; }
    const file = request.url.slice(1);
    if (!/^[a-z-]+\.(js|css)$/u.test(file)) { response.writeHead(404); response.end(); return; }
    try {
      response.writeHead(200, { 'content-type': file.endsWith('.js') ? 'application/javascript' : 'text/css' });
      response.end(await readFile(join(web, file)));
    } catch { response.end(); }
  });
  await new Promise(resolve => server.listen(0, '127.0.0.1', resolve));
  let browser;
  try {
    browser = await launchChromium(chrome);
    await browser.send('Emulation.setDeviceMetricsOverride', { width: 1180, height: 900, deviceScaleFactor: 1, mobile: false });
    await browser.send('Page.navigate', { url: `http://127.0.0.1:${server.address().port}/#/term?term=x_Selected` });
    await browser.wait('window.ready && calls.reads.length===1 && calls.catalog.length===2');
    assert.equal(await browser.evaluate('calls.summary.length'), 0);
    assert.equal(await browser.evaluate('calls.detail.length'), 0);
    assert.equal(await browser.evaluate('first.hidden && second.hidden'), true);
    assert.equal(await browser.evaluate('settings.querySelector("[name=tva-setting-direction]").value'), '');
    assert.equal(await browser.evaluate('settings.querySelector("[name=tva-setting-utility]").value'), '');
    assert.equal(await browser.evaluate('settings.querySelector("[name=tva-setting-asserted_positive_truth]").value'), '');
    assert.equal(await browser.evaluate('settings.querySelector("[name=tva-setting-asserted_monotonic_confidence]").value'), '');
    assert.equal(await browser.evaluate('settings.querySelector("[name=tva-setting-asserted_default_confidence]").value'), '');
    assert.equal(await browser.evaluate('calls.writes.length'), 0);
    assert.equal(await browser.evaluate('settings.querySelector("[name=tva-settings-context]").options.length'), 3);
    assert.match(await browser.evaluate('settings.querySelector("[name=tva-settings-context]").options[2].textContent'), /MtFn.*FullArgument.*complete context/u);
    assert.deepEqual(await browser.evaluate('[...controls.querySelectorAll("label")].map(node=>node.textContent)'),
      ['Show TVA NARS', 'Show TVA OpenCog/PLN', 'Show TVA Cyc']);

    await browser.evaluate(`originalEditor.value='dirty buffer with selection';originalEditor.setSelectionRange(3,8);window.originalHash=location.hash;
      presentation.set({tvaFamilies:{nars:true,opencog:true,cyc:true}})`);
    await browser.wait('first.querySelectorAll(".native-tva-entry").length===8');
    assert.equal(await browser.evaluate('calls.summary.length'), 1);
    assert.equal(await browser.evaluate('calls.summary[0].entities.length'), 2);
    assert.equal(await browser.evaluate('calls.summary[0].context'), null);
    assert.equal(await browser.evaluate('calls.detail.length'), 0);
    assert.match(await browser.evaluate('first.textContent'), /Current MT: No current MT/u);
    assert.match(await browser.evaluate('first.textContent'), /Frequency 0 · confidence 0 · no evidence/u);
    assert.match(await browser.evaluate('first.querySelector("[data-family=opencog]").textContent'), /\[\]/u);
    assert.equal(await browser.evaluate('first.querySelector("[data-family=opencog]").textContent.includes("no evidence")'), false);
    assert.match(await browser.evaluate('first.querySelector("[data-property=requested-missing]").textContent'), /Uninitialized/u);
    assert.match(await browser.evaluate('first.querySelector("[data-property=conflicted]").textContent'), /Conflict/u);
    assert.match(await browser.evaluate('first.querySelector("[data-property=utility]").textContent'), /false/u);
    assert.equal(await browser.evaluate('document.querySelector("#editor")===originalEditor && document.querySelector("main")===originalMain'), true);
    assert.equal(await browser.evaluate('originalEditor.value'), 'dirty buffer with selection');
    assert.deepEqual(await browser.evaluate('[originalEditor.selectionStart,originalEditor.selectionEnd]'), [3, 8]);
    assert.equal(await browser.evaluate('location.hash===originalHash && presentation.get().pageSize===37 && presentation.get().fields.source===true'), true);
    assert.deepEqual(await browser.evaluate('calls.source[0]'), { file: 'KBs/isolated.krf', line: 19, column: 2 });
    await browser.evaluate('window.beforeRefresh=calls.summary.length;first.refresh()');
    await browser.wait('calls.summary.length>beforeRefresh && first.querySelector("[data-family=nars]")');

    await browser.evaluate('first.querySelector("[data-family=nars]").open=true');
    await browser.wait('first.querySelector(".native-tva-raw")');
    assert.equal(await browser.evaluate('calls.detail.length'), 1);
    assert.equal(await browser.evaluate('first.querySelectorAll("script,img").length'), 0);
    assert.equal(await browser.evaluate('window.nativeInjected'), undefined);
    assert.match(await browser.evaluate('first.querySelector(".native-tva-data").textContent'), /vendor_record.*false, 0, \[\]/u);
    assert.match(await browser.evaluate('first.querySelector(".native-tva-raw").textContent'), /<script>window.nativeInjected=true/u);
    await browser.evaluate('first.querySelector(".copy-button").click()');
    await browser.wait('calls.copied.length===1');
    assert.equal(await browser.evaluate('calls.copied[0]===first.querySelector(".native-tva-raw").textContent'), true);
    assert.equal(await browser.evaluate('calls.copied[0].endsWith(".\\n")'), true);
    await browser.evaluate('first.querySelector("[data-family=nars]").open=false');
    await browser.wait('!first.querySelector("[data-family=nars]").open');
    await browser.evaluate('first.querySelector("[data-family=nars]").open=true');
    await browser.wait('first.querySelector(".native-tva-raw")');
    assert.equal(await browser.evaluate('calls.detail.length'), 1);

    await browser.evaluate('first.setContext(contextKey)');
    await browser.wait('first.querySelector(".native-tva-scope .expression") && calls.detail.length===2 && first.querySelector(".native-tva-raw")');
    assert.equal(await browser.evaluate('calls.summary.at(-1).entities[0]'), 'x_Selected');
    assert.equal(await browser.evaluate('calls.detail.at(-1).entity'), 'x_Selected');
    assert.equal(await browser.evaluate('calls.detail.at(-1).context===contextKey'), true);
    assert.equal(await browser.evaluate('first.querySelector(".native-tva-scope").textContent.includes("complete context")'), true);
    assert.equal(await browser.evaluate('first.querySelector(".native-tva-origin").textContent.includes("FullArgument")'), true);
    assert.equal(await browser.evaluate('first.querySelector(".native-tva-origin a.expr-symbol").hash.includes("term=x_MtFn")'), true);
    assert.equal(await browser.evaluate('location.hash===originalHash'), true);

    await browser.evaluate(`window.delayDetail=true;first.setContext('x_SlowMt')`);
    await browser.wait('calls.detail.at(-1).context==="x_SlowMt" && gates.length===1');
    await browser.evaluate("first.setContext('x_FastMt');window.delayDetail=false;gates.splice(0).forEach(resolve=>resolve())");
    await browser.wait('first.textContent.includes("x_FastMt") && first.querySelector(".native-tva-raw")');
    assert.equal(await browser.evaluate('calls.detail.find(call=>call.context==="x_SlowMt").signal.aborted'), true);
    assert.equal(await browser.evaluate('first.textContent.includes("x_SlowMt")'), false);
    await browser.evaluate("window.delayDetail=true;first.setContext('x_FamilyChangeMt')");
    await browser.wait('calls.detail.at(-1).context==="x_FamilyChangeMt" && gates.length===1');
    await browser.evaluate("presentation.set({tvaFamilies:{nars:false}});window.delayDetail=false;gates.splice(0).forEach(resolve=>resolve())");
    await browser.wait('!first.querySelector("[data-family=nars]")');
    assert.equal(await browser.evaluate('calls.detail.find(call=>call.context==="x_FamilyChangeMt").signal.aborted'), true);
    assert.equal(await browser.evaluate('first.querySelectorAll(".native-tva-raw").length'), 0);
    assert.equal(await browser.evaluate('presentation.get().tvaFamilies.opencog && presentation.get().tvaFamilies.cyc'), true);

    await browser.evaluate(`{const input=first.querySelector('.native-tva-property-search input');input.value='requested';input.dispatchEvent(new Event('input'))}`);
    assert.equal(await browser.evaluate('first.querySelectorAll("[data-property]").length'), 1);
    assert.match(await browser.evaluate('first.querySelector("[data-property]").textContent'), /requested-missing.*Uninitialized/u);
    await browser.evaluate('first.setVisible(false);window.beforeHidden=calls.summary.length;first.setContext("x_WhileHiddenMt")');
    assert.equal(await browser.evaluate('calls.summary.length===beforeHidden && first.hidden'), true);
    await browser.evaluate('first.setVisible(true)');
    await browser.wait('first.textContent.includes("x_WhileHiddenMt")');

    await browser.evaluate('window.revision="r2";client.invalidate({revision:"r2",generation:2})');
    await browser.wait('calls.summary.some(call=>call.context==="x_WhileHiddenMt") && first.querySelector("[data-family=opencog]")');
    assert.equal(await browser.evaluate('client.stats().detail.entries'), 0);
    await browser.evaluate('window.failSummary=true;first.refresh({invalidate:true})');
    await browser.wait('first.querySelector("[role=alert]")');
    assert.match(await browser.evaluate('first.textContent'), /transport unavailable/u);
    assert.equal(await browser.evaluate('first.textContent.includes("Uninitialized")'), false);
    await browser.evaluate('window.failSummary=false;first.refresh({invalidate:true})');
    await browser.wait('first.querySelector("[data-family=opencog]")');

    await browser.evaluate(`settings.querySelector('[name=tva-override-utility]').click();
      {const input=settings.querySelector('[name=tva-setting-utility]');input.value='0';input.dispatchEvent(new Event('input'))}`);
    assert.equal(await browser.evaluate('calls.writes.length'), 0);
    await browser.evaluate('settings.querySelector(".native-tva-settings-actions .button").click()');
    await browser.wait('settings.querySelector("[role=alert]")');
    assert.match(await browser.evaluate('settings.querySelector(".native-tva-settings-feedback").textContent'), /Revision conflict.*Unsaved input is preserved/u);
    assert.equal(await browser.evaluate('settings.querySelector("[name=tva-setting-utility]").value'), '0');
    assert.deepEqual(await browser.evaluate('calls.writes[0]'), { context: null, revision: 's1', patch: { utility: 0 } });
    await browser.evaluate('window.settingRevision="s2";window.conflict=false;settings.refresh()');
    await browser.wait('settings.controller.get().snapshot.revision==="s2" && !settings.controller.get().loading');
    assert.equal(await browser.evaluate('settings.querySelector("[name=tva-setting-utility]").value'), '0');
    await browser.evaluate('settings.controller.save()');
    assert.equal(await browser.evaluate('calls.writes.at(-1).revision'), 's2');
    assert.equal(await browser.evaluate('settings.controller.get().dirty'), false);

    await browser.evaluate(`settings.querySelector('[name=tva-settings-context]').value=contextKey;
      settings.querySelector('[name=tva-settings-context]').dispatchEvent(new Event('change'))`);
    await browser.wait('settings.controller.get().snapshot.context===contextKey && !settings.controller.get().loading');
    assert.equal(await browser.evaluate('settings.querySelector("[name=tva-setting-utility]").value'), '0');
    assert.equal(await browser.evaluate('settings.querySelector("[name=tva-override-utility]").checked'), false);
    assert.equal(await browser.evaluate('settings.querySelector("[name=tva-setting-utility]").disabled'), true);
    assert.equal(await browser.evaluate('settings.querySelector("[name=tva-setting-direction]").value'), '');
    assert.match(await browser.evaluate('settings.textContent'), /Global: 0/u);
    await browser.evaluate(`settings.controller.edit('monotonic_strength','0');settings.controller.edit('default_strength','.9');settings.controller.edit('direction',':FORWARD');settings.controller.save()`);
    assert.deepEqual(await browser.evaluate('calls.writes.at(-1).patch'), { monotonic_strength: 0, default_strength: .9, direction: ':FORWARD' });
    await browser.evaluate("settings.controller.clear('monotonic_strength');settings.controller.clear('direction');settings.controller.save()");
    assert.deepEqual(await browser.evaluate('calls.writes.at(-1).patch'), { monotonic_strength: null, direction: null });
    assert.equal(await browser.evaluate('settings.querySelector("[name=tva-setting-direction]").value'), '');
    assert.equal(await browser.evaluate('settings.querySelector("[name=tva-setting-monotonic_strength]").disabled'), true);
    assert.equal(await browser.evaluate('originalEditor.value'), 'dirty buffer with selection');
    assert.match(await browser.evaluate('settings.querySelector(".native-tva-prior-settings legend").textContent'), /separate from native TVA/u);
    await browser.evaluate("settings.controller.edit('asserted_positive_truth','0');settings.controller.edit('asserted_monotonic_confidence','.97');settings.controller.edit('asserted_default_confidence','.66');settings.controller.save()");
    assert.deepEqual(await browser.evaluate('calls.writes.at(-1).patch'), { asserted_positive_truth: 0, asserted_monotonic_confidence: .97, asserted_default_confidence: .66 });
    assert.equal(await browser.evaluate('settings.controller.get().snapshot.effective.default_strength.summary.value'), .9);
    await browser.evaluate("settings.controller.clear('asserted_monotonic_confidence');settings.controller.save();showPrior('positive')");
    assert.deepEqual(await browser.evaluate('calls.writes.at(-1).patch'), { asserted_monotonic_confidence: null });
    assert.match(await browser.evaluate('document.querySelector(".native-tva-prior").textContent'), /Configured assertion prior.*not observed evidence/su);
    assert.match(await browser.evaluate('document.querySelector(".native-tva-prior").textContent'), /:MONOTONIC/u);
    assert.match(await browser.evaluate('document.querySelector(".native-tva-prior").textContent'), /0.97/u);
    assert.match(await browser.evaluate('document.querySelector(".native-tva-prior").textContent'), /complete context/u);
    await browser.evaluate("showPrior('negative')");
    assert.match(await browser.evaluate('document.querySelector(".native-tva-prior").textContent'), /Negative assertion.*positive counterpart/u);
    assert.equal(await browser.evaluate('document.querySelector(".native-tva-prior .native-tva-prior-values")'), null);
    assert.match(await browser.evaluate('document.querySelector(".native-tva-prior").textContent'), /:MONOTONIC/u);
    assert.equal(await browser.evaluate('first.querySelector("[data-family=opencog]").textContent.includes("[]")'), true);

    for (const width of [1180, 390]) {
      await browser.send('Emulation.setDeviceMetricsOverride', { width, height: 900, deviceScaleFactor: 1, mobile: width < 600 });
      assert.equal(await browser.evaluate('document.documentElement.scrollWidth<=window.innerWidth'), true);
      assert.equal(await browser.evaluate('getComputedStyle(first).fontSize'), await browser.evaluate('getComputedStyle(second).fontSize'));
      const screenshot = await browser.send('Page.captureScreenshot', { format: 'png' });
      assert(screenshot.data.length > 1000);
    }
    await browser.evaluate('window.delaySummary=true;first.setContext("x_AbortRouteMt")');
    await browser.wait('gates.length===1');
    await browser.evaluate('routeController.abort();gates.splice(0).forEach(resolve=>resolve());window.beforeAbort=calls.summary.length;presentation.set({tvaFamilies:{nars:true}})');
    assert.equal(await browser.evaluate('calls.summary.at(-1).signal.aborted'), true);
    assert.equal(await browser.evaluate('calls.summary.length===beforeAbort'), true);
    assert.equal(await browser.evaluate('document.querySelector("#editor")===originalEditor'), true);
    assert.deepEqual(browser.exceptions, []);
  } finally {
    await browser?.close();
    await new Promise(resolve => server.close(resolve));
  }
});
