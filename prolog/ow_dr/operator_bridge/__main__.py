from __future__ import annotations

import argparse
import getpass
from pathlib import Path


def main() -> None:
    parser = argparse.ArgumentParser(description="powder independent human operator/recovery bridge")
    parser.add_argument("--port", type=int, default=8063)
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
        phrase = getpass.getpass("Local bridge pairing phrase (16+ characters; NOT provider credentials): ")
        auth = Auth(phrase)
        del phrase
        services = {}
        for provider, filename in (("copilot", "operator.sqlite3"), ("codex", "codex.sqlite3")):
            journal = Journal(state / filename, workspace, provider=provider)
            def adapter_factory(provider=provider, journal=journal):
                return configured_adapter(provider, journal, executable=getattr(args, provider + "_bin"),
                                          model=getattr(args, provider + "_model"), offline=args.offline)
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
