const pendingOperation = value => ['running', 'cancelling'].includes(value.phase);
const pendingRun = value => ['starting', 'promoting'].includes(value.phase);
const number = value => new Intl.NumberFormat().format(Number(value) || 0);

function node(tag, text, attributes = {}) {
  const element = document.createElement(tag);
  if (text !== undefined) element.textContent = text;
  for (const [key, value] of Object.entries(attributes)) element.setAttribute(key, String(value));
  return element;
}

export function checkpointAddress(port, current = location.href) {
  if (!Number.isInteger(port) || port < 1 || port > 65535) return null;
  const url = new URL(current);
  if (!['localhost', '127.0.0.1'].includes(url.hostname)) return null;
  url.port = String(port);
  url.search = '';
  url.hash = '#/settings';
  return url.href;
}

export function renderCheckpointSettings({ api, signal, onChanged = () => {} }) {
  const style = new URL('./checkpoints.css', import.meta.url).href;
  if (![...document.querySelectorAll('link[rel="stylesheet"]')].some(link => link.href === style)) {
    document.head.append(node('link', undefined, { rel: 'stylesheet', href: style }));
  }
  const section = node('section', undefined, { class: 'checkpoint-settings', 'aria-label': 'Saved application states' });
  const notice = node('p', 'Loading saved application states…', { role: 'status', 'aria-live': 'polite' });
  const form = node('form', undefined, { class: 'checkpoint-create' });
  const name = node('input', undefined, { name: 'checkpoint-name', required: '', maxlength: 100, autocomplete: 'off' });
  const label = node('label', 'Snapshot name ');
  label.append(name);
  const create = node('button', 'Create saved state', { type: 'submit', class: 'button' });
  const refresh = node('button', 'Refresh', { type: 'button', class: 'button' });
  const cold = node('button', 'Use normal source startup next time', { type: 'button', class: 'button' });
  form.append(label, create, refresh, cold);
  const selection = node('p');
  const files = node('div');
  const operations = node('div', undefined, { 'aria-label': 'Checkpoint operations' });
  const runs = node('div', undefined, { 'aria-label': 'Checkpoint trials' });
  section.append(node('h2', 'Saved application states'),
    node('p', 'A saved state contains the loaded KB, native annotations, configuration and executable backend code. The next launch resumes that data without re-reading KB sources. Keep these files private.'),
    node('p', 'Create, select for next launch, and try are separate actions. A trial never takes over the original ports automatically. Its debug listener stays off until authorized takeover releases the original listener.'),
    notice, form, selection, files, operations, runs);
  let catalog, busy = false, timer, polling = false, stopped = false;
  let operationRows = [], runRows = [];
  const request = (path, params = {}, options = {}) => api(`checkpoint/${path}`, params, { ...options, signal });
  const post = (path, body) => request(path, {}, { method: 'POST', body });
  const alive = () => !stopped && !signal?.aborted;
  const say = (text, error = false) => {
    if (!alive()) return;
    notice.textContent = text;
    notice.setAttribute('role', error ? 'alert' : 'status');
  };
  function controls() {
    const active = operationRows.some(pendingOperation);
    const paused = catalog?.automation?.executionPaused === true;
    create.disabled = busy || !catalog || active || paused || catalog?.instance?.role === 'candidate';
    refresh.disabled = busy;
    cold.disabled = busy || !catalog || paused || catalog.selected === 'none' || catalog?.instance?.role === 'candidate';
  }
  async function action(work) {
    if (busy || !alive()) return;
    busy = true;
    controls();
    try { await work(); }
    catch (error) { if (alive()) say(error.message || 'Request failed. Refresh to inspect the current state.', true); }
    finally { busy = false; if (alive()) controls(); }
  }
  function button(text, work) {
    const item = node('button', text, { type: 'button', class: 'button' });
    item.addEventListener('click', () => action(work), { signal });
    return item;
  }
  function openPort(port, text) {
    const address = checkpointAddress(port);
    return address ? node('a', text, { href: address, target: '_blank', rel: 'noopener' }) : node('span', text);
  }
  function renderCatalog() {
    selection.textContent = catalog.automation?.executionPaused
      ? `${catalog.automation.reason} Existing saved states remain available for inspection. Normal configured source startup is unchanged.`
      : catalog.selected === 'none'
      ? 'Next launch: normal configured sources (no saved state selected).'
      : `Next launch: ${catalog.items.find(item => item.id === catalog.selected)?.name || catalog.selected}. Explicit CLI sources override this selection.`;
    files.replaceChildren();
    if (!catalog.items.length) files.append(node('p', 'No saved states yet. Create one from the currently loaded files; existing sources and caches are not replaced.'));
    for (const item of catalog.items) {
      const row = node('article', undefined, { class: 'checkpoint-image' });
      row.append(node('h3', item.name),
        node('p', `${item.selectedNextStart ? 'Selected for next launch · ' : ''}${number(item.counts.assertions)} assertions · ${number(item.files.length)} files · generation ${item.generation} · ${number(Math.ceil(item.sizeBytes / 1024))} KB`));
      const details = node('details');
      details.append(node('summary', 'Inspect saved state'));
      const detailsBody = node('div', undefined, { class: 'checkpoint-details' });
      const list = node('ul');
      for (const file of item.files) list.append(node('li', `${file.path} — ${number(file.count)} assertions`));
      detailsBody.append(node('p', `ID: ${item.id}`), node('p', `Created: ${new Date(item.createdAt * 1000).toLocaleString()}`),
        node('p', `SHA-256: ${item.stateHash}`), node('p', `Stored at: ${item.path}`), list);
      if (item.configuration?.settings?.startupConfigured) {
        const startup = node('ul');
        for (const path of item.configuration.settings.startupFiles) startup.append(node('li', path));
        detailsBody.append(node('h4', 'Captured startup selection'), startup);
      }
      if (item.configuration?.sourcePacks?.length) {
        const packs = node('ul');
        for (const pack of item.configuration.sourcePacks) {
          packs.append(node('li', `${pack.name} — roots: ${pack.roots.join(', ')}`));
        }
        detailsBody.append(node('h4', 'Captured SourcePacks'), packs);
      }
      const debug = item.checkpoint?.runtime?.debug;
      if (debug) detailsBody.append(node('p', debug.enabled
        ? `Captured debug listener: port ${debug.port}. Deferred during trial; takeover creates fresh credentials.`
        : 'Captured debug listener: off.'));
      details.append(detailsBody);
      row.append(details);
      const actions = node('div', undefined, { class: 'checkpoint-actions' });
      const select = button('Select for next launch', async () => {
        await post('select', { id: item.id, revision: catalog.revision });
        await load(); onChanged();
      });
      select.disabled = !item.available || item.selectedNextStart || catalog.automation?.executionPaused || catalog.instance?.role === 'candidate';
      const trial = button('Try in a new console', async () => {
        const operation = await post('try', { id: item.id, generation: catalog.generation });
        operationRows.push(operation); renderOperations(); schedule();
      });
      trial.disabled = !item.available || !catalog.instance || catalog.automation?.executionPaused || catalog.instance.role === 'candidate' || operationRows.some(pendingOperation);
      actions.append(select, trial);
      row.append(actions);
      if (!item.available) row.append(node('p', item.issue || 'Unavailable. Recreate this state with the current backend.', { role: 'note' }));
      files.append(row);
    }
  }
  function renderOperations() {
    operations.replaceChildren();
    for (const item of operationRows) {
      const row = node('p', `${item.action}: ${item.phase}. ${item.message} `,
        { 'data-operation-id': item.id });
      if (item.phase === 'running') row.append(button('Cancel operation', async () => {
        const updated = await post('cancel', { kind: 'operation', id: item.id });
        operationRows = operationRows.map(old => old.id === updated.id ? updated : old);
        renderOperations(); schedule();
      }));
      operations.append(row);
    }
    controls();
  }
  function renderRuns() {
    runs.replaceChildren();
    for (const item of runRows) {
      const row = node('article', undefined, { class: 'checkpoint-trial' });
      row.append(node('h3', `Trial: ${item.phase.replaceAll('_', ' ')}`), node('p', item.message));
      const debug = catalog?.items.find(image => image.id === item.checkpoint)?.checkpoint?.runtime?.debug;
      const debugPort = debug?.enabled && Number.isInteger(debug.port) && debug.port > 0 && debug.port <= 65535
        ? debug.port : null;
      if (debugPort && ['starting', 'trial_ready'].includes(item.phase)) row.append(node('p',
        `Debug port ${debugPort} is deferred. The original listener remains untouched until you authorize takeover.`));
      if (item.cleanup === 'deferred_empty_directory') row.append(node('p',
        'The candidate has stopped. Windows still holds its empty runtime directory; payload files have been removed.'));
      if (item.recovery) row.append(node('p', item.recovery, { role: 'alert' }));
      if (item.temporary && ['trial_ready', 'promoting', 'recovery_serving'].includes(item.phase)) row.append(openPort(item.temporary, `Open temporary port ${item.temporary}`));
      if (item.phase === 'promoted') row.append(openPort(item.primary, `Open replacement on port ${item.primary}`));
      if (['trial_ready', 'recovery_serving'].includes(item.phase)) {
        const ports = item.targets.map(target => target.port).join(', ');
        const consent = node('input', undefined, { type: 'checkbox' });
        const label = node('label', undefined, { class: 'checkpoint-consent' });
        label.append(consent, document.createTextNode(` I authorize takeover of original port(s) ${ports}${debugPort ? ` and debug port ${debugPort}` : ''}, fresh debug credentials if enabled, and retirement of this old instance after verification.`));
        const promote = button('Take over original ports', async () => {
          if (!consent.checked) return;
          const updated = await post('promote', { run: item.id, revision: item.revision, confirm: 'take-over-original-ports' });
          runRows = runRows.map(old => old.id === updated.id ? updated : old);
          renderRuns(); schedule();
        });
        promote.disabled = true;
        consent.addEventListener('change', () => { promote.disabled = !consent.checked; }, { signal });
        row.append(label, promote);
      }
      if (['starting', 'trial_ready', 'failed'].includes(item.phase)) {
        row.append(button('Close trial', async () => {
          const updated = await post('cancel', { kind: 'trial', id: item.id });
          runRows = runRows.map(old => old.id === updated.id ? updated : old); renderRuns();
        }));
      }
      runs.append(row);
    }
  }
  async function load() {
    const next = await request('catalog');
    if (!alive()) return;
    catalog = next; operationRows = next.operations; runRows = next.runs;
    renderCatalog(); renderOperations(); renderRuns();
    say(next.instance?.role === 'candidate'
      ? `Trial instance · generation ${next.generation}. Read-only until explicitly promoted from the original instance.`
      : `Current generation ${next.generation}. Save requires idle KB jobs and queries; busy work is never discarded.`);
    schedule();
  }
  function schedule() {
    clearTimeout(timer);
    if (alive() && (operationRows.some(pendingOperation) || runRows.some(pendingRun))) timer = setTimeout(poll, 1200);
  }
  async function poll() {
    if (!alive() || polling) return;
    if (document.hidden) { schedule(); return; }
    polling = true;
    try {
      let completed = false;
      for (const item of operationRows.filter(pendingOperation)) {
        const result = await request('status', { operation: item.id });
        operationRows = operationRows.map(old => old.id === result.id ? result : old);
        completed ||= !pendingOperation(result);
      }
      for (const item of runRows.filter(pendingRun)) {
        const result = await request('status', { run: item.id });
        runRows = runRows.map(old => old.id === result.id ? result : old);
      }
      if (!alive()) return;
      if (completed) { await load(); onChanged(); }
      else { renderOperations(); renderRuns(); }
    } catch (error) {
      say('Status temporarily unavailable. During takeover the original address reconnects to the replacement; Refresh checks the new instance.', true);
    } finally { polling = false; schedule(); }
  }
  form.addEventListener('submit', event => {
    event.preventDefault();
    action(async () => {
      if (!catalog || !name.value.trim()) return;
      const operation = await post('create', { name: name.value.trim(), generation: catalog.generation, revision: catalog.revision });
      operationRows.push(operation); renderOperations(); say('Creating and validating a real saved application image…'); schedule();
    });
  }, { signal });
  refresh.addEventListener('click', () => action(load), { signal });
  cold.addEventListener('click', () => action(async () => {
    await post('select', { id: 'none', revision: catalog.revision }); await load(); onChanged();
  }), { signal });
  signal?.addEventListener('abort', () => { stopped = true; clearTimeout(timer); }, { once: true });
  controls();
  action(load);
  return section;
}
