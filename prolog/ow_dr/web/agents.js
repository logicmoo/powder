export const AGENT_ROLES = Object.freeze([
  { id: 'teacher', label: 'Teacher', type: 'LLM knowledge teacher' },
  { id: 'cyc', label: 'Cyc', type: 'Knowledge-defined symbolic agent' },
  { id: 'copilot', label: 'Copilot', type: 'CLI operator' },
  { id: 'codex', label: 'Codex', type: 'CLI operator' },
]);

export function agentKey(value) {
  return AGENT_ROLES.some(role => role.id === value) ? value : 'teacher';
}

export function unreadState(before = {}, next = {}, visible = false) {
  const conversationId = Object.hasOwn(next, 'conversationId') ? next.conversationId : before.conversationId ?? null;
  const same = before.conversationId === conversationId;
  const previous = same && Number.isSafeInteger(before.sequence) ? before.sequence : 0;
  const sequence = Number.isSafeInteger(next.sequence) && next.sequence >= 0 ? Math.max(previous, next.sequence) : previous;
  const seen = same ? before.seen ?? 0 : 0;
  return { conversationId, sequence, seen: visible ? Math.max(seen, sequence) : seen,
    unread: visible ? 0 : Math.max(0, sequence - seen) };
}

const factories = {
  teacher: async (host, options) => {
    const { createLLMKnowledgeAgent } = await import('./llm-knowledge-agent.js');
    return createLLMKnowledgeAgent(host, options);
  },
  cyc: async (host, options) => {
    const { createSymbolicAgent } = await import('./symbolic-agent.js');
    return createSymbolicAgent(host, options);
  },
  copilot: operatorFactory,
  codex: operatorFactory,
};
async function operatorFactory(host, options) {
  const { createOperatorAgent } = await import('./operator-agent.js');
  const mount = host.element('div', { className: 'operator-agent-host' });
  const controller = createOperatorAgent(mount, options);
  return { ...controller, element: mount,
    destroy() { controller.destroy(); mount.remove(); } };
}

