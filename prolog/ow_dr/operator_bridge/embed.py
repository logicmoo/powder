"""Provider-scoped, document-local authentication; never a standalone cookie."""
from __future__ import annotations

import hashlib
import secrets
import time
from urllib.parse import urlsplit

from .security import Auth
from .workspace import BridgeError

EMBED_HEADER = "X-Operator-Embed"
DEFAULT_PARENT = "http://localhost:3050"


def parent_origin(value: str) -> str:
    try:
        url = urlsplit(value)
        port = url.port
        valid = (url.scheme == "http" and url.hostname in ("localhost", "127.0.0.1")
                 and port is not None and 1024 <= port <= 65535
                 and value == f"http://{url.hostname}:{port}")
    except ValueError:
        valid = False
    if not valid:
        raise BridgeError("invalid_parent_origin",
                          "Embed parent must be one exact local HTTP origin, including port.", 400)
    return value


class EmbedAuth:
    def __init__(self, auth: Auth):
        self.auth = auth
        self.sessions: dict[str, dict] = {}

    @staticmethod
    def key(token: str | None) -> str:
        return hashlib.sha256((token or "").encode()).hexdigest()

    def login(self, phrase: str, provider: str) -> str:
        self.auth.verify_pairing(phrase)
        return self._issue(provider)

    def local_document(self, provider: str) -> str:
        if not self.auth.trusted_local:
            raise BridgeError("authentication_required", "Local access was not enabled by the host.", 403)
        return self._issue(provider)

    def _issue(self, provider: str) -> str:
        now = time.monotonic()
        self.sessions = {key: value for key, value in self.sessions.items()
                         if value["expires"] > now
                         and (value["connected"] or value["connectBy"] > now)}
        if len(self.sessions) >= 16:
            raise BridgeError("session_limit", "Too many operator views. Close unused views and retry.", 429)
        token = secrets.token_urlsafe(48)
        self.sessions[self.key(token)] = {
            "provider": provider, "expires": now + self.auth.lifetime,
            "connectBy": now + 30, "connected": False,
        }
        return token

    def require(self, token: str | None, provider: str) -> str:
        key = self.key(token)
        session = self.sessions.get(key)
        now = time.monotonic()
        if (not session or session["expires"] <= now
                or (not session["connected"] and session["connectBy"] <= now)):
            self.revoke(token)
            message = "Reconnect this operator frame." if self.auth.trusted_local else "Pair this operator frame again."
            raise BridgeError("authentication_required", message, 401)
        if session["provider"] != provider:
            raise BridgeError("provider_mismatch", "Frame access belongs to another provider.", 403)
        return key

    def connect(self, token: str, provider: str) -> str:
        key = self.require(token, provider)
        if self.sessions[key]["connected"]:
            raise BridgeError("frame_already_connected", "This frame already owns an output stream.", 409)
        self.sessions[key]["connected"] = True
        return key

    def revoke(self, token: str | None) -> None:
        self.sessions.pop(self.key(token), None)
