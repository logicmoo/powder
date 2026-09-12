from __future__ import annotations

import argparse
import getpass
from pathlib import Path


def main() -> None:
    parser = argparse.ArgumentParser(description="powder independent human operator/recovery bridge")
    parser.add_argument("--port", type=int, default=8063)
    parser.add_argument("--project-root", type=Path, default=Path(__file__).resolve().parents[3])
    parser.add_argument("--state-dir", type=Path, default=Path(__file__).with_name(".state"))
    parser.add_argument("--application-status-url", help="Optional read-only loopback Prolog status URL; no restart authority")
    args = parser.parse_args()
    if not 1024 <= args.port <= 65535:
        parser.error("port must be between 1024 and 65535")
    from aiohttp import web
    from .adapter import UnavailableAdapter
    from .journal import Journal
    from .monitor import ApplicationMonitor
    from .security import Auth, HOST, InstanceLock, private_directory
    from .server import create_app
    from .service import OperatorService
    from .workspace import Workspace

    workspace = Workspace.inspect(args.project_root)
    if Path(workspace.root) != Path(__file__).resolve().parents[3]:
        parser.error("this bridge belongs only to its primary project checkout")
    state_root = Path(__file__).with_name(".state").resolve()
    state = args.state_dir.resolve()
    if not state.is_relative_to(state_root):
        parser.error("state-dir must be inside operator_bridge\\.state, never KBs or shared loading caches")
    private_directory(state)
    lock = InstanceLock(state)
    try:
        phrase = getpass.getpass("Local bridge pairing phrase (16+ characters; NOT a GitHub password): ")
        auth = Auth(phrase)
        del phrase
        journal = Journal(state / "operator.sqlite3", workspace)
        service = OperatorService(journal, workspace, UnavailableAdapter())
        print(f"Recovery view: http://{HOST}:{args.port}/")
        print("No live Copilot adapter is configured. No model prompt or CLI process will be started.")
        app = create_app(service, auth, args.port)
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
