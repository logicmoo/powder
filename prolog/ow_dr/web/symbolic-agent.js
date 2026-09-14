// Extend powder's operating workspace, not its authority: a persistent Cyc
// conversation beside evidence, explicit knowledge scope and bounded controls.
// Inherit the existing surface/ink/line palette and typography. Start is always
// deliberate; unavailable knowledge and uncertain outcomes stay visible.
let instance = 0;
export const SYMBOLIC_STORAGE = Object.freeze({
  settings: 'powder.cyc.settings.v1', draft: 'powder.cyc.drafts.v1',
  history: 'powder.cyc.history.v1', pending: 'powder.cyc.pending.v1',
});
export function linkedMts(text) {
  return [...new Set(text.split(/\r?\n/u).map(value => value.trim()).filter(Boolean))];
}
export function controlAvailability(run, pending = false, unknown = false) {
  const phase = run?.phase, terminal = ['stopped', 'failed'].includes(phase);
  return {
    start: !pending && !unknown,
    send: !!run && !pending && !unknown && ['awaiting_input', 'gap'].includes(phase),
    continue: !!run && !pending && !unknown && (['running', 'compensating'].includes(phase)
      || phase === 'awaiting_action' && run.pending?.stage === 'planned'),
    interrupt: !!run && !pending && !terminal && run.status !== 'created' && phase !== 'interrupted',
    resume: !!run && !pending && !unknown && (run.status === 'created'
      || phase === 'interrupted' && run.pending?.kind !== 'action'),
    stop: !!run && !pending && !terminal,
    form: !!run && !pending && !unknown && phase === 'awaiting_form',
  };
}
export function symbolicText(wire) {
  const visit = (node, depth = 0) => {
    if (!node || depth > 128) return '[unavailable]';
    switch (node.type) {
      case 'symbol': return String(node.value).replace(/^x_/u, '');
      case 'string': return JSON.stringify(node.value);
      case 'number': return String(node.value);
      case 'variable': return `?${node.id}`;
      case 'nil': return '()';
      case 'list': return `([] ${node.items.map(n => visit(n, depth + 1)).join(' ')})`;
      case 'compound': return `(${String(node.functor).replace(/^x_/u, '')}${node.args.length ? ' ' : ''}${node.args.map(n => visit(n, depth + 1)).join(' ')})`;
      case 'dict': return `{${node.entries.map(p => `${visit(p.key, depth + 1)}: ${visit(p.value, depth + 1)}`).join(', ')}}`;
      default: return '[unsupported term]';
    }
  };
  return visit(wire?.term ?? wire);
}
export function mergeEvents(before, after) {
  return [...new Map([...before, ...after].map(event => [event.sequence, event])).values()]
    .sort((a, b) => a.sequence - b.sequence).slice(-200);
}

/**
 * host.api(path, query, {method, body, signal}) uses the application API base.
 * Deactivate hides the view only: no work is submitted, cancelled or replayed.
 */
