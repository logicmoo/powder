'use strict';
(() => {
const $ = id => document.getElementById(id);
const embed = window.operatorEmbed;
const selectedProvider = new URLSearchParams(location.search).get('provider');
const provider = embed?.provider || (['copilot', 'codex'].includes(selectedProvider) ? selectedProvider : 'copilot');
const providerName = provider === 'codex' ? 'Codex operator' : 'Copilot operator';
const prefix = `/api/operators/${provider}`;
let socket, sequence = 0, connected = false, state, reconnect, refreshTimer, draftTimer, pendingSend;
let draftLoaded = false, draftWrites = Promise.resolve();
let permissionsKey, commandsKey;
let switching = false, draftConversation, catalogKey, manualNotice, pendingBranch, interruptPending;
const localDrafts = new Map();
$(`${provider}-chip`)?.setAttribute('aria-current', 'page');
$('native-label').textContent = providerName;
$('prompt-label').textContent = `Message to ${providerName}`;
function text(tag, value, className) {
  const node = document.createElement(tag); node.textContent = value;
  if (className) node.className = className;
  return node;
}
function notice(message, error = false) {
  manualNotice = {conversationId: state?.conversationId, message, error};
  $('notice').textContent = message; $('notice').classList.toggle('error', error);
}
function statusNotice(message, error = false) {
  const saved = manualNotice?.conversationId === state?.conversationId ? manualNotice : {message, error};
  $('notice').textContent = saved.message; $('notice').classList.toggle('error', saved.error);
}
function saveDraft(value, conversationId = draftConversation) {
  draftWrites = draftWrites.catch(() => {}).then(() => api('/api/draft', {text: value, conversationId})).then(result => {
    const local = localDrafts.get(conversationId);
    if (local?.text === value) local.dirty = false;
    return result;
  });
  return draftWrites;
}
async function api(path, body) {
  if (body !== undefined && path !== '/api/logout') body = {conversationId: state?.conversationId, ...body};
  if (embed) return embed.api(path, body);
  const scopedPath = path === '/api/logout' ? path
    : path === '/api/operator/stop' ? `${prefix}/stop` : prefix + path.slice(4);
  const response = await fetch(scopedPath, body === undefined ? {cache: 'no-store'} : {
    method: 'POST', headers: {'Content-Type': 'application/json'}, body: JSON.stringify(body)
  });
  if (response.status === 401) { location.assign('/'); throw new Error('Browser pairing expired.'); }
  const value = await response.json();
  if (!response.ok) {
    const error = new Error(value.error?.message || 'Bridge request failed.');
    error.code = value.error?.code; error.details = value.error; throw error;
  }
  return value;
}
function renderComposer() {
  const ready = connected && draftLoaded && !switching;
  $('send').textContent = state?.workPending ? 'Enqueue' : 'Send';
  $('send').disabled = !ready || !state?.adapter.available || (state.stopped && !state.canRestart)
    || Boolean(pendingSend?.sending) || !$('prompt').value.trim();
  $('interrupt').disabled = !connected || switching || Boolean(interruptPending) || !state?.activeCommandId;
}
function renderStatus(value) {
  if (state && value.selectionRevision < state.selectionRevision) return;
  const changed = !state || state.conversationId !== value.conversationId;
  if (changed) {
    manualNotice = null;
    clearTimeout(draftTimer); draftLoaded = false; draftConversation = value.conversationId;
    sequence = 0; $('transcript').replaceChildren(); $('empty').hidden = false;
    $('event-journal').replaceChildren();
    $('prompt').value = ''; pendingSend = pendingBranch = interruptPending = null; permissionsKey = commandsKey = null;
    $('conflict').hidden = true;
    $('model').value = value.settings?.model || '';
  }
  state = value;
  $('title').textContent = providerName;
  $('bridge').textContent = connected ? 'Online' : 'Reconnecting';
  $('copilot').textContent = value.state.replaceAll('_', ' ');
  $('prolog').textContent = value.application.configured ? (value.application.online ? 'Online' : 'Offline') : 'Not registered';
  const available = connected && value.adapter.available;
  $('start').disabled = !available || (value.stopped && !value.canRestart) || value.state !== 'offline';
  $('prompt').disabled = !connected || !draftLoaded || switching;
  renderComposer();
  $('conversation-select').disabled = !connected || switching;
  $('branch-conversation').disabled = !connected || switching || !draftLoaded || !value.branch?.ready;
  $('branch-conversation').title = value.branch?.reason || 'Native branching is unavailable in this bridge version.';
  $('branch-support').textContent = $('branch-conversation').title;
  $('permission-section').hidden = !value.permissions.length;
  if (changed) loadConversation(value.conversationId);
  if (!value.adapter.available) statusNotice(value.adapter.reason || `${providerName} adapter is not configured. Executable discovery does not mean a live session or authenticated account.`);
  else if (value.stopOutcome === 'unknown') statusNotice('Native stop outcome is unknown. Inspect the owned CLI session; no automatic retry will occur.', true);
  else if (value.stopped) statusNotice(value.canRestart ? 'Operator stopped. Start explicitly to resume its history; the other provider stays independent.' : 'Operator stopped explicitly. History remains available.');
  else if (!connected) statusNotice('Reconnecting to the bridge. Output will replay; commands will not.', true);
  else statusNotice(`${providerName} is independent of Prolog. Each native permission needs your explicit decision.`);
  if (value.displayProjection?.permissionsOmitted) {
    $('notice').textContent += ' Additional permission requests are outside this bounded view. No omitted request is approved; resolve visible requests or inspect standalone recovery.';
  }
  const identity = $('identity'); identity.replaceChildren();
  for (const [label, item] of [['Workspace', value.workspace.root], ['Branch', value.workspace.branch],
    ['Conversation', value.conversationId], ['Native session / thread', value.nativeSessionId || 'Not started'],
    ['Bridge PID', value.bridge.pid], ['CLI PIDs', value.adapter.ownedPids.join(', ') || 'None'],
    ['Provider', value.provider], ['Executable', value.adapter.executable?.path || 'Not discovered / test adapter'],
    ['Model', value.adapter.model || 'Provider-native default; access not verified'],
    ['Native authentication', value.adapter.authentication || 'Provider-owned; not shared'],
    ['Branched from', value.branchFrom?.conversationId
      ? `${value.branchFrom.conversationId} · through event ${value.branchFrom.sequence}` : 'Independent conversation'],
    ['Application lifecycle', value.application.message || 'No restart authority']]) {
    identity.append(text('dt', label), text('dd', String(item)));
  }
  const nextPermissionsKey = JSON.stringify([connected, value.permissions]);
  if (permissionsKey !== nextPermissionsKey) {
    permissionsKey = nextPermissionsKey;
    const permissions = $('permissions'); permissions.replaceChildren();
    if (!value.permissions.length) permissions.append(text('p', 'No pending permission requests.', 'muted'));
    for (const request of value.permissions) {
      const article = document.createElement('article');
      article.append(text('strong', request.title), text('pre', request.detail));
      for (const decision of ['deny', 'allow']) {
        const button = text('button', decision === 'allow' ? 'Allow this request' : 'Deny');
        button.type = 'button'; button.disabled = !connected;
        button.addEventListener('click', async () => {
          manualNotice = null;
          article.querySelectorAll('button').forEach(b => { b.disabled = true; });
          try { await api(`/api/permissions/${encodeURIComponent(request.id)}`, {decision, conversationId: value.conversationId}); await refresh(); }
          catch (error) { permissionsKey = null; notice(error.message, true); await refresh(); }
        });
        article.append(button);
      }
      permissions.append(article);
    }
  }
  const nextCommandsKey = JSON.stringify([connected, value.commands.slice(0, 15)]);
  if (commandsKey !== nextCommandsKey) {
    commandsKey = nextCommandsKey;
    const commands = $('commands'); commands.replaceChildren();
    for (const command of value.commands.slice(0, 15)) {
      const item = text('li', `${command.kind}: ${command.state} · ${command.id}`);
      if (['queued', 'running', 'awaiting_permission'].includes(command.state)) {
        const cancel = text('button', 'Cancel this command');
        cancel.type = 'button'; cancel.disabled = !connected;
        cancel.addEventListener('click', async () => {
          manualNotice = null;
          cancel.disabled = true;
          try { await api(`/api/commands/${encodeURIComponent(command.id)}/cancel`, {conversationId: value.conversationId}); await refresh(); }
          catch (error) { commandsKey = null; notice(error.message, true); await refresh(); }
        });
        item.append(cancel);
      }
      commands.append(item);
    }
  }
}
async function loadConversation(identifier) {
  const revision = state.selectionRevision;
  try {
    const [draft, catalog] = await Promise.all([api('/api/draft'), api('/api/conversations')]);
    if (state?.conversationId !== identifier || draft.conversationId !== identifier || catalog.conversationId !== identifier
        || state.selectionRevision !== revision || draft.selectionRevision !== revision || catalog.selectionRevision !== revision) return;
    const local = localDrafts.get(identifier);
    $('prompt').value = local?.dirty ? local.text : draft.text;
    localDrafts.set(identifier, {text: $('prompt').value, dirty: Boolean(local?.dirty)});
    draftLoaded = true; draftConversation = identifier;
    $('conversation-retry').hidden = true;
    const key = JSON.stringify(catalog);
    if (key !== catalogKey) {
      catalogKey = key;
      const options = [new Option('New conversation…', '__new__'), ...catalog.items.map(item => new Option(item.title, item.id))];
      $('conversation-select').replaceChildren(...options);
    }
    $('conversation-select').value = identifier;
    renderStatus(state);
  } catch (error) {
    $('conversation-retry').hidden = false;
    notice(`Conversation could not be loaded: ${error.message}`, true);
  }
}
async function refresh() {
  try { renderStatus(await api('/api/status')); }
  catch (error) { notice(error.message, true); }
}
function event(item, conversationId = state?.conversationId, revision = state?.selectionRevision) {
  if (conversationId !== state?.conversationId || revision !== state?.selectionRevision) return;
  if (item.sequence <= sequence) return;
  sequence = item.sequence;
  const node = document.createElement('li');
  node.append(text('div', `${provider} · ${item.sequence} · ${item.kind}`, 'event-label'));
  node.append(text('pre', item.data.text || item.data.message || item.data.title ||
    [item.data.id, item.data.state || item.data.decision || item.data.sessionId].filter(Boolean).join(' · ')));
  $('event-journal').append(node);
  while ($('event-journal').children.length > 1000) $('event-journal').firstElementChild.remove();
  const userMessage = item.kind === 'command.accepted' && item.data.kind === 'prompt';
  const assistantMessage = item.kind === 'assistant.output';
  const outcome = item.kind === 'command.state' && ['failed', 'unknown', 'cancelled'].includes(item.data.state);
  if (!userMessage && !assistantMessage && !outcome) return;
  $('empty').hidden = true;
  const message = document.createElement('li');
  message.append(text('div', userMessage ? 'You' : assistantMessage ? providerName : 'Command outcome', 'event-label'));
  message.append(text('pre', item.data.text || item.data.message || item.data.state));
  $('transcript').append(message);
  while ($('transcript').children.length > 1000) $('transcript').firstElementChild.remove();
}
function connect() {
  if (embed) {
    embed.connect({
      open() { connected = true; },
      status: renderStatus, event,
      close() { connected = false; if (state) renderStatus(state); },
    });
    return;
  }
  clearTimeout(reconnect);
  const cursor = new URLSearchParams({since: String(sequence), conversationId: state?.conversationId || '',
    revision: String(state?.selectionRevision ?? '')});
  socket = new WebSocket(`${location.protocol === 'https:' ? 'wss:' : 'ws:'}//${location.host}/events/${provider}?${cursor}`);
  socket.addEventListener('open', () => { connected = true; refresh(); });
  socket.addEventListener('message', message => {
    const value = JSON.parse(message.data);
    if (value.provider !== provider) return;
    if (value.type === 'status') renderStatus(value.data);
    if (value.type === 'events' && value.conversationId === state?.conversationId) {
      value.events.forEach(item => event(item, value.conversationId, value.selectionRevision));
      clearTimeout(refreshTimer); refreshTimer = setTimeout(refresh, 100);
    }
  });
  socket.addEventListener('close', () => {
    connected = false; if (state) renderStatus(state);
    refresh();
    reconnect = setTimeout(connect, document.hidden ? 10000 : 1500);
  });
}
async function submit(kind, content = '', startAnyway = false) {
  if (pendingSend?.sending || switching || !connected || (kind === 'prompt' && (!draftLoaded || !content.trim()))) return;
  manualNotice = null;
  const id = pendingSend && pendingSend.conversationId === state.conversationId && pendingSend.kind === kind && pendingSend.text === content
    ? pendingSend.id : crypto.randomUUID();
  const conversationId = state.conversationId;
  const request = {id, kind, text: content, conversationId, sending: true};
  pendingSend = request;
  renderComposer();
  try {
    const body = {id, kind, text: content, conversationId};
    if (kind === 'prompt') body.startIfNeeded = true;
    if (startAnyway) body.startAnyway = true;
    await api('/api/commands', body);
    $('conflict').hidden = true;
    if (state.conversationId !== conversationId) return;
    if (kind === 'prompt' && $('prompt').value === content) {
      clearTimeout(draftTimer); $('prompt').value = '';
      localDrafts.set(conversationId, {text:'', dirty:true}); await saveDraft('', conversationId);
    }
    if (pendingSend === request) pendingSend = null;
    await refresh();
  } catch (error) {
    if (pendingSend !== request) return;
    request.sending = false;
    if (error.code === 'operator_conflict') {
      $('conflict-message').textContent = `${error.message} Active: ${error.details.conflicts.join(', ')}.`;
      $('conflict').hidden = false; $('start-anyway').focus(); return;
    }
    // Query only: a timeout is not permission to repeat a model/tool request.
    try {
      const command = await api(`/api/commands/${encodeURIComponent(id)}`);
      if (state?.conversationId !== conversationId) return;
      notice(`Command ${id}: ${command.state}. It was not resent. Inspect Recent commands.`, true);
    } catch {
      notice(`${error.message} Command ${id}: outcome unknown. Any manual retry of unchanged input keeps this same identifier.`, true);
    }
  } finally {
    renderComposer();
  }
}
$('composer').addEventListener('submit', event => { event.preventDefault(); submit('prompt', $('prompt').value); });
$('prompt').addEventListener('input', () => {
  renderComposer();
  clearTimeout(draftTimer);
  const conversationId = draftConversation, value = $('prompt').value;
  localDrafts.set(conversationId, {text:value, dirty:true});
  draftTimer = setTimeout(() => saveDraft(value, conversationId)
    .catch(error => notice(`Draft not saved: ${error.message}`, true)), 400);
});
$('start').addEventListener('click', () => submit('start_session'));
$('start-anyway').addEventListener('click', () => {
  if (pendingSend) submit(pendingSend.kind, pendingSend.text, true);
  else if (pendingBranch) chooseConversation('__branch__', true);
});
$('dismiss-conflict').addEventListener('click', () => {
  $('conflict').hidden = true; pendingSend = pendingBranch = null;
});
$('stop').addEventListener('click', async () => {
  try { await api('/api/operator/stop', {confirmation: $('confirmation').value}); $('confirmation').value = ''; await refresh(); }
  catch (error) { notice(error.message, true); }
});
$('logout').addEventListener('click', async () => {
  if (embed) { embed.close(); return; }
  try { await api('/api/logout', {}); location.assign('/'); }
  catch (error) { notice(error.message, true); }
});
$('settings-toggle').addEventListener('click', () => {
  $('inspector').hidden = !$('inspector').hidden;
  $('settings-toggle').setAttribute('aria-expanded', String(!$('inspector').hidden));
});
$('conversation-retry').addEventListener('click', () => {
  $('conversation-retry').hidden = true; loadConversation(state.conversationId);
});
$('settings-form').addEventListener('submit', async event => {
  event.preventDefault();
  manualNotice = null;
  const conversationId = state?.conversationId;
  try {
    await api('/api/settings', {conversationId, model: $('model').value.trim() || null});
    await refresh();
    if (state?.conversationId === conversationId) notice('Settings saved for this conversation. The next explicit Send resumes with these settings.');
  } catch (error) { notice(error.message, true); }
});
$('interrupt').addEventListener('click', async () => {
  if (!connected || switching || interruptPending || !state?.activeCommandId) return;
  const request = {conversationId: state.conversationId, id: state.activeCommandId};
  interruptPending = request; manualNotice = null; renderComposer();
  try {
    const command = await api(`/api/commands/${encodeURIComponent(request.id)}/cancel`, {conversationId: request.conversationId});
    if (state?.conversationId === request.conversationId) {
      notice(command.state === 'unknown' ? 'Interrupt outcome is unknown. Inspect Recent commands; do not resend.'
        : 'Interrupt request finished. Queued messages remain in order.', command.state === 'unknown');
    }
  } catch (error) {
    if (state?.conversationId === request.conversationId) notice(error.message, true);
  } finally {
    if (interruptPending === request) interruptPending = null;
    renderComposer(); await refresh();
  }
});
async function chooseConversation(choice, startAnyway = false) {
  if (switching || !draftLoaded) return;
  manualNotice = null;
  const previous = state.conversationId;
  const route = choice === '__new__' ? 'new' : choice === '__branch__' ? 'branch' : 'select';
  if (route !== 'branch') pendingBranch = null;
  const body = route === 'branch' && pendingBranch?.conversationId === previous ? {...pendingBranch}
    : {conversationId: previous, id: route === 'select' ? choice : crypto.randomUUID()};
  if (route === 'branch') { pendingBranch = {...body}; pendingSend = null; }
  if (startAnyway) body.startAnyway = true;
  switching = true; clearTimeout(draftTimer); renderStatus(state);
  try {
    await saveDraft($('prompt').value, previous);
    await api('/api/conversations/' + route, body);
    pendingBranch = null; $('conflict').hidden = true;
    await refresh();
  } catch (error) {
    $('conversation-select').value = state.conversationId;
    if (error.code === 'operator_conflict' && route === 'branch') {
      $('conflict-message').textContent = `${error.message} Active: ${error.details.conflicts.join(', ')}.`;
      $('conflict').hidden = false; $('start-anyway').focus();
    } else notice(`Conversation switch paused: ${error.message}`, true);
  } finally {
    switching = false;
    $('conversation-select').disabled = !connected;
    $('prompt').disabled = !connected || !draftLoaded;
    renderComposer();
    $('branch-conversation').disabled = !connected || !draftLoaded || !state.branch?.ready;
  }
}
$('conversation-select').addEventListener('change', () => chooseConversation($('conversation-select').value));
$('branch-conversation').addEventListener('click', () => chooseConversation('__branch__'));
document.querySelectorAll('.provider-chip').forEach(link => {
  link.addEventListener('click', async event => {
    event.preventDefault(); clearTimeout(draftTimer);
    try {
      if (draftLoaded) await saveDraft($('prompt').value);
      location.assign(link.href);
    } catch (error) { notice(`Provider switch paused: draft was not saved. ${error.message}`, true); }
  });
});
if (!embed || embed.paired) {
  connect();
}
})();
