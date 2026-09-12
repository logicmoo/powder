from __future__ import annotations

import asyncio
import json
import os
import subprocess
import uuid
from collections import OrderedDict

from .native import NativeTree
from .workspace import BridgeError


class StdioRpc:
    """Codex's documented newline JSON transport; never a WebSocket or shell."""
    def __init__(self, argv: list[str], cwd: str, notification, request, *, tree=None):
        self.argv, self.cwd = argv, cwd
        self.notification, self.request_handler = notification, request
        self.process = None
        self.tree = tree or NativeTree()
        self.pending: dict[str, asyncio.Future] = {}
        self.requests: dict[str, tuple[str, asyncio.Task]] = {}
        self.responses = OrderedDict()
        self.writer = asyncio.Lock()
        self.reader_task = self.stderr_task = None
        self.closed = False

    async def start(self):
        self.process = await asyncio.create_subprocess_exec(
            *self.argv, cwd=self.cwd, stdin=asyncio.subprocess.PIPE,
            stdout=asyncio.subprocess.PIPE, stderr=asyncio.subprocess.PIPE,
            limit=1024 * 1024, creationflags=(subprocess.CREATE_NO_WINDOW if os.name == "nt" else 0))
        self.tree.attach(self.process)
        self.reader_task = asyncio.create_task(self._read(), name="codex-private-rpc")
        self.stderr_task = asyncio.create_task(self._discard_stderr(), name="codex-private-diagnostics")

    async def _discard_stderr(self):
        # Native diagnostic streams may contain private paths or credentials. Never journal them.
        while await self.process.stderr.read(65536):
            pass

    async def write(self, message: dict):
        payload = json.dumps(message, ensure_ascii=False, separators=(",", ":")).encode("utf-8") + b"\n"
        if len(payload) > 1024 * 1024:
            raise BridgeError("native_message_too_large", "Native transport limit exceeded.")
        async with self.writer:
            if self.closed or self.process is None or self.process.returncode is not None:
                raise BridgeError("native_transport_closed", "Native transport is closed; outcome unknown.")
            self.process.stdin.write(payload)
            await asyncio.wait_for(self.process.stdin.drain(), 15)

    async def call(self, method: str, params: dict, timeout: float = 30):
        if len(self.pending) >= 32:
            raise BridgeError("native_requests_full", "Native request capacity exceeded.")
        request_id = "powder-" + str(uuid.uuid4())
        future = asyncio.get_running_loop().create_future()
        self.pending[request_id] = future
        try:
            await self.write({"id": request_id, "method": method, "params": params})
            return await asyncio.wait_for(future, timeout)
        finally:
            self.pending.pop(request_id, None)
            if not future.done():
                future.cancel()

    async def notify(self, method: str):
        await self.write({"method": method})

    async def _serve(self, request_id, key: str, fingerprint: str, method: str, params: dict):
        try:
            result = await self.request_handler(method, params)
            response = {"id": request_id, "result": result}
        except asyncio.CancelledError:
            raise
        except Exception:
            response = {"id": request_id, "error": {"code": -32601, "message": "Unsupported or denied native request."}}
        self.responses[key] = (fingerprint, response)
        if len(self.responses) > 128:
            self.responses.popitem(last=False)
        try:
            await self.write(response)
        except Exception:
            self.closed = True
            await self.notification("bridge/transportClosed", {})
        finally:
            self.requests.pop(key, None)

    async def _read(self):
        try:
            while line := await self.process.stdout.readline():
                message = json.loads(line)
                if not isinstance(message, dict):
                    raise ValueError("invalid native envelope")
                if "method" in message:
                    method, params = message["method"], message.get("params") or {}
                    if not isinstance(method, str) or not isinstance(params, dict):
                        raise ValueError("invalid native method")
                    if "id" not in message:
                        await self.notification(method, params)
                        continue
                    request_id = message["id"]
                    if type(request_id) not in (str, int):
                        raise ValueError("invalid request id")
                    key = json.dumps(request_id)
                    fingerprint = json.dumps([method, params], sort_keys=True)
                    existing = self.requests.get(key) or self.responses.get(key)
                    if existing and existing[0] != fingerprint:
                        raise ValueError("native request id reused with different input")
                    if key in self.responses:
                        await self.write(self.responses[key][1])
                    elif key not in self.requests:
                        if len(self.requests) >= 32:
                            raise ValueError("too many pending native requests")
                        task = asyncio.create_task(self._serve(request_id, key, fingerprint, method, params))
                        self.requests[key] = (fingerprint, task)
                elif "id" in message:
                    future = self.pending.get(message["id"])
                    if future is not None and not future.done():
                        if "error" in message:
                            future.set_exception(BridgeError("native_request_failed", "Native request failed; details stay in the native client."))
                        elif "result" in message:
                            future.set_result(message["result"])
                        else:
                            raise ValueError("invalid native response")
        except asyncio.CancelledError:
            raise
        except Exception:
            pass
        finally:
            self.closed = True
            for future in self.pending.values():
                if not future.done():
                    future.set_exception(BridgeError("native_transport_closed", "Native transport ended; outcome unknown."))
            for _, task in self.requests.values():
                task.cancel()
            await self.notification("bridge/transportClosed", {})

    async def stop(self):
        self.closed = True
        self.tree.stop()
        if self.process:
            await asyncio.wait_for(self.process.wait(), 15)
            self.process.stdin.close()
        tasks = [self.reader_task, self.stderr_task, *(task for _, task in self.requests.values())]
        for task in tasks:
            if task:
                task.cancel()
        await asyncio.gather(*(task for task in tasks if task), return_exceptions=True)
