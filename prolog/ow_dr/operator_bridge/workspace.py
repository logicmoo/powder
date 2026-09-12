from __future__ import annotations

import subprocess
from dataclasses import asdict, dataclass
from pathlib import Path


class BridgeError(Exception):
    def __init__(self, code: str, message: str, status: int = 409, *, details: dict | None = None):
        super().__init__(message)
        self.code, self.message, self.status = code, message, status
        self.details = details or {}


@dataclass(frozen=True)
class Workspace:
    root: str
    branch: str

    @classmethod
    def inspect(cls, root: Path) -> "Workspace":
        root = root.resolve(strict=True)

        def git(*args: str) -> str:
            result = subprocess.run(
                ["git", "-C", str(root), *args], capture_output=True,
                text=True, timeout=10, check=True,
            )
            return result.stdout.strip()

        actual = Path(git("rev-parse", "--show-toplevel")).resolve(strict=True)
        if actual != root or not (root / ".git").is_dir():
            raise BridgeError("primary_checkout_required", "Use the primary checkout, not a worktree.")
        branch = git("symbolic-ref", "--quiet", "--short", "HEAD")
        if branch != "master":
            raise BridgeError("branch_mismatch", "The operator is restricted to the existing master branch.")
        return cls(str(root), branch)

    def verify(self) -> None:
        if self.inspect(Path(self.root)) != self:
            raise BridgeError("workspace_changed", "Workspace identity changed; operator dispatch is paused.")

    def json(self) -> dict:
        return asdict(self)
