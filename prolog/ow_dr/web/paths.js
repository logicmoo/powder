import definition from './paths.json' with { type: 'json' };

export const APP_BASE = definition.appBase;
export const API_BASE = `${APP_BASE}api/`;
export const appPath = (path = '') => `${APP_BASE}${path}`;
export const apiPath = path => `${API_BASE}${path}`;
