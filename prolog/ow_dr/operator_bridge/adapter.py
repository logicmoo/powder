from __future__ import annotations

from typing import Awaitable, Callable, Protocol

from .workspace import BridgeError

Emit = Callable[[str], Awaitable[None]]
AskPermission = Callable[[str, str, str], Awaitable[bool]]


class OperatorAdapter(Protocol):
    name: str
    available: bool

    async def start(self, resume_id: str | None) -> dict: ...
    async def send(self, text: str, emit: Emit, permission: AskPermission) -> None: ...
    async def cancel(self) -> bool: ...
    async def stop(self) -> None: ...
    def status(self) -> dict: ...


class UnavailableAdapter:
    """Honest default until a documented native SDK adapter is configured."""
    name = "not-configured"
    available = False

    async def start(self, resume_id: str | None) -> dict:
        raise BridgeError("adapter_unavailable", "The live Copilot adapter is not configured.", 503)

    async def send(self, text: str, emit: Emit, permission: AskPermission) -> None:
        raise BridgeError("adapter_unavailable", "No live Copilot session is connected.", 503)

    async def cancel(self) -> bool:
        return False

    async def stop(self) -> None:
        pass

    def status(self) -> dict:
        return {"name": self.name, "available": False, "connected": False,
                "sessionId": None, "ownedPids": [], "resumeSupported": False}
