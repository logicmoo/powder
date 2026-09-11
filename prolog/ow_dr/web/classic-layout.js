import { contextLabel, expressionText, routeHref, symbolLabel } from './render.js';
import { createClassicToggle } from './presentation.js';

const coverageLabels = {
  complete: 'Complete index for this context',
  page: 'Current page only · not a complete KB index',
  partial: 'Partial index · additional entries may exist',
  unavailable: 'Context index is unavailable',
};
const safeHash = value => typeof value === 'string' && /^#(?:\/[^\s]*|[A-Za-z][\w:.-]*)$/u.test(value) ? value : null;
const boundedSplit = value => Math.max(20, Math.min(50, value));

/**
 * Adapt kb_term_navigation's actual counts. Section keys are not guessed here:
 * the backend supplies every section (including known zero-count sections).
 * Each hierarchy link starts with the complete term and exactly its own filters.
 */
export function termContextModel({
  term, expression, label, nav = {}, filters = {}, coverage = nav?.coverage,
  shown = nav?.shown, total = nav?.total, onViewpointFilters,
} = {}) {
  nav = nav && typeof nav === 'object' ? nav : {};
  filters = filters && typeof filters === 'object' ? filters : {};
  const href = values => routeHref('term', { term, ...values });
  const positionMatches = position => String(filters.arg ?? '') === String(position);
  const sections = (Array.isArray(nav.sections) ? nav.sections : []).map(section => ({
    label: section.label ?? String(section.key ?? ''),
    count: section.count,
    href: href({ section: section.key }),
    selected: filters.section === section.key && !filters.arg && !filters.predicate && !filters.mt,
  }));
  const arguments_ = (Array.isArray(nav.arguments) ? nav.arguments : [])
    .filter(argument => Number.isSafeInteger(argument.position) && argument.position > 0)
    .map(argument => ({
      label: `Arg ${argument.position}`,
      count: argument.count,
      href: href({ arg: argument.position }),
      selected: positionMatches(argument.position) && !filters.predicate && !filters.mt,
      expandable: true,
      expanded: positionMatches(argument.position) || (!filters.arg && argument.position === 1),
      children: (Array.isArray(argument.predicates) ? argument.predicates : []).map(predicate => ({
        label: symbolLabel(predicate.term),
        term: predicate.term,
        count: predicate.count,
        href: href({ arg: argument.position, predicate: predicate.term }),
        selected: positionMatches(argument.position) && filters.predicate === predicate.term && !filters.mt,
        expandable: true,
        expanded: positionMatches(argument.position) && filters.predicate === predicate.term,
        children: (Array.isArray(predicate.microtheories) ? predicate.microtheories : []).map(mt => ({
          label: contextLabel(mt.mt, mt.mtExpression),
          mt: mt.mt, mtExpression: mt.mtExpression, count: mt.count,
          href: href({ arg: argument.position, predicate: predicate.term, mt: mt.mt }),
          selected: positionMatches(argument.position) && filters.predicate === predicate.term && filters.mt === mt.mt,
        })),
      })),
    }));
  return {
    title: 'Index',
    current: {
      term,
      label: label ?? (expression ? expressionText(expression, { pretty: false })
        : typeof term === 'string' && term.startsWith('nat:') ? 'Non-atomic term' : symbolLabel(term)),
    },
    coverage: coverage === 'loaded_term_assertions' ? 'complete'
      : Object.hasOwn(coverageLabels, coverage) ? coverage : 'page',
    shown, total,
    description: typeof nav.description === 'string' ? nav.description : undefined,
    sections: [
      { title: '', items: [{
        label: 'Viewpoint Filters',
        href: href({}),
        ...(typeof onViewpointFilters === 'function' ? { onSelect: onViewpointFilters } : {}),
      }] },
      { title: '', items: sections },
      { title: '', items: arguments_ },
    ],
  };
}

