"""Isolated Windows ConPTY checks; --measure reports idle wall/CPU seconds.

No installed packages. Never attaches to the caller's console. Native tests
exercise both an ETX key through ConPTY and GenerateConsoleCtrlEvent, not a
Prolog thread_signal substitute. Every console has its own kill-on-close job.
"""

import ctypes as c
from ctypes import wintypes as w
import base64
import json
from pathlib import Path
import shutil
import os
import re
import subprocess
import sys
import threading
import time
import unittest
import uuid


if sys.platform == "win32":
    k = c.WinDLL("kernel32", use_last_error=True)

    class COORD(c.Structure):
        _fields_ = [("X", c.c_short), ("Y", c.c_short)]

    class STARTUPINFO(c.Structure):
        _fields_ = [
            ("cb", w.DWORD), ("lpReserved", w.LPWSTR), ("lpDesktop", w.LPWSTR),
            ("lpTitle", w.LPWSTR), ("dwX", w.DWORD), ("dwY", w.DWORD),
            ("dwXSize", w.DWORD), ("dwYSize", w.DWORD),
            ("dwXCountChars", w.DWORD), ("dwYCountChars", w.DWORD),
            ("dwFillAttribute", w.DWORD), ("dwFlags", w.DWORD),
            ("wShowWindow", w.WORD), ("cbReserved2", w.WORD),
            ("lpReserved2", c.POINTER(w.BYTE)), ("hStdInput", w.HANDLE),
            ("hStdOutput", w.HANDLE), ("hStdError", w.HANDLE),
        ]

    class STARTUPINFOEX(c.Structure):
        _fields_ = [("StartupInfo", STARTUPINFO), ("lpAttributeList", c.c_void_p)]

    class PROCESS_INFORMATION(c.Structure):
        _fields_ = [("hProcess", w.HANDLE), ("hThread", w.HANDLE),
                    ("dwProcessId", w.DWORD), ("dwThreadId", w.DWORD)]

    class JOB_LIMIT(c.Structure):
        _fields_ = [
            ("processTime", c.c_int64), ("jobTime", c.c_int64), ("flags", w.DWORD),
            ("minSet", c.c_size_t), ("maxSet", c.c_size_t), ("processes", w.DWORD),
            ("affinity", c.c_size_t), ("priority", w.DWORD), ("scheduling", w.DWORD),
            ("io", c.c_uint64 * 6), ("memory", c.c_size_t * 4),
        ]

    def api(name, args, result):
        fn = getattr(k, name)
        fn.argtypes, fn.restype = args, result
        return fn

    api("CreatePipe", [c.POINTER(w.HANDLE), c.POINTER(w.HANDLE), c.c_void_p, w.DWORD], w.BOOL)
    api("CreatePseudoConsole", [COORD, w.HANDLE, w.HANDLE, w.DWORD, c.POINTER(w.HANDLE)], c.c_long)
    api("ClosePseudoConsole", [w.HANDLE], None)
    api("InitializeProcThreadAttributeList", [c.c_void_p, w.DWORD, w.DWORD, c.POINTER(c.c_size_t)], w.BOOL)
    api("UpdateProcThreadAttribute", [c.c_void_p, w.DWORD, c.c_size_t, c.c_void_p,
                                      c.c_size_t, c.c_void_p, c.c_void_p], w.BOOL)
    api("DeleteProcThreadAttributeList", [c.c_void_p], None)
    api("CreateProcessW", [w.LPCWSTR, w.LPWSTR, c.c_void_p, c.c_void_p, w.BOOL,
                           w.DWORD, c.c_void_p, w.LPCWSTR, c.POINTER(STARTUPINFOEX),
                           c.POINTER(PROCESS_INFORMATION)], w.BOOL)
    api("ReadFile", [w.HANDLE, c.c_void_p, w.DWORD, c.POINTER(w.DWORD), c.c_void_p], w.BOOL)
    api("WriteFile", [w.HANDLE, c.c_void_p, w.DWORD, c.POINTER(w.DWORD), c.c_void_p], w.BOOL)
    api("WaitForSingleObject", [w.HANDLE, w.DWORD], w.DWORD)
    api("GetExitCodeProcess", [w.HANDLE, c.POINTER(w.DWORD)], w.BOOL)
    api("TerminateProcess", [w.HANDLE, w.UINT], w.BOOL)
    api("CloseHandle", [w.HANDLE], w.BOOL)
    api("CreateFileW", [w.LPCWSTR, w.DWORD, w.DWORD, c.c_void_p, w.DWORD, w.DWORD, w.HANDLE], w.HANDLE)
    api("GetConsoleMode", [w.HANDLE, c.POINTER(w.DWORD)], w.BOOL)
    api("SetConsoleCtrlHandler", [c.c_void_p, w.BOOL], w.BOOL)
    api("FreeConsole", [], w.BOOL)
    api("AttachConsole", [w.DWORD], w.BOOL)
    api("GenerateConsoleCtrlEvent", [w.DWORD, w.DWORD], w.BOOL)
    api("CreateJobObjectW", [c.c_void_p, w.LPCWSTR], w.HANDLE)
    api("SetInformationJobObject", [w.HANDLE, c.c_int, c.c_void_p, w.DWORD], w.BOOL)
    api("AssignProcessToJobObject", [w.HANDLE, w.HANDLE], w.BOOL)
    api("ResumeThread", [w.HANDLE], w.DWORD)
    api("SetHandleInformation", [w.HANDLE, w.DWORD, w.DWORD], w.BOOL)
    api("CreateEventW", [c.c_void_p, w.BOOL, w.BOOL, w.LPCWSTR], w.HANDLE)
    api("OpenEventW", [w.DWORD, w.BOOL, w.LPCWSTR], w.HANDLE)
    api("SetEvent", [w.HANDLE], w.BOOL)


