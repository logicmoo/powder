from __future__ import annotations

import asyncio
import inspect
import os
import sys
import unittest
from pathlib import Path
from types import SimpleNamespace
from unittest.mock import patch

from copilot import CopilotClient
from copilot.generated.session_events import PermissionRequestRead, PermissionRequestWrite

from ..adapter import configured_adapter
from ..codex_adapter import CodexAdapter
from ..copilot_adapter import CopilotAdapter
from ..journal import Journal
from ..native import CLI_VERSIONS, NativeCommand, NativeOutcome, resolve_native
from ..service import OperatorService
from ..stdio_rpc import StdioRpc
from ..workspace import BridgeError
from .support import fixture, remove, settle, until


async def fake_version(command, cwd):
    return CLI_VERSIONS[command.provider]


class FakeTree:
    def __init__(self):
        self.ids = []
        self.stops = 0

    def attach(self, process):
        self.ids = [process.pid]

    def pids(self):
        return self.ids

    def alive(self):
        return bool(self.ids)

    def stop(self):
        self.stops += 1
        self.ids = []


class FakeSession:
    def __init__(self, client, identifier, options):
        self.client, self.session_id, self.options = client, identifier, options
        self.sent = []
        self.disconnects = 0
        self.aborts = 0
        self.identity = SimpleNamespace(session_id=identifier, is_remote=False,
            already_in_use=False, working_directory=options["working_directory"])
        self.rpc = SimpleNamespace(metadata=SimpleNamespace(snapshot=self.metadata_snapshot))

    async def metadata_snapshot(self):
        return self.identity

    def event(self, kind, **data):
        self.options["on_event"](SimpleNamespace(type=SimpleNamespace(value=kind), data=SimpleNamespace(**data)))

    async def send(self, text, *, agent_mode):
        self.sent.append((text, agent_mode))
        if text == "error":
            self.event("session.error", message="secret=never-exposed")
        elif text != "hang":
            self.event("assistant.message", content="fixture output")
            self.event("session.idle")
        return "fixture-message"

    async def abort(self):
        self.aborts += 1
        self.event("abort")

    async def disconnect(self):
        self.disconnects += 1


class FakeClient:
    def __init__(self, store, **options):
        self.options, self.store = options, store
        self._cli_process = SimpleNamespace(pid=123456)
        self.starts = self.stops = self.creates = self.resumes = 0
        self.session = None
        self.resume_options = None

    async def start(self):
        self.starts += 1

    async def stop(self):
        self.stops += 1

    async def get_status(self):
        return SimpleNamespace(version=CLI_VERSIONS["copilot"], protocol_version=3)

    async def get_session_metadata(self, identifier):
        return self.store.get(identifier)

    async def create_session(self, *, session_id, **options):
        self.creates += 1
        cwd = options["working_directory"]
        self.store[session_id] = SimpleNamespace(is_remote=False, context=SimpleNamespace(
            working_directory=cwd, git_root=cwd, branch="master"))
        self.session = FakeSession(self, session_id, options)
        return self.session

    async def resume_session(self, session_id, **options):
        self.resumes += 1
        self.resume_options = options
        self.session = FakeSession(self, session_id, options)
        return self.session


