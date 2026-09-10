import definition from './settings.json' with { type: 'json' };

export const DEFAULT_SETTINGS = Object.freeze(definition.defaults);
export const MAXIMUMS = Object.freeze(definition.maximums);
export const SETTINGS_KEY = 'openworld.settings.v1';
const labels = { pageSize: 'Results per page', queryLimit: 'Maximum query results' };

export function validateSettings(values) {
  if (!values || typeof values !== 'object' || Array.isArray(values)) throw new Error('Settings must be an object.');
  const result = {};
  for (const key of Object.keys(DEFAULT_SETTINGS)) {
    const raw = values[key];
    const value = typeof raw === 'string' && /^\d+$/u.test(raw.trim()) ? Number(raw.trim()) : raw;
    if (!Number.isSafeInteger(value) || value < 1 || value > MAXIMUMS[key]) {
      throw new Error(`${labels[key]} must be a whole number from 1 to ${MAXIMUMS[key]}.`);
    }
    result[key] = value;
  }
  return result;
}

export function loadSettings(storage) {
  const raw = storage.getItem(SETTINGS_KEY);
  return raw === null ? { ...DEFAULT_SETTINGS } : validateSettings(JSON.parse(raw));
}

export function saveSettings(storage, values) {
  const validated = validateSettings(values);
  storage.setItem(SETTINGS_KEY, JSON.stringify(validated));
  return validated;
}
