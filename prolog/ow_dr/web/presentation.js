export const PRESENTATION_KEY = 'powder.presentation.v2';
export const LEGACY_PRESENTATION_KEY = 'powder.presentation.v1';
export const PRESENTATION_VERSION = 2;
export const ASSERTION_FIELDS = Object.freeze({
  id: 'Assertion ID',
  kind: 'Assertion kind and argument roles',
  mt: 'Microtheory',
  source: 'Source file and line',
  strength: 'Strength and direction',
  diagnostics: 'Non-blocking diagnostics',
  properties: 'Properties and provenance',
  proof: 'Proof information',
  ruleUtility: 'Observed rule utility',
  assertionPrior: 'Configured asserted-formula prior (not native TVA)',
});
export const DEFAULT_PRESENTATION = Object.freeze({
  version: PRESENTATION_VERSION,
  classic: true,
  classicExplicit: false,
  density: 'dense',
  split: 30,
  tvaFamilies: DEFAULT_TVA_FAMILIES,
  termGroups: DEFAULT_TERM_GROUPS,
  fields: Object.freeze(Object.fromEntries(Object.keys(ASSERTION_FIELDS).map(key => [key, false]))),
});

const record = value => value && typeof value === 'object' && !Array.isArray(value) ? value : {};

export function normalizePresentation(value, previous = DEFAULT_PRESENTATION) {
  const input = record(value);
  const base = record(previous);
  const fields = record(input.fields);
  const classicExplicit = typeof input.classicExplicit === 'boolean' ? input.classicExplicit
    : typeof input.classic === 'boolean' ? true : base.classicExplicit ?? false;
  return {
    version: PRESENTATION_VERSION,
    classic: classicExplicit ? (typeof input.classic === 'boolean' ? input.classic : base.classic ?? true) : true,
    classicExplicit,
    density: ['dense', 'comfortable'].includes(input.density) ? input.density : base.density ?? 'dense',
    split: Number.isFinite(input.split) && input.split >= 20 && input.split <= 50 ? input.split : base.split ?? 30,
    tvaFamilies: normalizeTVAFamilies(input.tvaFamilies, base.tvaFamilies),
    termGroups: normalizeTermGroups(input.termGroups, base.termGroups),
    fields: Object.fromEntries(Object.keys(ASSERTION_FIELDS).map(key => [
      key, typeof fields[key] === 'boolean' ? fields[key] : base.fields?.[key] ?? false,
    ])),
  };
}

function readPresentation(storage) {
  const current = storage?.getItem(PRESENTATION_KEY);
  const raw = current ?? storage?.getItem(LEGACY_PRESENTATION_KEY);
  let value;
  try {
    value = record(JSON.parse(raw ?? 'null'));
  } catch {
    value = {};
  }
  // v1 saved its default false with unrelated field edits. It is not an opt-out.
  if (current == null && value.classicExplicit !== true) value = { ...value, classic: true, classicExplicit: false };
  return normalizePresentation(value);
}

export function loadPresentation(storage) {
  try { return readPresentation(storage); }
  catch { return normalizePresentation(null); }
}

export function applyPresentation(root, preferences) {
  if (!root) return;
  root.classList.toggle('classic-mode', preferences.classic);
  root.setAttribute('data-assertion-density', preferences.density);
  for (const key of Object.keys(ASSERTION_FIELDS)) {
    root.setAttribute(`data-field-${key.toLowerCase()}`, String(preferences.fields[key]));
  }
  root.style.setProperty('--classic-index-size', `${preferences.split}%`);
}

/**
 * Browser-only preferences. set() accepts a partial object, including partial fields.
 * No request, route change or content replacement is performed. The existing settings
 * storage (pageSize/queryLimit) is deliberately independent and is never overwritten.
 * Classic is the default. set({classic:false}) records a deliberate v2 opt-out;
 * legacy v1 default false migrates to Classic while retaining its field choices.
 */
export function createPresentationStore({
  storage, root = globalThis.document?.documentElement, window: win = globalThis.window, onError,
} = {}) {
  let storageError = null;
  if (storage === undefined) {
    try { storage = win?.localStorage; } catch (error) { storageError = error; }
  }
  let preferences;
  try {
    preferences = readPresentation(storage);
  } catch (error) {
    storageError = error;
    preferences = normalizePresentation(null);
  }
  const listeners = new Set();
  let persistent = Boolean(storage) && !storageError;
  const snapshot = () => normalizePresentation(preferences);
  const notify = () => {
    applyPresentation(root, preferences);
    for (const listener of listeners) listener(snapshot(), { persistent, error: storageError });
  };
  const set = patch => {
    preferences = normalizePresentation(patch, preferences);
    try {
      if (storage) {
        storage.setItem(PRESENTATION_KEY, JSON.stringify(preferences));
        persistent = true;
        storageError = null;
      }
    } catch (error) {
      persistent = false;
      storageError = error;
      onError?.(error);
    }
    notify();
    return snapshot();
  };
  const changed = event => {
    if (![PRESENTATION_KEY, LEGACY_PRESENTATION_KEY, null].includes(event.key)) return;
    if (event.storageArea && event.storageArea !== storage) return;
    preferences = loadPresentation(storage);
    notify();
  };
  win?.addEventListener('storage', changed);
  applyPresentation(root, preferences);
  return {
    get: snapshot,
    set,
    reset: () => set(DEFAULT_PRESENTATION),
    subscribe(listener, { immediate = true, signal } = {}) {
      if (signal?.aborted) return () => {};
      listeners.add(listener);
      if (immediate) listener(snapshot(), { persistent, error: storageError });
      const unsubscribe = () => listeners.delete(listener);
      signal?.addEventListener('abort', unsubscribe, { once: true });
      return unsubscribe;
    },
    destroy() {
      listeners.clear();
      win?.removeEventListener('storage', changed);
    },
  };
}