class CopilotNativeTests(unittest.IsolatedAsyncioTestCase):
    async def asyncSetUp(self):
        self.directory, self.journal, _, self.base = fixture()
        self.cwd = self.base.workspace.root
        self.store = {}
        self.clients = []

        def factory(**options):
            client = FakeClient(self.store, **options)
            self.clients.append(client)
            return client
        self.adapter = CopilotAdapter(NativeCommand("copilot", Path(sys.executable)), self.journal,
            client_factory=factory, version_probe=fake_version, tree_factory=FakeTree)

    async def asyncTearDown(self):
        await self.base.close()
        remove(self.directory)

    async def test_sdk_contract_and_explicit_native_process_configuration(self):
        result = await self.adapter.start(None, cwd=self.cwd)
        client = self.clients[0]
        self.assertEqual(client.options["connection"].path, sys.executable)
        self.assertEqual(client.options["working_directory"], self.cwd)
        self.assertEqual(result["cwd"], self.cwd)
        self.assertTrue(result["sessionId"].startswith("powder-"))
        self.assertEqual(client.session.sent, [])
        for name in client.session.options:
            self.assertIn(name, inspect.signature(CopilotClient.create_session).parameters)

    async def test_named_session_resumes_without_pending_work(self):
        result = await self.adapter.start(None, cwd=self.cwd)
        await self.adapter.start(result["sessionId"], cwd=self.cwd)
        self.assertEqual(self.clients[0].creates, 1)
        self.assertEqual(self.clients[0].resumes, 1)
        self.assertIs(self.clients[0].resume_options["continue_pending_work"], False)
        self.assertEqual(self.clients[0].resume_options["working_directory"], self.cwd)

    async def test_new_empty_session_uses_live_identity_before_history_is_persisted(self):
        with patch.object(FakeClient, "get_session_metadata", return_value=None):
            result = await self.adapter.start(None, cwd=self.cwd)
        self.assertEqual(result["cwd"], self.cwd)
        self.assertEqual(self.clients[0].creates, 1)
        self.assertEqual(self.clients[0].session.sent, [])
        self.assertEqual(self.journal.get("native_creation")["state"], "confirmed")

    async def test_live_session_identity_rejects_wrong_directory_remote_or_shared_session(self):
        original = FakeSession.metadata_snapshot
        for change in (
            {"working_directory": str(self.directory / "foreign")},
            {"session_id": "different"},
            {"is_remote": True},
            {"already_in_use": True},
        ):
            async def changed(session):
                identity = await original(session)
                return SimpleNamespace(**{**vars(identity), **change})
            with patch.object(FakeSession, "metadata_snapshot", changed):
                with self.assertRaises(BridgeError):
                    await self.adapter.start(None, cwd=self.cwd)
            self.assertEqual(self.clients[0].session.sent, [])
            self.assertEqual(self.journal.get("native_creation")["state"], "requested")

    async def test_foreign_cwd_or_branch_is_rejected_before_resume(self):
        self.store["foreign"] = SimpleNamespace(is_remote=False, context=SimpleNamespace(
            working_directory=str(self.directory / "foreign"), git_root=self.cwd, branch="master"))
        with self.assertRaises(BridgeError):
            await self.adapter.start("foreign", cwd=self.cwd)
        self.assertEqual(self.clients[0].resumes, 0)

    async def test_unknown_creation_is_not_reexecuted(self):
        self.journal.set("native_creation", {"id": "uncertain", "state": "requested"})
        with self.assertRaises(BridgeError):
            await self.adapter.start(None, cwd=self.cwd)
        self.assertEqual(self.clients[0].creates, 0)

    async def test_events_and_cancellation_are_native_terminal_driven(self):
        await self.adapter.start(None, cwd=self.cwd)
        output = []
        async def emit(text):
            output.append(text)
        async def deny(*args):
            return False
        await self.adapter.send("fixture", emit, deny)
        self.assertEqual(output, ["fixture output"])
        task = asyncio.create_task(self.adapter.send("hang", emit, deny))
        await until(lambda: len(self.clients[0].session.sent) == 2)
        self.assertTrue(await self.adapter.cancel())
        with self.assertRaises(NativeOutcome) as error:
            await task
        self.assertEqual(error.exception.state, "cancelled")

    async def test_permission_requires_human_and_never_grants_session_scope(self):
        await self.adapter.start(None, cwd=self.cwd)
        request = PermissionRequestRead(intention="inspect fixture", path=self.cwd)
        invocation = {"session_id": self.adapter.session_id}
        denied = await self.adapter._permission(request, invocation)
        self.assertEqual(denied.kind, "reject")
        gate = asyncio.get_running_loop().create_future()
        async def human(*args):
            return await gate
        self.adapter.permission_handler = human
        task = asyncio.create_task(self.adapter._permission(request, invocation))
        await asyncio.sleep(0)
        self.assertFalse(task.done())
        gate.set_result(True)
        result = await task
        self.assertEqual(result.kind, "approve-once")
        self.assertTrue(result.approved_interactively)

    async def test_changed_file_is_not_approved_after_human_review(self):
        await self.adapter.start(None, cwd=self.cwd)
        file = self.directory / "own-fixture.txt"
        file.write_text("before", encoding="utf-8")
        request = PermissionRequestWrite(can_offer_session_approval=False,
            diff="-before\n+after", file_name=str(file), intention="fixture only")
        async def human(*args):
            file.write_text("user edit", encoding="utf-8")
            return True
        self.adapter.permission_handler = human
        result = await self.adapter._permission(request, {"session_id": self.adapter.session_id})
        self.assertEqual(result.kind, "reject")
        self.assertEqual(file.read_text(), "user edit")

    async def test_stop_disconnects_without_deleting_history(self):
        result = await self.adapter.start(None, cwd=self.cwd)
        await self.adapter.stop()
        client = self.clients[0]
        self.assertEqual(client.session.disconnects, 1)
        self.assertEqual(client.stops, 1)
        self.assertIn(result["sessionId"], self.store)

    async def test_passive_configuration_has_no_native_process(self):
        with patch("subprocess.Popen", side_effect=AssertionError("must not start")):
            adapter = configured_adapter("copilot", self.journal, executable=sys.executable)
            self.assertTrue(adapter.available)
            self.assertIsNone(adapter.client)

    async def test_diagnostic_without_terminal_proof_quarantines_dispatch(self):
        await self.adapter.start(None, cwd=self.cwd)
        async def emit(text):
            pass
        async def deny(*args):
            return False
        with self.assertRaises(NativeOutcome) as error:
            await self.adapter.send("error", emit, deny)
        self.assertEqual(error.exception.state, "unknown")
        self.assertTrue(self.adapter.uncertain)
        with self.assertRaises(BridgeError):
            await self.adapter.send("not dispatched", emit, deny)
        self.assertEqual(len(self.clients[0].session.sent), 1)
        self.assertNotIn("never-exposed", str(self.journal.events(0)))

    async def test_stop_during_start_cannot_spawn_after_confirmation(self):
        entered, release = asyncio.Event(), asyncio.Event()
        async def delayed(*args):
            entered.set()
            await release.wait()
            return CLI_VERSIONS["copilot"]
        self.adapter.version_probe = delayed
        start = asyncio.create_task(self.adapter.start(None, cwd=self.cwd))
        await entered.wait()
        stop = asyncio.create_task(self.adapter.stop())
        await asyncio.sleep(0)
        release.set()
        with self.assertRaises(BridgeError):
            await start
        await stop
        self.assertEqual(self.clients, [])

    async def test_foreign_native_permission_never_reaches_human(self):
        await self.adapter.start(None, cwd=self.cwd)
        async def unexpected(*args):
            self.fail("foreign permission reached the human")
        self.adapter.permission_handler = unexpected
        result = await self.adapter._permission(
            PermissionRequestRead(intention="foreign", path=self.cwd), {"session_id": "another-session"})
        self.assertEqual(result.kind, "reject")


