from __future__ import annotations

import asyncio
import os
import inspect
import re
import time
import uuid
from collections.abc import Callable
from pathlib import Path

from .adapter import OperatorAdapter
from .journal import Journal
from .conversations import ConversationCatalog
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
        self.catalog = ConversationCatalog(journal, workspace)
        self.journal = self.catalog.open(self.catalog.selected())
        if self.journal.get("conversation_settings") is None:
            self.journal.set("conversation_settings", {"model": getattr(adapter, "model", None)})
        if hasattr(adapter, "journal"):
            adapter.journal = self.journal
        if hasattr(adapter, "model"):
            adapter.model = self.settings()["model"]
        self.instance_id = str(uuid.uuid4())
        self.connections: dict[str, int] = {}
        self.waiters: dict[str, asyncio.Future] = {}
        self.queue: asyncio.Queue = asyncio.Queue()
        self.control_lock = asyncio.Lock()
        self.changed = asyncio.Condition()
        self.active: str | None = None
        self.branching = False
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

    def require_conversation(self, expected):
        if expected != self.journal.get("conversation_id"):
            raise BridgeError("conversation_changed", "The selected conversation changed. Refresh before acting.", 409)

    def _gate_selection(self):
        pending = self.journal.db.execute(
            "SELECT 1 FROM commands WHERE state IN ('queued','running','awaiting_permission') LIMIT 1").fetchone()
        if (self.active or self.waiters or not self.queue.empty() or pending
                or self.journal.get("unsettled_native")
                or (getattr(self.adapter, "uncertain", False) and self.stop_outcome != "confirmed")):
            raise BridgeError("conversation_busy", "Finish/cancel work and resolve permissions or unknown outcomes before switching.", 409)
        if self.stop_outcome == "unknown":
            raise BridgeError("conversation_busy", "Native stop outcome is unknown; switching is blocked.", 409)

    def settings(self):
        return {"conversationId": self.journal.get("conversation_id"),
                **(self.journal.get("conversation_settings") or {"model": None})}

    def conversations(self):
        return {"provider": self.provider, "conversationId": self.journal.get("conversation_id"),
                "selectionRevision": self.catalog.revision(),
                "items": self.catalog.entries()}

    def branch_capability(self):
        supported = self.provider == "codex" and hasattr(self.adapter, "fork") and self.adapter.available
        unsettled = bool(self.active or self.waiters or not self.queue.empty() or self.branching
                         or self.journal.get("unsettled_native") or self.stop_outcome == "unknown"
                         or (self.stopped and self.adapter_factory is None)
                         or (getattr(self.adapter, "uncertain", False) and self.stop_outcome != "confirmed"))
        reason = ("Copilot SDK 1.0.13 exposes no public conversation fork; prompts are never replayed to imitate one."
                  if self.provider == "copilot" else "Native Codex adapter is unavailable." if not supported
                  else "Start this native conversation before branching." if not self.native_session_id()
                  else "Finish active work or resolve uncertain outcomes before branching." if unsettled
                  else "Copies native history into a new thread; no prompt is sent and inherited goals are deferred.")
        return {"supported": supported, "ready": bool(supported and self.native_session_id() and not unsettled),
                "reason": reason}

    def _replacement_adapter(self, journal):
        if not self.adapter_factory:
            raise BridgeError("adapter_unavailable", "Restart this bridge to replace a stopped native adapter.", 409)
        parameters = inspect.signature(self.adapter_factory).parameters
        replacement = (self.adapter_factory(journal=journal, model=journal.get("conversation_settings")["model"])
                       if "journal" in parameters else self.adapter_factory())
        if replacement.provider != self.provider:
            raise BridgeError("adapter_provider_mismatch", "Native provider identity changed.")
        if hasattr(replacement, "journal"):
            replacement.journal = journal
        if hasattr(replacement, "model"):
            replacement.model = journal.get("conversation_settings")["model"]
        return replacement

    async def _bind_journal(self, journal):
        if journal.get("branch_from") and journal.get("branch_state") != "complete":
            raise BridgeError("branch_incomplete", "This native branch is unconfirmed. It will not be recreated or used as a blank conversation.")
        model = journal.get("conversation_settings")["model"]
        if self.stopped:
            self.adapter = self._replacement_adapter(journal)
        elif hasattr(self.adapter, "select_conversation"):
            try:
                await self.adapter.select_conversation(journal, model)
            except BaseException as error:
                self.connected = False
                self.adapter.uncertain = True
                self.journal.set("unsettled_native", True)
                if isinstance(error, asyncio.CancelledError):
                    raise
                raise BridgeError("conversation_detach_failed", "Native detach was not confirmed. Selection is unchanged.") from None
        elif self.connected:
            raise BridgeError("conversation_switch_unsupported", "This adapter cannot safely detach a live session.")
        previous = self.journal
        try:
            self.catalog.select(journal.get("conversation_id"))
        except BaseException:
            self.connected = False
            if hasattr(self.adapter, "select_conversation"):
                await self.adapter.select_conversation(previous, previous.get("conversation_settings")["model"])
            raise
        self.journal = journal
        self.connected = self.stopped = False
        self.stop_outcome = None
        if previous is not journal and previous is not self.catalog.legacy:
            previous.close()

    async def select_conversation(self, principal, expected, identifier, *, create=False, title=None):
        async with self.control_lock:
            self.human(principal)
            if create and identifier == self.journal.get("conversation_id"):
                return self.conversations()
            self.require_conversation(expected)
            self._gate_selection()
            if identifier == expected:
                return self.conversations()
            target = (self.catalog.create(identifier, title, {"model": self.settings()["model"]})
                      if create else self.catalog.open(identifier))
            if target.get("conversation_settings") is None:
                target.set("conversation_settings", {"model": None})
            try:
                await self._bind_journal(target)
            except BaseException:
                if target is not self.catalog.legacy and target is not self.journal:
                    target.close()
                raise
            await self.notify()
            return self.conversations()

    async def save_settings(self, principal, expected, model):
        async with self.control_lock:
            self.human(principal)
            self.require_conversation(expected)
            self._gate_selection()
            if model is not None and (not isinstance(model, str) or not re.fullmatch(r"[A-Za-z0-9][A-Za-z0-9._/:+-]{0,159}", model)):
                raise BridgeError("invalid_model", "Use a provider model ID or null for its native default.", 400)
            previous = self.journal.get("conversation_settings")
            self.journal.set("conversation_settings", {"model": model})
            try:
                await self._bind_journal(self.journal)
            except BaseException:
                self.journal.set("conversation_settings", previous)
                raise
            await self.notify()
            return self.settings()

    async def branch_conversation(self, principal, expected, identifier):
        async with self.control_lock:
            self.human(principal)
            if identifier == self.journal.get("conversation_id") and self.journal.get("branch_from"):
                if self.journal.get("branch_from")["conversationId"] == expected:
                    return self.conversations()
            self.require_conversation(expected)
            if not self.branch_capability()["supported"]:
                raise BridgeError("branch_unsupported", self.branch_capability()["reason"], 409)
            self._gate_selection()
            source_id = self.native_session_id()
            if not source_id:
                raise BridgeError("native_session_required", "Start this native conversation before branching.", 409)
            self.verify()
            if self.catalog.contains(identifier):
                target = self.catalog.open(identifier)
                provenance = target.get("branch_from") or {}
                if provenance.get("conversationId") != expected or provenance.get("nativeSessionId") != source_id:
                    if target is not self.catalog.legacy:
                        target.close()
                    raise BridgeError("branch_identity_conflict", "That identifier does not belong to this branch request.", 409)
                if target.get("branch_state") != "complete":
                    target.close()
                    raise BridgeError("branch_outcome_unknown", "A previous branch attempt is incomplete. It is not retried.", 409)
            else:
                title = next(item["title"] for item in self.catalog.entries() if item["id"] == expected)
                target = self.catalog.create(identifier, ("Branch of " + title)[:120], {"model": self.settings()["model"]},
                    branch_from={"conversationId": expected, "nativeSessionId": source_id,
                                 "sequence": self.journal.latest(), "created": time.time()})
            self.branching = True
            native_attempt = False
            try:
                await self.notify()
                if target.get("branch_state") != "complete":
                    self.journal.inherit_history(target, target.get("branch_from")["sequence"])
                    target.set("operator_draft", self.draft()["text"])
                    if self.stopped:
                        self.adapter = self._replacement_adapter(self.journal)
                        self.stopped = False
                        self.stop_outcome = None
                    self.journal.set("unsettled_native", True)
                    native_attempt = True
                    native_id = await self.adapter.fork(source_id, target, cwd=self.workspace.root,
                                                        authorize=lambda: self.human(principal))
                    self.catalog.claim_native(identifier, native_id)
                    target.set("native_session_id", native_id)
                    target.event("conversation.branched", target.get("branch_from"))
                    target.set("branch_state", "complete")
                    self.journal.set("unsettled_native", False)
                await self._bind_journal(target)
                return self.conversations()
            except BaseException:
                if target.get("native_creation") and target.get("branch_state") != "complete":
                    target.set("branch_state", "unknown")
                    self.journal.set("unsettled_native", True)
                    self.adapter.uncertain = True
                    self.connected = False
                elif native_attempt and not target.get("native_creation"):
                    self.journal.set("unsettled_native", False)
                if target is not self.journal and target is not self.catalog.legacy:
                    target.close()
                raise
            finally:
                self.branching = False
                await self.notify()

    def validate_payload(self, payload: dict) -> tuple[str, str]:
        if set(payload) - {"id", "kind", "text", "startAnyway", "startIfNeeded", "conversationId"}:
            raise BridgeError("unsupported_fields", "Provider, process and thread working directories are server-owned.", 400)
        kind = payload.get("kind")
        if kind not in ("start_session", "prompt"):
            raise BridgeError("unsupported_command", "Only operator session start or prompt is supported.", 400)
        text = payload.get("text", "")
        if not isinstance(text, str) or len(text) > 65536 or (kind == "prompt" and not text.strip()):
            raise BridgeError("invalid_prompt", "Supply 1–65536 characters.", 400)
        if "startIfNeeded" in payload and (kind != "prompt" or type(payload["startIfNeeded"]) is not bool):
            raise BridgeError("invalid_start_confirmation", "startIfNeeded is a boolean explicit-Send option.", 400)
        if "startAnyway" in payload and ((kind != "start_session" and not payload.get("startIfNeeded"))
                                        or type(payload["startAnyway"]) is not bool):
            raise BridgeError("invalid_start_confirmation", "Start anyway is a boolean session-start acknowledgement only.", 400)
        return kind, text

    async def submit(self, principal: str, payload: dict) -> dict:
        async with self.control_lock:
            return await self._submit(principal, payload)

    async def _submit(self, principal: str, payload: dict) -> dict:
        self.human(principal)
        if "conversationId" in payload:
            self.require_conversation(payload["conversationId"])
        kind, text = self.validate_payload(payload)
        self.verify()
        previous = self.journal.existing(payload.get("id"), kind, text)
        if previous is not None:
            return previous
        if self.stopped and (kind == "start_session" or payload.get("startIfNeeded")) and self.stop_outcome == "confirmed" and self.adapter_factory:
            replacement = self._replacement_adapter(self.journal)
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
            self.queue.put_nowait((command["id"], kind, text, principal, payload.get("startIfNeeded", False)))
            await self.notify()
        return command

    async def _worker(self) -> None:
        while True:
            command_id, kind, text, principal, start_if_needed = await self.queue.get()
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
                if kind == "start_session" or (start_if_needed and not self.connected):
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
                    self.catalog.claim_native(self.journal.get("conversation_id"), session_id)
                    self.journal.set("native_session_id", session_id)
                    if self.provider == "copilot":
                        self.journal.set("sdk_session_id", session_id)
                    self.connected = True
                    self.journal.set("unsettled_native", False)
                    self.journal.event("session.connected", {"sessionId": session_id, "adapter": self.adapter.name})
                if kind == "prompt":
                    self.human(principal)
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
                    self.journal.set("unsettled_native", True)
            except BridgeError as error:
                self.journal.state(command_id, "unknown" if dispatched else "failed", error.message)
                if dispatched:
                    self.connected = False
                    self.journal.set("unsettled_native", True)
            except Exception:
                # Do not serialize arbitrary SDK exceptions: they may contain credentials.
                self.journal.state(command_id, "unknown", "Adapter outcome is unknown. Inspect the native session; do not resend.")
                self.connected = False
                self.journal.set("unsettled_native", True)
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

    async def decide(self, principal: str, request_id: str, decision: str, *, expected=None) -> dict:
        if expected is not None:
            self.require_conversation(expected)
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

    async def cancel(self, principal: str, command_id: str, *, expected=None) -> dict:
        async with self.control_lock:
            if expected is not None:
                self.require_conversation(expected)
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

    async def stop_operator(self, principal: str, confirmation: str, *, expected=None) -> dict:
        async with self.control_lock:
            if expected is not None:
                self.require_conversation(expected)
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
            had_native = bool(self.adapter.status().get("ownedPids"))
            await self.adapter.stop()
        except Exception:
            self.stop_outcome = "unknown"
            self.journal.event("operator.stop_unknown",
                {"message": "Native stop outcome is unknown. Inspect the owned session; no automatic retry."})
            await self.notify()
            return self.status()
        self.stop_outcome = "confirmed"
        if had_native:
            self.journal.set("unsettled_native", False)
        self.connected = False
        self.journal.event("operator.stopped", {"message": "Operator stopped explicitly. Bridge recovery view remains available."})
        await self.notify()
        return self.status()

    def status(self) -> dict:
        adapter = self.adapter.status()
        state = ("awaiting_permission" if self.waiters else "busy" if self.active or self.branching
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
                "selectionRevision": self.catalog.revision(),
                "nativeSessionId": self.native_session_id(),
                "sdkSessionId": self.native_session_id() if self.provider == "copilot" else None,
                "adapter": adapter,
                "application": self.app, "lastSequence": self.journal.latest(),
                "permissions": self.journal.pending(), "commands": self.journal.commands(),
                "settings": self.settings(), "branch": self.branch_capability(),
                "branchFrom": self.journal.get("branch_from")}

    async def update_application(self, state: dict) -> None:
        self.app = state
        self.journal.event("application.availability", state)
        await self.notify()

    def draft(self, text: str | None = None) -> dict:
        if text is not None:
            if not isinstance(text, str) or len(text) > 65536:
                raise BridgeError("invalid_draft", "Draft is too long.", 400)
            self.journal.set("operator_draft", public_text(text))
        return {"conversationId": self.journal.get("conversation_id"), "selectionRevision": self.catalog.revision(),
                "text": self.journal.get("operator_draft") or ""}

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
        if self.journal is not self.catalog.legacy:
            self.catalog.legacy.close()
