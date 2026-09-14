/* Stateless Windows path checks. The UTF-16 conversion and reparse flag checks
   follow the existing source-editor adapter; this helper grants no I/O authority. */
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdint.h>
#include <wchar.h>
#include <stdlib.h>
#include <string.h>
#include <SWI-Prolog.h>

static foreign_t path_error(DWORD code)
{
    term_t error = PL_new_term_ref();
    if (!PL_unify_term(error, PL_FUNCTOR_CHARS, "error", 2,
        PL_FUNCTOR_CHARS, "permission_error", 3,
        PL_CHARS, "access", PL_CHARS, "agent_path",
        PL_CHARS, "reparse_or_unverifiable",
        PL_FUNCTOR_CHARS, "win32", 1, PL_INT64, (int64_t)code))
        return FALSE;
    return PL_raise_exception(error);
}

static int reserved_component(const wchar_t *value, size_t length)
{
    size_t base = 0;
    while (base < length && value[base] != L'.') base++;
    if (base == 3 &&
        (!_wcsnicmp(value,L"CON",3) || !_wcsnicmp(value,L"PRN",3) ||
         !_wcsnicmp(value,L"AUX",3) || !_wcsnicmp(value,L"NUL",3)))
        return TRUE;
    if (base == 4 && (!_wcsnicmp(value,L"COM",3) || !_wcsnicmp(value,L"LPT",3))) {
        wchar_t digit = value[3];
        if ((digit >= L'1' && digit <= L'9') ||
            digit == 0x00b9 || digit == 0x00b2 || digit == 0x00b3)
            return TRUE;
    }
    return FALSE;
}

static int valid_components(const wchar_t *path, size_t length)
{
    size_t start = 3;
    for (size_t i = 3; i <= length; i++) {
        wchar_t c = path[i];
        if (i == length || c == L'\\') {
            size_t count = i - start;
            if (!count || path[i-1] == L' ' || path[i-1] == L'.' ||
                reserved_component(path+start,count))
                return FALSE;
            start = i + 1;
        } else if (c < 32 || wcschr(L":*?\"<>|",c)) {
            return FALSE;
        }
    }
    return TRUE;
}

static foreign_t no_reparse(term_t input)
{
    pl_wchar_t *text;
    size_t length;
    if (!PL_get_wchars(input,&length,&text,CVT_ATOM|CVT_STRING|CVT_EXCEPTION|BUF_RING))
        return FALSE;
    if (length < 3 || length > 32760)
        return path_error(ERROR_INVALID_NAME);
    wchar_t *path = malloc((length+5)*sizeof(wchar_t));
    if (!path) return PL_resource_error("memory");
    memcpy(path,L"\\\\?\\",4*sizeof(wchar_t));
    memcpy(path+4,text,length*sizeof(wchar_t));
    path[length+4] = 0;
    wchar_t *plain = path+4;
    for (size_t i = 0; i < length; i++) {
        if (!plain[i]) { free(path); return path_error(ERROR_INVALID_NAME); }
        if (plain[i] == L'/') plain[i] = L'\\';
    }
    while (length > 3 && plain[length-1] == L'\\') plain[--length] = 0;
    if (!((plain[0] >= L'a' && plain[0] <= L'z') ||
          (plain[0] >= L'A' && plain[0] <= L'Z')) ||
        plain[1] != L':' || plain[2] != L'\\' ||
        (length > 3 && !valid_components(plain,length))) {
        free(path);
        return path_error(ERROR_INVALID_NAME);
    }
    DWORD error = ERROR_SUCCESS;
    for (size_t i = 3; i <= length; i++) {
        if (i != 3 && i != length && plain[i] != L'\\') continue;
        wchar_t end = plain[i];
        plain[i] = 0;
        DWORD attributes = GetFileAttributesW(path);
        DWORD observed = attributes == INVALID_FILE_ATTRIBUTES ? GetLastError() : ERROR_SUCCESS;
        plain[i] = end;
        if (attributes == INVALID_FILE_ATTRIBUTES) {
            if (i == 3 || (observed != ERROR_FILE_NOT_FOUND && observed != ERROR_PATH_NOT_FOUND)) {
                error = observed;
                break;
            }
        } else if ((attributes & FILE_ATTRIBUTE_REPARSE_POINT) ||
                   (i < length && !(attributes & FILE_ATTRIBUTE_DIRECTORY))) {
            error = ERROR_ACCESS_DENIED;
            break;
        }
    }
    free(path);
    return error ? path_error(error) : TRUE;
}

install_t install(void)
{
    PL_register_foreign_in_module("kb_llm_files","agent_native_no_reparse",1,
                                 (pl_function_t)no_reparse,0);
}
