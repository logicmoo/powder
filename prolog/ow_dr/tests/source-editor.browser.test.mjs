import test from 'node:test';
import assert from 'node:assert/strict';
import { createServer } from 'node:http';
import { readFile, mkdir, writeFile } from 'node:fs/promises';
import { fileURLToPath } from 'node:url';
import { dirname, join } from 'node:path';
import { launchChromium } from './chromium.mjs';

const app = dirname(dirname(fileURLToPath(import.meta.url)));
const chrome = process.env.CHROME_PATH || 'C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe';
const fixtureHTML = `<!doctype html><html><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width,initial-scale=1"><link rel="stylesheet" href="/style.css"><link rel="stylesheet" href="/source-editor.css"></head>
<body><main></main><script type="module">
import {createSourceEditorWorkspace,commonLispLanguage} from '/source-editor.js';
import {EditorState,ensureSyntaxTree,undo,redo} from '/codemirror.bundle.js';
window.cm={EditorState,ensureSyntaxTree,undo,redo,commonLispLanguage};
window.disk=new Map();
window.saves=[];window.reads=[];window.allowDiscard=false;window.prompts=[];window.conflict=false;
const source=(path,text,newline='lf')=>({path,text,newline,revision:'a'.repeat(64),encoding:'iso_latin_1',bom:false,sizeBytes:text.length,editable:true});
disk.set('KBs/a.krf',source('KBs/a.krf','(one a)\\n(two b)\\n(three c)\\n'));
disk.set('KBs/b.krf',source('KBs/b.krf','(other z)\\n'));
disk.set('KBs/crlf.krf',source('KBs/crlf.krf','(one)\\r\\n(two)\\r\\n','crlf'));
disk.set('KBs/large.krf',source('KBs/large.krf','(large predicate symbol value property data more text data 123456)\\n'.repeat(126000)));
window.workspace=createSourceEditorWorkspace({
 read: async path=>{reads.push(path);const d=disk.get(path);if(!d)throw new Error('Missing source');return {...d};},
 save: async body=>{saves.push(body);if(conflict){const e=new Error('changed externally');e.status=409;throw e;}
 const d={...disk.get(body.path),text:body.text,revision:'b'.repeat(64),sizeBytes:body.text.length};disk.set(body.path,d);return {...d,saved:true};},
 confirmDiscard: message=>{prompts.push(message);return allowDiscard;},
});
workspace.mount(document.querySelector('main'));window.ready=true;
</script></body></html>`;