// Route changes detach this element, not its controllers or in-flight requests.
export function createAgentWorkspace(host, {
  storage, loaders = factories,
  storageKey = `powder.agents.v1:${new URL('.', location.href).pathname}`,
} = {}) {
  const { element: el, heading, button, api } = host;
  const lifetime = new AbortController();
  const controllers = new Map(), creating = new Map(), slots = new Map(), chips = new Map();
  const observations = new Map();
  const feedback = el('p', { className: 'agents-feedback', role: 'status', 'aria-live': 'polite' });
  if (storage === undefined) {
    try { storage = globalThis.localStorage; }
    catch (error) {
      storage = null;
      feedback.textContent = `Browser storage is unavailable; local preferences will not persist: ${error.message}`;
    }
  }
  let active = false, disposed = false, selected = 'teacher', descriptor;
  const panel = el('section', { className: 'agents-workspace', 'aria-label': 'Four text agents' },
    heading('Agents', 'Separate conversations and permissions. Switching agents never submits work.'),
    feedback);
  const tabs = el('div', { className: 'agent-chips', role: 'tablist', 'aria-label': 'Agent type' });
  const views = el('div', { className: 'agent-views' });
  panel.append(tabs, views);
  function persist() {
    try {
      storage?.setItem(storageKey, JSON.stringify({ selected, observations: Object.fromEntries(observations) }));
    } catch (error) { feedback.textContent = `Agent selection could not be saved: ${error.message}`; }
  }
  try {
    const saved = JSON.parse(storage?.getItem(storageKey) ?? 'null');
    if (saved && typeof saved === 'object') {
      selected = agentKey(saved.selected);
      for (const role of AGENT_ROLES) {
        const value = saved.observations?.[role.id];
        if (value && typeof value === 'object' && Number.isSafeInteger(value.seen) && value.seen >= 0) {
          observations.set(role.id, value);
        }
      }
    }
  } catch (error) { feedback.textContent = `Saved agent selection is unreadable: ${error.message}`; }
  function report(id, value = {}) {
    if (disposed) return;
    const visible = active && selected === id && !document.hidden;
    const next = unreadState(observations.get(id), value, visible);
    observations.set(id, next);
    const chip = chips.get(id);
    chip.status.textContent = value.status ?? 'not started';
    chip.count.textContent = next.unread ? `${next.unread} unread` : '0 unread';
    chip.button.title = value.error?.message ?? value.error ?? AGENT_ROLES.find(role => role.id === id).type;
    persist();
  }
  for (const role of AGENT_ROLES) {
    const status = el('span', { className: 'agent-chip-status' }, 'not connected');
    const savedUnread = observations.get(role.id)?.unread;
    const count = el('span', { className: 'agent-chip-unread' },
      Number.isSafeInteger(savedUnread) ? `${savedUnread} unread (last seen)` : 'unread not checked');
    const tab = button('', () => choose(role.id), 'agent-chip');
    tab.id = `agent-chip-${role.id}`;
    tab.setAttribute('role', 'tab');
    tab.setAttribute('aria-controls', `agent-panel-${role.id}`);
    tab.append(el('strong', {}, role.label), el('span', { className: 'agent-chip-type' }, role.type), status, count);
    tab.addEventListener('keydown', event => {
      if (!['ArrowLeft', 'ArrowRight', 'Home', 'End'].includes(event.key)) return;
      event.preventDefault();
      const index = AGENT_ROLES.findIndex(item => item.id === role.id);
      const next = event.key === 'Home' ? 0 : event.key === 'End' ? AGENT_ROLES.length - 1
        : (index + (event.key === 'ArrowRight' ? 1 : -1) + AGENT_ROLES.length) % AGENT_ROLES.length;
      choose(AGENT_ROLES[next].id);
      chips.get(AGENT_ROLES[next].id).button.focus();
    });
    const slot = el('section', { id: `agent-panel-${role.id}`, role: 'tabpanel',
      'aria-labelledby': tab.id, hidden: true, className: 'agent-panel' });
    chips.set(role.id, { button: tab, status, count });
    slots.set(role.id, slot); tabs.append(tab); views.append(slot);
  }
  async function configuration() {
    descriptor ??= api('agents', {}, { signal: lifetime.signal }).catch(error => {
      descriptor = null;
      throw error;
    });
    return descriptor;
  }
  async function ensureController(id) {
    if (controllers.has(id)) return controllers.get(id);
    if (creating.has(id)) return creating.get(id);
    const slot = slots.get(id);
    slot.replaceChildren(el('p', { role: 'status' }, 'Connecting this agent...'));
    const promise = (async () => {
      let candidate;
      try {
        const config = await configuration();
        if (disposed) return;
        const controller = await loaders[id](host, {
          signal: lifetime.signal, active: active && selected === id, storage,
          provider: id, bridgeURL: config.operatorBridge.origin,
          route: { params: new URLSearchParams(id === 'teacher' && typeof observations.get(id)?.conversationId === 'string'
            ? { conversation: observations.get(id).conversationId } : {}) },
          onStateChange: value => report(id, value),
          onConversationChange: value => report(id, {
            ...controllers.get(id)?.getState(), conversationId: value.id,
          }),
        });
        candidate = controller;
        if (disposed) { controller.destroy(); return; }
        slot.replaceChildren(controller.element);
        if (active && selected === id) controller.activate();
        else controller.deactivate();
        report(id, controller.getState());
        controllers.set(id, controller);
        return controller;
      } catch (error) {
        if (disposed) return;
        let message = error.message;
        if (candidate) {
          try { candidate.destroy(); }
          catch (cleanupError) { message += ` Controller cleanup failed: ${cleanupError.message}`; }
        }
        report(id, { status: 'connection error', error: message });
        slot.replaceChildren(el('div', { className: 'error-panel', role: 'alert' },
          el('h2', {}, `${AGENT_ROLES.find(role => role.id === id).label} could not connect`),
          el('p', {}, message),
          el('p', {}, 'No conversation, command or model request was started. Reconnect only reads state.'),
          button('Reconnect', () => ensureController(id))));
      } finally { creating.delete(id); }
    })();
    creating.set(id, promise);
    return promise;
  }
  function choose(value, updateLocation = true) {
    if (disposed) return;
    selected = agentKey(value);
    for (const role of AGENT_ROLES) {
      const isSelected = selected === role.id;
      const chip = chips.get(role.id);
      chip.button.setAttribute('aria-selected', String(isSelected));
      chip.button.tabIndex = isSelected ? 0 : -1;
      slots.get(role.id).hidden = !isSelected;
      const controller = controllers.get(role.id);
      if (controller) {
        if (isSelected && active) controller.activate(); else controller.deactivate();
        report(role.id, controller.getState());
      }
    }
    persist();
    if (updateLocation && active) history.replaceState(null, '', `#/agents?agent=${selected}`);
    if (active) void ensureController(selected);
  }
  const visibility = () => {
    if (active && !document.hidden && controllers.has(selected)) report(selected, controllers.get(selected).getState());
  };
  document.addEventListener('visibilitychange', visibility);
  choose(selected, false);
  return {
    element: panel,
    activate(route = { params: new URLSearchParams() }) {
      active = true;
      choose(route.params.get('agent') ?? selected, false);
    },
    deactivate() {
      active = false;
      for (const controller of controllers.values()) controller.deactivate();
    },
    getState: () => ({ active, selected, agents: Object.fromEntries(observations) }),
    hasActiveWork: () => [...controllers].some(([id, controller]) => {
      const state = controller.getState();
      return state?.pending || id !== 'cyc' && ['running', 'busy', 'awaiting_permission'].includes(state?.status);
    }),
    destroy() {
      disposed = true; lifetime.abort();
      document.removeEventListener('visibilitychange', visibility);
      for (const controller of controllers.values()) controller.destroy();
      panel.remove();
    },
  };
}
