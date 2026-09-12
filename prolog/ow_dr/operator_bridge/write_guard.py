from __future__ import annotations

import hashlib
from pathlib import Path

from .workspace import BridgeError


def snapshot(paths: list[str], cwd: str) -> dict[str, str | None]:
    """Bounded optimistic guard, not an atomic edit transaction or checkout lock."""
    if not paths or len(paths) > 32:
        raise BridgeError("unverifiable_write", "Write set is absent or too large to verify.")
    root = Path(cwd).resolve()
    result = {}
    for value in paths:
        if not isinstance(value, str) or not value:
            raise BridgeError("unverifiable_write", "A proposed write has no file path.")
        path = Path(value)
        path = (path if path.is_absolute() else root / path).resolve()
        if not path.is_relative_to(root) or path == root:
            raise BridgeError("unverifiable_write", "Proposed writes must remain inside the primary repository.")
        if not path.exists():
            result[str(path)] = None
            continue
        if not path.is_file() or path.stat().st_size > 8 * 1024 * 1024:
            raise BridgeError("unverifiable_write", "Proposed file cannot be verified within the safety budget.")
        with path.open("rb") as stream:
            content = stream.read(8 * 1024 * 1024 + 1)
        if len(content) > 8 * 1024 * 1024:
            raise BridgeError("unverifiable_write", "Proposed file changed beyond the safety budget.")
        result[str(path)] = hashlib.sha256(content).hexdigest()
    return result


def unchanged(before: dict[str, str | None], cwd: str) -> bool:
    try:
        return snapshot(list(before), cwd) == before
    except (BridgeError, OSError):
        return False
