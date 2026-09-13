import { DEFAULT_SETTINGS, MAXIMUMS } from './settings.js';
export const PAGE_SIZE = DEFAULT_SETTINGS.pageSize;

export function normalizeContextInput(value) {
  const input = String(value ?? '').trim();
  if (!input || input.startsWith('mt:') || input.startsWith('x_') || input.startsWith('(')) return input;
  return `x_${input}`;
}

export function contextRequestValue(initial, currentText, edited = false) {
  return !edited && currentText === initial.display ? initial.key : normalizeContextInput(currentText);
}

export function canonicalPath(path) {
  if (typeof path !== 'string') return null;
  const normalized = path.replaceAll('\\', '/');
  const segments = normalized.split('/');
  if (segments[0] !== 'KBs' || segments.some(part => !part || part === '.' || part === '..' || /[:\0]/u.test(part))) return null;
  return normalized;
}

export function supportedSource(path) {
  return Boolean(canonicalPath(path) && /\.(kif|krf|meld|metta)$/iu.test(path));
}

export function positiveInteger(value, fallback, maximum = Number.MAX_SAFE_INTEGER, minimum = 0) {
  if (value === null || value === undefined || value === '') return fallback;
  const number = Number(value);
  return Number.isSafeInteger(number) && number >= minimum ? Math.min(maximum, number) : fallback;
}