function node(doc, tag, className, text) {
  const result = doc.createElement(tag);
  if (className) result.className = className;
  if (text !== undefined) result.textContent = text;
  return result;
}

export function createClassicToggle(presentation, { document: doc = globalThis.document, signal } = {}) {
  const label = node(doc, 'label', 'classic-toggle');
  const input = doc.createElement('input');
  input.type = 'checkbox';
  input.name = 'classic';
  input.addEventListener('change', () => presentation.set({ classic: input.checked }));
  label.append(input, node(doc, 'span', null, 'Classic Cyc mode'));
  label.dispose = presentation.subscribe(preferences => { input.checked = preferences.classic; }, { signal });
  return label;
}

/**
 * A pure presentation page. Pass the existing numeric browser-settings form as
 * limitsSection if desired; do not pass application reload or runtime actions.
 * Call node.dispose() on unmount, or provide the route's AbortSignal.
 */
export function renderUISettings(presentation, {
  document: doc = globalThis.document, signal, limitsSection,
} = {}) {
  const page = node(doc, 'section', 'ui-settings');
  const header = node(doc, 'header', 'page-heading');
  const intro = doc.createElement('div');
  intro.append(node(doc, 'h1', null, 'UI Settings'),
    node(doc, 'p', 'lead', 'Presentation preferences for this browser only. Changes apply immediately without reloading knowledge or replacing editor buffers.'));
  header.append(intro);
  page.append(header);

  const layout = node(doc, 'fieldset', 'presentation-fieldset');
  layout.append(node(doc, 'legend', null, 'Layout'));
  const classic = createClassicToggle(presentation, { document: doc, signal });
  layout.append(classic);
  const densityLabel = node(doc, 'label', 'presentation-density');
  densityLabel.append(node(doc, 'span', null, 'Assertion spacing'));
  const density = doc.createElement('select');
  density.name = 'density';
  for (const [value, text] of [['dense', 'Dense'], ['comfortable', 'Comfortable']]) {
    const option = node(doc, 'option', null, text);
    option.value = value;
    density.append(option);
  }
  density.addEventListener('change', () => presentation.set({ density: density.value }));
  densityLabel.append(density);
  layout.append(densityLabel,
    node(doc, 'p', 'muted', 'Dense starts with just the expression and its assertion-properties ball. The global navigation stays at the top in both layouts.'));
  page.append(layout);

  const fields = node(doc, 'fieldset', 'presentation-fieldset');
  fields.append(node(doc, 'legend', null, 'Secondary assertion fields'),
    node(doc, 'p', 'muted', 'Choose fields for assertion lists and proof steps. Full assertion details always expose the available metadata. Blocking errors remain visible.'));
  const choices = node(doc, 'div', 'presentation-field-choices');
  const inputs = new Map();
  for (const [key, title] of Object.entries(ASSERTION_FIELDS)) {
    const label = node(doc, 'label', 'presentation-choice');
    const input = doc.createElement('input');
    input.type = 'checkbox';
    input.name = `field-${key}`;
    input.addEventListener('change', () => presentation.set({ fields: { [key]: input.checked } }));
    inputs.set(key, input);
    label.append(input, node(doc, 'span', null, title));
    choices.append(label);
  }
  fields.append(choices,
    node(doc, 'p', 'muted', 'Unavailable fields are not invented. Rule utility reflects recorded execution observations, not an ontology confidence score.'));
  page.append(fields);
  const tvaControls = createTVAVisibilityControls(presentation, { document: doc, signal });
  page.append(tvaControls);
  if (limitsSection) page.append(limitsSection);
  const feedback = node(doc, 'p', 'presentation-feedback');
  feedback.setAttribute('aria-live', 'polite');
  const reset = node(doc, 'button', 'button secondary', 'Reset presentation preferences');
  reset.type = 'button';
  reset.addEventListener('click', () => {
    presentation.reset();
    if (feedback.getAttribute('role') !== 'alert') feedback.textContent = 'Presentation defaults restored. Browser request limits and server state were not changed.';
  });
  page.append(reset, feedback);
  const unsubscribe = presentation.subscribe((preferences, { persistent }) => {
    density.value = preferences.density;
    for (const [key, input] of inputs) input.checked = preferences.fields[key];
    feedback.setAttribute('role', persistent ? 'status' : 'alert');
    feedback.textContent = persistent
      ? 'Changes are saved for this browser.'
      : 'Browser storage is unavailable. Changes work in this tab but may not survive a reload.';
  }, { signal });
  page.dispose = () => { unsubscribe(); classic.dispose(); tvaControls.dispose(); };
  return page;
}
import { DEFAULT_TVA_FAMILIES, normalizeTVAFamilies, createTVAVisibilityControls } from './native-tva.js';
import { DEFAULT_TERM_GROUPS, normalizeTermGroups } from './term-categories.js';
