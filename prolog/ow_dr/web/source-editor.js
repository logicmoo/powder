import {
  EditorState, StateEffect, StateField, Prec, EditorView, Decoration, keymap, lineNumbers,
  highlightActiveLine, drawSelection, history, defaultKeymap, historyKeymap, indentWithTab,
  StreamLanguage, syntaxHighlighting, HighlightStyle, bracketMatching, indentUnit, commonLisp, tags,
} from './codemirror.bundle.js';
import { renderSourceFile } from './source-files.js';

const MAX_OPEN_BYTES = 256 * 1024 * 1024;
const MAX_OPEN_DOCS = 16;
const docKey = path => String(path).replaceAll('\\', '/').toLowerCase();
const eol = { crlf: '\r\n', cr: '\r', lf: '\n', none: '\n', mixed: '\n' };
const sizeLabel = bytes => bytes < 1024 ? `${bytes} B` :
  `${new Intl.NumberFormat(undefined, { maximumFractionDigits: 1 }).format(bytes / (bytes < 1048576 ? 1024 : 1048576))} ${bytes < 1048576 ? 'KiB' : 'MiB'}`;
const element = (tag, attributes = {}, ...children) => {
  const node = document.createElement(tag);
  for (const [name, value] of Object.entries(attributes)) {
    if (name.startsWith('on')) node.addEventListener(name.slice(2), value);
    else if (name === 'className') node.className = value;
    else if (name === 'hidden' || name === 'disabled') node[name] = value;
    else node.setAttribute(name, value);
  }
  node.append(...children.filter(value => value !== undefined && value !== null));
  return node;
};

