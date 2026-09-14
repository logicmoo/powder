from __future__ import annotations

import hashlib
import json
import re
import sqlite3
import time
import uuid
from pathlib import Path

from .security import public_text
from .providers import provider_label
from .workspace import BridgeError, Workspace

COMMAND_ID = re.compile(r"^[A-Za-z0-9_-]{1,80}$")
UNFINISHED = ("queued", "running", "awaiting_permission")


class Journal:
    def __init__(self, path: Path, workspace: Workspace, *, provider: str = "copilot"):
        self.path = Path(path)
        provider_label(provider)
        self.provider = provider
        self.db = sqlite3.connect(path)
        self.db.row_factory = sqlite3.Row
        self.db.executescript("""
            PRAGMA journal_mode=WAL;
            PRAGMA synchronous=FULL;
            CREATE TABLE IF NOT EXISTS meta(key TEXT PRIMARY KEY,value TEXT NOT NULL);
            CREATE TABLE IF NOT EXISTS events(
                sequence INTEGER PRIMARY KEY AUTOINCREMENT,created REAL NOT NULL,
                kind TEXT NOT NULL,payload TEXT NOT NULL);
            CREATE TABLE IF NOT EXISTS commands(
                id TEXT PRIMARY KEY,digest TEXT NOT NULL,kind TEXT NOT NULL,
                preview TEXT NOT NULL,state TEXT NOT NULL,created REAL NOT NULL);
            CREATE TABLE IF NOT EXISTS permissions(
                id TEXT PRIMARY KEY,command_id TEXT NOT NULL,kind TEXT NOT NULL,
                title TEXT NOT NULL,detail TEXT NOT NULL,state TEXT NOT NULL);
        """)
        previous = self.get("workspace")
        if previous is not None and previous != workspace.json():
            self.db.close()
            raise BridgeError("workspace_mismatch", "The journal belongs to a different workspace.")
        previous_provider = self.get("provider") or ("copilot" if self.get("conversation_id") else provider)
        if previous_provider != provider:
            self.db.close()
            raise BridgeError("provider_mismatch", "A native provider cannot resume another provider's journal.")
        self.set("provider", provider)
        self.set("workspace", workspace.json())
        if self.get("conversation_id") is None:
            self.set("conversation_id", str(uuid.uuid4()))
        with self.db:
            interrupted = [r["id"] for r in self.db.execute(
                "SELECT id FROM commands WHERE state IN ('queued','running','awaiting_permission')")]
            self.db.execute("UPDATE commands SET state='unknown' "
                            "WHERE state IN ('queued','running','awaiting_permission')")
            self.db.execute("UPDATE permissions SET state='interrupted' WHERE state='pending'")
            for command_id in interrupted:
                self._event("command.state", {"id": command_id, "state": "unknown",
                    "message": "Bridge restarted. Outcome unknown; this command will not be replayed."})
        if interrupted:
            self.set("unsettled_native", True)

    def get(self, key: str):
        row = self.db.execute("SELECT value FROM meta WHERE key=?", (key,)).fetchone()
        return json.loads(row["value"]) if row else None

    def set(self, key: str, value) -> None:
        with self.db:
            self.db.execute("INSERT OR REPLACE INTO meta VALUES(?,?)", (key, json.dumps(value)))

    def _event(self, kind: str, payload: dict) -> int:
        return self.db.execute("INSERT INTO events(created,kind,payload) VALUES(?,?,?)",
                               (time.time(), kind, json.dumps({**payload, "provider": self.provider},
                                                            ensure_ascii=False))).lastrowid

    def event(self, kind: str, payload: dict) -> int:
        with self.db:
            return self._event(kind, payload)

    def events(self, since: int, limit: int = 200) -> dict:
        if not isinstance(since, int) or isinstance(since, bool) or not 0 <= since <= 2**63 - 1:
            raise BridgeError("invalid_sequence", "Sequence must be a nonnegative integer.", 400)
        if not 1 <= limit <= 200:
            raise BridgeError("invalid_limit", "Event page limit must be between 1 and 200.", 400)
        rows = self.db.execute("SELECT * FROM events WHERE sequence>? ORDER BY sequence LIMIT ?",
                               (since, limit))
        items, size = [], 0
        for row in rows:
            length = len(row["payload"].encode("utf-8"))
            if items and size + length > 512 * 1024:
                break
            items.append({"sequence": row["sequence"], "created": row["created"],
                          "kind": row["kind"], "data": json.loads(row["payload"])})
            size += length
        return {"events": items, "lastSequence": items[-1]["sequence"] if items else since,
                "latestSequence": self.latest()}

    def latest(self) -> int:
        return self.db.execute("SELECT COALESCE(MAX(sequence),0) FROM events").fetchone()[0]

    def command(self, command_id: str) -> dict:
        row = self.db.execute("SELECT id,kind,preview,state,created FROM commands WHERE id=?",
                               (command_id,)).fetchone()
        if not row:
            raise BridgeError("unknown_command", "No command with that identifier.", 404)
        return dict(row)

    def existing(self, command_id: str, kind: str, text: str) -> dict | None:
        if not isinstance(command_id, str) or not COMMAND_ID.fullmatch(command_id):
            raise BridgeError("invalid_command_id", "Supply a stable command identifier.", 400)
        digest = hashlib.sha256(json.dumps([kind, text]).encode()).hexdigest()
        old = self.db.execute("SELECT digest FROM commands WHERE id=?", (command_id,)).fetchone()
        if old:
            if old["digest"] != digest:
                raise BridgeError("idempotency_conflict", "That identifier has different input.")
            return self.command(command_id)
        return None

    def submit(self, command_id: str, kind: str, text: str) -> tuple[dict, bool]:
        old = self.existing(command_id, kind, text)
        if old is not None:
            return old, False
        digest = hashlib.sha256(json.dumps([kind, text]).encode()).hexdigest()
        pending = self.db.execute("SELECT COUNT(*) FROM commands "
                                  "WHERE state IN ('queued','running','awaiting_permission')").fetchone()[0]
        if pending >= 20:
            raise BridgeError("queue_full", "Operator command queue is full.", 429)
        with self.db:
            self.db.execute("INSERT INTO commands VALUES(?,?,?,?,?,?)",
                (command_id, digest, kind, public_text(text, 4096), "queued", time.time()))
            self._event("command.accepted", {"id": command_id, "kind": kind,
                                            "text": public_text(text)})
        return self.command(command_id), True

    def state(self, command_id: str, state: str, message: str = "") -> None:
        with self.db:
            self.db.execute("UPDATE commands SET state=? WHERE id=?", (state, command_id))
            self._event("command.state", {"id": command_id, "state": state,
                                         "message": public_text(message, 2048)})

    def permission(self, request_id: str, command_id: str, kind: str,
                   title: str, detail: str) -> None:
        with self.db:
            self.db.execute("INSERT INTO permissions VALUES(?,?,?,?,?,?)",
                (request_id, command_id, kind, public_text(title, 200), public_text(detail, 4096), "pending"))
            self.db.execute("UPDATE commands SET state='awaiting_permission' WHERE id=?", (command_id,))
            self._event("permission.request", {"id": request_id, "commandId": command_id,
                "kind": kind, "title": public_text(title, 200), "detail": public_text(detail, 4096)})

    def decide(self, request_id: str, decision: str) -> bool:
        row = self.db.execute("SELECT state FROM permissions WHERE id=?", (request_id,)).fetchone()
        if not row:
            raise BridgeError("unknown_permission", "Permission request does not exist.", 404)
        if row["state"] == decision:
            return False
        if row["state"] != "pending":
            raise BridgeError("permission_resolved", "Permission is no longer pending.")
        with self.db:
            self.db.execute("UPDATE permissions SET state=? WHERE id=?", (decision, request_id))
            self._event("permission.resolved", {"id": request_id, "decision": decision})
        return True

    def decision(self, request_id: str) -> str | None:
        row = self.db.execute("SELECT state FROM permissions WHERE id=?", (request_id,)).fetchone()
        return row["state"] if row else None

    def pending(self) -> list[dict]:
        return [dict(r) for r in self.db.execute(
            "SELECT * FROM permissions WHERE state='pending' ORDER BY rowid LIMIT 100")]

    def commands(self) -> list[dict]:
        return [dict(r) for r in self.db.execute(
            "SELECT id,kind,preview,state,created FROM commands ORDER BY created DESC LIMIT 100")]

    def close(self) -> None:
        self.db.close()
