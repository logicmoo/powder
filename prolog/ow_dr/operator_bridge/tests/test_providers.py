from __future__ import annotations

import asyncio
import socket
import unittest
from unittest.mock import patch

from aiohttp import ClientSession, web

from ..adapter import UnavailableAdapter
from ..hub import OperatorHub
from ..journal import Journal
from ..providers import discover_executable
from ..security import Auth, COOKIE, HOST
from ..server import create_app
from ..service import OperatorService
from ..workspace import BridgeError
from .support import FakeAdapter, fixture, remove, settle, until


def dual_fixture():
    directory, _, copilot, first = fixture()
    second = OperatorService(
        Journal(directory / "codex.sqlite3", first.workspace, provider="codex"),
        first.workspace, FakeAdapter("codex"), verify=lambda: None)
    copilot.session_id = "copilot-native"
    second.adapter.session_id = "codex-native"
    first.adapter.auth_marker, second.adapter.auth_marker = object(), object()
    return directory, OperatorHub({"copilot": first, "codex": second})


class ProviderTests(unittest.IsolatedAsyncioTestCase):
    async def asyncSetUp(self):
        self.directory, self.hub = dual_fixture()
        await self.hub.run()
        for operator in self.hub.operators.values():
            operator.attach("human")

    async def asyncTearDown(self):
        await self.hub.close()
        remove(self.directory)

    async def start(self, provider, **extra):
        command = await self.hub.submit(provider, "human",
            {"id": "start", "kind": "start_session", **extra})
        await settle(self.hub.get(provider))
        return command

    async def test_second_operator_warns_then_start_anyway_allows_both(self):
        await self.start("copilot")
        with self.assertRaises(BridgeError) as caught:
            await self.start("codex")
        self.assertEqual(caught.exception.code, "operator_conflict")
        self.assertTrue(caught.exception.details["allowedWithConfirmation"])
        self.assertEqual(self.hub.get("codex").adapter.starts, [])
        await self.start("codex", startAnyway=True)
        self.assertTrue(all(service.connected for service in self.hub.operators.values()))
        self.assertEqual(self.hub.get("copilot").adapter.stops, 0)
        self.assertEqual(self.hub.get("codex").status()["role"],
            "Codex operator — Maintain code, inspect failures and manage services")

    async def test_confirmed_provider_stop_can_resume_without_restarting_other(self):
        first, second = self.hub.get("copilot"), self.hub.get("codex")
        first.adapter_factory = lambda: FakeAdapter("copilot")
        await self.start("copilot")
        await self.start("codex", startAnyway=True)
        prior_id = first.native_session_id()
        prior_adapter = first.adapter
        await first.stop_operator("human", "STOP OPERATOR")
        self.assertTrue(first.status()["canRestart"])
        with self.assertRaises(BridgeError):
            await self.hub.submit("copilot", "human", {"id": "restart", "kind": "start_session"})
        await self.hub.submit("copilot", "human",
            {"id": "restart", "kind": "start_session", "startAnyway": True})
        await settle(first)
        self.assertIsNot(first.adapter, prior_adapter)
        self.assertEqual(first.adapter.starts, [prior_id])
        self.assertEqual(second.adapter.stops, 0)
        self.assertEqual(len(second.adapter.starts), 1)

    async def test_simultaneous_start_admission_does_not_silently_skip_warning(self):
        results = await asyncio.gather(
            self.hub.submit("copilot", "human", {"id": "cop-start", "kind": "start_session"}),
            self.hub.submit("codex", "human", {"id": "cod-start", "kind": "start_session"}),
            return_exceptions=True)
        self.assertEqual(sum(isinstance(value, BridgeError) for value in results), 1)
        error = next(value for value in results if isinstance(value, BridgeError))
        self.assertEqual(error.code, "operator_conflict")

    async def test_browser_cwd_and_non_boolean_override_are_rejected(self):
        for change in ({"cwd": "elsewhere"}, {"workspace": "elsewhere"}, {"startAnyway": "true"}):
            with self.assertRaises(BridgeError):
                await self.hub.submit("codex", "human", {"id": "bad", "kind": "start_session", **change})
        self.assertFalse(self.hub.get("codex").adapter.starts)

    async def test_each_new_and_resumed_session_receives_only_trusted_cwd(self):
        for provider in ("copilot", "codex"):
            operator = self.hub.get(provider)
            operator.journal.set("native_session_id", provider + "-saved")
            await self.start(provider, startAnyway=True)
            self.assertEqual(operator.adapter.starts, [provider + "-saved"])
            self.assertEqual(operator.adapter.start_cwds, [self.hub.workspace.root])
            self.assertEqual(operator.journal.get("native_session_id"), provider + "-saved")

    async def test_cross_repository_session_is_not_allowed_to_receive_prompts(self):
        operator = self.hub.get("codex")
        operator.journal.set("native_session_id", "foreign-session")
        operator.adapter.return_cwd = str(self.directory / "another-repository")
        await self.start("codex")
        self.assertFalse(operator.connected)
        self.assertEqual(operator.journal.command("start")["state"], "unknown")
        await self.hub.submit("codex", "human", {"id": "prompt", "kind": "prompt", "text": "fixture"})
        await settle(operator)
        self.assertEqual(operator.adapter.sent, [])

    async def test_wrong_process_cwd_also_refuses_session(self):
        operator = self.hub.get("copilot")
        operator.adapter.return_process_cwd = str(self.directory / "other-process-root")
        await self.start("copilot")
        self.assertFalse(operator.connected)
        self.assertEqual(operator.journal.command("start")["state"], "unknown")

    async def test_independent_auth_history_drafts_permission_and_cancel_routing(self):
        await self.start("copilot")
        await self.start("codex", startAnyway=True)
        copilot, codex = self.hub.get("copilot"), self.hub.get("codex")
        self.assertIsNot(copilot.adapter.auth_marker, codex.adapter.auth_marker)
        copilot.draft("copilot draft")
        codex.draft("codex draft")
        copilot.adapter.mode = codex.adapter.mode = "permission"
        await self.hub.submit("copilot", "human", {"id": "same-id", "kind": "prompt", "text": "copilot fixture"})
        await self.hub.submit("codex", "human", {"id": "same-id", "kind": "prompt", "text": "codex fixture"})
        await until(lambda: copilot.journal.pending() and codex.journal.pending())
        request = copilot.journal.pending()[0]
        with self.assertRaises(BridgeError):
            await codex.decide("human", request["id"], "allow")
        await codex.cancel("human", "same-id")
        await settle(codex)
        self.assertEqual(copilot.adapter.cancelled, 0)
        self.assertIsNone(copilot.adapter.approved)
        await copilot.decide("human", request["id"], "deny")
        await settle(copilot)
        self.assertNotIn("codex fixture", str(copilot.journal.events(0)))
        self.assertNotIn("copilot fixture", str(codex.journal.events(0)))
        self.assertEqual(copilot.draft()["text"], "copilot draft")
        self.assertEqual(codex.draft()["text"], "codex draft")
        self.assertNotEqual(copilot.journal.get("conversation_id"), codex.journal.get("conversation_id"))

    async def test_repeated_start_acknowledgement_never_creates_second_native(self):
        await self.start("copilot")
        await self.start("codex", startAnyway=True)
        await self.start("copilot")
        await self.start("codex", startAnyway=True)
        self.assertEqual(len(self.hub.get("copilot").adapter.starts), 1)
        self.assertEqual(len(self.hub.get("codex").adapter.starts), 1)

    async def test_stop_one_provider_does_not_stop_other(self):
        await self.start("copilot")
        await self.start("codex", startAnyway=True)
        await self.hub.get("codex").stop_operator("human", "STOP OPERATOR")
        self.assertEqual(self.hub.get("copilot").adapter.stops, 0)
        self.assertTrue(self.hub.get("copilot").connected)

    async def test_provider_journal_cannot_be_reused_by_other_provider(self):
        with self.assertRaisesRegex(BridgeError, "another provider"):
            Journal(self.directory / "journal.sqlite3", self.hub.workspace, provider="codex")

    async def test_native_adapter_cannot_be_assigned_to_other_provider(self):
        with self.assertRaisesRegex(BridgeError, "cannot cross"):
            OperatorService(self.hub.get("codex").journal, self.hub.workspace,
                            FakeAdapter("copilot"), verify=lambda: None)

    async def test_discovery_is_passive_and_does_not_authenticate_or_start(self):
        with patch("shutil.which", side_effect=["copilot-fixture.exe", None]) as lookup:
            first, second = discover_executable("copilot"), discover_executable("codex")
        self.assertEqual(lookup.call_count, 2)
        self.assertTrue(first["found"])
        self.assertFalse(second["found"])
        self.assertFalse(first["protocolVerified"])
        self.assertEqual(first["authentication"], "not_checked")
        self.assertFalse(UnavailableAdapter("codex").available)


