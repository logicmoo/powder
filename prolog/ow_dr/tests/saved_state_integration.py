"""Run saved-state tests against a frozen code copy while other agents edit."""
import os
from pathlib import Path
import shutil
import subprocess
import uuid
from checkpoint_fixture_policy import authorize_copied_checkpoint_fixture

APP = Path(__file__).resolve().parents[1]


def main():
    root = APP / "tests" / (".saved-state-frozen-" + str(uuid.uuid4()))
    app = root / "prolog" / "ow_dr"
    app.mkdir(parents=True)
    try:
        for source in APP.iterdir():
            if source.is_file() and source.suffix.lower() in {".pl", ".ps1", ".dll", ".json"}:
                shutil.copy2(source, app / source.name)
        for directory in ["docs", "web"]:
            shutil.copytree(APP / directory, app / directory,
                            ignore=shutil.ignore_patterns("node_modules", ".git"))
        authorize_copied_checkpoint_fixture(app)
        (app / "tests").mkdir()
        for name in ["test_saved_state.pl", "test_checkpoint_http.pl"]:
            shutil.copy2(APP / "tests" / name, app / "tests" / name)
        env = dict(os.environ, POWDER_NATIVE_TVA_FILE=str(root / "native-tva.pl"),
                   POWDER_SOURCE_PACKS=str(root / "source-packs.json"),
                   POWDER_SERVER_SETTINGS=str(root / "settings.json"))
        result = subprocess.run(["swipl", "-q", "-f", "none",
            "-s", str(app / "tests" / "test_saved_state.pl"),
            "-s", str(app / "tests" / "test_checkpoint_http.pl"),
            "-g", "run_tests([saved_application_state,checkpoint_http]),halt",
            "-t", "halt(1)"], cwd=root, env=env, timeout=400)
        return result.returncode
    finally:
        shutil.rmtree(root)


if __name__ == "__main__":
    raise SystemExit(main())
