from __future__ import annotations

import ctypes
import hashlib
import hmac
import os
import re
import secrets
import time
from pathlib import Path

from .workspace import BridgeError

COOKIE = "powder_operator_session"
HOST = "operator.localhost"


def private_directory(path: Path) -> Path:
    path.mkdir(parents=True, exist_ok=True)
    if os.name == "nt":
        from ctypes import wintypes
        advapi = ctypes.WinDLL("advapi32", use_last_error=True)
        kernel = ctypes.WinDLL("kernel32", use_last_error=True)
        convert = advapi.ConvertStringSecurityDescriptorToSecurityDescriptorW
        convert.argtypes = [wintypes.LPCWSTR, wintypes.DWORD,
                            ctypes.POINTER(ctypes.c_void_p), ctypes.POINTER(wintypes.DWORD)]
        convert.restype = wintypes.BOOL
        apply = advapi.SetFileSecurityW
        apply.argtypes = [wintypes.LPCWSTR, wintypes.DWORD, ctypes.c_void_p]
        apply.restype = wintypes.BOOL
        kernel.LocalFree.argtypes = [ctypes.c_void_p]
        descriptor = ctypes.c_void_p()
        # Protected owner/SYSTEM ACL inherited by newly created state files.
        if not convert("D:P(A;OICI;FA;;;OW)(A;OICI;FA;;;SY)", 1,
                       ctypes.byref(descriptor), None):
            raise ctypes.WinError(ctypes.get_last_error())
        try:
            if not apply(str(path), 0x80000004, descriptor):
                raise ctypes.WinError(ctypes.get_last_error())
        finally:
            kernel.LocalFree(descriptor)
    else:
        path.chmod(0o700)
    return path


class InstanceLock:
    """Native process lock; the stable lock file is never deleted."""
    def __init__(self, directory: Path):
        self.file = (directory / "bridge.lock").open("a+b")
        try:
            if os.name == "nt":
                import msvcrt
                if self.file.seek(0, 2) == 0:
                    self.file.write(b"\0")
                    self.file.flush()
                self.file.seek(0)
                msvcrt.locking(self.file.fileno(), msvcrt.LK_NBLCK, 1)
            else:
                import fcntl
                fcntl.flock(self.file, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except OSError as error:
            self.file.close()
            raise BridgeError("bridge_busy", "Another bridge owns this state directory.") from error

    def close(self) -> None:
        self.file.close()


class Auth:
    def __init__(self, phrase: str, *, lifetime: float = 12 * 60 * 60):
        if len(phrase) < 16:
            raise BridgeError("weak_pairing_phrase", "Use at least 16 characters for local pairing.")
        self.salt = secrets.token_bytes(32)
        self.digest = self._derive(phrase)
        self.sessions: dict[str, float] = {}
        self.attempts: list[float] = []
        self.lifetime = lifetime

    def _derive(self, phrase: str) -> bytes:
        return hashlib.pbkdf2_hmac("sha256", phrase.encode(), self.salt, 600_000)

    def login(self, phrase: str) -> str:
        now = time.monotonic()
        self.attempts = [t for t in self.attempts if now - t < 60]
        if len(self.attempts) >= 5:
            raise BridgeError("pairing_throttled", "Wait one minute before pairing again.", 429)
        self.attempts.append(now)
        if len(phrase) > 1024 or not hmac.compare_digest(self._derive(phrase), self.digest):
            raise BridgeError("pairing_failed", "Local pairing failed.", 401)
        self.sessions = {key: expiry for key, expiry in self.sessions.items() if expiry > now}
        if len(self.sessions) >= 16:
            raise BridgeError("session_limit", "Too many local browser sessions.", 429)
        token = secrets.token_urlsafe(48)
        self.sessions[hashlib.sha256(token.encode()).hexdigest()] = now + self.lifetime
        return token

    def require(self, token: str | None) -> str:
        key = hashlib.sha256((token or "").encode()).hexdigest()
        if self.sessions.get(key, 0) <= time.monotonic():
            raise BridgeError("authentication_required", "Pair this browser with the local bridge.", 401)
        return key

    def logout(self, token: str | None) -> None:
        self.sessions.pop(hashlib.sha256((token or "").encode()).hexdigest(), None)


_TOKENS = re.compile(
    r"(?i)\b(?:gh[pousr]_[A-Za-z0-9_]{16,}|github_pat_[A-Za-z0-9_]+|"
    r"bearer\s+[A-Za-z0-9._~+/-]+=*|"
    r"(?:password|secret|access_token|refresh_token|api_key)\s*[:=]\s*[^\s,;]+)"
)
_PRIVATE_KEY = re.compile(r"-----BEGIN [^-]*PRIVATE KEY-----.*?-----END [^-]*PRIVATE KEY-----",
                          re.DOTALL)


def public_text(value: str, limit: int = 65536) -> str:
    if not isinstance(value, str):
        raise BridgeError("invalid_text", "Text must be a string.", 400)
    return _TOKENS.sub("[redacted]", _PRIVATE_KEY.sub("[redacted private key]", value))[:limit]