def check(ok):
    if not ok:
        raise c.WinError(c.get_last_error())


class Console:
    def __init__(self, args, closed_input=False):
        self.output = bytearray()
        self.changed = threading.Condition()
        self.handles = []
        self.console = w.HANDLE()
        self.process = PROCESS_INFORMATION()
        self.attrs = None
        self.reader = None
        self.job = None
        self.ready_event = None
        try:
            in_r, self.input = self.pipe()
            self.out, out_w = self.pipe()
            result = k.CreatePseudoConsole(COORD(120, 40), in_r, out_w, 0, c.byref(self.console))
            if result:
                raise OSError(f"CreatePseudoConsole HRESULT={result:#x}")
            size = c.c_size_t()
            k.InitializeProcThreadAttributeList(None, 1, 0, c.byref(size))
            self.attrs = c.create_string_buffer(size.value)
            check(k.InitializeProcThreadAttributeList(self.attrs, 1, 0, c.byref(size)))
            check(k.UpdateProcThreadAttribute(self.attrs, 0, 0x20016, self.console,
                                               c.sizeof(w.HANDLE), None, None))
            startup = STARTUPINFOEX()
            startup.StartupInfo.cb = c.sizeof(startup)
            startup.lpAttributeList = c.cast(self.attrs, c.c_void_p)
            # Start a host inside THIS ConPTY to obtain read/write console
            # handles. Inheriting the tool host's redirected handles is wrong.
            event_name = "Local\\powder-lifecycle-test-" + uuid.uuid4().hex
            self.ready_event = k.CreateEventW(None, True, False, event_name)
            check(self.ready_event)
            payload = {"args": args, "closed_input": closed_input, "ready_event": event_name}
            encoded = base64.b64encode(json.dumps(payload).encode()).decode()
            launch = [sys.executable, str(Path(__file__).resolve()), "--host", encoded]
            command = c.create_unicode_buffer(subprocess.list2cmdline(launch))
            self.job = k.CreateJobObjectW(None, None)
            check(self.job)
            limits = JOB_LIMIT()
            limits.flags = 0x2000  # KILL_ON_JOB_CLOSE, only this test's descendants.
            check(k.SetInformationJobObject(self.job, 9, c.byref(limits), c.sizeof(limits)))
            check(k.CreateProcessW(None, command, None, None, False, 0x80004, None,
                                    str(Path(__file__).resolve().parent), c.byref(startup),
                                    c.byref(self.process)))
            check(k.AssignProcessToJobObject(self.job, self.process.hProcess))
            if k.ResumeThread(self.process.hThread) == 0xffffffff:
                check(False)
            k.CloseHandle(self.process.hThread)
            self.process.hThread = None
            for handle in (in_r, out_w):
                k.CloseHandle(handle)
                self.handles.remove(handle)
            self.reader = threading.Thread(target=self.read, daemon=True)
            self.reader.start()
        except BaseException:
            self.close()
            raise

    def pipe(self):
        read, write = w.HANDLE(), w.HANDLE()
        check(k.CreatePipe(c.byref(read), c.byref(write), None, 0))
        self.handles.extend([read, write])
        return read, write

    def read(self):
        buffer, count = c.create_string_buffer(4096), w.DWORD()
        while k.ReadFile(self.out, buffer, len(buffer), c.byref(count), None) and count.value:
            with self.changed:
                self.output.extend(buffer.raw[:count.value])
                self.changed.notify_all()

    def send(self, data):
        count = w.DWORD()
        check(k.WriteFile(self.input, data, len(data), c.byref(count), None))
        assert count.value == len(data)

    def signal_ctrl_c(self):
        subprocess.run([sys.executable, str(Path(__file__).resolve()), "--send-ctrl-c",
                        str(self.process.dwProcessId)], check=True, timeout=5)

    def wait_ready(self, timeout=8):
        if k.WaitForSingleObject(self.ready_event, int(timeout * 1000)) != 0:
            raise AssertionError(f"Console scanner did not become ready: {self.text()!r}")

    def text(self):
        with self.changed:
            return self.output.decode("utf-8", errors="replace")

    def wait(self, text, timeout=5, count=1):
        deadline = time.monotonic() + timeout
        with self.changed:
            while self.output.decode("utf-8", errors="replace").count(text) < count:
                remaining = deadline - time.monotonic()
                if remaining <= 0:
                    raise AssertionError(f"Missing {text!r} ({count} times): {self.text()!r}")
                self.changed.wait(remaining)

    def exit(self, timeout=5):
        if k.WaitForSingleObject(self.process.hProcess, int(timeout * 1000)) != 0:
            raise AssertionError(f"Child {self.process.dwProcessId} did not exit: {self.text()!r}")
        code = w.DWORD()
        check(k.GetExitCodeProcess(self.process.hProcess, c.byref(code)))
        return code.value

    def close(self):
        if self.job:
            k.CloseHandle(self.job)
            self.job = None
        if self.process.hProcess:
            if k.WaitForSingleObject(self.process.hProcess, 0) != 0:
                k.TerminateProcess(self.process.hProcess, 98)
                k.WaitForSingleObject(self.process.hProcess, 5000)
            k.CloseHandle(self.process.hProcess)
            self.process.hProcess = None
        if self.console:
            k.ClosePseudoConsole(self.console)
            self.console = w.HANDLE()
        if self.reader:
            self.reader.join(timeout=3)
        for handle in self.handles:
            k.CloseHandle(handle)
        self.handles.clear()
        if self.attrs is not None:
            k.DeleteProcThreadAttributeList(self.attrs)
            self.attrs = None
        if self.ready_event:
            k.CloseHandle(self.ready_event)
            self.ready_event = None

    def __enter__(self):
        return self

    def __exit__(self, *_):
        self.close()


