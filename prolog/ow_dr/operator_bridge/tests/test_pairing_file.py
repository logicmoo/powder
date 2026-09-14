import io
import os
import subprocess
import sys
import unittest
import uuid
from pathlib import Path
from types import SimpleNamespace
from unittest.mock import patch

from ..__main__ import main
from ..embed import EmbedAuth
from ..pairing_file import read_pairing_file
from ..security import Auth, InstanceLock, private_directory, check_private_directory
from ..workspace import BridgeError
from .support import remove


@unittest.skipUnless(os.name == "nt", "Native Windows ACL/file-handle contract")
class PairingFileTests(unittest.TestCase):
    def setUp(self):
        self.directory = Path(__file__).parent / ".artifacts" / str(uuid.uuid4())
        self.directory.mkdir(parents=True)
        self.root = private_directory(self.directory / ".state")
        self.path = self.root / "pairing.txt"
        self.phrase = "synthetic owner private pairing phrase"
        self.path.write_text(self.phrase + "\n", encoding="utf-8")
        self.scope = patch("prolog.ow_dr.operator_bridge.pairing_file.STATE_ROOT", self.root)
        self.scope.start()

    def tearDown(self):
        self.scope.stop()
        remove(self.directory)

    def test_native_private_file_reads_without_output_or_mutation(self):
        before = self.path.read_bytes()
        with patch("sys.stdout", new_callable=io.StringIO) as output:
            with patch("sys.stderr", new_callable=io.StringIO) as error:
                self.assertEqual(read_pairing_file(self.path), self.phrase)
                self.assertEqual(output.getvalue() + error.getvalue(), "")
        self.assertEqual(self.path.read_bytes(), before)
        auth = Auth(read_pairing_file(self.path))
        embedded = EmbedAuth(auth)
        token = embedded.login(self.phrase, "copilot")
        self.assertTrue(embedded.require(token, "copilot"))
        self.assertEqual(auth.sessions, {}, "File phrase does not create a standalone cookie session.")

    def test_trusted_local_state_validation_never_reads_pairing_files_or_repairs_acl(self):
        with patch("prolog.ow_dr.operator_bridge.pairing_file._WindowsFiles.read") as read:
            with patch("prolog.ow_dr.operator_bridge.security.private_directory") as repair:
                check_private_directory(self.root)
                read.assert_not_called()
                repair.assert_not_called()
        self.assertEqual(self.path.read_text(encoding="utf-8"), self.phrase + "\n")

    def test_existing_native_owner_is_preserved(self):
        before = self.path.read_bytes()
        owner = InstanceLock(self.root)
        try:
            self.assertEqual(read_pairing_file(self.path), self.phrase)
            with self.assertRaises(BridgeError):
                InstanceLock(self.root)
            self.assertEqual(self.path.read_bytes(), before)
        finally:
            owner.close()

    def test_busy_file_startup_does_not_repair_acl_or_open_journals(self):
        workspace = SimpleNamespace(root=str(Path(__file__).resolve().parents[4]))
        with patch.object(sys, "argv", ["bridge", "--pairing-file", str(self.path)]):
            with patch("prolog.ow_dr.operator_bridge.workspace.Workspace.inspect", return_value=workspace):
                with patch("prolog.ow_dr.operator_bridge.security.private_directory") as repair:
                    with patch("prolog.ow_dr.operator_bridge.security.InstanceLock",
                               side_effect=BridgeError("bridge_busy", "Existing owner.")):
                        with patch("prolog.ow_dr.operator_bridge.journal.Journal") as journal:
                            with self.assertRaises(BridgeError):
                                main()
                            repair.assert_not_called()
                            journal.assert_not_called()

    def test_outside_missing_directory_stream_and_parent_paths_rejected(self):
        for path in (self.directory / "elsewhere.txt", self.root / "missing",
                     self.root, Path(str(self.path) + ":stream"),
                     self.root / "child" / ".." / "pairing.txt"):
            with self.subTest(path=str(path)), self.assertRaises(BridgeError):
                read_pairing_file(path)

    def test_broad_file_acl_is_rejected_without_repair(self):
        result = subprocess.run(["icacls", str(self.path), "/grant", "*S-1-1-0:(R)"],
                                capture_output=True, timeout=10)
        self.assertEqual(result.returncode, 0, result.stderr.decode(errors="replace"))
        with self.assertRaises(BridgeError):
            read_pairing_file(self.path)
        result = subprocess.run(["icacls", str(self.path)], capture_output=True, timeout=10)
        self.assertIn(b"(R)", result.stdout)
        self.assertEqual(self.path.read_text(encoding="utf-8").rstrip("\n"), self.phrase)

    def test_broad_parent_acl_is_rejected_without_repair(self):
        result = subprocess.run(["icacls", str(self.root), "/grant", "*S-1-1-0:(R)"],
                                capture_output=True, timeout=10)
        self.assertEqual(result.returncode, 0)
        with self.assertRaises(BridgeError):
            read_pairing_file(self.path)

    def test_hardlinked_secret_is_rejected(self):
        linked = self.root / "alias.txt"
        os.link(self.path, linked)
        with self.assertRaises(BridgeError):
            read_pairing_file(linked)

    def test_directory_junction_is_rejected(self):
        target = private_directory(self.root / "target")
        nested = target / "pairing.txt"
        nested.write_text(self.phrase, encoding="utf-8")
        junction = self.root / "junction"
        result = subprocess.run([os.environ["ComSpec"], "/c", "mklink", "/J",
                                 str(junction), str(target)], capture_output=True, timeout=10)
        self.assertEqual(result.returncode, 0, result.stderr.decode(errors="replace"))
        try:
            with self.assertRaises(BridgeError):
                read_pairing_file(junction / "pairing.txt")
        finally:
            junction.rmdir()
        self.assertEqual(nested.read_text(encoding="utf-8"), self.phrase)

    def test_invalid_contents_fail_without_echo(self):
        for content in (b"short", b"\xff" * 30, b"x" * 5000,
                        b"synthetic phrase line\nextra", b"synthetic\x00phrase value"):
            self.path.write_bytes(content)
            with self.assertRaises(BridgeError) as caught:
                read_pairing_file(self.path)
            self.assertEqual(caught.exception.code, "unsafe_pairing_file")
            self.assertNotIn(repr(content), caught.exception.message)

    def test_pairing_options_are_mutually_exclusive_before_any_start(self):
        result = subprocess.run([sys.executable, "-m", "prolog.ow_dr.operator_bridge",
            "--pairing-stdin", "--pairing-file", str(self.path)],
            capture_output=True, timeout=10)
        self.assertEqual(result.returncode, 2)
        self.assertNotIn(self.phrase.encode(), result.stdout + result.stderr)


if __name__ == "__main__":
    unittest.main()
