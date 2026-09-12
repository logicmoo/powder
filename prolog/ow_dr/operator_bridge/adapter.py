from __future__ import annotations

from typing import Awaitable, Callable, Protocol

from .workspace import BridgeError
from .providers import discover_executable, provider_label

Emit = Callable[[str], Awaitable[None]]
AskPermission = Callable[[str, str, str], Awaitable[bool]]


class OperatorAdapter(Protocol):
    provider: str
    name: str
    available: bool

    async def start(self, resume_id: str | None, *, cwd: str) -> dict: ...
    async def send(self, text: str, emit: Emit, permission: AskPermission) -> None: ...
    async def cancel(self) -> bool: ...
    async def stop(self) -> None: ...
    def status(self) -> dict: ...


class UnavailableAdapter:
    """Honest default until a documented native SDK adapter is configured."""
    name = "not-configured"
    available = False

    def __init__(self, provider: str = "copilot", reason: str = "The native adapter is not configured."):
        self.provider = provider
        provider_label(provider)
        self.name = f"{provider}-not-configured"
        self.executable = discover_executable(provider)
        self.reason = reason

    async def start(self, resume_id: str | None, *, cwd: str) -> dict:
        raise BridgeError("adapter_unavailable", f"The live {self.provider} adapter is not configured.", 503)

    async def send(self, text: str, emit: Emit, permission: AskPermission) -> None:
        raise BridgeError("adapter_unavailable", "No live native operator session is connected.", 503)

    async def cancel(self) -> bool:
        return False

    async def stop(self) -> None:
        pass

    def status(self) -> dict:
        return {"name": self.name, "available": False, "connected": False,
                "sessionId": None, "ownedPids": [], "resumeSupported": False,
                "provider": self.provider, "executable": self.executable, "authentication": "not_checked",
                "reason": self.reason}


def configured_adapter(provider: str, journal, *, executable: str | None = None,
                       model: str | None = None, offline: bool = False):
    if offline:
        return UnavailableAdapter(provider, "Native providers are explicitly disabled.")
    try:
        from .native import resolve_native
        command = resolve_native(provider, executable)
        if provider == "copilot":
            from .copilot_adapter import CopilotAdapter
            return CopilotAdapter(command, journal, model=model)
        from .codex_adapter import CodexAdapter
        return CodexAdapter(command, journal, model=model)
    except BridgeError as error:
        return UnavailableAdapter(provider, error.message)
    except ImportError:
        return UnavailableAdapter(provider, "Install the pinned project-local dependencies.")
