"""Narrow Windows adapter for explicitly provisioned, owner-private pairing files."""
from __future__ import annotations

import ctypes
import os
import stat
from contextlib import ExitStack
from pathlib import Path

from .workspace import BridgeError

STATE_ROOT = Path(__file__).absolute().with_name(".state")


def _reject() -> BridgeError:
    return BridgeError("unsafe_pairing_file",
        "Pairing file must be an owner-private, non-linked regular file beneath operator .state.", 400)


class _WindowsFiles:
    def __init__(self):
        from ctypes import wintypes as w
        self.w = w
        self.kernel = ctypes.WinDLL("kernel32", use_last_error=True)
        self.advapi = ctypes.WinDLL("advapi32", use_last_error=True)
        self.kernel.CreateFileW.argtypes = [
            w.LPCWSTR, w.DWORD, w.DWORD, ctypes.c_void_p, w.DWORD, w.DWORD, w.HANDLE]
        self.kernel.CreateFileW.restype = w.HANDLE
        self.kernel.CloseHandle.argtypes = [w.HANDLE]
        self.kernel.GetCurrentProcess.restype = w.HANDLE
        self.kernel.GetFinalPathNameByHandleW.argtypes = [w.HANDLE, w.LPWSTR, w.DWORD, w.DWORD]
        self.kernel.GetFinalPathNameByHandleW.restype = w.DWORD
        self.kernel.LocalFree.argtypes = [ctypes.c_void_p]
        self.kernel.ReadFile.argtypes = [w.HANDLE, ctypes.c_void_p, w.DWORD,
                                        ctypes.POINTER(w.DWORD), ctypes.c_void_p]
        self.kernel.ReadFile.restype = w.BOOL
        self.advapi.OpenProcessToken.argtypes = [w.HANDLE, w.DWORD, ctypes.POINTER(w.HANDLE)]
        self.advapi.OpenProcessToken.restype = w.BOOL
        self.advapi.GetTokenInformation.argtypes = [w.HANDLE, ctypes.c_int, ctypes.c_void_p,
                                                   w.DWORD, ctypes.POINTER(w.DWORD)]
        self.advapi.GetTokenInformation.restype = w.BOOL
        self.advapi.ConvertSidToStringSidW.argtypes = [ctypes.c_void_p, ctypes.POINTER(w.LPWSTR)]
        self.advapi.ConvertSidToStringSidW.restype = w.BOOL
        self.advapi.GetSecurityInfo.argtypes = [w.HANDLE, ctypes.c_int, w.DWORD,
            ctypes.POINTER(ctypes.c_void_p), ctypes.c_void_p, ctypes.POINTER(ctypes.c_void_p),
            ctypes.c_void_p, ctypes.POINTER(ctypes.c_void_p)]
        self.advapi.GetSecurityInfo.restype = w.DWORD
        self.advapi.GetAce.argtypes = [ctypes.c_void_p, w.DWORD, ctypes.POINTER(ctypes.c_void_p)]
        self.advapi.GetAce.restype = w.BOOL
        self.user_sid = self._user_sid()

    def _sid(self, pointer) -> str:
        text = self.w.LPWSTR()
        if not self.advapi.ConvertSidToStringSidW(pointer, ctypes.byref(text)):
            raise _reject()
        try:
            return text.value
        finally:
            self.kernel.LocalFree(text)

    def _user_sid(self) -> str:
        token = self.w.HANDLE()
        if not self.advapi.OpenProcessToken(self.kernel.GetCurrentProcess(), 0x0008, ctypes.byref(token)):
            raise _reject()
        try:
            size = self.w.DWORD()
            self.advapi.GetTokenInformation(token, 1, None, 0, ctypes.byref(size))
            buffer = ctypes.create_string_buffer(size.value)
            if not self.advapi.GetTokenInformation(token, 1, buffer, size, ctypes.byref(size)):
                raise _reject()
            return self._sid(ctypes.c_void_p.from_buffer(buffer).value)
        finally:
            self.kernel.CloseHandle(token)

    def open(self, path: Path, stack: ExitStack):
        # Read/control only, OPEN_EXISTING, no write/delete sharing, never follow final reparse.
        handle = self.kernel.CreateFileW(str(path), 0x80020000, 1, None, 3, 0x02200000, None)
        if handle == ctypes.c_void_p(-1).value:
            raise _reject()
        stack.callback(self.kernel.CloseHandle, handle)
        name = ctypes.create_unicode_buffer(32768)
        length = self.kernel.GetFinalPathNameByHandleW(handle, name, len(name), 0)
        if not length or length >= len(name):
            raise _reject()
        final = name.value.removeprefix("\\\\?\\")
        if os.path.normcase(final) != os.path.normcase(str(path)):
            raise _reject()
        self._private_acl(handle)
        return handle

    def _private_acl(self, handle):
        owner, dacl, descriptor = ctypes.c_void_p(), ctypes.c_void_p(), ctypes.c_void_p()
        if self.advapi.GetSecurityInfo(handle, 1, 5, ctypes.byref(owner), None,
                ctypes.byref(dacl), None, ctypes.byref(descriptor)):
            raise _reject()
        try:
            if not owner.value or self._sid(owner) != self.user_sid or not dacl.value:
                raise _reject()
            ace_count = ctypes.c_ushort.from_address(dacl.value + 4).value
            allowed = {self.user_sid, "S-1-5-18", "S-1-3-4"}  # current owner, SYSTEM, OWNER RIGHTS
            for index in range(ace_count):
                ace = ctypes.c_void_p()
                if not self.advapi.GetAce(dacl, index, ctypes.byref(ace)):
                    raise _reject()
                kind = ctypes.c_ubyte.from_address(ace.value).value
                if kind == 1:  # A deny ACE grants no access.
                    continue
                if kind != 0 or self._sid(ace.value + 8) not in allowed:
                    raise _reject()
        finally:
            self.kernel.LocalFree(descriptor)

    def read(self, handle) -> bytes:
        w = self.w

        class FileInformation(ctypes.Structure):
            _fields_ = [("attributes", w.DWORD), ("created", w.FILETIME), ("accessed", w.FILETIME),
                        ("written", w.FILETIME), ("volume", w.DWORD), ("size_high", w.DWORD),
                        ("size_low", w.DWORD), ("links", w.DWORD), ("index_high", w.DWORD),
                        ("index_low", w.DWORD)]
        information = FileInformation()
        self.kernel.GetFileInformationByHandle.argtypes = [w.HANDLE, ctypes.POINTER(FileInformation)]
        self.kernel.GetFileInformationByHandle.restype = w.BOOL
        if (not self.kernel.GetFileInformationByHandle(handle, ctypes.byref(information))
                or information.attributes & (0x400 | 0x10) or information.links != 1
                or information.size_high or information.size_low > 4098):
            raise _reject()
        buffer, size = ctypes.create_string_buffer(4099), w.DWORD()
        if not self.kernel.ReadFile(handle, buffer, len(buffer), ctypes.byref(size), None):
            raise _reject()
        if size.value > 4098:
            raise _reject()
        return buffer.raw[:size.value]


