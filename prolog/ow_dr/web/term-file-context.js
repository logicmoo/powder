import { routeHref } from './render.js';

export function occurrenceFileHref(term, scope, source, facet = 'semantic') {
  return routeHref('definitions', { term, scope, source, facet });
}

export function createTermFileContext(host, { term, route, signal }) {
  const { element: el, api, file, link, button } = host;
  const root = el('section', { className: 'classic-index-section term-file-context',
    'aria-label': 'Indexed files containing the selected term' },
  el('h3', {}, 'Indexed file occurrences'));
  const note = el('p', { className: 'muted', role: 'status' }, 'Reading catalog file membership…');
  root.append(note);
  const groups = new Map();
  let revision, generation, epoch = 0;
  for (const [scope, title] of [['unloaded', 'UNLOADED occurrences'], ['loaded', 'Loaded occurrences'], ['all', 'All indexed scope']]) {
    const summary = el('summary', {}, `${title} (loading count)`);
    const body = el('div', {});
    const details = el('details', { className: 'classic-index-branch',
      open: scope === (route.params.get('scope') || 'unloaded') }, summary, body);
    const group = { scope, title, summary, body, details, loaded: false, loading: false,
      offset: Number(route.params.get(`filesOffset_${scope}`)) || 0, serial: 0 };
    groups.set(scope, group);
    details.addEventListener('toggle', () => { if (details.open && !group.loaded) refresh(group); });
    root.append(details);
  }

  function updateCounts(data) {
    revision = data.revision;
    generation = data.generation;
    for (const [scope, group] of groups) {
      const count = data.counts?.[scope];
      group.summary.textContent = `${group.title} (${Number.isSafeInteger(count) ? count : 'unknown'} files)`;
    }
    const c = data.coverage;
    note.textContent = `${c?.freshFiles ?? '?'} / ${c?.expectedFiles ?? '?'} source indexes in this snapshot${c?.complete ? '' : ' · coverage incomplete'}. ` +
      'Browsing does not load a source. Source identity is checked when sentences are opened.';
    root.dataset.catalogRevision = revision;
    root.dataset.generation = String(generation);
  }

  async function refresh(group) {
    if (signal.aborted || group.loading) return;
    group.loading = true;
    const serial = ++group.serial, current = epoch;
    group.body.setAttribute('aria-busy', 'true');
    try {
      const data = await api('catalog/files', { term, scope: group.scope, facet: 'semantic',
        offset: group.offset, limit: 20 }, { signal });
      if (signal.aborted || current !== epoch || serial !== group.serial) return;
      updateCounts(data);
      const rows = data.items.map(item => {
        const href = occurrenceFileHref(term, group.scope, item.source);
        const row = el('li', {}, file(item, href),
          el('p', { className: 'muted' },
            `${item.loaded ? 'Loaded' : 'Unloaded'} · ${item.matchingAssertions} distinct assertions · ${item.semanticOccurrences} semantic positions · ` +
            `${item.definitionAssertions} definition/declaration assertions`),
          el('p', { className: 'muted' }, 'Indexed snapshot; executable availability not inferred.'));
        if (item.definitionAssertions > 0) row.append(link('Definitions/declarations', 'definitions',
          { term, scope: group.scope, source: item.source, facet: 'definition' }, 'text-button'));
        row.append(link('Review / Add provider to SourcePack', 'packs', { root: item.source }, 'text-button'));
        return row;
      });
      const contents = [
        link(`Browse all ${group.scope} occurrences`, 'definitions',
          { term, scope: group.scope, facet: 'semantic' }, 'text-button'),
        rows.length ? el('ul', { className: 'context-file-rows' }, rows)
          : el('p', { className: 'muted' }, data.coverage?.complete
            ? 'No matching files in this indexed scope.' : 'No indexed matches yet; incomplete coverage is not proven absence.'),
      ];
      const move = offset => {
        group.offset = offset;
        const params = Object.fromEntries(new URLSearchParams(location.hash.split('?')[1] || ''));
        params[`filesOffset_${group.scope}`] = offset;
        history.replaceState(null, '', routeHref(location.hash.replace(/^#\//u, '').split('?')[0], params));
        group.loaded = false;
        refresh(group);
      };
      const previous = button('Previous files', () => move(Math.max(0, group.offset - 20)), 'text-button');
      previous.disabled = group.offset === 0;
      const next = button('Next files', () => move(group.offset + 20), 'text-button');
      next.disabled = group.offset + data.items.length >= data.total;
      if (data.total > 20 || group.offset) contents.push(el('nav', { 'aria-label': `${group.title} file pages` },
        previous, `${data.total ? group.offset + 1 : 0}–${Math.min(group.offset + data.items.length, data.total)} of ${data.total}`, next));
      group.body.replaceChildren(...contents);
      group.loaded = true;
    } catch (error) {
      if (error.name === 'AbortError' || signal.aborted || current !== epoch) return;
      group.body.replaceChildren(el('p', { role: 'alert', className: 'statistics-error' },
        `File membership unavailable: ${error.message}`),
      button('Retry indexed files', () => refresh(group), 'text-button'));
      note.textContent = 'Catalog membership could not be read; this is not a zero-match result.';
    } finally {
      if (serial === group.serial && current === epoch) {
        group.loading = false;
        group.body.setAttribute('aria-busy', 'false');
      }
    }
  }

  const refreshActive = () => {
    epoch++;
    for (const group of groups.values()) {
      group.loaded = false;
      group.loading = false;
      group.offset = 0;
      if (group.details.open) refresh(group);
    }
  };
  window.addEventListener('powder-generation-change', refreshActive, { signal });
  for (const group of groups.values()) if (group.details.open) refresh(group);
  return root;
}
