/* Windows handle-pinned source I/O. No source parser or executable input.
   File content is held without write sharing; ancestors cannot be renamed.
   Replacement requires delete sharing and a final file-ID check. */
#define WIN32_LEAN_AND_MEAN
#define _WIN32_WINNT 0x0A00
#include <windows.h>
#include <stdint.h>
#include <wchar.h>
#include <wctype.h>
#include <stdlib.h>
#include <string.h>
#include <SWI-Prolog.h>

typedef struct {
    HANDLE file;
    HANDLE dirs[512];
    size_t count;
    wchar_t *path;
    BY_HANDLE_FILE_INFORMATION identity;
    int closed;
} source_lease;

static foreign_t io_error(const char *op, DWORD code) {
    term_t e = PL_new_term_ref();
    if (!PL_unify_term(e, PL_FUNCTOR_CHARS, "error", 2,
        PL_FUNCTOR_CHARS, "source_editor_io", 2, PL_CHARS, op,
        PL_INT64, (int64_t)code, PL_VARIABLE)) return FALSE;
    return PL_raise_exception(e);
}
static void close_lease(source_lease *s) {
    if (!s || s->closed) return;
    s->closed = 1;
    if (s->file != INVALID_HANDLE_VALUE) CloseHandle(s->file);
    while (s->count) CloseHandle(s->dirs[--s->count]);
    free(s->path);
    s->path = NULL;
}
static int release_blob(atom_t a) {
    size_t n;
    source_lease **s = PL_blob_data(a, &n, NULL);
    if (n == sizeof(*s)) { close_lease(*s); free(*s); }
    return TRUE;
}
static PL_blob_t lease_type = {
    PL_BLOB_MAGIC, PL_BLOB_UNIQUE, "source_editor_lease", release_blob
};
static source_lease *get_lease(term_t t) {
    void *data; size_t n; PL_blob_t *type;
    if (!PL_get_blob(t, &data, &n, &type) || type != &lease_type ||
        n != sizeof(source_lease *)) {
        PL_type_error("source_editor_lease", t); return NULL;
    }
    source_lease *s = *(source_lease **)data;
    if (s->closed) { PL_existence_error("source_editor_lease", t); return NULL; }
    return s;
}
static wchar_t *wide_path(term_t t) {
    pl_wchar_t *v; size_t n;
    if (!PL_get_wchars(t, &n, &v, CVT_ATOM|CVT_STRING|CVT_EXCEPTION|BUF_RING)) return NULL;
    wchar_t *p = malloc((n + 1) * sizeof(wchar_t));
    if (!p) { PL_resource_error("memory"); return NULL; }
    memcpy(p, v, n * sizeof(wchar_t)); p[n] = 0;
    for (size_t i = 0; i < n; i++) if (p[i] == L'/') p[i] = L'\\';
    return p;
}
static int beneath(const wchar_t *root, const wchar_t *path) {
    size_t n = wcslen(root);
    return _wcsnicmp(root, path, n) == 0 && path[n] == L'\\' &&
        !wcsstr(path, L"\\..") && !wcsstr(path, L"\\.\\") &&
        !wcschr(path + 2, L':');
}
static int pin_directories(source_lease *s, wchar_t *path, int create) {
    for (wchar_t *p = path + 3; ; p++) {
        if (*p != L'\\' && *p != 0) continue;
        wchar_t end = *p; *p = 0;
        if (create && !CreateDirectoryW(path, NULL) && GetLastError() != ERROR_ALREADY_EXISTS) {
            DWORD e = GetLastError(); *p = end; return (int)e;
        }
        HANDLE h = CreateFileW(path, FILE_READ_ATTRIBUTES, FILE_SHARE_READ|FILE_SHARE_WRITE,
            NULL, OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS|FILE_FLAG_OPEN_REPARSE_POINT, NULL);
        *p = end;
        if (h == INVALID_HANDLE_VALUE) return (int)GetLastError();
        BY_HANDLE_FILE_INFORMATION i;
        if (!GetFileInformationByHandle(h, &i) ||
            (i.dwFileAttributes & FILE_ATTRIBUTE_REPARSE_POINT) ||
            !(i.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) || s->count == 512) {
            CloseHandle(h); return ERROR_ACCESS_DENIED;
        }
        s->dirs[s->count++] = h;
        if (!end) break;
    }
    return 0;
}
static foreign_t begin_source(term_t root_t, term_t path_t, term_t max_t,
                              term_t lease_t, term_t bytes_t, term_t canonical_t) {
    int64_t max;
    if (!PL_get_int64_ex(max_t, &max)) return FALSE;
    wchar_t *root = wide_path(root_t), *path = wide_path(path_t);
    if (!root || !path) { free(root); free(path); return FALSE; }
    if (!beneath(root, path)) { free(root); free(path); return io_error("boundary", ERROR_ACCESS_DENIED); }
    free(root);
    source_lease *s = calloc(1, sizeof(*s));
    if (!s) { free(path); return PL_resource_error("memory"); }
    s->file = INVALID_HANDLE_VALUE; s->path = path;
    wchar_t *parent = _wcsdup(path), *last = wcsrchr(parent, L'\\');
    *last = 0;
    DWORD err = (DWORD)pin_directories(s, parent, 0); free(parent);
    if (err) goto fail;
    s->file = CreateFileW(path, GENERIC_READ, FILE_SHARE_READ|FILE_SHARE_DELETE, NULL, OPEN_EXISTING,
                         FILE_FLAG_OPEN_REPARSE_POINT|FILE_FLAG_SEQUENTIAL_SCAN, NULL);
    if (s->file == INVALID_HANDLE_VALUE) { err = GetLastError(); goto fail; }
    if (!GetFileInformationByHandle(s->file, &s->identity)) { err = GetLastError(); goto fail; }
    if (s->identity.dwFileAttributes & (FILE_ATTRIBUTE_REPARSE_POINT|FILE_ATTRIBUTE_DIRECTORY) ||
        s->identity.nNumberOfLinks != 1) { err = ERROR_ACCESS_DENIED; goto fail; }
    uint64_t size = ((uint64_t)s->identity.nFileSizeHigh << 32) | s->identity.nFileSizeLow;
    if (size > (uint64_t)max) { err = ERROR_FILE_TOO_LARGE; goto fail; }
    char *bytes = malloc((size_t)size + 1);
    if (!bytes) { err = ERROR_NOT_ENOUGH_MEMORY; goto fail; }
    DWORD got;
    if (!ReadFile(s->file, bytes, (DWORD)size, &got, NULL) || got != size) {
        err = GetLastError(); free(bytes); goto fail;
    }
    wchar_t canonical[32768];
    DWORD len = GetFinalPathNameByHandleW(s->file, canonical, 32768, FILE_NAME_NORMALIZED|VOLUME_NAME_DOS);
    if (!len || len >= 32768) { err = ERROR_FILENAME_EXCED_RANGE; free(bytes); goto fail; }
    wchar_t *normal = canonical;
    if (!wcsncmp(normal, L"\\\\?\\", 4)) normal += 4;
    normal[0] = (wchar_t)towlower(normal[0]);
    for (wchar_t *c = normal; *c; c++) if (*c == L'\\') *c = L'/';
    int ok = PL_unify_chars(bytes_t, PL_STRING|REP_ISO_LATIN_1, (size_t)size, bytes) &&
        PL_unify_wchars(canonical_t, PL_ATOM, wcslen(normal), normal) &&
        PL_unify_blob(lease_t, &s, sizeof(s), &lease_type);
    free(bytes);
    if (ok) return TRUE;
    close_lease(s); free(s); return FALSE;
fail:
    close_lease(s); free(s); return io_error("read", err);
}
static foreign_t end_source(term_t token) {
    source_lease *s = get_lease(token);
    if (!s) return FALSE;
    close_lease(s); return TRUE;
}
static foreign_t prepare_directory(term_t token, term_t path_t) {
    source_lease *s = get_lease(token);
    if (!s) return FALSE;
    wchar_t *path = wide_path(path_t);
    if (!path) return FALSE;
    DWORD err = (DWORD)pin_directories(s, path, 1);
    free(path);
    return err ? io_error("managed_directory", err) : TRUE;
}
static foreign_t current_source(term_t token) {
    source_lease *s = get_lease(token);
    if (!s) return FALSE;
    HANDLE h = CreateFileW(s->path, FILE_READ_ATTRIBUTES, FILE_SHARE_READ|FILE_SHARE_WRITE|FILE_SHARE_DELETE,
        NULL, OPEN_EXISTING, FILE_FLAG_OPEN_REPARSE_POINT, NULL);
    if (h == INVALID_HANDLE_VALUE) return io_error("identity", GetLastError());
    BY_HANDLE_FILE_INFORMATION now;
    int ok = GetFileInformationByHandle(h, &now) &&
        now.dwVolumeSerialNumber == s->identity.dwVolumeSerialNumber &&
        now.nFileIndexHigh == s->identity.nFileIndexHigh && now.nFileIndexLow == s->identity.nFileIndexLow;
    CloseHandle(h);
    return ok ? TRUE : io_error("identity", ERROR_FILE_INVALID);
}
static foreign_t decode_text(term_t bytes_t, term_t encoding_t, term_t text_t, term_t lines_t) {
    char *bytes, *encoding; size_t size;
    if (!PL_get_nchars(bytes_t, &size, &bytes, CVT_STRING|CVT_EXCEPTION|REP_ISO_LATIN_1|BUF_RING) ||
        !PL_get_atom_chars(encoding_t, &encoding)) return FALSE;
    int lf = 0, cr = 0, crlf = 0;
    for (size_t i = 0; i < size; i++) {
        if (!bytes[i]) return io_error("nul_character", ERROR_NO_UNICODE_TRANSLATION);
        if (bytes[i] == '\r') {
            if (i + 1 < size && bytes[i+1] == '\n') { crlf = 1; i++; }
            else cr = 1;
        } else if (bytes[i] == '\n') lf = 1;
    }
    const char *newline = lf+cr+crlf > 1 ? "mixed" : crlf ? "crlf" : cr ? "cr" : lf ? "lf" : "none";
    if (!PL_unify_atom_chars(lines_t, newline)) return FALSE;
    if (!strcmp(encoding, "iso_latin_1")) return PL_unify(text_t, bytes_t);
    if (strcmp(encoding, "utf8")) return PL_domain_error("source_encoding", encoding_t);
    if (!size) return PL_unify_chars(text_t, PL_STRING|REP_UTF8, 0, "");
    int n = MultiByteToWideChar(CP_UTF8, MB_ERR_INVALID_CHARS, bytes, (int)size, NULL, 0);
    if (!n) return io_error("invalid_utf8", GetLastError());
    wchar_t *text = malloc((size_t)n * sizeof(wchar_t));
    if (!text) return PL_resource_error("memory");
    MultiByteToWideChar(CP_UTF8, MB_ERR_INVALID_CHARS, bytes, (int)size, text, n);
    int ok = PL_unify_wchars(text_t, PL_STRING, n, text);
    free(text); return ok;
}
static foreign_t encode_text(term_t text_t, term_t encoding_t, term_t bytes_t) {
    char *text, *encoding; size_t n;
    if (!PL_get_atom_chars(encoding_t, &encoding)) return FALSE;
    int flags = !strcmp(encoding, "utf8") ? REP_UTF8 : REP_ISO_LATIN_1;
    if (!PL_get_nchars(text_t, &n, &text, CVT_STRING|CVT_EXCEPTION|BUF_RING|flags)) return FALSE;
    return PL_unify_chars(bytes_t, PL_STRING|REP_ISO_LATIN_1, n, text);
}
static foreign_t publish_source(term_t token, term_t managed_t, term_t stage_t, term_t bytes_t) {
    source_lease *s = get_lease(token);
    if (!s) return FALSE;
    if (s->identity.dwFileAttributes & FILE_ATTRIBUTE_READONLY)
        return io_error("atomic_save", ERROR_ACCESS_DENIED);
    wchar_t *managed = wide_path(managed_t), *stage = wide_path(stage_t);
    char *bytes; size_t size;
    if (!managed || !stage) { free(managed); free(stage); return FALSE; }
    if (!beneath(managed, stage)) { free(managed); free(stage); return io_error("stage_boundary", ERROR_ACCESS_DENIED); }
    if (!PL_get_nchars(bytes_t, &size, &bytes, CVT_STRING|CVT_EXCEPTION|REP_ISO_LATIN_1|BUF_RING)) {
        free(managed); free(stage); return FALSE;
    }
    source_lease work = {0}; work.file = INVALID_HANDLE_VALUE;
    DWORD err = (DWORD)pin_directories(&work, managed, 1);
    HANDLE h = INVALID_HANDLE_VALUE; int created = 0;
    if (err) goto done;
    h = CreateFileW(stage, GENERIC_READ|GENERIC_WRITE|DELETE|WRITE_DAC|WRITE_OWNER, 0, NULL, CREATE_NEW,
                    FILE_ATTRIBUTE_TEMPORARY, NULL);
    if (h == INVALID_HANDLE_VALUE) { err = GetLastError(); goto done; }
    created = 1;
    DWORD written;
    if (size > MAXDWORD || !WriteFile(h, bytes, (DWORD)size, &written, NULL) ||
        written != size || !FlushFileBuffers(h)) { err = GetLastError(); goto done; }
    LARGE_INTEGER zero; zero.QuadPart = 0;
    if (!SetFilePointerEx(h, zero, NULL, FILE_BEGIN)) { err = GetLastError(); goto done; }
    char chunk[65536]; size_t offset = 0;
    while (offset < size) {
        DWORD wanted = (DWORD)((size-offset > sizeof(chunk)) ? sizeof(chunk) : size-offset), got;
        if (!ReadFile(h, chunk, wanted, &got, NULL) || got != wanted ||
            memcmp(chunk, bytes+offset, got)) { err = ERROR_WRITE_FAULT; goto done; }
        offset += got;
    }
    /* A managed-stage directory must not change the source's access policy. */
    SECURITY_INFORMATION security = OWNER_SECURITY_INFORMATION|GROUP_SECURITY_INFORMATION|DACL_SECURITY_INFORMATION;
    DWORD security_size = 0;
    GetKernelObjectSecurity(s->file, security, NULL, 0, &security_size);
    if (!security_size) { err = GetLastError(); goto done; }
    PSECURITY_DESCRIPTOR descriptor = malloc(security_size);
    if (!descriptor) { err = ERROR_NOT_ENOUGH_MEMORY; goto done; }
    if (!GetKernelObjectSecurity(s->file, security, descriptor, security_size, &security_size) ||
        !SetKernelObjectSecurity(h, security, descriptor)) err = GetLastError();
    free(descriptor);
    if (err) goto done;
    FILE_BASIC_INFO basic = {0};
    basic.CreationTime.LowPart = s->identity.ftCreationTime.dwLowDateTime;
    basic.CreationTime.HighPart = s->identity.ftCreationTime.dwHighDateTime;
    basic.FileAttributes = s->identity.dwFileAttributes;
    FILETIME now;
    GetSystemTimePreciseAsFileTime(&now);
    basic.LastWriteTime.LowPart = now.dwLowDateTime;
    basic.LastWriteTime.HighPart = now.dwHighDateTime;
    ULARGE_INTEGER previous;
    previous.LowPart = s->identity.ftLastWriteTime.dwLowDateTime;
    previous.HighPart = s->identity.ftLastWriteTime.dwHighDateTime;
    /* Inventory freshness permits a 2ms timestamp tolerance. A same-size save
       still invalidates that identity even on a fast clock tick or rollback. */
    if ((uint64_t)basic.LastWriteTime.QuadPart < previous.QuadPart + 100000)
        basic.LastWriteTime.QuadPart = (LONGLONG)(previous.QuadPart + 100000);
    if (!SetFileInformationByHandle(h, FileBasicInfo, &basic, sizeof(basic)) || !FlushFileBuffers(h)) {
        err = GetLastError(); goto done;
    }
    /* Recheck after the complete stage is flushed/validated, immediately before
       publication. Ancestors stay pinned; in-place external writes are denied. */
    if (!current_source(token)) {
        CloseHandle(h); DeleteFileW(stage); close_lease(&work);
        free(managed); free(stage); return FALSE;
    }
    size_t n = wcslen(s->path), length = sizeof(FILE_RENAME_INFO) + n * sizeof(wchar_t);
    FILE_RENAME_INFO *info = calloc(1, length);
    if (!info) { err = ERROR_NOT_ENOUGH_MEMORY; goto done; }
    info->Flags = FILE_RENAME_FLAG_REPLACE_IF_EXISTS | FILE_RENAME_FLAG_POSIX_SEMANTICS;
    info->FileNameLength = (DWORD)(n * sizeof(wchar_t));
    memcpy(info->FileName, s->path, n * sizeof(wchar_t));
    if (!SetFileInformationByHandle(h, FileRenameInfoEx, info, (DWORD)length)) err = GetLastError();
    free(info);
    if (!err) created = 0;
done:
    if (h != INVALID_HANDLE_VALUE) CloseHandle(h);
    if (created) DeleteFileW(stage);
    close_lease(&work); free(managed); free(stage);
    return err ? io_error("atomic_save", err) : TRUE;
}
install_t install(void) {
    PL_register_blob_type(&lease_type);
    PL_register_foreign_in_module("kb_source_editor", "editor_native_begin", 6, begin_source, 0);
    PL_register_foreign_in_module("kb_source_editor", "editor_native_end", 1, end_source, 0);
    PL_register_foreign_in_module("kb_source_editor", "editor_native_publish", 4, publish_source, 0);
    PL_register_foreign_in_module("kb_source_editor", "editor_native_prepare", 2, prepare_directory, 0);
    PL_register_foreign_in_module("kb_source_editor", "editor_native_current", 1, current_source, 0);
    PL_register_foreign_in_module("kb_source_editor", "editor_native_decode", 4, decode_text, 0);
    PL_register_foreign_in_module("kb_source_editor", "editor_native_encode", 3, encode_text, 0);
}
