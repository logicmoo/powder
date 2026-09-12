"""Isolated real SWI processes and loopback sockets; never connects to a live app.

Tokens remain in private files/process memory. Do not print or assert their
contents: even test failures must not expose them in test output.
"""
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
import uuid

sys.dont_write_bytecode = True
HERE = Path(__file__).resolve().parent
APP = HERE.parent
spec = importlib.util.spec_from_file_location("debug_client", APP / "debug_telnet_client.py")
debug_client = importlib.util.module_from_spec(spec)
spec.loader.exec_module(debug_client)


def unused_port():
    with socket.socket() as s:
        s.bind(("127.0.0.1", 0))
        return s.getsockname()[1]


class App:
    def __init__(self, port=None):
        self.started = time.time()
        self.port = port or unused_port()
        self.messages = queue.Queue()
        self.process = subprocess.Popen(
            [shutil.which("swipl"), "-q", "-f", str(HERE / "debug_telnet_child.pl"),
             "--", str(self.port)], stdin=subprocess.PIPE, stdout=subprocess.PIPE,
            stderr=subprocess.PIPE, encoding="utf-8", text=True)
        self.reader = threading.Thread(target=self.read_messages, daemon=True)
        self.reader.start()
        self.pid = self.messages.get(timeout=5)["pid"]
        self.file = None

    def read_messages(self):
        for line in self.process.stdout:
            self.messages.put(json.loads(line))

    def request(self, action, **more):
        self.process.stdin.write(json.dumps(dict(action=action, **more)) + "\n")
        self.process.stdin.flush()
        return self.messages.get(timeout=20)

    def start(self, **options):
        response = self.request("start", options=options)
        if response.get("error"):
            raise RuntimeError("Isolated service startup failed (details suppressed)")
        self.file = Path(response["credentialFile"])
        return response

    def credentials(self):
        return debug_client.load_credentials(self.file)

    def connect(self):
        return debug_client.Connection(self.credentials())

    def raw(self):
        s = socket.create_connection(("127.0.0.1", self.port), timeout=3)
        s.settimeout(3)
        return s

    def close(self):
        if self.process.poll() is None:
            try:
                self.request("quit")
                self.process.wait(timeout=8)
            except BaseException:
                self.process.terminate()  # exact owned isolated test process
                self.process.wait(timeout=5)
        for stream in (self.process.stdin, self.process.stdout, self.process.stderr):
            try:
                stream.close()
            except OSError:
                pass
        # On test failure a hard-killed test process may leave only its private file.
        root = Path(os.environ["LOCALAPPDATA"]) / "powder-local-debug"
        owned = [p for p in root.glob(f"{self.pid}-*/credentials.json")
                 if p.stat().st_mtime >= self.started]
        for private_file in owned:
            subprocess.run(
                ["powershell", "-NoProfile", "-NonInteractive", "-ExecutionPolicy", "Bypass",
                 "-File", str(APP / "debug_private_credentials.ps1"), "-Mode", "remove",
                 "-CredentialFile", str(private_file)], stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL, check=True, timeout=15)

    def __enter__(self):
        return self

    def __exit__(self, *_):
        self.close()


def read_all(s):
    data = bytearray()
    while True:
        try:
            part = s.recv(4096)
        except ConnectionResetError:
            return bytes(data)
        if not part:
            return bytes(data)
        data.extend(part)
        if len(data) > 100_000:
            raise AssertionError("Unexpected response size")


def wait_sessions(app, expected=0):
    deadline = time.monotonic() + 3
    while time.monotonic() < deadline:
        if app.request("status")["sessions"] == expected:
            return
        time.sleep(.03)
    raise AssertionError("Client resource cleanup did not complete")