@unittest.skipUnless(sys.platform == "win32", "native Windows ConPTY required")
class LifecycleWindowsTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.swipl = shutil.which("swipl")
        if not cls.swipl:
            raise unittest.SkipTest("SWI-Prolog not installed")
        cls.fixture = str(Path(__file__).with_name("lifecycle_console_child.pl").resolve())
        dll = Path(__file__).parent.parent / "kb_lifecycle_windows.dll"
        if not dll.exists():
            raise RuntimeError("Run prolog\\ow_dr\\build_lifecycle_windows.ps1 before this suite")
        if not (dll.parent / "kb_interactive_windows.dll").exists():
            raise RuntimeError("Run build_lifecycle_windows.ps1 -Interactive before this suite")

    def console(self, mode="normal", *args, closed_input=False):
        return Console([self.swipl, "-q", "-f", self.fixture, "--", mode, *args],
                       closed_input=closed_input)

    def ready(self, child):
        child.wait_ready()
        time.sleep(0.08)
        self.assertEqual(self.visible(child.text()).strip(), "")

    @staticmethod
    def visible(text):
        text = re.sub(r"\x1b\].*?(?:\x07|\x1b\\)", "", text, flags=re.S)
        return re.sub(r"\x1b\[[0-?]*[ -/]*[@-~]", "", text)

    def restored(self, child, native_prompt=False):
        child.wait("LIFECYCLE_DONE")
        self.assertEqual(child.exit(), 0)
        text = child.text()
        self.assertIn("signal=ok stream=ok", text)
        self.assertIn("native_modes=ok", text)
        self.assertNotIn("Action (h for help)", text)
        self.assertNotIn("windows_console(", text)
        self.assertNotIn("Exit powder gracefully?", text)
        self.assertNotIn("Choice:", text)
        if not native_prompt:
            self.assertNotIn("> ", text)
        return text

    def before(self, text, first, second):
        self.assertIn(first, text)
        self.assertIn(second, text)
        self.assertLess(text.index(first), text.index(second))

    def test_direct_keys_continue_threads_and_exit_without_help(self):
        with self.console() as child:
            self.ready(child)
            child.send(b"c")
            child.wait("Selected: (C) CONTINUE")
            time.sleep(0.2)
            self.assertEqual(self.visible(child.text()).strip(), "Selected: (C) CONTINUE")
            child.send(b"t")
            child.wait("ID  Alias  Status  Role/pool")
            child.send(b"x")
            text = self.restored(child)
            self.assertIn("main", text)
            self.assertNotIn("POWDER CONTROLS", text)
            self.before(text, "Selected: (T) LIST ACTIVE THREADS", "ID  Alias  Status")
            self.before(text, "Selected: (X) EXIT", "LIFECYCLE_DONE")

    def test_actual_ctrl_c_and_native_control_event(self):
        with self.console() as child:
            self.ready(child)
            child.send(b"\x03")
            child.wait("POWDER CONTROLS")
            time.sleep(0.2)
            self.assertEqual(child.text().count("POWDER CONTROLS"), 1)
            self.assertNotIn("Selected:", child.text())
            help_text = self.visible(child.text())
            time.sleep(0.15)
            self.assertEqual(self.visible(child.text()), help_text)
            child.send(b"\x03")
            child.send(b"?")
            child.signal_ctrl_c()  # real GenerateConsoleCtrlEvent, not thread_signal
            child.wait("POWDER CONTROLS", count=4)
            self.assertEqual(child.text().count("POWDER CONTROLS"), 4)
            self.assertNotIn("Selected:", child.text())
            child.send(b"C")  # deliberately NO Enter
            child.wait("Selected: (C) CONTINUE")
            child.signal_ctrl_c()
            child.wait("POWDER CONTROLS", count=5)
            child.send(b"ynze")
            time.sleep(0.15)
            self.assertEqual(child.text().count("Selected:"), 1)
            child.send(b"X")  # deliberately NO Enter
            text = self.restored(child)
            self.assertEqual(text.count("Selected:"), 2)
            self.before(text, "Selected: (X) EXIT", "LIFECYCLE_DONE")

    def test_ports_callbacks_errors_and_escape(self):
        with self.console("failing") as child:
            self.ready(child)
            child.send(b"r")
            child.wait("RESTART failed:")
            child.send(b"m")
            child.wait("MAKE failed:")
            child.send(b"b0\r")
            child.wait("Port must be 1..65535")
            child.send(b"65536\r")
            child.wait("Port must be 1..65535", count=2)
            child.send(b"1234567\r")
            child.wait("Port must be 1..65535", count=3)
            child.send(b"8x\x1b")
            child.wait("Digits only")
            child.send(b"b13\r")
            child.wait("BIND failed;")
            child.send(b"b90\x08\x08" + b"8\x03")
            child.wait("POWDER CONTROLS")
            child.send(b"b80\r")
            child.wait("CALLBACK_BIND=80")
            child.send(b"x")
            text = self.restored(child)
            self.assertEqual(text.count("CALLBACK_BIND="), 1)
            self.before(text, "Selected: (R) RESTART SERVER", "RESTART failed:")
            self.before(text, "Selected: (M) MAKE", "MAKE failed:")
            self.before(text, "Selected: (B) BIND LOOPBACK PORT", "CALLBACK_BIND=80")

    def test_restart_callback_success(self):
        with self.console() as child:
            self.ready(child)
            child.send(b"r")
            child.wait("CALLBACK_RESTART")
            child.wait("RESTART completed.")
            child.send(b"x")
            text = self.restored(child)
            self.assertEqual(text.count("CALLBACK_RESTART"), 1)
            self.assertNotIn("POWDER CONTROLS", text)
            self.before(text, "Selected: (R) RESTART SERVER", "CALLBACK_RESTART")

    def test_make_callback_acknowledged_before_live_module_reload(self):
        with self.console("reload") as child:
            self.ready(child)
            child.send(b"m")
            child.wait("CALLBACK_MAKE")
            child.wait("CALLBACK_RELOADED")
            child.wait("MAKE completed.")
            child.send(b"c")
            child.wait("Selected: (C) CONTINUE")
            child.signal_ctrl_c()
            child.wait("POWDER CONTROLS")
            child.send(b"x")
            text = self.restored(child)
            self.assertEqual(text.count("CALLBACK_MAKE"), 1)
            self.assertNotIn("powder controls:", text)
            self.before(text, "Selected: (M) MAKE", "CALLBACK_MAKE")

    def test_legacy_callback_tuple_survives_live_module_reload(self):
        with self.console("legacy") as child:
            self.ready(child)
            child.send(b"r")
            child.wait("CALLBACK_RELOADED")
            child.wait("RESTART completed.")
            child.send(b"m")
            child.wait("MAKE unavailable:")
            child.send(b"b80\r")
            child.wait("CALLBACK_BIND=80")
            child.send(b"x")
            text = self.restored(child)
            self.assertNotIn("POWDER CONTROLS", text)

    def test_native_prolog_shares_live_database_and_returns_twice(self):
        with self.console() as child:
            self.ready(child)
            child.send(b"p")
            child.wait("HANDOFF_prolog_begin")
            child.wait("?- ")
            child.send(b"assertz(user:lifecycle_live_probe(shared)).\r")
            child.wait("true.")
            child.send(b"end_of_file.\r")
            child.wait("LIVE_KB_STATE_PRESERVED")
            child.wait("PROLOG completed.")
            time.sleep(0.12)
            quiet = self.visible(child.text())
            time.sleep(0.15)
            self.assertEqual(self.visible(child.text()), quiet)
            child.send(b"P")
            child.wait("HANDOFF_prolog_begin", count=2)
            child.wait("?- ", count=3)
            child.send(b"once(user:lifecycle_live_probe(shared)).\r")
            child.wait("true.", count=2)
            child.send(b"end_of_file.\r")
            child.wait("PROLOG completed.", count=2)
            child.signal_ctrl_c()
            child.wait("POWDER CONTROLS")
            child.send(b"x")
            text = self.restored(child, native_prompt=True)
            pids = re.findall(r"HANDOFF_prolog_begin MODE=\d+ PID=(\d+)", text)
            self.assertEqual(len(pids), 2)
            self.assertEqual(pids[0], pids[1])
            self.before(text, "Selected: (P) PROLOG", "HANDOFF_prolog_begin")

    def test_same_console_shell_and_ctrl_c_then_quiet_scanner(self):
        with self.console() as child:
            self.ready(child)
            child.send(b"s")
            child.wait("HANDOFF_shell_begin")
            child.wait("Microsoft Windows")
            child.send(b"echo SHELL_TEST_MARKER\r")
            child.wait("SHELL_TEST_MARKER", count=2)
            child.signal_ctrl_c()
            self.assertNotIn("POWDER CONTROLS", child.text())
            self.assertNotIn("SHELL completed.", child.text())
            child.send(b"exit\r")
            child.wait("HANDOFF_shell_return")
            child.wait("SHELL completed.")
            time.sleep(0.12)
            quiet = self.visible(child.text())
            time.sleep(0.15)
            self.assertEqual(self.visible(child.text()), quiet)
            child.send(b"c")
            child.wait("Selected: (C) CONTINUE")
            child.signal_ctrl_c()
            child.wait("POWDER CONTROLS")
            child.send(b"x")
            text = self.restored(child, native_prompt=True)
            self.before(text, "Selected: (S) SHELL", "HANDOFF_shell_begin")

    def test_handoff_failure_and_exception_restore_the_scanner(self):
        with self.console("handoff_failure") as child:
            self.ready(child)
            child.send(b"p")
            child.wait("HANDOFF_prolog_failure")
            child.wait("PROLOG failed:")
            child.send(b"s")
            child.wait("HANDOFF_shell_failure")
            child.wait("SHELL failed;")
            child.send(b"c")
            child.wait("Selected: (C) CONTINUE")
            child.send(b"x")
            self.restored(child)

    def test_stop_is_deferred_until_native_handoff_returns(self):
        for key, prompt, leave in [(b"p", "?- ", b"end_of_file.\r"),
                                    (b"s", "Microsoft Windows", b"exit\r")]:
            with self.subTest(key=key), self.console("interactive_stop", "0.8") as child:
                self.ready(child)
                child.send(key)
                child.wait(prompt)
                time.sleep(1)
                self.assertNotIn("LIFECYCLE_DONE", child.text())
                child.send(leave)
                text = self.restored(child, native_prompt=True)
                self.assertNotIn("Selected: (X) EXIT", text)

    def test_unknown_idle_keys_and_timeouts_are_silent(self):
        with self.console() as child:
            self.ready(child)
            time.sleep(0.15)
            before = child.text()
            child.send(b"yezn123 \r\n\x1b")
            time.sleep(0.25)
            self.assertEqual(child.text(), before)
            child.send(b"m")
            child.wait("CALLBACK_MAKE")
            child.send(b"x")
            self.restored(child)

    def test_stop_responsive_in_all_input_states(self):
        for label, keys in [("idle", b""), ("after_help", b"?"),
                            ("port", b"b80"), ("after_ctrl_c_help", b"\x03")]:
            with self.subTest(state=label), self.console("auto", "0.55") as child:
                self.ready(child)
                start = time.monotonic()
                if keys:
                    child.send(keys)
                text = self.restored(child)
                self.assertLess(time.monotonic() - start, 1.5)
                match = re.search(r"WALL=([\d.]+) CPU=([\d.]+)", text)
                self.assertIsNotNone(match)
                wall, cpu = map(float, match.groups())
                self.assertGreaterEqual(wall, 0.5)
                self.assertLess(cpu, 0.15)  # blocked native wait, not a CPU loop

    def test_timeout_and_output_exception_restore_everything(self):
        for mode in ("timeout", "fault"):
            with self.subTest(mode=mode), self.console(mode) as child:
                self.restored(child)

    def test_closed_console_input_waits_for_stop(self):
        with self.console("auto", "0.3", closed_input=True) as child:
            self.ready(child)
            text = self.restored(child)
            self.assertNotIn("no interactive console", text)

    def test_redirected_eof_and_closed_input_do_not_exit_early(self):
        for mode in ("auto", "closed"):
            with self.subTest(mode=mode):
                result = subprocess.run(
                    [self.swipl, "-q", "-f", self.fixture, "--", mode, "0.3"],
                    input=b"", stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=5)
                text = result.stdout.decode("utf-8", errors="replace")
                self.assertEqual(result.returncode, 0, text)
                self.assertIn("LIFECYCLE_DONE", text)
                self.assertNotIn("no interactive console", text)
                self.assertTrue(text.startswith("RESTORED "), text)
                match = re.search(r"WALL=([\d.]+) CPU=([\d.]+)", text)
                wall, cpu = map(float, match.groups())
                self.assertGreaterEqual(wall, 0.25)
                self.assertLess(cpu, 0.12)


