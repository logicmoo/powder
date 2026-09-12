from __future__ import annotations

import asyncio
import ctypes
import json
import os
import platform
import re
import shutil
import subprocess
from dataclasses import dataclass
from pathlib import Path

from .providers import provider_label
from .workspace import BridgeError

SDK_VERSION = "1.0.13"
CLI_VERSIONS = {"copilot": "1.0.82", "codex": "0.149.0"}


@dataclass(frozen=True)
class NativeCommand:
    provider: str
    path: Path

    def argv(self, *args: str) -> list[str]:
        return [str(self.path), *args]


def resolve_native(provider: str, explicit: str | None = None) -> NativeCommand:
    """Resolve official npm packaging without executing a shell or a shim."""
    provider_label(provider)
    found = explicit or shutil.which(provider)
    if not found:
        raise BridgeError("executable_missing", f"Install {provider} separately or supply its native executable.", 503)
    path = Path(found).resolve()
    if path.suffix.lower() in (".cmd", ".bat", ".ps1"):
        package_name = "@github/copilot" if provider == "copilot" else "@openai/codex"
        package = path.parent / "node_modules" / Path(package_name)
        try:
            metadata = json.loads((package / "package.json").read_text(encoding="utf-8"))
        except (OSError, ValueError):
            raise BridgeError("unsupported_launcher", "The shim is not a verified installed official CLI package.", 503) from None
        if metadata.get("name") != package_name or os.name != "nt":
            raise BridgeError("unsupported_launcher", "Supply an explicit native CLI executable.", 503)
        arch = "arm64" if platform.machine().lower() in ("arm64", "aarch64") else "x64"
        native_name = f"{package_name}-win32-{arch}"
        roots = [package / "node_modules" / Path(native_name), path.parent / "node_modules" / Path(native_name)]
        candidates = []
        for root in roots:
            if not (root / "package.json").is_file():
                continue
            data = json.loads((root / "package.json").read_text(encoding="utf-8"))
            if data.get("name") not in (native_name, package_name):
                continue
            if provider == "copilot":
                candidate = root / "copilot.exe"
            else:
                target = "aarch64-pc-windows-msvc" if arch == "arm64" else "x86_64-pc-windows-msvc"
                candidate = root / "vendor" / target / "bin" / "codex.exe"
            if candidate.is_file() and candidate.resolve().is_relative_to(root.resolve()):
                candidates.append(candidate.resolve())
        candidates = list(dict.fromkeys(candidates))
        if len(candidates) != 1:
            raise BridgeError("unsupported_launcher", "Native platform package is absent or ambiguous; supply its executable.", 503)
        path = candidates[0]
    if not path.is_file() or (os.name == "nt" and path.suffix.lower() != ".exe"):
        raise BridgeError("unsupported_launcher", "A native executable is required, not PowerShell, CMD or JavaScript.", 503)
    return NativeCommand(provider, path)


async def verify_version(command: NativeCommand, cwd: str) -> str:
    def probe():
        result = subprocess.run(command.argv("--version"), cwd=cwd, stdin=subprocess.DEVNULL,
                                stdout=subprocess.PIPE, stderr=subprocess.DEVNULL,
                                timeout=15, check=True, creationflags=(
                                    subprocess.CREATE_NO_WINDOW if os.name == "nt" else 0))
        if len(result.stdout) > 4096:
            raise ValueError("oversized version")
        text = result.stdout.decode("utf-8", errors="strict")
        match = re.search(r"\b(\d+\.\d+\.\d+)\b", text)
        if not match or match.group(1) != CLI_VERSIONS[command.provider]:
            raise BridgeError("unsupported_cli_version", "Native CLI version changed; review and validate the adapter before starting.", 503)
        return match.group(1)
    return await asyncio.to_thread(probe)


def trusted_cwd(value, expected: str) -> str:
    if not isinstance(value, str) or not value or not Path(value).is_absolute():
        raise BridgeError("session_workspace_mismatch", "Native working directory is missing or unverified.")
    if Path(value).resolve() != Path(expected).resolve():
        raise BridgeError("session_workspace_mismatch", "Native session belongs to another repository; it was not resumed.")
    return expected


class NativeTree:
    """A Windows job owns descendants; closing its handle never kills them."""
    def __init__(self):
        self.handle = None
        self.pid = None
        self.process = None
        self._api = None

    def attach(self, process) -> None:
        if self.handle or self.process:
            raise BridgeError("process_already_owned", "The operator already owns a native process.")
        self.process, self.pid = process, process.pid
        if os.name != "nt":
            return
        from ctypes import wintypes
        api = ctypes.WinDLL("kernel32", use_last_error=True)
        api.CreateJobObjectW.argtypes = [ctypes.c_void_p, wintypes.LPCWSTR]
        api.CreateJobObjectW.restype = wintypes.HANDLE
        api.OpenProcess.argtypes = [wintypes.DWORD, wintypes.BOOL, wintypes.DWORD]
        api.OpenProcess.restype = wintypes.HANDLE
        api.AssignProcessToJobObject.argtypes = [wintypes.HANDLE, wintypes.HANDLE]
        api.AssignProcessToJobObject.restype = wintypes.BOOL
        api.TerminateJobObject.argtypes = [wintypes.HANDLE, wintypes.UINT]
        api.TerminateJobObject.restype = wintypes.BOOL
        api.QueryInformationJobObject.argtypes = [
            wintypes.HANDLE, ctypes.c_int, ctypes.c_void_p, wintypes.DWORD, ctypes.c_void_p]
        api.QueryInformationJobObject.restype = wintypes.BOOL
        api.CloseHandle.argtypes = [wintypes.HANDLE]
        api.CloseHandle.restype = wintypes.BOOL
        handle = api.CreateJobObjectW(None, None)
        proc = api.OpenProcess(0x0100 | 0x0001, False, process.pid)
        if not handle or not proc:
            if handle:
                api.CloseHandle(handle)
            if proc:
                api.CloseHandle(proc)
            raise BridgeError("process_ownership_failed", "Could not acquire native process-tree ownership; no session started.")
        try:
            if not api.AssignProcessToJobObject(handle, proc):
                api.CloseHandle(handle)
                raise BridgeError("process_ownership_failed", "Could not own the native process tree; no session started.")
        finally:
            api.CloseHandle(proc)
        self.handle, self._api = handle, api

    def pids(self) -> list[int]:
        if self.handle:
            size = 8 + ctypes.sizeof(ctypes.c_size_t) * 512
            buffer = ctypes.create_string_buffer(size)
            if self._api.QueryInformationJobObject(self.handle, 3, buffer, size, None):
                count = ctypes.c_ulong.from_buffer(buffer, 4).value
                return list((ctypes.c_size_t * min(count, 512)).from_buffer(buffer, 8))
        if self.process is not None:
            code = self.process.poll() if hasattr(self.process, "poll") else self.process.returncode
            return [self.pid] if code is None else []
        return []

    def alive(self) -> bool:
        if self.process is None:
            return False
        code = self.process.poll() if hasattr(self.process, "poll") else self.process.returncode
        return code is None

    def stop(self) -> None:
        if self.handle:
            if not self._api.TerminateJobObject(self.handle, 1):
                raise BridgeError("native_stop_unknown", "Owned process-tree stop could not be confirmed.")
        elif self.process is not None and self.pids():
            self.process.terminate()
        self.close()

    def close(self) -> None:
        if self.handle:
            self._api.CloseHandle(self.handle)
            self.handle = None


class NativeOutcome(BridgeError):
    def __init__(self, state: str):
        super().__init__("native_turn_" + state, f"The native turn ended as {state}.")
        self.state = state