class ProviderHttpTests(unittest.IsolatedAsyncioTestCase):
    async def asyncSetUp(self):
        self.directory, self.hub = dual_fixture()
        sock = socket.socket()
        sock.bind(("127.0.0.1", 0))
        port = sock.getsockname()[1]
        self.base = f"http://127.0.0.1:{port}"
        auth = Auth("isolated provider fixture phrase")
        token = auth.login("isolated provider fixture phrase")
        self.headers = {"Host": f"{HOST}:{port}", "Origin": f"http://{HOST}:{port}",
                        "Cookie": f"{COOKIE}={token}"}
        self.runner = web.AppRunner(create_app(self.hub, auth, port), access_log=None)
        await self.runner.setup()
        await web.SockSite(self.runner, sock).start()
        self.client = ClientSession()
        self.sockets = []
        for provider in ("copilot", "codex"):
            ws = await self.client.ws_connect(self.base + "/events/" + provider, headers=self.headers)
            frame = await ws.receive_json()
            self.assertEqual(frame["provider"], provider)
            self.sockets.append(ws)

    async def asyncTearDown(self):
        for ws in self.sockets:
            await ws.close()
        await self.client.close()
        await self.runner.cleanup()
        remove(self.directory)

    async def post(self, provider, path, value):
        return await self.client.post(self.base + "/api/operators/" + provider + path,
                                      headers=self.headers, json=value)

    async def test_http_warning_can_be_acknowledged_and_permissions_stay_separate(self):
        response = await self.post("copilot", "/commands", {"id": "start", "kind": "start_session"})
        self.assertEqual(response.status, 202)
        await settle(self.hub.get("copilot"))
        response = await self.post("codex", "/commands", {"id": "start", "kind": "start_session"})
        self.assertEqual(response.status, 409)
        self.assertTrue((await response.json())["error"]["allowedWithConfirmation"])
        response = await self.post("codex", "/commands",
                                   {"id": "start", "kind": "start_session", "startAnyway": True})
        self.assertEqual(response.status, 202)
        await settle(self.hub.get("codex"))
        self.hub.get("codex").adapter.mode = "permission"
        await self.post("codex", "/commands", {"id": "write", "kind": "prompt", "text": "codex fixture"})
        await until(lambda: self.hub.get("codex").journal.pending())
        self.assertIsNone(self.hub.get("codex").adapter.approved)
        request = self.hub.get("codex").journal.pending()[0]
        wrong = await self.post("copilot", "/permissions/" + request["id"], {"decision": "allow"})
        self.assertEqual(wrong.status, 409)
        right = await self.post("codex", "/permissions/" + request["id"], {"decision": "deny"})
        self.assertEqual(right.status, 200)
        await settle(self.hub.get("codex"))

    async def test_provider_reconnect_replays_only_its_output_without_input(self):
        for provider in ("copilot", "codex"):
            await self.post(provider, "/commands", {"id": "start", "kind": "start_session", "startAnyway": True})
            await settle(self.hub.get(provider))
            await self.post(provider, "/commands", {"id": "message", "kind": "prompt", "text": provider + " fixture"})
            await settle(self.hub.get(provider))
        await self.sockets[1].close()
        ws = await self.client.ws_connect(self.base + "/events/codex?since=0", headers=self.headers)
        self.sockets.append(ws)
        await ws.receive_json()
        async with asyncio.timeout(3):
            while True:
                frame = await ws.receive_json()
                if frame["type"] == "events" and any(e["kind"] == "assistant.output" for e in frame["events"]):
                    break
        self.assertEqual(frame["provider"], "codex")
        self.assertNotIn("copilot fixture", str(frame))
        self.assertEqual(self.hub.get("copilot").adapter.sent, ["copilot fixture"])
        self.assertEqual(self.hub.get("codex").adapter.sent, ["codex fixture"])

    async def test_overview_has_one_bridge_and_two_independent_actor_identities(self):
        response = await self.client.get(self.base + "/api/operators", headers=self.headers)
        data = await response.json()
        self.assertEqual(len(data["operators"]), 2)
        self.assertEqual({row["provider"] for row in data["operators"]}, {"copilot", "codex"})
        self.assertEqual(len({row["bridge"]["instanceId"] for row in data["operators"]}), 1)
        self.assertEqual(len({row["conversationId"] for row in data["operators"]}), 2)
