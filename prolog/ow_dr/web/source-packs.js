export function packRootPaths(text, { allowEmpty = false } = {}) {
  const paths = [...new Set(String(text).split(/\r?\n/u).map(line => line.trim().replaceAll('\\', '/')).filter(Boolean))].sort();
  if (!allowEmpty && !paths.length) throw new Error('Choose at least one concrete original source file.');
  if (paths.length > 1024) throw new Error('A source selection is limited to 1,024 files.');
  for (const path of paths) {
    if (path.length > 4096 || !path.startsWith('KBs/') || !/^KBs\/.+\.(?:kif|krf|meld|metta)$/iu.test(path)
      || path.split('/').some(part => !part || part === '.' || part === '..')) {
      throw new Error(`Not a concrete KBs original-file path: ${path}`);
    }
  }
  return paths;
}

export function packChoiceRows(choices) {
  return [...choices].sort(([a], [b]) => a.localeCompare(b))
    .map(([symbol, files]) => ({ symbol, files: [...new Set(files)].sort() }));
}

export function packLoadEnabled(pack, preview, dirty, busy) {
  return !!pack && pack.resolution?.ready === true && !preview && !dirty && !busy;
}

export async function sourcePacksPage(env, route, signal) {
  const { api, element: el, button, link, file, symbol, heading, errorPanel } = env;
  const id = route.params.get('id');
  let listing = await api('kb/packs', { offset: route.offset, limit: 25 }, { signal });
  const selected = id ? await api('kb/pack', { id }, { signal }) : null;
  let revision = selected?.revision ?? listing.revision, pack = selected?.pack ?? null;
  let preview = null, choices = new Map(), busy = false, message = '', failure = null, indexResult = null;
  let name = pack?.name ?? '', roots = (pack?.roots ?? env.draftFiles()).join('\n');
  let indexAcknowledged = false, resolutionInvalidated = false;
  const page = el('div', { className: 'source-packs' });
  const count = value => Number.isSafeInteger(value) && value >= 0 ? value.toLocaleString() : 'unknown';
  const resetChoices = () => { choices = new Map((pack?.choices ?? []).map(choice => [choice.symbol, [...choice.files]])); };
  const dirty = () => !!pack && (name !== pack.name || roots !== pack.roots.join('\n'));
  const locked = () => busy || env.isBusy();
  resetChoices();

  async function act(label, operation) {
    if (locked()) return;
    busy = true; env.setBusy(true); message = `${label}…`; failure = null; draw();
    try { await operation(); }
    catch (error) {
      failure = error; message = 'Request failed. Unsaved choices remain here; reload saved packs before retrying a revision conflict.';
      if (error.status === 409) await env.refreshStatus();
    } finally {
      busy = false; env.setBusy(false); draw();
    }
  }
  const post = (action, body) => api(`kb/packs/${action}`, {}, { method: 'POST', body });
  function control(label, operation, enabled = true, primary = false) {
    const node = button(label, () => act(label, operation), primary ? 'button' : 'button secondary');
    node.disabled = locked() || !enabled;
    node.dataset.packAction = label;
    return node;
  }
  function field(label, value, onInput, multiline = false) {
    const input = el(multiline ? 'textarea' : 'input', {
      value, rows: multiline ? 4 : null, type: multiline ? null : 'text', disabled: locked(),
      oninput: event => { onInput(event.target.value); updateEnabled(); },
    });
    return el('label', { className: 'field' }, el('span', {}, label), input);
  }
  function updateEnabled() {
    for (const node of page.querySelectorAll('[data-requires-saved-roots]')) node.disabled = locked() || dirty();
    const load = page.querySelector('[data-pack-load]');
    if (load) load.disabled = !packLoadEnabled(pack, preview, dirty(), locked() || resolutionInvalidated);
    for (const node of page.querySelectorAll('[data-index-action]')) node.disabled = locked() || !indexAcknowledged;
  }
  function pagedRows(items, title, render) {
    const section = el('section', { className: 'pack-subsection' }, el('h3', {}, `${title} (${count(items.length)})`));
    const list = el('ul', { className: 'pack-rows' }), navigation = el('div', { className: 'source-actions' });
    let offset = 0;
    function display() {
      list.replaceChildren(...items.slice(offset, offset + 25).map(render));
      const previous = button('Previous', () => { offset -= 25; display(); }, 'button secondary');
      const next = button('Next', () => { offset += 25; display(); }, 'button secondary');
      previous.disabled = offset === 0; next.disabled = offset + 25 >= items.length;
      navigation.replaceChildren(previous, el('span', { className: 'muted' },
        `${items.length ? offset + 1 : 0}–${Math.min(offset + 25, items.length)} of ${items.length}`), next);
      navigation.hidden = items.length <= 25;
      env.refreshFiles();
    }
    display(); section.append(list, navigation); return section;
  }
  function membersView(members) {
    function support(why) {
      const row = el('li', {}, symbol(why.symbol),
        el('span', { className: 'muted' }, why.kind === 'declared' ? 'Declared-only support; not a rule definition' : 'Rule-defined support'));
      if (why.evidence?.length) row.append(el('details', {}, el('summary', {}, 'Evidence samples'),
        el('ul', {}, why.evidence.slice(0, 12).map(evidence => el('li', {},
          evidence.sourceFile && file(evidence.sourceFile),
          el('span', { className: 'muted' }, [evidence.id, evidence.line ? `line ${evidence.line}` : null].filter(Boolean).join(' · ')))))));
      return row;
    }
    return pagedRows(members, 'Composition files', member => {
      const row = el('li', {}, file(member.path),
        el('span', { className: 'badge' }, member.role === 'root' ? 'Named root' : 'Dependency'));
      if (member.why?.length) row.append(el('details', {}, el('summary', {}, `Why included (${member.why.length})`),
        pagedRows(member.why, 'Recorded support', support)));
      return row;
    });
  }
  function updateListedPack() {
    listing.packs = listing.packs.map(item => item.id === pack.id
      ? { id: pack.id, name: pack.name, rootCount: pack.roots.length, memberCount: pack.members.length,
        ready: pack.resolution.ready, state: pack.resolution.state } : item);
  }
  async function resolve() {
    preview = await post('resolve', { id: pack.id, revision, choices: packChoiceRows(choices) });
    choices = new Map((preview.pack.choices ?? []).map(choice => [choice.symbol, [...choice.files]]));
    message = preview.ready ? 'Preview ready. Review and save the composition before loading.' : 'Preview needs explicit decisions. Nothing was saved or loaded.';
  }
  function unresolvedRow(issue) {
    const row = el('li', {}, el('p', {}, issue.symbol ? symbol(issue.symbol) : 'Source coverage',
      ' · ', String(issue.reason ?? 'unknown').replaceAll('_', ' ')), issue.path && file(issue.path));
    if (!issue.symbol) return row;
    let selectedFiles = new Set(choices.get(issue.symbol) ?? []);
    let manual = '';
    const candidates = Array.isArray(issue.candidates) ? issue.candidates : [];
    row.append(el('p', { className: 'muted' }, candidates.length
      ? 'Known candidates are not automatically selected. Incomplete discovery cannot establish uniqueness.'
      : 'No known candidate is recorded. You may explicitly name provider files; resolution will verify their recorded support.'));
    if (selectedFiles.size) row.append(pagedRows([...selectedFiles], 'Current explicit selection', path => el('li', {}, file(path))));
    row.append(pagedRows(candidates, 'Known provider candidates', candidate => {
      const checkbox = el('input', { type: 'checkbox', checked: selectedFiles.has(candidate.path), disabled: locked(),
        'aria-label': `Choose ${candidate.path} for ${issue.symbol}`,
        onchange: event => {
          if (event.target.checked) selectedFiles.add(candidate.path); else selectedFiles.delete(candidate.path);
          choices.set(issue.symbol, [...selectedFiles]);
        } });
      return el('li', {}, el('div', { className: 'pack-candidate' }, checkbox, file(candidate.path)),
        el('span', { className: 'muted' }, candidate.kind === 'declared' ? 'Declaration only' : 'Rule-defined'));
    }));
    row.append(field(`Additional provider paths for ${issue.symbol} (one per line)`, manual, value => { manual = value; }, true),
      el('div', { className: 'source-actions' },
        control('Use chosen providers and resolve', async () => {
          for (const path of packRootPaths(manual, { allowEmpty: true })) selectedFiles.add(path);
          choices.set(issue.symbol, [...selectedFiles]); await resolve();
        }),
        control('Decline providers for this symbol', async () => { choices.set(issue.symbol, []); await resolve(); })));
    return row;
  }
  function resolutionView() {
    const coverage = preview?.coverage ?? pack.resolution?.coverage;
    const node = el('section', { className: 'pack-section' }, el('h2', {}, preview ? 'Unsaved resolution preview' : 'Saved composition'),
      el('p', {}, preview ? (preview.ready ? 'Ready to save' : 'Unresolved') : String(pack.resolution?.state ?? 'draft')));
    if (coverage) node.append(el('p', { className: 'muted' },
      `Provider discovery: ${coverage.globalProviders?.complete === true ? 'complete for its recorded index identity' : 'incomplete or unavailable'}. `
      + 'Source freshness is verified at load. MT dependencies are shown separately and are never auto-loaded.'));
    if (preview) {
      const save = control('Save composition', async () => {
        const saved = await post('save', { pack: preview.pack, revision });
        pack = saved.pack; revision = saved.revision; preview = null; resolutionInvalidated = false; resetChoices(); updateListedPack();
        message = 'Composition saved. Loading is a separate explicit action.';
      }, !dirty(), true);
      save.dataset.requiresSavedRoots = '';
      node.append(save, control('Discard preview', async () => {
        preview = null; resetChoices(); message = 'Preview discarded. Saved pack and active KB are unchanged.';
      }));
      if (preview.unresolved?.length) node.append(pagedRows(preview.unresolved, 'Unresolved decisions', unresolvedRow));
      if (preview.changes?.length) node.append(pagedRows(preview.changes, 'Changed member snapshots',
        change => el('li', {}, file(change.path), el('span', { className: 'muted' }, String(change.reason).replaceAll('_', ' ')))));
      node.append(pagedRows(preview.microtheoryDependencies ?? [], 'Separate MT dependencies', item => el('li', {}, file(item.path),
        el('p', { className: 'muted' }, item.outbound === null ? 'MT reference coverage is unknown.' : `${count(item.outbound?.length)} recorded outbound MTs; not automatically loaded.`),
        Array.isArray(item.outbound) && item.outbound.length > 0 && el('details', {}, el('summary', {}, 'Referenced contexts'),
          pagedRows(item.outbound, 'MT references', mt => el('li', {}, env.mt(mt.key)))))));
    }
    const members = preview?.pack.members ?? pack.members ?? [];
    if (members.length) node.append(membersView(members));
    else node.append(el('p', { className: 'muted' }, 'No saved composition yet. Resolve the named roots to inspect dependencies.'));
    return node;
  }
  function draw() {
    if (signal.aborted) return;
    page.replaceChildren(heading('Source Packs', 'Named, explicit source compositions. Opening this page does not index, compile, save or load anything.',
      link('KB Sources', 'sources', {}, 'button secondary')));
    if (message) page.append(el('p', { className: 'pack-feedback', role: 'status' }, message));
    if (failure) page.append(errorPanel(failure, () => env.reload()));
    page.append(el('section', { className: 'pack-section' }, el('h2', {}, 'Saved packs'),
      listing.packs.length ? el('ul', { className: 'pack-rows' }, listing.packs.map(item => el('li', {},
        link(item.name, 'packs', { id: item.id }), el('span', { className: 'muted' },
          `· ${count(item.rootCount)} ${item.rootCount === 1 ? 'root' : 'roots'} · ${count(item.memberCount)} ${item.memberCount === 1 ? 'member' : 'members'} · ${item.state}`))))
        : el('p', { className: 'muted' }, 'No source packs have been saved.'),
      el('div', { className: 'source-actions' },
        listing.offset > 0 && link('Previous packs', 'packs', { offset: Math.max(0, listing.offset - 25) }, 'button secondary'),
        listing.offset + 25 < listing.total && link('Next packs', 'packs', { offset: listing.offset + 25 }, 'button secondary'),
        link('New pack', 'packs', {}, 'button secondary'))));
    const editor = el('section', { className: 'pack-section' }, el('h2', {}, pack ? 'Named roots' : 'Create a named pack'),
      field('Pack name', name, value => { name = value; }),
      field('Original root files under KBs (one per line)', roots, value => { roots = value; }, true),
      el('p', { className: 'muted' }, 'Use concrete files, not directories. Saving roots clears the prior composition and provider choices; it does not change loaded sources.'),
      control('Use KB Sources draft', async () => { roots = env.draftFiles().join('\n'); message = 'Copied the draft concrete file selection. Nothing was saved.'; }, env.draftFiles().length > 0),
      control(pack ? 'Save name and roots' : 'Create named pack', async () => {
        const selectedRoots = packRootPaths(roots);
        if (!name.trim()) throw new Error('Give the pack a name.');
        const saved = pack
          ? await post('save', { revision, pack: { ...pack, name: name.trim(), roots: selectedRoots, choices: [], members: [],
            resolution: { ready: false, state: 'draft' } } })
          : await post('create', { name: name.trim(), roots: selectedRoots, revision });
        pack = saved.pack; revision = saved.revision; name = pack.name; roots = pack.roots.join('\n');
        preview = null; resolutionInvalidated = false; resetChoices(); message = 'Named roots saved. Resolve to preview dependencies.';
        listing = await api('kb/packs', { offset: 0, limit: 25 });
        if (!signal.aborted) env.rememberId(pack.id);
      }, true, true));
    page.append(editor);
    if (pack) {
      page.append(pagedRows(pack.roots, 'Saved root files', path => el('li', {}, file(path))));
      const resolveButton = control('Resolve dependencies', resolve, !dirty(), true);
      resolveButton.dataset.requiresSavedRoots = '';
      const load = control('Load saved pack additively', async () => {
        const result = await post('load', { id: pack.id, revision, generation: env.generation() });
        env.loaded(result.status);
        message = 'Saved pack loaded from verified caches. Unrelated active files were retained; no sources were compiled.';
      }, packLoadEnabled(pack, preview, dirty(), locked() || resolutionInvalidated));
      load.dataset.packLoad = '';
      page.append(el('div', { className: 'source-actions' }, resolveButton, load),
        el('p', { className: 'muted' }, 'Resolve uses saved roots. Loading requires a saved ready composition and matching source/cache bytes.'), resolutionView());
    }
    const index = el('details', { className: 'pack-section' }, el('summary', {}, 'Provider discovery index — explicit operation'),
      el('p', { className: 'muted' }, 'Replaces the saved provider index using existing caches and source-byte hashes. It never compiles or loads. All-source indexing can be expensive and is limited to 120 seconds; subset coverage cannot justify automatic global uniqueness.'),
      el('label', { className: 'pack-candidate' }, el('input', { type: 'checkbox', checked: indexAcknowledged, disabled: locked(),
        onchange: event => { indexAcknowledged = event.target.checked; updateEnabled(); } }), 'I want to refresh the persisted provider discovery index'));
    for (const [label, selection] of [['Index all KB Sources', 'all'], ...(pack ? [['Index named roots only', pack.roots]] : [])]) {
      const refresh = control(label, async () => {
        indexResult = await post('providers/refresh', { selection });
        preview = null; resolutionInvalidated = true; resetChoices();
        message = `Provider index refreshed: ${count(indexResult.sources)} sources; ${indexResult.coverage?.complete ? 'complete' : 'partial'} coverage. Resolve again before saving or loading.`;
      }, indexAcknowledged);
      refresh.dataset.indexAction = ''; index.append(refresh);
    }
    if (indexResult) index.append(el('p', { className: 'muted' },
      `${count(indexResult.providers)} recorded provider entries; ${indexResult.coverage?.complete ? 'complete' : 'incomplete'} coverage.`));
    page.append(index);
    page.setAttribute('aria-busy', String(busy));
    updateEnabled(); env.refreshFiles();
  }
  draw();
  return page;
}
