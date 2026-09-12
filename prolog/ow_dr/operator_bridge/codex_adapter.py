from __future__ import annotations

import asyncio
import json

from .adapter import AskPermission, Emit
from .journal import Journal
from .native import NativeCommand, NativeOutcome, trusted_cwd, verify_version
from .stdio_rpc import StdioRpc
from .workspace import BridgeError
from .write_guard import snapshot, unchanged


class CodexAdapter:
    provider = "codex"
    name = "codex-app-server-stdio"
    available = True

    def __init__(self, command: NativeCommand, journal: Journal, *, model: str | None = None,
                 rpc_factory=StdioRpc, version_probe=verify_version):
        self.command, self.journal, self.model = command, journal, model
        self.rpc_factory, self.version_probe = rpc_factory, version_probe
        self.rpc = None
        self.cwd = self.version = self.session_id = self.turn_id = None
        self.protocol_verified = False
        self.permission_handler: AskPermission | None = None
        self.events: asyncio.Queue | None = None
        self.terminal: asyncio.Future | None = None
        self.items: dict[str, dict] = {}
        self.stopping = False
        self.uncertain = False
        self.lifecycle = asyncio.Lock()

    async def connect(self, cwd: str):
        if self.rpc:
            trusted_cwd(cwd, self.cwd)
            if not self.protocol_verified or self.rpc.closed:
                raise BridgeError("native_transport_unknown", "Previous native startup or transport is unconfirmed; no automatic restart.")
            return
        self.version = await self.version_probe(self.command, cwd)
        if self.stopping:
            raise BridgeError("operator_stopped", "Operator was stopped before native runtime creation.")
        self.cwd = cwd
        self.rpc = self.rpc_factory(
            self.command.argv("app-server", "--listen", "stdio://"), cwd,
            self._notification, self._request)
        await self.rpc.start()
        self.journal.set("native_process", {"pids": self.rpc.tree.pids(), "cwd": cwd,
                                          "version": self.version, "owner": "bridge-stdio"})
        result = await self.rpc.call("initialize", {
            "clientInfo": {"name": "powder_operator", "title": "powder operator", "version": "1.0"},
            "capabilities": {"experimentalApi": False}})
        if not isinstance(result, dict) or not isinstance(result.get("userAgent"), str):
            raise BridgeError("native_protocol_mismatch", "Codex initialize response was not recognized.")
        await self.rpc.notify("initialized")
        self.protocol_verified = True

    async def start(self, resume_id: str | None, *, cwd: str) -> dict:
        async with self.lifecycle:
            return await self._start(resume_id, cwd=cwd)

    async def _start(self, resume_id: str | None, *, cwd: str) -> dict:
        if self.stopping:
            raise BridgeError("operator_stopped", "Operator was explicitly stopped.")
        await self.connect(cwd)
        if self.stopping or self.uncertain:
            raise BridgeError("native_outcome_unknown", "Native work is unconfirmed; do not start or replay another turn.")
        config = {"cwd": cwd, "approvalPolicy": "untrusted", "sandbox": "read-only",
                  "approvalsReviewer": "user"}
        if self.model:
            config["model"] = self.model
        creation = self.journal.get("native_creation")
        if not resume_id and creation and creation.get("state") == "confirmed":
            resume_id = creation.get("id")
        if resume_id:
            previous = await self.rpc.call("thread/read", {"threadId": resume_id, "includeTurns": False})
            self._validate_thread(previous.get("thread"), resume_id)
            result = await self.rpc.call("thread/resume", {"threadId": resume_id, **config})
        else:
            if self.journal.get("native_creation"):
                raise BridgeError("unconfirmed_native_session",
                    "A previous thread/start outcome is unknown. No second thread was created.")
            self.journal.set("native_creation", {"state": "requested"})
            result = await self.rpc.call("thread/start", {**config, "ephemeral": False})
        trusted_cwd(result.get("cwd"), cwd)
        if (result.get("approvalPolicy") != "untrusted" or result.get("approvalsReviewer") != "user"
                or not isinstance(result.get("sandbox"), dict)
                or result["sandbox"].get("type") != "readOnly"
                or result["sandbox"].get("networkAccess", False) is not False):
            raise BridgeError("native_policy_mismatch", "Codex did not confirm the requested human-reviewed read-only policy.")
        thread = result.get("thread")
        self._validate_thread(thread, resume_id)
        self.session_id = thread["id"]
        self.journal.set("native_creation", {"id": self.session_id, "state": "confirmed"})
        return {"sessionId": self.session_id, "cwd": cwd, "processCwd": self.cwd}

    def _validate_thread(self, thread, expected_id=None):
        if not isinstance(thread, dict) or not isinstance(thread.get("id"), str) or not thread["id"]:
            raise BridgeError("invalid_native_session", "Native thread identifier is missing.")
        if expected_id and thread["id"] != expected_id:
            raise BridgeError("invalid_native_session", "Native thread identifier changed unexpectedly.")
        trusted_cwd(thread.get("cwd"), self.cwd)
        branch = (thread.get("gitInfo") or {}).get("branch")
        if branch not in (None, "master"):
            raise BridgeError("session_branch_mismatch", "Native thread belongs to another branch.")
        if thread.get("ephemeral") is not False or (thread.get("status") or {}).get("type") not in ("idle", "notLoaded"):
            raise BridgeError("native_thread_not_idle", "Only verified idle durable threads may be attached.")

    async def _notification(self, method: str, params: dict):
        if method == "bridge/transportClosed":
            self.uncertain = True
            if self.terminal and not self.terminal.done():
                self.terminal.set_result("unknown")
            return
        if self.events is None or params.get("threadId") != self.session_id:
            return
        if method == "turn/started":
            announced = (params.get("turn") or {}).get("id")
            if isinstance(announced, str) and announced:
                if self.turn_id not in (None, announced):
                    self.uncertain = True
                    if not self.terminal.done():
                        self.terminal.set_result("unknown")
                else:
                    self.turn_id = announced
            return
        if method == "item/started":
            if self.turn_id is not None and params.get("turnId") != self.turn_id:
                return
            item = params.get("item") or {}
            if item.get("type") == "fileChange" and isinstance(item.get("id"), str):
                if len(self.items) >= 64:
                    self.uncertain = True
                    if not self.terminal.done():
                        self.terminal.set_result("unknown")
                    return
                self.items[item["id"]] = item
        if method not in ("item/completed", "turn/completed"):
            return
        try:
            self.events.put_nowait((method, params))
        except asyncio.QueueFull:
            self.uncertain = True
            if not self.terminal.done():
                self.terminal.set_result("unknown")

    async def _request(self, method: str, params: dict):
        eligible = (self.permission_handler is not None and not self.stopping
                    and params.get("threadId") == self.session_id
                    and params.get("turnId") == self.turn_id)
        if method in ("item/commandExecution/requestApproval", "item/fileChange/requestApproval"):
            if not eligible:
                return {"decision": "decline"}
            kind = "shell" if method.startswith("item/commandExecution") else "write"
            details = dict(params)
            before = None
            if kind == "shell":
                if not isinstance(params.get("command"), str) or not params["command"]:
                    return {"decision": "decline"}
                trusted_cwd(params.get("cwd"), self.cwd)
                if params.get("environmentId"):
                    return {"decision": "decline"}
            else:
                item = self.items.get(params.get("itemId"))
                if not item or not item.get("changes") or params.get("grantRoot"):
                    return {"decision": "decline"}
                details["proposedChanges"] = item["changes"]
                try:
                    before = snapshot([change.get("path") for change in item["changes"]], self.cwd)
                except (BridgeError, OSError):
                    return {"decision": "decline"}
            approved = await self.permission_handler(
                kind, f"Codex requests {kind} access", json.dumps(details, ensure_ascii=False, indent=2))
            if before is not None and not unchanged(before, self.cwd):
                self.journal.event("permission.stale", {"message": "File changed during review; native write was denied."})
                return {"decision": "decline"}
            return {"decision": "accept" if approved and not self.stopping else "decline"}
        if method == "item/permissions/requestApproval":
            # Broader permission-profile grants are not interchangeable with one-operation approval.
            return {"permissions": {}, "scope": "turn"}
        raise BridgeError("unsupported_native_request", "Native request is unsupported and was not approved.")

    async def send(self, text: str, emit: Emit, permission: AskPermission) -> None:
        if self.session_id is None or self.stopping or self.uncertain:
            raise BridgeError("native_outcome_unknown", "No verified idle native thread is available.")
        self.events = asyncio.Queue(maxsize=64)
        self.terminal = asyncio.get_running_loop().create_future()
        self.turn_id = None
        self.permission_handler = permission
        self.items.clear()
        try:
            result = await self.rpc.call("turn/start", {
                "threadId": self.session_id, "input": [{"type": "text", "text": text}],
                "cwd": self.cwd, "approvalPolicy": "untrusted", "approvalsReviewer": "user",
                "sandboxPolicy": {"type": "readOnly", "networkAccess": False}})
            turn = result.get("turn") or {}
            if not isinstance(turn.get("id"), str) or not turn["id"]:
                raise BridgeError("native_protocol_mismatch", "Native turn identifier is missing.")
            if self.turn_id not in (None, turn["id"]):
                raise BridgeError("native_protocol_mismatch", "Native turn announcement disagreed with its reply.")
            self.turn_id = turn["id"]
            self.journal.set("native_last_dispatch", {"threadId": self.session_id, "turnId": self.turn_id})
            while not self.terminal.done():
                task = asyncio.create_task(self.events.get())
                try:
                    done, _ = await asyncio.wait((task, self.terminal), timeout=3600,
                                                 return_when=asyncio.FIRST_COMPLETED)
                    if not done:
                        self.terminal.set_result("unknown")
                    elif task in done:
                        method, params = task.result()
                        if method == "turn/completed":
                            current = params.get("turn") or {}
                            if current.get("id") == self.turn_id and not self.terminal.done():
                                state = {"completed": "complete", "interrupted": "cancelled",
                                         "failed": "failed"}.get(current.get("status"), "unknown")
                                self.terminal.set_result(state)
                        elif params.get("turnId") == self.turn_id:
                            item = params.get("item") or {}
                            if item.get("type") == "agentMessage" and isinstance(item.get("text"), str):
                                await emit(item["text"])
                finally:
                    if not task.done():
                        task.cancel()
                    await asyncio.gather(task, return_exceptions=True)
            state = self.terminal.result()
            if state != "complete":
                raise NativeOutcome(state)
        except BaseException as error:
            if not isinstance(error, NativeOutcome) or error.state == "unknown":
                self.uncertain = True
            raise
        finally:
            self.permission_handler = None
            self.events = None
            self.items.clear()

    async def cancel(self) -> bool:
        if self.turn_id is None or self.terminal is None or self.terminal.done():
            return False
        await self.rpc.call("turn/interrupt", {"threadId": self.session_id, "turnId": self.turn_id}, timeout=15)
        try:
            return await asyncio.wait_for(asyncio.shield(self.terminal), 15) == "cancelled"
        except asyncio.TimeoutError:
            self.uncertain = True
            return False

    async def stop(self):
        self.stopping = True
        async with self.lifecycle:
            if self.rpc:
                await self.rpc.stop()
            if self.terminal and not self.terminal.done():
                self.terminal.set_result("cancelled")
            self.session_id = None

    def status(self) -> dict:
        return {"name": self.name, "provider": self.provider, "available": True,
                "connected": self.session_id is not None and not self.stopping and not self.uncertain,
                "sessionId": self.session_id, "ownedPids": self.rpc.tree.pids() if self.rpc else [],
                "resumeSupported": True, "cliVersion": self.version,
                "protocolVerified": self.protocol_verified, "authentication": "native_cli_managed",
                "model": self.model, "modelSource": "operator" if self.model else "native_cli_default",
                "approvalPolicy": "untrusted", "sandbox": "read-only"}
