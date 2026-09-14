import { timelineModel, renderRequestTimeline } from './agent-timeline.js';

// Extend powder's operating workspace: text conversation left, inspectable controls right.
// Keep the established palette and typography; explicit export consent precedes every Chat.
let nextViewId = 0;

/**
 * Keep this controller mounted for the Teacher chip's lifetime. Deactivation
 * pauses view polling only; it never aborts a turn or changes another agent.
 */
export async function createLLMKnowledgeAgent(host, {
  route = { params: new URLSearchParams() }, signal, active = true, onConversationChange, onStateChange, storage,
} = {}) {
  const lifecycle = new AbortController();
  const abort = () => lifecycle.abort();
  if (signal?.aborted) abort();
  else signal?.addEventListener('abort', abort, { once: true });
  let controls;
  const element = await renderLLMKnowledgeAgent({
    ...host,
    llmContainer: { active, updateLocation: false, onConversationChange, onStateChange, storage,
      register: value => { controls = value; } },
  }, route, lifecycle.signal);
  return {
    agent: 'llm-knowledge', identity: 'llm', label: 'Teacher / LLM', element,
    activate: () => controls?.setActive(true),
    deactivate: () => controls?.setActive(false),
    getState: () => controls?.getState(),
    destroy: () => {
      signal?.removeEventListener('abort', abort);
      lifecycle.abort();
      element.remove();
    },
  };
}

export function teacherDrafts(storage) {
  const key = id => `powder.teacher.draft.v1:${id || 'new'}`;
  return {
    read(id) {
      try {
        const value = JSON.parse(storage?.getItem(key(id)) || 'null');
        return typeof value?.text === 'string' ? value.text.slice(0, 8192) : '';
      } catch { return ''; }
    },
    write(id, text) {
      try { storage?.setItem(key(id), JSON.stringify({ text: text.slice(0, 8192) })); return true; }
      catch { return false; }
    },
  };
}

export function modelOptions(items, selected) {
  return [...new Set([selected, ...items].filter(id => id !== ''))].map(id => ({
    id, label: items.includes(id) ? id : `${id} — availability not confirmed`,
  }));
}
export function selectedKeys(text) {
  return [...new Set(text.split(/\r?\n/u).map(value => value.trim()).filter(Boolean))];
}
export function canChat({ conversation, text, approved, pending }) {
  return !!conversation && !pending && !['running', 'closed', 'outcome_unknown'].includes(conversation.status)
    && !conversation.calls?.some(call => ['reserved', 'unknown'].includes(call.state))
    && !!text.trim() && approved;
}
export function plainChatEligible(conversation) {
  const scope = conversation?.scope;
  return !!scope && ['terms', 'readMts', 'writeMts'].every(key => Array.isArray(scope[key]) && !scope[key].length)
    && scope.grant == null && !conversation.calls?.length
    && !conversation.messages?.some(message => !['system', 'user', 'assistant'].includes(message.role)
      || message.name === 'approved_grounding' || message.tool_calls?.length);
}
export function elapsedText(seconds) {
  if (!Number.isFinite(seconds)) return 'time unavailable';
  const total = Math.max(0, Math.floor(seconds));
  if (total < 60) return `${total}s`;
  if (total < 3600) return `${Math.floor(total / 60)}m ${String(total % 60).padStart(2, '0')}s`;
  return `${Math.floor(total / 3600)}h ${String(Math.floor(total / 60) % 60).padStart(2, '0')}m`;
}
export function sentMessageEvents(messages = [], events = []) {
  const starts = events.map((event, index) => ({ event, index }))
    .filter(({ event }) => event.kind === 'turn_started' && Number.isFinite(event.at));
  const userIndexes = messages.map((message, index) => ({ message, index }))
    .filter(({ message }) => message.role === 'user' && !message.name).map(({ index }) => index);
  const result = new Map(), count = Math.min(userIndexes.length, starts.length);
  for (let n = 0; n < count; n++) {
    const position = starts.length - count + n, started = starts[position];
    const end = starts[position + 1]?.index ?? events.length;
    const outcome = events.slice(started.index + 1, end).find(event =>
      ['turn_completed', 'turn_failed', 'local_mutation_boundary', 'interrupted', 'closed'].includes(event.kind));
    result.set(userIndexes[userIndexes.length - count + n], { at: started.event.at, outcome });
  }
  return result;
}
export function teacherFailure(error, model) {
  if (error?.code === 'llm_model_unavailable') return `The previous request was rejected by powder's model-catalog check before generation. The saved model is ${model}; it was not changed.`;
  if (error?.code === 'provider_http') return `The provider returned HTTP ${error.status ?? 'error'} for ${model}. The exact model ID was sent without a fallback.`;
  return `${error?.code ?? 'request_failed'}: ${error?.message ?? 'The request failed. No automatic retry was performed.'}`;
}

