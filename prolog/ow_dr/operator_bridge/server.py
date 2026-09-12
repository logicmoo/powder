from __future__ import annotations

import asyncio
import json
from pathlib import Path

from aiohttp import WSMsgType, web

from .security import Auth, COOKIE, HOST
from .service import OperatorService
from .hub import OperatorHub
from .workspace import BridgeError

STATIC = Path(__file__).with_name("static")
PRINCIPAL = web.RequestKey("operator_principal", str)


def create_app(service: OperatorService | OperatorHub, auth: Auth, port: int) -> web.Application:
    authority = f"{HOST}:{port}"
    origin = f"http://{authority}"

    def selected(request) -> OperatorService:
        provider = request.match_info.get("provider", "copilot")
        if isinstance(service, OperatorHub):
            return service.get(provider)
        if provider != service.provider:
            raise BridgeError("unknown_provider", "This test instance does not contain that provider.", 404)
        return service

    @web.middleware
    async def boundary(request: web.Request, handler):
        try:
            if request.remote not in ("127.0.0.1", "::1"):
                raise BridgeError("loopback_required", "Only direct loopback connections are accepted.", 403)
            if request.headers.getall("Host", []) != [authority]:
                raise BridgeError("invalid_host", "Use the dedicated operator.localhost address.", 403)
            supplied_origin = request.headers.get("Origin")
            if supplied_origin is not None and supplied_origin != origin:
                raise BridgeError("invalid_origin", "Cross-origin operator access is forbidden.", 403)
            event_channel = request.path == "/events" or request.path.startswith("/events/")
            sensitive = request.path.startswith("/api/") or event_channel
            mutating = request.method not in ("GET", "HEAD")
            if (mutating or event_channel) and supplied_origin != origin:
                raise BridgeError("origin_required", "An exact operator Origin is required.", 403)
            if sensitive and request.headers.get("Sec-Fetch-Site", "same-origin") not in ("same-origin", "none"):
                raise BridgeError("invalid_fetch_site", "Cross-site operator requests are forbidden.", 403)
            if sensitive:
                request[PRINCIPAL] = auth.require(request.cookies.get(COOKIE))
            response = await handler(request)
        except BridgeError as error:
            response = web.json_response({"error": {"code": error.code, "message": error.message, **error.details}},
                                         status=error.status)
        except (ValueError, TypeError, json.JSONDecodeError):
            response = web.json_response({"error": {"code": "invalid_request", "message": "Invalid request."}},
                                         status=400)
        except web.HTTPException as error:
            response = web.Response(status=error.status, text=error.text, headers=error.headers)
        except Exception:
            response = web.json_response({"error": {"code": "bridge_error",
                "message": "Bridge operation failed; outcome may be unknown. Inspect status before retrying."}}, status=500)
        if not response.prepared:
            response.headers.update({
                "Cache-Control": "no-store", "X-Content-Type-Options": "nosniff",
                "Referrer-Policy": "no-referrer", "X-Frame-Options": "DENY",
                "Content-Security-Policy": "default-src 'none'; script-src 'self'; style-src 'self'; "
                    "connect-src 'self'; img-src 'self'; form-action 'self'; frame-ancestors 'none'; base-uri 'none'",
            })
        return response

    app = web.Application(middlewares=[boundary], client_max_size=300000)
    sockets: set[web.WebSocketResponse] = set()

    async def document(request):
        name = "recovery.html"
        try:
            auth.require(request.cookies.get(COOKIE))
        except BridgeError:
            name = "login.html"
        return web.FileResponse(STATIC / name)

    async def asset(request):
        name = request.match_info["name"]
        if name not in ("recovery.css", "recovery.js"):
            raise web.HTTPNotFound()
        return web.FileResponse(STATIC / name)

    async def login(request):
        if request.content_type != "application/x-www-form-urlencoded":
            raise BridgeError("invalid_content_type", "Use the local pairing form.", 415)
        values = await request.post()
        token = auth.login(values.get("phrase", ""))
        response = web.Response(status=303, headers={"Location": "/"})
        response.set_cookie(COOKIE, token, httponly=True, samesite="Strict", path="/",
                            max_age=int(auth.lifetime))
        return response

    async def payload(request):
        if request.content_type != "application/json":
            raise BridgeError("invalid_content_type", "Use application/json.", 415)
        value = await request.json()
        if not isinstance(value, dict):
            raise BridgeError("invalid_request", "Expected a JSON object.", 400)
        return value

    async def status(request):
        return web.json_response(selected(request).status())

    async def operators(request):
        if isinstance(service, OperatorHub):
            return web.json_response(service.overview())
        return web.json_response({"schema": "powder.operators.v1", "operators": [service.status()]})

    async def command(request):
        operator = selected(request)
        body = await payload(request)
        if isinstance(service, OperatorHub):
            result = await service.submit(operator.provider, request[PRINCIPAL], body)
        else:
            result = await operator.submit(request[PRINCIPAL], body)
        return web.json_response(result, status=202)

    async def command_status(request):
        return web.json_response(selected(request).journal.command(request.match_info["id"]))

    async def permission(request):
        data = await payload(request)
        return web.json_response(await selected(request).decide(request[PRINCIPAL], request.match_info["id"],
                                                     data.get("decision")))

    async def cancel(request):
        await payload(request)
        return web.json_response(await selected(request).cancel(request[PRINCIPAL], request.match_info["id"]))

    async def stop(request):
        data = await payload(request)
        return web.json_response(await selected(request).stop_operator(request[PRINCIPAL], data.get("confirmation")))

    async def logout(request):
        await payload(request)
        auth.logout(request.cookies.get(COOKIE))
        response = web.json_response({"loggedOut": True})
        response.del_cookie(COOKIE, path="/")
        return response

    async def draft(request):
        if request.method == "POST":
            data = await payload(request)
            if "text" not in data or not isinstance(data["text"], str):
                raise BridgeError("invalid_draft", "Draft text is required.", 400)
            return web.json_response(selected(request).draft(data["text"]))
        return web.json_response(selected(request).draft())

    async def websocket(request):
        operator = selected(request)
        principal = request[PRINCIPAL]
        if operator.connections.get(principal, 0) >= 4:
            raise BridgeError("connection_limit", "At most four views per paired session.", 429)
        cursor = int(request.query.get("since", "0"))
        operator.journal.events(cursor, 1)
        ws = web.WebSocketResponse(heartbeat=20, max_msg_size=1024)
        await ws.prepare(request)
        sockets.add(ws)
        operator.attach(principal)

        async def output_events():
            nonlocal cursor
            await ws.send_json({"type": "status", "provider": operator.provider, "data": operator.status()})
            while not ws.closed:
                auth.require(request.cookies.get(COOKIE))
                batch = operator.journal.events(cursor)
                if batch["events"]:
                    await asyncio.wait_for(ws.send_json({"type": "events", "provider": operator.provider, **batch}), timeout=5)
                    cursor = batch["lastSequence"]
                else:
                    async with operator.changed:
                        if operator.journal.latest() <= cursor:
                            try:
                                await asyncio.wait_for(operator.changed.wait(), timeout=0.5)
                            except TimeoutError:
                                pass
                if cursor >= operator.journal.latest():
                    await asyncio.sleep(0.05)

        async def output():
            try:
                await output_events()
            except asyncio.CancelledError:
                raise
            except Exception:
                await ws.close(code=1008, message=b"Operator stream ended. Re-pair or reconnect.")

        writer = asyncio.create_task(output())
        try:
            async for message in ws:
                if message.type in (WSMsgType.TEXT, WSMsgType.BINARY):
                    await ws.close(code=1008, message=b"Output-only channel. Inputs require authenticated HTTP.")
                    break
                if writer.done():
                    break
        finally:
            writer.cancel()
            await asyncio.gather(writer, return_exceptions=True)
            operator.detach(principal)
            sockets.discard(ws)
        return ws

    async def start(application):
        await service.run()

    async def close(application):
        await service.close()

    async def shutdown(application):
        await asyncio.gather(*(ws.close(code=1001, message=b"Bridge shutting down.")
                               for ws in list(sockets)), return_exceptions=True)

    app.router.add_get("/", document)
    app.router.add_get("/assets/{name}", asset)
    app.router.add_post("/login", login)
    app.router.add_get("/api/status", status)
    app.router.add_post("/api/commands", command)
    app.router.add_get("/api/commands/{id}", command_status)
    app.router.add_post("/api/commands/{id}/cancel", cancel)
    app.router.add_post("/api/permissions/{id}", permission)
    app.router.add_post("/api/operator/stop", stop)
    app.router.add_post("/api/logout", logout)
    app.router.add_get("/api/draft", draft)
    app.router.add_post("/api/draft", draft)
    app.router.add_get("/events", websocket)
    app.router.add_get("/api/operators", operators)
    app.router.add_get("/api/operators/{provider}/status", status)
    app.router.add_post("/api/operators/{provider}/commands", command)
    app.router.add_get("/api/operators/{provider}/commands/{id}", command_status)
    app.router.add_post("/api/operators/{provider}/commands/{id}/cancel", cancel)
    app.router.add_post("/api/operators/{provider}/permissions/{id}", permission)
    app.router.add_post("/api/operators/{provider}/stop", stop)
    app.router.add_get("/api/operators/{provider}/draft", draft)
    app.router.add_post("/api/operators/{provider}/draft", draft)
    app.router.add_get("/events/{provider}", websocket)
    app.on_startup.append(start)
    app.on_cleanup.append(close)
    app.on_shutdown.append(shutdown)
    return app
