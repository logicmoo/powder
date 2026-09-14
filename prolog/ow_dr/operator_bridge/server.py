from __future__ import annotations

import asyncio
import json
import html
from pathlib import Path

from aiohttp import WSMsgType, web

from .security import Auth, COOKIE, HOST
from .embed import EmbedAuth, EMBED_HEADER, DEFAULT_PARENT, parent_origin
from .projection import encode_snapshot, encoded, project_status
from .service import OperatorService
from .hub import OperatorHub
from .workspace import BridgeError

STATIC = Path(__file__).with_name("static")
PRINCIPAL = web.RequestKey("operator_principal", str)


def create_app(service: OperatorService | OperatorHub, auth: Auth, port: int,
               *, allowed_parent: str = DEFAULT_PARENT) -> web.Application:
    authority = f"{HOST}:{port}"
    origin = f"http://{authority}"
    allowed_parent = parent_origin(allowed_parent)
    embed_auth = EmbedAuth(auth)

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
            embedded_api = request.path.startswith("/embed/api/")
            sensitive = request.path.startswith("/api/") or event_channel or embedded_api
            mutating = request.method not in ("GET", "HEAD")
            if (mutating or event_channel or embedded_api) and supplied_origin != origin:
                raise BridgeError("origin_required", "An exact operator Origin is required.", 403)
            if sensitive and request.headers.get("Sec-Fetch-Site", "same-origin") not in ("same-origin", "none"):
                raise BridgeError("invalid_fetch_site", "Cross-site operator requests are forbidden.", 403)
            if embedded_api:
                request[PRINCIPAL] = embed_auth.require(
                    request.headers.get(EMBED_HEADER), selected(request).provider)
            elif sensitive:
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
            embeddable = request.path in ("/embed", "/embed/login")
            ancestors = allowed_parent if embeddable else "'none'"
            response.headers.update({
                "Cache-Control": "no-store", "X-Content-Type-Options": "nosniff",
                # no-referrer serializes native form POST Origin as null in Chromium.
                # same-origin retains the guard without disclosing referrers to the parent.
                "Referrer-Policy": "same-origin" if embeddable or request.path == "/" else "no-referrer",
                "Content-Security-Policy": "default-src 'none'; script-src 'self'; style-src 'self'; "
                    "connect-src 'self'; img-src 'self'; form-action 'self'; "
                    f"frame-ancestors {ancestors}; base-uri 'none'",
                "Permissions-Policy": "camera=(), microphone=(), geolocation=(), payment=(), usb=()",
            })
            if not embeddable:
                response.headers["X-Frame-Options"] = "DENY"
        return response

    app = web.Application(middlewares=[boundary], client_max_size=300000)
    sockets: set[web.WebSocketResponse] = set()
    embedded_streams: set[asyncio.Task] = set()

    async def document(request):
        name = "recovery.html"
        try:
            auth.require(request.cookies.get(COOKIE))
        except BridgeError:
            name = "login.html"
        return web.FileResponse(STATIC / name)

    async def asset(request):
        name = request.match_info["name"]
        if name not in ("recovery.css", "recovery.js", "embed.js", "embed.css"):
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

    def embed_document(provider, token="", error=""):
        if provider not in ("copilot", "codex"):
            raise BridgeError("unknown_provider", "Select copilot or codex.", 400)
        # Configuration/capability is parsed and removed by operator-origin JS before use.
        page = (STATIC / "embed.html").read_text(encoding="utf-8")
        for key, value in {"PARENT": allowed_parent, "PROVIDER": provider,
                           "CAPABILITY": token, "ERROR": error}.items():
            page = page.replace("{{" + key + "}}", html.escape(value, quote=True))
        return web.Response(text=page, content_type="text/html")

    async def embedded(request):
        if set(request.query) - {"provider"}:
            raise BridgeError("invalid_request", "Embed accepts only a provider selection.", 400)
        return embed_document(request.query.get("provider", "copilot"))

    async def embedded_login(request):
        if request.content_type != "application/x-www-form-urlencoded":
            raise BridgeError("invalid_content_type", "Use the frame's native pairing form.", 415)
        values = await request.post()
        provider = values.get("provider")
        if provider not in ("copilot", "codex") or set(values) != {"provider", "phrase"}:
            raise BridgeError("invalid_request", "Use the frame's provider-specific pairing form.", 400)
        try:
            token = embed_auth.login(values["phrase"], provider)
        except BridgeError as error:
            return embed_document(provider, error=error.message)
        return embed_document(provider, token)

    async def payload(request):
        if request.content_type != "application/json":
            raise BridgeError("invalid_content_type", "Use application/json.", 415)
        value = await request.json()
        if not isinstance(value, dict):
            raise BridgeError("invalid_request", "Expected a JSON object.", 400)
        return value

    async def status(request):
        value = selected(request).status()
        if request.path.startswith("/embed/api/"):
            return web.Response(body=encoded(project_status(value)), content_type="application/json")
        return web.json_response(value)

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

    async def embedded_draft_read(request):
        await payload(request)
        return web.json_response(selected(request).draft())

    async def embedded_logout(request):
        await payload(request)
        token = request.headers.get(EMBED_HEADER)
        principal = request[PRINCIPAL]
        embed_auth.revoke(token)
        selected(request).detach(principal)
        return web.json_response({"loggedOut": True})

    async def embedded_events(request):
        body = await payload(request)
        cursor = body.get("since", 0)
        if set(body) != {"since"} or type(cursor) is not int:
            raise BridgeError("invalid_cursor", "Supply an integer output cursor.", 400)
        operator = selected(request)
        operator.journal.events(cursor, 1)
        token = request.headers.get(EMBED_HEADER)
        principal = embed_auth.connect(token, operator.provider)
        stream = web.StreamResponse(headers={
            "Content-Type": "application/x-ndjson", "Cache-Control": "no-store",
            "X-Content-Type-Options": "nosniff",
        })
        task = asyncio.current_task()
        embedded_streams.add(task)
        operator.attach(principal)
        try:
            await stream.prepare(request)
            while True:
                embed_auth.require(token, operator.provider)
                if request.transport is None or request.transport.is_closing():
                    break
                batch = operator.journal.events(cursor)
                serialized, next_cursor = encode_snapshot(operator.provider, operator.status(), batch, cursor)
                await asyncio.wait_for(stream.write(serialized), 5)
                cursor = next_cursor
                await asyncio.sleep(0.75)
        except (ConnectionError, TimeoutError, BridgeError):
            pass
        finally:
            embed_auth.revoke(token)
            operator.detach(principal)
            embedded_streams.discard(task)
        return stream

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
        for task in list(embedded_streams):
            task.cancel()
        await asyncio.gather(*list(embedded_streams), return_exceptions=True)
        await asyncio.gather(*(ws.close(code=1001, message=b"Bridge shutting down.")
                               for ws in list(sockets)), return_exceptions=True)

    app.router.add_get("/", document)
    app.router.add_get("/assets/{name}", asset)
    app.router.add_post("/login", login)
    app.router.add_get("/embed", embedded)
    app.router.add_post("/embed/login", embedded_login)
    embedded_prefix = "/embed/api/{provider}"
    for suffix, handler in (
        ("/status", status), ("/commands", command), ("/commands/{id}", command_status),
        ("/commands/{id}/cancel", cancel), ("/permissions/{id}", permission),
        ("/stop", stop), ("/logout", embedded_logout), ("/draft", draft),
        ("/draft/read", embedded_draft_read), ("/events", embedded_events),
    ):
        app.router.add_post(embedded_prefix + suffix, handler)
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
