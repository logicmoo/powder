"""Additive catalog; the original provider journal remains the catalog and legacy history."""
from __future__ import annotations

import time
import uuid
import json

from .journal import Journal
from .security import public_text
from .workspace import BridgeError


def conversation_id(value):
    if not isinstance(value, str):
        raise BridgeError("invalid_conversation", "Supply a conversation UUID.", 400)
    try:
        if str(uuid.UUID(value)) != value:
            raise ValueError()
    except ValueError:
        raise BridgeError("invalid_conversation", "Supply a conversation UUID.", 400) from None
    return value


class ConversationCatalog:
    def __init__(self, legacy: Journal, workspace):
        self.legacy, self.workspace = legacy, workspace
        self.provider = legacy.provider
        self.original_id = legacy.get("conversation_id")
        legacy.db.execute("""CREATE TABLE IF NOT EXISTS conversation_catalog(
            id TEXT PRIMARY KEY,title TEXT NOT NULL,created REAL NOT NULL,native_id TEXT UNIQUE)""")
        with legacy.db:
            legacy.db.execute("INSERT OR IGNORE INTO conversation_catalog VALUES(?,?,?,?)",
                              (self.original_id, "Original conversation", time.time(),
                               legacy.get("native_session_id") or legacy.get("sdk_session_id")))
        if not legacy.get("selected_conversation_id"):
            legacy.set("selected_conversation_id", self.original_id)

    def selected(self):
        return self.legacy.get("selected_conversation_id")

    def revision(self):
        return self.legacy.get("selection_revision") or 0

    def contains(self, identifier):
        conversation_id(identifier)
        return self.legacy.db.execute("SELECT 1 FROM conversation_catalog WHERE id=?", (identifier,)).fetchone() is not None

    def entries(self):
        return [dict(row) for row in self.legacy.db.execute(
            "SELECT id,title,created FROM conversation_catalog ORDER BY created DESC,id LIMIT 500")]

    def directory(self):
        directory = self.legacy.path.parent
        for component in ("conversations", self.provider):
            directory = directory / component
            if directory.exists():
                if directory.is_symlink() or getattr(directory.stat(), "st_file_attributes", 0) & 0x400:
                    raise BridgeError("unsafe_conversation_path", "Conversation storage must not be linked.")
            else:
                directory.mkdir()
        return directory

    def open(self, identifier):
        if not self.contains(identifier):
            raise BridgeError("unknown_conversation", "This provider has no such conversation.", 404)
        if identifier == self.original_id:
            return self.legacy
        path = self.directory() / (identifier + ".sqlite3")
        if (not path.is_file() or path.is_symlink() or path.stat().st_nlink != 1
                or getattr(path.stat(), "st_file_attributes", 0) & 0x400):
            raise BridgeError("conversation_unavailable", "The conversation journal is missing or linked; it was not recreated.")
        journal = Journal(path, self.workspace, provider=self.provider)
        if journal.get("conversation_id") != identifier:
            journal.close()
            raise BridgeError("conversation_mismatch", "Conversation journal identity does not match its catalog.")
        return journal

    def create(self, identifier, title=None, settings=None, *, branch_from=None):
        conversation_id(identifier)
        if self.contains(identifier):
            raise BridgeError("conversation_exists", "That conversation already exists.", 409)
        if len(self.entries()) >= 500:
            raise BridgeError("conversation_limit", "This provider supports up to 500 retained conversations.", 409)
        if title is not None and (not isinstance(title, str) or not title.strip() or len(title) > 120):
            raise BridgeError("invalid_title", "Use a conversation title of 1–120 characters.", 400)
        title = public_text(title.strip(), 120) if title else f"Conversation {len(self.entries()) + 1}"
        directory = self.directory()
        path = directory / (identifier + ".sqlite3")
        # Reserve without overwriting a previously interrupted/unregistered journal.
        with path.open("xb"):
            pass
        journal = Journal(path, self.workspace, provider=self.provider)
        try:
            journal.set("conversation_id", identifier)
            journal.set("conversation_settings", settings or {"model": None})
            if branch_from is not None:
                journal.set("branch_from", branch_from)
                journal.set("branch_state", "prepared")
            with self.legacy.db:
                self.legacy.db.execute("INSERT INTO conversation_catalog VALUES(?,?,?,NULL)",
                                       (identifier, title, time.time()))
        except BaseException:
            journal.close()
            raise
        return journal

    def claim_native(self, identifier, native_id):
        existing = self.legacy.db.execute("SELECT id FROM conversation_catalog WHERE native_id=?", (native_id,)).fetchone()
        if existing and existing["id"] != identifier:
            raise BridgeError("native_conversation_conflict", "Native session identity belongs to another conversation. No prompt was sent.")
        with self.legacy.db:
            self.legacy.db.execute("UPDATE conversation_catalog SET native_id=? WHERE id=?", (native_id, identifier))

    def select(self, identifier):
        if not self.contains(identifier):
            raise BridgeError("unknown_conversation", "This provider has no such conversation.", 404)
        if identifier != self.selected():
            with self.legacy.db:
                self.legacy.db.execute("INSERT OR REPLACE INTO meta VALUES(?,?)",
                    ("selection_revision", json.dumps(self.revision() + 1)))
                self.legacy.db.execute("INSERT OR REPLACE INTO meta VALUES(?,?)",
                    ("selected_conversation_id", json.dumps(identifier)))