test('real CodeMirror tabs, guarded buffers, splits, Lisp tokens, saves and large documents', { timeout: 90000 }, async () => {
  const server = createServer(async (req, res) => {
    if (req.url === '/') { res.writeHead(200, { 'content-type': 'text/html' }); res.end(fixtureHTML); return; }
    const name = req.url.slice(1);
    if (!/^[a-zA-Z0-9.-]+\.(?:js|css|json)$/.test(name)) { res.writeHead(404); res.end(); return; }
    try {
      const bytes = await readFile(join(app, 'web', name));
      res.writeHead(200, { 'content-type': name.endsWith('.js') ? 'application/javascript' : name.endsWith('.json') ? 'application/json' : 'text/css' }); res.end(bytes);
    } catch { res.writeHead(404); res.end(); }
  });
  await new Promise(resolve => server.listen(0, '127.0.0.1', resolve));
  const browser = await launchChromium(chrome);
  try {
    await browser.send('Page.navigate', { url: `http://127.0.0.1:${server.address().port}/` });
    await browser.wait('window.ready === true');
    await browser.evaluate("workspace.open('KBs/a.krf',{line:2}).then(()=>true)");
    assert.equal(await browser.evaluate("!!document.querySelector('.cm-editor .cm-content[contenteditable=true]')"), true);
    assert.equal(await browser.evaluate("document.querySelector('textarea') === null"), true);
    assert.equal(await browser.evaluate("workspace.getDocument('KBs/a.krf').view.state.selection.main.head"), 8);
    await browser.evaluate("window.a=workspace.getDocument('KBs/a.krf');a.view.dispatch({changes:{from:0,to:0,insert:'; unsaved\\n'}})");
    assert.equal(await browser.evaluate('workspace.hasDirty()'), true);
    await browser.evaluate("workspace.open('KBs/b.krf').then(()=>true)");
    assert.equal(await browser.evaluate("workspace.getDocument('KBs/a.krf')===a"), true);
    const reparent = await browser.evaluate(`(()=>{
      const root=workspace.element,view=a.view,selection=a.view.state.selection.toJSON();
      const classic=document.createElement('section');classic.className='classic-layout-fixture';
      document.querySelector('main').append(classic);workspace.mount(classic);
      const kept=workspace.element===root && workspace.getDocument('KBs/a.krf').view===view;
      workspace.mount(document.querySelector('main'));classic.remove();
      return {kept,selection:JSON.stringify(selection)===JSON.stringify(a.view.state.selection.toJSON()),
        dirty:workspace.dirtyPaths(),reads:reads.length,tabs:document.querySelectorAll('[role=tab]').length};
    })()`);
    assert.equal(reparent.kept, true); assert.equal(reparent.selection, true);
    assert.deepEqual(reparent.dirty, ['KBs/a.krf']); assert.equal(reparent.reads, 2); assert.equal(reparent.tabs, 2);
    await browser.evaluate("workspace.focus('KBs/a.krf')");
    assert.equal(await browser.evaluate('cm.undo(a.view); workspace.hasDirty()'), false);
    assert.equal(await browser.evaluate('cm.redo(a.view); workspace.hasDirty()'), true);
    assert.equal(await browser.evaluate('workspace.closeActive()'), false);
    assert.equal(await browser.evaluate("a.view.state.doc.toString().startsWith('; unsaved')"), true);
    assert.equal(await browser.evaluate('workspace.guardNavigation()'), false);
    assert.equal(await browser.evaluate("(()=>{const event=new Event('beforeunload',{cancelable:true});window.dispatchEvent(event);return event.defaultPrevented;})()"), true);
    await browser.evaluate("workspace.split('vertical')");
    assert.equal(await browser.evaluate('workspace.layout.panes.length'), 2);
    assert.equal(await browser.evaluate("document.querySelectorAll('.source-editor-panes .cm-editor').length"), 1);
    await browser.evaluate("workspace.focus('KBs/b.krf')");
    assert.equal(await browser.evaluate("workspace.getDocument('KBs/a.krf')===a"), true);
    await browser.evaluate("workspace.open('KBs/a.krf',{line:3}).then(()=>true)");
    assert.equal(await browser.evaluate("a.view.state.doc.lineAt(a.view.state.selection.main.head).number"), 3);
    assert.equal(await browser.evaluate('reads.length'), 2);
    await browser.evaluate("window.conflict=true;workspace.saveActive()");
    assert.equal(await browser.evaluate('workspace.hasDirty()'), true);
    assert.match(await browser.evaluate("document.querySelector('.source-editor-status').textContent"), /Disk conflict/);
    await browser.evaluate('window.conflict=false');
    const shortcut = await browser.evaluate(`(()=>{
      const event=new KeyboardEvent('keydown',{key:'s',ctrlKey:true,bubbles:true,cancelable:true});
      a.view.contentDOM.dispatchEvent(event);return event.defaultPrevented;
    })()`);
    assert.equal(shortcut, true);
    await browser.wait('!workspace.hasDirty()');
    assert.equal(await browser.evaluate('saves.length'), 2);
    assert.equal(await browser.evaluate("(()=>{const event=new Event('beforeunload',{cancelable:true});window.dispatchEvent(event);return event.defaultPrevented;})()"), false);
    assert.equal(await browser.evaluate('workspace.guardNavigation()'), true);
    await browser.evaluate("(async()=>{await workspace.open('KBs/crlf.krf');window.crlf=workspace.getDocument('KBs/crlf.krf');crlf.view.dispatch({changes:{from:0,to:0,insert:'; test\\r\\n'}});return workspace.saveActive();})()");
    assert.equal(await browser.evaluate("saves.at(-1).text"), '; test\r\n(one)\r\n(two)\r\n');
    const tokens = await browser.evaluate(`(()=>{
      const text='(defun f (x)\\n  :keyword "escaped \\\\"string" ; line\\n  #| outer #| inner |# still comment |#\\n  \\'x #\\'f \`x ,@x |a\\\\|b| (list x))';
      const state=cm.EditorState.create({doc:text,extensions:[cm.commonLispLanguage]});
      const tree=cm.ensureSyntaxTree(state,text.length,5000);const tokens=[];
      tree.iterate({enter:node=>{if(node.type.name!=='Document')tokens.push({type:node.type.name,text:text.slice(node.from,node.to)})}});
      return tokens;
    })()`);
    assert(tokens.some(token => /comment/i.test(token.type) && token.text.includes('still comment')));
    assert(tokens.some(token => /string/i.test(token.type) && token.text.includes('escaped')));
    assert(tokens.some(token => /keyword/i.test(token.type) && token.text.includes('defun')));
    assert(tokens.some(token => /atom/i.test(token.type) && token.text.includes(':keyword')));
    await browser.evaluate("workspace.focus('KBs/a.krf');a.view.dispatch({changes:{from:0,to:0,insert:'; keep me\\n'}})");
    assert.equal(await browser.evaluate('workspace.reloadActive()'), false);
    assert.equal(await browser.evaluate("a.view.state.doc.toString().startsWith('; keep me')"), true);
    assert.equal(await browser.evaluate('workspace.destroy()'), false);
    await browser.evaluate("window.allowDiscard=true;workspace.reloadActive()");
    assert.equal(await browser.evaluate('workspace.hasDirty()'), false);
    assert.equal(await browser.evaluate("workspace.getDocument('KBs/a.krf').view.state.doc.toString().startsWith('; keep me')"), false);
    await browser.evaluate("workspace.getDocument('KBs/a.krf').view.dispatch({changes:{from:0,to:0,insert:'; close me\\n'}})");
    assert.equal(await browser.evaluate('workspace.closeActive()'), true);
    assert.equal(await browser.evaluate("!!workspace.getDocument('KBs/a.krf')"), false);
    const large = await browser.evaluate(`(async()=>{
      const start=performance.now();await workspace.open('KBs/large.krf',{line:126000});
      const doc=workspace.getDocument('KBs/large.krf');
      return {ms:performance.now()-start,length:doc.view.state.doc.length,lines:doc.view.state.doc.lines,
        target:doc.view.state.doc.lineAt(doc.view.state.selection.main.head).number};
    })()`);
    assert(large.length > 8_000_000); assert.equal(large.lines, 126001); assert.equal(large.target, 126000);
    console.log(`CodeMirror synthetic 126k-line ${large.length}-character source opened/jumped in ${Math.round(large.ms)}ms`);
    await browser.evaluate('new Promise(resolve=>setTimeout(resolve,150))');
    assert.equal(await browser.evaluate("(()=>{const d=workspace.getDocument('KBs/large.krf');return d.view.viewport.to>=d.view.state.doc.line(126000).from;})()"), true);
    await browser.evaluate("window.largeDoc=workspace.getDocument('KBs/large.krf');window.previousScroll=largeDoc.view.scrollDOM.scrollTop;workspace.focus('KBs/crlf.krf');workspace.focus('KBs/large.krf')");
    await browser.evaluate('new Promise(resolve=>setTimeout(resolve,100))');
    assert.equal(await browser.evaluate("Math.abs(largeDoc.view.scrollDOM.scrollTop-previousScroll)<2"), true);
    await browser.evaluate('largeDoc.view.scrollDOM.scrollTop=largeDoc.view.scrollDOM.scrollHeight*.48');
    await browser.evaluate('new Promise(resolve=>setTimeout(resolve,100))');
    await browser.evaluate('window.previousScrollPosition=largeDoc.view.lineBlockAtHeight(largeDoc.view.scrollDOM.scrollTop).from');
    await browser.evaluate(`(()=>{
      const classic=document.createElement('section');document.querySelector('main').append(classic);
      workspace.mount(classic);workspace.mount(document.querySelector('main'));classic.remove();
    })()`);
    await browser.evaluate('new Promise(resolve=>setTimeout(resolve,100))');
    assert.equal(await browser.evaluate("Math.abs(largeDoc.view.lineBlockAtHeight(largeDoc.view.scrollDOM.scrollTop).from-previousScrollPosition)<=67"), true);
    await browser.evaluate(`(()=>{
      workspace.element.remove();
      workspace.mount(document.querySelector('main'));
    })()`);
    await browser.evaluate('new Promise(resolve=>setTimeout(resolve,100))');
    assert.equal(await browser.evaluate("Math.abs(largeDoc.view.lineBlockAtHeight(largeDoc.view.scrollDOM.scrollTop).from-previousScrollPosition)<=67"), true);
    await browser.evaluate("document.querySelector('.source-editor-empty button').focus();workspace.focus('KBs/b.krf');workspace.focus('KBs/large.krf')");
    assert.equal(await browser.evaluate("document.querySelectorAll('.source-editor-panes .cm-editor').length"), 2);
    if (process.env.EDITOR_SCREENSHOTS) {
      await mkdir(join(app, 'tests', 'artifacts'), { recursive: true });
      await browser.send('Emulation.setDeviceMetricsOverride', { width: 1440, height: 1000, deviceScaleFactor: 1, mobile: false });
      await browser.evaluate('new Promise(resolve=>setTimeout(resolve,150))');
      const screenshot = await browser.send('Page.captureScreenshot', { format: 'png' });
      await writeFile(join(app, 'tests', 'artifacts', 'source-editor-desktop.png'), Buffer.from(screenshot.data, 'base64'));
    }
    await browser.evaluate("workspace.split('horizontal')");
    assert.equal(await browser.evaluate('workspace.layout.direction'), 'horizontal');
    await browser.send('Emulation.setDeviceMetricsOverride', { width: 390, height: 844, deviceScaleFactor: 1, mobile: true });
    await browser.evaluate('new Promise(resolve=>setTimeout(resolve,200))');
    assert.equal(await browser.evaluate('innerWidth'), 390);
    assert.equal(await browser.evaluate('document.documentElement.scrollWidth <= innerWidth'), true);
    if (process.env.EDITOR_SCREENSHOTS) {
      const screenshot = await browser.send('Page.captureScreenshot', { format: 'png' });
      await writeFile(join(app, 'tests', 'artifacts', 'source-editor-mobile.png'), Buffer.from(screenshot.data, 'base64'));
    }
    assert.deepEqual(browser.exceptions, []);
    assert.equal(await browser.evaluate('workspace.destroy()'), true);
  } catch (error) {
    console.error(JSON.stringify(browser.exceptions, null, 2));
    console.error(await browser.evaluate("window.largeDoc ? ({current:largeDoc.view.scrollDOM.scrollTop,previous:previousScroll,stored:largeDoc.scroll,viewport:largeDoc.view.viewport,height:largeDoc.view.scrollDOM.scrollHeight}) : null"));
    console.error(await browser.evaluate("({url:location.href,html:document.documentElement.outerHTML.slice(0,600),resources:performance.getEntriesByType('resource').map(r=>r.name)})"));
    throw error;
  } finally {
    await browser.close(); await new Promise(resolve => server.close(resolve));
  }
});
