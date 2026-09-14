from __future__ import annotations

import argparse
import getpass
import os
import stat
import sys
import warnings
from pathlib import Path


def read_pairing_phrase(*, from_stdin: bool = False, stream=None) -> str:
    """Only a private native prompt or explicit inherited UTF-8 pipe may supply it."""
    if from_stdin:
        if stream is None:
            stream = sys.stdin.buffer
            if not stat.S_ISFIFO(os.fstat(stream.fileno()).st_mode):
                raise ValueError("Private-stdin pairing accepts an inherited pipe only, never a file or terminal.")
        if stream.isatty():
            raise ValueError("Private-stdin pairing requires a pipe, not an echoing terminal.")
        line = stream.readline(4099)
        if not line or len(line) > 4098 or not line.endswith(b"\n"):
            raise ValueError("Supply one bounded UTF-8 pairing line through the private pipe.")
        try:
            phrase = line.removesuffix(b"\n").removesuffix(b"\r").decode("utf-8")
        except UnicodeError:
            raise ValueError("Pairing input must be UTF-8.") from None
    else:
        with warnings.catch_warnings():
            warnings.simplefilter("error", getpass.GetPassWarning)
            try:
                phrase = getpass.getpass("Local bridge pairing phrase (16+ characters; NOT provider credentials): ")
            except (EOFError, OSError, getpass.GetPassWarning):
                raise ValueError("A private native console is required, or explicitly supply --pairing-stdin.") from None
    if not 16 <= len(phrase) <= 1024:
        raise ValueError("The local pairing phrase must contain 16–1024 characters.")
    return phrase


def main() -> None:
    parser = argparse.ArgumentParser(description="powder independent human operator/recovery bridge")
    parser.add_argument("--port", type=int, default=os.environ.get("POWDER_OPERATOR_PORT", "8063"))
    parser.add_argument("--parent-origin", default="http://localhost:3050",
                        help="Exact allowed main-workspace origin for isolated embedded views")
    parser.add_argument("--project-root", type=Path, default=Path(__file__).resolve().parents[3])
    parser.add_argument("--state-dir", type=Path, default=Path(__file__).with_name(".state"))
    parser.add_argument("--application-status-url", help="Optional read-only loopback Prolog status URL; no restart authority")
    parser.add_argument("--copilot-bin", help="Explicit installed native Copilot executable or official npm shim")
    parser.add_argument("--codex-bin", help="Explicit installed native Codex executable or official npm shim")
    parser.add_argument("--copilot-model", help="Optional operator-only native Copilot model identifier")
    parser.add_argument("--codex-model", help="Optional operator-only native Codex model identifier")
    parser.add_argument("--offline", action="store_true", help="Recovery view only; disable both native adapters")
    pairing = parser.add_mutually_exclusive_group()
    pairing.add_argument("--pairing-stdin", action="store_true",
                         help="Read the local phrase from an inherited private UTF-8 pipe")
    pairing.add_argument("--pairing-file", type=Path,
                         help="Explicit owner-private UTF-8 phrase file beneath operator .state (Windows ACL guarded)")
    args = parser.parse_args()
    if not 1024 <= args.port <= 65535:
        parser.error("port must be between 1024 and 65535")
    from aiohttp import web
    from .adapter import configured_adapter
    from .journal import Journal
    from .hub import OperatorHub
    from .monitor import ApplicationMonitor
    from .security import Auth, HOST, InstanceLock, private_directory
    from .server import create_app
    from .service import OperatorService
    from .workspace import Workspace
    from .workspace import BridgeError
    from .pairing_file import read_pairing_file

    workspace = Workspace.inspect(args.project_root)
    if Path(workspace.root) != Path(__file__).resolve().parents[3]:
        parser.error("this bridge belongs only to its primary project checkout")
    state_root = Path(__file__).with_name(".state").resolve()
    state = args.state_dir.resolve()
    if not state.is_relative_to(state_root):
        parser.error("state-dir must be inside operator_bridge\\.state, never KBs or shared loading caches")
    file_phrase = None
    if args.pairing_file is not None:
        try:
            file_phrase = read_pairing_file(args.pairing_file)
        except BridgeError as error:
            parser.error(error.message)
    # A provisioned root was checked, not repaired. Do not rewrite its healthy ACL.
    if args.pairing_file is None or state != state_root:
        private_directory(state)
    lock = InstanceLock(state)
    try:
        try:
            phrase = file_phrase if file_phrase is not None else read_pairing_phrase(from_stdin=args.pairing_stdin)
        except ValueError as error:
            parser.error(str(error))
        auth = Auth(phrase)
        del phrase, file_phrase
        services = {}
        for provider, filename in (("copilot", "operator.sqlite3"), ("codex", "codex.sqlite3")):
            journal = Journal(state / filename, workspace, provider=provider)
            def adapter_factory(provider=provider, journal=journal, model=getattr(args, provider + "_model")):
                return configured_adapter(provider, journal, executable=getattr(args, provider + "_bin"),
                                          model=model, offline=args.offline)
            services[provider] = OperatorService(journal, workspace, adapter_factory(),
                                                 adapter_factory=adapter_factory)
        service = OperatorHub(services)
        print(f"Recovery view: http://{HOST}:{args.port}/")
        print("Native providers start only after explicit human Start. No automatic sessions or prompts.")
        app = create_app(service, auth, args.port, allowed_parent=args.parent_origin)
        if args.application_status_url:
            monitor = ApplicationMonitor(service, args.application_status_url)
            async def start_monitor(application):
                await monitor.start()
            async def stop_monitor(application):
                await monitor.close()
            app.on_startup.append(start_monitor)
            app.on_shutdown.append(stop_monitor)
        web.run_app(app, host="127.0.0.1", port=args.port,
                    access_log=None, print=None)
    finally:
        lock.close()


if __name__ == "__main__":
    main()
