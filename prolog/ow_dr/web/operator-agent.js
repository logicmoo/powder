const CHANNEL = 'powder.operator.embed.v1';
const STATES = new Set(['pairing', 'disconnected', 'offline', 'idle', 'busy', 'awaiting_permission']);
const UUID = /^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$/;
const exact = (value, keys) => value && typeof value === 'object' && !Array.isArray(value)
  && Object.keys(value).sort().join(',') === keys.sort().join(',');

/** Display-only host for an independently authenticated, privileged operator frame. */
export function createOperatorAgent(host, {
  provider, active = false, signal, onStateChange = () => {},
  bridgeURL,
} = {}) {
  if (!['copilot', 'codex'].includes(provider)) throw new TypeError('Unknown operator provider.');
  if (typeof bridgeURL !== 'string') throw new TypeError('Supply the host-owned operator bridgeURL descriptor.');
  const url = new URL(bridgeURL);
  if (url.protocol !== 'http:' || url.hostname !== 'operator.localhost' || !url.port
      || url.username || url.password || url.pathname !== '/embed' || url.search || url.hash)
    throw new TypeError('Operator bridgeURL must be the fixed isolated-origin /embed URL.');
  url.searchParams.set('provider', provider);
  const element = document.createElement('section');
  element.className = 'operator-agent';
  const status = document.createElement('p');
  status.className = 'operator-agent-connection';
  status.setAttribute('role', 'status');
  status.textContent = 'Select this operator to connect its isolated view. No operator starts automatically.';
  const retry = document.createElement('button');
  retry.type = 'button'; retry.className = 'operator-agent-retry';
  retry.textContent = 'Retry view connection'; retry.hidden = true;
  const iframe = document.createElement('iframe');
  iframe.title = `${provider === 'codex' ? 'Codex' : 'Copilot'} operator · isolated conversation`;
  iframe.className = 'operator-agent-frame';
  iframe.referrerPolicy = 'no-referrer';
  iframe.setAttribute('sandbox', 'allow-scripts allow-same-origin allow-forms');
  iframe.setAttribute('allow', "camera 'none'; microphone 'none'; geolocation 'none'");
  let nonce, revision = 0, destroyed = false, notified = false, loaded = false;
  let state = Object.freeze({provider, status: 'not_loaded', conversationId: null,
    sequence: 0, error: null, connected: false, unread: 0});
  function send(type) {
    if (nonce && !destroyed)
      iframe.contentWindow.postMessage({channel: CHANNEL, type, nonce, provider, active}, url.origin);
  }
  function setState(next) {
    if (notified && Object.keys(state).every(key => next[key] === state[key])) return;
    notified = true;
    state = Object.freeze(next);
    onStateChange({...state});
  }
  function receive(event) {
    if (destroyed || event.origin !== url.origin || event.source !== iframe.contentWindow) return;
    const message = event.data;
    if (message?.channel !== CHANNEL || message.provider !== provider
        || typeof message.nonce !== 'string' || !UUID.test(message.nonce)) return;
    if (message.type === 'hello' && exact(message, ['channel', 'type', 'nonce', 'provider'])) {
      if (message.nonce !== nonce) { nonce = message.nonce; revision = 0; }
      clearTimeout(timeout);
      status.hidden = true; retry.hidden = true;
      send('bind');
      return;
    }
    if (message.type !== 'state' || message.nonce !== nonce
        || !exact(message, ['channel', 'type', 'nonce', 'provider', 'revision', 'status', 'connected', 'unread',
          'conversationId', 'sequence', 'error'])
        || !Number.isSafeInteger(message.revision) || message.revision <= revision
        || !STATES.has(message.status) || typeof message.connected !== 'boolean'
        || !(message.conversationId === null || (typeof message.conversationId === 'string' && UUID.test(message.conversationId)))
        || !Number.isSafeInteger(message.sequence) || message.sequence < 0
        || (message.conversationId === null && message.sequence !== 0)
        || !(message.error === null || message.error === 'Operator view disconnected. Pair again inside the isolated view.')
        || !Number.isInteger(message.unread) || message.unread < 0 || message.unread > 999) return;
    if (message.conversationId !== null && message.conversationId === state.conversationId
        && message.sequence < state.sequence) return;
    revision = message.revision;
    setState({provider, status: message.status, connected: message.connected, unread: message.unread,
      conversationId: message.conversationId ?? state.conversationId,
      sequence: message.conversationId === null ? state.sequence : message.sequence, error: message.error});
  }
  function load() {
    loaded = true; nonce = undefined; revision = 0; retry.hidden = true;
    status.hidden = false; status.textContent = 'Connecting the view only. No operator starts automatically.';
    setState({...state, status: 'pairing', connected: false, error: null});
    armTimeout(); iframe.src = url.href;
  }
  function activate() {
    if (destroyed) return;
    active = true; element.hidden = false;
    if (!loaded) load();
    else send('lifecycle');
  }
  function deactivate() { active = false; element.hidden = true; send('lifecycle'); }
  function destroy() {
    if (destroyed) return;
    destroyed = true; clearTimeout(timeout);
    window.removeEventListener('message', receive);
    signal?.removeEventListener('abort', destroy);
    iframe.src = 'about:blank'; element.remove();
  }
  let timeout;
  function armTimeout() {
    clearTimeout(timeout);
    timeout = setTimeout(() => {
      status.textContent = 'Operator bridge unavailable or embedding not configured. Ask the operator to start the bridge; this view never starts it.';
      retry.hidden = false;
      setState({...state, status: 'disconnected', connected: false, error: status.textContent});
    }, 10000);
  }
  retry.addEventListener('click', () => {
    if (destroyed) return;
    load();
  });
  window.addEventListener('message', receive);
  element.append(status, retry, iframe); host.append(element);
  element.hidden = !active;
  signal?.addEventListener('abort', destroy, {once: true});
  if (signal?.aborted) destroy();
  else if (active) activate();
  return {element, activate, deactivate, getState: () => ({...state}), destroy};
}
