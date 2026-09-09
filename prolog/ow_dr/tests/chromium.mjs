import { spawn } from 'node:child_process';
import { mkdir, readFile, rm } from 'node:fs/promises';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';

const pause = milliseconds => new Promise(resolve => setTimeout(resolve, milliseconds));

export async function launchChromium(executable) {
  const profile = join(dirname(fileURLToPath(import.meta.url)), `.browser-profile-${process.pid}-${Date.now()}`);
  await mkdir(profile);
  let socket;
  let processHandle;
  let session;
  let sequence = 0;
  const pending = new Map();
  const exceptions = [];
  const close = async () => {
    if (socket?.readyState === WebSocket.OPEN) {
      try { await send('Browser.close', {}, null); } catch { /* Chrome may close before acknowledging. */ }
    }
    socket?.close();
    if (processHandle && processHandle.exitCode === null) {
      await new Promise(resolve => {
        const timer = setTimeout(resolve, 3000);
        processHandle.once('exit', () => { clearTimeout(timer); resolve(); });
      });
      if (processHandle.exitCode === null) processHandle.kill();
    }
    for (const request of pending.values()) {
      clearTimeout(request.timer);
      request.reject(new Error('Browser closed'));
    }
    pending.clear();
    await rm(profile, { recursive: true, force: true, maxRetries: 8, retryDelay: 150 });
  };
  const send = (method, params = {}, sessionId = session) => new Promise((resolve, reject) => {
    const id = ++sequence;
    const timer = setTimeout(() => { pending.delete(id); reject(new Error(`CDP timeout: ${method}`)); }, 15000);
    pending.set(id, { resolve, reject, timer });
    socket.send(JSON.stringify({ id, method, params, ...(sessionId ? { sessionId } : {}) }));
  });
  try {
    processHandle = spawn(executable, [
      '--headless=new', '--disable-gpu', '--no-first-run', '--no-default-browser-check', '--disable-extensions',
      '--disable-background-networking', '--disable-component-update', '--remote-debugging-port=0',
      `--user-data-dir=${profile}`, 'about:blank',
    ], { stdio: 'ignore', windowsHide: true });
    let port;
    for (let attempt = 0; attempt < 100 && !port; attempt++) {
      try { port = Number((await readFile(join(profile, 'DevToolsActivePort'), 'utf8')).split('\n')[0]); }
      catch { await pause(100); }
    }
    if (!port) throw new Error('Isolated Chromium debugger did not start');
    const info = await (await fetch(`http://127.0.0.1:${port}/json/version`)).json();
    socket = new WebSocket(info.webSocketDebuggerUrl);
    socket.addEventListener('message', event => {
      const message = JSON.parse(event.data);
      if (message.method === 'Runtime.exceptionThrown') exceptions.push(message.params.exceptionDetails);
      const request = pending.get(message.id);
      if (request) {
        pending.delete(message.id);
        clearTimeout(request.timer);
        if (message.error) request.reject(new Error(JSON.stringify(message.error)));
        else request.resolve(message.result);
      }
    });
    await new Promise((resolve, reject) => {
      socket.addEventListener('open', resolve, { once: true });
      socket.addEventListener('error', reject, { once: true });
    });
    const target = await send('Target.createTarget', { url: 'about:blank' });
    session = (await send('Target.attachToTarget', { targetId: target.targetId, flatten: true })).sessionId;
    await send('Runtime.enable');
    await send('Page.enable');
    const evaluate = async expression => {
      const result = await send('Runtime.evaluate', { expression, awaitPromise: true, returnByValue: true });
      if (result.exceptionDetails) throw new Error(JSON.stringify(result.exceptionDetails));
      return result.result.value;
    };
    const wait = async expression => {
      for (let attempt = 0; attempt < 250; attempt++) {
        if (await evaluate(expression)) return;
        await pause(40);
      }
      throw new Error(`Browser condition timed out: ${expression}\n${await evaluate('document.body.innerText')}`);
    };
    const route = async hash => {
      await evaluate(`location.hash = ${JSON.stringify(hash)}`);
      await pause(40);
      await wait(`location.hash === ${JSON.stringify(hash)} && document.querySelector('main').getAttribute('aria-busy') === 'false'`);
      const error = await evaluate('document.querySelector("main .error-panel")?.textContent ?? ""');
      if (error) throw new Error(`Route ${hash}: ${error}`);
    };
    return { send, evaluate, wait, route, close, exceptions };
  } catch (error) {
    await close();
    throw error;
  }
}
