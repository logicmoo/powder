const CHANNEL = 'powder.operator.embed.v1';
const STATES = new Set(['pairing', 'disconnected', 'offline', 'idle', 'busy', 'awaiting_permission']);
const exact = (value, keys) => value && typeof value === 'object' && !Array.isArray(value)
  && Object.keys(value).sort().join(',') === keys.sort().join(',');

/** Display-only host for an independently authenticated, privileged operator frame. */
export function createOperatorAgent(host, {
  provider, active = false, signal, onStateChange = () => {},
  bridgeURL = 'http://operator.localhost:8063/embed',
} = {}) {
  if (!['copilot', 'codex'].includes(provider)) throw new TypeError('Unknown operator provider.');
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
  status.textContent = 'Connecting to the isolated operator view. No operator starts automatically.';
  const retry = document.createElement('button');
  retry.type = 'button'; retry.className = 'operator-agent-retry';
  retry.textContent = 'Retry view connection'; retry.hidden = true;
  const iframe = document.createElement('iframe');
  iframe.title = `${provider === 'codex' ? 'Codex' : 'Copilot'} operator · isolated conversation`;
  iframe.className = 'operator-agent-frame';
  iframe.referrerPolicy = 'no-referrer';
  iframe.setAttribute('sandbox', 'allow-scripts allow-same-origin allow-forms');
  iframe.setAttribute('allow', "camera 'none'; microphone 'none'; geolocation 'none'");
  let nonce, revision = 0, destroyed = false, notified = false;
  let state = Object.freeze({provider, state: 'pairing', connected: false, unread: 0});
  function send(type) {
    if (nonce && !destroyed)
      iframe.contentWindow.postMessage({channel: CHANNEL, type, nonce, provider, active}, url.origin);
  }
  function setState(next) {
    if (notified && next.state === state.state && next.connected === state.connected && next.unread === state.unread) return;
    notified = true;
    state = Object.freeze(next);
    onStateChange({...state});
  }
  function receive(event) {
    if (destroyed || event.origin !== url.origin || event.source !== iframe.contentWindow) return;
    const message = event.data;
    if (message?.channel !== CHANNEL || message.provider !== provider
        || typeof message.nonce !== 'string' || !/^[a-f0-9-]{36}$/.test(message.nonce)) return;
    if (message.type === 'hello' && exact(message, ['channel', 'type', 'nonce', 'provider'])) {
      if (message.nonce !== nonce) { nonce = message.nonce; revision = 0; }
      clearTimeout(timeout);
      status.hidden = true; retry.hidden = true;
      send('bind');
      return;
    }
    if (message.type !== 'state' || message.nonce !== nonce
        || !exact(message, ['channel', 'type', 'nonce', 'provider', 'revision', 'state', 'connected', 'unread'])
        || !Number.isSafeInteger(message.revision) || message.revision <= revision
        || !STATES.has(message.state) || typeof message.connected !== 'boolean'
        || !Number.isInteger(message.unread) || message.unread < 0 || message.unread > 999) return;
    revision = message.revision;
    setState({provider, state: message.state, connected: message.connected, unread: message.unread});
  }
  function activate() { active = true; element.hidden = false; send('lifecycle'); }
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
      setState({provider, state: 'disconnected', connected: false, unread: 0});
    }, 10000);
  }
  retry.addEventListener('click', () => {
    if (destroyed) return;
    nonce = undefined; revision = 0; retry.hidden = true;
    status.hidden = false; status.textContent = 'Reconnecting the view only. No operator starts automatically.';
    setState({provider, state: 'pairing', connected: false, unread: 0});
    armTimeout(); iframe.src = url.href;
  });
  armTimeout();
  window.addEventListener('message', receive);
  iframe.src = url.href;
  element.append(status, retry, iframe); host.append(element);
  element.hidden = !active;
  signal?.addEventListener('abort', destroy, {once: true});
  if (signal?.aborted) destroy();
  return {element, activate, deactivate, getState: () => ({...state}), destroy};
}