// Upstream Common Lisp supplies indentation and reader tokens. Its legacy
// block-comment scanner is non-nesting; this wrapper adds CL nesting and escaped
// |symbols| without executing, formatting, or reinterpreting the source.
export const commonLispLanguage = StreamLanguage.define({
  ...commonLisp,
  startState(unit) {
    const legacy = commonLisp.startState(unit);
    return { legacy, base: legacy.tokenize, depth: 0, bar: false, escaped: false };
  },
  copyState(state) {
    const copyContext = ctx => ctx ? { ...ctx, prev: copyContext(ctx.prev) } : null;
    return { ...state, legacy: { ...state.legacy, ctx: copyContext(state.legacy.ctx) } };
  },
  token(stream, state) {
    if (state.depth || (state.legacy.tokenize === state.base && stream.match('#|'))) {
      if (!state.depth) state.depth = 1;
      while (!stream.eol()) {
        if (stream.match('#|')) state.depth++;
        else if (stream.match('|#')) { if (!--state.depth) break; }
        else stream.next();
      }
      return 'comment';
    }
    if (state.bar || (state.legacy.tokenize === state.base && stream.eat('|'))) {
      state.bar = true;
      while (!stream.eol()) {
        const char = stream.next();
        if (char === '|' && !state.escaped) { state.bar = false; break; }
        state.escaped = char === '\\' && !state.escaped;
      }
      return 'variableName';
    }
    if (state.legacy.tokenize === state.base && stream.match(/^(?:#'|,@|['`,])/)) return 'meta';
    return commonLisp.token(stream, state.legacy);
  },
  indent(state, after, context) { return commonLisp.indent(state.legacy, after, context); },
});

const jumpLine = StateEffect.define();
const jumpDecoration = StateField.define({
  create: () => Decoration.none,
  update(value, transaction) {
    value = value.map(transaction.changes);
    for (const effect of transaction.effects) if (effect.is(jumpLine)) {
      value = Decoration.set([Decoration.line({ class: 'source-editor-jump' }).range(effect.value)]);
    }
    return value;
  },
  provide: field => EditorView.decorations.from(field),
});
const colors = HighlightStyle.define([
  { tag: tags.comment, class: 'cl-comment' }, { tag: tags.string, class: 'cl-string' },
  { tag: tags.special(tags.string), class: 'cl-string' },
  { tag: tags.keyword, class: 'cl-keyword' }, { tag: tags.atom, class: 'cl-keyword' },
  { tag: tags.number, class: 'cl-number' }, { tag: tags.variableName, class: 'cl-symbol' },
  { tag: tags.meta, class: 'cl-reader' }, { tag: tags.bracket, class: 'cl-bracket' },
  { tag: tags.invalid, class: 'cl-invalid' },
]);

async function request(url, options) {
  const response = await fetch(url, { cache: 'no-store', credentials: 'same-origin', ...options });
  let result;
  try { result = await response.json(); } catch { throw new Error(`Source editor request failed (HTTP ${response.status}).`); }
  if (!response.ok) {
    const error = new Error(result.error?.message ?? `Source editor request failed (HTTP ${response.status}).`);
    error.status = response.status; error.details = result.error; throw error;
  }
  return result;
}

export function createSourceEditorWorkspace({
  read = path => request(`api/source/editor?path=${encodeURIComponent(path)}`),
  save = body => request('api/source/editor', {
    method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(body),
  }),
  renderFileRef, onDirtyChange = () => {}, onOpen = () => {}, onSaved = () => {},
  confirmDiscard = message => window.confirm(message),
} = {}) {
  const documents = new Map(), pending = new Map(), panes = [];
  let activePane, lastDocument, destroyed = false, splitDirection = 'vertical', sequence = 0;
  let mountFrame = 0, mountSnapshots = null;
  const status = element('p', { className: 'source-editor-status', role: 'status', 'aria-live': 'polite' });
  const tabs = element('div', { className: 'source-editor-tabs', role: 'tablist', 'aria-label': 'Open source documents' });
  const paneHost = element('div', { className: 'source-editor-panes' });
  const parked = element('div', { hidden: true });
  const button = (label, action, title = label) => element('button', { type: 'button', onclick: action, title }, label);
  const saveButton = button('Save file', () => void saveActive(), 'Save only this source file (Ctrl/Cmd+S). Reload the KB separately.');
  const diskButton = button('Discard / reload disk', () => void reloadActive());
  const closeButton = button('Close document', () => void closeActive());
  const vertical = button('Split side by side', () => split('vertical'));
  const horizontal = button('Split stacked', () => split('horizontal'));
  const onePane = button('Single pane', () => collapsePanes());
  const toolbar = element('div', { className: 'source-editor-toolbar', role: 'toolbar', 'aria-label': 'Source editor controls' },
    saveButton, diskButton, closeButton, vertical, horizontal, onePane);
  const root = element('section', { className: 'source-editor-workspace', 'aria-label': 'Source file editor' },
    element('p', { className: 'source-editor-notice' },
      'Edit original source · Save changes the file only. Compile and reload are separate actions.'),
    toolbar, tabs, status, paneHost, parked);
  const activeDocument = () => activePane?.key ? documents.get(activePane.key) : undefined;
  const dirtyPaths = () => [...documents.values()].filter(doc => doc.dirty).map(doc => doc.path);
  const hasDirty = () => documents.size > 0 && dirtyPaths().length > 0;
  const tell = (message, error = false) => {
    status.textContent = message; status.classList.toggle('error', error);
  };
  const changed = () => { refreshTabs(); updateToolbar(); onDirtyChange(dirtyPaths()); };
  const setActive = pane => {
    activePane = pane;
    if (pane.key) lastDocument = documents.get(pane.key);
    updateToolbar(); refreshTabs();
  };
  function addPane() {
    const pane = { id: ++sequence, key: null };
    pane.label = element('span', {}, `Pane ${panes.length + 1}`);
    pane.close = button('Close pane', () => removePane(pane));
    pane.body = element('div', { className: 'source-editor-pane-body', role: 'tabpanel', id: `source-pane-${pane.id}` });
    pane.node = element('section', { className: 'source-editor-pane', 'aria-label': `Editor pane ${panes.length + 1}`,
      onfocusin: () => { if (activePane !== pane) setActive(pane); } },
      element('header', { className: 'source-editor-pane-heading' }, pane.label, pane.close), pane.body);
    pane.node.addEventListener('pointerdown', () => { if (pane.key) setActive(pane); });
    panes.push(pane); paneHost.append(pane.node); emptyPane(pane); return pane;
  }
  function emptyPane(pane) {
    pane.key = null; pane.label.textContent = `Pane ${panes.indexOf(pane) + 1}`;
    pane.body.removeAttribute('aria-labelledby');
    pane.body.replaceChildren(element('div', { className: 'source-editor-empty' },
      element('p', {}, 'Choose a source tab, or move the active document here.'),
      button('Move active document here', () => {
        const doc = activeDocument() ?? lastDocument;
        if (doc && documents.has(doc.key)) show(doc, pane, false);
        else tell('Open or select a source document first.');
      })));
  }
  function updateToolbar() {
    const doc = activeDocument();
    saveButton.disabled = !doc || !doc.dirty || doc.saving || doc.editable === false;
    diskButton.disabled = !doc || doc.saving || doc.loading;
    closeButton.disabled = !doc || doc.saving || doc.loading;
    vertical.disabled = horizontal.disabled = panes.length >= 4;
    onePane.disabled = panes.length === 1;
    for (const pane of panes) {
      pane.node.classList.toggle('active', pane === activePane);
      pane.close.disabled = panes.length === 1;
    }
  }
  function refreshTabs() {
    for (const doc of documents.values()) {
      const isActive = activeDocument() === doc;
      doc.tab.setAttribute('aria-selected', String(isActive));
      doc.tab.tabIndex = isActive ? 0 : -1;
      if (doc.pane) doc.tab.setAttribute('aria-controls', doc.pane.body.id);
      else doc.tab.removeAttribute('aria-controls');
      doc.tab.setAttribute('aria-label', `${doc.path}${doc.dirty ? ', unsaved changes' : ''}`);
      doc.dirtyMark.textContent = doc.dirty ? ' ●' : '';
      doc.dirtyMark.setAttribute('aria-hidden', 'true');
      doc.close.disabled = !!doc.saving;
    }
  }
  function fileReference(doc) {
    if (renderFileRef) {
      const result = renderFileRef(doc.path, doc.path);
      return result.node ?? result;
    }
    const metadata = { get: () => ({ type: 'file', sizeBytes: doc.sizeBytes,
      startup: null, loaded: null, cached: null, indexed: null,
      warnings: null, errors: null, sizeEvidence: 'Measured from the complete original source read.' }) };
    return renderSourceFile(doc.path, doc.path, metadata, { element }).node;
  }
  function createDocument(data) {
    const doc = { ...data, key: docKey(data.path), dirty: false, saving: false, pane: null, scroll: [0, 0] };
    doc.dirtyMark = element('span');
    doc.tab = button(data.path.split('/').at(-1), () => show(doc), data.path);
    doc.tab.id = `source-tab-${++sequence}`;
    doc.tab.append(doc.dirtyMark); doc.tab.setAttribute('role', 'tab');
    doc.tab.addEventListener('keydown', event => {
      if (event.key === 'Delete') { event.preventDefault(); void closeDocument(doc); }
      if (!['ArrowLeft', 'ArrowRight', 'Home', 'End'].includes(event.key)) return;
      event.preventDefault();
      const all = [...documents.values()], index = all.indexOf(doc);
      const next = event.key === 'Home' ? 0 : event.key === 'End' ? all.length - 1 :
        (index + (event.key === 'ArrowRight' ? 1 : -1) + all.length) % all.length;
      show(all[next]); all[next].tab.focus();
    });
    doc.close = button('×', () => void closeDocument(doc), `Close ${doc.path}`);
    doc.close.setAttribute('aria-label', `Close ${doc.path}`);
    doc.tabContainer = element('div', { className: 'source-editor-tab' }, doc.tab, doc.close);
    tabs.append(doc.tabContainer);
    const normalized = data.newline === 'mixed' ? data.text.replace(/\r\n?|\n/g, '\n') : data.text;
    doc.view = new EditorView({
      state: EditorState.create({ doc: normalized, extensions: [
        EditorState.lineSeparator.of(eol[data.newline] ?? '\n'), EditorState.readOnly.of(data.editable === false),
        EditorView.editable.of(data.editable !== false),
        EditorView.contentAttributes.of({ 'aria-label': `Source text for ${doc.path}`, spellcheck: 'false' }),
        lineNumbers(), highlightActiveLine(), drawSelection(), history(), jumpDecoration,
        commonLispLanguage, syntaxHighlighting(colors), bracketMatching(), indentUnit.of('  '),
        Prec.highest(keymap.of([{ key: 'Mod-s', preventDefault: true, run: () => { void saveDocument(doc); return true; } }])),
        keymap.of([...defaultKeymap, ...historyKeymap, indentWithTab]),
        EditorView.updateListener.of(update => {
          if (update.docChanged) { doc.dirty = !update.state.doc.eq(doc.savedDocument); changed(); }
        }),
        EditorView.theme({
          '&': { height: '100%', fontSize: '14px' },
          '.cm-scroller': { overflow: 'auto', fontFamily: 'ui-monospace, "Cascadia Code", Consolas, monospace' },
          '.cm-content': { minHeight: '100%', padding: '8px 0' },
          '.cm-cursor, .cm-dropCursor': { borderLeftColor: 'var(--ink)' },
          '&.cm-focused .cm-selectionBackground, .cm-selectionBackground': { backgroundColor: 'var(--accent-soft)' },
        }),
      ] }),
    });
    doc.savedDocument = doc.view.state.doc;
    doc.view.scrollDOM.addEventListener('scroll', () => {
      if (doc.pane && root.isConnected && root.getClientRects().length && !mountSnapshots) {
        doc.scroll = [doc.view.scrollDOM.scrollLeft, doc.view.scrollDOM.scrollTop];
        doc.scrollEffect = doc.view.scrollSnapshot();
      }
    });
    doc.fileRef = fileReference(doc);
    doc.details = element('p', { className: 'source-editor-identity' });
    doc.container = element('div', { className: 'source-editor-document' },
      doc.fileRef, doc.details, element('div', { className: 'source-editor-surface' }, doc.view.dom));
    updateIdentity(doc); documents.set(doc.key, doc); parked.append(doc.container); return doc;
  }
  function updateIdentity(doc) {
    doc.details.textContent = `${doc.encoding === 'iso_latin_1' ? 'ISO-8859-1' : 'UTF-8'}${doc.bom ? ' · BOM preserved' : ''} · ${doc.newline.toUpperCase()} · ${sizeLabel(doc.sizeBytes)}${doc.editable === false ? ` · Read-only: ${doc.reason}` : ''}`;
  }
  function park(doc) {
    doc.scroll = [doc.view.scrollDOM.scrollLeft, doc.view.scrollDOM.scrollTop];
    doc.scrollEffect = doc.view.scrollSnapshot();
    parked.append(doc.container);
    if (doc.pane) emptyPane(doc.pane);
    doc.pane = null;
  }
  function show(doc, target = activePane, focusExisting = true) {
    if (focusExisting && doc.pane) target = doc.pane;
    if (doc.pane === target && doc.container.parentElement === target.body) {
      setActive(target); doc.view.focus(); onOpen(doc.path); return doc;
    }
    if (target.key && target.key !== doc.key) park(documents.get(target.key));
    if (doc.pane && doc.pane !== target) park(doc);
    target.key = doc.key; target.body.replaceChildren(doc.container);
    target.body.setAttribute('aria-labelledby', doc.tab.id);
    target.label.textContent = doc.path.split('/').at(-1);
    doc.pane = target; setActive(target);
    doc.view.requestMeasure();
    requestAnimationFrame(() => {
      if (destroyed || doc.pane !== target) return;
      if (doc.scrollEffect) doc.view.dispatch({ effects: doc.scrollEffect });
      else [doc.view.scrollDOM.scrollLeft, doc.view.scrollDOM.scrollTop] = doc.scroll;
    });
    doc.view.focus(); onOpen(doc.path); return doc;
  }
  async function open(path, { line } = {}) {
    if (destroyed) throw new Error('This source workspace was closed.');
    const key = docKey(path);
    if (documents.has(key)) { const doc = show(documents.get(key)); if (line) jump(doc, line); return doc; }
    if (pending.has(key)) { const doc = await pending.get(key); if (doc) { show(doc); if (line) jump(doc, line); } return doc; }
    if (documents.size + pending.size >= MAX_OPEN_DOCS) {
      tell(`The workspace supports ${MAX_OPEN_DOCS} open documents. Close a document before opening another.`, true);
      return null;
    }
    const operation = (async () => {
      tell(`Loading complete source: ${path} …`);
      root.setAttribute('aria-busy', 'true');
      try {
        const data = await read(path);
        if (destroyed) return null;
        if (typeof data.text !== 'string' || !data.revision || !data.path) throw new Error('The source endpoint did not return a complete editable document.');
        let doc = documents.get(docKey(data.path));
        if (!doc) {
          const bytes = [...documents.values()].reduce((sum, item) => sum + item.sizeBytes, 0);
          if (bytes + data.sizeBytes > MAX_OPEN_BYTES) throw new Error('The 256 MiB open-source budget is exceeded. Close another document first; nothing was truncated.');
          doc = createDocument(data);
        }
        show(doc); if (line) jump(doc, line);
        tell(data.editable === false ? data.reason : `Opened ${data.path}. No compilation or KB load was performed.`);
        changed(); return doc;
      } catch (error) {
        tell(`${error.message} Your other buffers are unchanged.`, true); return null;
      } finally { pending.delete(key); root.setAttribute('aria-busy', String(pending.size > 0)); }
    })();
    pending.set(key, operation); return operation;
  }
  function jump(doc, number) {
    mountSnapshots?.delete(doc.key);
    const position = doc.view.state.doc.line(Math.max(1, Math.min(doc.view.state.doc.lines, Number(number) || 1))).from;
    doc.view.dispatch({ selection: { anchor: position },
      effects: [jumpLine.of(position), EditorView.scrollIntoView(position, { y: 'center' })] });
    requestAnimationFrame(() => {
      if (!destroyed && doc.pane) doc.view.dispatch({ effects: EditorView.scrollIntoView(position, { y: 'center' }) });
    });
    doc.view.focus();
  }
  async function saveDocument(doc) {
    if (!doc || doc.saving || doc.editable === false || !doc.dirty) return false;
    const sentDocument = doc.view.state.doc;
    const text = doc.view.state.sliceDoc();
    doc.saving = true; changed(); tell(`Saving ${doc.path} …`);
    try {
      const result = await save({ path: doc.path, text, expectedRevision: doc.revision });
      if (!result.revision) throw new Error('Save response is missing the disk revision. Retain this buffer and reopen to compare.');
      doc.revision = result.revision; doc.savedDocument = sentDocument;
      doc.sizeBytes = result.sizeBytes ?? doc.sizeBytes; doc.newline = result.newline ?? doc.newline;
      doc.dirty = !doc.view.state.doc.eq(sentDocument); updateIdentity(doc);
      tell(`Saved ${doc.path}. ${doc.dirty ? 'Newer buffer edits are still unsaved. ' : ''}The loaded KB is unchanged; reload it separately.`);
      try { await onSaved(doc.path, result); }
      catch (error) { tell(`Saved ${doc.path}, but displayed file metadata could not refresh: ${error.message}. The loaded KB is unchanged.`, true); }
      return true;
    } catch (error) {
      const conflict = error.status === 409 || error.details?.code === 'conflict';
      tell(`${conflict ? 'Disk conflict. ' : 'Save failed. '}${error.message} Buffer and undo history retained. Use Discard / reload disk only to explicitly discard your edits.`, true);
      return false;
    } finally { doc.saving = false; changed(); }
  }
  const saveActive = () => saveDocument(activeDocument());
  async function reloadActive() {
    const doc = activeDocument();
    if (!doc || doc.saving) return false;
    if (doc.dirty && !await confirmDiscard(`Discard unsaved changes in ${doc.path} and reload from disk?`)) return false;
    doc.loading = true; updateToolbar(); tell(`Reloading ${doc.path} from disk …`);
    try {
      const data = await read(doc.path);
      const pane = doc.pane;
      const replacement = createDocument(data);
      destroyDocument(doc);
      documents.set(replacement.key, replacement);
      show(replacement, pane); changed();
      tell(`Reloaded ${data.path}. The loaded KB is unchanged.`); return true;
    } catch (error) {
      tell(`Reload failed: ${error.message}. The existing buffer is retained.`, true); return false;
    } finally { doc.loading = false; updateToolbar(); }
  }
  function destroyDocument(doc) {
    if (doc.pane) emptyPane(doc.pane);
    doc.view.destroy(); doc.container.remove(); doc.tabContainer.remove(); documents.delete(doc.key);
  }
  async function closeDocument(doc) {
    if (doc.saving || doc.loading) { tell('Wait for the current file operation before closing.', true); return false; }
    if (doc.dirty && !await confirmDiscard(`Discard unsaved changes and close ${doc.path}?`)) return false;
    const pane = doc.pane; destroyDocument(doc);
    const next = [...documents.values()].find(item => !item.pane);
    if (next && pane) show(next, pane);
    changed(); return true;
  }
  const closeActive = () => { const doc = activeDocument(); return doc ? closeDocument(doc) : Promise.resolve(true); };
  function split(direction = 'vertical') {
    if (!['horizontal', 'vertical'].includes(direction)) throw new Error('Split direction must be horizontal or vertical.');
    if (panes.length >= 4) return false;
    const doc = activeDocument(), pane = addPane();
    splitDirection = direction;
    paneHost.dataset.split = direction; paneHost.style.setProperty('--pane-count', panes.length);
    if (doc) show(doc, pane, false); else setActive(pane);
    return true;
  }
  function removePane(pane) {
    if (panes.length === 1) return;
    const doc = pane.key && documents.get(pane.key);
    if (doc) park(doc);
    panes.splice(panes.indexOf(pane), 1); pane.node.remove();
    const target = activePane === pane ? panes[0] : activePane;
    if (doc && !target.key) show(doc, target); else setActive(target);
    paneHost.style.setProperty('--pane-count', panes.length);
  }
  function collapsePanes() {
    const doc = activeDocument();
    while (panes.length > 1) removePane(panes.at(-1));
    if (doc) show(doc, panes[0], false);
  }
  async function guardNavigation() {
    if (!hasDirty()) return true;
    return !!await confirmDiscard(`There are unsaved changes in ${dirtyPaths().length} source document(s). Leave the editor view? Buffers remain open; closing/reloading this browser page loses them.`);
  }
  function mountWorkspace(host) {
    if (!mountSnapshots) {
      const connected = root.isConnected && root.getClientRects().length;
      mountSnapshots = new Map([...documents.values()].filter(doc => doc.pane).map(doc => [
        doc.key, { doc, effect: connected ? doc.view.scrollSnapshot() : doc.scrollEffect, scroll: doc.scroll },
      ]));
    }
    host.append(root);
    if (mountFrame) cancelAnimationFrame(mountFrame);
    mountFrame = requestAnimationFrame(() => {
      mountFrame = 0;
      if (destroyed) return;
      const snapshots = mountSnapshots; mountSnapshots = null;
      for (const { doc, effect, scroll } of snapshots.values()) {
        if (!doc.pane || documents.get(doc.key) !== doc) continue;
        if (effect) doc.view.dispatch({ effects: effect });
        else [doc.view.scrollDOM.scrollLeft, doc.view.scrollDOM.scrollTop] = scroll;
        doc.view.requestMeasure();
      }
    });
    for (const doc of documents.values()) doc.view.requestMeasure();
  }
  const beforeUnload = event => {
    if (!hasDirty()) return;
    event.preventDefault(); event.returnValue = '';
  };
  const saveShortcut = event => {
    if (!(event.ctrlKey || event.metaKey) || event.key.toLowerCase() !== 's' || event.altKey) return;
    if (!root.isConnected || root.hidden || !root.getClientRects().length) return;
    event.preventDefault(); event.stopPropagation(); void saveActive();
  };
  activePane = addPane(); updateToolbar();
  window.addEventListener('keydown', saveShortcut, true);
  window.addEventListener('beforeunload', beforeUnload);
  return {
    element: root, open, hasDirty, dirtyPaths, guardNavigation, saveActive, closeActive,
    reloadActive, split,
    mount: mountWorkspace,
    focus(path, line) { const doc = documents.get(docKey(path)); if (!doc) return false; show(doc); if (line) jump(doc, line); return true; },
    getDocument(path) { return documents.get(docKey(path)); },
    get layout() { return { direction: splitDirection, panes: panes.map(pane => ({ id: pane.id, path: pane.key ? documents.get(pane.key).path : null })) }; },
    destroy({ discard = false } = {}) {
      if (!discard && hasDirty()) return false;
      destroyed = true; window.removeEventListener('beforeunload', beforeUnload);
      window.removeEventListener('keydown', saveShortcut, true);
      if (mountFrame) cancelAnimationFrame(mountFrame);
      mountSnapshots = null;
      for (const doc of [...documents.values()]) destroyDocument(doc);
      root.remove(); return true;
    },
  };
}
