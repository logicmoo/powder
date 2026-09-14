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
$(`${provider}-chip`)?.setAttribute('aria-current', 'page');
$('native-label').textContent = providerName;
$('prompt-label').textContent = `Message to ${providerName}`;
function text(tag, value, className) {
  const node = document.createElement(tag); node.textContent = value;
  if (className) node.className = className;
  return node;
}
function notice(message, error = false) {
  $('notice').textContent = message; $('notice').classList.toggle('error', error);
}
function saveDraft(value) {
  draftWrites = draftWrites.catch(() => {}).then(() => api('/api/draft', {text: value}));
  return draftWrites;
}
async function api(path, body) {
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
function renderStatus(value) {
  if (state && state.conversationId !== value.conversationId) {
    sequence = 0; $('transcript').replaceChildren(); $('empty').hidden = false;
  }
  state = value;
  $('title').textContent = value.role;
  $('bridge').textContent = connected ? 'Online' : 'Reconnecting';
  $('copilot').textContent = value.state.replaceAll('_', ' ');
  $('prolog').textContent = value.application.configured ? (value.application.online ? 'Online' : 'Offline') : 'Not registered';
  const available = connected && value.adapter.available;
  $('start').disabled = !available || (value.stopped && !value.canRestart) || value.state !== 'offline';
  $('prompt').disabled = !connected;
  $('send').disabled = !available || value.stopped || value.state === 'offline';
  if (!value.adapter.available) notice(value.adapter.reason || `${providerName} adapter is not configured. Executable discovery does not mean a live session or authenticated account.`);
  else if (value.stopOutcome === 'unknown') notice('Native stop outcome is unknown. Inspect the owned CLI session; no automatic retry will occur.', true);
  else if (value.stopped) notice(value.canRestart ? 'Operator stopped. Start explicitly to resume its history; the other provider stays independent.' : 'Operator stopped explicitly. History remains available.');
  else if (!connected) notice('Reconnecting to the bridge. Output will replay; commands will not.', true);
  else notice(`${providerName} is independent of Prolog. Each native permission needs your explicit decision.`);
  const identity = $('identity'); identity.replaceChildren();
  for (const [label, item] of [['Workspace', value.workspace.root], ['Branch', value.workspace.branch],
    ['Conversation', value.conversationId], ['Native session / thread', value.nativeSessionId || 'Not started'],
    ['Bridge PID', value.bridge.pid], ['CLI PIDs', value.adapter.ownedPids.join(', ') || 'None'],
    ['Provider', value.provider], ['Executable', value.adapter.executable?.path || 'Not discovered / test adapter'],
    ['Model', value.adapter.model || 'Provider-native default; access not verified'],
    ['Native authentication', value.adapter.authentication || 'Provider-owned; not shared'],
    ['Application lifecycle', value.application.message || 'No restart authority']]) {
    identity.append(text('dt', label), text('dd', String(item)));
  }
  const nextPermissionsKey = JSON.stringify([connected, value.permissions]);
  if (permissionsKey !== nextPermissionsKey) {
    permissionsKey = nextPermissionsKey;
    const permissions = $('permissions'); permissions.replaceChildren();
    if (embed && value.permissions.length) $('inspector').open = true;
    if (!value.permissions.length) permissions.append(text('p', 'No pending permission requests.', 'muted'));
    for (const request of value.permissions) {
      const article = document.createElement('article');
      article.append(text('strong', request.title), text('pre', request.detail));
      for (const decision of ['deny', 'allow']) {
        const button = text('button', decision === 'allow' ? 'Allow this request' : 'Deny');
        button.type = 'button'; button.disabled = !connected;
        button.addEventListener('click', async () => {
          article.querySelectorAll('button').forEach(b => { b.disabled = true; });
          try { await api(`/api/permissions/${encodeURIComponent(request.id)}`, {decision}); await refresh(); }
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
          cancel.disabled = true;
          try { await api(`/api/commands/${encodeURIComponent(command.id)}/cancel`, {}); await refresh(); }
          catch (error) { commandsKey = null; notice(error.message, true); await refresh(); }
        });
        item.append(cancel);
      }
      commands.append(item);
    }
  }
}
async function refresh() {
  try { renderStatus(await api('/api/status')); }
  catch (error) { notice(error.message, true); }
}
function event(item) {
  if (item.sequence <= sequence) return;
  sequence = item.sequence;
  $('empty').hidden = true;
  const node = document.createElement('li');
  node.append(text('div', `${provider} · ${item.sequence} · ${item.kind}`, 'event-label'));
  node.append(text('pre', item.data.text || item.data.message || item.data.title ||
    [item.data.id, item.data.state || item.data.decision || item.data.sessionId].filter(Boolean).join(' · ')));
  $('transcript').append(node);
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
  socket = new WebSocket(`${location.protocol === 'https:' ? 'wss:' : 'ws:'}//${location.host}/events/${provider}?since=${sequence}`);
  socket.addEventListener('open', () => { connected = true; refresh(); });
  socket.addEventListener('message', message => {
    const value = JSON.parse(message.data);
    if (value.provider !== provider) return;
    if (value.type === 'status') renderStatus(value.data);
    if (value.type === 'events') {
      value.events.forEach(event);
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
  if (pendingSend?.sending) return;
  const id = pendingSend && pendingSend.kind === kind && pendingSend.text === content
    ? pendingSend.id : crypto.randomUUID();
  pendingSend = {id, kind, text: content, sending: true};
  try {
    const body = {id, kind, text: content};
    if (kind === 'start_session' && startAnyway) body.startAnyway = true;
    await api('/api/commands', body);
    $('conflict').hidden = true;
    if (kind === 'prompt' && $('prompt').value === content) {
      clearTimeout(draftTimer); $('prompt').value = ''; await saveDraft('');
    }
    pendingSend = null;
    await refresh();
  } catch (error) {
    pendingSend.sending = false;
    if (error.code === 'operator_conflict') {
      $('conflict-message').textContent = `${error.message} Active: ${error.details.conflicts.join(', ')}.`;
      $('conflict').hidden = false; $('start-anyway').focus(); return;
    }
    // Query only: a timeout is not permission to repeat a model/tool request.
    try {
      const command = await api(`/api/commands/${encodeURIComponent(id)}`);
      notice(`Command ${id}: ${command.state}. It was not resent. Inspect Recent commands.`, true);
    } catch {
      notice(`${error.message} Command ${id}: outcome unknown. Any manual retry of unchanged input keeps this same identifier.`, true);
    }
  }
}
$('composer').addEventListener('submit', event => { event.preventDefault(); submit('prompt', $('prompt').value); });
$('prompt').addEventListener('input', () => {
  clearTimeout(draftTimer);
  draftTimer = setTimeout(() => saveDraft($('prompt').value)
    .catch(error => notice(`Draft not saved: ${error.message}`, true)), 400);
});
$('start').addEventListener('click', () => submit('start_session'));
$('start-anyway').addEventListener('click', () => {
  if (pendingSend?.kind === 'start_session') submit('start_session', pendingSend.text, true);
});
$('dismiss-conflict').addEventListener('click', () => {
  $('conflict').hidden = true; pendingSend = null;
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
  api('/api/draft').then(value => { $('prompt').value = value.text; draftLoaded = true; })
    .catch(error => notice(error.message, true));
  connect();
}
})();