class CodexNativeTests(unittest.IsolatedAsyncioTestCase):
    async def asyncSetUp(self):
        self.directory, old, _, base = fixture()
        self.workspace = base.workspace
        old.close()
        self.journal = Journal(self.directory / "codex.sqlite3", self.workspace, provider="codex")
        self.argv = []
        def rpc_factory(argv, cwd, notification, request):
            self.argv = argv
            return StdioRpc([sys.executable, str(Path(__file__).with_name("fixture_codex_stdio.py"))],
                            cwd, notification, request)
        self.adapter = CodexAdapter(NativeCommand("codex", Path(sys.executable)), self.journal,
                                    rpc_factory=rpc_factory, version_probe=fake_version)
        self.service = OperatorService(self.journal, self.workspace, self.adapter, verify=lambda: None)
        await self.service.run()
        self.service.attach("human")
        await self.service.submit("human", {"id": "start", "kind": "start_session"})
        await settle(self.service)
        self.assertEqual(self.journal.command("start")["state"], "complete")

    async def asyncTearDown(self):
        await self.adapter.stop()
        await self.service.close()
        remove(self.directory)

    async def test_private_stdio_initialization_and_explicit_cwd(self):
        self.assertEqual(self.argv[1:], ["app-server", "--listen", "stdio://"])
        self.assertEqual(self.adapter.cwd, self.workspace.root)
        self.assertTrue(self.adapter.protocol_verified)
        self.assertEqual(self.journal.get("native_process")["cwd"], self.workspace.root)
        self.assertTrue(self.adapter.status()["ownedPids"])

    async def test_scoped_output_no_diagnostic_or_foreign_thread_leak(self):
        await self.service.submit("human", {"id": "prompt", "kind": "prompt", "text": "fixture"})
        await settle(self.service)
        events = str(self.journal.events(0))
        self.assertIn("fixture output", events)
        self.assertNotIn("must not leak", events)
        self.assertNotIn("private-native-diagnostic", events)
        self.assertEqual(self.journal.command("prompt")["state"], "complete")

    async def test_native_permission_waits_across_disconnect_and_accepts_once(self):
        await self.service.submit("human", {"id": "prompt", "kind": "prompt", "text": "permission"})
        await until(lambda: self.journal.pending())
        request = self.journal.pending()[0]
        self.service.detach("human")
        with self.assertRaises(BridgeError):
            await self.service.decide("human", request["id"], "allow")
        self.assertEqual(self.journal.command("prompt")["state"], "awaiting_permission")
        self.service.attach("human")
        await self.service.decide("human", request["id"], "allow")
        await settle(self.service)
        self.assertIn("permission accept", str(self.journal.events(0)))

    async def test_cancellation_needs_matching_terminal_notification(self):
        await self.service.submit("human", {"id": "prompt", "kind": "prompt", "text": "hang"})
        await until(lambda: self.adapter.turn_id)
        result = await self.service.cancel("human", "prompt")
        await settle(self.service)
        self.assertEqual(result["state"], "cancelled")

    async def test_native_failure_is_not_reported_complete(self):
        await self.service.submit("human", {"id": "prompt", "kind": "prompt", "text": "fail"})
        await settle(self.service)
        self.assertEqual(self.journal.command("prompt")["state"], "failed")

    async def test_eof_marks_unknown_and_never_replays_prompt(self):
        await self.service.submit("human", {"id": "prompt", "kind": "prompt", "text": "exit"})
        await settle(self.service)
        self.assertEqual(self.journal.command("prompt")["state"], "unknown")
        self.assertTrue(self.adapter.uncertain)
        repeated = await self.service.submit("human", {"id": "prompt", "kind": "prompt", "text": "exit"})
        self.assertEqual(repeated["state"], "unknown")
        self.assertFalse(self.service.connected)

    async def test_unknown_native_capabilities_fail_closed(self):
        result = await self.adapter._request("item/permissions/requestApproval", {"permissions": {"network": {"enabled": True}}})
        self.assertEqual(result, {"permissions": {}, "scope": "turn"})
        with self.assertRaises(BridgeError):
            await self.adapter._request("account/chatgptAuthTokens/refresh", {})

    async def test_passive_native_resolution_rejects_non_executable(self):
        with self.assertRaises(BridgeError):
            resolve_native("codex", str(self.directory / "not-a-program.ps1"))

    async def test_confirmed_creation_id_is_recoverable_without_second_create(self):
        recorded = self.journal.get("native_creation")["id"]
        result = await self.adapter.start(None, cwd=self.workspace.root)
        self.assertEqual(result["sessionId"], recorded)

    async def test_policy_mismatch_rejects_native_attachment(self):
        original = self.adapter.rpc.call
        async def changed(method, params, **options):
            result = await original(method, params, **options)
            if method == "thread/resume":
                result["sandbox"] = {"type": "dangerFullAccess"}
            return result
        self.adapter.rpc.call = changed
        with self.assertRaises(BridgeError) as error:
            await self.adapter.start(self.adapter.session_id, cwd=self.workspace.root)
        self.assertEqual(error.exception.code, "native_policy_mismatch")

    async def test_foreign_approval_is_not_routed_to_selected_operator(self):
        async def unexpected(*args):
            self.fail("foreign approval reached the human")
        self.adapter.permission_handler = unexpected
        self.adapter.turn_id = "current"
        result = await self.adapter._request("item/commandExecution/requestApproval",
            {"threadId": "foreign", "turnId": "current", "command": "fixture", "cwd": self.workspace.root})
        self.assertEqual(result, {"decision": "decline"})
