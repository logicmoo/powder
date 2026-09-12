import { recordedFileMT, sourceStatisticsText, sourceStatisticsStamp } from './model.js';

const number = value => new Intl.NumberFormat().format(value);
let propertySequence = 0;
const size = value => value < 1024 ? `${number(value)} B`
  : `${new Intl.NumberFormat(undefined, { maximumFractionDigits: 1 }).format(value / 1024)} KB`;
const present = [
  ['startup', 'Load at startup', 'Not at startup',
    'The initial successful source manifest for this invocation, retained after unload. Not saved preferences or draft selection; restarting listeners does not reload sources.'],
  ['loaded', 'Loaded now', 'Not loaded',
    'Membership in the current active source manifest, independent of startup selection and disk artifacts.'],
  ['cached', 'Cached', 'Not cached',
    '.data artifact presence at the last check. Freshness and validity are unchecked; inventory snapshot staleness is separate.'],
  ['indexed', 'Indexed', 'Not indexed',
    '.index.data artifact presence at the last check. Freshness and validity are unchecked; inventory snapshot staleness is separate.'],
];

export function fileBadgeDescriptions(record) {
  const directory = record.type === 'directory', coverage = record.coverage;
  const badges = present.map(([key, label, absent, defaultTitle]) => {
    const title = key === 'startup' && ['configured_startup', 'default_startup'].includes(record.startupEvidence)
      ? 'The configured next-startup source selection (or default when unconfigured). Explicit CLI sources override it. Independent of the initial and current loaded manifests and draft selection.'
      : key === 'startup' && record.startupEvidence === 'configuration_unavailable'
        ? 'Startup configuration is unavailable. This is not inferred from loaded sources or draft selection.'
        : defaultTitle;
    if (directory) {
      const unknown = coverage[`${key}Unknown`];
      return { key, text: `${number(coverage[key])}/${number(coverage.total)} ${label}${unknown ? ` · ${number(unknown)} unknown` : ''}`,
        presence: unknown ? 'unavailable' : 'observed', title: `${title} All supported descendants, regardless of selection.` };
    }
    const value = record[key];
    return { key, text: value === true ? label : value === false ? absent : `${label} unknown`,
      presence: value === true ? 'present' : value === false ? 'absent' : 'unavailable', title };
  });
  for (const [key, label] of [['warnings', 'Warnings'], ['errors', 'Errors'], ['sizeBytes', 'Size']]) {
    const format = key === 'sizeBytes' ? size : number;
    const title = key === 'sizeBytes' ? record.sizeEvidence : record.diagnosticEvidence;
    let text, presence;
    if (directory) {
      const unknown = coverage[`${key}Unknown`], known = coverage.total - unknown;
      text = known || !coverage.total ? `${label}: ${unknown ? '≥ ' : ''}${format(coverage[key])}` : `${label}: unknown`;
      if (unknown) text += ` · ${number(unknown)} unknown files`;
      presence = unknown ? 'unavailable' : 'observed';
    } else {
      const value = record[key], known = Number.isSafeInteger(value) && value >= 0;
      text = `${label}: ${known ? format(value) : 'unknown'}`;
      presence = known ? 'observed' : 'unavailable';
    }
    badges.push({ key, text, presence, title: title ?? 'Recorded evidence only. Unknown child values are not silently counted as zero.' });
  }
  return badges;
}

export function renderFileBadges(path, record, element, { enableStartup, startupPending = false } = {}) {
  const group = element('span', { className: 'source-state-badges', role: 'group',
    'aria-label': `Independent file states for ${path}`,
    [record.type === 'directory' ? 'data-directory-states-path' : 'data-file-states-path']: path });
  for (const badge of fileBadgeDescriptions(record)) {
    const actionable = record.type !== 'directory' && badge.key === 'startup' && badge.presence === 'absent' && enableStartup;
    group.append(element(actionable ? 'button' : 'span', { className: 'badge source-state-badge', 'data-kind': badge.key,
      'data-presence': badge.presence, title: actionable ? `${badge.title} Add only this file to the saved next-startup selection; do not load it now.` : badge.title,
      ...(actionable ? { type: 'button', disabled: startupPending, 'aria-label': `Load ${path} at next startup`,
        onclick: event => { event.preventDefault(); event.stopPropagation(); enableStartup(); } } : {}) },
    actionable && startupPending ? 'Saving startup…' : badge.text));
  }
  return group;
}