export function parseRoute(hash = '', preferences = DEFAULT_SETTINGS) {
  const raw = hash.replace(/^#\/?/u, '');
  const separator = raw.indexOf('?');
  const name = (separator < 0 ? raw : raw.slice(0, separator)) || 'overview';
  const params = new URLSearchParams(separator < 0 ? '' : raw.slice(separator + 1));
  return {
    name, params,
    offset: positiveInteger(params.get('offset'), 0),
    limit: positiveInteger(params.get('limit'), preferences.pageSize, MAXIMUMS.pageSize, 1),
  };
}

export function pageRange(total, offset, limit) {
  const safeTotal = positiveInteger(total, 0);
  return {
    start: safeTotal && offset < safeTotal ? offset + 1 : 0,
    end: offset < safeTotal ? Math.min(safeTotal, offset + limit) : 0,
    previous: Math.max(0, offset - limit),
    next: offset + limit,
    hasPrevious: offset > 0,
    hasNext: offset + limit < safeTotal,
  };
}

export function fileMeasure(file, format = value => new Intl.NumberFormat().format(value)) {
  if (Number.isInteger(file.lineCount) && file.lineCount >= 0) return `${format(file.lineCount)} lines`;
  if (Number.isFinite(file.sizeBytes) && file.sizeBytes >= 0) {
    return `${format(Math.round(file.sizeBytes / 1024 * 10) / 10)} KB`;
  }
  return 'Size unavailable';
}

export function visibleSourceFiles(model, expanded, collapsedGroups = new Set()) {
  const files = [];
  const visit = path => {
    const record = model.records.get(path);
    if (record.type === 'file') files.push(path);
    else if (expanded.has(path)) model.visibleChildren(path, collapsedGroups).forEach(visit);
  };
  (model.implicitRoot ? model.visibleChildren('KBs', collapsedGroups) : model.roots).forEach(visit);
  return files;
}

export function visibleSourceDirectories(model, expanded, collapsedGroups = new Set()) {
  const directories = [];
  const visit = path => {
    const record = model.records.get(path);
    if (record.type !== 'directory') return;
    directories.push(path);
    if (expanded.has(path)) model.visibleChildren(path, collapsedGroups).forEach(visit);
  };
  (model.implicitRoot ? model.visibleChildren('KBs', collapsedGroups) : model.roots).forEach(visit);
  return directories;
}

export function directoryStatisticsText(data, format = value => new Intl.NumberFormat().format(value)) {
  const count = (key, label) => {
    const n = data.counts?.[key];
    return Number.isSafeInteger(n) && n >= 0 ? `${format(n)} ${label}` : `${label} unavailable`;
  };
  return `${data.state === 'snapshot' ? '' : 'Observed: '}${[
    count('assertions', 'assertions'), count('contentMTs', 'distinct content MTs'),
    count('referencedMTs', 'distinct referenced MTs (relations)'), count('predicateFunctions', 'distinct predicates/functions'),
  ].join(' · ')}`;
}

export function sourceStatisticsText(snapshot, format = value => new Intl.NumberFormat().format(value)) {
  if (!snapshot) return 'Statistics not requested yet';
  if (snapshot.state === 'missing') return 'Statistics missing';
  if (snapshot.state === 'unavailable') return 'Statistics unavailable';
  const count = (key, label) => {
    const value = snapshot.counts?.[key];
    return Number.isSafeInteger(value) && value >= 0 ? `${format(value)} ${label}` : `${label} unavailable`;
  };
  const references = snapshot.coverage?.references;
  const contentPrefix = snapshot.coverage?.content === 'partial' ? '≥ ' : '';
  return [
    count('assertions', 'assertions'),
    `${contentPrefix}${count('contentMTs', 'content MTs')}`,
    `${references === 'partial' ? '≥ ' : ''}${count('referencedMTs', 'referenced MTs')}${references === 'relation_endpoints' || references === 'partial' ? ' (relations)' : ''}`,
    `${contentPrefix}${count('predicateFunctions', 'predicates/functions')}`,
  ].join(' · ');
}

export function sourceStatisticsStamp(snapshot) {
  const labels = { snapshot: 'Snapshot', partial: 'Partial snapshot', stale: 'Stale snapshot — source changed',
    missing: 'No snapshot', unavailable: 'Unavailable' };
  const date = typeof snapshot?.generatedAt === 'number' && Number.isFinite(snapshot.generatedAt)
    ? new Date(snapshot.generatedAt * 1000) : null;
  return `${labels[snapshot?.state] ?? 'Snapshot state unknown'} · ${date && Number.isFinite(date.getTime()) ? date.toLocaleString() : 'timestamp unavailable'}`;
}

export function hierarchyExpansionBlock(key, ancestors, expandedCount, maxNodes = 80, maxDepth = 8) {
  if (ancestors.includes(key)) return 'Cycle — this MT is already on this branch.';
  if (ancestors.length >= maxDepth) return `Depth limit (${maxDepth}). Open this MT to explore it as a new root.`;
  if (expandedCount >= maxNodes) return `Expansion limit (${maxNodes} MTs). Open an MT as a new root to continue.`;
  return null;
}

// Directory counts are maintained in the model; the DOM is never scanned for descendants.
export class SourceSelection {
  constructor(nodes, active = [], generation = 0) {
    this.records = new Map();
    this.roots = [];
    this.files = [];
    this.selected = new Set();
    this.groups = new Map();
    this.directoryGroups = new Map();
    this.generation = generation;
    const build = (node, parent) => {
      const path = canonicalPath(node.path);
      if (!path || this.records.has(path)) return null;
      if (parent && (!path.startsWith(`${parent}/`) || path.slice(parent.length + 1).includes('/'))) return null;
      if (node.type !== 'directory' && (node.type !== 'file' || !supportedSource(path))) return null;
      const record = { ...node, path, parent, children: [], directFiles: [], subdirectories: [],
        total: 0, selected: 0, localTotal: 0, localSelected: 0, fileStart: this.files.length };
      this.records.set(path, record);
      if (node.type === 'directory') {
        for (const child of node.children ?? []) {
          const built = build(child, path);
          if (built) {
            record.children.push(built.path);
            record.total += built.total;
            (built.type === 'file' ? record.directFiles : record.subdirectories).push(built.path);
          }
        }
      } else {
        record.total = 1;
        this.files.push(path);
      }
      record.localTotal = record.directFiles.length;
      record.fileEnd = this.files.length;
      return record;
    };
    for (const node of nodes ?? []) {
      const record = build(node, null);
      if (record) this.roots.push(record.path);
    }
    this.implicitRoot = !this.records.has('KBs') && this.roots.every(path => !path.slice(4).includes('/'))
      ? { path: 'KBs', type: 'directory', parent: null, children: this.roots,
        directFiles: this.roots.filter(path => this.records.get(path).type === 'file'),
        subdirectories: this.roots.filter(path => this.records.get(path).type === 'directory'),
        total: this.files.length, selected: 0, localSelected: 0, fileStart: 0, fileEnd: this.files.length }
      : null;
    if (this.implicitRoot) this.implicitRoot.localTotal = this.implicitRoot.directFiles.length;
    for (const record of [...this.records.values(), ...(this.implicitRoot ? [this.implicitRoot] : [])]) {
      if (record.type !== 'directory' || !record.directFiles.length || !record.subdirectories.length) continue;
      const groups = [['subdirectories', 'Subdirectories', record.subdirectories], ['local-files', 'Local files', record.directFiles]]
        .map(([kind, label, children]) => {
          const ranges = [];
          for (const path of children) {
            const { fileStart: start, fileEnd: end } = this.records.get(path);
            if (start === end) continue;
            if (ranges.at(-1)?.[1] === start) ranges.at(-1)[1] = end;
            else ranges.push([start, end]);
          }
          const group = Object.freeze({ key: `source-group:${kind}:${encodeURIComponent(record.path)}`,
            directory: record.path, kind, label, children: Object.freeze([...children]),
            ranges: Object.freeze(ranges.map(range => Object.freeze(range))),
            total: kind === 'local-files' ? record.localTotal : record.total - record.localTotal });
          this.groups.set(group.key, group);
          return group;
        });
      this.directoryGroups.set(record.path, Object.freeze(groups));
    }
    this.reset(active, generation);
  }

  reset(active, generation = this.generation) {
    this.generation = generation;
    this.active = new Set(active.map(canonicalPath).filter(path => this.records.get(path)?.type === 'file'));
    this.selected = new Set(this.active);
    const count = path => {
      const record = this.records.get(path);
      record.localSelected = 0;
      record.selected = record.type === 'file' ? Number(this.selected.has(path)) : record.children.reduce((sum, child) => {
        const selected = count(child);
        if (this.records.get(child).type === 'file') record.localSelected += selected;
        return sum + selected;
      }, 0);
      return record.selected;
    };
    this.roots.forEach(count);
    if (this.implicitRoot) {
      this.implicitRoot.selected = this.selected.size;
      this.implicitRoot.localSelected = this.implicitRoot.directFiles.reduce((sum, path) => sum + Number(this.selected.has(path)), 0);
    }
  }

  record(path) {
    const canonical = canonicalPath(path);
    return this.records.get(canonical) ?? (canonical === 'KBs' ? this.implicitRoot : null);
  }

  state(path) {
    const record = this.record(path);
    if (!record) return { checked: false, indeterminate: false, disabled: true, selected: 0, total: 0 };
    return {
      checked: record.total > 0 && record.selected === record.total,
      indeterminate: record.selected > 0 && record.selected < record.total,
      disabled: record.total === 0,
      selected: record.selected, total: record.total,
    };
  }

  setSelected(path, checked = !this.state(path).checked) {
    const record = this.record(path);
    if (!record) return [];
    const changes = [];
    const previous = record.selected;
    const apply = item => {
      item.selected = checked ? item.total : 0;
      item.localSelected = checked ? item.localTotal : 0;
      changes.push(item.path);
      if (item.type === 'file') {
        if (checked) this.selected.add(item.path);
        else this.selected.delete(item.path);
      } else item.children.forEach(child => apply(this.records.get(child)));
    };
    apply(record);
    const delta = record.selected - previous;
    let parent = record.parent, child = record;
    while (parent) {
      const ancestor = this.records.get(parent);
      ancestor.selected += delta;
      if (child.type === 'file') ancestor.localSelected += delta;
      changes.push(parent);
      child = ancestor;
      parent = ancestor.parent;
    }
    if (this.implicitRoot) {
      this.implicitRoot.selected = this.selected.size;
      if (record.parent === null && record.type === 'file') this.implicitRoot.localSelected += delta;
    }
    return changes;
  }

  // Group keys are UI identities only. Only these range helpers produce API file sets.
  groupsFor(directory) {
    return this.directoryGroups.get(canonicalPath(directory)) ?? [];
  }

  groupState(key) {
    const group = this.groups.get(key);
    if (!group) return { checked: false, indeterminate: false, disabled: true, selected: 0, total: 0 };
    const directory = this.record(group.directory);
    const selected = group.kind === 'local-files' ? directory.localSelected : directory.selected - directory.localSelected;
    return { checked: group.total > 0 && selected === group.total,
      indeterminate: selected > 0 && selected < group.total, disabled: group.total === 0, selected, total: group.total };
  }

  setGroupSelected(key, checked = !this.groupState(key).checked) {
    const group = this.groups.get(key);
    if (!group) return [];
    const changed = new Set();
    for (const path of group.children) for (const item of this.setSelected(path, checked)) changed.add(item);
    return [...changed];
  }

  filesInRanges(ranges, selectedOnly = false) {
    const files = [];
    for (const [start, end] of ranges) for (let index = start; index < end; index++) {
      const path = this.files[index];
      if (!selectedOnly || this.selected.has(path)) files.push(path);
    }
    return files;
  }

  filesFor(path, { selectedOnly = false } = {}) {
    const record = this.record(path);
    return record ? this.filesInRanges([[record.fileStart, record.fileEnd]], selectedOnly) : [];
  }

  groupFiles(key, { selectedOnly = false } = {}) {
    const group = this.groups.get(key);
    return group ? this.filesInRanges(group.ranges, selectedOnly) : [];
  }

  visibleChildren(path, collapsedGroups = new Set()) {
    const record = this.record(path);
    if (!record || record.type !== 'directory') return [];
    const groups = this.groupsFor(path);
    if (!groups.length || !collapsedGroups.size) return record.children;
    const hidden = new Set(groups.filter(group => collapsedGroups.has(group.key)).map(group => group.kind));
    return record.children.filter(child => !hidden.has(this.records.get(child).type === 'file' ? 'local-files' : 'subdirectories'));
  }

  selectedFiles(path) {
    return path === undefined ? this.filesInRanges([[0, this.files.length]], true) : this.filesFor(path, { selectedOnly: true });
  }

  get dirty() {
    return this.selected.size !== this.active.size || [...this.selected].some(path => !this.active.has(path));
  }
}

export class VersionTracker {
  constructor() { this.version = null; }

  observe(version) {
    if (typeof version !== 'string' || !version) return false;
    const changed = this.version !== null && this.version !== version;
    this.version = version;
    return changed;
  }
}

const observedNumber = value => Number.isSafeInteger(value) && value >= 0 ? value : null;
const observedBoolean = value => typeof value === 'boolean' ? value : null;
export const FILE_PRESENCE_KEYS = ['startup', 'loaded', 'cached', 'indexed'];
export const FILE_COUNT_KEYS = ['warnings', 'errors', 'sizeBytes'];

export function sourceFileRecord(record = {}) {
  const result = { type: 'file', path: canonicalPath(record.path), lineCount: observedNumber(record.lineCount),
    count: observedNumber(record.count), sizeBytes: observedNumber(record.sizeBytes),
    warnings: observedNumber(record.diagnostics?.warnings), errors: observedNumber(record.diagnostics?.errors),
    diagnosticEvidence: record.diagnostics?.description ?? 'No complete per-file diagnostic count is recorded. Unknown does not mean zero.',
    sizeEvidence: record.sizeEvidence ?? 'Size recorded for the original source; not its generated companions.' };
  for (const key of FILE_PRESENCE_KEYS) result[key] = observedBoolean(record.states?.[key]);
  return result;
}

export class FileMetadata {
  constructor({ limit = 4096 } = {}) {
    this.records = new Map();
    this.limit = Math.max(1, observedNumber(limit) ?? 4096);
    this.active = null;
    this.startup = null;
    this.generation = -1;
  }
  retain(path, record) {
    this.records.delete(path);
    this.records.set(path, record);
    while (this.records.size > this.limit) this.records.delete(this.records.keys().next().value);
  }
  rememberStartup(startup) {
    if (startup?.known === true && Array.isArray(startup.paths)) {
      this.startup = new Set(startup.paths.map(canonicalPath).filter(Boolean));
    } else if (startup?.known === false) {
      this.startup = null;
    }
    if (startup) this.startupEvidence = startup.evidence;
  }
  status(status) {
    if (!Number.isSafeInteger(status.generation) || status.generation < this.generation) return;
    if (status.generation !== this.generation) {
      for (const record of this.records.values()) {
        record.complete = false;
        record.warnings = record.errors = null;
        record.error = null;
        delete record.operationDiagnostics;
        delete record.dependencies;
      }
    }
    this.generation = status.generation;
    this.active = new Set((status.files ?? []).map(file => canonicalPath(file.path)).filter(Boolean));
    this.rememberStartup(status.startup);
    for (const file of status.files ?? []) this.merge(file, { live: true });
  }
  merge(file, { live = false } = {}) {
    const path = canonicalPath(file.path);
    if (!path) return;
    const previous = this.records.get(path);
    const record = sourceFileRecord(file);
    if (live) {
      record.cached = previous?.cached ?? null;
      record.indexed = previous?.indexed ?? null;
      record.complete = previous?.complete ?? false;
      record.sizeEvidence = 'Size recorded at load time; use file-state refresh for a current disk observation.';
      if (previous?.diskSize) {
        record.sizeBytes = previous.sizeBytes;
        record.sizeEvidence = previous.sizeEvidence;
      }
    } else {
      record.complete = true;
      record.diskSize = record.sizeBytes !== null;
      record.sizeEvidence = 'Original source size at the last file-system check; generated caches are excluded.';
      if (record.lineCount === null) record.lineCount = previous?.lineCount ?? null;
      if (record.count === null) record.count = previous?.count ?? null;
    }
    this.retain(path, { ...previous, ...record, error: null });
  }
  catalog(catalog) {
    const stale = Number.isSafeInteger(catalog.generation) && catalog.generation < this.generation;
    if (!stale) this.rememberStartup(catalog.startup);
    const visit = nodes => {
      for (const node of nodes ?? []) {
        if (node.type === 'file') {
          this.merge(stale ? { ...node, diagnostics: undefined } : node);
          if (stale && this.records.has(canonicalPath(node.path))) this.records.get(canonicalPath(node.path)).complete = false;
        }
        else visit(node.children);
      }
    };
    visit(catalog.nodes);
  }
  information(reply) {
    if (reply.generation !== this.generation) return false;
    this.rememberStartup(reply.startup);
    for (const file of reply.items ?? []) this.merge(file);
    return true;
  }
  get(path) {
    path = canonicalPath(path);
    const record = this.records.get(path) ?? sourceFileRecord({ path });
    return { ...sourceFileRecord({ path }), ...record, ...record.operationDiagnostics,
      loaded: path && this.active ? this.active.has(path) : null,
      startup: path && this.startup ? this.startup.has(path) : null, startupEvidence: this.startupEvidence };
  }
  operation(issues) {
    for (const issue of issues) {
      const path = canonicalPath(issue.source);
      if (!path || !['failed', 'busy'].includes(issue.status)) continue;
      this.retain(path, { ...this.records.get(path), path, operationDiagnostics: {
        warnings: Array.isArray(issue.warnings) ? issue.warnings.length : null,
        errors: Array.isArray(issue.errors) ? issue.errors.length : null,
        diagnosticEvidence: 'Recorded entries from the latest source operation reported to this browser in this generation, not a new source validation or a complete source diagnosis.',
      } });
    }
  }
  clearOperations(paths) {
    for (const path of paths) {
      const record = this.records.get(canonicalPath(path));
      if (record) delete record.operationDiagnostics;
    }
  }
  needsInformation(path) {
    const record = this.records.get(path);
    return !record?.complete && !record?.error;
  }
  fail(paths, message) {
    for (const path of paths) this.retain(path, { ...this.get(path), error: message });
  }
  retry(path) {
    const record = this.records.get(path);
    if (record) { record.error = null; record.complete = false; }
  }
  statistics(path, snapshot) {
    path = canonicalPath(path);
    if (!path || !snapshot || typeof snapshot !== 'object') return;
    this.retain(path, { ...this.records.get(path), path, inventory: {
      state: snapshot.state, generatedAt: snapshot.generatedAt, coverage: snapshot.coverage,
      counts: snapshot.counts, messages: (snapshot.messages ?? []).slice(0, 8),
    } });
  }
  dependencies(path, summary, generation) {
    path = canonicalPath(path);
    if (!path || generation !== this.generation) return false;
    this.retain(path, { ...this.records.get(path), path, dependencies: {
      status: summary.status, counts: summary.counts, coverage: summary.coverage,
      impliedMT: summary.impliedMT,
    } });
    return true;
  }
}

export function recordedFileMT(record) {
  const implied = record.dependencies?.impliedMT;
  return ['complete', 'partial'].includes(record.dependencies?.status) &&
    implied?.status === 'present' && implied.scope === 'cached_assertion_contexts' &&
    Number.isSafeInteger(implied.contentAssertions) && implied.contentAssertions > 0 &&
    typeof implied.candidate === 'string' && implied.candidate.startsWith('x_') ? implied : null;
}

export function sourceCoverage(record) {
  const coverage = { total: 1 };
  for (const key of FILE_PRESENCE_KEYS) {
    coverage[key] = Number(record[key] === true);
    coverage[`${key}Unknown`] = Number(typeof record[key] !== 'boolean');
  }
  for (const key of FILE_COUNT_KEYS) {
    const value = observedNumber(record[key]);
    coverage[key] = value ?? 0;
    coverage[`${key}Unknown`] = Number(value === null);
  }
  return coverage;
}

export function sourceFileStates(model, activePaths, metadata) {
  const active = new Set(activePaths.map(canonicalPath).filter(Boolean));
  const states = new Map();
  const visit = path => {
    const record = model.records.get(path);
    if (record.type === 'file') {
      const value = metadata ? metadata.get(path) : { ...sourceFileRecord(record), loaded: active.has(path) };
      states.set(path, value);
      return sourceCoverage(value);
    }
    const coverage = Object.fromEntries(Object.keys(sourceCoverage({})).map(key => [key, 0]));
    for (const child of record.children) {
      const childCoverage = visit(child);
      for (const key of Object.keys(coverage)) coverage[key] += childCoverage[key];
    }
    states.set(path, { type: 'directory', coverage, startupEvidence: metadata?.startupEvidence });
    return coverage;
  };
  model.roots.forEach(visit);
  return states;
}

export class APIError extends Error {
  constructor(message, code = 'request_failed', status = 0, details = {}) {
    super(message);
    this.name = 'APIError';
    this.code = code;
    this.status = status;
    this.counts = details?.counts && typeof details.counts === 'object' && !Array.isArray(details.counts) ? details.counts : null;
    this.issues = Array.isArray(details?.issues) ? details.issues : [];
  }
}

export function apiErrorSummary(error) {
  if (error.code === 'compile_failed' && Number.isSafeInteger(error.counts?.failed) && error.counts.failed > 0) {
    return `${error.counts.failed} source(s) failed to compile.`;
  }
  if (error.code === 'busy' && Number.isSafeInteger(error.counts?.busy) && error.counts.busy > 0) {
    return `${error.counts.busy} source(s) are busy. Retry after the other compiler finishes.`;
  }
  return error.message || String(error);
}

export function compilationIssues(error) {
  return (Array.isArray(error.issues) ? error.issues : []).filter(issue =>
    issue && typeof issue === 'object' && (!issue.status || issue.status === 'failed' || issue.status === 'busy'));
}

export async function requestJSON(path, { method = 'GET', body, signal, allowErrorResult = false, fetch: fetcher = globalThis.fetch } = {}) {
  let response;
  try {
    response = await fetcher(path, {
      method, signal, cache: 'no-store', credentials: 'same-origin',
      headers: { Accept: 'application/json', ...(body === undefined ? {} : { 'Content-Type': 'application/json' }) },
      ...(body === undefined ? {} : { body: JSON.stringify(body) }),
    });
  } catch (error) {
    if (error.name === 'AbortError') throw error;
    throw new APIError('Cannot reach the local KB server. Check that SWI-Prolog is running and retry.', 'connection_failed');
  }
  let result;
  try { result = await response.json(); }
  catch { throw new APIError(`The server returned an unreadable response (HTTP ${response.status}).`, 'invalid_response', response.status); }
  if (!response.ok || (result?.error && !allowErrorResult)) {
    throw new APIError(result?.error?.message ?? `Request failed (HTTP ${response.status}).`, result?.error?.code ?? 'request_failed', response.status, result?.error);
  }
  return result;
}
