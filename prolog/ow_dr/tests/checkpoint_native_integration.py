"""Isolated real Windows native-launch checkpoint workflow. No production ports."""
import ctypes
import json
import os
from pathlib import Path
import shutil
import socket
import subprocess
import time
import unittest
import urllib.error
import urllib.request
import uuid

APP = Path(__file__).resolve().parents[1]


def wait_json(path, seconds=60):
    deadline = time.monotonic() + seconds
    while time.monotonic() < deadline:
        try:
            return json.loads(path.read_text(encoding="utf-8"))
        except (OSError, ValueError):
            time.sleep(.1)
    raise AssertionError(f"Fixture readiness timed out: {path}")


@unittest.skipUnless(os.name == "nt", "Native Windows launcher integration")
class NativeCheckpointWorkflow(unittest.TestCase):
    def setUp(self):
        self.root = APP / "tests" / (".checkpoint-native-" + str(uuid.uuid4()))
        self.app = self.root / "prolog" / "ow_dr"
        self.app.mkdir(parents=True)
        self.case = self.root / "case"
        self.case.mkdir()
        self.ports = set()
        self.child_handles = {}
        for path in APP.iterdir():
            if path.is_file() and path.suffix.lower() in {".pl", ".ps1", ".dll", ".json"}:
                shutil.copy2(path, self.app / path.name)
        for directory in ["docs", "web"]:
            shutil.copytree(APP / directory, self.app / directory,
                            ignore=shutil.ignore_patterns("node_modules", ".git"))
        (self.app / "tests").mkdir()
        shutil.copy2(APP / "tests" / "checkpoint_native_host.pl",
                     self.app / "tests" / "checkpoint_native_host.pl")
        with (self.app / "app.pl").open("a", encoding="utf-8") as stream:
            stream.write("\n:- use_module('tests/checkpoint_native_host').\n")
        # Fault injection is confined to this copied adapter; all listeners,
        # image restoration, native process ownership and rollback remain real.
        adapter = self.app / "kb_checkpoint_host.pl"
        adapter.write_text(adapter.read_text(encoding="utf-8").replace(
            "kb_checkpoint:runtime_hook(bind_ports,Profiles,done) :-",
            "kb_checkpoint:runtime_hook(bind_ports,Profiles,done) :-\n    checkpoint_native_fixture:allow_bind,",
            1), encoding="utf-8")
        # Preserve the real private ACL/credential adapter, changing ONLY the
        # copied fixture's storage root so tests never write a user profile.
        credentials = self.app / "debug_private_credentials.ps1"
        credentials.write_text(credentials.read_text(encoding="utf-8").replace(
            "$base = [Environment]::GetFolderPath([Environment+SpecialFolder]::LocalApplicationData)",
            "$base = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..\\..\\case'))",
            1), encoding="utf-8")
        self.base = self.read_base()
        self.log = (self.case / "owner.log").open("w")
        self.env = dict(os.environ, POWDER_CHECKPOINT_FIXTURE=str(self.case),
                   POWDER_SERVER_SETTINGS=str(self.case / "settings.json"),
                   POWDER_NATIVE_TVA_FILE=str(self.case / "native-tva.pl"),
                   POWDER_SOURCE_PACKS=str(self.case / "source-packs.json"))
        self.owner = subprocess.Popen(
            ["swipl", "-q", "-f", "none", "-s", str(self.app / "tests" / "checkpoint_native_host.pl"),
             "-g", "checkpoint_native_fixture:fixture_main", "-t", "halt(1)"],
            cwd=self.root, env=self.env, stdin=subprocess.DEVNULL, stdout=self.log, stderr=self.log,
            close_fds=True)
        try:
            self.ready = wait_json(self.case / "owner.json")
            self.primary = self.ready["primary"]
            self.extra = self.ready["extra"]
            self.ports.update([self.primary, self.extra])
            self.info = self.get(self.primary, "/_checkpoint_fixture/info")
            self.baseline = self.info["status"]
        except Exception:
            self.tearDown()
            raise

    def read_base(self):
        # Query the shared mount configuration through a resource-free process.
        result = subprocess.run(
            ["swipl", "-q", "-f", "none", "-g",
             f"use_module('{(self.app / 'kb_urls.pl').as_posix()}'),kb_urls:app_base(B),write(B),halt"],
            capture_output=True, text=True, cwd=self.root, check=True)
        return result.stdout.strip()

    def request(self, port, path, body=None):
        self.assertNotEqual(port, 3050)
        headers = {"Origin": f"http://127.0.0.1:{port}"}
        if body is not None:
            headers["Content-Type"] = "application/json"
        request = urllib.request.Request(f"http://127.0.0.1:{port}{path}",
            data=None if body is None else json.dumps(body).encode(), headers=headers)
        with urllib.request.urlopen(request, timeout=40) as response:
            return json.load(response)

    def get(self, port, path):
        return self.request(port, path)

    def api(self, action, body=None, port=None):
        return self.request(port or self.primary, self.base + "api/checkpoint/" + action, body)

    def private_status(self, run):
        credentials = self.ready["credentials"]
        request = urllib.request.Request(f"http://127.0.0.1:{credentials['port']}/control",
            data=json.dumps({**credentials, "request": str(uuid.uuid4()),
                             "action": "status", "payload": {"run": run}}).encode(),
            headers={"Content-Type": "application/json"})
        with urllib.request.urlopen(request, timeout=10) as response:
            result = json.load(response)
        credentials["token"] = result["token"]
        return result

    def operation(self, accepted, timeout=300):
        deadline = time.monotonic() + timeout
        while time.monotonic() < deadline:
            reply = self.api("status?operation=" + accepted["id"])
            if reply["phase"] not in {"running", "cancelling"}:
                return reply
            time.sleep(.2)
        self.fail(f"Checkpoint operation timed out: {reply}")

    def track_candidate(self, port):
        self.ports.add(port)
        info = self.get(port, "/_checkpoint_fixture/info")
        self.assertEqual(os.path.normcase(str(Path(info["fixture"]))), os.path.normcase(str(self.case)))
        self.assertNotEqual(info["pid"], self.ready["pid"])
        k = ctypes.WinDLL("kernel32", use_last_error=True)
        k.OpenProcess.argtypes = [ctypes.c_ulong, ctypes.c_int, ctypes.c_ulong]
        k.OpenProcess.restype = ctypes.c_void_p
        if info["pid"] not in self.child_handles:
            handle = k.OpenProcess(0x00100001, 0, info["pid"])
            self.assertTrue(handle)
            self.child_handles[info["pid"]] = handle
        return info

    def test_native_trial_busy_cancel_takeover_and_repeat_save(self):
        catalog = self.api("catalog")
        self.request(self.primary, "/_checkpoint_fixture/busy", {"busy": True})
        busy = self.operation(self.api("create", {
            "name": "Busy is not discarded", "generation": catalog["generation"], "revision": catalog["revision"]}))
        self.assertEqual(busy["phase"], "failed")
        self.request(self.primary, "/_checkpoint_fixture/busy", {"busy": False})
        self.assertEqual(self.api("catalog")["items"], [])
        created = self.operation(self.api("create", {
            "name": "Native fixture", "generation": catalog["generation"], "revision": catalog["revision"]}))
        self.assertEqual(created["phase"], "completed", created)
        state = created["result"]
        self.assertTrue(state["validated"])
        current = self.api("catalog")
        self.api("select", {"id": state["id"], "revision": current["revision"]})
        self.assertIsNone(self.owner.poll())
        for source in self.ready["sources"]:
            Path(source).unlink()
        for cache in self.ready["caches"]:
            Path(cache).unlink(missing_ok=True)
        tried = self.operation(self.api("try", {"id": state["id"], "generation": state["generation"]}))
        trial = tried["result"]
        self.assertEqual(trial["phase"], "trial_ready", trial)
        candidate = self.track_candidate(trial["temporary"])
        self.assertEqual(candidate["status"]["counts"], self.baseline["counts"])
        self.assertEqual(candidate["nativeTVA"], self.info["nativeTVA"])
        self.assertEqual(candidate["nativeRecords"], self.info["nativeRecords"])
        self.assertTrue(candidate["debug"]["enabled"])
        self.assertNotEqual(candidate["debug"]["port"], self.info["debug"]["port"])
        self.assertEqual(candidate["debug"]["max_sessions"], 3)
        self.assertEqual(candidate["debug"]["query_timeout"], 2)
        self.assertNotEqual(candidate["credentialHash"], self.info["credentialHash"])
        self.assertTrue(candidate["tty"], "Native launch must create fresh console stdin")
        self.assertEqual(candidate["console"], ["main"])
        self.assertEqual(self.get(self.primary, "/_checkpoint_fixture/info")["pid"], self.ready["pid"])
        cancelled = self.api("cancel", {"kind": "trial", "id": trial["id"]})
        self.assertEqual(cancelled["phase"], "cancelled")
        self.assertIsNone(self.owner.poll())
        tried = self.operation(self.api("try", {"id": state["id"], "generation": state["generation"]}))
        trial = tried["result"]
        self.assertEqual(trial["phase"], "trial_ready", trial)
        candidate = self.track_candidate(trial["temporary"])
        marker = self.case / "reject-candidate-bind"
        marker.write_text("test-owned bind failure", encoding="utf-8")
        self.api("promote", {"run": trial["id"], "revision": trial["revision"],
                             "confirm": "take-over-original-ports"})
        deadline = time.monotonic() + 60
        while time.monotonic() < deadline:
            try:
                rolled_back = self.api("status?run=" + trial["id"])
                if rolled_back["phase"] == "rolled_back":
                    break
            except (OSError, ValueError):
                pass
            time.sleep(.15)
        else:
            self.fail(f"Native failed takeover did not roll back: {self.private_status(trial['id'])}")
        self.assertIsNone(self.owner.poll())
        for port in [self.primary, self.extra]:
            self.assertEqual(self.get(port, "/_checkpoint_fixture/info")["pid"], self.ready["pid"])
        marker.unlink()
        tried = self.operation(self.api("try", {"id": state["id"], "generation": state["generation"]}))
        trial = tried["result"]
        self.assertEqual(trial["phase"], "trial_ready", trial)
        candidate = self.track_candidate(trial["temporary"])
        self.api("promote", {"run": trial["id"], "revision": trial["revision"],
                             "confirm": "take-over-original-ports"})
        deadline = time.monotonic() + 60
        while time.monotonic() < deadline:
            try:
                info = self.get(self.primary, "/_checkpoint_fixture/info")
                if info["pid"] == candidate["pid"] and info["instance"]["role"] == "active":
                    break
            except (OSError, ValueError):
                pass
            time.sleep(.15)
        else:
            self.fail(f"Verified candidate did not take over original port: {self.private_status(trial['id'])}")
        self.assertEqual(self.get(self.extra, "/_checkpoint_fixture/info")["pid"], candidate["pid"])
        promoted = self.get(self.primary, "/_checkpoint_fixture/info")
        self.assertEqual(promoted["debug"], self.info["debug"])
        self.assertNotEqual(promoted["credentialHash"], candidate["credentialHash"])
        self.owner.wait(timeout=15)
        self.assertEqual(self.owner.returncode, 0)
        (self.case / "native-tva.pl").unlink()
        catalog = self.api("catalog")
        again = self.operation(self.api("create", {
            "name": "Saved again after native takeover", "generation": catalog["generation"],
            "revision": catalog["revision"]}))
        self.assertEqual(again["phase"], "completed", again)
        self.assertEqual(again["result"]["counts"], state["counts"])
        self.assertEqual(again["result"]["configuration"]["nativeTVA"], state["configuration"]["nativeTVA"])
        catalog = self.api("catalog")
        self.api("select", {"id": again["result"]["id"], "revision": catalog["revision"]})
        self.request(self.primary, "/_checkpoint_fixture/stop", {})
        k = ctypes.WinDLL("kernel32", use_last_error=True)
        k.WaitForSingleObject.argtypes = [ctypes.c_void_p, ctypes.c_ulong]
        self.assertEqual(k.WaitForSingleObject(self.child_handles[candidate["pid"]], 15000), 0)
        with socket.socket() as listener:
            listener.bind(("127.0.0.1", 0))
            resumed_port = listener.getsockname()[1]
        self.startup = subprocess.Popen(
            ["swipl", "-q", "-f", "none", "-s", str(self.app / "kb_checkpoint_host.pl"),
             "-g", "current_prolog_flag(argv,A),kb_checkpoint_host:run_application(A),halt",
             "-t", "halt(1)", "--", f"--port={resumed_port}", "--debug-off"],
            cwd=self.root, env=self.env, stdin=subprocess.DEVNULL, stdout=self.log,
            stderr=self.log, close_fds=True)
        self.ports.add(resumed_port)
        deadline = time.monotonic() + 40
        while time.monotonic() < deadline:
            try:
                resumed = self.track_candidate(resumed_port)
                if resumed["console"] == ["main"]:
                    break
            except (OSError, ValueError):
                pass
            time.sleep(.15)
        else:
            self.fail("Selected next-start state did not resume through native launcher")
        self.assertTrue(resumed["tty"])
        self.assertEqual(resumed["status"]["counts"], state["counts"])
        self.assertEqual(resumed["nativeTVA"], self.info["nativeTVA"])
        self.assertFalse(resumed["debug"]["enabled"])
        self.assertIsNone(resumed["credentialHash"])
        self.assertEqual(self.get(self.extra, "/_checkpoint_fixture/info")["pid"], resumed["pid"])

    def tearDown(self):
        for port in list(getattr(self, "ports", [])):
            try:
                self.request(port, "/_checkpoint_fixture/stop", {})
            except Exception:
                pass
        if hasattr(self, "owner"):
            try:
                self.owner.wait(timeout=8)
            except subprocess.TimeoutExpired:
                self.owner.terminate()
                self.owner.wait(timeout=8)
        if hasattr(self, "startup"):
            try:
                self.startup.wait(timeout=8)
            except subprocess.TimeoutExpired:
                self.startup.terminate()
                self.startup.wait(timeout=8)
        if getattr(self, "child_handles", None):
            k = ctypes.WinDLL("kernel32", use_last_error=True)
            k.WaitForSingleObject.argtypes = [ctypes.c_void_p, ctypes.c_ulong]
            k.TerminateProcess.argtypes = [ctypes.c_void_p, ctypes.c_uint]
            k.CloseHandle.argtypes = [ctypes.c_void_p]
            for handle in self.child_handles.values():
                if k.WaitForSingleObject(handle, 8000) == 258:
                    k.TerminateProcess(handle, 143)
                    k.WaitForSingleObject(handle, 8000)
                k.CloseHandle(handle)
        if hasattr(self, "log"):
            self.log.close()
        if hasattr(self, "case"):
            for log in self.case.rglob("*.log"):
                text = log.read_text(encoding="utf-8", errors="replace")
                if "ERROR:" in text:
                    print(log.name, text[-8000:])
        if hasattr(self, "root") and self.root.exists():
            shutil.rmtree(self.root)


if __name__ == "__main__":
    unittest.main(verbosity=2)
