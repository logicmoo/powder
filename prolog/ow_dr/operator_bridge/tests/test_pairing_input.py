import io
import os
import subprocess
import sys
import unittest
import warnings
from unittest.mock import patch

from ..__main__ import main, read_pairing_phrase


class PairingInputTests(unittest.TestCase):
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