export async function renderLLMKnowledgeAgent(host, route, signal) {
  const { api, element: el, button, heading } = host;
  const container = host.llmContainer;
  let storage = container?.storage;
  if (storage === undefined) { try { storage = globalThis.localStorage; } catch { storage = null; } }
  const drafts = teacherDrafts(storage);
  const viewId = `llm-view-${++nextViewId}`;
  let active = container?.active !== false;
  if (!document.querySelector('link[data-llm-agent-style]')) {
    document.head.append(el('link', { rel: 'stylesheet', 'data-llm-agent-style': '',
      href: new URL('./llm-knowledge-agent.css', import.meta.url).href }));
  }
  const panel = el('div', { className: 'llm-agent', hidden: !active, 'data-agent': 'llm-knowledge' },
    heading('LLM knowledge agent', 'Teach, explore, and develop symbolic capabilities through a separate text conversation.'));
  const notice = el('p', { className: 'llm-provider-notice' },
    'emullm logs requests and replies, reuses worker contexts, and may forward externally. Not private-local-only. Never send secrets, application code, raw private KB, or bulk files.');
  const identity = el('p', { className: 'llm-identity' }, 'Loading registered settings…');
  const feedback = el('p', { role: 'status', 'aria-live': 'polite', className: 'llm-feedback' });
  const transcript = el('section', { className: 'llm-transcript', 'aria-label': 'LLM text conversation' });
  const timeline = el('div', {});
  const text = el('textarea', { rows: 4, maxLength: 8192, name: 'llm-message',
    placeholder: 'Write a message. Send starts a new conversation if needed.',
    oninput: () => { invalidatePreview(); persistDraft(); updateControls(); } });
  const send = button('Send', sendChat);
  const firstReplyText = 'Please write the first reply to start our conversation.';
  const firstReply = button('Say something', () => sendChat(firstReplyText), 'button secondary');
  const chatMode = el('select', { name: 'llm-chat-mode', 'aria-label': 'Conversation mode',
    onchange: () => { invalidatePreview(); updateControls(); } },
    el('option', { value: 'plain' }, 'Just chat - no KB or tools'),
    el('option', { value: 'knowledge' }, 'Knowledge tools - preview required'));
  const mode = el('select', { name: 'llm-purpose', 'aria-label': 'Explicit Teacher action', onchange: () => {
    invalidatePreview(); updateControls();
  } }, el('option', { value: 'chat' }, 'Chat'),
  el('option', { value: 'generate_comment' }, 'Generate Comment — unsaved proposal'));
  const allowTodos = el('select', { name: 'llm-automatic-todos', 'aria-label': 'Knowledge tool permissions', onchange: () => {
    invalidatePreview(); updateControls();
  } }, el('option', { value: 'read' }, 'Read-only selected knowledge'),
  el('option', { value: 'write' }, 'Allow audited edits to this conversation’s TODOs'));
  const start = button('Start new conversation', startConversation, 'button secondary');
  const interrupt = button('Interrupt', () => control('interrupt'), 'button secondary');
  const reconnectNow = button('Reconnect', reconnect, 'button secondary');
  const stop = button('Stop conversation', () => control('stop'), 'button secondary');
  const previewTurn = button('Preview this turn locally', previewGrounding, 'button secondary');
  const advancedActions = el('div', { className: 'llm-knowledge-actions', hidden: true },
    el('label', { className: 'field' }, 'Action', mode), previewTurn);
  const sendHint = el('p', { className: 'muted llm-send-hint', 'aria-live': 'polite' });
  const queuePanel = el('section', { className: 'llm-queue', 'aria-label': 'Queued messages', hidden: true });
  const resumeQueue = button('Resume queue', () => queueControl('resume'), 'button secondary');
  const clearQueue = button('Clear queue', () => queueControl('cancel'), 'button secondary');
  const queueItems = el('ol', {});
  queuePanel.append(el('h3', {}, 'Queued messages'), queueItems, resumeQueue, clearQueue);
  const composer = el('form', { className: 'llm-composer', onsubmit: event => { event.preventDefault(); sendChat(); } },
    el('label', { className: 'field' }, 'Message (text only)', text),
    advancedActions, el('div', { className: 'form-actions' }, send, firstReply, interrupt, reconnectNow),
    sendHint, queuePanel,
    el('p', { className: 'muted' }, 'Responses arrive after completion, not incrementally. Interrupt is best effort; provider logs and processing may remain.'));
  const historyPicker = el('select', { 'aria-label': 'Teacher conversation history', name: 'llm-history',
    onchange: openSelectedConversation });
  const historyState = el('p', { className: 'muted' });
  let settingsExpanded = false;
  const settingsToggle = button('Settings', () => {
    settingsExpanded = !settingsExpanded; updateControls();
  }, 'button secondary');
  settingsToggle.setAttribute('aria-controls', `${viewId}-inspector`);
  const main = el('section', { className: 'llm-chat' }, identity,
    el('div', { className: 'llm-history' }, historyPicker,
      settingsToggle),
    timeline, transcript, composer, feedback);
  const inspector = el('aside', { id: `${viewId}-inspector`, className: 'llm-inspector', hidden: true,
    'aria-label': 'LLM agent inspector' });
  const historyTools = el('div', { className: 'llm-history-tools' },
      button('Refresh history', refreshHistory, 'button secondary'),
      button('More history', moreHistory, 'button secondary'),
      button('Reconnect status', reconnect, 'button secondary'), stop, historyState);
  const tabs = el('div', { className: 'llm-tabs', role: 'tablist', 'aria-label': 'Agent inspector tabs' });
  const pages = new Map(), tabButtons = new Map();
  const localTodoContent = el('div', { className: 'llm-local-todos' });
  const localReceiptContent = el('div', { className: 'llm-local-receipt' });
  const receiptCall = el('select', { 'aria-label': 'Recorded mutation call' });
  receiptCall.addEventListener('change', () => localReceiptContent.replaceChildren());
  const inspectReceiptButton = button('Inspect durable receipt', inspectReceipt, 'button secondary');
  for (const name of ['Settings', 'Events', 'Raw JSON', 'Audit', 'Todos']) {
    const key = name.toLowerCase().replace(' ', '-');
    const page = el('section', { role: 'tabpanel', id: `${viewId}-${key}`, hidden: name !== 'Settings',
      'aria-labelledby': `${viewId}-tab-${key}`, className: 'llm-inspector-page' });
    const tab = button(name, () => selectTab(name), 'text-button');
    tab.id = `${viewId}-tab-${key}`; tab.setAttribute('role', 'tab');
    tab.setAttribute('aria-controls', page.id); tab.setAttribute('aria-selected', String(name === 'Settings'));
    tab.tabIndex = name === 'Settings' ? 0 : -1;
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
  const workspace = el('div', { className: 'llm-workspace llm-chat-only' }, main, inspector);
  panel.append(notice, workspace);
  const modelSuggestions = el('datalist', { id: `${viewId}-models` });
  const model = el('input', { type: 'text', name: 'llm-model', maxLength: 200,
    required: true, pattern: '[!-~]+', autocomplete: 'off', spellcheck: false,
    'aria-label': 'Application agent model', 'aria-describedby': `${viewId}-model-help` });
  model.setAttribute('list', modelSuggestions.id);
  const modelHelp = el('p', { id: `${viewId}-model-help`, className: 'muted' },
    'Type an exact model ID or choose a suggestion. Refresh updates suggestions without replacing your text.');
  const modelState = el('p', { className: 'muted' }, 'Use Refresh models to verify the saved selection. No model runs on refresh.');
  const base = el('output', { className: 'llm-provider-address' });
  const termKeys = el('textarea', { rows: 3, name: 'llm-term-keys', placeholder: 'One canonical term key per line' });
  const readMts = el('textarea', { rows: 2, name: 'llm-read-mts', placeholder: 'One canonical MT selector per line; not disclosure consent' });
  const writeMts = el('textarea', { rows: 2, name: 'llm-write-mts', placeholder: 'Writable TODO MT keys; empty means application-global tasks only' });
  const groundingPreview = el('section', { className: 'llm-grounding-preview', 'aria-label': 'Local grounding preview' });
  const previewButton = button('Preview grounding locally', previewGrounding, 'button secondary');
  const approveButton = button('Approve exact preview', approvePreview, 'button secondary');
  const budgetInputs = {};
  const budgets = el('fieldset', { className: 'llm-budgets' }, el('legend', {}, 'Per-turn budgets'));
  for (const [key, label, max] of [['rounds', 'Model rounds', 8], ['calls', 'Tool calls', 32],
    ['tokens', 'Output tokens / request', 8192], ['seconds', 'Deadline (seconds)', 120],
    ['historyBytes', 'History bytes', 262144], ['outputBytes', 'Reply bytes', 131072]]) {
    const input = el('input', { type: 'number', name: `llm-${key}`, step: 1, min: key === 'calls' ? 0 : 1, max });
    budgetInputs[key] = input; budgets.append(el('label', { className: 'field' }, label, input));
  }
  const prompt = el('textarea', { rows: 12, name: 'llm-prompt', spellcheck: false });
  const promptState = el('p', { className: 'muted' });
  const promptEditor = el('details', {}, el('summary', {}, 'App-owned prompt file'),
    el('p', { className: 'muted' }, 'Revision-checked edits affect only new conversations. Do not add secrets or private source code.'),
    el('label', { className: 'field' }, 'Prompt Markdown', prompt), promptState,
    button('Save prompt revision', savePrompt, 'button secondary'));
  const settingsPage = pages.get('Settings');
  settingsPage.append(el('h2', {}, 'Registered application agent'),
    historyTools, el('label', { className: 'field' }, 'Conversation mode', chatMode),
    el('p', { className: 'muted' }, 'LLM identity — does not change the Copilot coding model or symbolic agent.'),
    el('label', { className: 'field' }, 'Host-owned provider', base),
    el('label', { className: 'field' }, 'Explicit model', model), modelSuggestions, modelHelp,
    button('Refresh models', refreshModels, 'button secondary'), modelState, budgets,
    button('Save agent settings', saveSettings, 'button secondary'),
    el('h2', {}, 'Selected context'),
    el('p', { className: 'muted' }, 'Set the scope before starting a conversation. Preview and approve each exact turn before Chat or Generate. A preview is local; it is not permission for future raw KEE reads. TODO/audit/receipt inspection stays local.'),
    el('label', { className: 'field' }, 'Preview term selectors', termKeys),
    el('label', { className: 'field' }, 'Preview read-MT selectors', readMts),
    el('label', { className: 'field' }, 'TODO write-MT ceiling', writeMts),
    el('label', { className: 'field' }, 'Knowledge tool permissions', allowTodos),
    previewButton, start, promptEditor);
  composer.insertBefore(groundingPreview, composer.firstChild);
  advancedActions.append(el('p', { className: 'muted' },
    'Approve only after reviewing every preview message and evidence field as authorized and nonsensitive.'),
    approveButton);
  let settings, promptRevision, conversation = null, pending = false, timer, polling = false, disposed = false;
  let preview = null;
  let grant = null, connection = 'connected', historyOffset = 0, historyTotal = 0, historyLoading = false;
  let receiptPending = false;
  let refreshRequested = false, clientError = null;
  const sequences = new Map();
  const historyEntries = new Map();
  let elapsedTimer, elapsedNodes = [];
  let clientSteps = [];
  for (const input of [termKeys, readMts, writeMts]) input.addEventListener('input', () => {
    invalidatePreview();
    groundingPreview.replaceChildren(el('p', { className: 'muted' }, 'Selectors changed. Start a new conversation to apply a different scope.'));
  });
  const refreshClock = () => tickElapsed();
  document.addEventListener('visibilitychange', refreshClock);
  signal.addEventListener('abort', () => {
    persistDraft(); disposed = true; clearTimeout(timer); clearTimeout(elapsedTimer);
    document.removeEventListener('visibilitychange', refreshClock); notifyState();
  }, { once: true });
  if (signal.aborted) disposed = true;
  container?.register({
    setActive(value) {
      if (disposed || active === !!value) return;
      active = !!value; panel.hidden = !active;
      clearTimeout(timer); timer = null;
      if (active && conversation) {
        refreshRequested = true;
        timer = setTimeout(poll, 0);
      }
      tickElapsed();
      notifyState();
    },
    getState,
  });
  function getState() { return {
      agent: 'llm-knowledge', identity: 'llm', active, disposed,
      conversationId: conversation?.id ?? null,
      revision: conversation?.revision ?? null, turns: conversation?.turns ?? 0,
      sequence: sequences.get(conversation?.id) ?? 0,
      error: clientError ?? conversation?.error ?? null,
      status: connection === 'disconnected' ? 'disconnected' : conversation?.status ?? 'not_started',
      backendStatus: conversation?.status ?? 'not_started', connection,
      model: conversation?.model ?? settings?.model ?? null,
      pending, draft: text.value, chatMode: chatMode.value,
    }; }
  function notifyState() { container?.onStateChange?.(getState()); }
  function persistDraft() {
    if (!drafts.write(conversation?.id, text.value)) feedback.textContent = 'Draft storage unavailable; keep this tab open or copy your draft.';
    notifyState();
  }
  function invalidatePreview() { preview = null; grant = null; }
  function selectTab(name) {
    for (const [key, page] of pages) {
      const selected = key === name; page.hidden = !selected;
      tabButtons.get(key).setAttribute('aria-selected', String(selected));
      tabButtons.get(key).tabIndex = selected ? 0 : -1;
    }
  }
  function updateControls() {
    if (preview && preview.expiresAt * 1000 <= Date.now()) invalidatePreview();
    const plain = chatMode.value === 'plain';
    const queue = conversation?.queue;
    const queued = queue?.items?.filter(item => item.status === 'queued') ?? [];
    const enqueuing = plain && conversation?.status === 'running';
    let reason = '';
    if (pending) reason = 'Waiting for this request to finish.';
    else if (connection !== 'connected') reason = 'Reconnect to inspect the current conversation.';
    else if (!text.value.trim()) reason = 'Write a message first.';
    else if (plain && conversation && !plainChatEligible(conversation)) reason = 'This history includes knowledge or tools. Choose New conversation for text-only chat.';
    else if (plain && !conversation && !settings) reason = 'Agent settings are still loading.';
    else if (conversation && ['closed', 'outcome_unknown'].includes(conversation.status)) reason = 'This conversation is stopped or has an unresolved outcome. Inspect it or start a new conversation.';
    else if (enqueuing && queue?.canEnqueue !== true) reason = 'Enqueue is unavailable for this turn or the queue is full. Wait or Interrupt.';
    else if (plain && !enqueuing && queued.length) reason = 'Resume or clear the paused queue before sending another message.';
    else if (conversation && !enqueuing && !canChat({ conversation, text: text.value, approved: true, pending }))
      reason = 'This conversation is stopped or has an unresolved outcome. Inspect it or start a new conversation.';
    else if (!plain && (!conversation || !grant)) reason = 'Preview and approve this exact knowledge turn first.';
    disabled(send, !!reason, reason);
    send.textContent = plain ? (enqueuing ? 'Enqueue' : 'Send')
      : mode.value === 'generate_comment' ? 'Generate Comment (unsaved)' : 'Chat';
    sendHint.textContent = reason || (plain
      ? 'Send transmits only this text conversation under the provider notice. No KB context or tools are attached.'
      : 'Only the approved knowledge preview and permitted tools will be sent.');
    const canRequestFirstReply = plain && !pending && connection === 'connected' && !!settings
      && !text.value.trim() && (!conversation || plainChatEligible(conversation)
        && (enqueuing ? queue?.canEnqueue === true
          : !queued.length && canChat({ conversation, text: firstReplyText, approved: true, pending })));
    disabled(firstReply, !canRequestFirstReply, !plain
      ? 'Knowledge requests need an exact preview. Use Just chat for an ungrounded first reply.'
      : text.value.trim() ? 'Send or clear your current draft first.'
        : 'Wait for the current turn, reconnect, or start a new conversation.');
    advancedActions.hidden = plain; groundingPreview.hidden = plain;
    inspector.hidden = !settingsExpanded;
    workspace.classList.toggle('llm-chat-only', !settingsExpanded);
    settingsToggle.setAttribute('aria-expanded', String(settingsExpanded));
    disabled(previewButton, pending || plain, plain ? 'Choose Knowledge tools mode first.' : 'Waiting for the current request.');
    disabled(previewTurn, pending, 'Waiting for the current request.');
    disabled(approveButton, pending || !preview || !!grant, !preview ? 'Create a current preview first.' : 'Preview approved or request pending.');
    disabled(start, pending || !settings, 'Wait for agent settings or the current request.');
    disabled(historyPicker, pending, 'Wait for the current request before switching conversations.');
    disabled(interrupt, !conversation || !['running', 'outcome_unknown'].includes(conversation.status), 'No active turn to interrupt.');
    reconnectNow.hidden = connection === 'connected';
    disabled(reconnectNow, pending, 'Wait for the current request.');
    disabled(stop, !conversation || conversation.status === 'closed', 'No open conversation to stop.');
    allowTodos.disabled = mode.value === 'generate_comment';
    queuePanel.hidden = !queued.length;
    queueItems.replaceChildren(...queued.map(item => el('li', {}, String(item.text ?? '').slice(0, 160))));
    disabled(resumeQueue, pending || queue?.canResume !== true, 'The queue cannot resume in the current state.');
    disabled(clearQueue, pending || !queued.length, 'No pending messages to clear.');
    const branch = historyPicker.querySelector('option[value="__branch__"]');
    if (branch) branch.disabled = !conversation || !Object.hasOwn(conversation, 'branchOf')
      || ['running', 'outcome_unknown'].includes(conversation.status)
      || conversation.calls?.some(call => ['reserved', 'unknown'].includes(call.state));
    notifyState();
  }
  function disabled(control, value, reason) {
    control.disabled = value;
    if (value) control.title = reason;
    else control.removeAttribute('title');
  }
  function drawConversation(data) {
    if (conversation?.id === data.id && data.revision < conversation.revision) return;
    if (conversation?.id !== data.id) {
      persistDraft(); invalidatePreview();
      text.value = drafts.read(data.id);
      chatMode.value = plainChatEligible(data) ? 'plain' : 'knowledge';
      for (const [input, key] of [[termKeys, 'terms'], [readMts, 'readMts'], [writeMts, 'writeMts']])
        input.value = (data.scope?.[key] || []).join('\n');
      localTodoContent.replaceChildren(); localReceiptContent.replaceChildren();
      receiptCall.value = '';
    }
    if (conversation?.id === data.id && conversation.revision !== data.revision) invalidatePreview();
    const sequence = Number.isSafeInteger(data.sequence) && data.sequence >= 0
      ? data.sequence : (data.events?.length || 0) + (data.messages?.length || 0);
    sequences.set(data.id, Math.max(sequences.get(data.id) || 0, sequence));
    conversation = data;
    historyEntries.set(data.id, { ...historyEntries.get(data.id), ...data });
    drawHistoryPicker();
    connection = 'connected'; clientError = null;
    identity.textContent = `LLM · ${data.model} · ${data.status} · prompt ${data.promptHash.slice(0, 12)}`;
    transcript.replaceChildren();
    elapsedNodes = [];
    const messageTimes = sentMessageEvents(data.messages, data.events);
    if (!data.messages.length) transcript.append(el('p', { className: 'llm-empty' },
      'Conversation started. The prompt is frozen; no message has been sent to the model.'));
    for (const [index, message] of data.messages.entries()) {
      const label = message.role === 'user' ? (message.name === 'approved_grounding' ? 'Approved grounding (untrusted data)' : 'You')
        : message.role === 'assistant'
          ? `${data.action === 'generate_comment' && message === data.messages.at(-1) ? 'Unsaved AI comment proposal' : 'LLM'} · ${data.model}`
          : 'KEE tool result';
      const content = typeof message.content === 'string' ? message.content : '';
      const timing = messageTimes.get(index);
      const time = timing ? el('p', { className: 'llm-message-time', role: 'timer', 'aria-live': 'off' }) : null;
      if (timing) elapsedNodes.push({ ...timing, node: time });
      transcript.append(el('article', { className: `llm-message llm-message-${message.role}` },
        el('h3', {}, label), el('pre', {}, content),
        time,
        message.tool_calls?.length ? el('pre', { className: 'llm-tool-calls' },
          JSON.stringify(message.tool_calls, null, 2)) : null));
      if (timing?.outcome?.kind === 'turn_failed') {
        transcript.append(el('article', { className: 'llm-request-error', role: 'alert' },
          el('strong', {}, 'Request failed'), el('p', {}, teacherFailure(timing.outcome.detail, data.model)),
          el('p', {}, 'Your message was not automatically retried. Settings and request details remain available.')));
      }
    }
    if (data.error && ![...messageTimes.values()].some(timing => timing.outcome?.kind === 'turn_failed')) {
      transcript.append(el('article', { className: 'llm-request-error', role: 'alert' },
        el('strong', {}, 'Request failed'), el('p', {}, teacherFailure(data.error, data.model))));
    }
    tickElapsed();
    pages.get('Events').replaceChildren(el('h2', {}, 'Turn events'), json(data.events));
    pages.get('Raw JSON').replaceChildren(el('h2', {}, 'Conversation response'), json(data));
    const selectedReceipt = receiptCall.value;
    const receiptCalls = data.calls.filter(call => call.receiptInspectable);
    receiptCall.replaceChildren(...receiptCalls.map(call => el('option', { value: call.id, title: call.id },
      `${call.name} · ${call.id.slice(0, 12)}`)));
    if (receiptCalls.some(call => call.id === selectedReceipt)) receiptCall.value = selectedReceipt;
    inspectReceiptButton.disabled = receiptPending || !receiptCalls.length;
    pages.get('Audit').replaceChildren(el('h2', {}, 'Actual execution records'),
      el('p', { className: 'muted' }, data.registry.limitation),
      el('label', { className: 'field' }, 'Recorded mutation call', receiptCall), inspectReceiptButton,
      el('p', { className: 'muted' }, 'Local read only. Unknown may still commit; inspection never retries a call or unblocks a conversation.'),
      localReceiptContent, json(data.audit), json(data.calls));
    pages.get('Todos').replaceChildren(el('h2', {}, 'Managed todos'),
      el('p', {}, data.todos.reason || 'Local application tasks — not exported by this inspector.'),
      button('Refresh local TODOs', refreshTodos, 'button secondary'),
      localTodoContent);
    if (data.error) feedback.textContent = `${data.error.code}: ${data.error.message}`;
    updateControls();
    if (active && data.status === 'running' && !timer) timer = setTimeout(poll, 1500);
  }
  function json(value) { return el('pre', { className: 'llm-json' }, JSON.stringify(value, null, 2)); }
  function tickElapsed() {
    clearTimeout(elapsedTimer);
    if (disposed || !active || document.hidden) return;
    const now = Date.now() / 1000;
    for (const step of clientSteps) {
      if (step.status === 'running') step.elapsedMs = performance.now() - step.started;
    }
    timeline.replaceChildren(renderRequestTimeline(el, timelineModel(conversation, clientSteps, now)));
    for (const item of elapsedNodes) {
      const ended = Number.isFinite(item.outcome?.at);
      const age = elapsedText((ended ? item.outcome.at : now) - item.at);
      const outcome = item.outcome?.kind;
      const progress = outcome === 'turn_failed' ? `Failed after ${age}`
        : ['closed', 'interrupted'].includes(outcome) ? `Interrupted after ${age}`
          : ended ? `Completed after ${age}` : `${age} since sent`;
      item.node.textContent = `Sent ${new Date(item.at * 1000).toLocaleTimeString()} · ${progress}`;
    }
    if (elapsedNodes.some(item => !Number.isFinite(item.outcome?.at))
        || clientSteps.some(step => step.status === 'running') || conversation?.status === 'running')
      elapsedTimer = setTimeout(tickElapsed, 1000);
  }
  async function request(path, body) {
    const names = { start: 'Create conversation snapshot', chat: 'Submit message to powder',
      'queue/enqueue': 'Persist queued message', 'queue/resume': 'Resume queued work' };
    const step = names[path] ? { label: names[path], started: performance.now(), elapsedMs: 0, status: 'running' } : null;
    if (step) { clientSteps.push(step); clientSteps = clientSteps.slice(-8); tickElapsed(); }
    try {
      const result = await api(`llm/${path}`, {}, { method: 'POST', body, signal });
      if (step) step.status = 'completed';
      return result;
    } catch (error) {
      if (step) step.status = 'failed';
      throw error;
    } finally {
      if (step) { step.elapsedMs = performance.now() - step.started; tickElapsed(); }
    }
  }
  async function action(operation) {
    if (pending || disposed) return;
    pending = true; updateControls();
    try { await operation(); }
    catch (error) { if (!disposed) {
      grant = null;
      const rejected = Number.isInteger(error.status) && error.status >= 400 && error.status < 500;
      if (!rejected) connection = 'disconnected';
      clientError = error.message || String(error);
      feedback.textContent = `Not completed: ${error.message}. ${rejected ? 'Review the rejected request.' : 'Reconnect to inspect status.'} No automatic retry.`;
    } }
    finally { pending = false; if (!disposed) updateControls(); }
  }
  async function startConversation() {
    clientSteps = [];
    await action(async () => {
      const selectedMode = chatMode.value;
      const scope = selectedMode === 'plain' ? emptyScope() : selectedScope();
      feedback.textContent = 'Capturing model settings and exact prompt bytes…';
      const data = await request('start', { scope: { ...scope, grant: null } });
      drawConversation(data);
      chatMode.value = selectedMode;
      if (container?.updateLocation !== false) {
        const params = new URLSearchParams(route.params); params.set('conversation', data.id);
        history.replaceState(null, '', `#/llm-knowledge?${params}`);
      }
      container?.onConversationChange?.({ agent: 'llm-knowledge', identity: 'llm', id: data.id });
      feedback.textContent = 'Conversation started. No message has been sent to the model.';
      await refreshHistory();
    });
  }
  function emptyScope() { return { terms: [], readMts: [], writeMts: [] }; }
  function selectedScope() {
    return { terms: selectedKeys(termKeys.value), readMts: selectedKeys(readMts.value),
      writeMts: selectedKeys(writeMts.value) };
  }
  async function previewGrounding() {
    if (chatMode.value === 'plain') return;
    await action(async () => {
      if (!conversation || !text.value.trim()) {
        feedback.textContent = 'Start a conversation and enter your message before previewing.';
        return;
      }
      const scope = selectedScope(), frozen = conversation.scope;
      if (['terms', 'readMts', 'writeMts'].some(key => JSON.stringify(scope[key]) !== JSON.stringify(frozen[key]))) {
        feedback.textContent = 'Scope differs from this conversation. Start a new conversation first.'; return;
      }
      const count = scope.terms.length * scope.readMts.length;
      if (count > 3 || (scope.terms.length && !scope.readMts.length)) {
        feedback.textContent = 'Choose at most three term/MT pairs, with an explicit MT for each term.'; return;
      }
      const requests = scope.terms.flatMap(term => scope.readMts.flatMap(mt =>
        ['kee_definitions', 'kee_occurrences'].map(tool => ({
          tool, arguments: { term, mt, scope: 'all', offset: 0, limit: 5 },
        }))));
      if (allowTodos.value === 'write' && mode.value === 'chat') requests.push({ tool: 'kee_ledger_status', arguments: {} });
      const captured = { conversation: conversation.id, revision: conversation.revision, text: text.value,
        mode: mode.value, automaticTodos: allowTodos.value === 'write' && mode.value === 'chat', requests };
      invalidatePreview();
      const result = await request('grounding/preview', captured);
      if (captured.conversation !== conversation?.id || captured.revision !== conversation.revision
          || captured.text !== text.value || captured.mode !== mode.value
          || captured.automaticTodos !== (allowTodos.value === 'write' && mode.value === 'chat')
          || JSON.stringify(scope) !== JSON.stringify(selectedScope())) {
        feedback.textContent = 'The turn changed during preview. Preview again.';
        return;
      }
      preview = result;
      groundingPreview.replaceChildren(el('h3', {}, 'Local preview — not sent to the provider'),
        el('p', {}, result.notice), json(preview.binding),
        el('details', {}, el('summary', {}, 'Exact outgoing messages — review before approval'), json(preview.messages)),
        el('details', {}, el('summary', {}, 'Exact selected evidence and permitted tools'), json(preview.entries), json(preview.tools)),
        el('p', { className: 'muted' }, `SHA-256: ${preview.hash} · expires ${new Date(preview.expiresAt * 1000).toLocaleTimeString()}`));
      feedback.textContent = 'Local preview ready. Review all fields, then Approve exact preview only if all material is authorized and nonsensitive.';
    });
  }
  async function approvePreview() {
    if (!preview || chatMode.value === 'plain') return;
    const captured = preview;
    await action(async () => {
      const result = await request('grounding/approve', { id: captured.id, hash: captured.hash, approvedNonsensitive: true });
      if (preview === captured) grant = result.id;
      feedback.textContent = 'Exact preview approved for one turn. Chat/Generate is still required; no provider request has occurred.';
    });
  }
  async function undoTodo(item) {
    if (!conversation) return;
    await action(async () => {
      const id = conversation.id;
      const result = await request('todos/undo', { id, ...item, callId: crypto.randomUUID() });
      if (conversation?.id !== id) return;
      invalidatePreview(); localTodoContent.replaceChildren(json(result));
      feedback.textContent = 'Local changeset committed. No result was sent to the provider.';
      await refreshTodos();
    });
  }
  async function refreshTodos() {
    if (!conversation) return;
    const id = conversation.id;
    try {
      const result = await api('llm/todos', { id }, { signal });
      if (!disposed && conversation?.id === id) {
        localTodoContent.replaceChildren(json(result));
        for (const item of result.undoActions || []) {
          localTodoContent.append(button(`${item.action === 'kee_redo' ? 'Redo' : 'Undo'} ${item.changeset.slice(0, 12)}`,
            () => undoTodo(item), 'button secondary'));
        }
      }
    } catch (error) { if (!disposed && conversation?.id === id) {
      clientError = error.message || String(error); notifyState();
      feedback.textContent = `Local TODOs unavailable: ${error.message}`;
    } }
  }
  async function inspectReceipt() {
    if (!conversation || !receiptCall.value || receiptPending || disposed) return;
    const id = conversation.id, callId = receiptCall.value;
    receiptPending = true; inspectReceiptButton.disabled = true;
    try {
      const result = await api('llm/receipt', { id, callId }, { signal });
      if (!disposed && conversation?.id === id && receiptCall.value === callId) {
        localReceiptContent.replaceChildren(el('h3', {}, `Observed: ${result.status}`), json(result));
      }
    } catch (error) {
      if (!disposed && conversation?.id === id) {
        clientError = error.message || String(error); notifyState();
        feedback.textContent = `Receipt inspection unavailable: ${error.message}`;
      }
    } finally {
      receiptPending = false;
      if (!disposed) inspectReceiptButton.disabled = !receiptCall.value;
    }
  }
  async function sendChat(preset) {
    const first = typeof preset === 'string';
    updateControls();
    if (first ? firstReply.disabled : send.disabled) return;
    const sent = first ? preset : text.value, plain = chatMode.value === 'plain', authorized = grant;
    const enqueue = send.textContent === 'Enqueue';
    if (!enqueue) clientSteps = [];
    grant = null;
    await action(async () => {
      if (!conversation) {
        const data = await request('start', { scope: { ...emptyScope(), grant: null } });
        drawConversation(data); text.value = sent; persistDraft(); drafts.write(null, '');
        container?.onConversationChange?.({ agent: 'llm-knowledge', identity: 'llm', id: data.id });
      }
      const id = conversation.id;
      const data = await request(enqueue ? 'queue/enqueue' : 'chat', { id, revision: conversation.revision,
        text: sent, approvedNonsensitive: true,
        ...(enqueue ? { callId: crypto.randomUUID() } : plain ? {} : { grant: authorized }) });
      if (conversation?.id !== id) return;
      if (text.value === sent) text.value = '';
      persistDraft(); invalidatePreview(); drawConversation(data);
      feedback.textContent = enqueue ? 'Message enqueued. It will not be resent by switching or reconnecting.'
        : 'Turn accepted. Waiting for the complete response…';
    });
  }
  async function queueControl(kind) {
    if (!conversation) return;
    const id = conversation.id;
    await action(async () => {
      if (kind === 'resume') {
        const data = await request('queue/resume', { id, revision: conversation.revision, approvedNonsensitive: true });
        if (conversation?.id === id) drawConversation(data);
      } else {
        const ids = conversation.queue.items.filter(item => item.status === 'queued').map(item => item.callId);
        for (const callId of ids) {
          const data = await request('queue/cancel', { id, revision: conversation.revision, callId });
          if (conversation?.id !== id) return;
          drawConversation(data);
        }
        feedback.textContent = `Cancelled ${ids.length} queued message(s). The current turn was not interrupted.`;
      }
    });
  }
  async function control(kind) {
    if (!conversation || disposed) return;
    const id = conversation.id;
    try {
      const result = await request(kind, { id });
      if (disposed || conversation?.id !== id) return;
      invalidatePreview(); drawConversation(result);
      feedback.textContent = `${kind === 'stop' ? 'Conversation stopped' : 'Interruption requested'}. No provider cancellation or log erasure is promised.`;
    } catch (error) { if (!disposed && conversation?.id === id) {
      connection = 'disconnected'; clientError = error.message || String(error); updateControls();
      feedback.textContent = `Control outcome unknown: ${error.message}. Reconnect to inspect; no automatic retry.`;
    } }
  }
  async function poll() {
    timer = null;
    if (disposed || !active || !conversation || (!refreshRequested && conversation.status !== 'running')) return;
    if (document.hidden || polling) { timer = setTimeout(poll, 2000); return; }
    polling = true; refreshRequested = false;
    const id = conversation.id;
    try {
      const result = await api('llm/conversation', { id }, { signal });
      if (!disposed && conversation?.id === id) drawConversation(result);
    }
    catch (error) { if (!disposed && conversation?.id === id) {
      connection = 'disconnected'; clientError = error.message || String(error); updateControls();
      feedback.textContent = `Status unavailable: ${error.message}. Reconnect only reads status; it never retries a mutation.`;
    } }
    finally {
      polling = false;
      if (!disposed && active && (refreshRequested || conversation?.status === 'running') && !timer)
        timer = setTimeout(poll, 2000);
    }
  }
  async function reconnect() {
    if (disposed || pending) return;
    if (!conversation) { await loadInitial(); return; }
    const id = conversation.id;
    try {
      const result = await api('llm/conversation', { id }, { signal });
      if (!disposed && conversation?.id === id) {
        invalidatePreview(); drawConversation(result);
        feedback.textContent = `Status reconnected: ${result.status}. No work was resubmitted.`;
      }
    } catch (error) {
      if (!disposed && conversation?.id === id) {
        connection = 'disconnected'; clientError = error.message || String(error); updateControls();
        feedback.textContent = `Reconnect failed: ${error.message}`;
      }
    }
  }
  async function refreshHistory() {
    await loadHistory(false, 0);
  }
  async function moreHistory() {
    if (historyOffset + 25 >= historyTotal) return;
    await loadHistory(true, historyOffset + 25);
  }
  async function loadHistory(append, offset) {
    if (historyLoading || disposed) return;
    historyLoading = true;
    try {
      const data = await api('llm/conversations', { offset, limit: 25 }, { signal });
      if (disposed) return;
      historyTotal = data.total; historyOffset = offset;
      const current = historyEntries.get(conversation?.id);
      if (!append) historyEntries.clear();
      for (const item of data.items) if (item.id) historyEntries.set(item.id, item);
      if (current && !historyEntries.has(current.id)) historyEntries.set(current.id, current);
      drawHistoryPicker();
      if (connection === 'connected') clientError = null;
      notifyState();
      historyState.textContent = `${historyEntries.size} of ${data.total} conversations. Opening never submits work.`;
    } catch (error) { if (!disposed) {
      clientError = error.message || String(error); notifyState();
      historyState.textContent = `History unavailable: ${error.message}`;
    } }
    finally { historyLoading = false; if (!disposed) updateControls(); }
  }
  function drawHistoryPicker() {
    historyPicker.replaceChildren(
      el('option', { value: '' }, 'New or previous conversation...'),
      el('option', { value: '__new__' }, 'New conversation'),
      el('option', { value: '__branch__' }, 'Branch this conversation'),
      ...[...historyEntries.values()].map(item => el('option', { value: item.id },
        `${item.createdAt ? new Date(item.createdAt * 1000).toLocaleString() : item.id.slice(0, 8)} · ${item.model} · ${item.status}`)));
    historyPicker.value = conversation?.id ?? '';
  }
  async function openSelectedConversation() {
    const selected = historyPicker.value;
    if (!selected || pending) return;
    clientSteps = [];
    if (selected === '__new__') { await startConversation(); return; }
    await action(async () => {
      persistDraft();
      const data = selected === '__branch__'
        ? await request('fork', { id: conversation.id, revision: conversation.revision })
        : await api('llm/conversation', { id: selected }, { signal });
      drawConversation(data);
      container?.onConversationChange?.({ agent: 'llm-knowledge', identity: 'llm', id: data.id });
      feedback.textContent = 'History opened. Disclosure approval was not restored; no work was submitted.';
    });
  }
  async function refreshModels() {
    await action(async () => {
      modelState.textContent = 'Reading the actual provider model catalog…';
      const data = await api('llm/models', {}, { signal });
      modelSuggestions.replaceChildren(...modelOptions(data.items, model.value)
        .map(item => el('option', { value: item.id }, item.label)));
      modelState.textContent = data.selectedAvailable ? `${data.items.length} model suggestions returned. No inference request was sent.`
        : `Saved model ${data.selected} is not listed here. Its spelling is unchanged; the provider decides whether it is accepted when you send.`;
    });
  }
  async function saveSettings() {
    if (!model.reportValidity()) {
      feedback.textContent = 'Enter an exact model ID (1-200 printable ASCII characters, no whitespace).';
      return;
    }
    await action(async () => {
      settings = await request('settings/save', { revision: settings.revision, settings: {
        model: model.value, budgets: Object.fromEntries(Object.entries(budgetInputs).map(([key, input]) => [key, input.valueAsNumber])),
      } });
      invalidatePreview();
      feedback.textContent = 'Agent settings saved. Start a new conversation to use them; existing snapshots are unchanged.';
    });
  }
  async function savePrompt() {
    await action(async () => {
      const saved = await request('prompt/save', { content: prompt.value, revision: promptRevision });
      promptRevision = saved.revision; promptState.textContent = `Raw SHA-256: ${saved.rawHash}`;
      feedback.textContent = 'Prompt revision saved for new conversations only.';
    });
  }
  updateControls();
  if (disposed) return panel;
  async function loadInitial() {
   try {
    const [saved, document] = await Promise.all([api('llm/settings', {}, { signal }), api('llm/prompt', {}, { signal })]);
    if (disposed) return panel;
    settings = saved; base.textContent = saved.baseURL;
    connection = 'connected'; clientError = null;
    model.value = saved.model;
    modelSuggestions.replaceChildren(el('option', { value: saved.model }, saved.model));
    for (const [key, input] of Object.entries(budgetInputs)) input.value = saved.budgets[key];
    prompt.value = document.content; promptRevision = document.revision;
    promptState.textContent = `Raw SHA-256: ${document.rawHash}`;
    identity.textContent = `LLM · saved model ${saved.model} · no conversation started`;
    transcript.replaceChildren(el('div', { className: 'llm-empty' },
      el('h2', {}, 'Just chat'),
      el('p', {}, 'Write a message and Send, or choose a new or previous conversation above. Settings contains optional knowledge tools.')));
    text.value = drafts.read(null);
    if (route.params.has('conversation')) drawConversation(await api('llm/conversation', { id: route.params.get('conversation') }, { signal }));
    await refreshHistory();
    updateControls();
   } catch (error) { if (!disposed) {
     connection = 'disconnected'; clientError = error.message || String(error); updateControls();
     feedback.textContent = `Agent unavailable: ${error.message}. Reconnect status retries only these reads; no model request was sent.`;
   } }
  }
  await loadInitial();
  return panel;
}
