"""Isolated real Windows native-launch checkpoint workflow. No production ports."""
import ctypes
import json
import os
from pathlib import Path
import shutil
import socket
import subprocess
import threading
import struct
import time
import unittest
import urllib.error
import urllib.request
import uuid
from checkpoint_fixture_policy import authorize_copied_checkpoint_fixture

if os.name == "nt":
    from windows_console_launcher import JOB_LIMIT, check as win_check, k as job_api

APP = Path(__file__).resolve().parents[1]


def fixture_credentials_script(script, base):
    original = "$base = [Environment]::GetFolderPath([Environment+SpecialFolder]::LocalApplicationData)"
    if not base.is_absolute() or not base.is_dir():
        raise ValueError("Credential fixture base must already exist and be absolute")
    if script.count(original) != 1:
        raise ValueError("Credential root adapter changed; refusing an unsafe fixture launch")
    literal = str(base).replace("'", "''")
    return script.replace(original, f"$base = '{literal}'", 1)


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
        self.controller_job = None
        self.promoting_pids = set()
        self.socket_violations = []
        self.monitor_stop = threading.Event()
        for path in APP.iterdir():
            if path.is_file() and path.suffix.lower() in {".pl", ".ps1", ".dll", ".json"}:
                shutil.copy2(path, self.app / path.name)
        for directory in ["docs", "web"]:
            shutil.copytree(APP / directory, self.app / directory,
                            ignore=shutil.ignore_patterns("node_modules", ".git"))
        authorize_copied_checkpoint_fixture(self.app)
        (self.app / "tests").mkdir()
        for name in ["checkpoint_native_host.pl", "test_checkpoint_http.pl", "test_checkpoint_wiring.pl"]:
            shutil.copy2(APP / "tests" / name, self.app / "tests" / name)
        with (self.app / "app.pl").open("a", encoding="utf-8") as stream:
            stream.write("\n:- use_module('tests/checkpoint_native_host').\n")
        # Fault injection is confined to this copied adapter; all listeners,
        # image restoration, native process ownership and rollback remain real.
        adapter = self.app / "kb_checkpoint_host.pl"
        adapter.write_text(adapter.read_text(encoding="utf-8").replace(
            "kb_checkpoint:runtime_hook(bind_ports,Profiles,done) :-",
            "kb_checkpoint:runtime_hook(bind_ports,Profiles,done) :-\n    checkpoint_native_fixture:allow_bind,",
            1).replace(
            "kb_checkpoint:runtime_hook(retire_old,_,done) :-",
            "kb_checkpoint:runtime_hook(retire_old,_,done) :-\n    checkpoint_native_fixture:allow_retire,",
            1).replace(
            "kb_console_launch:launch_new_console(Exe,Args,Directory,PID).",
            "kb_console_launch:launch_new_console(Exe,Args,Directory,PID),\n"
            "    checkpoint_native_fixture:record_child(PID).", 1), encoding="utf-8")
        http_adapter = self.app / "kb_checkpoint_http.pl"
        http_adapter.write_text(http_adapter.read_text(encoding="utf-8").replace(
            "endpoint_error(Error) :-", "endpoint_error(Error) :-\n    checkpoint_native_fixture:record_error(Error),", 1),
            encoding="utf-8")
        # Preserve the real private ACL/credential adapter, changing ONLY the
        # copied fixture's storage root so tests never write a user profile.
        credentials = self.app / "debug_private_credentials.ps1"
        credentials.write_text(fixture_credentials_script(
            credentials.read_text(encoding="utf-8-sig"), self.case), encoding="utf-8-sig")
        self.base = self.read_base()
        self.log = (self.case / "owner.log").open("w")
        self.env = dict(os.environ, POWDER_CHECKPOINT_FIXTURE=str(self.case),
                   POWDER_SERVER_SETTINGS=str(self.case / "settings.json"),
                   POWDER_NATIVE_TVA_FILE=str(self.case / "native-tva.pl"),
                   POWDER_SOURCE_PACKS=str(self.case / "source-packs.json"))
        validation = subprocess.run(
            ["swipl", "-q", "-f", "none", "-s", "tests/test_checkpoint_http.pl",
             "-s", "tests/test_checkpoint_wiring.pl",
             "-g", "(run_tests([checkpoint_http,checkpoint_wiring])->halt(0);halt(1))"],
            cwd=self.app, env=self.env, capture_output=True, text=True, timeout=90)
        if validation.returncode:
            self.tearDown()
            self.fail("Copied host/API integration failed:\n" + validation.stdout + validation.stderr)
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
            self.assertEqual(self.ready["pid"], self.owner.pid)
            self.controller_job = win_check(job_api.CreateJobObjectW(None, None))
            limits = JOB_LIMIT()
            limits.flags = 0x2800  # Kill-on-close plus explicit breakaway permission.
            win_check(job_api.SetInformationJobObject(
                self.controller_job, 9, ctypes.byref(limits), ctypes.sizeof(limits)))
            win_check(job_api.AssignProcessToJobObject(self.controller_job, int(self.owner._handle)))
            self.monitor = threading.Thread(target=self.monitor_candidate_sockets, daemon=True)
            self.monitor.start()
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
        try:
            with urllib.request.urlopen(request, timeout=40) as response:
                return json.load(response)
        except urllib.error.HTTPError as error:
            body = error.read().decode("utf-8", errors="replace")
            error.add_note(f"{path}: HTTP {error.code}: {body}")
            if path != "/_checkpoint_fixture/info":
                try:
                    details = self.get(port, "/_checkpoint_fixture/info")
                    error.add_note(f"Fixture errors: {details['errors']}; transitions: {details['transitions']}")
                except Exception:
                    pass
            raise
        except OSError as error:
            exits = {}
            job_api.GetExitCodeProcess.argtypes = [
                ctypes.wintypes.HANDLE, ctypes.POINTER(ctypes.wintypes.DWORD)]
            job_api.GetExitCodeProcess.restype = ctypes.wintypes.BOOL
            for pid, handle in self.child_handles.items():
                code = ctypes.wintypes.DWORD()
                if job_api.GetExitCodeProcess(handle, ctypes.byref(code)):
                    exits[pid] = code.value
            error.add_note(f"Owned native process exit codes (259 means active): {exits}")
            if path != "/_checkpoint_fixture/info":
                for alternative in [getattr(self, "primary", None), getattr(self, "extra", None)]:
                    if alternative:
                        try:
                            details = self.get(alternative, "/_checkpoint_fixture/info")
                            error.add_note(f"Owned fixture port {alternative}: pid={details['pid']}, errors={details['errors']}")
                        except (OSError, ValueError):
                            pass
            raise

    def get(self, port, path):
        return self.request(port, path)

    def api(self, action, body=None, port=None):
        if body is not None:
            catalog = self.api("catalog", port=port)
            intent = {"create": "save-state", "select": "select-next-start",
                "try": "start-candidate", "promote": "promote-candidate",
                "cancel": "stop-candidate" if body.get("kind") == "trial" else "cancel-operation"}[action]
            body = dict(body, intent=intent, checkpointRevision=catalog["revision"],
                        requestId=f"{catalog['mutationEpoch']}:{uuid.uuid4()}")
        return self.request(port or self.primary, self.base + "api/checkpoint/" + action, body)

    def private_status(self, run):
        try:
            return self.private_command("status", {"run": run})
        except OSError as error:
            return {"controlUnavailable": str(error), "processes": self.process_diagnostics()}

    def private_command(self, action, payload):
        credentials = self.ready["credentials"]
        mailbox = Path(credentials["mailbox"])
        self.assertTrue(mailbox.is_relative_to(self.case))
        request_id = str(uuid.uuid4())
        command = {"instance": credentials["instance"], "token": credentials["token"],
                   "request": request_id, "action": action, "payload": payload}
        stage = mailbox / (request_id + ".stage")
        stage.write_text(json.dumps(command), encoding="utf-8")
        stage.replace(mailbox / f"command-{request_id}.json")
        response = mailbox / f"reply-{request_id}.json"
        result = wait_json(response, 40)
        response.unlink()
        credentials["token"] = result["token"]
        return {key: value for key, value in result.items() if key != "token"}

    def candidate_command(self, trial, action, payload):
        reply = self.private_command("candidate", {"run": trial["id"], "action": action, "payload": payload})
        self.assertTrue(reply["ok"], reply)
        return reply["result"]

    def owned_network_rows(self):
        api = ctypes.WinDLL("iphlpapi", use_last_error=True)
        found = []
        for name, klass, sizes in [("GetExtendedTcpTable", 5, [(2, 24), (23, 56)]),
                                  ("GetExtendedUdpTable", 1, [(2, 12), (23, 28)])]:
            fn = getattr(api, name)
            fn.argtypes = [ctypes.c_void_p, ctypes.POINTER(ctypes.c_ulong),
                           ctypes.c_bool, ctypes.c_ulong, ctypes.c_int, ctypes.c_ulong]
            for family, row_size in sizes:
                size = ctypes.c_ulong(0)
                result = fn(None, ctypes.byref(size), False, family, klass, 0)
                self.assertIn(result, [0, 122])
                buffer = ctypes.create_string_buffer(size.value)
                self.assertEqual(fn(buffer, ctypes.byref(size), False, family, klass, 0), 0)
                raw = buffer.raw
                count = struct.unpack_from("<I", raw)[0]
                for offset in range(4, 4 + count * row_size, row_size):
                    pid = struct.unpack_from("<I", raw, offset + row_size - 4)[0]
                    found.append((pid, name, family))
        return found

    def monitor_candidate_sockets(self):
        try:
            while not self.monitor_stop.wait(.02):
                pids = {int(path.stem.split("-")[1]) for path in self.case.glob("child-*.started")}
                forbidden = pids - self.promoting_pids
                self.socket_violations.extend(row for row in self.owned_network_rows() if row[0] in forbidden)
        except Exception as error:
            self.socket_violations.append(("monitor failed", str(error)))

    def process_diagnostics(self):
        job_api.GetExitCodeProcess.argtypes = [
            ctypes.wintypes.HANDLE, ctypes.POINTER(ctypes.wintypes.DWORD)]
        job_api.GetExitCodeProcess.restype = ctypes.wintypes.BOOL
        exits = {"controller": self.owner.poll()}
        for pid, handle in self.child_handles.items():
            code = ctypes.wintypes.DWORD()
            if job_api.GetExitCodeProcess(handle, ctypes.byref(code)):
                exits[pid] = code.value
        errors = {path.name: path.read_text(encoding="utf-8", errors="replace")[-4000:]
                  for path in self.case.glob("errors-*.log")}
        return {"exits": exits, "errors": errors}

    def operation(self, accepted, timeout=300):
        deadline = time.monotonic() + timeout
        while time.monotonic() < deadline:
            reply = self.api("status?operation=" + accepted["id"])
            if reply["phase"] not in {"running", "cancelling"}:
                return reply
            time.sleep(.2)
        self.fail(f"Checkpoint operation timed out: {reply}")

    def track_serving(self, port):
        self.ports.add(port)
        info = self.get(port, "/_checkpoint_fixture/info")
        self.assertEqual(os.path.normcase(str(Path(info["fixture"]))), os.path.normcase(str(self.case)))
        self.track_process(info)
        return info

    def track_candidate(self, trial):
        proof = self.candidate_command(trial, "proof", {"nonce": str(uuid.uuid4())})
        self.assertTrue(proof["nonserving"])
        self.assertEqual(proof["profiles"], [])
        self.assertEqual(proof["role"], "candidate")
        self.assertIsNone(trial["temporary"])
        self.assertEqual(proof["health"]["console"], [])
        self.assertEqual([row for row in self.owned_network_rows() if row[0] == proof["pid"]], [])
        self.assertEqual(self.socket_violations, [])
        info = {**proof["health"], "pid": proof["pid"], "status": proof["identity"],
                "configuration": proof["identity"]["configuration"], "nativeTVA": proof["nativeTVA"]}
        self.track_process(info)
        return info

    def track_process(self, info):
        self.assertNotEqual(info["pid"], self.ready["pid"])
        k = ctypes.WinDLL("kernel32", use_last_error=True)
        k.OpenProcess.argtypes = [ctypes.c_ulong, ctypes.c_int, ctypes.c_ulong]
        k.OpenProcess.restype = ctypes.c_void_p
        if info["pid"] not in self.child_handles:
            handle = k.OpenProcess(0x00100401, 0, info["pid"])
            self.assertTrue(handle)
            self.child_handles[info["pid"]] = handle
        if self.controller_job:
            in_controller_job = ctypes.wintypes.BOOL()
            win_check(job_api.IsProcessInJob(self.child_handles[info["pid"]],
                self.controller_job, ctypes.byref(in_controller_job)))
            self.assertFalse(in_controller_job.value, "Native SWI candidate must break away from the owned job")

    def test_native_trial_busy_cancel_takeover_and_repeat_save(self):
        catalog = self.api("catalog")
        self.request(self.primary, "/_checkpoint_fixture/busy", {"busy": True})
        busy = self.operation(self.api("create", {
            "name": "Busy is not discarded", "generation": catalog["generation"], "revision": catalog["revision"]}))
        self.assertEqual(busy["phase"], "failed")
        self.request(self.primary, "/_checkpoint_fixture/busy", {"busy": False})
        self.assertEqual(self.api("catalog")["items"], [])
        ui = subprocess.run(
            ["node", str(APP / "tests" / "checkpoint_application_ui.mjs"),
             f"http://127.0.0.1:{self.primary}{self.base}", str(self.owner.pid),
             str(APP / "tests") if os.environ.get("LOGOS_SCREENSHOTS") else ""],
            env=self.env, cwd=APP, capture_output=True, text=True, timeout=210)
        self.assertEqual(ui.returncode, 0, ui.stdout + ui.stderr)
        print(ui.stdout.strip())
        completed = self.api("catalog")
        self.assertEqual(len(completed["items"]), 1)
        self.assertEqual(completed["selected"], "none")
        self.assertEqual(completed["runs"], [])
        state = completed["items"][0]
        self.assertTrue(state["validated"])
        current = self.api("catalog")
        self.api("select", {"id": state["id"], "revision": current["revision"]})
        self.assertIsNone(self.owner.poll())
        packs_file = Path(self.env["POWDER_SOURCE_PACKS"])
        original_packs = packs_file.read_bytes()
        try:
            packs_file.write_bytes(original_packs + b"\n")
            drifted = self.operation(self.api("try", {"id": state["id"], "generation": state["generation"]}))
            self.assertEqual(drifted["phase"], "failed")
            self.assertEqual(drifted["result"]["error"]["code"], "conflict")
            self.assertEqual(self.api("catalog")["runs"], [])
        finally:
            packs_file.write_bytes(original_packs)
        for source in self.ready["sources"]:
            Path(source).unlink()
        for cache in self.ready["caches"]:
            Path(cache).unlink(missing_ok=True)
        tried = self.operation(self.api("try", {"id": state["id"], "generation": state["generation"]}))
        trial = tried["result"]
        self.assertEqual(trial["phase"], "trial_ready", trial)
        candidate = self.track_candidate(trial)
        self.assertEqual(candidate["status"]["counts"], self.baseline["counts"])
        self.assertEqual(candidate["nativeTVA"], self.info["nativeTVA"])
        self.assertEqual(candidate["configuration"]["sourcePacks"],
                         self.info["configuration"]["sourcePacks"]["packs"])
        self.assertFalse(candidate["debug"]["enabled"])
        self.assertEqual(candidate["runtime"]["debug"], self.info["debug"])
        self.assertTrue(candidate["tty"], "Native launch must create fresh console stdin")
        self.assertEqual(candidate["console"], [])
        query = self.candidate_command(trial, "query",
                             {"query": "(grandparent ?X ?Y)", "mt": "x_OneMt", "limit": 5, "timeout": 2})
        self.assertEqual(len(query["solutions"]), 1)
        self.assertEqual(self.socket_violations, [])
        original = self.get(self.primary, "/_checkpoint_fixture/info")
        self.assertEqual(original["pid"], self.ready["pid"])
        self.assertEqual(original["credentialHash"], self.info["credentialHash"])
        cancelled = self.api("cancel", {"kind": "trial", "id": trial["id"]})
        self.assertEqual(cancelled["phase"], "cancelled")
        self.assertIsNone(self.owner.poll())
        tried = self.operation(self.api("try", {"id": state["id"], "generation": state["generation"]}))
        trial = tried["result"]
        self.assertEqual(trial["phase"], "trial_ready", trial)
        candidate = self.track_candidate(trial)
        marker = self.case / "reject-candidate-bind"
        marker.write_text("test-owned bind failure", encoding="utf-8")
        self.promoting_pids.add(candidate["pid"])
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
        restored_owner = self.get(self.primary, "/_checkpoint_fixture/info")
        self.assertEqual(restored_owner["debug"], self.info["debug"])
        self.assertNotEqual(restored_owner["credentialHash"], self.info["credentialHash"])
        marker.unlink()
        tried = self.operation(self.api("try", {"id": state["id"], "generation": state["generation"]}))
        trial = tried["result"]
        self.assertEqual(trial["phase"], "trial_ready", trial)
        candidate = self.track_candidate(trial)
        self.promoting_pids.add(candidate["pid"])
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
        self.assertIsNotNone(promoted["credentialHash"])
        self.assertNotEqual(promoted["credentialHash"], restored_owner["credentialHash"])
        self.owner.wait(timeout=15)
        self.assertEqual(self.owner.returncode, 0)
        win_check(job_api.CloseHandle(self.controller_job))
        self.controller_job = None
        self.assertEqual(job_api.WaitForSingleObject(self.child_handles[candidate["pid"]], 0), 258)
        self.assertEqual(self.get(self.primary, "/_checkpoint_fixture/info")["pid"], candidate["pid"])
        (self.case / "native-tva.pl").unlink()
        (self.case / "settings.json").unlink()
        (self.case / "source-packs.json").unlink()
        restored_config = self.api("configuration")
        self.assertEqual(restored_config["settings"]["startupFiles"],
                         self.info["configuration"]["settings"]["startupFiles"])
        self.assertEqual(restored_config["sourcePacks"]["packs"],
                         self.info["configuration"]["sourcePacks"]["packs"])
        catalog = self.api("catalog")
        again = self.operation(self.api("create", {
            "name": "Saved again after native takeover", "generation": catalog["generation"],
            "revision": catalog["revision"]}))
        self.assertEqual(again["phase"], "completed", again)
        self.assertEqual(again["result"]["counts"], state["counts"])
        self.assertEqual(again["result"]["configuration"]["nativeTVA"], state["configuration"]["nativeTVA"])
        self.assertEqual(again["result"]["configuration"]["sourcePacks"],
                         state["configuration"]["sourcePacks"])
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
            ["swipl", "-q", "-f", "none", str(self.app / "app.pl"),
             "--", f"--port={resumed_port}", "--debug-off"],
            cwd=self.root, env=self.env, stdin=subprocess.DEVNULL, stdout=self.log,
            stderr=self.log, close_fds=True)
        self.ports.add(resumed_port)
        deadline = time.monotonic() + 40
        while time.monotonic() < deadline:
            try:
                resumed = self.track_serving(resumed_port)
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
        self.assertEqual(resumed["configuration"]["settings"]["startupFiles"],
                         self.info["configuration"]["settings"]["startupFiles"])
        self.assertEqual(resumed["configuration"]["sourcePacks"]["packs"],
                         self.info["configuration"]["sourcePacks"]["packs"])
        self.assertFalse(resumed["debug"]["enabled"])
        self.assertIsNone(resumed["credentialHash"])
        self.assertEqual(self.get(self.extra, "/_checkpoint_fixture/info")["pid"], resumed["pid"])
        self.assertEqual(self.socket_violations, [])

    def tearDown(self):
        if hasattr(self, "monitor_stop"):
            self.monitor_stop.set()
        if hasattr(self, "monitor"):
            self.monitor.join(timeout=5)
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
        if getattr(self, "controller_job", None):
            job_api.CloseHandle(self.controller_job)
            self.controller_job = None
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
            for attempt in range(10):
                try:
                    shutil.rmtree(self.root)
                    break
                except PermissionError:
                    if attempt == 9:
                        raise
                    time.sleep(.5)


if __name__ == "__main__":
    unittest.main(verbosity=2)
