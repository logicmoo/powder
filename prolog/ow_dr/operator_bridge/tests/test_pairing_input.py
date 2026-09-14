import io
import os
import subprocess
import sys
import unittest
import warnings
from contextlib import ExitStack
from pathlib import Path
from types import SimpleNamespace
from unittest.mock import patch

from ..__main__ import main, read_pairing_phrase
from ..security import Auth
from ..workspace import BridgeError


class PairingInputTests(unittest.TestCase):
    @unittest.skipUnless(os.name == "nt", "Windows independent launcher")
    def test_trusted_local_launcher_forwards_mode_without_pairing_instructions(self):
        from ..launch import main as launch
        with patch.object(sys, "argv", ["launch", "--trusted-local"]):
            with patch("subprocess.Popen", return_value=SimpleNamespace(pid=424242)) as process:
                with patch("sys.stdout", new_callable=io.StringIO) as output:
                    launch()
                self.assertIn("--trusted-local", process.call_args.args[0])
                self.assertIn("trusted-local", output.getvalue())
                self.assertNotIn("Pair using", output.getvalue())
                self.assertTrue(process.call_args.kwargs["close_fds"])

    def test_trusted_local_is_explicit_and_not_a_phrase_bypass(self):
        with self.assertRaises(BridgeError):
            Auth()
        with self.assertRaises(BridgeError):
            Auth("synthetic fixture phrase", trusted_local=True)
        local = Auth(trusted_local=True)
        with self.assertRaises(BridgeError):
            local.login("")
        self.assertTrue(local.require(local.local_login()))
        with self.assertRaises(BridgeError):
            Auth("synthetic fixture phrase").local_login()

    def test_trusted_local_cli_never_reads_phrase_or_repairs_existing_state(self):
        prefix = "prolog.ow_dr.operator_bridge."
        with ExitStack() as stack:
            stack.enter_context(patch.object(sys, "argv", ["bridge", "--trusted-local", "--offline"]))
            stack.enter_context(patch("pathlib.Path.exists", return_value=True))
            stack.enter_context(patch(prefix + "workspace.Workspace.inspect",
                return_value=SimpleNamespace(root=str(Path(__file__).resolve().parents[4]))))
            mocks = {name: stack.enter_context(patch(prefix + name)) for name in (
                "security.check_private_directory", "security.private_directory", "security.InstanceLock",
                "pairing_file.read_pairing_file", "__main__.read_pairing_phrase", "journal.Journal",
                "adapter.configured_adapter", "service.OperatorService", "hub.OperatorHub", "server.create_app")}
            start = stack.enter_context(patch("aiohttp.web.run_app"))
            output = stack.enter_context(patch("sys.stdout", new_callable=io.StringIO))
            main()
            mocks["pairing_file.read_pairing_file"].assert_not_called()
            mocks["__main__.read_pairing_phrase"].assert_not_called()
            mocks["security.private_directory"].assert_not_called()
            mocks["security.check_private_directory"].assert_called_once()
            self.assertTrue(mocks["server.create_app"].call_args.args[1].trusted_local)
            self.assertEqual(start.call_args.kwargs["host"], "127.0.0.1")
            self.assertIn("trusted-local", output.getvalue())
            for call in mocks["journal.Journal"].call_args_list:
                self.assertIn(call.args[0].name, ("operator.sqlite3", "codex.sqlite3"))

    def test_trusted_local_cannot_be_combined_with_secret_input(self):
        for option in (["--pairing-stdin"], ["--pairing-file", "never-read-this-file"]):
            with patch.object(sys, "argv", ["bridge", "--trusted-local", *option]):
                with patch("sys.stderr", new_callable=io.StringIO), self.assertRaises(SystemExit) as error:
                    main()
                self.assertEqual(error.exception.code, 2)

    def test_private_utf8_pipe_preserves_phrase_without_printing(self):
        phrase = " synthetic pairing phrase \u03bb "
        with patch("sys.stdout", new_callable=io.StringIO) as output:
            with patch("sys.stderr", new_callable=io.StringIO) as errors:
                self.assertEqual(read_pairing_phrase(from_stdin=True,
                    stream=io.BytesIO((phrase + "\r\n").encode("utf-8"))), phrase)
                self.assertEqual(output.getvalue() + errors.getvalue(), "")

    def test_missing_unbounded_invalid_and_short_pipe_input_fail_closed(self):
        for data in (b"", b"short\n", b"x" * 4097 + b"\n", b"x" * 16,
                     b"x" * 1025 + b"\n", b"\xff" * 16 + b"\n"):
            with self.subTest(size=len(data)), self.assertRaises(ValueError) as caught:
                read_pairing_phrase(from_stdin=True, stream=io.BytesIO(data))
            self.assertNotIn(repr(data), str(caught.exception))

    def test_tty_cannot_be_used_as_echoing_stdin_pairing(self):
        stream = io.BytesIO(b"synthetic fixture phrase\n")
        with patch.object(stream, "isatty", return_value=True), self.assertRaises(ValueError):
            read_pairing_phrase(from_stdin=True, stream=stream)

    def test_getpass_fallback_never_echoes_a_phrase(self):
        import getpass
        def fallback(_prompt):
            warnings.warn("echo fallback", getpass.GetPassWarning)
            self.fail("Fallback must stop before input is echoed")
        with patch("getpass.getpass", side_effect=fallback), self.assertRaises(ValueError):
            read_pairing_phrase()

    def test_actual_inherited_pipe_is_accepted_without_echo(self):
        result = subprocess.run([sys.executable, "-c",
            "from prolog.ow_dr.operator_bridge.__main__ import read_pairing_phrase; "
            "value=read_pairing_phrase(from_stdin=True); print(len(value)==24)"],
            input=b"synthetic fixture phrase\n", capture_output=True, timeout=10)
        self.assertEqual(result.returncode, 0, result.stderr.decode())
        self.assertEqual(result.stdout, b"True\r\n" if sys.platform == "win32" else b"True\n")
        self.assertEqual(result.stderr, b"")

    def test_redirected_regular_file_is_not_a_secret_pipe(self):
        with open(__file__, "rb") as source:
            result = subprocess.run([sys.executable, "-c",
                "from prolog.ow_dr.operator_bridge.__main__ import read_pairing_phrase; "
                "read_pairing_phrase(from_stdin=True)"],
                stdin=source, capture_output=True, timeout=10)
        self.assertNotEqual(result.returncode, 0)
        self.assertIn(b"inherited pipe only", result.stderr)
        self.assertEqual(result.stdout, b"")

    def test_invalid_host_port_environment_fails_before_pairing_or_startup(self):
        for value in ("80", "65536", "not-a-port"):
            with self.subTest(port=value), patch.dict(os.environ, {"POWDER_OPERATOR_PORT": value}):
                with patch.object(sys, "argv", ["bridge"]), patch("sys.stderr", new_callable=io.StringIO):
                    with patch("getpass.getpass") as prompt, self.assertRaises(SystemExit) as caught:
                        main()
                    self.assertEqual(caught.exception.code, 2)
                    prompt.assert_not_called()


if __name__ == "__main__":
    unittest.main()
