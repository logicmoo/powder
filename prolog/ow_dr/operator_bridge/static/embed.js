'use strict';
(() => {
  const bootstrap = document.getElementById('embed-bootstrap');
  const {parentOrigin, provider} = bootstrap.dataset;
  let capability = bootstrap.dataset.capability;
  bootstrap.remove();
  const channel = 'powder.operator.embed.v1';
  const nonce = crypto.randomUUID();
  const uuid = /^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$/;
  let parentProbe;
  const prefix = `/embed/api/${provider}`;
  let bound = false, active = false, disposed = false, unread = 0, revision = 0;
  let connected = false, state = 'pairing', controller, lastSequence = null;
  let conversationId = null, sequence = 0, error = null;
  let resolveReady;
  const ready = new Promise(resolve => { resolveReady = resolve; });
  const $ = id => document.getElementById(id);
  const exact = (value, keys) => value && typeof value === 'object' && !Array.isArray(value)
    && Object.keys(value).sort().join(',') === keys.sort().join(',');

  function publish() {
    if (!bound || disposed) return;
    window.parent.postMessage({channel, type: 'state', nonce, provider,
      revision: ++revision, status: state, connected, unread, conversationId, sequence, error,
      probe: parentProbe}, parentOrigin);
  }
  function emitHello() {
    if (window.parent !== window && window.top === window.parent && !bound && !disposed)
      window.parent.postMessage({channel, type: 'hello', nonce, provider}, parentOrigin);
  }
  const helloTimer = setInterval(emitHello, 750);
  const handshakeTimer = setTimeout(() => {
    if (!bound) disconnect('This frame is not attached to the configured main workspace. Return to the main workspace to pair.');
  }, 10000);
  window.addEventListener('message', event => {
    if (event.source !== window.parent || event.origin !== parentOrigin || disposed) return;
    const message = event.data;
    if (!exact(message, ['channel', 'type', 'nonce', 'provider', 'active', 'probe'])
        || message.channel !== channel || message.nonce !== nonce || message.provider !== provider
        || typeof message.active !== 'boolean' || typeof message.probe !== 'string' || !uuid.test(message.probe)) return;
    if (!bound && message.type === 'bind') {
      bound = true;
      clearInterval(helloTimer); clearTimeout(handshakeTimer);
      $('pair-submit').disabled = false;
      $('parent-status').textContent = `Isolated ${provider} view · paired only with ${parentOrigin}`;
      resolveReady();
    } else if (!bound || message.type !== 'lifecycle') return;
    parentProbe = message.probe;
    active = message.active;
    if (active) unread = 0;
    publish();
  });

  async function request(path, body = {}, keepalive = false) {
    if (!capability || disposed) throw new Error('Pair this operator frame again.');
    return fetch(prefix + path, {
      method: 'POST', credentials: 'omit', cache: 'no-store', redirect: 'error',
      headers: {'Content-Type': 'application/json', 'X-Operator-Embed': capability},
      body: JSON.stringify(body), keepalive,
    });
  }
  async function api(path, body) {
    await ready;
    const route = path === '/api/operator/stop' ? '/stop'
      : path === '/api/draft' && body === undefined ? '/draft/read' : path.slice(4);
    const response = await request(route, body);
    if (response.status === 401) disconnect('Pairing expired. Pair this frame again; no command was retried.');
    const value = await response.json();
    if (!response.ok) {
      const error = new Error(value.error?.message || 'Operator request failed.');
      error.code = value.error?.code; error.details = value.error; throw error;
    }
    return value;
  }
  function disconnect(message) {
    if (disposed) return;
    if (capability) request('/logout', {}, true).catch(() => {});
    capability = '';
    connected = false; state = 'disconnected';
    error = 'Operator view disconnected. Pair again inside the isolated view.';
    publish();
    disposed = true;
    clearInterval(helloTimer); clearTimeout(handshakeTimer);
    controller?.abort();
    $('paired-view').hidden = true; $('pairing-view').hidden = false;
    $('pair-form').hidden = true; $('pair-retry').hidden = false;
    $('pair-error').textContent = message;
  }
  async function connect(handlers) {
    await ready;
    if (!capability || disposed) return;
    controller = new AbortController();
    try {
      const response = await fetch(prefix + '/events', {
        method: 'POST', credentials: 'omit', cache: 'no-store', redirect: 'error',
        headers: {'Content-Type': 'application/json', 'X-Operator-Embed': capability},
        body: JSON.stringify({since: 0}), signal: controller.signal,
      });
      if (!response.ok) throw new Error('Pairing or stream connection failed.');
      const reader = response.body.getReader(), decoder = new TextDecoder();
      let buffered = '', opened = false, previousStatus;
      while (!disposed) {
        const chunk = await reader.read();
        if (chunk.done) throw new Error('Operator output disconnected.');
        buffered += decoder.decode(chunk.value, {stream: true});
        let lineEnd;
        while ((lineEnd = buffered.indexOf('\n')) >= 0) {
          if (lineEnd > 2 * 1024 * 1024) throw new Error('Operator output exceeded the frame limit.');
          const value = JSON.parse(buffered.slice(0, lineEnd)); buffered = buffered.slice(lineEnd + 1);
          if (value.provider !== provider || value.type !== 'snapshot') throw new Error('Operator output identity mismatch.');
          if (!opened) { opened = true; connected = true; handlers.open(); }
          state = value.data.state;
          if (conversationId !== value.data.conversationId) {
            conversationId = value.data.conversationId;
            sequence = 0; lastSequence = null; unread = 0;
          }
          sequence = Math.max(sequence, value.latestSequence);
          if (lastSequence === null) lastSequence = value.latestSequence;
          for (const item of value.events) {
            if (!active && item.sequence > lastSequence && item.kind === 'assistant.output') unread = Math.min(999, unread + 1);
          }
          lastSequence = Math.max(lastSequence, value.lastSequence);
          const statusKey = JSON.stringify(value.data);
          if (statusKey !== previousStatus) {
            previousStatus = statusKey;
            handlers.status(value.data);
          }
          value.events.forEach(handlers.event);
          publish();
        }
        if (buffered.length > 2 * 1024 * 1024) throw new Error('Operator output exceeded the frame limit.');
      }
    } catch {
      if (!disposed) disconnect('Output disconnected. Pair again to replay recorded output. No command is resent.');
    } finally {
      handlers.close();
    }
  }
  $('pair-retry').href = `/embed?provider=${provider}`;
  $('pair-form').addEventListener('submit', event => {
    if (!bound || disposed) event.preventDefault();
    else $('pair-submit').disabled = true;
  });
  $('pairing-view').hidden = Boolean(capability);
  $('paired-view').hidden = !capability;
  $('pair-provider').value = provider;
  $('pair-title').textContent = `Pair ${provider === 'codex' ? 'Codex' : 'Copilot'} inside this workspace`;
  window.operatorEmbed = Object.freeze({
    provider, paired: Boolean(capability), api, connect,
    close: () => disconnect('This frame is unpaired. Its durable transcript and draft are retained.'),
  });
  window.addEventListener('pagehide', () => disconnect('Frame closed. Pair again to reconnect.'));
  emitHello();
})();
