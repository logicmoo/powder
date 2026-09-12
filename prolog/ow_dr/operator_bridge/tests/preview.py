"""Disposable offline browser fixture. No CLI/model adapter can be started."""
import asyncio
import socket

from aiohttp import web

from ..adapter import UnavailableAdapter
from ..security import Auth, HOST
from ..server import create_app
from .support import fixture, remove


async def main():
    directory, journal, _, service = fixture()
    service.adapter = UnavailableAdapter()
    auth = Auth("isolated fixture pairing phrase")
    sock = socket.socket()
    sock.bind(("127.0.0.1", 0))
    port = sock.getsockname()[1]
    stopped = asyncio.Event()
    app = create_app(service, auth, port)

    async def stop(request):
        asyncio.get_running_loop().call_later(0.2, stopped.set)
        return web.json_response({"stoppingFixture": True})

    app.router.add_post("/api/test/stop", stop)
    runner = web.AppRunner(app, access_log=None)
    try:
        await runner.setup()
        await web.SockSite(runner, sock).start()
        print(f"OFFLINE TEST FIXTURE http://{HOST}:{port}/", flush=True)
        await stopped.wait()
    finally:
        await runner.cleanup()
        remove(directory)


if __name__ == "__main__":
    asyncio.run(main())
