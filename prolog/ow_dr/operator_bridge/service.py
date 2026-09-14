from __future__ import annotations

import asyncio
import os
import uuid
from collections.abc import Callable
from pathlib import Path

from .adapter import OperatorAdapter
from .journal import Journal
from .security import public_text
from .providers import provider_label
from .native import NativeOutcome
from .workspace import BridgeError, Workspace


class OperatorService:
    def __init__(self, journal: Journal, workspace: Workspace, adapter: OperatorAdapter,
                 *, verify: Callable[[], None] | None = None, adapter_factory=None):
        self.journal, self.workspace, self.adapter = journal, workspace, adapter
        self.provider = journal.provider
        if adapter.provider != self.provider:
            raise BridgeError("adapter_provider_mismatch", "Native adapters, authentication and sessions cannot cross providers.")
        self.verify = verify or workspace.verify
        self.adapter_factory = adapter_factory
        self.instance_id = str(uuid.uuid4())
        self.connections: dict[str, int] = {}
        self.waiters: dict[str, asyncio.Future] = {}
        self.queue: asyncio.Queue = asyncio.Queue()
        self.control_lock = asyncio.Lock()
        self.changed = asyncio.Condition()
        self.active: str | None = None
        self.task: asyncio.Task | None = None
        self.connected = False
        self.stopped = False
        self.closed = False
        self.stop_outcome = None
        self.journal.set("bridge_process", {"pid": os.getpid(), "instanceId": self.instance_id})
        self.app = {"configured": False, "online": False, "identityVerified": False,
                    "restartAvailable": False, "message": "Prolog is not registered with this bridge."}

    async def run(self) -> None:
        self.task = asyncio.create_task(self._worker(), name=f"operator-dispatch-{self.provider}")

    async def notify(self) -> None:
        async with self.changed:
            self.changed.notify_all()

    def native_session_id(self):
        return self.journal.get("native_session_id") or (
            self.journal.get("sdk_session_id") if self.provider == "copilot" else None)

    def attach(self, principal: str) -> None:
        self.connections[principal] = self.connections.get(principal, 0) + 1

    def detach(self, principal: str) -> None:
        count = self.connections.get(principal, 0)
        if count <= 1:
            self.connections.pop(principal, None)
        else:
            self.connections[principal] = count - 1

    def human(self, principal: str) -> None:
        if not self.connections.get(principal):
            raise BridgeError("browser_disconnected", "Connect the operator view before sending input.")

    def validate_payload(self, payload: dict) -> tuple[str, str]:
        if set(payload) - {"id", "kind", "text", "startAnyway"}:
            raise BridgeError("unsupported_fields", "Provider, process and thread working directories are server-owned.", 400)
        kind = payload.get("kind")
        if kind not in ("start_session", "prompt"):
            raise BridgeError("unsupported_command", "Only operator session start or prompt is supported.", 400)
        text = payload.get("text", "")
        if not isinstance(text, str) or len(text) > 65536 or (kind == "prompt" and not text.strip()):
            raise BridgeError("invalid_prompt", "Supply 1–65536 characters.", 400)
        if "startAnyway" in payload and (kind != "start_session" or type(payload["startAnyway"]) is not bool):
            raise BridgeError("invalid_start_confirmation", "Start anyway is a boolean session-start acknowledgement only.", 400)
        return kind, text

    async def submit(self, principal: str, payload: dict) -> dict:
        self.human(principal)
        kind, text = self.validate_payload(payload)
        self.verify()
        previous = self.journal.existing(payload.get("id"), kind, text)
        if previous is not None:
            return previous
        if self.stopped and kind == "start_session" and self.stop_outcome == "confirmed" and self.adapter_factory:
            replacement = self.adapter_factory()
            if replacement.provider != self.provider or not replacement.available:
                raise BridgeError("adapter_unavailable", "The selected native provider cannot be restarted.", 503)
            self.adapter = replacement
            self.stopped = False
            self.stop_outcome = None
            self.connected = False
        if self.stopped or not self.adapter.available:
            raise BridgeError("adapter_unavailable", f"No live {self.provider} adapter is connected.", 503)
        command, created = self.journal.submit(payload.get("id"), kind, text)
        if created:
            self.queue.put_nowait((command["id"], kind, text, principal))
            await self.notify()
        return command

    async def _worker(self) -> None:
        while True:
            command_id, kind, text, principal = await self.queue.get()
            dispatched = False
            try:
                if self.journal.command(command_id)["state"] != "queued":
                    continue
                if self.stopped:
                    self.journal.state(command_id, "cancelled", "Operator was explicitly stopped.")
                    continue
                self.verify()
                self.active = command_id
                self.journal.state(command_id, "running")
                await self.notify()
                self.human(principal)
                if kind == "start_session":
                    if self.connected:
                        session = {"sessionId": self.native_session_id(),
                                   "cwd": self.workspace.root, "processCwd": self.workspace.root}
                    else:
                        dispatched = True
                        session = await self.adapter.start(self.native_session_id(), cwd=self.workspace.root)
                    native_cwd = session.get("cwd")
                    process_cwd = session.get("processCwd")
                    if (not isinstance(native_cwd, str) or not isinstance(process_cwd, str)
                            or Path(native_cwd).resolve() != Path(self.workspace.root).resolve()
                            or Path(process_cwd).resolve() != Path(self.workspace.root).resolve()):
                        raise BridgeError("session_workspace_mismatch",
                            "Native session/thread working directory is unverified or belongs to another repository. No prompt was sent.")
                    session_id = session.get("sessionId")
                    if not isinstance(session_id, str) or not session_id:
                        raise BridgeError("invalid_session", "Adapter did not return a documented session identifier.")
                    self.journal.set("native_session_id", session_id)
                    if self.provider == "copilot":
                        self.journal.set("sdk_session_id", session_id)
                    self.connected = True
                    self.journal.event("session.connected", {"sessionId": session_id, "adapter": self.adapter.name})
                else:
                    if not self.connected:
                        raise BridgeError("session_not_started", "Start or explicitly resume the operator session first.")
                    dispatched = True
                    await self.adapter.send(text, self.output, self.permission)
                if self.journal.command(command_id)["state"] in ("running", "awaiting_permission"):
                    self.journal.state(command_id, "complete")
            except asyncio.CancelledError:
                if self.active:
                    self.journal.state(command_id, "unknown", "Bridge dispatch was interrupted; no automatic retry.")
                raise
            except NativeOutcome as outcome:
                self.journal.state(command_id, outcome.state, outcome.message)
                if outcome.state == "unknown":
                    self.connected = False
            except BridgeError as error:
                self.journal.state(command_id, "unknown" if dispatched else "failed", error.message)
                if dispatched:
                    self.connected = False
            except Exception:
                # Do not serialize arbitrary SDK exceptions: they may contain credentials.
                self.journal.state(command_id, "unknown", "Adapter outcome is unknown. Inspect the native session; do not resend.")
                self.connected = False
            finally:
                self._expire_permissions()
                self.active = None
                self.queue.task_done()
                await self.notify()

    async def output(self, text: str) -> None:
        self.journal.event("assistant.output", {"commandId": self.active, "source": self.provider,
                                              "text": public_text(text)})
        await self.notify()

    async def permission(self, kind: str, title: str, detail: str) -> bool:
        if self.active is None or self.stopped:
            return False
        if (len(title) > 200 or len(detail) > 4096
                or public_text(title) != title or public_text(detail) != detail):
            self.journal.event("permission.denied", {"commandId": self.active,
                "message": "Permission details cannot be exposed completely and safely; denied."})
            await self.notify()
            return False
        request_id = str(uuid.uuid4())
        future = asyncio.get_running_loop().create_future()
        self.waiters[request_id] = future
        self.journal.permission(request_id, self.active, public_text(kind, 80), title, detail)
        await self.notify()
        try:
            # A disconnected browser never approves. The native SDK callback remains paused.
            return await future
        finally:
            self.waiters.pop(request_id, None)
            if not self.closed and self.journal.decision(request_id) == "pending":
                self.journal.decide(request_id, "interrupted")

    def _expire_permissions(self) -> None:
        for request_id, future in list(self.waiters.items()):
            if self.journal.decision(request_id) == "pending":
                self.journal.decide(request_id, "interrupted")
            if not future.done():
                future.set_result(False)

    async def decide(self, principal: str, request_id: str, decision: str) -> dict:
        self.human(principal)
        self.verify()
        if decision not in ("allow", "deny"):
            raise BridgeError("invalid_decision", "Choose allow or deny.", 400)
        previous = self.journal.decision(request_id)
        if previous == decision:
            return {"id": request_id, "decision": decision}
        future = self.waiters.get(request_id)
        if future is None:
            raise BridgeError("permission_not_live", "This request has no live native callback; it cannot be resumed.")
        changed = self.journal.decide(request_id, decision)
        if changed and not future.done():
            future.set_result(decision == "allow")
            if self.active:
                state = "awaiting_permission" if any(not item.done() for item in self.waiters.values()) else "running"
                self.journal.state(self.active, state)
        await self.notify()
        return {"id": request_id, "decision": decision}

    async def cancel(self, principal: str, command_id: str) -> dict:
        async with self.control_lock:
            return await self._cancel(principal, command_id)

    async def _cancel(self, principal: str, command_id: str) -> dict:
        self.human(principal)
        command = self.journal.command(command_id)
        if command["state"] == "queued":
            self.journal.state(command_id, "cancelled", "Cancelled before dispatch.")
        elif command["state"] in ("running", "awaiting_permission"):
            for request_id, future in list(self.waiters.items()):
                if not future.done():
                    self.journal.decide(request_id, "deny")
                    future.set_result(False)
            try:
                confirmed = await self.adapter.cancel()
            except Exception:
                confirmed = False
            if self.journal.command(command_id)["state"] in ("running", "awaiting_permission"):
                self.journal.state(command_id, "cancelled" if confirmed else "unknown",
                                   "Cancellation confirmed." if confirmed else "Cancellation outcome is unknown; do not resend.")
        await self.notify()
        return self.journal.command(command_id)

    async def stop_operator(self, principal: str, confirmation: str) -> dict:
        async with self.control_lock:
            return await self._stop_operator(principal, confirmation)

    async def _stop_operator(self, principal: str, confirmation: str) -> dict:
        self.human(principal)
        if confirmation != "STOP OPERATOR":
            raise BridgeError("confirmation_required", "Confirm STOP OPERATOR.", 400)
        if self.stopped:
            return self.status()
        self.stopped = True
        self.stop_outcome = "pending"
        for command in self.journal.commands():
            if command["state"] == "queued":
                self.journal.state(command["id"], "cancelled", "Operator explicitly stopped.")
        for request_id, future in list(self.waiters.items()):
            if not future.done():
                self.journal.decide(request_id, "deny")
                future.set_result(False)
        try:
            await self.adapter.stop()
        except Exception:
            self.stop_outcome = "unknown"
            self.journal.event("operator.stop_unknown",
                {"message": "Native stop outcome is unknown. Inspect the owned session; no automatic retry."})
            await self.notify()
            return self.status()
        self.stop_outcome = "confirmed"
        self.connected = False
        self.journal.event("operator.stopped", {"message": "Operator stopped explicitly. Bridge recovery view remains available."})
        await self.notify()
        return self.status()

    def status(self) -> dict:
        adapter = self.adapter.status()
        state = ("awaiting_permission" if self.waiters else "busy" if self.active
                 else "idle" if self.connected and not self.stopped else "offline")
        if state == "idle" and adapter.get("connected") is False:
            state = "offline"
        return {"schema": "powder.operator.v1", "agentType": "operator", "provider": self.provider,
                "name": provider_label(self.provider), "role": provider_label(self.provider),
                "outputSource": self.provider,
                "state": state, "stopped": self.stopped, "stopOutcome": self.stop_outcome,
                "canRestart": self.stopped and self.stop_outcome == "confirmed" and self.adapter_factory is not None,
                "bridge": {"online": True, "pid": os.getpid(), "instanceId": self.instance_id},
                "workspace": self.workspace.json(), "conversationId": self.journal.get("conversation_id"),
                "nativeSessionId": self.native_session_id(),
                "sdkSessionId": self.native_session_id() if self.provider == "copilot" else None,
                "adapter": adapter,
                "application": self.app, "lastSequence": self.journal.latest(),
                "permissions": self.journal.pending(), "commands": self.journal.commands()}

    async def update_application(self, state: dict) -> None:
        self.app = state
        self.journal.event("application.availability", state)
        await self.notify()

    def draft(self, text: str | None = None) -> dict:
        if text is not None:
            if not isinstance(text, str) or len(text) > 65536:
                raise BridgeError("invalid_draft", "Draft is too long.", 400)
            self.journal.set("operator_draft", public_text(text))
        return {"text": self.journal.get("operator_draft") or ""}

    async def close(self) -> None:
        # Transport/bridge cleanup is NOT permission to stop the independent native CLI.
        if self.closed:
            return
        self._expire_permissions()
        if self.task:
            self.task.cancel()
            try:
                await self.task
            except asyncio.CancelledError:
                pass
        self.closed = True
        self.journal.close()
