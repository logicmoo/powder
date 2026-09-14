from __future__ import annotations

import asyncio
import json
import re
import socket
import uuid
import unittest

from aiohttp import ClientSession, web

from ..embed import EmbedAuth, EMBED_HEADER, parent_origin
from ..security import Auth, COOKIE, HOST
from ..server import create_app
from ..workspace import BridgeError
from .support import remove, settle, until
from .test_providers import dual_fixture

PHRASE = "isolated fixture pairing phrase"


class EmbedTests(unittest.IsolatedAsyncioTestCase):
    async def asyncSetUp(self):
        asyncio.get_running_loop().slow_callback_duration = 2
        self.directory, self.hub = dual_fixture()
        self.auth = Auth(PHRASE)
        sock = socket.socket()
        sock.bind(("127.0.0.1", 0))
        self.port = sock.getsockname()[1]
        self.base = f"http://127.0.0.1:{self.port}"
        self.origin = f"http://{HOST}:{self.port}"
        self.headers = {"Host": f"{HOST}:{self.port}", "Origin": self.origin,
                        "Sec-Fetch-Site": "same-origin"}
        self.runner = web.AppRunner(create_app(self.hub, self.auth, self.port), access_log=None)
        await self.runner.setup()
        await web.SockSite(self.runner, sock).start()
        self.client = ClientSession()
        self.streams = []

    async def asyncTearDown(self):
        for stream in self.streams:
            stream.close()
        await self.client.close()
        await self.runner.cleanup()
        remove(self.directory)

    async def pair(self, provider="copilot"):
        response = await self.client.post(self.base + "/embed/login", headers=self.headers,
                                         data={"provider": provider, "phrase": PHRASE})
        self.assertEqual(response.status, 200)
        self.assertFalse(response.cookies)
        body = await response.text()
        self.assertNotIn(PHRASE, body)
        token = re.search('data-capability="([^"]+)"', body)[1]
        return {**self.headers, EMBED_HEADER: token}

    async def post(self, provider, suffix, headers, data=None):
        if data is not None and suffix not in ("/events", "/logout", "/draft/read", "/status"):
            data = {"conversationId": self.hub.get(provider).journal.get("conversation_id"), **data}
        return await self.client.post(f"{self.base}/embed/api/{provider}{suffix}",
                                      headers=headers, json={} if data is None else data)

    async def stream(self, provider, headers):
        stream = await self.post(provider, "/events", headers, {"since": 0})
        self.assertEqual(stream.status, 200)
        self.streams.append(stream)
        await stream.content.readline()
        return stream

    async def test_all_mutations_require_selected_conversation_and_stream_resets(self):
        paired = await self.pair()
        stream = await self.stream("copilot", paired)
        operator = self.hub.get("copilot")
        original = operator.journal.get("conversation_id")
        operator.journal.event("assistant.output", {"text": "original fixture transcript"})
        operator.draft("original fixture draft")
        next_id = str(uuid.uuid4())
        created = await self.post("copilot", "/conversations/new", paired,
                                  {"conversationId": original, "id": next_id})
        self.assertEqual(created.status, 200)
        self.assertIsNone(operator.native_session_id())
        self.assertEqual(operator.draft()["text"], "")
        stale = [
            ("/commands", {"id": "stale", "kind": "prompt", "text": "never dispatch", "startIfNeeded": True}),
            ("/commands/stale/cancel", {}),
            ("/permissions/stale", {"decision": "allow"}),
            ("/stop", {"confirmation": "STOP OPERATOR"}),
            ("/draft", {"text": "must not overwrite"}),
            ("/settings", {"model": "must-not-change"}),
            ("/conversations/new", {"id": str(uuid.uuid4())}),
            ("/conversations/select", {"id": original}),
            ("/conversations/branch", {"id": str(uuid.uuid4())}),
        ]
        for route, body in stale:
            for expected in (original, self.hub.get("codex").journal.get("conversation_id"), None):
                result = await self.post("copilot", route, paired, {**body, "conversationId": expected})
                self.assertEqual(result.status, 409, (route, await result.text()))
        self.assertEqual(operator.journal.commands(), [])
        self.assertEqual(operator.draft()["text"], "")
        self.assertEqual(len(operator.conversations()["items"]), 2)
        async with asyncio.timeout(3):
            while True:
                import json
                snapshot = json.loads(await stream.content.readline())
                if snapshot["data"]["conversationId"] == next_id:
                    self.assertEqual(snapshot["lastSequence"], 0)
                    self.assertEqual(snapshot["events"], [])
                    break
        selected = await self.post("copilot", "/conversations/select", paired,
                                   {"conversationId": next_id, "id": original})
        self.assertEqual(selected.status, 200)
        self.assertEqual(operator.draft()["text"], "original fixture draft")
        self.assertFalse(operator.adapter.starts)
        self.assertFalse(operator.adapter.sent)

    async def test_only_embed_document_allows_one_configured_ancestor(self):
        for route in ("/", "/api/status", "/embed", "/embed?provider=codex"):
            response = await self.client.get(self.base + route, headers=self.headers)
            csp = response.headers["Content-Security-Policy"]
            if route.startswith("/embed"):
                self.assertIn("frame-ancestors http://localhost:3050;", csp)
                self.assertNotIn("X-Frame-Options", response.headers)
            else:
                self.assertIn("frame-ancestors 'none'", csp)
                self.assertEqual(response.headers["X-Frame-Options"], "DENY")
            self.assertNotIn("Access-Control-Allow-Origin", response.headers)
        self.assertFalse(self.hub.get("copilot").adapter.starts)
        self.assertFalse(self.hub.get("codex").adapter.starts)

    async def test_rapid_return_to_same_conversation_resets_embedded_cursor(self):
        paired = await self.pair()
        operator = self.hub.get("copilot")
        operator.journal.event("assistant.output", {"text": "retained fixture"})
        original = operator.journal.get("conversation_id")
        stream = await self.stream("copilot", paired)
        principal = next(iter(operator.connections))
        other = str(uuid.uuid4())
        await operator.select_conversation(principal, original, other, create=True)
        await operator.select_conversation(principal, other, original)
        async with asyncio.timeout(3):
            frame = json.loads(await stream.content.readline())
        self.assertEqual(frame["data"]["selectionRevision"], operator.catalog.revision())
        self.assertEqual(frame["events"][0]["data"]["text"], "retained fixture")
        self.assertFalse(operator.adapter.sent)

    async def test_cookie_and_embed_auth_are_not_interchangeable(self):
        paired = await self.pair()
        response = await self.client.get(self.base + "/api/status", headers=paired)
        self.assertEqual(response.status, 401)
        cookie = self.auth.login(PHRASE)
        response = await self.post("copilot", "/status",
                                  {**self.headers, "Cookie": f"{COOKIE}={cookie}"})
        self.assertEqual(response.status, 401)
        response = await self.post("codex", "/status", paired)
        self.assertEqual(response.status, 403)
        self.assertEqual(self.auth.sessions.keys(), {self.auth.require(cookie)})

    async def test_embed_requires_own_origin_host_and_fetch_site_before_commands(self):
        paired = await self.pair()
        for change in ({"Origin": "http://localhost:3050"}, {"Origin": "null"},
                       {"Origin": ""}, {"Sec-Fetch-Site": "cross-site"},
                       {"Host": f"localhost:{self.port}"}):
            response = await self.post("copilot", "/commands", {**paired, **change},
                                       {"id": "forbidden", "kind": "start_session"})
            self.assertEqual(response.status, 403)
            self.assertNotIn("Access-Control-Allow-Origin", response.headers)
        self.assertFalse(self.hub.get("copilot").journal.commands())

    async def test_disconnection_revokes_capability_and_permissions_fail_closed(self):
        paired = await self.pair()
        stream = await self.stream("copilot", paired)
        first = self.hub.get("copilot")
        await self.post("copilot", "/commands", paired, {"id": "start", "kind": "start_session"})
        await settle(first)
        first.adapter.mode = "permission"
        await self.post("copilot", "/commands", paired,
                        {"id": "write", "kind": "prompt", "text": "fixture"})
        await until(lambda: first.journal.pending())
        permission = first.journal.pending()[0]["id"]
        stream.close()
        await until(lambda: not first.connections)
        response = await self.post("copilot", "/permissions/" + permission, paired, {"decision": "allow"})
        self.assertEqual(response.status, 401)
        self.assertIsNone(first.adapter.approved)
        repaired = await self.pair()
        await self.stream("copilot", repaired)
        response = await self.post("copilot", "/permissions/" + permission, repaired, {"decision": "deny"})
        self.assertEqual(response.status, 200)
        await settle(first)
        self.assertFalse(first.adapter.approved)
        self.assertEqual(first.adapter.sent, ["fixture"])
        self.assertEqual(len(first.adapter.starts), 1)

    async def test_two_provider_confirmation_output_replay_and_draft_isolation(self):
        copilot, codex = await self.pair(), await self.pair("codex")
        await self.stream("copilot", copilot)
        await self.stream("codex", codex)
        start = {"id": "start", "kind": "start_session"}
        await self.post("copilot", "/commands", copilot, start)
        await settle(self.hub.get("copilot"))
        response = await self.post("codex", "/commands", codex, start)
        self.assertEqual(response.status, 409)
        response = await self.post("codex", "/commands", codex, {**start, "startAnyway": True})
        self.assertEqual(response.status, 202)
        await settle(self.hub.get("codex"))
        await self.post("copilot", "/draft", copilot, {"text": "copilot only"})
        response = await self.post("codex", "/draft/read", codex)
        self.assertEqual((await response.json())["text"], "")
        await self.post("copilot", "/logout", copilot)
        self.assertFalse(self.hub.get("copilot").connections)
        self.assertTrue(self.hub.get("codex").connections)
        response = await self.post("copilot", "/status", copilot)
        self.assertEqual(response.status, 401)
        for service in self.hub.operators.values():
            self.assertEqual(len(service.adapter.starts), 1)
            self.assertEqual(service.adapter.sent, [])

    async def test_revoked_author_cannot_dispatch_queued_work_using_another_view(self):
        paired, other = await self.pair(), await self.pair()
        await self.stream("copilot", paired)
        await self.stream("copilot", other)
        operator = self.hub.get("copilot")
        await self.post("copilot", "/commands", paired, {"id": "start", "kind": "start_session"})
        await settle(operator)
        operator.adapter.mode = "block"
        await self.post("copilot", "/commands", paired,
                        {"id": "running", "kind": "prompt", "text": "running fixture"})
        await until(lambda: operator.adapter.sent)
        await self.post("copilot", "/commands", paired,
                        {"id": "queued", "kind": "prompt", "text": "must not dispatch"})
        await self.post("copilot", "/logout", paired)
        operator.adapter.gate.set()
        await settle(operator)
        self.assertEqual(operator.adapter.sent, ["running fixture"])
        self.assertEqual(operator.journal.command("queued")["state"], "failed")

    def test_parent_configuration_rejects_non_origins_and_non_loopback(self):
        for value in ("null", "*", "http://localhost:3050/", "http://localhost:3050/path",
                      "http://operator.localhost:8063", "http://evil.test:3050",
                      "http://user@localhost:3050", "http://localhost:3050#x"):
            with self.assertRaises(BridgeError):
                parent_origin(value)

    def test_unclaimed_capability_expires_and_is_never_a_cookie_session(self):
        auth = EmbedAuth(self.auth)
        token = auth.login(PHRASE, "copilot")
        self.assertEqual(self.auth.sessions, {})
        auth.sessions[auth.key(token)]["connectBy"] = 0
        with self.assertRaises(BridgeError):
            auth.require(token, "copilot")


if __name__ == "__main__":
    unittest.main()
