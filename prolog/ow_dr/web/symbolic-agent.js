// Extend powder's operating workspace, not its authority: a persistent Cyc
// conversation beside evidence, explicit knowledge scope and bounded controls.
// Inherit the existing surface/ink/line palette and typography. Start is always
// deliberate; unavailable knowledge and uncertain outcomes stay visible.
let instance = 0;
const STARTER_PROFILE = 'cyc-starter-v1';
export const SYMBOLIC_STORAGE = Object.freeze({
  settings: 'powder.cyc.settings.v1', draft: 'powder.cyc.drafts.v1',
  history: 'powder.cyc.history.v1', pending: 'powder.cyc.pending.v1', forms: 'powder.cyc.forms.v1',
  selection: 'powder.cyc.selection.v1',
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
    resume: !!run && !pending && !unknown && phase === 'interrupted'
      && (run.pending?.kind !== 'action' || run.pending.stage === 'planned'),
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
export function eventTimeMillis(event) {
  const seconds = event?.time;
  if (typeof seconds !== 'number' || !Number.isFinite(seconds) || seconds < 0) return null;
  const millis = seconds * 1000;
  return Number.isFinite(new Date(millis).getTime()) ? millis : null;
}
export function elapsedText(milliseconds) {
  if (!Number.isFinite(milliseconds) || milliseconds < 0) return 'unknown';
  const seconds = Math.floor(milliseconds / 1000);
  if (seconds < 60) return `${seconds}s`;
  if (seconds < 3600) return `${Math.floor(seconds / 60)}m ${seconds % 60}s`;
  if (seconds < 86400) return `${Math.floor(seconds / 3600)}h ${Math.floor(seconds / 60) % 60}m`;
  return `${Math.floor(seconds / 86400)}d ${Math.floor(seconds / 3600) % 24}h`;
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
  const selection = read(SYMBOLIC_STORAGE.selection, null);
  const selected = history.find(item => item.id === selection?.id && item.conversation === selection?.conversation);
  let run = null, events = [], unknown = read(SYMBOLIC_STORAGE.pending, null);
  let currentId = selected?.id ?? null, currentConversation = selected?.conversation ?? null;
  let inspection = 'State', eventTotal = 0, lastError = null, refreshWhenIdle = false;
  let settingsOpen = false, operation = null, selectionEpoch = 0;
  let clockTimer = null, requestClock = null, timeNodes = [];
  const dateFormat = new Intl.DateTimeFormat(undefined, { dateStyle: 'medium', timeStyle: 'medium' });
  let profileCatalog = [], profilesLoaded = false, profilesLoading = false;
  let formDrafts = read(SYMBOLIC_STORAGE.forms, {});
  if (!formDrafts || typeof formDrafts !== 'object' || Array.isArray(formDrafts)) formDrafts = {};
  let formDraftKey = null, formInputs = new Map();
  const sequences = new Map(history.map(item => [item.conversation,
    Number.isSafeInteger(item.sequence) && item.sequence >= 0 ? item.sequence
      : Math.max(0, (item.events?.at(-1)?.sequence ?? -1) + 1)]));
  if (!document.querySelector('link[data-symbolic-agent-style]')) {
    document.head.append(el('link', { rel: 'stylesheet', 'data-symbolic-agent-style': '',
      href: new URL('./symbolic-agent.css', import.meta.url).href }));
  }
  const panel = el('section', { className: 'symbolic-agent', hidden: !active, 'data-agent': 'symbolic' },
    heading('Cyc', 'Knowledge-defined text dialogue and workflows. No model, network fallback or operator access.'));
  const feedback = el('p', { className: 'cyc-feedback', role: 'status', 'aria-live': 'polite' },
    'Write a message, then Send. Nothing starts on conversation selection.');
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
  const saySomething = button('Say something', () => perform('send', { text: 'hello' }), 'button secondary');
  const controlReason = el('p', { id: `${viewId}-control-reason`, className: 'muted cyc-control-reason',
    role: 'status', 'aria-live': 'polite' });
  for (const control of Object.values(controls)) control.setAttribute('aria-describedby', controlReason.id);
  saySomething.setAttribute('aria-describedby', controlReason.id);
  const settingsToggle = button('Settings', () => showSettings(!settingsOpen), 'button secondary');
  settingsToggle.setAttribute('aria-controls', `${viewId}-settings`);
  settingsToggle.setAttribute('aria-expanded', 'false');
  const profileSummary = el('p', { className: 'muted cyc-profile-summary' });
  const elapsedStatus = el('p', { className: 'muted cyc-elapsed', role: 'timer', 'aria-live': 'off',
    'aria-label': 'Message timing', hidden: true });
  const requests = el('section', { className: 'cyc-requests', 'aria-label': 'Cyc form or approval request' });
  const chat = el('section', { className: 'cyc-chat' },
    el('div', { className: 'cyc-history-bar' }, el('label', {}, 'Conversation ', picker), settingsToggle, recover),
    identity, transcript, requests,
    el('form', { className: 'cyc-composer', onsubmit: event => { event.preventDefault(); perform('send'); } },
      el('label', { className: 'field' }, 'Message to Cyc', text),
      el('div', { className: 'cyc-actions' }, controls.send, saySomething, controls.continue, controls.interrupt, controls.resume, controls.stop),
      controlReason, elapsedStatus, profileSummary),
    feedback);
  const inspector = el('aside', { className: 'cyc-inspector', id: `${viewId}-settings`, hidden: true,
    'aria-label': 'Cyc settings and inspection', onkeydown: event => {
      if (event.key === 'Escape') { event.preventDefault(); showSettings(false); settingsToggle.focus(); }
    } });
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
  const profile = el('select', { name: 'cyc-profile', onchange: saveSettings },
    el('option', { value: '' }, 'Default: Cyc starter (limited, app-owned)'),
    el('option', { value: 'loaded' }, 'Loaded knowledge — explicit agent and MTs'));
  if (settings.profile && settings.profile !== 'loaded')
    profile.append(el('option', { value: settings.profile }, `Saved profile: ${settings.profile}`));
  profile.value = settings.profile ?? (settings.agent ? 'loaded' : '');
  const profileNotice = el('p', { className: 'muted' });
  for (const input of [agent, mt, links]) input.addEventListener('input', () => {
    saveSettings();
  });
  const scope = el('pre', { className: 'cyc-data' });
  const loadedConfig = el('div', { className: 'cyc-loaded-config' },
    el('p', {}, 'No implicit definition, MT inheritance or fixture loading. All required lexicon, grammar, dialogue, templates, plans, goals, policy and state links must be selected.'),
    el('label', { className: 'field' }, 'Knowledge agent', agent),
    el('label', { className: 'field' }, 'Definition MT', mt),
    el('label', { className: 'field' }, 'Linked MTs', links),
    el('p', { className: 'muted' }, 'A loaded definition needs (isa AGENT SymbolicTextAgent), symbolicStartCategory, symbolicInitialState and eight symbolicAgentContext roles. If you have no such authored program, choose the limited app-owned starter instead.'));
  pages.get('Knowledge').append(el('h2', {}, 'Explicit knowledge profile'),
    el('label', { className: 'field' }, 'Profile', profile), profileNotice, loadedConfig, controls.start,
    el('p', { className: 'muted' }, 'Choose New conversation to use these settings. Send starts the selected profile; Start is optional. Stop ends a run, not its history. TODO changes are audited, not source-file edits.'),
    scope);
  const inspectContent = new Map();
  for (const name of ['TODOs', 'Audit']) {
    const content = el('div', {}); inspectContent.set(name, content);
    pages.get(name).append(el('h2', {}, name === 'TODOs' ? 'Actual application TODOs' : 'Durable changesets'),
      el('p', { className: 'muted' }, 'Read from the selected goals MT. These are real KEE records, not claimed task completion.'),
      button(`Refresh ${name}`, () => inspect(name), 'button secondary'), content);
  }
  const workspace = el('div', { className: 'cyc-workspace' }, chat, inspector);
  panel.append(workspace);

  function state() {
    return { agent: 'symbolic', identity: 'symbolic', label: 'Cyc', active, disposed,
      conversationId: currentConversation, runId: currentId,
      status: run?.phase ?? (currentId ? lastError ? 'unavailable' : 'loading' : 'not_started'),
      sequence: sequences.get(currentConversation) ?? 0,
      error: lastError ?? (unknown ? { code: 'outcome_unknown', message: 'Request outcome requires durable receipt inspection.' } : null),
      pending: busy, unknownOutcome: !!unknown, unread, draft: text.value, storageFailed, settingsOpen };
  }
  function emit() { onStateChange?.(state()); }
  function recordError(error) {
    lastError = { code: error?.code ?? 'symbolic_request_failed', message: error?.message ?? String(error) };
  }
  function beginOperation(kind) {
    const next = { kind, epoch: selectionEpoch, abort: new AbortController() };
    operation = next; busy = true; update(); return next;
  }
  function isCurrent(job) { return !disposed && operation === job && job.epoch === selectionEpoch; }
  function operationSignal(job) { return AbortSignal.any([lifecycle.signal, job.abort.signal]); }
  function cancelRead() {
    if (operation?.kind === 'read') { operation.abort.abort(); operation = null; busy = false; }
    refreshWhenIdle = false;
  }
  function settled(job) {
    if (!isCurrent(job)) return;
    operation = null; busy = false; update(); drawRequest();
    if (refreshWhenIdle && active && !disposed) {
      refreshWhenIdle = false; void refreshState();
    }
  }
  function saveDraft() {
    drafts[currentId ?? 'new'] = text.value;
    const keys = Object.keys(drafts);
    for (const key of keys.slice(0, Math.max(0, keys.length - 21))) delete drafts[key];
    write(SYMBOLIC_STORAGE.draft, drafts);
  }
  function saveSelection() {
    write(SYMBOLIC_STORAGE.selection, currentId ? { id: currentId, conversation: currentConversation } : null);
  }
  function showSettings(value) {
    settingsOpen = !!value; inspector.hidden = !settingsOpen;
    workspace.dataset.settingsOpen = String(settingsOpen);
    settingsToggle.setAttribute('aria-expanded', String(settingsOpen)); emit();
  }
  function saveSettings() {
    settings = { profile: profile.value, agent: agent.value, definitionMt: mt.value, linkedMts: links.value };
    write(SYMBOLIC_STORAGE.settings, settings); update();
  }
  function saveFormDraft() {
    if (!formDraftKey) return;
    formDrafts[formDraftKey] = Object.fromEntries([...formInputs].map(([key, input]) =>
      [key, input.type === 'checkbox' ? input.checked : input.value]));
    for (const key of Object.keys(formDrafts).slice(0, -20)) delete formDrafts[key];
    write(SYMBOLIC_STORAGE.forms, formDrafts);
  }
  function clearFormDraft() {
    if (formDraftKey) {
      delete formDrafts[formDraftKey]; write(SYMBOLIC_STORAGE.forms, formDrafts);
    }
    formDraftKey = null; formInputs = new Map();
  }
  function pendingCount() {
    let count = 0;
    for (let pending = unknown; pending && count < 4; pending = pending.previous) count++;
    return count;
  }
  function controlExplanation(profileReady) {
    if (busy) return operation?.kind === 'write'
      ? 'A bounded step is running. Cyc has no enqueue queue or mid-step cancellation. Wait for the response before sending or interrupting; your draft is retained.'
      : 'Reading durable state. Execution controls are unavailable until the read completes; no work is queued.';
    if (pendingCount() >= 4) return 'Four uncertain requests need inspection before another control request. No action will be replayed.';
    if (unknown) return 'A request outcome is unknown. Inspect its durable receipt before sending or continuing; nothing is replayed automatically.';
    if (run?.pending?.kind === 'action' && run.pending.stage !== 'planned')
      return 'The action outcome is unresolved. Inspect Actions in Settings; Continue and Resume cannot replay it.';
    if (run?.phase === 'interrupted') return 'Resume returns to the saved boundary without replaying an action. Send is unavailable while interrupted.';
    if (['stopped', 'failed'].includes(run?.phase)) return 'This run has ended. Choose New conversation to start a separate run.';
    if (run?.pending?.kind === 'form') return 'Complete the visible form before sending another message. No messages are queued.';
    if (run?.pending?.kind === 'approval') return 'A trusted approval adapter is unavailable. This request cannot proceed here.';
    if (run?.pending?.kind === 'action') return 'Continue dispatches the planned action; Interrupt pauses before dispatch. New messages are not queued.';
    if (['running', 'compensating'].includes(run?.phase))
      return 'Continue advances one bounded step. Send is unavailable until the workflow returns to input; nothing runs between requests.';
    if (currentId && !run) return 'Saved state is unavailable. Use Refresh state in Settings before requesting execution.';
    if (!currentId && !profileReady) return 'Choose an available knowledge profile in Settings before sending.';
    return text.value.trim() ? '' : 'Write a message to enable Send, or ask Cyc to open with Say something.';
  }
  function pendingMessage() {
    let depth = 0;
    for (let pending = unknown; pending && depth++ < 4; pending = pending.previous)
      if (pending.action === 'send' && pending.body?.conversation === currentConversation) return pending;
    return null;
  }
  function recordedAge(millis, now) {
    return now < millis ? 'elapsed unavailable (clock differs)' : `${elapsedText(now - millis)} ago`;
  }
  function matchingClock(pending) {
    return pending && requestClock && requestClock.callId === pending.body.callId
      && requestClock.conversation === pending.body.conversation ? requestClock : null;
  }
  function renderTiming() {
    if (disposed) return;
    const now = Date.now();
    for (const item of timeNodes) {
      const age = recordedAge(item.millis, now);
      if (item.node.textContent !== age) item.node.textContent = age;
    }
    const pending = pendingMessage();
    const lastMessage = [...events].reverse().find(event => event.request?.input?.term?.functor === 'text');
    elapsedStatus.hidden = !pending && !lastMessage;
    if (pending) {
      const submitted = pending.localSubmittedAt;
      const stamp = typeof submitted === 'number' && Number.isFinite(new Date(submitted).getTime())
        ? dateFormat.format(submitted) : 'unavailable';
      const clock = matchingClock(pending);
      const elapsed = clock ? elapsedText(performance.now() - clock.monotonic) : null;
      elapsedStatus.textContent = `Message request sent: ${stamp} (this browser). ${elapsed === null
        ? 'Elapsed unavailable after reload.' : `Elapsed ${elapsed} since submission.`} ${busy && operation?.kind === 'write' && operation.callId === pending.body.callId
        ? 'Awaiting response; this is not execution time.' : 'Outcome unknown; completion time unavailable.'}`;
    } else if (lastMessage) {
      const millis = eventTimeMillis(lastMessage);
      elapsedStatus.textContent = millis === null
        ? 'Message recorded time unavailable; send-to-reply duration unknown.'
        : `Last message on this page recorded ${recordedAge(millis, now)} (ledger). Send-to-reply duration is not recorded.`;
    } else elapsedStatus.textContent = '';
  }
  function stopClock() {
    if (clockTimer !== null) clearInterval(clockTimer);
    clockTimer = null;
  }
  function syncClock() {
    renderTiming();
    if (disposed || !active || document.hidden || (!timeNodes.length && !matchingClock(pendingMessage()))) stopClock();
    else if (clockTimer === null) clockTimer = setInterval(renderTiming, 1000);
  }
  function update() {
    const allowed = controlAvailability(run, busy, !!unknown);
    for (const [name, control] of Object.entries(controls)) control.disabled = !allowed[name];
    const selectedProfile = profileCatalog.find(item => item.id === (profile.value || STARTER_PROFILE));
    const profileReady = profile.value === 'loaded' ? !!agent.value.trim() && !!mt.value.trim() : !!selectedProfile;
    const newReady = !currentId && profileReady && !busy && !unknown;
    controls.start.disabled = !newReady;
    controls.send.disabled = !(allowed.send || newReady) || !text.value.trim();
    saySomething.disabled = !(allowed.send || newReady);
    const visible = controlAvailability(run, false, !!unknown);
    for (const name of ['continue', 'interrupt', 'resume', 'stop']) controls[name].hidden = !visible[name];
    if (currentId && operation?.kind === 'write') controls.interrupt.hidden = false;
    if (pendingCount() >= 4) { controls.stop.disabled = true; controls.interrupt.disabled = true; }
    const explanation = controlExplanation(profileReady);
    controlReason.textContent = explanation; controlReason.hidden = !explanation;
    for (const control of Object.values(controls)) control.title = control.disabled ? explanation : '';
    saySomething.title = saySomething.disabled ? explanation
      : 'Ask the selected Cyc program for an opening through its real “hello” interpretation. Your unsent draft is preserved.';
    if (!controls.interrupt.disabled) controls.interrupt.title = 'Pause at a completed request boundary; an in-flight step cannot be cancelled.';
    if (!controls.continue.disabled) controls.continue.title = run.pending?.kind === 'action'
      ? 'Dispatch the inspected planned action once.' : 'Advance the saved continuation by one bounded step.';
    loadedConfig.hidden = profile.value !== 'loaded';
    profileNotice.textContent = selectedProfile
      ? `${selectedProfile.description} Try: ${(selectedProfile.examples ?? []).join(', ')}. Read as an isolated program only after Start; never added to the live KB.`
      : profile.value === 'loaded' ? 'Reads only the current loaded generation. Missing definitions fail without loading any source.'
        : 'The selected profile is unavailable. Choose a published profile or an authored program already loaded into the KB; no fallback is executed.';
    refresh.disabled = busy || !currentId;
    recover.hidden = !unknown; recover.disabled = busy;
    picker.disabled = operation?.kind === 'write';
    for (const input of [profile, agent, mt, links]) input.disabled = operation?.kind === 'write';
    text.disabled = busy;
    for (const field of requests.querySelectorAll('input,textarea,button')) field.disabled = busy || !!unknown;
    identity.textContent = run
      ? `Cyc · ${run.phase.replaceAll('_', ' ')}`
      : currentId ? lastError ? 'Cyc · saved conversation unavailable' : 'Cyc · opening saved conversation' : 'New conversation';
    if (unknown) identity.textContent += ' · request outcome unknown — refresh and inspect; never automatically retried';
    profileSummary.textContent = currentId
      ? `Profile: ${run?.source?.knowledgeAgent ?? history.find(item => item.id === currentId)?.agent ?? 'loading'}. Messages use its defined language; no model is called.`
      : profile.value === 'loaded'
        ? `New uses your loaded profile${agent.value.trim() ? ` ${agent.value.trim()}` : ''}. Configure its agent and MTs in Settings. Send starts it; selecting a conversation does not.`
        : `New uses ${selectedProfile?.label ?? (profile.value ? `saved profile ${profile.value}` : 'the limited app-owned Cyc starter')}. Send starts it; nothing starts on selection.${selectedProfile?.examples?.length ? ` Examples: ${selectedProfile.examples.join(', ')}.` : ''}`;
    syncClock(); emit();
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
    picker.replaceChildren(el('option', { value: '' }, 'New conversation'));
    for (const item of [...history].reverse()) picker.append(el('option', { value: item.id },
      `${item.title ?? item.agent ?? 'Cyc'} · ${item.status ?? 'saved'} · ${item.id.slice(-8)}`));
    picker.value = currentId ?? '';
  }
  function draw() {
    if (disposed) return;
    timeNodes = [];
    transcript.replaceChildren();
    if (!events.length) transcript.append(el('div', { className: 'cyc-empty' },
      el('h2', {}, currentId ? 'Conversation' : 'What would you like to say?'),
      el('p', {}, currentId ? 'Use the selected knowledge-defined language. Missing coverage is a gap, never a model fallback.'
        : 'Write a message. Choose a knowledge profile and inspect evidence in Settings.')));
    for (const event of events) {
      const input = event.request?.input?.term;
      if (input?.type === 'compound' && input.functor === 'text' && input.args[0]?.type === 'string')
        transcript.append(message('You → Cyc', input.args[0].value, event));
      for (const item of event.messages ?? []) transcript.append(message('Cyc', item.text, event));
    }
    if ((events[0]?.sequence ?? 0) > 0) transcript.prepend(button('Load earlier events', loadEarlier, 'text-button'));
    if ((events.at(-1)?.sequence ?? 0) < eventTotal - 1)
      transcript.append(button('Return to latest events', refreshState, 'text-button'));
    pages.get('State').replaceChildren(el('h2', {}, 'Durable semantic state'), data(run?.state ? symbolicText(run.state) : 'No run.'),
      data(run ? { revision: run.revision, phase: run.phase, turns: run.turns,
        steps: run.steps, actions: run.actions, knowledge: run.knowledge } : {}), refresh);
    pages.get('Proofs').replaceChildren(el('h2', {}, 'Source evidence and transitions'),
      ...events.filter(e => e.semantic).map(e => el('details', {},
        el('summary', {}, `Event ${e.sequence} · ${e.kind}`), data(symbolicText(e.semantic)))));
    const gaps = events.filter(e => JSON.stringify(e.semantic ?? null).includes('"gap"'));
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
  function message(label, content, event) {
    const millis = eventTimeMillis(event);
    const stamp = el('p', { className: 'cyc-message-time' });
    if (millis === null) stamp.textContent = 'Recorded time unavailable';
    else {
      const age = el('span', {});
      stamp.append('Recorded ', el('time', { dateTime: new Date(millis).toISOString(),
        title: 'Durable ledger event time, not message acceptance or execution duration.' }, dateFormat.format(millis)), ' · ', age);
      timeNodes.push({ node: age, millis });
    }
    return el('article', { className: 'cyc-message' }, el('h3', {}, label), stamp, el('pre', {}, content));
  }
  function data(value) { return el('pre', { className: 'cyc-data' }, typeof value === 'string' ? value : JSON.stringify(value, null, 2)); }
  function validateFormField(field, input) {
    let message = '';
    if (field.type === 'String') {
      const size = [...input.value].length, min = field.minLength ?? 0, max = field.maxLength ?? 4096;
      if (size < min || size > max) message = `${field.name} must contain ${min}–${max} characters.`;
    }
    input.setCustomValidity(message); input.setAttribute('aria-invalid', String(!!message));
    return message;
  }
  function formFailure(input, message) {
    feedback.textContent = `${message} Nothing submitted; your draft is retained.`;
    recordError({ code: 'symbolic_form_invalid', message: feedback.textContent }); update();
    input?.focus();
  }
  function drawRequest() {
    saveFormDraft();
    if (run && formDraftKey?.startsWith(`${run.id}:`) && run.pending?.kind !== 'form') clearFormDraft();
    formDraftKey = null; formInputs = new Map();
    requests.replaceChildren();
    const pending = run?.pending;
    if (pending?.kind === 'approval') {
      requests.append(el('h2', {}, 'Approval adapter unavailable'), el('p', {}, pending.message));
    } else if (pending?.kind === 'action') {
      requests.append(el('p', {}, pending.stage === 'planned'
        ? `Planned action: ${pending.intent?.capability ?? 'knowledge-defined action'}. Continue dispatches it; Interrupt pauses it.`
        : 'This action has an unresolved outcome. It cannot be resumed or replayed.'),
      button('Inspect action', () => { showSettings(true); selectTab('Actions'); }, 'text-button'));
    } else if (pending?.kind === 'form' && run.phase === 'awaiting_form') {
      const fields = new Map(), form = el('form', { onsubmit: event => {
        event.preventDefault();
        try {
          const values = Object.create(null);
          for (const field of pending.fields) {
            const input = fields.get(field.name);
            const problem = validateFormField(field, input);
            if (problem) { formFailure(input, problem); return; }
            values[field.name] = field.type === 'Boolean' ? input.checked
              : field.type === 'Number' ? Number(input.value)
                : field.type === 'Term' ? JSON.parse(input.value) : input.value;
          }
          perform('form', { values });
        } catch {
          feedback.textContent = 'Term fields require valid powder.symbolic-term.v1 JSON. Nothing submitted.';
          recordError(new Error(feedback.textContent)); update();
        }
      } });
      formDraftKey = `${currentId}:${JSON.stringify(pending.key)}`; formInputs = fields;
      const saved = formDrafts[formDraftKey] ?? {};
      form.append(el('h2', {}, 'Knowledge-defined form'), data(symbolicText(pending.key)));
      for (const field of pending.fields) {
        const input = el(field.type === 'Term' ? 'textarea' : 'input', {
          type: field.type === 'Boolean' ? 'checkbox' : field.type === 'Number' ? 'number' : 'text',
          name: field.name, required: field.type === 'String' ? (field.minLength ?? 0) > 0 : field.type !== 'Boolean',
          minLength: field.type === 'String' ? field.minLength ?? 0 : undefined,
          maxLength: field.type === 'String' ? field.maxLength ?? 4096 : 4096,
          step: field.type === 'Number' ? 'any' : undefined, disabled: busy || !!unknown,
          value: field.type !== 'Boolean' ? saved[field.name] ?? '' : undefined,
          checked: field.type === 'Boolean' ? saved[field.name] === true : undefined,
          oninput: () => { saveFormDraft(); validateFormField(field, input); },
          oninvalid: () => formFailure(input, input.validationMessage),
        });
        fields.set(field.name, input); validateFormField(field, input);
        form.append(el('label', { className: 'field' }, `${field.name} (${field.type})`, input,
          field.type === 'String' ? el('small', { className: 'muted' },
            `${field.minLength ?? 0}–${field.maxLength ?? 4096} characters`) : null));
      }
      form.append(el('button', { type: 'submit', className: 'button secondary', disabled: busy || !!unknown }, 'Submit form'));
      requests.append(form);
    }
  }
  function absorb(reply) {
    const prior = history.find(item => item.id === reply.run.id && item.conversation === reply.run.conversation);
    const same = currentId === reply.run.id && currentConversation === reply.run.conversation;
    events = mergeEvents(same ? events : prior?.events ?? [], reply.events ?? []);
    run = reply.run; currentId = run.id; currentConversation = run.conversation;
    eventTotal = reply.eventTotal ?? events.length;
    const previous = sequences.get(currentConversation) ?? 0;
    const observed = Number.isSafeInteger(reply.eventTotal) && reply.eventTotal >= 0 ? reply.eventTotal
      : Number.isSafeInteger(run.eventSequence) ? run.eventSequence + 1
        : Math.max(0, (events.at(-1)?.sequence ?? -1) + 1);
    const sequence = Math.max(previous, observed);
    sequences.set(currentConversation, sequence);
    const firstText = events.find(event => event.request?.input?.term?.functor === 'text')?.request.input.term.args[0]?.value;
    const entry = { id: currentId, conversation: currentConversation, agent: run.source?.knowledgeAgent,
      title: prior?.title ?? (typeof firstText === 'string' ? firstText.slice(0, 60) : undefined),
      status: run.phase, sequence, events };
    history = [...history.filter(item => item.id !== currentId), entry].slice(-20);
    write(SYMBOLIC_STORAGE.history, history);
    saveSelection();
    if (!active) unread += sequence - previous;
    lastError = null;
    draw();
  }
  function checkReply(reply, expected) {
    if (typeof reply?.run?.id !== 'string' || reply.run.conversation !== expected.conversation
      || expected.id && reply.run.id !== expected.id)
      throw Object.assign(new Error('Conversation identity mismatch. The response was not applied.'), { code: 'symbolic_identity_mismatch' });
  }
  async function writeRequest(job, action, body) {
    const previous = unknown;
    job.callId = body.callId;
    unknown = { action, body, draftKey: currentId ?? 'new', formKey: action === 'form' ? formDraftKey : null,
      ...(previous ? { previous } : {}) };
    if (action === 'send') {
      unknown.localSubmittedAt = Date.now();
      requestClock = { callId: body.callId, conversation: body.conversation, monotonic: performance.now() };
    }
    write(SYMBOLIC_STORAGE.pending, unknown); update();
    const reply = await api(`symbolic/${action}`, {}, { method: 'POST', body, signal: operationSignal(job) });
    if (!isCurrent(job)) return null;
    checkReply(reply, body);
    if (requestClock?.callId === body.callId) requestClock = null;
    unknown = previous ?? null; write(SYMBOLIC_STORAGE.pending, unknown);
    return reply;
  }
  function discardAcknowledgedForm(pending, reply) {
    if (pending?.action !== 'form' || reply.run.phase === 'awaiting_form') return;
    const key = pending.formKey ?? (pending.body.id === currentId ? formDraftKey : null);
    if (!key) return;
    delete formDrafts[key]; write(SYMBOLIC_STORAGE.forms, formDrafts);
    if (key === formDraftKey) { formDraftKey = null; formInputs = new Map(); }
  }
  async function perform(action, extra = {}) {
    if (disposed || busy || unknown && !['stop', 'interrupt'].includes(action)) return;
    if (pendingCount() >= 4) return;
    const starting = !currentId && ['start', 'send'].includes(action);
    if (starting ? controls.start.disabled : !controlAvailability(run, busy, !!unknown)[action]) return;
    if (action === 'start' && currentId) return;
    const messageText = extra.text ?? text.value, sendingDraft = action === 'send' && extra.text === undefined;
    if (action === 'send' && !messageText.trim()) return;
    saveDraft();
    const inheritedDraft = text.value, job = beginOperation('write');
    feedback.textContent = starting ? 'Starting the selected knowledge profile…' : 'Running one bounded step…';
    try {
      if (starting) {
        const config = profile.value === 'loaded'
          ? { agent: agent.value.trim(), definitionMt: mt.value.trim(), linkedMts: linkedMts(links.value) }
          : { profile: profile.value || STARTER_PROFILE };
        const created = await writeRequest(job, 'start', { ...config, conversation: crypto.randomUUID(), callId: crypto.randomUUID() });
        if (!created) return;
        drafts[created.run.id] = inheritedDraft; drafts.new = '';
        write(SYMBOLIC_STORAGE.draft, drafts); absorb(created); text.value = inheritedDraft;
        if (action === 'start') { feedback.textContent = 'Conversation ready. Send a message; no Resume is needed.'; return; }
      }
      const body = { id: currentId, conversation: currentConversation, revision: run.revision,
        callId: crypto.randomUUID(), ...extra, ...(action === 'send' ? { text: messageText } : {}) };
      const reply = await writeRequest(job, action, body);
      if (!reply) return;
      if (action === 'form' && reply.run.phase !== 'awaiting_form') clearFormDraft();
      absorb(reply);
      if (sendingDraft) { text.value = ''; saveDraft(); }
      feedback.textContent = `Recorded ${run.phase}. ${run.pending?.kind === 'action' ? 'Inspect the planned action, then Continue.' : ''}`;
      if (action === 'send' && run.phase === 'gap')
        feedback.textContent = 'The selected profile has a knowledge gap for that message. Inspect Gaps in Settings; no model fallback was used.';
      if (action === 'form' && run.phase === 'awaiting_form')
        formFailure(null, 'The form was not accepted. Inspect its field values and proof events.');
    } catch (error) {
      if (!isCurrent(job)) return;
      recordError(error);
      // A structured rejection is known. A lost response is not evidence of no
      // effect; retain its identity and text without an automatic retry.
      if (error?.status >= 400 && error.status < 500) {
        unknown = unknown?.previous ?? null; write(SYMBOLIC_STORAGE.pending, unknown);
      }
      feedback.textContent = `${error.message ?? 'Request failed'}. ${unknown
        ? 'Outcome may be durable. Refresh/inspect before any manual retry.'
        : 'Your draft is retained. Check Settings or refresh the saved state.'}`;
    } finally { settled(job); }
  }
  async function refreshState() {
    if (disposed || busy || !currentId) return;
    refreshWhenIdle = false;
    const expected = { id: currentId, conversation: currentConversation }, job = beginOperation('read');
    try {
      const reply = await api('symbolic/conversation', { ...expected, limit: 100 }, { signal: operationSignal(job) });
      if (!isCurrent(job)) return;
      checkReply(reply, expected);
      if (unknown?.body?.conversation === expected.conversation
        && reply.events?.some(e => e.callId === `symbolic-http/${unknown.body.callId}`)) {
        discardAcknowledgedForm(unknown, reply);
        unknown = unknown.previous ?? null; write(SYMBOLIC_STORAGE.pending, unknown);
      }
      absorb(reply);
      feedback.textContent = unknown ? 'Request outcome still unknown. No action was replayed.' : 'Durable state refreshed; no execution requested.';
    } catch (error) {
      if (isCurrent(job)) { recordError(error); feedback.textContent = `State unavailable: ${error.message}. History and draft retained.`; }
    } finally { settled(job); }
  }
  async function recoverRequest() {
    if (disposed || busy || !unknown?.body) return;
    const pending = unknown, job = beginOperation('read');
    try {
      const reply = await api('symbolic/request-status',
        { conversation: pending.body.conversation, callId: pending.body.callId }, { signal: operationSignal(job) });
      if (!isCurrent(job)) return;
      if (reply.receipt?.status === 'committed') {
        const expected = { id: reply.receipt.commit.result.id, conversation: pending.body.conversation };
        const restored = await api('symbolic/conversation', { ...expected, limit: 100 }, { signal: operationSignal(job) });
        if (!isCurrent(job)) return;
        checkReply(restored, expected); saveDraft(); saveFormDraft();
        discardAcknowledgedForm(pending, restored);
        if (currentId !== restored.run.id) {
          text.value = drafts[restored.run.id] ?? (pending.action === 'start' ? drafts[pending.draftKey ?? 'new'] ?? '' : '');
          drafts[restored.run.id] = text.value;
          if (pending.action === 'start') drafts[pending.draftKey ?? 'new'] = '';
          write(SYMBOLIC_STORAGE.draft, drafts);
        }
        unknown = pending.previous ?? null; write(SYMBOLIC_STORAGE.pending, unknown); absorb(restored);
        feedback.textContent = unknown ? 'This request is resolved; an earlier request still needs inspection. No action was replayed.'
          : 'Committed request found. Restored state without replaying its action.';
      } else feedback.textContent = 'No committed receipt found. Outcome remains unknown; no request was replayed.';
    } catch (error) {
      if (isCurrent(job)) { recordError(error); feedback.textContent = `Receipt unavailable: ${error.message}`; }
    } finally { settled(job); }
  }
  async function selectConversation() {
    if (disposed) return;
    if (operation?.kind === 'write') { picker.value = currentId ?? ''; return; }
    const value = picker.value, saved = history.find(item => item.id === value);
    if (value && !saved) { picker.value = currentId ?? ''; return; }
    saveDraft(); saveFormDraft(); cancelRead(); selectionEpoch++;
    currentId = saved?.id ?? null; currentConversation = saved?.conversation ?? null;
    run = null; lastError = null; unread = 0;
    events = saved?.events ?? []; eventTotal = saved?.sequence ?? 0; text.value = drafts[currentId ?? 'new'] ?? '';
    saveSelection();
    for (const content of inspectContent.values()) content.replaceChildren();
    feedback.textContent = currentId ? 'Opening saved conversation…' : 'New conversation. Send starts the profile shown below.';
    draw();
    if (currentId) await refreshState();
  }
  async function loadEarlier() {
    if (busy || disposed || !run) return;
    const expected = { id: currentId, conversation: currentConversation }, job = beginOperation('read');
    try {
      const offset = Math.max(0, (events[0]?.sequence ?? eventTotal) - 50);
      const reply = await api('symbolic/conversation', { ...expected, offset, limit: 50 }, { signal: operationSignal(job) });
      if (isCurrent(job)) { checkReply(reply, expected); events = events.slice(0, 150); absorb(reply); }
    } catch (error) { if (isCurrent(job)) { recordError(error); feedback.textContent = error.message; } }
    finally { settled(job); }
  }
  async function inspect(name) {
    if (disposed || busy || !run) return;
    const expected = { id: currentId, conversation: currentConversation }, job = beginOperation('read');
    try {
      const reply = await api(`symbolic/${name === 'TODOs' ? 'todos' : 'audit'}`,
        { ...expected, limit: 50 }, { signal: operationSignal(job) });
      if (isCurrent(job)) { lastError = null; inspectContent.get(name).replaceChildren(data(reply.result)); }
    } catch (error) {
      if (isCurrent(job)) { recordError(error); inspectContent.get(name).replaceChildren(el('p', { role: 'alert' }, error.message)); }
    } finally { settled(job); }
  }
  async function inspectReceipt() {
    if (disposed || busy || !run?.pending?.callId) return;
    const args = { id: currentId, conversation: currentConversation, actionCallId: run.pending.callId }, job = beginOperation('read');
    try {
      const reply = await api('symbolic/receipt', args, { signal: operationSignal(job) });
      if (isCurrent(job)) { lastError = null; pages.get('Actions').append(data(reply.receipt)); }
    } catch (error) { if (isCurrent(job)) { recordError(error); feedback.textContent = error.message; } }
    finally { settled(job); }
  }
  async function loadProfiles() {
    if (disposed || profilesLoaded || profilesLoading) return;
    profilesLoading = true;
    try {
      const result = await api('symbolic/status', {}, { signal: lifecycle.signal });
      if (disposed) return;
      profileCatalog = Array.isArray(result.profiles) ? result.profiles : [];
      const selected = settings.profile ?? profile.value;
      for (const item of profileCatalog) {
        const existing = [...profile.options].find(option => option.value === item.id);
        if (existing) existing.textContent = item.label;
        else profile.append(el('option', { value: item.id }, item.label));
      }
      profile.value = selected; profilesLoaded = true; update();
    } catch (error) {
      if (!disposed) { recordError(error); feedback.textContent = `Profile discovery unavailable: ${error.message}. Loaded-profile configuration remains available.`; update(); }
    } finally { profilesLoading = false; }
  }
  function setActive(value) {
    if (disposed) return;
    const activating = !!value && !active;
    active = !!value; panel.hidden = !active;
    if (active) unread = 0;
    syncClock(); emit();
    if (activating) void loadProfiles();
    if (activating && currentId) {
      if (busy) refreshWhenIdle = true;
      else void refreshState();
    }
  }
  function destroy() {
    if (disposed) return;
    saveDraft(); saveFormDraft(); disposed = true; lifecycle.abort();
    stopClock(); document.removeEventListener('visibilitychange', syncClock);
    signal?.removeEventListener('abort', destroy); panel.remove(); emit();
  }
  document.addEventListener('visibilitychange', syncClock);
  if (signal?.aborted) destroy();
  else signal?.addEventListener('abort', destroy, { once: true });
  events = history.find(item => item.id === currentId)?.events ?? [];
  selectTab(currentId ? inspection : 'Knowledge'); draw(); showSettings(false);
  if (active && !disposed) void loadProfiles();
  if (active && currentId && !disposed) void refreshState();
  return { element: panel, activate: () => setActive(true), deactivate: () => setActive(false),
    getState: state, destroy };
}