/**
 * Install once around the EXISTING main content node, leaving global navigation
 * where it is. Toggling and resizing never calls a router or replaces content.
 * Context: {title, coverage:'page'|'complete'|'partial'|'unavailable', shown?,
 * total?, description?, sections:[{title,items:[{label,count,term,expression,
 * mt,mtExpression,id,href,selected,onSelect,expandable,expanded,children}]}]}.
 * Counts are API-supplied. setTermContext accepts termContextModel's options.
 */
export function createClassicLayout({
  content, presentation, header, status, context,
  document: doc = content?.ownerDocument ?? globalThis.document,
  window: win = doc?.defaultView ?? globalThis.window,
  mtLink,
} = {}) {
  if (!content?.parentNode || !presentation) throw new TypeError('Classic layout requires mounted content and a presentation store.');
  const make = (tag, className, text) => {
    const node = doc.createElement(tag);
    if (className) node.className = className;
    if (text !== undefined) node.textContent = text;
    return node;
  };
  const originalClass = content.classList.contains('classic-content');
  const frame = make('div', 'classic-workspace');
  const index = make('aside', 'classic-context-index');
  index.id = `${content.id || 'content'}-classic-index`;
  index.setAttribute('aria-label', 'Contextual term and assertion index');
  const divider = make('div', 'classic-divider');
  divider.tabIndex = 0;
  divider.setAttribute('role', 'separator');
  divider.setAttribute('aria-orientation', 'vertical');
  divider.setAttribute('aria-label', 'Resize contextual index');
  divider.setAttribute('aria-valuemin', '20');
  divider.setAttribute('aria-valuemax', '50');
  divider.setAttribute('aria-controls', [index.id, content.id].filter(Boolean).join(' '));
  divider.title = 'Drag, or use Left/Right arrows. Home: 20%; End: 50%.';
  const parent = content.parentNode;
  parent.insertBefore(frame, content);
  frame.append(index, divider, content);
  content.classList.add('classic-content');
  const footer = status ?? make('div', 'classic-status');
  const ownsFooter = !status;
  const originalStatusClass = footer.classList.contains('classic-status');
  footer.classList.add('classic-status');
  if (ownsFooter) {
    footer.setAttribute('role', 'status');
    frame.after(footer);
  }
  const toggle = header ? createClassicToggle(presentation, { document: doc }) : null;
  if (toggle) header.append(toggle);
  let current = { coverage: 'unavailable', title: 'Context index', sections: [] };
  let dragging = null;
  let destroyed = false;
  let visible = false;
  let resizeFrame;

  const measure = () => {
    if (!visible || destroyed) return;
    const viewport = win?.visualViewport?.height ?? win?.innerHeight ?? 800;
    const height = Math.max(180, viewport - frame.getBoundingClientRect().top - footer.getBoundingClientRect().height);
    frame.style.setProperty('--classic-workspace-height', `${height}px`);
  };
  const scheduleMeasure = () => {
    if (!win?.requestAnimationFrame) { measure(); return; }
    win.cancelAnimationFrame(resizeFrame);
    resizeFrame = win.requestAnimationFrame(measure);
  };
  const resizeTo = (value, save = true) => {
    const split = boundedSplit(value);
    frame.style.setProperty('--classic-index-size', `${split}%`);
    divider.setAttribute('aria-valuenow', String(Math.round(split)));
    divider.setAttribute('aria-valuetext', `Context index ${Math.round(split)} percent; content ${Math.round(100 - split)} percent`);
    if (save) presentation.set({ split });
    return split;
  };
  const unsubscribe = presentation.subscribe(preferences => {
    visible = preferences.classic;
    index.hidden = !visible;
    divider.hidden = !visible;
    if (ownsFooter) footer.hidden = !visible;
    resizeTo(preferences.split, false);
    if (!visible && (index.contains(doc.activeElement) || doc.activeElement === divider)) content.focus({ preventScroll: true });
    scheduleMeasure();
  });
  divider.addEventListener('keydown', event => {
    const currentSplit = presentation.get().split;
    const step = event.shiftKey ? 5 : 1;
    const values = { ArrowLeft: currentSplit - step, ArrowRight: currentSplit + step, Home: 20, End: 50 };
    if (!(event.key in values)) return;
    event.preventDefault();
    resizeTo(values[event.key]);
  });
  divider.addEventListener('pointerdown', event => {
    if (event.button !== 0) return;
    dragging = { id: event.pointerId, original: presentation.get().split, split: presentation.get().split };
    divider.setPointerCapture?.(event.pointerId);
    divider.focus({ preventScroll: true });
    frame.classList.add('classic-resizing');
    event.preventDefault();
  });
  divider.addEventListener('pointermove', event => {
    if (!dragging || dragging.id !== event.pointerId) return;
    const rect = frame.getBoundingClientRect();
    if (rect.width) dragging.split = resizeTo((event.clientX - rect.left) / rect.width * 100, false);
  });
  const finishResize = (event, cancel = false) => {
    if (!dragging || dragging.id !== event.pointerId) return;
    const pending = dragging;
    dragging = null;
    frame.classList.remove('classic-resizing');
    resizeTo(cancel ? pending.original : pending.split);
    if (divider.hasPointerCapture?.(event.pointerId)) divider.releasePointerCapture(event.pointerId);
  };
  divider.addEventListener('pointerup', event => finishResize(event));
  divider.addEventListener('pointercancel', event => finishResize(event, true));
  divider.addEventListener('lostpointercapture', event => finishResize(event));
  win?.addEventListener('resize', scheduleMeasure);
  win?.visualViewport?.addEventListener('resize', scheduleMeasure);
  const observer = win?.ResizeObserver ? new win.ResizeObserver(scheduleMeasure) : null;
  if (header) observer?.observe(header);
  observer?.observe(footer);
  for (let sibling = frame.previousElementSibling; sibling; sibling = sibling.previousElementSibling) {
    observer?.observe(sibling);
  }

  function setContext(model = {}) {
    if (!model || typeof model !== 'object' || Array.isArray(model)) model = {};
    current = model;
    const title = make(model.current ? 'h3' : 'h2', 'classic-index-title', model.title || 'Context index');
    const coverage = Object.hasOwn(coverageLabels, model.coverage) ? model.coverage : 'page';
    const summary = make('p', 'classic-context-coverage', coverageLabels[coverage]);
    if (Number.isSafeInteger(model.shown) && model.shown >= 0) summary.append(` · ${model.shown} shown`);
    if (Number.isSafeInteger(model.total) && model.total >= 0) summary.append(` of ${model.total}`);
    index.replaceChildren();
    if (model.current?.term) {
      const heading = make('h2', 'classic-current-term');
      const link = make('a', null, model.current.label || symbolLabel(model.current.term));
      link.href = routeHref('term', { term: model.current.term });
      heading.append(link);
      index.append(heading);
    }
    index.append(title, summary);
    if (model.description) index.append(make('p', 'classic-context-description', model.description));
    const filterLabel = make('label', 'classic-index-filter');
    filterLabel.append(make('span', null, 'Filter this index'));
    const input = make('input');
    input.type = 'search';
    input.placeholder = 'Terms, sections, predicates…';
    input.autocomplete = 'off';
    filterLabel.append(input);
    const matches = make('p', 'classic-filter-count');
    matches.setAttribute('role', 'status');
    const sections = [];
    const renderItem = item => {
      const row = make('li');
      const name = item.label ?? (item.expression ? expressionText(item.expression, { pretty: false })
        : item.mt ? contextLabel(item.mt, item.mtExpression) : symbolLabel(item.term ?? item.id ?? ''));
      let target;
      if (typeof item.onSelect === 'function') {
        target = make('button', 'classic-index-action', name);
        target.type = 'button';
        target.addEventListener('click', item.onSelect);
      } else if (item.mt && mtLink && !safeHash(item.href)) {
        target = mtLink(item.mt, item.mtExpression);
      } else {
        const href = safeHash(item.href) ?? (item.term ? routeHref('term', { term: item.term })
          : item.id ? routeHref('assertion', { id: item.id }) : item.mt ? routeHref('microtheory', { mt: item.mt }) : null);
        target = make(href ? 'a' : 'span', null, name);
        if (href) target.href = href;
      }
      if (item.selected) target.setAttribute('aria-current', 'true');
      const children = (Array.isArray(item.children) ? item.children : []).map(renderItem);
      let heading = row;
      let body = row;
      let disclosure;
      const expandable = item.expandable ?? children.length > 0;
      const selected = Boolean(item.selected) || children.some(child => child.selected);
      if (expandable) {
        disclosure = make('details', 'classic-index-branch');
        disclosure.open = Boolean(item.expanded ?? selected);
        heading = make('summary');
        disclosure.append(heading);
        row.append(disclosure);
        body = disclosure;
      }
      heading.append(target);
      if (Number.isSafeInteger(item.count) && item.count >= 0) heading.append(make('span', 'classic-index-count', ` (${item.count})`));
      if (children.length) {
        const list = make('ul');
        list.append(...children.map(child => child.row));
        body.append(list);
      } else if (expandable) {
        body.append(make('p', 'classic-empty-branch', item.count === 0 ? 'No assertions in this view.' : 'No further breakdown is available.'));
      }
      return { row, search: String(name).toLocaleLowerCase(), children, disclosure, selected };
    };
    let count = 0;
    for (const section of Array.isArray(model.sections) ? model.sections : []) {
      const rows = (Array.isArray(section.items) ? section.items : []).map(renderItem);
      if (!rows.length) continue;
      const panel = make('section', 'classic-index-section');
      if (section.title !== '') panel.append(make('h3', null, section.title || 'Index'));
      const list = make('ul');
      list.append(...rows.map(entry => entry.row));
      panel.append(list);
      sections.push({ panel, rows });
      count += rows.length;
    }
    if (count) {
      index.append(filterLabel, matches, ...sections.map(section => section.panel));
      const applyFilter = () => {
        const query = input.value.trim().toLocaleLowerCase();
        let visibleCount = 0;
        const visit = entry => {
          const children = entry.children.map(visit).some(Boolean);
          const own = !query || entry.search.includes(query);
          entry.row.hidden = !own && !children;
          if (query && children && entry.disclosure) entry.disclosure.open = true;
          if (!entry.row.hidden) visibleCount++;
          return !entry.row.hidden;
        };
        for (const section of sections) section.panel.hidden = !section.rows.map(visit).some(Boolean);
        matches.textContent = query ? `${visibleCount} matching index ${visibleCount === 1 ? 'entry' : 'entries'}` : '';
      };
      input.addEventListener('input', applyFilter);
    } else {
      index.append(make('p', 'classic-index-empty', model.emptyMessage || 'No contextual entries are available for this view. Global navigation remains above.'));
    }
    scheduleMeasure();
  }
  setContext(context ?? current);
  if (ownsFooter) footer.textContent = 'Local knowledge workspace · presentation only';
  return {
    frame, index, divider, toggle,
    setContext,
    setTermContext(options) { setContext(termContextModel(options)); },
    setStatus(value) { footer.textContent = String(value ?? ''); scheduleMeasure(); },
    resize: scheduleMeasure,
    destroy() {
      if (destroyed) return;
      destroyed = true;
      unsubscribe();
      toggle?.dispose();
      toggle?.remove();
      observer?.disconnect();
      win?.removeEventListener('resize', scheduleMeasure);
      win?.visualViewport?.removeEventListener('resize', scheduleMeasure);
      win?.cancelAnimationFrame(resizeFrame);
      frame.before(content);
      frame.remove();
      if (!originalClass) content.classList.remove('classic-content');
      if (ownsFooter) footer.remove();
      else if (!originalStatusClass) footer.classList.remove('classic-status');
    },
  };
}
