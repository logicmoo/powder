"""Actual isolated app HTTP handlers; never enables an existing live process."""
import http.client
import importlib.util
import json
import os
from pathlib import Path
import queue
import shutil
import socket
import subprocess
import sys
import threading
import time
import unittest

sys.dont_write_bytecode = True
HERE = Path(__file__).resolve().parent
APP = HERE.parent
spec = importlib.util.spec_from_file_location("debug_client", APP / "debug_telnet_client.py")
client = importlib.util.module_from_spec(spec)
spec.loader.exec_module(client)


def unused_port():
    with socket.socket() as s:
        s.bind(("127.0.0.1", 0))
        return s.getsockname()[1]


class Host:
    def __init__(self, args=(), legacy=False):
        self.port = unused_port()
        self.queue = queue.Queue()
        self.files = set()
        self.process = subprocess.Popen(
            [shutil.which("swipl"), "-q", "-f", str(HERE / "debug_http_child.pl"),
             "--", str(self.port), "legacy" if legacy else "scope", *args],
            stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE,
            encoding="utf-8", text=True)
        threading.Thread(target=self.read, daemon=True).start()
        try:
            ready = self.queue.get(timeout=20)
            self.pid, self.path = ready["pid"], ready["path"]
            self.origin = f"http://localhost:{self.port}"
        except BaseException:
            self.close()
            raise RuntimeError("Isolated HTTP fixture failed to start") from None

    def read(self):
        for line in self.process.stdout:
            try:
                self.queue.put(json.loads(line))
            except json.JSONDecodeError:
                self.queue.put({"error": "Unexpected non-JSON fixture output"})
        self.queue.put({"error": "Fixture exited"})

    def command(self, action, **values):
        self.process.stdin.write(json.dumps(dict(action=action, **values)) + "\n")
        self.process.stdin.flush()
        return self.queue.get(timeout=20)

    def http(self, action, body=None, origin=True, method=None, raw=None, headers=None):
        request_headers = {}
        if origin is not None:
            request_headers["Origin"] = self.origin if origin is True else origin
        if body is not None or raw is not None:
            request_headers["Content-Type"] = "application/json"
        if headers:
            request_headers.update(headers)
        data = raw if raw is not None else None if body is None else json.dumps(body)
        connection = http.client.HTTPConnection("127.0.0.1", self.port, timeout=20)
        try:
            connection.request(method or ("GET" if action == "status" else "POST"),
                               self.path + "/" + action, data, request_headers)
            response = connection.getresponse()
            payload = response.read()
            return response.status, json.loads(payload), response.getheader("Cache-Control")
        finally:
            connection.close()

    def credential(self):
        file = Path(self.command("credential")["file"])
        self.files.add(file)
        return file

    def finish(self):
        self.command("quit")
        self.process.wait(timeout=12)

    def close(self):
        if self.process.poll() is None:
            try:
                self.finish()
            except BaseException:
                self.process.terminate()  # exact owned fixture, never a live app
                self.process.wait(timeout=5)
        for stream in (self.process.stdin, self.process.stdout, self.process.stderr):
            try:
                stream.close()
            except OSError:
                pass
        for file in self.files:
            if file.exists():
                subprocess.run(
                    ["powershell", "-NoProfile", "-NonInteractive", "-ExecutionPolicy", "Bypass",
                     "-File", str(APP / "debug_private_credentials.ps1"), "-Mode", "remove",
                     "-CredentialFile", str(file)], stdout=subprocess.DEVNULL,
                    stderr=subprocess.DEVNULL, check=True, timeout=15)

    def __enter__(self):
        return self

    def __exit__(self, *_):
        self.close()