def read_pairing_file(path: Path) -> str:
    """No chmod/repair, creation, secret output, reparse traversal or persisted capability."""
    try:
        if os.name != "nt":
            raise _reject()  # Do not pretend this native ACL contract is portable.
        path = Path(path)
        if any(part in (".", "..") for part in path.parts):
            raise _reject()
        candidate = Path(os.path.abspath(path))
        root = Path(os.path.abspath(STATE_ROOT))
        if candidate == root or not candidate.is_relative_to(root):
            raise _reject()
        if any(":" in part or part.rstrip(" .") != part for part in candidate.parts[1:]):
            raise _reject()
        # Inspect all ancestry, including repository/volume ancestry; no symlink resolution.
        for component in (*reversed(candidate.parents), candidate):
            info = component.lstat()
            if stat.S_ISLNK(info.st_mode) or getattr(info, "st_file_attributes", 0) & 0x400:
                raise _reject()
        native = _WindowsFiles()
        with ExitStack() as stack:
            # Hold each private directory against replacement while inspecting/reading its child.
            chain = [root]
            chain.extend(reversed([parent for parent in candidate.parents if parent != root and parent.is_relative_to(root)]))
            for directory in chain:
                native.open(directory, stack)
            data = native.read(native.open(candidate, stack))
        phrase = data.removesuffix(b"\n").removesuffix(b"\r").decode("utf-8")
        if not 16 <= len(phrase) <= 1024 or any(char in phrase for char in ("\n", "\r", "\0")):
            raise _reject()
        return phrase
    except (OSError, ValueError, UnicodeError):
        raise _reject() from None