export function createSymbolicAgent(host, {
  signal, active = true, onStateChange, storage,
} = {}) {
  const { api, element: el, button, heading } = host;
  const viewId = `cyc-${++instance}`, lifecycle = new AbortController();
  try { storage ??= globalThis.localStorage; } catch { /* Storage can be denied. */ }
  const read = (key, fallback) => {
    try { return JSON.parse(storage?.getItem(key) ?? 'null') ?? fallback; } catch { return fallback; }
  };
  const write = (key, value) => {
    try { storage?.setItem(key, JSON.stringify(value)); }
    catch { storageFailed = true; }
  };
  let storageFailed = false, disposed = false, busy = false, unread = 0;
  let settings = read(SYMBOLIC_STORAGE.settings, {});
  let drafts = read(SYMBOLIC_STORAGE.draft, {});
  let history = read(SYMBOLIC_STORAGE.history, []);
  if (!Array.isArray(history)) history = [];
  if (!settings || typeof settings !== 'object') settings = {};
  if (!drafts || typeof drafts !== 'object' || Array.isArray(drafts)) drafts = {};
  history = history.filter(item => typeof item?.id === 'string' && typeof item?.conversation === 'string').slice(-20);
  let run = null, events = [], unknown = read(SYMBOLIC_STORAGE.pending, null);
  let currentId = history.at(-1)?.id ?? null, currentConversation = history.at(-1)?.conversation ?? null;
  let inspection = 'State', eventTotal = 0;
  if (!document.querySelector('link[data-symbolic-agent-style]')) {
    document.head.append(el('link', { rel: 'stylesheet', 'data-symbolic-agent-style': '',
      href: new URL('./symbolic-agent.css', import.meta.url).href }));
  }
  const panel = el('section', { className: 'symbolic-agent', hidden: !active, 'data-agent': 'symbolic' },
    heading('Cyc', 'Knowledge-defined text dialogue and workflows. No model, network fallback or operator access.'));
  const feedback = el('p', { className: 'cyc-feedback', role: 'status', 'aria-live': 'polite' },
    'Knowledge unavailable until an explicit loaded definition and its linked MTs are selected.');
  const identity = el('p', { className: 'cyc-identity' });
  const transcript = el('section', { className: 'cyc-transcript', 'aria-label': 'Cyc conversation history' });
  const picker = el('select', { 'aria-label': 'Cyc conversations', onchange: selectConversation });
  const text = el('textarea', { rows: 3, maxLength: 4096, name: 'cyc-message', value: drafts[currentId ?? 'new'] ?? '',
    placeholder: 'Use language defined in the selected knowledge.',
    oninput: () => { saveDraft(); update(); } });
  const controls = {};
  for (const [action, label] of Object.entries({
    start: 'Start', send: 'Send', continue: 'Continue', interrupt: 'Interrupt', resume: 'Resume', stop: 'Stop',
  })) controls[action] = button(label, () => perform(action), action === 'send' ? 'button' : 'button secondary');
  const refresh = button('Refresh state', refreshState, 'button secondary');
  const recover = button('Inspect uncertain request', recoverRequest, 'button secondary');
  const requests = el('section', { className: 'cyc-requests', 'aria-label': 'Cyc form or approval request' });
  const chat = el('section', { className: 'cyc-chat' },
    el('div', { className: 'cyc-history-bar' }, el('label', {}, 'Conversation ', picker), refresh, recover),
    identity, transcript, requests,
    el('form', { className: 'cyc-composer', onsubmit: event => { event.preventDefault(); perform('send'); } },
      el('label', { className: 'field' }, 'Message to Cyc', text),
      el('div', { className: 'cyc-actions' }, controls.send, controls.continue, controls.interrupt, controls.resume, controls.stop),
      el('p', { className: 'muted' }, 'Each request runs one bounded step. Continue explicitly dispatches a planned action or advances its continuation. Switching chips submits nothing.')),
    feedback);
  const inspector = el('aside', { className: 'cyc-inspector', 'aria-label': 'Cyc inspector' });
  const tabs = el('div', { className: 'cyc-tabs', role: 'tablist', 'aria-label': 'Symbolic inspection' });
  const pages = new Map(), tabButtons = new Map();
  for (const name of ['Knowledge', 'State', 'Proofs', 'Actions', 'Gaps', 'TODOs', 'Audit']) {
    const tab = button(name, () => selectTab(name), 'text-button');
    tab.id = `${viewId}-tab-${name}`; tab.setAttribute('role', 'tab');
    tab.setAttribute('aria-controls', `${viewId}-${name}`);
    const page = el('section', { className: 'cyc-inspector-page', role: 'tabpanel',
      id: `${viewId}-${name}`, 'aria-labelledby': tab.id });
    tab.addEventListener('keydown', event => {
      if (!['ArrowLeft', 'ArrowRight', 'Home', 'End'].includes(event.key)) return;
      event.preventDefault();
      const names = [...pages.keys()], index = names.indexOf(name);
      const next = event.key === 'Home' ? 0 : event.key === 'End' ? names.length - 1
        : (index + (event.key === 'ArrowRight' ? 1 : -1) + names.length) % names.length;
      selectTab(names[next]); tabButtons.get(names[next]).focus();
    });
    pages.set(name, page); tabButtons.set(name, tab); tabs.append(tab);
  }
  inspector.append(tabs, ...pages.values());
  const agent = el('input', { name: 'cyc-agent', value: settings.agent ?? '', placeholder: 'Canonical agent key, e.g. x_…' });
  const mt = el('input', { name: 'cyc-definition-mt', value: settings.definitionMt ?? '', placeholder: 'Canonical definition MT key' });
  const links = el('textarea', { name: 'cyc-linked-mts', rows: 6, value: settings.linkedMts ?? '',
    placeholder: 'One explicitly selected linked MT key per line' });
  for (const input of [agent, mt, links]) input.addEventListener('input', () => {
    settings = { agent: agent.value, definitionMt: mt.value, linkedMts: links.value };
    write(SYMBOLIC_STORAGE.settings, settings); update();
  });
  const scope = el('pre', { className: 'cyc-data' });
  pages.get('Knowledge').append(el('h2', {}, 'Loaded knowledge selection'),
    el('p', {}, 'No implicit definition, MT inheritance or fixture loading. All required lexicon, grammar, dialogue, templates, plans, goals, policy and state links must be selected.'),
    el('label', { className: 'field' }, 'Knowledge agent', agent),
    el('label', { className: 'field' }, 'Definition MT', mt),
    el('label', { className: 'field' }, 'Linked MTs', links), controls.start,
    el('p', { className: 'muted' }, 'Settings apply only to a new run. Stop ends a run; history remains. Application TODO changes are audited, not source-file edits.'),
    scope);
  const inspectContent = new Map();
  for (const name of ['TODOs', 'Audit']) {
    const content = el('div', {}); inspectContent.set(name, content);
    pages.get(name).append(el('h2', {}, name === 'TODOs' ? 'Actual application TODOs' : 'Durable changesets'),
      el('p', { className: 'muted' }, 'Read from the selected goals MT. These are real KEE records, not claimed task completion.'),
      button(`Refresh ${name}`, () => inspect(name), 'button secondary'), content);
  }
  panel.append(el('div', { className: 'cyc-workspace' }, chat, inspector));

  function state() {
    return { agent: 'symbolic', identity: 'symbolic', label: 'Cyc', active, disposed,
      conversationId: currentConversation, runId: currentId, status: run?.phase ?? 'not_started',
      pending: busy, unknownOutcome: !!unknown, unread, draft: text.value, storageFailed };
  }
  function emit() { onStateChange?.(state()); }
  function saveDraft() {
    drafts[currentId ?? 'new'] = text.value;
    const keys = Object.keys(drafts);
    for (const key of keys.slice(0, Math.max(0, keys.length - 21))) delete drafts[key];
    write(SYMBOLIC_STORAGE.draft, drafts);
  }
  function update() {
    const allowed = controlAvailability(run, busy, !!unknown);
    for (const [name, control] of Object.entries(controls)) control.disabled = !allowed[name];
    controls.send.disabled ||= !text.value.trim();
    controls.start.disabled ||= !agent.value.trim() || !mt.value.trim();
    refresh.disabled = busy || !currentId;
    recover.hidden = !unknown; recover.disabled = busy;
    picker.disabled = busy;
    text.disabled = busy;
    identity.textContent = run
      ? `${run.source?.knowledgeAgent ?? 'Cyc'} · ${run.phase} · ${run.steps}/128 steps · ${run.actions}/16 actions`
      : 'Cyc · not started';
    if (unknown) identity.textContent += ' · request outcome unknown — refresh and inspect; never automatically retried';
    emit();
  }
  function selectTab(name) {
    inspection = name;
    for (const [key, page] of pages) {
      const selected = key === name; page.hidden = !selected;
      tabButtons.get(key).setAttribute('aria-selected', String(selected));
      tabButtons.get(key).tabIndex = selected ? 0 : -1;
    }
  }
  function drawPicker() {
    picker.replaceChildren(el('option', { value: '' }, 'Choose a saved conversation'));
    for (const item of [...history].reverse()) picker.append(el('option', { value: item.id },
      `${item.agent ?? 'Cyc'} · ${item.status ?? 'saved'} · ${item.id.slice(-8)}`));
    picker.value = currentId ?? '';
  }
  function draw() {
    if (disposed) return;
    transcript.replaceChildren();
    if (!events.length) transcript.append(el('div', { className: 'cyc-empty' },
      el('h2', {}, run ? 'Ready for knowledge-defined input' : 'Start with explicit knowledge'),
      el('p', {}, run ? 'Unknown language becomes an inspectable gap, never a model request.'
        : 'Select a loaded agent in Knowledge. The host will verify its complete bounded snapshot before creating a run.')));
    for (const event of events) {
      const input = event.request?.input?.term;
      if (input?.type === 'compound' && input.functor === 'text' && input.args[0]?.type === 'string')
        transcript.append(message('You → Cyc', input.args[0].value));
      for (const item of event.messages ?? []) transcript.append(message('Cyc', item.text));
    }
    if ((events[0]?.sequence ?? 0) > 0) transcript.prepend(button('Load earlier events', loadEarlier, 'text-button'));
    if ((events.at(-1)?.sequence ?? 0) < eventTotal - 1)
      transcript.append(button('Return to latest events', refreshState, 'text-button'));
    pages.get('State').replaceChildren(el('h2', {}, 'Durable semantic state'), data(run?.state ? symbolicText(run.state) : 'No run.'),
      data(run ? { revision: run.revision, phase: run.phase, turns: run.turns, knowledge: run.knowledge } : {}));
    pages.get('Proofs').replaceChildren(el('h2', {}, 'Source evidence and transitions'),
      ...events.filter(e => e.semantic).map(e => el('details', {},
        el('summary', {}, `Event ${e.sequence} · ${e.kind}`), data(symbolicText(e.semantic)))));
    const gaps = events.filter(e => JSON.stringify(e.semantic).includes('"gap"'));
    pages.get('Gaps').replaceChildren(el('h2', {}, 'Knowledge gaps'),
      ...(gaps.length ? gaps.map(e => data(symbolicText(e.semantic)))
        : [el('p', {}, 'No gap events in this page. This does not prove complete knowledge.')]));
    pages.get('Actions').replaceChildren(el('h2', {}, 'Action boundary'),
      data(run?.pending ?? 'No pending action.'),
      ...events.filter(e => e.action).map(e => data({ event: e.sequence, ...e.action })));
    if (run?.pending?.kind === 'action' && ['unknown', 'dispatched'].includes(run.pending.stage))
      pages.get('Actions').append(el('p', {}, 'Outcome unresolved. Inspect the durable receipt; do not replay the action. Stop preserves the pending evidence.'),
        button('Inspect durable receipt', inspectReceipt, 'button secondary'));
    scope.textContent = run ? JSON.stringify(run.source, null, 2) : 'No verified snapshot yet.';
    drawRequest(); drawPicker(); update();
  }
  function message(label, content) {
    return el('article', { className: 'cyc-message' }, el('h3', {}, label), el('pre', {}, content));
  }
  function data(value) { return el('pre', { className: 'cyc-data' }, typeof value === 'string' ? value : JSON.stringify(value, null, 2)); }
  function drawRequest() {
    requests.replaceChildren();
    const pending = run?.pending;
    if (pending?.kind === 'approval') {
      requests.append(el('h2', {}, 'Approval adapter unavailable'), el('p', {}, pending.message));
    } else if (pending?.kind === 'form' && run.phase === 'awaiting_form') {
      const fields = new Map(), form = el('form', { onsubmit: event => {
        event.preventDefault();
        try {
          const values = Object.create(null);
          for (const field of pending.fields) {
            const input = fields.get(field.name);
            values[field.name] = field.type === 'Boolean' ? input.checked
              : field.type === 'Number' ? Number(input.value)
                : field.type === 'Term' ? JSON.parse(input.value) : input.value;
          }
          perform('form', { values });
        } catch { feedback.textContent = 'Term fields require valid powder.symbolic-term.v1 JSON. Nothing submitted.'; }
      } });
      form.append(el('h2', {}, 'Knowledge-defined form'), data(symbolicText(pending.key)));
      for (const field of pending.fields) {
        const input = el(field.type === 'Term' ? 'textarea' : 'input', {
          type: field.type === 'Boolean' ? 'checkbox' : field.type === 'Number' ? 'number' : 'text',
          name: field.name, required: field.type !== 'Boolean', maxLength: 4096,
          step: field.type === 'Number' ? 'any' : undefined, disabled: busy || !!unknown,
        });
        fields.set(field.name, input); form.append(el('label', { className: 'field' }, `${field.name} (${field.type})`, input));
      }
      form.append(el('button', { type: 'submit', className: 'button secondary', disabled: busy || !!unknown }, 'Submit form'));
      requests.append(form);
    }
  }
  function absorb(reply) {
    run = reply.run; currentId = run.id; currentConversation = run.conversation;
    events = mergeEvents(events, reply.events ?? []); eventTotal = reply.eventTotal ?? events.length;
    const entry = { id: currentId, conversation: currentConversation, agent: run.source?.knowledgeAgent,
      status: run.phase, events };
    history = [...history.filter(item => item.id !== currentId), entry].slice(-20);
    write(SYMBOLIC_STORAGE.history, history);
    if (!active) unread += 1;
    draw();
  }
  async function perform(action, extra = {}) {
    if (disposed || busy || !controlAvailability(run, busy, !!unknown)[action]) return;
    if (action === 'send' && !text.value.trim()) return;
    saveDraft();
    const callId = crypto.randomUUID();
    const body = action === 'start'
      ? { agent: agent.value.trim(), definitionMt: mt.value.trim(), linkedMts: linkedMts(links.value),
        conversation: crypto.randomUUID(), callId }
      : { id: currentId, conversation: currentConversation, revision: run.revision, callId,
        ...(action === 'send' ? { text: text.value } : {}), ...extra };
    busy = true; unknown = { action, body }; write(SYMBOLIC_STORAGE.pending, unknown); update();
    feedback.textContent = action === 'start' ? 'Verifying loaded knowledge…' : 'Running one bounded step…';
    try {
      const reply = await api(`symbolic/${action}`, {}, { method: 'POST', body, signal: lifecycle.signal });
      if (disposed) return;
      unknown = null; write(SYMBOLIC_STORAGE.pending, null);
      if (action === 'start') { events = []; text.value = ''; }
      absorb(reply);
      if (action === 'send') { text.value = ''; saveDraft(); }
      feedback.textContent = `Recorded ${run.phase}. ${run.pending?.kind === 'action' ? 'Inspect the planned action, then Continue.' : ''}`;
    } catch (error) {
      if (disposed) return;
      // A structured rejection is known. A lost response is not evidence of no
      // effect; retain its identity and text without an automatic retry.
      if (error?.status >= 400 && error.status < 500) {
        unknown = null; write(SYMBOLIC_STORAGE.pending, null);
      }
      feedback.textContent = `${error.message ?? 'Request failed'}. ${unknown
        ? 'Outcome may be durable. Refresh/inspect before any manual retry.'
        : 'Check Knowledge and refresh the current revision.'}`;
    } finally { if (!disposed) { busy = false; update(); drawRequest(); } }
  }
  async function refreshState() {
    if (disposed || busy || !currentId) return;
    busy = true; update();
    try {
      const reply = await api('symbolic/conversation', { id: currentId, conversation: currentConversation, limit: 100 }, { signal: lifecycle.signal });
      if (disposed) return;
      if (unknown && reply.events?.some(e => e.callId === `symbolic-http/${unknown.body.callId}`)) {
        unknown = null; write(SYMBOLIC_STORAGE.pending, null);
      }
      absorb(reply);
      feedback.textContent = unknown ? 'Request outcome still unknown. No action was replayed.' : 'Durable state refreshed; no execution requested.';
    } catch (error) { if (!disposed) feedback.textContent = `State unavailable: ${error.message}. History and draft retained.`; }
    finally { if (!disposed) { busy = false; update(); } }
  }
  async function recoverRequest() {
    if (disposed || busy || !unknown?.body) return;
    busy = true; update();
    try {
      const reply = await api('symbolic/request-status',
        { conversation: unknown.body.conversation, callId: unknown.body.callId }, { signal: lifecycle.signal });
      if (disposed) return;
      if (reply.receipt?.status === 'committed') {
        const restored = await api('symbolic/conversation', {
          id: reply.receipt.commit.result.id, conversation: unknown.body.conversation, limit: 100,
        }, { signal: lifecycle.signal });
        if (disposed) return;
        events = []; unknown = null; write(SYMBOLIC_STORAGE.pending, null); absorb(restored);
        feedback.textContent = 'Committed request found. Restored state without replaying its action.';
      } else feedback.textContent = 'No committed receipt found. Outcome remains unknown; no request was replayed.';
    } catch (error) { if (!disposed) feedback.textContent = `Receipt unavailable: ${error.message}`; }
    finally { if (!disposed) { busy = false; update(); } }
  }
  async function selectConversation() {
    saveDraft(); const saved = history.find(item => item.id === picker.value);
    if (!saved || busy) return;
    currentId = saved.id; currentConversation = saved.conversation; run = null;
    events = saved.events ?? []; text.value = drafts[currentId] ?? '';
    for (const content of inspectContent.values()) content.replaceChildren();
    draw(); await refreshState();
  }
  async function loadEarlier() {
    if (busy || disposed || !run) return;
    busy = true; update();
    try {
      const offset = Math.max(0, (events[0]?.sequence ?? eventTotal) - 50);
      const reply = await api('symbolic/conversation', { id: currentId, conversation: currentConversation, offset, limit: 50 }, { signal: lifecycle.signal });
      if (!disposed) { events = events.slice(0, 150); absorb(reply); }
    } catch (error) { if (!disposed) feedback.textContent = error.message; }
    finally { if (!disposed) { busy = false; update(); } }
  }
  async function inspect(name) {
    if (disposed || busy || !run) return;
    busy = true; update();
    try {
      const reply = await api(`symbolic/${name === 'TODOs' ? 'todos' : 'audit'}`,
        { id: currentId, conversation: currentConversation, limit: 50 }, { signal: lifecycle.signal });
      if (!disposed) inspectContent.get(name).replaceChildren(data(reply.result));
    } catch (error) { if (!disposed) inspectContent.get(name).replaceChildren(el('p', { role: 'alert' }, error.message)); }
    finally { if (!disposed) { busy = false; update(); } }
  }
  async function inspectReceipt() {
    if (disposed || busy || !run?.pending?.callId) return;
    busy = true; update();
    try {
      const reply = await api('symbolic/receipt', { id: currentId, conversation: currentConversation,
        actionCallId: run.pending.callId }, { signal: lifecycle.signal });
      if (!disposed) pages.get('Actions').append(data(reply.receipt));
    } catch (error) { if (!disposed) feedback.textContent = error.message; }
    finally { if (!disposed) { busy = false; update(); } }
  }
  function setActive(value) {
    if (disposed) return;
    active = !!value; panel.hidden = !active;
    if (active) unread = 0;
    emit();
  }
  function destroy() {
    if (disposed) return;
    saveDraft(); disposed = true; lifecycle.abort();
    signal?.removeEventListener('abort', destroy); panel.remove(); emit();
  }
  if (signal?.aborted) destroy();
  else signal?.addEventListener('abort', destroy, { once: true });
  events = history.find(item => item.id === currentId)?.events ?? [];
  selectTab(currentId ? inspection : 'Knowledge'); draw();
  if (active && currentId && !disposed) void refreshState();
  return { element: panel, activate: () => setActive(true), deactivate: () => setActive(false),
    getState: state, destroy };
}
