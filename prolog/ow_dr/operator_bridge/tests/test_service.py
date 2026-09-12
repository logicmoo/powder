from __future__ import annotations

import asyncio
import unittest

from ..journal import Journal
from ..security import Auth, InstanceLock, private_directory
from ..workspace import BridgeError, Workspace
from .support import fixture, remove, settle, until


class ServiceTests(unittest.IsolatedAsyncioTestCase):
    async def asyncSetUp(self):
        self.directory, self.journal, self.adapter, self.service = fixture()
        await self.service.run()
        self.service.attach("human")
        await self.service.submit("human", {"id": "start", "kind": "start_session"})
        await settle(self.service)

    async def asyncTearDown(self):
        await self.service.close()
        remove(self.directory)

    async def test_idempotent_serialized_dispatch_and_replay(self):
        self.adapter.mode = "block"
        body = {"id": "one", "kind": "prompt", "text": "first"}
        await self.service.submit("human", body)
        await self.service.submit("human", body)
        await self.service.submit("human", {"id": "two", "kind": "prompt", "text": "second"})
        await until(lambda: self.adapter.sent)
        self.assertEqual(self.adapter.sent, ["first"])
        self.assertEqual(self.journal.command("two")["state"], "queued")
        before = self.journal.events(0)
        self.service.detach("human")
        self.service.attach("human")
        self.assertEqual(before, self.journal.events(0))
        self.assertEqual(self.adapter.sent, ["first"])
        self.adapter.gate.set()
        await settle(self.service)
        self.assertEqual(self.adapter.sent, ["first", "second"])

    async def test_conflicting_id_never_resends(self):
        await self.service.submit("human", {"id": "same", "kind": "prompt", "text": "one"})
        with self.assertRaisesRegex(BridgeError, "different input"):
            await self.service.submit("human", {"id": "same", "kind": "prompt", "text": "two"})
        await settle(self.service)
        self.assertEqual(self.adapter.sent, ["one"])

    async def test_permissions_pause_while_disconnected(self):
        self.adapter.mode = "permission"
        await self.service.submit("human", {"id": "write", "kind": "prompt", "text": "a fixture"})
        await until(lambda: self.journal.pending())
        request = self.journal.pending()[0]
        self.service.detach("human")
        with self.assertRaisesRegex(BridgeError, "Connect"):
            await self.service.decide("human", request["id"], "allow")
        self.assertIsNone(self.adapter.approved)
        self.service.attach("human")
        await self.service.decide("human", request["id"], "deny")
        await settle(self.service)
        self.assertFalse(self.adapter.approved)

    async def test_queued_cancellation_never_dispatches(self):
        self.adapter.mode = "block"
        await self.service.submit("human", {"id": "busy", "kind": "prompt", "text": "first"})
        await self.service.submit("human", {"id": "cancelled", "kind": "prompt", "text": "second"})
        await self.service.cancel("human", "cancelled")
        self.adapter.gate.set()
        await settle(self.service)
        self.assertEqual(self.adapter.sent, ["first"])
        self.assertEqual(self.journal.command("cancelled")["state"], "cancelled")

    async def test_adapter_exception_is_unknown_not_secret_output(self):
        self.adapter.mode = "unknown"
        await self.service.submit("human", {"id": "uncertain", "kind": "prompt", "text": "fixture"})
        await settle(self.service)
        self.assertEqual(self.journal.command("uncertain")["state"], "unknown")
        self.assertNotIn("not-for-browser", str(self.journal.events(0)))

    async def test_stop_requires_explicit_human_confirmation(self):
        with self.assertRaises(BridgeError):
            await self.service.stop_operator("human", "yes")
        self.assertEqual(self.adapter.stops, 0)
        await self.service.stop_operator("human", "STOP OPERATOR")
        self.assertEqual(self.adapter.stops, 1)
        self.assertTrue(self.service.status()["bridge"]["online"])

    async def test_repeated_stop_never_stops_twice_or_restarts_queued_session(self):
        self.adapter.mode = "block"
        await self.service.submit("human", {"id": "busy", "kind": "prompt", "text": "first"})
        await self.service.submit("human", {"id": "another-start", "kind": "start_session"})
        await until(lambda: self.adapter.sent)
        await asyncio.gather(self.service.stop_operator("human", "STOP OPERATOR"),
                             self.service.stop_operator("human", "STOP OPERATOR"))
        await settle(self.service)
        self.assertEqual(self.adapter.stops, 1)
        self.assertEqual(len(self.adapter.starts), 1)
        self.assertEqual(self.journal.command("another-start")["state"], "cancelled")

    async def test_duplicate_session_start_does_not_create_another_cli(self):
        await self.service.submit("human", {"id": "another-start", "kind": "start_session"})
        await settle(self.service)
        self.assertEqual(len(self.adapter.starts), 1)

    async def test_unsafe_or_incomplete_permission_projection_is_denied(self):
        self.service.active = "start"
        try:
            self.assertFalse(await self.service.permission("read", "Credentials", "secret=do-not-expose"))
            self.assertFalse(await self.service.permission("write", "Long request", "x" * 4097))
            self.assertEqual(self.journal.pending(), [])
        finally:
            self.service.active = None

    async def test_bridge_close_does_not_stop_cli_or_replay_commands(self):
        self.adapter.mode = "block"
        await self.service.submit("human", {"id": "interrupted", "kind": "prompt", "text": "first"})
        await until(lambda: self.adapter.sent)
        await self.service.close()
        self.assertEqual(self.adapter.stops, 0)
        resumed = Journal(self.directory / "journal.sqlite3", self.service.workspace)
        self.assertEqual(resumed.command("interrupted")["state"], "unknown")
        self.assertEqual(resumed.get("sdk_session_id"), "documented-test-session")
        self.service.journal = resumed
        self.service.task = None

    async def test_workspace_change_prevents_input(self):
        def changed():
            raise BridgeError("workspace_changed", "changed")
        self.service.verify = changed
        with self.assertRaises(BridgeError):
            await self.service.submit("human", {"id": "blocked", "kind": "prompt", "text": "fixture"})
        self.assertEqual(self.adapter.sent, [])

    async def test_teacher_is_not_an_operator_principal(self):
        with self.assertRaises(BridgeError):
            await self.service.submit("teacher", {"id": "escalate", "kind": "prompt", "text": "fixture"})
        with self.assertRaises(BridgeError):
            await self.service.submit("human", {"id": "shell", "kind": "shell", "text": "not supported"})

    async def test_permission_invalid_choice_never_approves(self):
        self.adapter.mode = "permission"
        await self.service.submit("human", {"id": "write", "kind": "prompt", "text": "fixture"})
        await until(lambda: self.journal.pending())
        request = self.journal.pending()[0]
        with self.assertRaises(BridgeError):
            await self.service.decide("human", request["id"], "auto")
        self.assertIsNone(self.adapter.approved)
        await self.service.cancel("human", "write")
        await settle(self.service)
        self.assertFalse(self.adapter.approved)


class SecurityTests(unittest.TestCase):
    def test_pairing_expiry_failure_and_no_persisted_secret(self):
        auth = Auth("a long local pairing phrase", lifetime=0)
        with self.assertRaises(BridgeError):
            auth.login("wrong")
        token = auth.login("a long local pairing phrase")
        with self.assertRaises(BridgeError):
            auth.require(token)
        self.assertNotIn(token, str(auth.sessions))
        self.assertNotIn("a long local pairing phrase", str(vars(auth)))

    def test_owner_directory_and_native_instance_lock(self):
        directory, journal, _, _ = fixture()
        try:
            private_directory(directory)
            first = InstanceLock(directory)
            try:
                with self.assertRaises(BridgeError):
                    InstanceLock(directory)
            finally:
                first.close()
            second = InstanceLock(directory)
            second.close()
        finally:
            journal.close()
            remove(directory)

    def test_journal_refuses_other_workspace(self):
        directory, journal, _, service = fixture()
        journal.close()
        try:
            with self.assertRaises(BridgeError):
                Journal(directory / "journal.sqlite3", Workspace("different", "master"))
        finally:
            remove(directory)


if __name__ == "__main__":
    unittest.main()
