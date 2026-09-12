"""Optional read-only availability probe. It grants NO application lifecycle authority."""
from __future__ import annotations

import asyncio
import http.client
import json
from urllib.parse import urlsplit

from .service import OperatorService
from .workspace import BridgeError


class ApplicationMonitor:
    def __init__(self, service: OperatorService, url: str, *, interval: float = 3):
        parsed = urlsplit(url)
        if (parsed.scheme != "http" or parsed.hostname not in ("localhost", "127.0.0.1", "::1")
                or parsed.username or parsed.password or parsed.query or parsed.fragment
                or parsed.path != "/swish/openworld_dr/api/status" or not parsed.port):
            raise BridgeError("invalid_application_probe", "Use the explicit loopback application status URL.")
        self.service, self.url, self.interval = service, url, interval
        self.host, self.port, self.path = parsed.hostname, parsed.port, parsed.path
        self.task = None

    async def start(self):
        self.task = asyncio.create_task(self.run(), name="prolog-availability-only")

    async def run(self):
        while True:
            state = {"configured": True, "online": False, "identityVerified": False,
                     "restartAvailable": False, "pid": None,
                     "message": "Prolog status is unavailable. No verified lifecycle registration; restart is unavailable."}
            generation = await asyncio.to_thread(self.probe)
            if generation is not None:
                state.update(online=True, generation=generation,
                    message="Prolog status responds; process identity and restart authority are not registered.")
            if state != self.service.app:
                self.service.app = state
                self.service.journal.event("application.availability", state)
                await self.service.notify()
            await asyncio.sleep(self.interval)

    def probe(self):
        # A short-lived blocking socket avoids Windows Proactor connection-reset
        # callbacks when the independently owned Prolog process exits mid-probe.
        connection = http.client.HTTPConnection(self.host, self.port, timeout=2)
        try:
            connection.request("GET", self.path, headers={"Accept": "application/json", "Connection": "close"})
            response = connection.getresponse()
            raw = response.read(1024 * 1024 + 1)
            if response.status == 200 and len(raw) <= 1024 * 1024:
                value = json.loads(raw)
                if isinstance(value, dict) and type(value.get("generation")) is int:
                    return value["generation"]
        except (OSError, ValueError, http.client.HTTPException):
            return None
        finally:
            connection.close()

    async def close(self):
        if self.task:
            self.task.cancel()
            await asyncio.gather(self.task, return_exceptions=True)