if __name__ == "__main__":
    if sys.platform != "win32":
        sys.exit("Windows ConPTY required")
    if len(sys.argv) > 1 and sys.argv[1] == "--host":
        import msvcrt
        handles = [k.CreateFileW(name, 0xc0000000, 3, None, 3, 0, None)
                   for name in ("CONIN$", "CONOUT$")]
        for handle in handles:
            if handle == w.HANDLE(-1).value:
                check(False)
        fds = [msvcrt.open_osfhandle(handle, os.O_RDWR) for handle in handles]
        try:
            payload = json.loads(base64.b64decode(sys.argv[2]))
            args = payload["args"]
            check(k.SetConsoleCtrlHandler(None, False))
            if payload["closed_input"]:
                check(k.SetHandleInformation(handles[1], 1, 1))
                startup, process = STARTUPINFOEX(), PROCESS_INFORMATION()
                startup.StartupInfo.cb = c.sizeof(STARTUPINFO)
                startup.StartupInfo.dwFlags = 0x100
                startup.StartupInfo.hStdInput = w.HANDLE(-1).value
                startup.StartupInfo.hStdOutput = handles[1]
                startup.StartupInfo.hStdError = handles[1]
                command = c.create_unicode_buffer(subprocess.list2cmdline(args))
                check(k.CreateProcessW(None, command, None, None, True, 0, None,
                                        None, c.byref(startup), c.byref(process)))
                k.CloseHandle(process.hThread)
            else:
                child = subprocess.Popen(args, stdin=fds[0], stdout=fds[1], stderr=fds[1])
            # Do not let a broadcast to this isolated console kill its host.
            # Set AFTER creation so SWI does not inherit the ignore attribute.
            check(k.SetConsoleCtrlHandler(None, True))
            # Readiness is an OS event, not text in the application console.
            # This host observes its OWN ConPTY input mode becoming raw. Only
            # the test host polls; the Prolog scanner uses its blocking wait.
            ready = k.OpenEventW(2, False, payload["ready_event"])
            check(ready)
            try:
                while True:
                    if payload["closed_input"]:
                        running = k.WaitForSingleObject(process.hProcess, 0) != 0
                    else:
                        running = child.poll() is None
                    if not running:
                        break
                    mode = w.DWORD()
                    if payload["closed_input"] or (
                        k.GetConsoleMode(handles[0], c.byref(mode)) and mode.value & 7 == 0
                    ):
                        check(k.SetEvent(ready))
                        break
                    time.sleep(0.01)
            finally:
                k.CloseHandle(ready)
            if payload["closed_input"]:
                k.WaitForSingleObject(process.hProcess, 0xffffffff)
                result = w.DWORD()
                check(k.GetExitCodeProcess(process.hProcess, c.byref(result)))
                k.CloseHandle(process.hProcess)
                sys.exit(result.value)
            else:
                sys.exit(child.wait())
        finally:
            for fd in fds:
                os.close(fd)
    elif len(sys.argv) > 1 and sys.argv[1] == "--send-ctrl-c":
        # This disposable sender attaches only to a PID created by this test.
        k.FreeConsole()
        check(k.AttachConsole(int(sys.argv[2])))
        check(k.SetConsoleCtrlHandler(None, True))
        check(k.GenerateConsoleCtrlEvent(0, 0))
        time.sleep(0.2)
        k.FreeConsole()
    elif len(sys.argv) > 1 and sys.argv[1] == "--measure":
        fixture = str(Path(__file__).with_name("lifecycle_console_child.pl").resolve())
        with Console([shutil.which("swipl"), "-q", "-f", fixture, "--", "auto", "0.55"]) as child:
            child.wait("LIFECYCLE_DONE", timeout=8)
            assert child.exit() == 0
            print(re.search(r"WALL=[\d.]+ CPU=[\d.]+", child.text()).group())
    elif len(sys.argv) > 1 and sys.argv[1] == "--probe":
        with Console([shutil.which("swipl"), "-q", "-g", sys.argv[2]]) as child:
            time.sleep(1)
            print(repr(child.text()), flush=True)
            for value in sys.argv[3:]:
                if value == "CTRL-C":
                    child.send(b"\x03")
                elif value == "OS-CTRL-C":
                    child.signal_ctrl_c()
                else:
                    child.send(value.encode("utf-8"))
                time.sleep(1)
                print(repr(child.text()), flush=True)
    else:
        unittest.main()
