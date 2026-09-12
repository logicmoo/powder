export async function renderTaskPools(host, route, signal) {
  const { api, element: el, button, link, heading, sourceLink } = host;
  const panel = el('div', {}, heading('Task pools', 'Shared file indexing/loading and independent reasoning/KB-question workers. Configuration changes never reset the KB.'));
  const profiles = el('section'), tasks = el('section'), external = el('section'),
    feedback = el('p', { role: 'status', 'aria-live': 'polite' });
  const controls = new Map();
  let latest, sequence = 0, saving = false, dirty = false, timer;
  panel.append(profiles, feedback, external, tasks);
  const alive = () => !signal.aborted;
  async function mutate(path, body) {
    if (saving) return;
    saving = true; sequence++;
    for (const row of controls.values()) for (const input of Object.values(row)) input.disabled = true;
    try {
      latest = await api(path, {}, { method: 'POST', body, signal });
      dirty = false; drawProfiles(latest, true);
      feedback.textContent = path.endsWith('/save') ? 'Desired profiles saved. Use Apply live for the running file/inference pools; HTTP remains restart-only.' : 'Running pool state updated.';
    } catch (error) {
      feedback.textContent = `Not applied: ${error.message}. Your entered values are preserved.`;
    } finally {
      saving = false;
      for (const row of controls.values()) for (const input of Object.values(row)) input.disabled = false;
    }
  }
  function drawProfiles(data, force = false) {
    if (!controls.size) {
      profiles.append(el('h2', {}, 'Desired and effective profiles'));
      for (const item of data.items) {
        const group = el('fieldset', { className: 'pool-profile', 'data-pool': item.pool },
          el('legend', {}, item.pool === 'file' ? 'File index / load' : item.pool === 'inference' ? 'Reasoning / KB test questions' : 'HTTP listeners'));
        const row = {};
        for (const [key, label] of [['start', 'Initial workers'], ['max', 'Maximum workers'], ['spare', 'Spare workers'], ['queueCapacity', 'Queue capacity']]) {
          if (key === 'queueCapacity' && item.pool === 'http') continue;
          row[key] = el('input', { type: 'number', min: key === 'spare' ? 0 : 1, max: key === 'queueCapacity' ? 1000 : 128, step: 1,
            name: `${item.pool}-${key}`, oninput: () => { dirty = true; } });
          group.append(el('label', { className: 'field' }, label, row[key]));
        }
        controls.set(item.pool, row);
        group.append(el('p', { className: 'pool-effective', 'data-effective': item.pool }));
        profiles.append(group);
      }
      profiles.append(el('div', { className: 'form-actions' },
        button('Save desired profiles', () => {
          const updates = Object.fromEntries([...controls].map(([pool, row]) =>
            [pool, Object.fromEntries(Object.entries(row).map(([key, input]) => [key, input.valueAsNumber]))]));
          mutate('pools/save', { updates, revision: latest.revision });
        }),
        button('Apply live profiles', () => mutate('pools/apply', { revision: latest.revision }), 'button secondary'),
        button('Start configured worker pools', () => mutate('pools/start', {}), 'button secondary')));
    }
    for (const item of data.items) {
      if (!dirty || force) for (const [key, input] of Object.entries(controls.get(item.pool))) input.value = item.desired[key] ?? '';
      const worker = item.workers;
      profiles.querySelector(`[data-effective="${item.pool}"]`).textContent = item.pool === 'http'
        ? `${item.state}. HTTP is not resized by Apply live; listener restart is required for supported HTTP changes.`
        : `${item.state}: ${worker ? `${worker.total} total / ${worker.busy} busy / ${worker.idle} idle; ${worker.queued} queued. Effective initial ${item.effective.start}, maximum ${item.effective.max}, spare ${item.effective.spare}, queue ${item.effective.queueCapacity}.` : 'No running workers.'}${item.needsApply ? ' Saved changes await Apply live.' : ''}`;
    }
  }
  async function refresh() {
    if (!alive()) return;
    if (document.hidden || saving) { timer = setTimeout(refresh, 3000); return; }
    const current = ++sequence;
    try {
      const [data, jobs, catalog] = await Promise.all([
        api('pools', {}, { signal }),
        api('tasks', { pool: route.params.get('pool') || 'all', state: route.params.get('state') || 'active', offset: route.offset, limit: Math.min(route.limit, 100) }, { signal }),
        api('catalog/status', {}, { signal }).catch(error => ({ unavailable: error.message })),
      ]);
      if (!alive() || current !== sequence) return;
      latest = data; drawProfiles(data);
      external.replaceChildren(el('h2', {}, 'External catalog indexer'),
        el('p', { className: 'muted' }, 'Separate SWI processes, not queued file-pool jobs. Live ownership is checked with a native process lock.'));
      if (catalog.unavailable) external.append(el('p', { className: 'statistics-error' }, `Status unavailable: ${catalog.unavailable}`));
      else for (const [phase, job] of [['catalog', catalog.progress], ['query', catalog.projectionProgress]]) {
        if (!job || job.state === 'not_started') continue;
        const age = Number.isFinite(job.heartbeatAge) ? `${Math.round(job.heartbeatAge)} seconds ago` : 'unknown';
        external.append(el('h3', {}, phase === 'catalog' ? 'Source occurrences' : 'Definition/query projection'),
          el('p', {}, `${job.state}; ${job.completed ?? 0}/${job.total ?? '?'} files; phase ${job.phase ?? 'unknown'}. ` +
            `${job.ownerLockHeld ? 'Owner lock held' : 'No live owner lock'}; PID ${job.ownerPid ?? 'unknown'}; last activity ${age}.`),
          job.path && el('p', {}, 'Last reported file: ', sourceLink(job.path, 1, job.path)),
          job.error && el('p', { className: 'statistics-error', role: 'alert' }, job.error.message),
          job.workerProgress?.length && el('ul', {}, job.workerProgress.map(worker => el('li', {},
            `PID ${worker.ownerPid ?? '?'} · ${worker.processState ?? 'unknown'} · ${worker.completed ?? 0}/${worker.total ?? '?'} · `,
            worker.path ? sourceLink(worker.path, 1, worker.path) : 'starting',
            worker.progressRead === 'stale' && el('span', { className: 'statistics-error' },
              ` · Stale progress observation: ${worker.progressReadError ?? 'awaiting a readable heartbeat'}`)))));
        if (job.cancelable) external.append(button('Cancel external indexer', async () => {
          try {
            await api('catalog/cancel', {}, { method: 'POST', body: { phase, runId: job.runId }, signal });
            feedback.textContent = 'Cancellation requested. Completed artifacts are retained; the current operation may need to finish.';
            refresh();
          } catch (error) { feedback.textContent = `Cancellation failed: ${error.message}`; }
        }, 'button secondary'));
      }
      tasks.replaceChildren(el('h2', {}, 'Task contents'),
        el('nav', { className: 'task-filters' },
          link('Active', 'tasks', { state: 'active' }), link('Completed history', 'tasks', { state: 'completed' }),
          link('File tasks', 'tasks', { pool: 'file' }), link('Reasoning tasks', 'tasks', { pool: 'inference' })),
        jobs.items.length ? el('table', { className: 'data-table' },
          el('thead', {}, el('tr', {}, ...['Task', 'Pool', 'State', 'Progress', 'Control'].map(text => el('th', {}, text)))),
          el('tbody', {}, jobs.items.map(job => el('tr', {},
            el('td', {}, link(job.label, 'task', { id: job.id }), el('div', { className: 'muted' }, job.id)),
            el('td', {}, job.pool), el('td', {}, job.state),
            el('td', {}, `${job.progress?.phase ?? ''} ${job.progress?.completedFiles ?? 0}/${job.progress?.totalFiles ?? job.fileCount} files`),
            el('td', {}, job.cancelable ? button('Cancel', async () => {
              try { await api('tasks/cancel', {}, { method: 'POST', body: { id: job.id }, signal }); refresh(); }
              catch (error) { feedback.textContent = error.message; }
            }, 'text-button') : 'Not cancelable')))))
          : el('p', { className: 'muted' }, 'No tasks in this selection.'),
        host.pagination(jobs, route));
      await host.refreshStatus?.();
    } catch (error) {
      if (error.name !== 'AbortError') feedback.textContent = `Refresh failed: ${error.message}. Last confirmed pool/task state remains displayed.`;
    } finally { if (alive()) { clearTimeout(timer); timer = setTimeout(refresh, 3000); } }
  }
  signal.addEventListener('abort', () => clearTimeout(timer), { once: true });
  await refresh();
  return panel;
}

export async function renderTaskDetail(host, route, signal) {
  const { api, element: el, heading, link, button, sourceLink } = host;
  const id = route.params.get('id');
  const data = await api('tasks/detail', { id, section: route.params.get('section') || 'files', offset: route.offset, limit: Math.min(route.limit, 100) }, { signal });
  const panel = el('div', {}, heading(data.task.label, `${data.task.pool} · ${data.task.state}`),
    link('All task pools', 'tasks'), host.propertyList([
      { name: 'Task', value: data.task }, { name: 'Outcome', value: data.outcome }, { name: 'Request', value: data.request },
    ]));
  panel.append(el('nav', { className: 'task-filters' }, ['files', 'progress', 'results'].map(section => link(section, 'task', { id, section }))),
    data.section === 'files' ? el('ul', {}, data.items.map(item => el('li', {}, sourceLink(item.path, 1, item.path))))
      : host.propertyList(data.items.map((value, index) => ({ name: `Item ${index + 1}`, value }))),
    host.pagination(data, route));
  if (data.task.cancelable) panel.append(button('Cancel task', async () => {
    await api('tasks/cancel', {}, { method: 'POST', body: { id }, signal });
    host.reload();
  }));
  return panel;
}
