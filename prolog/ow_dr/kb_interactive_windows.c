/* Exact console-mode restoration around explicitly requested P/S handoffs.
   Separate DLL: does not replace or re-register the running scanner adapter. */
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdint.h>
#include <SWI-Prolog.h>

static const DWORD ids[3] = { STD_INPUT_HANDLE, STD_OUTPUT_HANDLE, STD_ERROR_HANDLE };
static atom_t modes_atom, none_atom;

static foreign_t mode_error(const char *operation, DWORD code)
{
    term_t error = PL_new_term_ref();
    if (!PL_unify_term(error, PL_FUNCTOR_CHARS, "error", 2,
                         PL_FUNCTOR_CHARS, "console_handoff", 2,
                           PL_CHARS, operation, PL_INT64, (int64_t)code,
                         PL_VARIABLE))
        return FALSE;
    return PL_raise_exception(error);
}

static foreign_t snapshot(term_t modes)
{
    term_t values = PL_new_term_refs(3);
    int i;
    for (i = 0; i < 3; i++) {
        DWORD mode;
        if (GetConsoleMode(GetStdHandle(ids[i]), &mode)) {
            if (!PL_put_int64(values+i, mode))
                return FALSE;
        } else if (!PL_put_atom_chars(values+i, "none")) {
            return FALSE;
        }
    }
    return PL_unify_term(modes, PL_FUNCTOR_CHARS, "console_modes", 3,
                        PL_TERM, values, PL_TERM, values+1, PL_TERM, values+2);
}

static DWORD restore_one(int index, DWORD mode)
{
    HANDLE handle = GetStdHandle(ids[index]);
    DWORD error;
    if (SetConsoleMode(handle, mode))
        return 0;
    error = GetLastError();
    if (error == ERROR_ACCESS_DENIED) {
        handle = CreateFileW(index == 0 ? L"CONIN$" : L"CONOUT$",
                             GENERIC_READ | GENERIC_WRITE,
                             FILE_SHARE_READ | FILE_SHARE_WRITE, NULL,
                             OPEN_EXISTING, 0, NULL);
        if (handle == INVALID_HANDLE_VALUE)
            return GetLastError();
        error = SetConsoleMode(handle, mode) ? 0 : GetLastError();
        CloseHandle(handle);
    }
    return error;
}

static foreign_t restore(term_t modes)
{
    atom_t name;
    size_t arity;
    DWORD values[3], first_error = 0;
    int present[3], i;
    term_t value = PL_new_term_ref();
    if (!PL_get_name_arity(modes, &name, &arity) ||
        arity != 3 || name != modes_atom)
        return PL_type_error("console_modes", modes);
    for (i = 0; i < 3; i++) {
        int64_t number;
        atom_t atom;
        if (!PL_get_arg(i+1, modes, value))
            return FALSE;
        if (PL_get_atom(value, &atom) && atom == none_atom) {
            present[i] = 0;
        } else {
            if (!PL_get_int64_ex(value, &number))
                return FALSE;
            if (number < 0 || number > UINT32_MAX)
                return PL_domain_error("console_mode", value);
            present[i] = 1;
            values[i] = (DWORD)number;
        }
    }
    for (i = 0; i < 3; i++) {
        if (present[i]) {
            DWORD error = restore_one(i, values[i]);
            if (error && !first_error)
                first_error = error;
        }
    }
    return first_error ? mode_error("restore_modes", first_error) : TRUE;
}

install_t install(void)
{
    modes_atom = PL_new_atom("console_modes");
    none_atom = PL_new_atom("none");
    PL_register_foreign_in_module("kb_interactive_control", "interactive_console_modes",
                                  1, (pl_function_t)snapshot, 0);
    PL_register_foreign_in_module("kb_interactive_control", "interactive_restore_console_modes",
                                  1, (pl_function_t)restore, 0);
}
