from __future__ import annotations

import asyncio
import socket
import unittest
import uuid

from aiohttp import ClientSession, WSMsgType, web

from ..security import Auth, COOKIE, HOST
from ..server import create_app
from .support import fixture, remove, settle, until


class HttpTests(unittest.IsolatedAsyncioTestCase):
    async def asyncSetUp(self):
        self.directory, self.journal, self.adapter, self.service = fixture()
        self.auth = Auth("isolated fixture pairing phrase")
        sock = socket.socket()
        sock.bind(("127.0.0.1", 0))
        self.port = sock.getsockname()[1]
        self.base = f"http://127.0.0.1:{self.port}"
        self.origin = f"http://{HOST}:{self.port}"
        self.headers = {"Host": f"{HOST}:{self.port}", "Origin": self.origin}
        self.runner = web.AppRunner(create_app(self.service, self.auth, self.port), access_log=None)
        await self.runner.setup()
        await web.SockSite(self.runner, sock).start()
        self.client = ClientSession()
        self.token = self.auth.login("isolated fixture pairing phrase")
        self.paired = {**self.headers, "Cookie": f"{COOKIE}={self.token}"}
        self.ws = None

    async def asyncTearDown(self):
        if self.ws:
            await self.ws.close()
        await self.client.close()
        await self.runner.cleanup()
        remove(self.directory)

    async def connect(self, since=0):
        self.ws = await self.client.ws_connect(f"{self.base}/events?since={since}", headers=self.paired)
        await self.ws.receive_json()
        return self.ws

    async def post(self, path, body):
        return await self.client.post(self.base + path, headers=self.paired,
            json={"conversationId": self.service.journal.get("conversation_id"), **body})

    async def test_auth_and_origin_checked_before_malformed_input(self):
        response = await self.client.post(self.base + "/api/commands", headers=self.headers,
                                          data="{not JSON", skip_auto_headers={"Content-Type"})
        self.assertEqual(response.status, 401)
        response = await self.client.post(self.base + "/api/commands",
            headers={**self.paired, "Origin": "http://localhost:3050"}, data="{not JSON")
        self.assertEqual(response.status, 403)
        self.assertEqual(self.journal.commands(), [])

    async def test_host_rebinding_and_teacher_origin_rejected(self):
        for headers in ({**self.paired, "Host": f"attacker.example:{self.port}"},
                        {**self.paired, "Origin": "null"},
                        {**self.paired, "Sec-Fetch-Site": "cross-site"}):
            response = await self.client.get(self.base + "/api/status", headers=headers)
            self.assertEqual(response.status, 403)

    async def test_native_login_cookie_is_http_only_host_only_strict(self):
        response = await self.client.post(self.base + "/login", headers=self.headers,
            data={"phrase": "isolated fixture pairing phrase"}, allow_redirects=False)
        self.assertEqual(response.status, 303)
        cookie = response.cookies[COOKIE]
        self.assertTrue(cookie["httponly"])
        self.assertEqual(cookie["samesite"], "Strict")
        self.assertEqual(cookie["domain"], "")
        self.assertNotIn(cookie.value, await response.text())

    async def test_websocket_replays_output_never_accepts_commands(self):
        await self.connect()
        response = await self.post("/api/commands", {"id": "start", "kind": "start_session"})
        self.assertEqual(response.status, 202)
        await settle(self.service)
        response = await self.post("/api/commands", {"id": "one", "kind": "prompt", "text": "<script>fixture</script>"})
        self.assertEqual(response.status, 202)
        await settle(self.service)
        await self.ws.close()
        await self.connect(0)
        async with asyncio.timeout(3):
            while True:
                batch = await self.ws.receive_json()
                if batch["type"] == "events" and any(e["kind"] == "assistant.output" for e in batch["events"]):
                    break
        self.assertEqual(self.adapter.sent, ["<script>fixture</script>"])
        await self.ws.send_json({"kind": "prompt", "text": "MUST NOT EXECUTE"})
        message = await self.ws.receive()
        self.assertIn(message.type, (WSMsgType.CLOSE, WSMsgType.CLOSED))
        self.assertEqual(self.adapter.sent, ["<script>fixture</script>"])

    async def test_permissions_require_online_authenticated_human(self):
        await self.connect()
        await self.post("/api/commands", {"id": "start", "kind": "start_session"})
        await settle(self.service)
        self.adapter.mode = "permission"
        await self.post("/api/commands", {"id": "write", "kind": "prompt", "text": "fixture"})
        await until(lambda: self.journal.pending())
        permission = self.journal.pending()[0]
        await self.ws.close()
        await until(lambda: not self.service.connections)
        response = await self.post("/api/permissions/" + permission["id"], {"decision": "allow"})
        self.assertEqual(response.status, 409)
        self.assertIsNone(self.adapter.approved)
        await self.connect()
        response = await self.post("/api/permissions/" + permission["id"], {"decision": "deny"})
        self.assertEqual(response.status, 200)
        await settle(self.service)
        self.assertFalse(self.adapter.approved)
        repeated = await self.post("/api/permissions/" + permission["id"], {"decision": "deny"})
        self.assertEqual(repeated.status, 200)

    async def test_rapid_conversation_roundtrip_replays_by_selection_revision(self):
        self.journal.event("assistant.output", {"text": "durable fixture history"})
        await self.connect()
        first = await self.ws.receive_json()
        self.assertEqual(first["type"], "events")
        original = self.journal.get("conversation_id")
        principal = next(iter(self.service.connections))
        other = str(uuid.uuid4())
        await self.service.select_conversation(principal, original, other, create=True)
        await self.service.select_conversation(principal, other, original)
        async with asyncio.timeout(3):
            while True:
                frame = await self.ws.receive_json()
                if frame["type"] == "events":
                    self.assertEqual(frame["selectionRevision"], self.service.catalog.revision())
                    self.assertEqual(frame["events"], first["events"])
                    break
        self.assertEqual(self.adapter.sent, [])

    async def test_reconnect_cursor_from_other_selection_is_reset(self):
        self.journal.event("assistant.output", {"text": "current fixture history"})
        self.ws = await self.client.ws_connect(
            f"{self.base}/events?since=999&conversationId={uuid.uuid4()}&revision=0", headers=self.paired)
        await self.ws.receive_json()
        async with asyncio.timeout(3):
            frame = await self.ws.receive_json()
        self.assertEqual(frame["type"], "events")
        self.assertEqual(frame["events"][0]["data"]["text"], "current fixture history")

    async def test_logout_closes_stream_and_revokes_input(self):
        await self.connect()
        response = await self.post("/api/logout", {})
        self.assertEqual(response.status, 200)
        response = await self.post("/api/commands", {"id": "blocked", "kind": "start_session"})
        self.assertEqual(response.status, 401)
        await until(lambda: not self.service.connections)
        self.assertFalse(self.adapter.starts)

    async def test_recovery_assets_and_draft_survive_browser_reconnect(self):
        for path, mime in (("/", "text/html"), ("/assets/recovery.css", "text/css"),
                           ("/assets/recovery.js", "text/javascript")):
            response = await self.client.get(self.base + path, headers=self.paired)
            self.assertEqual(response.status, 200)
            self.assertIn(mime, response.headers["Content-Type"])
            self.assertEqual(response.headers["Cache-Control"], "no-store")
        response = await self.post("/api/draft", {"text": "inspect only the fixture"})
        self.assertEqual(response.status, 200)
        result = await self.client.get(self.base + "/api/draft", headers=self.paired)
        self.assertEqual((await result.json())["text"], "inspect only the fixture")
        script = await self.client.get(self.base + "/assets/recovery.js", headers=self.paired)
        source = await script.text()
        self.assertNotIn("innerHTML", source)
        self.assertNotIn("localStorage", source)
        self.assertNotIn("socket.send", source)

    async def test_disconnected_bridge_does_not_contact_prolog_or_stop_adapter(self):
        await self.connect()
        self.service.app = {"configured": True, "online": False, "identityVerified": False,
                            "restartAvailable": False, "message": "Isolated Prolog fixture is offline."}
        response = await self.client.get(self.base + "/api/status", headers=self.paired)
        status = await response.json()
        self.assertTrue(status["bridge"]["online"])
        self.assertFalse(status["application"]["online"])
        self.assertEqual(self.adapter.stops, 0)


if __name__ == "__main__":
    unittest.main()
