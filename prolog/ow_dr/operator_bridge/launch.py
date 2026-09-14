"""Explicit user-invoked launcher; never imported by Prolog or normal app startup."""
from __future__ import annotations

import os
import subprocess
import sys
from pathlib import Path


def main() -> None:
    if "--pairing-stdin" in sys.argv[1:]:
        raise SystemExit("Private-stdin pairing requires a trusted direct launcher with an explicit pipe; never forward a console handle.")
    root = Path(__file__).resolve().parents[3]
    command = [sys.executable, "-m", "prolog.ow_dr.operator_bridge", *sys.argv[1:]]
    options = {"cwd": root, "close_fds": True}
    if os.name == "nt":
        options["creationflags"] = subprocess.CREATE_NEW_CONSOLE | subprocess.CREATE_BREAKAWAY_FROM_JOB
    else:
        raise SystemExit("Launch manually in an independent terminal; this launcher currently supports Windows only.")
    try:
        process = subprocess.Popen(command, **options)
    except OSError as error:
        raise SystemExit(f"Independent launch failed ({error.winerror}); no inherited-job fallback was attempted.") from None
    if any(arg == "--pairing-file" or arg.startswith("--pairing-file=") for arg in sys.argv[1:]):
        print(f"Created owned bridge process {process.pid} with explicit private-file pairing. Verify readiness separately; no credential is printed.")
    else:
        print(f"Created owned bridge process {process.pid}. Pair using its new console; no credential is printed.")


if __name__ == "__main__":
    main()
