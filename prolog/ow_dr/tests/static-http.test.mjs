import test from "node:test";
import assert from "node:assert/strict";
import { spawn } from "node:child_process";
import { createConnection } from "node:net";
import { createInterface } from "node:readline";
import { once } from "node:events";
import { fileURLToPath } from "node:url";
import { readFile } from "node:fs/promises";
import { performance } from "node:perf_hooks";

const fixture = fileURLToPath(new URL("./static_http_fixture.pl", import.meta.url));
const base = "/swish/openworld_dr/";

async function listener(mode) {
  const child = spawn("swipl", ["-q", "-s", fixture, "--", mode], {
    stdio: ["pipe", "pipe", "pipe"], windowsHide: true,
  });
  let diagnostics = "";
  child.stderr.on("data", data => { diagnostics += data; });
  const lines = createInterface({ input: child.stdout });
  let timer;
  try {
    const port = await new Promise((resolve, reject) => {
      timer = setTimeout(() => reject(new Error(`Listener startup timed out: ${diagnostics}`)), 15000);
      child.once("error", reject);
      child.once("exit", code => reject(new Error(`Listener exited ${code}: ${diagnostics}`)));
      lines.on("line", line => {
        const match = /^STATIC_TEST_PORT=(\d+)$/.exec(line);
        if (match) resolve(Number(match[1]));
      });
    });
    return {
      port,
      async close() {
        const stopped = once(child, "exit");
        child.stdin.end("stop\n");
        const timeout = setTimeout(() => child.kill(), 5000);
        try { await stopped; } finally { clearTimeout(timeout); lines.close(); }
      },
    };
  } catch (error) {
    child.kill();
    lines.close();
    throw error;
  } finally { clearTimeout(timer); }
}

function request(port, path, connection = "keep-alive", method = "GET") {
  const started = performance.now();
  const socket = createConnection({ host: "127.0.0.1", port });
  return new Promise((resolve, reject) => {
    let data = Buffer.alloc(0), firstByte, headerEnd = -1, headers, status;
    const timer = setTimeout(() => { socket.destroy(); reject(new Error(`Timed out: ${path}`)); }, 8000);
    socket.on("error", error => { clearTimeout(timer); reject(error); });
    socket.once("connect", () => socket.write(
      `${method} ${path} HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nConnection: ${connection}\r\n\r\n`));
    const consume = chunk => {
      firstByte ??= performance.now();
      data = Buffer.concat([data, chunk]);
      if (headerEnd < 0) {
        headerEnd = data.indexOf("\r\n\r\n");
        if (headerEnd < 0) return;
        const [start, ...fields] = data.subarray(0, headerEnd).toString("latin1").split("\r\n");
        status = Number(start.split(" ")[1]);
        headers = Object.fromEntries(fields.map(field => {
          const colon = field.indexOf(":");
          return [field.slice(0, colon).toLowerCase(), field.slice(colon + 1).trim()];
        }));
      }
      const length = method === "HEAD" ? 0 : Number(headers["content-length"]);
      if (!Number.isFinite(length)) {
        clearTimeout(timer); socket.destroy();
        reject(new Error(`Fixture expected Content-Length for ${path}`));
      } else if (data.length >= headerEnd + 4 + length) {
        clearTimeout(timer);
        socket.off("data", consume);
        socket.resume();
        resolve({
          socket, status, headers,
          body: data.subarray(headerEnd + 4, headerEnd + 4 + length),
          ttfbMs: firstByte - started, totalMs: performance.now() - started,
        });
      }
    };
    socket.on("data", consume);
  });
}

async function saturation(mode) {
  const server = await listener(mode), sockets = [];
  try {
    const held = [];
    for (const name of ["paths.json", "settings.js", "app.js", "paths.json"]) {
      const response = await request(server.port, `${base}${name}`);
      sockets.push(response.socket); held.push(response);
      assert.equal(response.status, 200);
    }
    const fifth = await request(server.port, `${base}paths.json`, "close");
    sockets.push(fifth.socket);
    assert.equal(fifth.status, 200);
    assert.deepEqual(fifth.body, await readFile(new URL("../web/paths.json", import.meta.url)));
    for (const socket of sockets) socket.destroy();
    const metricsResponse = await request(server.port, "/__static_fixture_metrics", "close");
    sockets.push(metricsResponse.socket);
    const metrics = JSON.parse(metricsResponse.body);
    assert.equal(metrics.activity.leased, true, "Static requests must not enter application admission");
    assert.equal(metrics.native.generation, 0);
    assert.equal(metrics.native.files.length, 0);
    assert.equal(metrics.samples.length, 5);
    return { held, fifth, metrics };
  } finally {
    for (const socket of sockets) socket.destroy();
    await server.close();
  }
}

test("idle keep-alive clients cause a native worker queue delay, not slow static handlers", async t => {
  const result = await saturation("keep_alive");
  assert.ok(result.fifth.ttfbMs >= 1500, `Control did not reproduce the two-second wait: ${result.fifth.ttfbMs}`);
  assert.ok(result.metrics.samples.every(sample => sample.handlerMs < 500));
  t.diagnostic(JSON.stringify({
    controlledKeepAliveTTFBMs: result.fifth.ttfbMs,
    handlerMs: result.metrics.samples.map(sample => sample.handlerMs),
  }));
});

test("completed static responses release HTTP workers without changing KB or pool settings", async t => {
  const result = await saturation("actual");
  for (const response of result.held) {
    assert.equal(response.headers.connection?.toLowerCase(), "close");
    assert.equal(response.headers["cache-control"], "no-store");
  }
  assert.ok(result.fifth.ttfbMs < 750, `Static worker queue still stalled: ${result.fifth.ttfbMs}`);
  assert.ok(result.metrics.samples.every(sample => sample.handlerMs < 500));
  t.diagnostic(JSON.stringify({
    actualTTFBMs: result.fifth.ttfbMs,
    handlerMs: result.metrics.samples.map(sample => sample.handlerMs),
  }));
});

test("static transport preserves MIME, HEAD and cache headers and leaves API transport unchanged", async () => {
  const server = await listener("actual"), sockets = [];
  try {
    const head = await request(server.port, `${base}paths.json`, "keep-alive", "HEAD");
    sockets.push(head.socket);
    assert.equal(head.status, 200);
    assert.equal(head.body.length, 0);
    assert.match(head.headers["content-type"], /^application\/json\b/);
    assert.equal(head.headers.connection.toLowerCase(), "close");
    assert.equal(head.headers["cache-control"], "no-store");
    const script = await request(server.port, `${base}settings.js`);
    sockets.push(script.socket);
    assert.match(script.headers["content-type"], /^application\/javascript\b/);
    assert.deepEqual(script.body, await readFile(new URL("../web/settings.js", import.meta.url)));
    const status = await request(server.port, `${base}api/status`);
    sockets.push(status.socket);
    assert.equal(status.status, 200);
    assert.equal(status.headers.connection.toLowerCase(), "keep-alive");
    assert.equal(JSON.parse(status.body).generation, 0);
    assert.deepEqual(JSON.parse(status.body).files, []);
  } finally {
    for (const socket of sockets) socket.destroy();
    await server.close();
  }
});
