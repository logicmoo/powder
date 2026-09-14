"""Bound the entire browser frame, not just its event payloads."""
from __future__ import annotations

import json
import math

MAX_SNAPSHOT_BYTES = 1024 * 1024
PERMISSION_BYTES = 256 * 1024
COMMAND_PAGE = 15
PERMISSION_PAGE = 16


def encoded(value) -> bytes:
    # Preserve Unicode without ASCII expansion; lone imported surrogates remain JSON escapes.
    return json.dumps(value, ensure_ascii=False, separators=(",", ":")).encode("utf-8", "backslashreplace")


def _scalar(value):
    if isinstance(value, str):
        return value if len(value) <= 256 else value[:256] + " [display clipped]"
    if value is None or isinstance(value, bool):
        return value
    if isinstance(value, int):
        return max(-(2**63), min(2**63 - 1, value))
    if isinstance(value, float):
        return value if math.isfinite(value) else None
    return "[not displayed]"


def _record(value):
    if not isinstance(value, dict):
        return {}
    return {str(key)[:80]: _scalar(item) for key, item in list(value.items())[:32]}


def project_status(status: dict) -> dict:
    fields = ("schema", "agentType", "provider", "name", "role", "outputSource", "state",
              "stopped", "stopOutcome", "canRestart", "conversationId", "nativeSessionId",
              "sdkSessionId", "lastSequence", "selectionRevision")
    result = {key: _scalar(status.get(key)) for key in fields}
    for key in ("workspace", "bridge", "application", "adapter", "settings", "branch", "branchFrom"):
        result[key] = _record(status.get(key, {}))
    adapter = status.get("adapter", {})
    result["adapter"]["ownedPids"] = [_scalar(item) for item in adapter.get("ownedPids", [])[:32]]
    result["adapter"]["executable"] = _record(adapter.get("executable")) or None
    # Previews are never rendered in the command inspector. Do not resend 100 large prompts per heartbeat.
    result["commands"] = [
        {key: _scalar(item.get(key)) for key in ("id", "kind", "state", "created")}
        for item in status.get("commands", [])[:COMMAND_PAGE]
    ]
    permissions, used = [], 0
    for permission in status.get("permissions", []):
        size = len(encoded(permission))
        if len(permissions) < PERMISSION_PAGE and used + size + 1 <= PERMISSION_BYTES:
            permissions.append(permission)
            used += size + 1
    result["permissions"] = permissions
    result["displayProjection"] = {
        "commandLimit": COMMAND_PAGE,
        "commandsOmitted": max(0, len(status.get("commands", [])) - len(result["commands"])),
        "permissionsOmitted": len(status.get("permissions", [])) - len(permissions),
    }
    return result


def encode_snapshot(provider: str, status: dict, batch: dict, since: int) -> tuple[bytes, int]:
    frame = {"type": "snapshot", "provider": provider, "data": project_status(status),
             "events": [], "lastSequence": since, "latestSequence": batch["latestSequence"]}
    # Include all metadata, page counters, JSON syntax, UTF-8 expansion and the trailing newline.
    remaining = MAX_SNAPSHOT_BYTES - len(encoded(frame)) - 64
    for item in batch["events"]:
        size = len(encoded(item)) + 1
        if size > remaining:
            if frame["events"]:
                break
            # One oversized inert transcript event must not permanently prevent forward replay.
            # Its authoritative payload stays in the journal; permissions are never approved here.
            item = {
                "sequence": item["sequence"], "created": _scalar(item["created"]), "kind": _scalar(item["kind"]),
                "data": {"text": "This event exceeds the embedded display limit. Its complete content remains in the durable journal."},
                "displayOmitted": True,
            }
            size = len(encoded(item)) + 1
        frame["events"].append(item)
        frame["lastSequence"] = item["sequence"]
        remaining -= size
    payload = encoded(frame) + b"\n"
    if len(payload) > MAX_SNAPSHOT_BYTES:
        raise ValueError("Embedded snapshot exceeds its complete serialized byte budget.")
    return payload, frame["lastSequence"]