@unittest.skipUnless(sys.platform == "win32", "Owner-private Windows credential ACL")
class DebugTelnetIntegration(unittest.TestCase):
    def test_authentication_before_evaluation_and_main_io_preserved(self):
        with App() as app:
            self.assertFalse(app.request("status")["enabled"])
            self.assertEqual(app.request("snapshot"), {"safe": True})
            app.start()
            with app.raw() as s:
                s.sendall(b"assertz(debug_fixture_marker(unauthenticated)).\r\n")
                output = read_all(s)
                self.assertIn(b"DENIED", output)
                self.assertNotIn(b"?- ", output)
            self.assertFalse(app.request("marker")["mutated"])
            c = app.connect()
            try:
                c.prompt()
                c.send("current_prolog_flag(pid, PID), debug_fixture_marker(Value).")
                result = c.prompt()
                self.assertIn(str(app.pid).encode(), result)
                self.assertIn(b"same_app", result)
                c.send("")
                c.prompt()
                c.send("end_of_file.")
                read_all(c.socket)
            finally:
                c.close()
            wait_sessions(app)
            flags = app.request("flags")
            self.assertEqual(flags, {"goal": "halt", "mainInput": True, "mainOutput": True})
            self.assertEqual(app.request("stop"), {"stopped": True})
            self.assertFalse(app.file.exists())
            self.assertEqual(app.request("snapshot"), {"safe": True})

    def test_native_halt_flag_eof_at_query_and_alternatives_is_client_only(self):
        with App() as app:
            app.start()
            for alternatives in (False, True):
                c = app.connect()
                c.prompt()
                if alternatives:
                    c.send("member(X,[one,two]).")
                    self.assertIn(b"X = one", c.prompt())
                c.socket.shutdown(socket.SHUT_WR)
                read_all(c.socket)
                c.close()
                wait_sessions(app)
                self.assertIsNone(app.process.poll(), "Client EOF must never halt its app")
                self.assertEqual(app.request("flags")["goal"], "halt")

    def test_alternatives_exceptions_query_timeout_and_utf8(self):
        with App() as app:
            app.start(query_timeout=.3)
            c = app.connect()
            try:
                c.prompt()
                c.send("member(X,[one,two]).")
                self.assertIn(b"one", c.prompt())
                c.send(";")
                self.assertIn(b"two", c.prompt())
                c.send("throw(example_error).")
                self.assertIn(b"ERROR:", c.prompt())
                c.send("sleep(2).")
                started = time.monotonic()
                self.assertIn(b"Time limit", c.prompt())
                self.assertLess(time.monotonic() - started, 1.5)
                c.send('X = "Unicode Ω 日本語".')
                self.assertIn("Unicode Ω 日本語".encode(), c.prompt())
                c.send("end_of_file.")
            finally:
                c.close()
            self.assertIsNone(app.process.poll())

    def test_stop_cleans_pending_and_authenticated_clients_and_rotates(self):
        with App() as app:
            app.start()
            previous = app.credentials()["token"]
            active = app.connect()
            active.prompt()
            pending = app.raw()
            self.assertIn("error", app.request("snapshot"))
            start = time.monotonic()
            self.assertEqual(app.request("stop"), {"stopped": True})
            self.assertLess(time.monotonic() - start, 6)
            read_all(active.socket)
            read_all(pending)
            active.close()
            pending.close()
            self.assertFalse(app.file.exists())
            app.start()
            self.assertTrue(app.credentials()["token"] != previous, "Start must rotate credentials")
            stale = dict(app.credentials(), token=previous)
            with self.assertRaises(PermissionError):
                debug_client.Connection(stale)
            self.assertEqual(app.request("stop"), {"stopped": True})

    def test_auth_deadline_session_and_idle_limits(self):
        with App() as app:
            app.start(auth_timeout=.15, idle_timeout=.3, session_timeout=.8)
            with app.raw() as s:
                s.sendall(b"AUTH ")
                self.assertIn(b"DENIED", read_all(s))
            wait_sessions(app)
            c = app.connect()
            c.prompt()
            read_all(c.socket)
            c.close()
            wait_sessions(app)
            self.assertIsNone(app.process.poll())

    def test_absolute_session_deadline_during_query_and_host_stop_during_query(self):
        with App() as app:
            app.start(session_timeout=.4, query_timeout=10)
            c = app.connect()
            c.prompt()
            c.send("sleep(5).")
            start = time.monotonic()
            read_all(c.socket)
            self.assertLess(time.monotonic() - start, 2)
            c.close()
            wait_sessions(app)
            app.request("stop")
            app.start()
            c = app.connect()
            c.prompt()
            c.send("sleep(10).")
            time.sleep(.05)
            self.assertEqual(app.request("stop"), {"stopped": True})
            read_all(c.socket)
            c.close()
            self.assertIsNone(app.process.poll())

    def test_authenticated_clients_share_app_and_long_auth_is_rejected(self):
        with App() as app:
            app.start()
            with app.raw() as s:
                s.sendall(b"AUTH " + b"a" * 1000 + b"\r\n")
                self.assertNotIn(b"?- ", read_all(s))
            wait_sessions(app)
            first, second = app.connect(), app.connect()
            try:
                first.prompt()
                second.prompt()
                first.send("assertz(user:debug_fixture_marker(explicit_test)).")
                self.assertIn(b"true.", first.prompt())
                second.send("user:debug_fixture_marker(explicit_test).")
                self.assertIn(b"true.", second.prompt())
                first.send("end_of_file.")
                second.send("end_of_file.")
            finally:
                first.close()
                second.close()
            wait_sessions(app)

    def test_rate_and_session_limits_and_iac_rejection(self):
        with App() as app:
            app.start(max_sessions=1, attempt_limit=2, attempt_window=5)
            active = app.connect()
            active.prompt()
            with app.raw() as overflow:
                self.assertEqual(read_all(overflow), b"")
            active.close()
            wait_sessions(app)
            with app.raw() as invalid:
                invalid.sendall(b"\xff\xfb\x01AUTH bad\r\n")
                self.assertNotIn(b"?- ", read_all(invalid))
            wait_sessions(app)
            with app.raw() as limited:
                self.assertEqual(read_all(limited), b"")

    def test_occupied_port_is_not_stolen(self):
        with socket.socket() as occupied:
            occupied.setsockopt(socket.SOL_SOCKET, socket.SO_EXCLUSIVEADDRUSE, 1)
            occupied.bind(("127.0.0.1", 0))
            occupied.listen()
            with App(port=occupied.getsockname()[1]) as app:
                self.assertIn("error", app.request("start"))
                self.assertFalse(app.request("status")["enabled"])
                self.assertEqual(app.request("snapshot"), {"safe": True})

    def test_failed_private_provision_releases_port_without_publishing(self):
        with App() as app:
            self.assertIn("error", app.request("failed_credentials"))
            self.assertFalse(app.request("status")["enabled"])
            self.assertEqual(app.request("snapshot"), {"safe": True})
            with socket.socket() as check:
                check.bind(("127.0.0.1", app.port))
            app.start()
            with self.assertRaises(OSError):
                socket.create_connection(("127.0.0.2", app.port), timeout=.3)

    def test_private_acl_public_status_and_readonly_cli_probe(self):
        with App() as app:
            app.start()
            self.assertFalse(app.file.is_relative_to(APP.parents[1]))
            checked = subprocess.run(
                ["powershell", "-NoProfile", "-NonInteractive", "-ExecutionPolicy", "Bypass",
                 "-File", str(APP / "debug_private_credentials.ps1"), "-Mode", "verify",
                 "-CredentialFile", str(app.file)], capture_output=True, timeout=15)
            self.assertEqual(checked.returncode, 0)
            status = app.request("status")
            self.assertTrue("token" not in status and "credentialFile" not in status)
            probe = subprocess.run(
                [sys.executable, str(APP / "debug_telnet_client.py"),
                 "--credentials", str(app.file), "--probe"], capture_output=True, timeout=8)
            self.assertEqual(probe.returncode, 0)
            self.assertIn(str(app.pid).encode(), probe.stdout)
            self.assertTrue(app.credentials()["token"].encode() not in probe.stdout)

    def test_quiescent_qsave_roundtrip_does_not_start_or_restore_auth(self):
        directory = HERE / (".debug-state-test-" + uuid.uuid4().hex)
        directory.mkdir()
        image = directory / "debug.state"
        def quoted(path):
            return "'" + str(path).replace("\\", "\\\\").replace("'", "''") + "'"
        try:
            goal = (
                "use_module(" + quoted(APP / "kb_debug_telnet.pl") + "),"
                "kb_debug_telnet:debug_snapshot_safe,"
                "Goal=(kb_debug_telnet:debug_snapshot_safe,"
                "kb_debug_telnet:debug_telnet_status(S),get_dict(enabled,S,false),"
                "writeln(restored_debug_disabled),halt),"
                "qsave_program(" + quoted(image) + ",[goal(Goal),stand_alone(false)]),halt")
            built = subprocess.run(
                [shutil.which("swipl"), "-q", "-f", "none", "-g", goal],
                capture_output=True, timeout=45)
            self.assertEqual(built.returncode, 0, "Quiescent isolated qsave failed")
            restored = subprocess.run(
                [shutil.which("swipl"), "-q", "-f", "none", "-x", str(image)],
                capture_output=True, timeout=15)
            self.assertEqual(restored.returncode, 0)
            self.assertIn(b"restored_debug_disabled", restored.stdout)
        finally:
            shutil.rmtree(directory)


if __name__ == "__main__":
    unittest.main()
