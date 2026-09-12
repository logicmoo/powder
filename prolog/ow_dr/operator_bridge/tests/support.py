from __future__ import annotations

import asyncio
import shutil
import uuid
from pathlib import Path

from ..journal import Journal
from ..service import OperatorService
from ..workspace import Workspace


class FakeAdapter:
    """Test-only adapter; never selectable by the production entry point."""
    name = "test-only-fake"
    available = True

    def __init__(self):
        self.sent = []
        self.starts = []
        self.stops = 0
        self.cancelled = 0
        self.gate = asyncio.Event()
        self.approved = None
        self.mode = "normal"

    async def start(self, resume_id):
        self.starts.append(resume_id)
        return {"sessionId": resume_id or "documented-test-session"}

    async def send(self, text, emit, permission):
        self.sent.append(text)
        await emit(f"test output: {text}")
        if self.mode == "permission":
            self.approved = await permission("write", "Write the selected fixture", "tests/fixture.txt")
        elif self.mode == "block":
            await self.gate.wait()
        elif self.mode == "unknown":
            raise RuntimeError("secret=not-for-browser")

    async def cancel(self):
        self.cancelled += 1
        self.gate.set()
        return self.mode != "unknown"

    async def stop(self):
        self.stops += 1
        self.gate.set()

    def status(self):
        return {"name": self.name, "available": True, "connected": bool(self.starts),
                "sessionId": "documented-test-session" if self.starts else None,
                "resumeSupported": True, "ownedPids": []}


def fixture():
    directory = Path(__file__).parent / ".artifacts" / str(uuid.uuid4())
    directory.mkdir(parents=True)
    workspace = Workspace(str(directory.resolve()), "master")
    journal = Journal(directory / "journal.sqlite3", workspace)
    adapter = FakeAdapter()
    service = OperatorService(journal, workspace, adapter, verify=lambda: None)
    return directory, journal, adapter, service


def remove(directory):
    shutil.rmtree(directory)


async def settle(service):
    await asyncio.wait_for(service.queue.join(), 3)


async def until(predicate):
    async with asyncio.timeout(3):
        while not predicate():
            await asyncio.sleep(0.005)
