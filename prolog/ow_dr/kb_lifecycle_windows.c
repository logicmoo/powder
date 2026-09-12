/* Narrow SWI adapter: bounded Windows console events, no worker or child process.
   Build using build_lifecycle_windows.ps1. No listener/KB operations live here. */
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdint.h>
#include <SWI-Prolog.h>

static HANDLE input_handle = INVALID_HANDLE_VALUE;
static DWORD saved_mode;
static DWORD owner;
static LONG interrupted;
static int active;
static int has_console;

static BOOL WINAPI controls(DWORD event)
{
    if (event != CTRL_C_EVENT)
        return FALSE;
    InterlockedExchange(&interrupted, 1);
    return TRUE;
}

static foreign_t win_error(const char *operation)
{
    term_t exception = PL_new_term_ref();
    if (!PL_unify_term(exception,
                      PL_FUNCTOR_CHARS, "error", 2,
                        PL_FUNCTOR_CHARS, "windows_console", 2,
                          PL_CHARS, operation, PL_INT, (int)GetLastError(),
                        PL_VARIABLE))
        return FALSE;
    return PL_raise_exception(exception);
}

static foreign_t console_open(term_t result)
{
    DWORD mode;
    if (active)
        return PL_permission_error("acquire", "console_owner", result);
    owner = GetCurrentThreadId();
    input_handle = GetStdHandle(STD_INPUT_HANDLE);
    has_console = input_handle && input_handle != INVALID_HANDLE_VALUE &&
                  GetConsoleMode(input_handle, &saved_mode);
    if (has_console) {
        /* A CONIN$ redirection may be read-only. SetConsoleMode requires write
           access; open our own non-inheritable handle only AFTER verifying
           that stdin really is a console (never bypass redirected input). */
        input_handle = CreateFileW(L"CONIN$", GENERIC_READ | GENERIC_WRITE,
                                    FILE_SHARE_READ | FILE_SHARE_WRITE, NULL,
                                    OPEN_EXISTING, 0, NULL);
        if (input_handle == INVALID_HANDLE_VALUE)
            return win_error("open_console");
        /* Processed input is deliberately off: physical Ctrl+C is a key, not
           SWI's debugger interrupt. Preserve every bit for exact restoration. */
        mode = (saved_mode | ENABLE_EXTENDED_FLAGS) &
               ~(ENABLE_LINE_INPUT | ENABLE_ECHO_INPUT | ENABLE_PROCESSED_INPUT |
                 ENABLE_QUICK_EDIT_MODE | ENABLE_VIRTUAL_TERMINAL_INPUT);
        if (!SetConsoleMode(input_handle, mode)) {
            DWORD error = GetLastError();
            CloseHandle(input_handle);
            SetLastError(error);
            return win_error("set_mode");
        }
    }
    InterlockedExchange(&interrupted, 0);
    if (!SetConsoleCtrlHandler(controls, TRUE)) {
        DWORD error = GetLastError();
        if (has_console) {
            SetConsoleMode(input_handle, saved_mode);
            CloseHandle(input_handle);
        }
        SetLastError(error);
        return win_error("install_handler");
    }
    active = 1;
    if (PL_unify_atom_chars(result, has_console ? "windows" : "headless"))
        return TRUE;
    if (has_console) {
        SetConsoleMode(input_handle, saved_mode);
        CloseHandle(input_handle);
    }
    SetConsoleCtrlHandler(controls, FALSE);
    active = 0;
    return FALSE;
}

static foreign_t console_close(void)
{
    DWORD error = 0;
    if (!active)
        return TRUE;
    if (owner != GetCurrentThreadId())
        return PL_resource_error("console_owner");
    if (has_console && !SetConsoleMode(input_handle, saved_mode))
        error = GetLastError();
    if (has_console)
        CloseHandle(input_handle);
    if (!SetConsoleCtrlHandler(controls, FALSE) && !error)
        error = GetLastError();
    active = 0;
    input_handle = INVALID_HANDLE_VALUE;
    InterlockedExchange(&interrupted, 0);
    if (error) {
        SetLastError(error);
        return win_error("restore");
    }
    return TRUE;
}

static foreign_t console_read(term_t timeout, term_t event)
{
    double seconds;
    ULONGLONG deadline;
    if (!PL_get_float_ex(timeout, &seconds))
        return FALSE;
    if (!(seconds >= 0.01 && seconds <= 1.0))
        return PL_domain_error("console_timeout", timeout);
    if (!active || owner != GetCurrentThreadId())
        return PL_permission_error("read", "console_owner", event);
    deadline = GetTickCount64() + (DWORD)(seconds * 1000.0 + 0.5);
    for (;;) {
        ULONGLONG now;
        DWORD result, count;
        INPUT_RECORD record;
        if (PL_handle_signals() < 0)
            return FALSE;
        if (InterlockedExchange(&interrupted, 0))
            return PL_unify_atom_chars(event, "interrupt");
        now = GetTickCount64();
        if (now >= deadline)
            return PL_unify_atom_chars(event, "timeout");
        if (!has_console) {
            Sleep((DWORD)(deadline - now));
            continue;
        }
        result = WaitForSingleObject(input_handle, (DWORD)(deadline - now));
        if (result == WAIT_TIMEOUT)
            continue;
        if (result != WAIT_OBJECT_0)
            return win_error("wait");
        /* This adapter is the sole console reader during wait_for_stop/1. */
        if (!ReadConsoleInputW(input_handle, &record, 1, &count))
            return win_error("read");
        if (count && record.EventType == KEY_EVENT && record.Event.KeyEvent.bKeyDown) {
            unsigned code = record.Event.KeyEvent.uChar.UnicodeChar;
            if (code == 3)
                return PL_unify_atom_chars(event, "interrupt");
            if (code)
                return PL_unify_term(event, PL_FUNCTOR_CHARS, "key", 1, PL_INT, (int)code);
        }
    }
}

static foreign_t console_mode(term_t mode)
{
    DWORD current;
    if (!GetConsoleMode(GetStdHandle(STD_INPUT_HANDLE), &current))
        return PL_unify_atom_chars(mode, "headless");
    return PL_unify_int64(mode, current);
}

install_t install(void)
{
    PL_register_foreign_in_module("kb_lifecycle", "windows_console_open", 1, (pl_function_t)console_open, 0);
    PL_register_foreign_in_module("kb_lifecycle", "windows_console_read", 2, (pl_function_t)console_read, 0);
    PL_register_foreign_in_module("kb_lifecycle", "windows_console_close", 0, (pl_function_t)console_close, 0);
    PL_register_foreign_in_module("kb_lifecycle", "windows_console_mode", 1, (pl_function_t)console_mode, 0);
}
