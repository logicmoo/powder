"""Provider identities and passive executable discovery, not native protocol clients."""
import shutil

from .workspace import BridgeError

PROVIDERS = {
    "copilot": "Copilot operator — Maintain code, inspect failures and manage services",
    "codex": "Codex operator — Maintain code, inspect failures and manage services",
}


def provider_label(provider: str) -> str:
    if provider not in PROVIDERS:
        raise BridgeError("unknown_provider", "Choose the Copilot or Codex operator.", 404)
    return PROVIDERS[provider]


def discover_executable(provider: str) -> dict:
    provider_label(provider)
    path = shutil.which(provider)
    return {"command": provider, "found": path is not None, "path": path,
            "protocolVerified": False, "authentication": "not_checked"}
