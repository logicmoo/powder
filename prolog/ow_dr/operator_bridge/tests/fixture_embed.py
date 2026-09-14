"""Disposable browser peer. Native adapters run only synthetic SDK/stdio fixtures."""
from __future__ import annotations

import asyncio
import json
import socket
import sys
from pathlib import Path

from aiohttp import web
from copilot.generated.session_events import PermissionRequestRead

from ..copilot_adapter import CopilotAdapter
from ..codex_adapter import CodexAdapter
from ..hub import OperatorHub
from ..journal import Journal
from ..native import NativeCommand
from ..security import Auth, HOST
from ..server import create_app
from ..service import OperatorService
from ..stdio_rpc import StdioRpc
from .support import fixture, remove
from .test_native_adapters import FakeClient, FakeSession, FakeTree, fake_version

WEB = Path(__file__).resolve().parents[2] / "web"


class BrowserSession(FakeSession):
    async def send(self, text, *, agent_mode):
        if text != "permission":
            return await super().send(text, agent_mode=agent_mode)
        self.sent.append((text, agent_mode))
        result = await self.options["on_permission_request"](
            PermissionRequestRead(intention="inspect synthetic fixture", path=self.client.cwd),
            {"session_id": self.session_id})
        self.event("assistant.message", content="permission " + result.kind)
        self.event("session.idle")
        return "fixture-permission"


class BrowserClient(FakeClient):
    async def create_session(self, *, session_id, **options):
        await super().create_session(session_id=session_id, **options)
        self.cwd = options["working_directory"]
        self.session = BrowserSession(self, session_id, options)
        return self.session


async def main():
    directory, journal, _, first = fixture()
    clients, rpc_calls, cookies = [], [], []
    store = {}

    def client_factory(**options):
        client = BrowserClient(store, **options)
        clients.append(client)
        return client

    first.adapter = CopilotAdapter(NativeCommand("copilot", Path(sys.executable)), journal,
        model="fixture-copilot-model", client_factory=client_factory,
        version_probe=fake_version, tree_factory=FakeTree)

    def rpc_factory(_argv, cwd, notification, request):
        rpc = StdioRpc([sys.executable, str(Path(__file__).with_name("fixture_codex_stdio.py"))],
                       cwd, notification, request)
        call = rpc.call
        async def traced(method, params, **kwargs):
            rpc_calls.append(method)
            return await call(method, params, **kwargs)
        rpc.call = traced
        return rpc

    second_journal = Journal(directory / "codex.sqlite3", first.workspace, provider="codex")
    second = OperatorService(second_journal, first.workspace,
        CodexAdapter(NativeCommand("codex", Path(sys.executable)), second_journal,
                     model="fixture-codex-model", rpc_factory=rpc_factory, version_probe=fake_version),
        verify=lambda: None)
    hub = OperatorHub({"copilot": first, "codex": second})
    sockets = []
    for _ in range(2):
        sock = socket.socket()
        sock.bind(("127.0.0.1", 0))
        sockets.append(sock)
    bridge_port, parent_port = [sock.getsockname()[1] for sock in sockets]
    bridge_url = f"http://{HOST}:{bridge_port}"
    parent_url = f"http://localhost:{parent_port}"
    auth = Auth("isolated fixture pairing phrase")
    app = create_app(hub, auth, bridge_port, allowed_parent=parent_url)

    @web.middleware
    async def observations(request, handler):
        if request.path.startswith("/embed/api/"):
            cookies.append(bool(request.headers.get("Cookie")))
        return await handler(request)
    app.middlewares.insert(0, observations)
    stopped = asyncio.Event()
    parent = web.Application()

    async def document(request):
        return web.Response(text=(Path(__file__).with_name("fixture_embed.html").read_text(encoding="utf-8")
                                 .replace("{{BRIDGE}}", bridge_url)), content_type="text/html")

    async def module(request):
        if request.match_info["name"] not in ("operator-agent.js", "operator-agent.css"):
            raise web.HTTPNotFound()
        return web.FileResponse(WEB / request.match_info["name"])

    async def stats(request):
        return web.json_response({
            "copilotStarts": sum(client.starts for client in clients),
            "copilotPrompts": sum(len(client.session.sent) for client in clients if client.session),
            "codexStarts": rpc_calls.count("thread/start"),
            "codexPrompts": rpc_calls.count("turn/start"),
            "embedCookiesReceived": any(cookies),
            "commands": {provider: len(service.journal.commands()) for provider, service in hub.operators.items()},
            "connections": {provider: len(service.connections) for provider, service in hub.operators.items()},
        })

    async def stop(request):
        stopped.set()
        return web.json_response({"stopped": True})

    parent.router.add_get("/", document)
    parent.router.add_get("/web/{name}", module)
    parent.router.add_get("/fixture/stats", stats)
    parent.router.add_post("/fixture/stop", stop)
    runners = [web.AppRunner(app, access_log=None), web.AppRunner(parent, access_log=None)]
    try:
        for runner, sock in zip(runners, sockets):
            await runner.setup()
            await web.SockSite(runner, sock).start()
        print(json.dumps({"parentURL": parent_url, "bridgeURL": bridge_url}), flush=True)
        await stopped.wait()
    finally:
        # These are owned synthetic peers, not production operators. Release their
        # working-directory handles before removing this disposable Windows fixture.
        await asyncio.gather(first.adapter.stop(), second.adapter.stop(), return_exceptions=True)
        for runner in runners:
            await runner.cleanup()
        remove(directory)


if __name__ == "__main__":
    asyncio.run(main())
