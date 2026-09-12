// Extend powder's operating workspace: text conversation left, inspectable controls right.
// Keep the established palette and typography; explicit export consent precedes every Chat.
let nextViewId = 0;

/**
 * Keep this controller mounted for the Teacher chip's lifetime. Deactivation
 * pauses view polling only; it never aborts a turn or changes another agent.
 */
export async function createLLMKnowledgeAgent(host, {
  route = { params: new URLSearchParams() }, signal, active = true, onConversationChange,
} = {}) {
  const lifecycle = new AbortController();
  const abort = () => lifecycle.abort();
  if (signal?.aborted) abort();
  else signal?.addEventListener('abort', abort, { once: true });
  let controls;
  const element = await renderLLMKnowledgeAgent({
    ...host,
    llmContainer: { active, updateLocation: false, onConversationChange,
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

export function modelOptions(items, selected) {
  return [...new Set([selected, ...items])].map(id => ({
    id, label: items.includes(id) ? id : `${id} — availability not confirmed`,
  }));
}
export function selectedKeys(text) {
  return [...new Set(text.split(/\r?\n/u).map(value => value.trim()).filter(Boolean))];
}
export function canChat({ conversation, text, approved, pending }) {
  return !!conversation && !pending && !['running', 'closed'].includes(conversation.status)
    && !conversation.calls?.some(call => ['reserved', 'unknown'].includes(call.state))
    && !!text.trim() && approved;
}

export async function renderLLMKnowledgeAgent(host, route, signal) {
  const { api, element: el, button, heading } = host;
  const container = host.llmContainer;
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
    oninput: () => { consent.checked = false; updateControls(); } });
  const consent = el('input', { type: 'checkbox', name: 'llm-export-consent', onchange: updateControls });
  const send = button('Chat', sendChat);
  const start = button('Start new conversation', startConversation, 'button secondary');
  const interrupt = button('Interrupt turn', () => control('interrupt'), 'button secondary');
  const stop = button('Stop conversation', () => control('stop'), 'button secondary');
  const composer = el('form', { className: 'llm-composer', onsubmit: event => { event.preventDefault(); sendChat(); } },
    el('label', { className: 'field' }, 'Message (text only)', text),
    el('label', { className: 'llm-consent' }, consent,
      'I approve sending this nonsensitive message and the selected bounded KB grounding under the provider notice.'),
    el('div', { className: 'form-actions' }, send, interrupt, stop),
    el('p', { className: 'muted' }, 'Responses arrive after completion, not incrementally. Interrupt is best effort; provider logs and processing may remain.'));
  const main = el('section', { className: 'llm-chat' }, identity, transcript, composer, feedback);
  const inspector = el('aside', { className: 'llm-inspector', 'aria-label': 'LLM agent inspector' });
  const tabs = el('div', { className: 'llm-tabs', role: 'tablist', 'aria-label': 'Agent inspector tabs' });
  const pages = new Map(), tabButtons = new Map();
  const localTodoContent = el('div', { className: 'llm-local-todos' });
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
  const readMts = el('textarea', { rows: 2, name: 'llm-read-mts', placeholder: 'One explicitly approved nonsensitive MT key per line' });
  const writeMts = el('textarea', { rows: 2, name: 'llm-write-mts', placeholder: 'Writable TODO MT keys; empty means application-global tasks only' });
  const groundingPreview = el('section', { className: 'llm-grounding-preview', 'aria-label': 'Local grounding preview' });
  const previewButton = button('Preview grounding locally', previewGrounding, 'button secondary');
  const approveButton = button('Approve exactly this nonsensitive preview', approveGrounding, 'button secondary');
  approveButton.disabled = true;
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
    el('h2', {}, 'Next conversation grounding'),
    el('p', { className: 'muted' }, 'Optional KB grounding: preview up to four term/MT pairs locally, then approve exact nonsensitive content, IDs and revisions. Changed content is withheld. Automatic audited TODO edits are limited to this conversation’s tasks, not KB assertions. No whole-file uploads or load tools.'),
    el('label', { className: 'field' }, 'Approved term keys', termKeys),
    el('label', { className: 'field' }, 'Approved read MTs', readMts),
    el('label', { className: 'field' }, 'TODO write-MT ceiling', writeMts),
    previewButton, groundingPreview, approveButton, start, promptEditor);
  let settings, promptRevision, conversation = null, pending = false, timer, polling = false, disposed = false;
  let preview = null, groundingGrant = null;
  for (const input of [termKeys, readMts, writeMts]) input.addEventListener('input', () => {
    preview = null; groundingGrant = null; approveButton.disabled = true;
    groundingPreview.replaceChildren(el('p', { className: 'muted' }, 'Scope changed. Preview and approve again before exporting KB content.'));
  });
  signal.addEventListener('abort', () => { disposed = true; clearTimeout(timer); }, { once: true });
  if (signal.aborted) disposed = true;
  container?.register({
    setActive(value) {
      if (disposed) return;
      active = !!value; panel.hidden = !active;
      clearTimeout(timer); timer = null;
      if (active && conversation?.status === 'running' && !polling) timer = setTimeout(poll, 0);
    },
    getState: () => ({
      agent: 'llm-knowledge', identity: 'llm', active, disposed,
      conversationId: conversation?.id ?? null, status: conversation?.status ?? 'not_started',
      model: conversation?.model ?? settings?.model ?? null,
      pending,
    }),
  });
  function selectTab(name) {
    for (const [key, page] of pages) {
      const selected = key === name; page.hidden = !selected;
      tabButtons.get(key).setAttribute('aria-selected', String(selected));
      tabButtons.get(key).tabIndex = selected ? 0 : -1;
    }
  }
  function updateControls() {
    previewButton.disabled = pending;
    approveButton.disabled = pending || !preview;
    send.disabled = !canChat({ conversation, text: text.value, approved: consent.checked, pending });
    start.disabled = pending || !settings || conversation?.status === 'running';
    interrupt.disabled = !conversation || conversation.status !== 'running';
    stop.disabled = !conversation || conversation.status === 'closed';
  }
  function drawConversation(data) {
    if (conversation?.id === data.id && data.revision < conversation.revision) return;
    if (conversation?.id !== data.id) localTodoContent.replaceChildren();
    conversation = data;
    identity.textContent = `LLM · ${data.model} · ${data.status} · prompt ${data.promptHash.slice(0, 12)}`;
    transcript.replaceChildren();
    if (!data.messages.length) transcript.append(el('p', { className: 'llm-empty' },
      'Conversation started. The prompt is frozen; no message has been sent to the model.'));
    for (const message of data.messages) {
      const label = message.role === 'user' ? (message.name === 'approved_grounding' ? 'Approved grounding (untrusted data)' : 'You')
        : message.role === 'assistant' ? `LLM · ${data.model}` : 'KEE tool result';
      const content = typeof message.content === 'string' ? message.content : '';
      transcript.append(el('article', { className: `llm-message llm-message-${message.role}` },
        el('h3', {}, label), el('pre', {}, content),
        message.tool_calls?.length ? el('pre', { className: 'llm-tool-calls' },
          JSON.stringify(message.tool_calls, null, 2)) : null));
    }
    pages.get('Events').replaceChildren(el('h2', {}, 'Turn events'), json(data.events));
    pages.get('Raw JSON').replaceChildren(el('h2', {}, 'Conversation response'), json(data));
    pages.get('Audit').replaceChildren(el('h2', {}, 'Actual execution records'),
      el('p', { className: 'muted' }, data.registry.limitation), json(data.audit), json(data.calls));
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
    catch (error) { if (!disposed) feedback.textContent = `Not completed: ${error.message}. No automatic retry.`; }
    finally { pending = false; if (!disposed) updateControls(); }
  }
  async function startConversation() {
    await action(async () => {
      if (selectedKeys(termKeys.value).length && !groundingGrant) {
        feedback.textContent = 'Preview and approve the exact nonsensitive grounding first. No provider request was sent.';
        return;
      }
      feedback.textContent = 'Capturing model settings and exact prompt bytes…';
      const data = await request('start', { scope: { ...selectedScope(), grant: groundingGrant } });
      drawConversation(data);
      if (container?.updateLocation !== false) {
        const params = new URLSearchParams(route.params); params.set('conversation', data.id);
        history.replaceState(null, '', `#/llm-knowledge?${params}`);
      }
      container?.onConversationChange?.({ agent: 'llm-knowledge', identity: 'llm', id: data.id });
      feedback.textContent = 'Conversation started. Chat is the only action that sends your message to the model.';
    });
  }
  function selectedScope() {
    return { terms: selectedKeys(termKeys.value), readMts: selectedKeys(readMts.value),
      writeMts: selectedKeys(writeMts.value) };
  }
  async function previewGrounding() {
    await action(async () => {
      const scope = selectedScope();
      if (!scope.terms.length || !scope.readMts.length || scope.terms.length * scope.readMts.length > 4) {
        feedback.textContent = 'Choose one to four term/MT pairs for a bounded local preview.';
        return;
      }
      const requests = scope.terms.flatMap(term => scope.readMts.flatMap(mt =>
        ['kee_definitions', 'kee_occurrences'].map(tool => ({
          tool, arguments: { term, mt, scope: 'all', offset: 0, limit: 5 },
        }))));
      const result = await request('grounding/preview', { scope, requests });
      if (JSON.stringify(scope) !== JSON.stringify(selectedScope())) {
        feedback.textContent = 'Scope changed during the local preview. Preview again.';
        return;
      }
      preview = result;
      groundingGrant = null;
      groundingPreview.replaceChildren(el('h3', {}, 'Local preview — not sent to the provider'),
        el('p', {}, 'Review every displayed field. Do not approve secrets, code, private KB material or bulk content.'),
        json(preview.entries), el('p', { className: 'muted' }, `Exact preview hash: ${preview.hash}`));
      approveButton.disabled = false;
      feedback.textContent = 'Local preview ready. Approval is separate from Start and Chat.';
    });
  }
  async function approveGrounding() {
    if (!preview) return;
    const captured = preview;
    await action(async () => {
      const result = await request('grounding/approve', {
        id: captured.id, hash: captured.hash, approvedNonsensitive: true,
      });
      if (preview !== captured) {
        feedback.textContent = 'Scope changed during approval. Preview the new scope before starting.';
        return;
      }
      groundingGrant = result.id;
      feedback.textContent = 'Exact preview approved. Changes invalidate export; Start captures this approval and Chat still requires explicit consent.';
    });
  }
  async function refreshTodos() {
    if (!conversation) return;
    const id = conversation.id;
    try {
      const result = await api('llm/todos', { id }, { signal });
      if (!disposed && conversation?.id === id) localTodoContent.replaceChildren(json(result));
    } catch (error) { feedback.textContent = `Local TODOs unavailable: ${error.message}`; }
  }
  async function sendChat() {
    if (!canChat({ conversation, text: text.value, approved: consent.checked, pending })) return;
    await action(async () => {
      const data = await request('chat', { id: conversation.id, revision: conversation.revision,
        text: text.value, approvedNonsensitive: consent.checked });
      text.value = ''; consent.checked = false; drawConversation(data);
      feedback.textContent = 'Turn accepted. Waiting for the complete response…';
    });
  }
  async function control(kind) {
    if (!conversation || disposed) return;
    try {
      drawConversation(await request(kind, { id: conversation.id }));
      feedback.textContent = `${kind === 'stop' ? 'Conversation stopped' : 'Interruption requested'}. No provider cancellation or log erasure is promised.`;
    } catch (error) { feedback.textContent = `Control failed: ${error.message}`; }
  }
  async function poll() {
    timer = null;
    if (disposed || !active || conversation?.status !== 'running') return;
    if (document.hidden || polling) { timer = setTimeout(poll, 2000); return; }
    polling = true;
    try { drawConversation(await api('llm/conversation', { id: conversation.id }, { signal })); }
    catch (error) { if (!disposed) feedback.textContent = `Status unavailable: ${error.message}`; }
    finally {
      polling = false;
      if (!disposed && active && conversation?.status === 'running' && !timer) timer = setTimeout(poll, 2000);
    }
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
  try {
    const [saved, document] = await Promise.all([api('llm/settings', {}, { signal }), api('llm/prompt', {}, { signal })]);
    if (disposed) return panel;
    settings = saved; base.textContent = saved.baseURL;
    model.append(el('option', { value: saved.model, selected: true }, saved.model));
    for (const [key, input] of Object.entries(budgetInputs)) input.value = saved.budgets[key];
    prompt.value = document.content; promptRevision = document.revision;
    promptState.textContent = `Raw SHA-256: ${document.rawHash}`;
    identity.textContent = `LLM · saved model ${saved.model} · no conversation started`;
    transcript.append(el('div', { className: 'llm-empty' },
      el('h2', {}, 'Start with an explicit scope'),
      el('p', {}, 'Review the provider notice and settings, optionally select nonsensitive terms and MTs, then start a conversation. Nothing is sent until you choose Chat.')));
    if (route.params.has('conversation')) drawConversation(await api('llm/conversation', { id: route.params.get('conversation') }, { signal }));
    updateControls();
  } catch (error) { feedback.textContent = `Agent unavailable: ${error.message}. No model request was sent.`; }
  return panel;
}
