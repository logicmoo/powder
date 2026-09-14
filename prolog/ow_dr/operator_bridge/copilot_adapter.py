from __future__ import annotations

import asyncio
import importlib.metadata
import json
import logging
import uuid

from .adapter import AskPermission, Emit
from .journal import Journal
from .native import SDK_VERSION, NativeCommand, NativeOutcome, NativeTree, trusted_cwd, verify_version
from .workspace import BridgeError
from .write_guard import snapshot, unchanged


class CopilotAdapter:
    provider = "copilot"
    name = "copilot-python-sdk"
    available = True

    def __init__(self, command: NativeCommand, journal: Journal, *, model: str | None = None,
                 client_factory=None, version_probe=verify_version, tree_factory=NativeTree):
        if importlib.metadata.version("github-copilot-sdk") != SDK_VERSION:
            raise BridgeError("unsupported_sdk_version", "Install the pinned Copilot SDK.", 503)
        self.command, self.journal, self.model = command, journal, model
        self.client_factory = client_factory
        self.version_probe, self.tree = version_probe, tree_factory()
        self.client = self.session = None
        self.session_id = self.cwd = self.version = None
        self.permission_handler: AskPermission | None = None
        self.events: asyncio.Queue | None = None
        self.terminal: asyncio.Future | None = None
        self.protocol_verified = False
        self.stopping = False
        self.uncertain = False
        self.unsubscribe = None
        self.callback_identity = None
        self.lifecycle = asyncio.Lock()

    def _new_client(self, cwd: str):
        from copilot import CopilotClient
        from copilot.client import RuntimeConnection
        logging.getLogger("copilot").setLevel(logging.CRITICAL + 1)
        factory = self.client_factory or CopilotClient
        return factory(connection=RuntimeConnection.for_stdio(path=str(self.command.path)),
                       working_directory=cwd, log_level="none",
                       use_logged_in_user=True, enable_remote_sessions=False)

    async def connect(self, cwd: str) -> None:
        if self.client:
            trusted_cwd(cwd, self.cwd)
            if not self.protocol_verified or not self.tree.alive():
                raise BridgeError("native_transport_unknown", "Previous native startup or transport is unconfirmed; no automatic restart.")
            return
        self.version = await self.version_probe(self.command, cwd)
        if self.stopping:
            raise BridgeError("operator_stopped", "Operator was stopped before native runtime creation.")
        self.cwd = cwd
        self.client = self._new_client(cwd)
        await asyncio.wait_for(self.client.start(), 30)
        # Pinned SDK's owned Popen is the only private adapter seam. Never attach an external runtime.
        process = self.client._cli_process
        if process is None:
            raise BridgeError("process_ownership_failed", "SDK did not expose its owned stdio runtime.")
        self.tree.attach(process)
        self.journal.set("native_process", {"pids": self.tree.pids(), "cwd": cwd,
                                          "version": self.version, "owner": "bridge-sdk"})
        await asyncio.wait_for(self.client.get_status(), 15)
        self.protocol_verified = True

    async def _metadata(self, session_id: str):
        metadata = await asyncio.wait_for(self.client.get_session_metadata(session_id), 15)
        if metadata is None:
            return None
        if metadata.is_remote or metadata.context is None:
            raise BridgeError("session_workspace_mismatch", "Remote or context-free sessions cannot be resumed.")
        trusted_cwd(metadata.context.working_directory, self.cwd)
        if metadata.context.git_root is not None:
            trusted_cwd(metadata.context.git_root, self.cwd)
        if metadata.context.branch not in (None, "master"):
            raise BridgeError("session_branch_mismatch", "The saved native session belongs to another branch.")
        return metadata

    async def start(self, resume_id: str | None, *, cwd: str) -> dict:
        async with self.lifecycle:
            return await self._start(resume_id, cwd=cwd)

    async def _start(self, resume_id: str | None, *, cwd: str) -> dict:
        if self.stopping:
            raise BridgeError("operator_stopped", "Operator was explicitly stopped.")
        await self.connect(cwd)
        if self.stopping or self.uncertain:
            raise BridgeError("native_outcome_unknown", "Operator is stopped or native work is unconfirmed.")
        previous = self.journal.get("native_creation")
        session_id = resume_id or (previous["id"] if previous else f"powder-{uuid.uuid4()}")
        if resume_id or previous:
            metadata = await self._metadata(session_id)
            if metadata is None:
                raise BridgeError("unconfirmed_native_session",
                    "The previous native session could not be verified. It was not recreated or retried.")
        else:
            self.journal.set("native_creation", {"id": session_id, "state": "requested"})
        self.session_id = session_id
        conversation = self.journal.get("conversation_id")
        callback_identity = self.callback_identity = object()
        def current_event(event):
            if (self.callback_identity is callback_identity
                    and self.journal.get("conversation_id") == conversation and self.session_id == session_id):
                self._event(event)
        async def current_permission(request, invocation):
            if self.callback_identity is not callback_identity:
                from copilot.generated.rpc import PermissionDecisionReject
                return PermissionDecisionReject(feedback="This native session binding is no longer active.")
            return await self._permission(request, invocation)
        options = dict(on_permission_request=current_permission, working_directory=cwd,
                       streaming=False, on_event=current_event, enable_file_hooks=False,
                       enable_host_git_operations=False, manage_schedule_enabled=False,
                       enable_mcp_apps=False, include_sub_agent_streaming_events=False)
        if self.model:
            options["model"] = self.model
        if resume_id or previous:
            self.session = await asyncio.wait_for(self.client.resume_session(
                session_id, continue_pending_work=False, **options), 30)
        else:
            self.session = await asyncio.wait_for(self.client.create_session(
                session_id=session_id, **options), 30)
        if self.session.session_id != session_id or await self._metadata(session_id) is None:
            raise BridgeError("invalid_native_session", "Native session identity or working directory was not confirmed.")
        self.journal.set("native_creation", {"id": session_id, "state": "confirmed"})
        return {"sessionId": session_id, "cwd": cwd, "processCwd": self.cwd}

    def _event(self, event) -> None:
        if self.events is None:
            return
        kind = event.type.value if hasattr(event.type, "value") else event.type
        if kind not in ("assistant.message", "session.idle", "session.error", "abort"):
            return
        try:
            self.events.put_nowait((kind, event.data))
        except asyncio.QueueFull:
            if self.terminal and not self.terminal.done():
                self.terminal.set_result("unknown")

    async def _permission(self, request, invocation):
        from copilot.generated.rpc import PermissionDecisionApproveOnce, PermissionDecisionReject
        if (self.permission_handler is None or self.stopping
                or invocation.get("session_id") != self.session_id
                or getattr(request, "managed_approval_required", False)
                or getattr(request, "kind", None) not in ("read", "write", "shell", "url")):
            return PermissionDecisionReject(feedback="No eligible human operator approval.")
        try:
            before = snapshot([request.file_name], self.cwd) if request.kind == "write" else None
        except (BridgeError, OSError):
            return PermissionDecisionReject(feedback="The proposed write cannot be verified safely.")
        details = json.dumps(request.to_dict(), ensure_ascii=False, indent=2)
        approved = await self.permission_handler(request.kind, f"Copilot requests {request.kind} access", details)
        if before is not None and not unchanged(before, self.cwd):
            self.journal.event("permission.stale", {"message": "File changed during review; native write was denied."})
            return PermissionDecisionReject(feedback="The file changed while the operator reviewed it. Read it again.")
        if approved and not self.stopping:
            return PermissionDecisionApproveOnce(approved_interactively=True)
        return PermissionDecisionReject(feedback="The operator did not approve this request.")

    async def send(self, text: str, emit: Emit, permission: AskPermission) -> None:
        if self.session is None or self.stopping or self.uncertain:
            raise BridgeError("session_not_started", "The native session is disconnected.")
        self.events = asyncio.Queue(maxsize=64)
        self.terminal = asyncio.get_running_loop().create_future()
        self.permission_handler = permission
        try:
            message_id = await asyncio.wait_for(self.session.send(text, agent_mode="interactive"), 30)
            self.journal.set("native_last_dispatch", {"sessionId": self.session_id, "messageId": message_id})
            while not self.terminal.done():
                event_task = asyncio.create_task(self.events.get())
                try:
                    done, _ = await asyncio.wait((event_task, self.terminal),
                                                 timeout=3600, return_when=asyncio.FIRST_COMPLETED)
                    if not done:
                        self.terminal.set_result("unknown")
                    elif event_task in done:
                        kind, data = event_task.result()
                        if kind == "assistant.message":
                            content = getattr(data, "content", None)
                            if isinstance(content, str):
                                await emit(content)
                        elif kind == "session.idle" and not self.terminal.done():
                            self.terminal.set_result("complete")
                        elif kind == "abort" and not self.terminal.done():
                            self.terminal.set_result("cancelled")
                        elif not self.terminal.done():
                            # A diagnostic is not proof that all native work has stopped.
                            self.terminal.set_result("unknown")
                finally:
                    if not event_task.done():
                        event_task.cancel()
                    await asyncio.gather(event_task, return_exceptions=True)
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

    async def cancel(self) -> bool:
        if self.session is None or self.terminal is None or self.terminal.done():
            return False
        await asyncio.wait_for(self.session.abort(), 15)
        try:
            return await asyncio.wait_for(asyncio.shield(self.terminal), 15) == "cancelled"
        except asyncio.TimeoutError:
            self.uncertain = True
            return False

    async def stop(self) -> None:
        self.stopping = True
        self.callback_identity = None
        async with self.lifecycle:
            try:
                if self.session:
                    await asyncio.wait_for(self.session.disconnect(), 15)
                if self.client:
                    await asyncio.wait_for(self.client.stop(), 20)
            finally:
                self.tree.stop()
                if self.terminal and not self.terminal.done():
                    self.terminal.set_result("cancelled")
            self.session = None

    async def select_conversation(self, journal, model):
        async with self.lifecycle:
            if self.uncertain or self.events is not None or self.permission_handler is not None:
                raise BridgeError("native_work_unsettled", "Resolve native work before switching conversations.")
            self.callback_identity = None
            if self.session:
                await asyncio.wait_for(self.session.disconnect(), 15)
            self.session = None
            self.session_id = None
            self.terminal = None
            self.journal, self.model = journal, model

    def status(self) -> dict:
        return {"name": self.name, "provider": self.provider, "available": True,
                "connected": self.session is not None and self.tree.alive() and not self.stopping and not self.uncertain,
                "sessionId": self.session_id, "ownedPids": self.tree.pids(),
                "resumeSupported": True, "sdkVersion": SDK_VERSION, "cliVersion": self.version,
                "protocolVerified": self.protocol_verified, "authentication": "native_cli_managed",
                "uncertain": self.uncertain,
                "model": self.model, "modelSource": "operator" if self.model else "native_cli_default"}
