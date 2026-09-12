"""Explicit installed-runtime health check. Never creates sessions/threads or sends prompts."""
from __future__ import annotations

import asyncio
import http.client
import json
import shutil
import uuid
from pathlib import Path

from ..codex_adapter import CodexAdapter
from ..copilot_adapter import CopilotAdapter
from ..journal import Journal
from ..native import resolve_native
from ..security import private_directory
from ..workspace import Workspace


async def prolog_restart_probe(adapter):
    executable = shutil.which("swipl")
    if not executable:
        return False
    process = adapter.client._cli_process if adapter.provider == "copilot" else adapter.rpc.process
    native_pid = process.pid
    children = []
    try:
        for _ in range(2):
            child = await asyncio.create_subprocess_exec(
                executable, "-q", "-f", "none", "-s",
                str(Path(__file__).with_name("fixture_application.pl")),
                stdin=asyncio.subprocess.PIPE, stdout=asyncio.subprocess.PIPE,
                stderr=asyncio.subprocess.PIPE, cwd=adapter.cwd)
            children.append(child)
            identity = json.loads(await asyncio.wait_for(child.stdout.readline(), 10))
            def status():
                connection = http.client.HTTPConnection("127.0.0.1", identity["port"], timeout=3)
                try:
                    connection.request("GET", "/swish/openworld_dr/api/status")
                    response = connection.getresponse()
                    assert response.status == 200
                    json.loads(response.read(65536))
                finally:
                    connection.close()
            await asyncio.to_thread(status)
            child.stdin.write(b"stop\n")
            await child.stdin.drain()
            await asyncio.wait_for(child.wait(), 10)
            assert child.returncode == 0
            assert native_pid in adapter.status()["ownedPids"]
            if adapter.provider == "copilot":
                await asyncio.wait_for(adapter.client.get_status(), 15)
            else:
                assert not adapter.rpc.closed and not adapter.rpc.reader_task.done()
        assert children[0].pid != children[1].pid
        return True
    finally:
        for child in children:
            if child.returncode is None:
                child.kill()
                await child.wait()


async def main():
    root = Path(__file__).resolve().parents[4]
    workspace = Workspace.inspect(root)
    directory = Path(__file__).parent / ".artifacts" / ("native-health-" + str(uuid.uuid4()))
    private_directory(directory)
    try:
        for provider, adapter_type in (("copilot", CopilotAdapter), ("codex", CodexAdapter)):
            journal = Journal(directory / (provider + ".sqlite3"), workspace, provider=provider)
            adapter = adapter_type(resolve_native(provider), journal)
            try:
                await asyncio.wait_for(adapter.connect(workspace.root), 60)
                assert journal.get("native_creation") is None
                survived = await prolog_restart_probe(adapter)
                status = adapter.status()
                print(json.dumps({"provider": provider, "cliVersion": status["cliVersion"],
                                  "protocolVerified": status["protocolVerified"],
                                  "ownedPids": status["ownedPids"], "sessionsCreated": 0,
                                  "promptsSent": 0, "prologRestartVerified": survived}), flush=True)
            finally:
                await asyncio.wait_for(adapter.stop(), 45)
                journal.close()
    finally:
        shutil.rmtree(directory)


if __name__ == "__main__":
    try:
        asyncio.run(main())
    except Exception as error:
        print(json.dumps({"healthFailed": type(error).__name__,
                          "code": getattr(error, "code", "native_health_failed"),
                          "details": "Native diagnostic content is intentionally not exposed."}), flush=True)
        raise SystemExit(1)
