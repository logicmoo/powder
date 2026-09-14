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
  return [...new Set([selected, ...items])].map(id => ({
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
  const text = el('textarea', { rows: 4, maxLength: 8192, name: 'llm-message',
    placeholder: 'Ask a knowledge question or describe a symbolic capability to teach.',
    oninput: () => { invalidatePreview(); persistDraft(); updateControls(); } });
  const consent = el('input', { type: 'checkbox', name: 'llm-export-consent', onchange: updateControls });
  const send = button('Chat', sendChat);
  const mode = el('select', { name: 'llm-purpose', 'aria-label': 'Explicit Teacher action', onchange: () => {
    invalidatePreview(); updateControls();
  } }, el('option', { value: 'chat' }, 'Chat'),
  el('option', { value: 'generate_comment' }, 'Generate Comment — unsaved proposal'));
  const allowTodos = el('input', { type: 'checkbox', name: 'llm-automatic-todos', onchange: () => {
    invalidatePreview(); updateControls();
  } });
  const start = button('Start new conversation', startConversation, 'button secondary');
  const interrupt = button('Interrupt turn', () => control('interrupt'), 'button secondary');
  const stop = button('Stop conversation', () => control('stop'), 'button secondary');
  const composer = el('form', { className: 'llm-composer', onsubmit: event => { event.preventDefault(); sendChat(); } },
    el('label', { className: 'field' }, 'Message (text only)', text),
    el('label', { className: 'llm-consent' }, consent,
      'I reviewed every preview message, evidence field and tool schema. This exact material is authorized and nonsensitive under the provider notice.'),
    el('label', { className: 'field' }, 'Action', mode),
    el('label', { className: 'llm-consent' }, allowTodos,
      'Allow automatic audited changes to this conversation’s TODOs only. Receipts stay local; no general KB edits.'),
    button('Preview this turn locally', previewGrounding, 'button secondary'),
    el('div', { className: 'form-actions' }, send, interrupt, stop),
    el('p', { className: 'muted' }, 'Responses arrive after completion, not incrementally. Interrupt is best effort; provider logs and processing may remain.'));
  const historyPicker = el('select', { 'aria-label': 'Teacher conversation history', name: 'llm-history' });
  const historyState = el('p', { className: 'muted' });
  const main = el('section', { className: 'llm-chat' }, identity,
    el('div', { className: 'llm-history' }, historyPicker,
      button('Open conversation', openSelectedConversation, 'button secondary'),
      button('Refresh history', refreshHistory, 'button secondary'),
      button('More history', moreHistory, 'button secondary'),
      button('Reconnect status', reconnect, 'button secondary'), historyState),
    transcript, composer, feedback);
  const inspector = el('aside', { className: 'llm-inspector', 'aria-label': 'LLM agent inspector' });
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
  panel.append(notice, el('div', { className: 'llm-workspace' }, main, inspector));
  const model = el('select', { name: 'llm-model', 'aria-label': 'Application agent model' });
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
    el('p', { className: 'muted' }, 'LLM identity — does not change the Copilot coding model or symbolic agent.'),
    el('label', { className: 'field' }, 'Host-owned provider', base),
    el('label', { className: 'field' }, 'Explicit model', model),
    button('Refresh models', refreshModels, 'button secondary'), modelState, budgets,
    button('Save agent settings', saveSettings, 'button secondary'),
    el('h2', {}, 'Selected context'),
    el('p', { className: 'muted' }, 'Set the scope before starting a conversation. Preview and approve each exact turn before Chat or Generate. A preview is local; it is not permission for future raw KEE reads. TODO/audit/receipt inspection stays local.'),
    el('label', { className: 'field' }, 'Preview term selectors', termKeys),
    el('label', { className: 'field' }, 'Preview read-MT selectors', readMts),
    el('label', { className: 'field' }, 'TODO write-MT ceiling', writeMts),
    previewButton, start, promptEditor);
  composer.insertBefore(groundingPreview, composer.firstChild);
  composer.append(approveButton);
  let settings, promptRevision, conversation = null, pending = false, timer, polling = false, disposed = false;
  let preview = null;
  let grant = null, connection = 'connected', historyOffset = 0, historyTotal = 0, historyLoading = false;
  let receiptPending = false;
  let refreshRequested = false, clientError = null;
  const sequences = new Map();
  for (const input of [termKeys, readMts, writeMts]) input.addEventListener('input', () => {
    invalidatePreview();
    groundingPreview.replaceChildren(el('p', { className: 'muted' }, 'Selectors changed. Start a new conversation to apply a different scope.'));
  });
  signal.addEventListener('abort', () => { persistDraft(); disposed = true; clearTimeout(timer); notifyState(); }, { once: true });
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
      pending, draft: text.value,
    }; }
  function notifyState() { container?.onStateChange?.(getState()); }
  function persistDraft() {
    if (!drafts.write(conversation?.id, text.value)) feedback.textContent = 'Draft storage unavailable; keep this tab open or copy your draft.';
    notifyState();
  }
  function invalidatePreview() { preview = null; grant = null; consent.checked = false; }
  function selectTab(name) {
    for (const [key, page] of pages) {
      const selected = key === name; page.hidden = !selected;
      tabButtons.get(key).setAttribute('aria-selected', String(selected));
      tabButtons.get(key).tabIndex = selected ? 0 : -1;
    }
  }
  function updateControls() {
    if (preview && preview.expiresAt * 1000 <= Date.now()) invalidatePreview();
    previewButton.disabled = pending;
    approveButton.disabled = pending || !preview || !consent.checked || !!grant;
    send.disabled = connection !== 'connected' || !grant
      || !canChat({ conversation, text: text.value, approved: consent.checked, pending });
    send.textContent = mode.value === 'generate_comment' ? 'Generate Comment (unsaved)' : 'Chat';
    allowTodos.disabled = mode.value === 'generate_comment';
    start.disabled = pending || !settings || conversation?.status === 'running';
    interrupt.disabled = !conversation || !['running', 'outcome_unknown'].includes(conversation.status);
    stop.disabled = !conversation || conversation.status === 'closed';
    notifyState();
  }
  function drawConversation(data) {
    if (conversation?.id === data.id && data.revision < conversation.revision) return;
    if (conversation?.id !== data.id) {
      persistDraft(); invalidatePreview();
      text.value = drafts.read(data.id);
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
    connection = 'connected'; clientError = null;
    identity.textContent = `LLM · ${data.model} · ${data.status} · prompt ${data.promptHash.slice(0, 12)}`;
    transcript.replaceChildren();
    if (!data.messages.length) transcript.append(el('p', { className: 'llm-empty' },
      'Conversation started. The prompt is frozen; no message has been sent to the model.'));
    for (const message of data.messages) {
      const label = message.role === 'user' ? (message.name === 'approved_grounding' ? 'Approved grounding (untrusted data)' : 'You')
        : message.role === 'assistant'
          ? `${data.action === 'generate_comment' && message === data.messages.at(-1) ? 'Unsaved AI comment proposal' : 'LLM'} · ${data.model}`
          : 'KEE tool result';
      const content = typeof message.content === 'string' ? message.content : '';
      transcript.append(el('article', { className: `llm-message llm-message-${message.role}` },
        el('h3', {}, label), el('pre', {}, content),
        message.tool_calls?.length ? el('pre', { className: 'llm-tool-calls' },
          JSON.stringify(message.tool_calls, null, 2)) : null));
    }
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
  async function request(path, body) {
    return api(`llm/${path}`, {}, { method: 'POST', body, signal });
  }
  async function action(operation) {
    if (pending || disposed) return;
    pending = true; updateControls();
    try { await operation(); }
    catch (error) { if (!disposed) {
      grant = null; consent.checked = false; connection = 'disconnected';
      clientError = error.message || String(error);
      feedback.textContent = `Not completed: ${error.message}. Reconnect to inspect status; no automatic mutation retry.`;
    } }
    finally { pending = false; if (!disposed) updateControls(); }
  }
  async function startConversation() {
    await action(async () => {
      const scope = selectedScope();
      feedback.textContent = 'Capturing model settings and exact prompt bytes…';
      const data = await request('start', { scope: { ...scope, grant: null } });
      drawConversation(data);
      if (container?.updateLocation !== false) {
        const params = new URLSearchParams(route.params); params.set('conversation', data.id);
        history.replaceState(null, '', `#/llm-knowledge?${params}`);
      }
      container?.onConversationChange?.({ agent: 'llm-knowledge', identity: 'llm', id: data.id });
      feedback.textContent = 'Conversation started. Preview and approve an explicit turn; nothing has been sent to the model.';
      await refreshHistory();
    });
  }
  function selectedScope() {
    return { terms: selectedKeys(termKeys.value), readMts: selectedKeys(readMts.value),
      writeMts: selectedKeys(writeMts.value) };
  }
  async function previewGrounding() {
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
      if (allowTodos.checked && mode.value === 'chat') requests.push({ tool: 'kee_ledger_status', arguments: {} });
      const captured = { conversation: conversation.id, revision: conversation.revision, text: text.value,
        mode: mode.value, automaticTodos: allowTodos.checked && mode.value === 'chat', requests };
      invalidatePreview();
      const result = await request('grounding/preview', captured);
      if (captured.conversation !== conversation?.id || captured.revision !== conversation.revision
          || captured.text !== text.value || captured.mode !== mode.value
          || captured.automaticTodos !== (allowTodos.checked && mode.value === 'chat')
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
      feedback.textContent = 'Local preview ready. Review all fields, check the disclosure box, then Approve exact preview.';
    });
  }
  async function approvePreview() {
    if (!preview || !consent.checked) return;
    const captured = preview;
    await action(async () => {
      const result = await request('grounding/approve', { id: captured.id, hash: captured.hash, approvedNonsensitive: true });
      if (preview === captured && consent.checked) grant = result.id;
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
  async function sendChat() {
    if (!grant || connection !== 'connected'
        || !canChat({ conversation, text: text.value, approved: consent.checked, pending })) return;
    const id = conversation.id, sent = text.value, authorized = grant;
    grant = null; consent.checked = false;
    await action(async () => {
      const data = await request('chat', { id, revision: conversation.revision,
        text: sent, grant: authorized, approvedNonsensitive: true });
      if (conversation?.id !== id) return;
      if (text.value === sent) text.value = '';
      persistDraft(); invalidatePreview(); drawConversation(data);
      feedback.textContent = 'Turn accepted. Waiting for the complete response…';
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
    if (disposed) return;
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
      const options = data.items.filter(item => item.id).map(item => el('option', { value: item.id },
        `${new Date(item.createdAt * 1000).toLocaleString()} · ${item.model} · ${item.status}`));
      if (append) historyPicker.append(...options); else historyPicker.replaceChildren(...options);
      if ([...historyPicker.options].some(item => item.value === conversation?.id)) historyPicker.value = conversation.id;
      if (connection === 'connected') clientError = null;
      notifyState();
      historyState.textContent = `${historyPicker.options.length} of ${data.total} conversations. Opening never submits work.`;
    } catch (error) { if (!disposed) {
      clientError = error.message || String(error); notifyState();
      historyState.textContent = `History unavailable: ${error.message}`;
    } }
    finally { historyLoading = false; }
  }
  async function openSelectedConversation() {
    if (!historyPicker.value) return;
    await action(async () => {
      persistDraft();
      const data = await api('llm/conversation', { id: historyPicker.value }, { signal });
      drawConversation(data);
      container?.onConversationChange?.({ agent: 'llm-knowledge', identity: 'llm', id: data.id });
      feedback.textContent = 'History opened. Disclosure approval was not restored; no work was submitted.';
    });
  }
  async function refreshModels() {
    await action(async () => {
      modelState.textContent = 'Reading the actual provider model catalog…';
      const data = await api('llm/models', {}, { signal });
      model.replaceChildren(...modelOptions(data.items, settings.model)
        .map(item => el('option', { value: item.id, selected: item.id === settings.model }, item.label)));
      modelState.textContent = data.selectedAvailable ? `${data.items.length} models returned. No inference request was sent.`
        : `Saved model ${data.selected} is unavailable. It remains selected; choose another explicitly.`;
    });
  }
  async function saveSettings() {
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
    model.replaceChildren(el('option', { value: saved.model, selected: true }, saved.model));
    for (const [key, input] of Object.entries(budgetInputs)) input.value = saved.budgets[key];
    prompt.value = document.content; promptRevision = document.revision;
    promptState.textContent = `Raw SHA-256: ${document.rawHash}`;
    identity.textContent = `LLM · saved model ${saved.model} · no conversation started`;
    transcript.replaceChildren(el('div', { className: 'llm-empty' },
      el('h2', {}, 'Start a Teacher conversation'),
      el('p', {}, 'Review the provider notice and settings. Select bounded context or leave selectors empty for text-only Chat. Every turn has a local disclosure preview.')));
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
