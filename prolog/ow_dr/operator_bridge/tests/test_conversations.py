from __future__ import annotations

import asyncio
import sys
import unittest
import uuid
from pathlib import Path

from ..codex_adapter import CodexAdapter
from ..copilot_adapter import CopilotAdapter
from ..journal import Journal
from ..hub import OperatorHub
from ..native import NativeCommand
from ..service import OperatorService
from ..stdio_rpc import StdioRpc
from ..workspace import BridgeError
from .support import fixture, remove, settle, until
from .test_native_adapters import FakeClient, FakeTree, fake_version


class ConversationTests(unittest.IsolatedAsyncioTestCase):
    async def asyncSetUp(self):
        self.directory, _, _, initial = fixture()
        self.workspace = initial.workspace
        await initial.close()
        self.store, self.clients, self.rpcs, self.services = {}, [], [], []

    async def make(self, provider):
        journal = Journal(self.directory / (provider + ".sqlite3"), self.workspace, provider=provider)

        def clients(**options):
            client = FakeClient(self.store, **options)
            self.clients.append(client)
            return client

        def rpc_factory(_argv, cwd, notification, request):
            rpc = StdioRpc([sys.executable, str(Path(__file__).with_name("fixture_codex_stdio.py"))],
                           cwd, notification, request)
            self.rpcs.append(rpc)
            return rpc

        def factory(journal=journal, model=None):
            if provider == "copilot":
                return CopilotAdapter(NativeCommand(provider, Path(sys.executable)), journal, model=model,
                    client_factory=clients, version_probe=fake_version, tree_factory=FakeTree)
            return CodexAdapter(NativeCommand(provider, Path(sys.executable)), journal, model=model,
                                rpc_factory=rpc_factory, version_probe=fake_version)

        service = OperatorService(journal, self.workspace, factory(), verify=lambda: None, adapter_factory=factory)
        self.services.append(service)
        await service.run()
        service.attach("browser")
        return service

    async def asyncTearDown(self):
        for service in self.services:
            if not service.closed:
                await service.adapter.stop()
                await service.close()
        remove(self.directory)

    async def submit(self, service, text="fixture", identifier=None):
        return await service.submit("browser", {"conversationId": service.journal.get("conversation_id"),
            "id": identifier or str(uuid.uuid4()), "kind": "prompt", "text": text, "startIfNeeded": True})

    async def test_real_native_new_switch_resume_restart_and_legacy_preservation(self):
        for provider in ("copilot", "codex"):
            with self.subTest(provider=provider):
                service = await self.make(provider)
                original = service.journal.get("conversation_id")
                original_path = service.journal.path
                service.draft("original unsent")
                await service.save_settings("browser", original, "fixture-model-one")
                command = await self.submit(service, "original message", "same-command")
                await settle(service)
                native_one = service.native_session_id()
                history = service.journal.events(0)["events"]
                self.assertEqual(service.journal.command(command["id"])["state"], "complete")
                previous_session = getattr(service.adapter, "session", None)

                second = str(uuid.uuid4())
                await service.select_conversation("browser", original, second, create=True)
                self.assertIsNone(service.native_session_id(), "New creates no native session")
                self.assertEqual(service.journal.events(0)["events"], [])
                self.assertEqual(service.draft()["text"], "")
                self.assertEqual(service.settings()["model"], "fixture-model-one")
                service.draft("second unsent")
                await service.save_settings("browser", second, "fixture-model-two")
                await self.submit(service, "second message", "same-command")
                await settle(service)
                native_two = service.native_session_id()
                self.assertNotEqual(native_one, native_two)
                if previous_session:
                    self.assertEqual(previous_session.disconnects, 1)
                    # A delayed event from a detached old SDK session must not enter a new turn.
                    service.adapter.events = asyncio.Queue()
                    previous_session.event("assistant.message", content="old conversation callback")
                    self.assertTrue(service.adapter.events.empty())
                    service.adapter.events = None
                second_history = service.journal.events(0)["events"]
                await service.select_conversation("browser", second, original)
                self.assertFalse(service.connected, "opening history does not resume native work")
                self.assertEqual(service.draft()["text"], "original unsent")
                self.assertEqual(service.settings()["model"], "fixture-model-one")
                self.assertEqual(service.journal.events(0)["events"], history)
                self.assertEqual(service.journal.path, original_path)
                self.assertTrue(original_path.is_file())
                await service.submit("browser", {"id": "resume", "kind": "start_session", "conversationId": original})
                await settle(service)
                self.assertEqual(service.native_session_id(), native_one)
                self.assertEqual(len([e for e in service.journal.events(0)["events"] if e["kind"] == "assistant.output"]), 1)
                await service.select_conversation("browser", original, second)
                await service.adapter.stop()
                await service.close()

                restarted = await self.make(provider)
                self.assertFalse(restarted.connected)
                self.assertEqual(restarted.conversations()["conversationId"], second)
                self.assertEqual(len(restarted.conversations()["items"]), 2)
                self.assertEqual(restarted.draft()["text"], "second unsent")
                self.assertEqual(restarted.settings()["model"], "fixture-model-two")
                self.assertEqual(restarted.native_session_id(), native_two)
                self.assertEqual(restarted.journal.events(0)["events"], second_history)
                before = restarted.journal.latest()
                await self.submit(restarted, "second message", "same-command")
                await settle(restarted)
                self.assertEqual(restarted.journal.latest(), before, "completed request never replays")
                await restarted.submit("browser", {"id": "resume-two", "kind": "start_session", "conversationId": second})
                await settle(restarted)
                self.assertEqual(restarted.native_session_id(), native_two)
                self.assertEqual(restarted.journal.command("resume-two")["state"], "complete")
                await restarted.stop_operator("browser", "STOP OPERATOR", expected=second)
                await self.submit(restarted, "after explicit stop", "after-stop")
                await settle(restarted)
                self.assertEqual(restarted.native_session_id(), native_two, "adapter replacement stays bound to the selected journal")
                self.assertEqual(restarted.adapter.journal.get("conversation_id"), second)
                self.assertEqual(restarted.journal.command("after-stop")["state"], "complete")

    async def test_busy_cancel_permissions_and_stale_mutations(self):
        service = await self.make("codex")
        first = service.journal.get("conversation_id")
        command = await self.submit(service, "permission")
        await until(lambda: service.waiters)
        permission = service.journal.pending()[0]["id"]
        next_id = str(uuid.uuid4())
        with self.assertRaisesRegex(BridgeError, "Finish/cancel"):
            await service.select_conversation("browser", first, next_id, create=True)
        with self.assertRaisesRegex(BridgeError, "Finish/cancel"):
            await service.branch_conversation("browser", first, next_id)
        self.assertEqual(len(service.conversations()["items"]), 1)
        with self.assertRaises(BridgeError):
            await service.decide("browser", permission, "allow", expected=next_id)
        self.assertEqual(service.journal.decision(permission), "pending")
        await service.decide("browser", permission, "deny", expected=first)
        await settle(service)
        hanging = await self.submit(service, "hang")
        await until(lambda: service.active and service.adapter.turn_id)
        with self.assertRaises(BridgeError):
            await service.cancel("browser", hanging["id"], expected=next_id)
        await service.cancel("browser", hanging["id"], expected=first)
        await settle(service)
        self.assertEqual(service.journal.command(hanging["id"])["state"], "cancelled")
        await service.select_conversation("browser", first, next_id, create=True)
        for operation in (
            lambda: service.submit("browser", {"id": command["id"], "kind": "prompt", "text": "permission", "conversationId": first}),
            lambda: service.cancel("browser", command["id"], expected=first),
            lambda: service.decide("browser", permission, "allow", expected=first),
            lambda: service.stop_operator("browser", "STOP OPERATOR", expected=first),
            lambda: service.save_settings("browser", first, "other-model"),
            lambda: service.select_conversation("browser", first, str(uuid.uuid4()), create=True),
        ):
            with self.assertRaises(BridgeError) as error:
                await operation()
            self.assertEqual(error.exception.code, "conversation_changed")
        self.assertEqual(service.journal.commands(), [])
        self.assertEqual(service.journal.pending(), [])
        with self.assertRaises(BridgeError):
            await service.select_conversation("browser", next_id, "../../elsewhere")

    async def test_queued_send_blocks_new_before_native_dispatch(self):
        service = await self.make("copilot")
        original = service.journal.get("conversation_id")
        await self.submit(service)
        with self.assertRaises(BridgeError) as error:
            await service.select_conversation("browser", original, str(uuid.uuid4()), create=True)
        self.assertEqual(error.exception.code, "conversation_busy")
        await settle(service)

    async def test_cancelled_detach_fails_closed_and_keeps_selected_journal(self):
        service = await self.make("copilot")
        original = service.journal.get("conversation_id")
        await self.submit(service)
        await settle(service)
        session = service.adapter.session
        disconnect = session.disconnect
        entered = asyncio.Event()

        async def wait_for_cancel():
            entered.set()
            await asyncio.Event().wait()

        session.disconnect = wait_for_cancel
        operation = asyncio.create_task(service.select_conversation(
            "browser", original, str(uuid.uuid4()), create=True))
        await entered.wait()
        operation.cancel()
        with self.assertRaises(asyncio.CancelledError):
            await operation
        session.disconnect = disconnect
        self.assertEqual(service.conversations()["conversationId"], original)
        self.assertFalse(service.connected)
        self.assertTrue(service.adapter.uncertain)
        with self.assertRaises(BridgeError):
            await service.select_conversation("browser", original, str(uuid.uuid4()), create=True)

    async def test_codex_native_fork_preserves_history_provenance_without_replaying_commands(self):
        service = await self.make("codex")
        source = service.journal.get("conversation_id")
        await service.save_settings("browser", source, "fixture-branch-model")
        await self.submit(service, "source history")
        await settle(service)
        native_source = service.native_session_id()
        service.draft("unsent branch draft")
        boundary = service.journal.latest()
        requests = []
        native_call = service.adapter.rpc.call

        async def traced(method, params, **kwargs):
            requests.append((method, params))
            return await native_call(method, params, **kwargs)

        service.adapter.rpc.call = traced
        target = str(uuid.uuid4())
        await service.branch_conversation("browser", source, target)
        native_target = service.native_session_id()
        self.assertNotEqual(native_source, native_target)
        self.assertEqual(service.journal.get("branch_from")["conversationId"], source)
        self.assertEqual(service.journal.get("branch_from")["sequence"], boundary)
        self.assertEqual(service.draft()["text"], "unsent branch draft")
        self.assertEqual(service.journal.commands(), [], "inherited messages are not executable command records")
        self.assertEqual(service.journal.pending(), [])
        self.assertEqual([m for m, _ in requests], ["thread/read", "thread/fork"])
        config = requests[-1][1]
        self.assertIs(config["deferGoalContinuation"], True)
        self.assertIs(config["excludeTurns"], True)
        self.assertEqual(config["sandbox"], "read-only")
        self.assertEqual(config["approvalsReviewer"], "user")
        self.assertEqual(config["model"], "fixture-branch-model")
        inherited = service.journal.events(0)["events"]
        self.assertEqual(len(inherited), boundary + 1)
        self.assertEqual(inherited[0]["data"]["inheritedFrom"], {"conversationId": source, "sequence": 1})
        await service.branch_conversation("browser", source, target)
        self.assertEqual(len(requests), 2, "duplicate HTTP request cannot issue another native fork")
        await service.select_conversation("browser", target, source)
        self.assertEqual(service.native_session_id(), native_source)
        self.assertEqual(service.journal.latest(), boundary, "source history is unchanged")
        self.assertEqual(service.settings()["model"], "fixture-branch-model")
        await service.select_conversation("browser", source, target)
        await service.adapter.stop()
        await service.close()
        restarted = await self.make("codex")
        self.assertEqual(restarted.native_session_id(), native_target)
        self.assertEqual(restarted.journal.events(0)["events"], inherited)
        self.assertEqual(restarted.journal.get("branch_from")["nativeSessionId"], native_source)
        await self.submit(restarted, "new branch turn")
        await settle(restarted)
        self.assertEqual(restarted.native_session_id(), native_target)
        self.assertEqual(len(restarted.journal.commands()), 1)

    async def test_native_fork_failure_is_retained_and_never_automatically_repeated(self):
        service = await self.make("codex")
        source = service.journal.get("conversation_id")
        await self.submit(service)
        await settle(service)
        native_call = service.adapter.rpc.call
        attempts = []

        async def interrupted(method, params, **kwargs):
            if method == "thread/fork":
                attempts.append(params)
                raise TimeoutError("synthetic uncertain native response")
            return await native_call(method, params, **kwargs)

        service.adapter.rpc.call = interrupted
        target = str(uuid.uuid4())
        with self.assertRaises(TimeoutError):
            await service.branch_conversation("browser", source, target)
        self.assertEqual(service.conversations()["conversationId"], source)
        self.assertEqual(len(attempts), 1)
        with self.assertRaises(BridgeError):
            await service.branch_conversation("browser", source, target)
        await service.stop_operator("browser", "STOP OPERATOR", expected=source)
        with self.assertRaises(BridgeError) as error:
            await service.branch_conversation("browser", source, target)
        self.assertEqual(error.exception.code, "branch_outcome_unknown")
        with self.assertRaises(BridgeError) as error:
            await service.select_conversation("browser", source, target)
        self.assertEqual(error.exception.code, "branch_incomplete")
        self.assertEqual(len(attempts), 1)

    async def test_fork_native_start_uses_two_provider_admission_warning(self):
        codex = await self.make("codex")
        copilot = await self.make("copilot")
        hub = OperatorHub({"copilot": copilot, "codex": codex})
        source = codex.journal.get("conversation_id")
        await self.submit(codex)
        await settle(codex)
        await codex.stop_operator("browser", "STOP OPERATOR", expected=source)
        await self.submit(copilot)
        await settle(copilot)
        request = {"conversationId": source, "id": str(uuid.uuid4())}
        with self.assertRaises(BridgeError) as error:
            await hub.branch("codex", "browser", request)
        self.assertEqual(error.exception.code, "operator_conflict")
        self.assertEqual(len(codex.conversations()["items"]), 1)
        self.assertEqual(len(self.rpcs), 1)
        await hub.branch("codex", "browser", {**request, "startAnyway": True})
        self.assertEqual(len(self.rpcs), 2)
        self.assertEqual(len(codex.conversations()["items"]), 2)
        before = codex.journal.latest()
        await hub.branch("codex", "browser", {**request, "startAnyway": True})
        self.assertEqual(codex.journal.latest(), before)
        self.assertTrue(copilot.connected)

    async def test_branch_rechecks_author_and_records_uncertainty_before_native_dispatch(self):
        service = await self.make("codex")
        source = service.journal.get("conversation_id")
        await self.submit(service)
        await settle(service)
        call = service.adapter.rpc.call
        methods = []

        async def disconnect(method, params, **kwargs):
            methods.append(method)
            self.assertTrue(service.journal.get("unsettled_native"), "crash marker precedes native dispatch")
            result = await call(method, params, **kwargs)
            if method == "thread/read":
                service.detach("browser")
            return result

        service.adapter.rpc.call = disconnect
        with self.assertRaises(BridgeError) as error:
            await service.branch_conversation("browser", source, str(uuid.uuid4()))
        self.assertEqual(error.exception.code, "browser_disconnected")
        self.assertEqual(methods, ["thread/read"])
        self.assertFalse(service.journal.get("unsettled_native"), "no fork was dispatched")
        self.assertFalse(service.branching)
        self.assertEqual(service.conversations()["conversationId"], source)

    async def test_pinned_copilot_fork_is_explicitly_unsupported(self):
        service = await self.make("copilot")
        self.assertFalse(service.branch_capability()["supported"])
        with self.assertRaises(BridgeError) as error:
            await service.branch_conversation("browser", service.journal.get("conversation_id"), str(uuid.uuid4()))
        self.assertEqual(error.exception.code, "branch_unsupported")
        self.assertEqual(self.clients, [], "unsupported branching starts no runtime or replay")
        self.assertEqual(len(service.conversations()["items"]), 1)

    async def test_interrupted_branch_preparation_cannot_open_as_blank_chat_after_restart(self):
        service = await self.make("codex")
        source = service.journal.get("conversation_id")
        identifier = str(uuid.uuid4())
        target = service.catalog.create(identifier, "Interrupted branch", {"model": None},
            branch_from={"conversationId": source, "nativeSessionId": "fixture-source", "sequence": 0, "created": 1})
        self.assertEqual(target.get("branch_state"), "prepared")
        target.close()
        await service.close()
        restarted = await self.make("codex")
        with self.assertRaises(BridgeError) as error:
            await restarted.select_conversation("browser", source, identifier)
        self.assertEqual(error.exception.code, "branch_incomplete")
        self.assertEqual(self.rpcs, [])
