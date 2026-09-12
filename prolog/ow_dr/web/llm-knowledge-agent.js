// Extend powder's operating workspace: text conversation left, inspectable controls right.
// Keep the established palette and typography; explicit export consent precedes every Chat.
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
    && !!text.trim() && approved;
}

export async function renderLLMKnowledgeAgent(host, route, signal) {
  const { api, element: el, button, heading } = host;
  if (!document.querySelector('link[data-llm-agent-style]')) {
    document.head.append(el('link', { rel: 'stylesheet', 'data-llm-agent-style': '',
      href: new URL('./llm-knowledge-agent.css', import.meta.url).href }));
  }
  const panel = el('div', { className: 'llm-agent' },
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
  for (const name of ['Settings', 'Events', 'Raw JSON', 'Audit', 'Todos']) {
    const key = name.toLowerCase().replace(' ', '-');
    const page = el('section', { role: 'tabpanel', id: `llm-${key}`, hidden: name !== 'Settings',
      'aria-labelledby': `llm-tab-${key}`, className: 'llm-inspector-page' });
    const tab = button(name, () => selectTab(name), 'text-button');
    tab.id = `llm-tab-${key}`; tab.setAttribute('role', 'tab');
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
    el('p', { className: 'muted' }, 'Optional. Choose exact canonical terms and nonsensitive read MTs. No whole-file uploads. Current connections expose only genuine selected-term read tools; managed edits are unavailable until the audited registry bridge is connected.'),
    el('label', { className: 'field' }, 'Approved term keys', termKeys),
    el('label', { className: 'field' }, 'Approved read MTs', readMts), start, promptEditor);
  let settings, promptRevision, conversation = null, pending = false, timer, polling = false, disposed = false;
  signal.addEventListener('abort', () => { disposed = true; clearTimeout(timer); }, { once: true });
  function selectTab(name) {
    for (const [key, page] of pages) {
      const selected = key === name; page.hidden = !selected;
      tabButtons.get(key).setAttribute('aria-selected', String(selected));
      tabButtons.get(key).tabIndex = selected ? 0 : -1;
    }
  }
  function updateControls() {
    send.disabled = !canChat({ conversation, text: text.value, approved: consent.checked, pending });
    start.disabled = pending || !settings || conversation?.status === 'running';
    interrupt.disabled = !conversation || conversation.status !== 'running';
    stop.disabled = !conversation || conversation.status === 'closed';
  }
  function drawConversation(data) {
    if (conversation?.id === data.id && data.revision < conversation.revision) return;
    conversation = data;
    identity.textContent = `LLM · ${data.model} · ${data.status} · prompt ${data.promptHash.slice(0, 12)}`;
    transcript.replaceChildren();
    if (!data.messages.length) transcript.append(el('p', { className: 'llm-empty' },
      'Conversation started. The prompt is frozen; no message has been sent to the model.'));
    for (const message of data.messages) {
      const label = message.role === 'user' ? 'You' : message.role === 'assistant' ? `LLM · ${data.model}` : 'KEE tool result';
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
      el('p', {}, data.todos.reason || 'No managed todos returned.'));
    if (data.error) feedback.textContent = `${data.error.code}: ${data.error.message}`;
    updateControls();
    if (data.status === 'running' && !timer) timer = setTimeout(poll, 1500);
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
      feedback.textContent = 'Capturing model settings and exact prompt bytes…';
      const data = await request('start', { scope: { terms: selectedKeys(termKeys.value),
        readMts: selectedKeys(readMts.value), writeMts: [] } });
      drawConversation(data);
      const params = new URLSearchParams(route.params); params.set('conversation', data.id);
      history.replaceState(null, '', `#/llm-knowledge?${params}`);
      feedback.textContent = 'Conversation started. Chat is the only action that sends your message to the model.';
    });
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
    if (disposed || conversation?.status !== 'running') return;
    if (document.hidden || polling) { timer = setTimeout(poll, 2000); return; }
    polling = true;
    try { drawConversation(await api('llm/conversation', { id: conversation.id }, { signal })); }
    catch (error) { if (!disposed) feedback.textContent = `Status unavailable: ${error.message}`; }
    finally {
      polling = false;
      if (!disposed && conversation?.status === 'running' && !timer) timer = setTimeout(poll, 2000);
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
