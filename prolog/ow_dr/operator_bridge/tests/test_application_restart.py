from __future__ import annotations

import asyncio
import json
import shutil
import unittest
from pathlib import Path

from ..monitor import ApplicationMonitor
from .support import fixture, remove, settle, until


@unittest.skipUnless(shutil.which("swipl"), "SWI-Prolog is required for the isolated process fixture")
class PrologRestartTests(unittest.IsolatedAsyncioTestCase):
    async def start_prolog(self):
        child = await asyncio.create_subprocess_exec(
            shutil.which("swipl"), "-q", "-f", "none", "-s",
            str(Path(__file__).with_name("fixture_application.pl")),
            stdin=asyncio.subprocess.PIPE, stdout=asyncio.subprocess.PIPE,
            stderr=asyncio.subprocess.PIPE)
        try:
            line = await asyncio.wait_for(child.stdout.readline(), 10)
            return child, json.loads(line)
        except BaseException:
            child.kill()
            await child.wait()
            raise

    async def stop_prolog(self, child):
        if child.returncode is None:
            child.stdin.write(b"stop\n")
            await child.stdin.drain()
            await asyncio.wait_for(child.wait(), 10)
        self.assertEqual(child.returncode, 0)

    async def test_real_prolog_exit_and_restart_do_not_restart_operator(self):
        directory, journal, adapter, service = fixture()
        children = []
        monitors = []
        try:
            await service.run()
            service.attach("human")
            await service.submit("human", {"id": "start", "kind": "start_session"})
            await settle(service)
            conversation = service.status()["conversationId"]
            native_session = service.status()["sdkSessionId"]
            for _ in range(2):
                child, identity = await self.start_prolog()
                children.append(child)
                monitor = ApplicationMonitor(service,
                    f"http://127.0.0.1:{identity['port']}/swish/openworld_dr/api/status", interval=0.02)
                monitors.append(monitor)
                await monitor.start()
                await until(lambda: service.app["online"])
                self.assertTrue(service.status()["bridge"]["online"])
                self.assertFalse(service.app["restartAvailable"])
                await self.stop_prolog(child)
                await until(lambda: not service.app["online"])
                await monitor.close()
                self.assertEqual(service.status()["conversationId"], conversation)
                self.assertEqual(service.status()["sdkSessionId"], native_session)
                self.assertEqual(adapter.stops, 0)
            self.assertNotEqual(children[0].pid, children[1].pid)
            self.assertEqual(len(adapter.starts), 1)
        finally:
            for monitor in monitors:
                await monitor.close()
            for child in children:
                if child.returncode is None:
                    child.kill()
                    await child.wait()
            await service.close()
            remove(directory)