export function renderSourceFile(path, label, metadata, {
  element, compact = false, retry, changed, properties, renderMT, enableStartup, startupPending, displayPath = path ?? 'Unresolved source',
} = {}) {
  const name = element('span', { className: 'source-file-name' });
  const body = element('span', { className: 'source-file-metadata' });
  const introduction = element('div', { className: 'file-properties-introduction' });
  const extra = element('div', { className: 'file-properties-extra' });
  const panel = element('section', { className: 'source-file-properties', hidden: true,
    id: `source-properties-${++propertySequence}`, 'aria-label': `Properties for ${displayPath}` }, introduction, extra);
  let initialized = false;
  const toggle = element('button', { type: 'button', className: 'source-properties-button text-button',
    'aria-controls': panel.id, 'aria-expanded': 'false', 'aria-label': `Properties for ${displayPath}`,
    onclick: event => {
      event.preventDefault(); event.stopPropagation();
      panel.hidden = !panel.hidden;
      toggle.setAttribute('aria-expanded', String(!panel.hidden));
      if (!panel.hidden) {
        refresh();
        if (!initialized) { initialized = true; properties?.(path, extra, refresh); }
      }
      changed?.();
    },
  }, 'Properties');
  const node = element('div', { className: `source-file-display${compact ? ' compact' : ''}`,
    'data-source-file': path ?? '' }, name, body, toggle, panel);
  node.addEventListener('keydown', event => {
    if (event.key !== 'Escape' || panel.hidden) return;
    event.stopPropagation(); panel.hidden = true;
    toggle.setAttribute('aria-expanded', 'false'); toggle.focus();
  });
  const refresh = () => {
    const record = metadata.get(path);
    const value = typeof label === 'function' ? label() : label;
    const rendered = value instanceof Node ? value : document.createTextNode(String(value ?? ''));
    if (!name.firstChild?.isEqualNode(rendered)) name.replaceChildren(rendered);
    const restoreFocus = body.contains(document.activeElement);
    body.replaceChildren(renderFileBadges(displayPath, record, element, {
      enableStartup: path && enableStartup ? () => enableStartup(path) : undefined,
      startupPending: startupPending?.(path) ?? false,
    }),
      ...(Number.isSafeInteger(record.lineCount) && record.lineCount >= 0
        ? [element('span', { className: 'file-measure' }, `${number(record.lineCount)} lines`)] : []));
    const implied = recordedFileMT(record);
    if (implied && renderMT) body.append(element('span', { className: 'badge recorded-file-mt',
      title: `${number(implied.contentAssertions)} cached assertion context occurrences. Recorded content evidence, not a filename fallback or proof of current source freshness.` },
    'Recorded file MT: ', renderMT(implied.candidate, implied.mtExpression)));
    if (record.error) body.append(element('span', { className: 'file-metadata-error', role: 'status' },
      `File states unavailable: ${record.error} `, element('button', { type: 'button', className: 'text-button',
        onclick: () => retry(path) }, 'Retry file states')));
    if (restoreFocus) (body.querySelector('button') ?? toggle).focus();
    if (!panel.hidden) {
      const fields = fileBadgeDescriptions(record).flatMap(badge => [
        element('dt', {}, badge.text), element('dd', {}, badge.title),
      ]);
      introduction.replaceChildren(element('h3', {}, 'File properties'), element('dl', { className: 'properties' }, fields),
        element('p', { className: 'muted' }, 'These are recorded observations, not a new validation of source code.'),
        ...(record.inventory ? [element('p', {}, sourceStatisticsText(record.inventory)),
         element('p', { className: 'statistics-stamp' }, sourceStatisticsStamp(record.inventory))] : []));
    }
  };
  refresh();
  return { node, refresh, requested: () => true };
}
