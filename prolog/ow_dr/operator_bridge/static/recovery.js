'use strict';
const $ = id => document.getElementById(id);
let socket, sequence = 0, connected = false, state, reconnect, refreshTimer, draftTimer, pendingSend;
function text(tag, value, className) {
  const node = document.createElement(tag); node.textContent = value;
  if (className) node.className = className;
  return node;
}
function notice(message, error = false) {
  $('notice').textContent = message; $('notice').classList.toggle('error', error);
}
async function api(path, body) {
  const response = await fetch(path, body === undefined ? {cache: 'no-store'} : {
    method: 'POST', headers: {'Content-Type': 'application/json'}, body: JSON.stringify(body)
  });
  if (response.status === 401) { location.assign('/'); throw new Error('Browser pairing expired.'); }
  const value = await response.json();
  if (!response.ok) throw new Error(value.error?.message || 'Bridge request failed.');
  return value;
}
function renderStatus(value) {
  if (state && state.conversationId !== value.conversationId) {
    sequence = 0; $('transcript').replaceChildren(); $('empty').hidden = false;
  }
  state = value;
  $('bridge').textContent = connected ? 'Online' : 'Reconnecting';
  $('copilot').textContent = value.state.replaceAll('_', ' ');
  $('prolog').textContent = value.application.configured ? (value.application.online ? 'Online' : 'Offline') : 'Not registered';
  const available = connected && value.adapter.available;
  $('start').disabled = !available || value.stopped || value.state !== 'offline';
  $('prompt').disabled = !available || value.state === 'offline';
  $('send').disabled = $('prompt').disabled;
  if (!value.adapter.available) notice('Live Copilot adapter is not configured. This recovery transport is online, but it is not a live CLI.');
  else if (value.stopOutcome === 'unknown') notice('Native stop outcome is unknown. Inspect the owned CLI session; no automatic retry will occur.', true);
  else if (value.stopped) notice('Operator stopped explicitly. History remains available; a new bridge start is required for another native session.');
  else if (!connected) notice('Reconnecting to the bridge. Output will replay; commands will not.', true);
  else notice('Operator session is independent of Prolog. Each native permission needs your explicit decision.');
  const identity = $('identity'); identity.replaceChildren();
  for (const [label, item] of [['Workspace', value.workspace.root], ['Branch', value.workspace.branch],
    ['Conversation', value.conversationId], ['Native session', value.sdkSessionId || 'Not started'],
    ['Bridge PID', value.bridge.pid], ['CLI PIDs', value.adapter.ownedPids.join(', ') || 'None'],
    ['Application lifecycle', value.application.message || 'No restart authority']]) {
    identity.append(text('dt', label), text('dd', String(item)));
  }
  const permissions = $('permissions'); permissions.replaceChildren();
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
        catch (error) { notice(error.message, true); await refresh(); }
      });
      article.append(button);
    }
    permissions.append(article);
  }
  const commands = $('commands'); commands.replaceChildren();
  for (const command of value.commands.slice(0, 15)) {
    const item = text('li', `${command.kind}: ${command.state} · ${command.id}`);
    if (['queued', 'running', 'awaiting_permission'].includes(command.state)) {
      const cancel = text('button', 'Cancel this command');
      cancel.type = 'button'; cancel.disabled = !connected;
      cancel.addEventListener('click', async () => {
        cancel.disabled = true;
        try { await api(`/api/commands/${encodeURIComponent(command.id)}/cancel`, {}); await refresh(); }
        catch (error) { notice(error.message, true); }
      });
      item.append(cancel);
    }
    commands.append(item);
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
  node.append(text('div', `${item.sequence} · ${item.kind}`, 'event-label'));
  node.append(text('pre', item.data.text || item.data.message || item.data.title ||
    [item.data.id, item.data.state || item.data.decision || item.data.sessionId].filter(Boolean).join(' · ')));
  $('transcript').append(node);
  while ($('transcript').children.length > 1000) $('transcript').firstElementChild.remove();
}
function connect() {
  clearTimeout(reconnect);
  socket = new WebSocket(`${location.protocol === 'https:' ? 'wss:' : 'ws:'}//${location.host}/events?since=${sequence}`);
  socket.addEventListener('open', () => { connected = true; refresh(); });
  socket.addEventListener('message', message => {
    const value = JSON.parse(message.data);
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
async function submit(kind, content = '') {
  if (pendingSend?.sending) return;
  const id = pendingSend && pendingSend.kind === kind && pendingSend.text === content
    ? pendingSend.id : crypto.randomUUID();
  pendingSend = {id, kind, text: content, sending: true};
  try {
    await api('/api/commands', {id, kind, text: content});
    if (kind === 'prompt') { $('prompt').value = ''; await api('/api/draft', {text: ''}); }
    pendingSend = null;
    await refresh();
  } catch (error) {
    pendingSend.sending = false;
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
  draftTimer = setTimeout(() => api('/api/draft', {text: $('prompt').value})
    .catch(error => notice(`Draft not saved: ${error.message}`, true)), 400);
});
$('start').addEventListener('click', () => submit('start_session'));
$('stop').addEventListener('click', async () => {
  try { await api('/api/operator/stop', {confirmation: $('confirmation').value}); $('confirmation').value = ''; await refresh(); }
  catch (error) { notice(error.message, true); }
});
$('logout').addEventListener('click', async () => {
  try { await api('/api/logout', {}); location.assign('/'); }
  catch (error) { notice(error.message, true); }
});
api('/api/draft').then(value => { $('prompt').value = value.text; }).catch(error => notice(error.message, true));
connect();