@unittest.skipUnless(sys.platform == "win32", "Windows authenticated debug service")
class DebugHTTPIntegration(unittest.TestCase):
    def whitelist(self, data):
        self.assertEqual(set(data), {"enabled", "state", "host", "port", "sessions", "maxSessions", "pid"})

    def test_http_start_auth_same_app_eof_reload_and_stop(self):
        with Host() as host:
            code, initial, cache = host.http("status")
            self.assertEqual(code, 200)
            self.assertFalse(initial["enabled"])
            self.assertEqual(cache, "no-store")
            self.whitelist(initial)
            port = unused_port()
            code, started, _ = host.http("start", {"port": port})
            self.assertEqual(code, 200)
            self.whitelist(started)
            self.assertEqual(started["pid"], host.pid)
            file = host.credential()
            data = client.load_credentials(file)
            c = client.Connection(data)
            try:
                c.prompt()
                c.send("current_prolog_flag(pid, PID), debug_http_fixture(Marker).")
                answer = c.prompt()
                self.assertIn(str(host.pid).encode(), answer)
                self.assertIn(b"existing_app", answer)
                self.assertEqual(host.command("reload"), {"handlers": 3})
                self.assertEqual(host.credential(), file)
                code, again, _ = host.http("start", {"port": port})
                self.assertEqual(code, 200)
                self.assertTrue(client.load_credentials(file)["token"] == data["token"])
                self.assertEqual(again["sessions"], 1)
                c.socket.shutdown(socket.SHUT_WR)
                while c.socket.recv(4096):
                    pass
            finally:
                c.close()
            self.assertIsNone(host.process.poll())
            code, stopped, _ = host.http("stop", {})
            self.assertEqual(code, 200)
            self.whitelist(stopped)
            self.assertFalse(stopped["enabled"])
            self.assertFalse(file.exists())

    def test_required_exact_origin_peer_and_typed_requests(self):
        with Host() as host:
            for origin in (None, "null", "http://evil.invalid",
                           host.origin + "/", host.origin + ".evil",
                           "https://localhost:" + str(host.port),
                           "http://localhost:" + str(host.port + 1)):
                self.assertEqual(host.http("start", {}, origin=origin)[0], 403)
                self.assertEqual(host.http("status", origin=origin)[0], 403)
            bad = [{"goal": "halt."}, {"port": "3051"}, {"port": 0},
                   {"port": 65536}, {"port": 3051, "options": []}, []]
            for body in bad:
                code, error, _ = host.http("start", body)
                self.assertEqual(code, 400)
                self.assertNotIn("halt", json.dumps(error))
            for raw in ('{', '{"padding":"' + 'x' * 200 + '"}'):
                self.assertEqual(host.http("start", raw=raw)[0], 400)
            self.assertEqual(host.http("stop", {"goal": "true."})[0], 400)
            self.assertFalse(host.http("status")[1]["enabled"])

    def test_occupied_port_leaves_debug_disabled_and_http_healthy(self):
        with socket.socket() as occupied:
            occupied.setsockopt(socket.SOL_SOCKET, socket.SO_EXCLUSIVEADDRUSE, 1)
            occupied.bind(("127.0.0.1", 0))
            occupied.listen()
            with Host() as host:
                code, error, _ = host.http("start", {"port": occupied.getsockname()[1]})
                self.assertEqual(code, 409)
                self.assertEqual(error["error"]["code"], "port_unavailable")
                self.assertFalse(host.http("status")[1]["enabled"])

    def test_admin_stop_allows_restart_but_host_shutdown_blocks_start(self):
        with Host() as host:
            port = unused_port()
            self.assertEqual(host.http("start", {"port": port})[0], 200)
            first = host.credential()
            self.assertEqual(host.http("stop", {})[0], 200)
            self.assertEqual(host.http("start", {"port": port})[0], 200)
            self.assertNotEqual(first, host.credential())
            self.assertFalse(first.exists())
            self.assertEqual(host.command("stop_debug"), {"stopped": True})
            code, error, _ = host.http("start", {"port": port})
            self.assertEqual(code, 503)
            self.assertEqual(error["error"]["code"], "shutting_down")
            self.assertFalse(host.http("status")[1]["enabled"])

    def test_cli_compatibility_enabled_startup_and_normal_shutdown(self):
        port = unused_port()
        with Host(args=["--debug-port=" + str(port)]) as host:
            self.assertEqual(host.http("status")[1]["port"], port)
            file = host.credential()
            self.assertEqual(host.command("legacy_arguments", args=["--port=4444", "a.krf"]),
                             {"port": 4444, "files": ["a.krf"]})
            self.assertEqual(host.command("cli", args=["--debug-port=3051", "--port=4444", "a.krf"]),
                             {"appPort": 4444, "files": ["a.krf"], "enabled": True, "debugPort": 3051})
            self.assertFalse(host.command("cli", args=["--debug-port=3051", "--debug-off"])["enabled"])
            self.assertIn("error", host.command("cli", args=["--debug-port=1e3"]))
            host.finish()
            self.assertFalse(file.exists())
            with socket.socket() as check:
                check.bind(("127.0.0.1", port))

    def test_builder_guard_and_http_stop_do_not_stop_debug(self):
        with Host() as host:
            port = unused_port()
            self.assertEqual(host.http("start", {"port": port})[0], 200)
            file = host.credential()
            self.assertEqual(host.command("builder_guard"), {"error": "debug_active"})
            self.assertEqual(host.command("stop_http"), {"stopped": True})
            c = client.Connection(client.load_credentials(file))
            try:
                c.prompt()
                c.send("end_of_file.")
            finally:
                c.close()
            self.assertEqual(host.command("stop_debug"), {"stopped": True})
            self.assertEqual(host.command("builder_guard"), {"safe": True})

    def test_halt_hook_cleans_service_for_preexisting_host_frames(self):
        with Host(legacy=True) as host:
            port = unused_port()
            self.assertEqual(host.http("start", {"port": port})[0], 200)
            file = host.credential()
            host.finish()
            self.assertFalse(file.exists())
            with socket.socket() as check:
                check.bind(("127.0.0.1", port))


if __name__ == "__main__":
    unittest.main()
