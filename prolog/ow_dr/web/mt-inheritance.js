export function loadedMTTree({ api, element: el, link, mtLink, sourceLink }, signal, initial) {
  const body = el('div');
  const panel = el('details', { className: 'loaded-mt-tree' },
    el('summary', {}, 'Loaded microtheory dependency / inheritance tree'), body);
  let loaded = false;
  panel.addEventListener('toggle', async () => {
    if (!panel.open || loaded) return;
    loaded = true; body.textContent = 'Reading loaded genlMt evidence…';
    try {
      const graph = await api('microtheories/inheritance', {}, { signal });
      if (signal.aborted) return;
      const nodes = new Map(graph.nodes.map(node => [node.key, node]));
      const edges = new Map(graph.edges.map(edge => [JSON.stringify([edge.parent, edge.child]), edge]));
      let rendered = 0;
      const tree = el('ul');
      const build = (key, ancestors = [], parent = null) => {
        const node = nodes.get(key);
        if (!node) return el('li', {}, 'Unavailable microtheory reference');
        const row = el('li', {}, mtLink(key, node.expression),
          el('span', { className: 'muted' }, ` · ${node.assertionCount} context assertions${node.referencedOnly ? ' · referenced only' : ''}`));
        if (ancestors.includes(key)) { row.append(el('span', { className: 'muted' }, ' · cycle (already on this branch)')); return row; }
        if (ancestors.length >= 12 || rendered++ >= 250) { row.append(el('span', { className: 'muted' }, ' · expansion bound; open this MT as a new root')); return row; }
        const edge = parent ? edges.get(JSON.stringify([parent, key])) : null;
        if (edge) row.append(el('details', {}, el('summary', {}, `genlMt evidence (${edge.evidenceCount})`),
          el('ul', {}, edge.evidence.slice(0, 25).map(evidence => el('li', {},
            link(evidence.assertionId, 'assertion', { id: evidence.assertionId }), ' ',
            sourceLink(evidence.source, evidence.line, evidence.source))))));
        if (node.fileRefs?.length) row.append(el('details', {}, el('summary', {}, `Content files (${node.fileRefs.length})`),
          el('ul', {}, node.fileRefs.map(file => el('li', {}, sourceLink(file.source, file.firstLine ?? 1, file.source))))));
        if (node.inheritedBy.length) {
          const childList = el('ul');
          const children = el('details', {}, el('summary', {}, `Specializations / children (${node.inheritedBy.length})`), childList);
          let shown = false;
          children.addEventListener('toggle', () => {
            if (!children.open || shown) return;
            shown = true;
            childList.append(...node.inheritedBy.map(child => build(child, [...ancestors, key], key)));
          });
          row.append(children);
        }
        if (node.inheritsFrom.length) row.append(el('div', { className: 'muted' }, 'Inherits from: ',
          node.inheritsFrom.map(parentKey => mtLink(parentKey, nodes.get(parentKey)?.expression))));
        return row;
      };
      const draw = roots => { rendered = 0; tree.replaceChildren(...roots.map(key => build(key))); };
      const picker = el('select', { 'aria-label': 'Inheritance tree root', onchange: () => draw(picker.value ? [picker.value] : graph.entrypoints) },
        el('option', { value: '' }, 'All graph roots (including cyclic components)'),
        graph.nodes.map(node => el('option', { value: node.key, selected: node.key === initial }, node.label)));
      body.replaceChildren(el('p', { className: 'muted' }, `Generation ${graph.generation}. Parents precede children. Only positive ground loaded genlMt facts create edges; this does not enable runtime inheritance. Recorded corpus inventories remain a separate view.`), picker, tree);
      draw(initial && nodes.has(initial) ? [initial] : graph.entrypoints);
    } catch (error) {
      loaded = false;
      if (error.name !== 'AbortError') body.replaceChildren(el('p', { role: 'alert', className: 'statistics-error' }, error.message));
    }
  });
  return panel;
}
