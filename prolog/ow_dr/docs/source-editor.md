# Original-source editor

This editor writes **only the original file**, on an explicit Save action.
Opening, saving, closing, moving a tab, and splitting a pane do not compile,
validate KB syntax, load, unload, or change the knowledge-base generation.
An incomplete expression is valid editor content. Reload the KB separately.
There is no expression/AST-to-source serializer.

## Integration contract

`kb_source_editor.pl` exports:

- `editor_read(Path, Reply)`
- `editor_save(Request, Reply)`
- `editor_error(Exception, HttpStatus, ErrorReply)`
- `editor_limit(MaxBytes)`

The parent server registers **GET and POST `/api/source/editor`**, mounted with
the application's existing URL-prefix policy. It must retain its existing
localhost/same-origin administration protections, require JSON for POST, reject
cross-origin requests, and disable response caching. This module does not
register routes or start listeners.

GET accepts `path=KBs/...` and returns the complete document:

```json
{
  "path": "KBs/example.krf",
  "text": "(isa Fido Dog)\r\n",
  "revision": "64 lowercase hexadecimal SHA-256 characters",
  "encoding": "iso_latin_1",
  "bom": false,
  "newline": "crlf",
  "sizeBytes": 16,
  "editable": true,
  "reason": "",
  "limits": { "maxBytes": 67108864 },
  "saveSemantics": "file_only"
}
```

The example revision is descriptive, not a usable revision. POST requires
`{path,text,expectedRevision}`. It returns the same identity fields, **without
`text`**, plus `saved` and `unchanged`. Changed content also returns
`cachesStale: true`. An unchanged save does not rewrite the source.

Errors use `{error:{code,message,...}}`. A stale SHA is HTTP 409 with the current
identity under `error.details`, including `revision`; there is no force-overwrite
mode. Native busy locks return 423, unauthorized paths 403, oversized files 413,
and unsupported encoding/newline cases 422. Read/write failures do not return
partial documents or success. A native identity conflict can require another
explicit read to retrieve the new revision.

Allow a JSON request envelope large enough for escaped source text: six times
the 64 MiB source limit plus a small fixed envelope is a conservative byte cap.
Reject larger bodies before JSON decoding. This is a transport bound, not a
promise that an oversized decoded/encoded source will be accepted.

## Reusable browser workspace

Load `source-editor.js` **on demand**, only when visiting Source. Serve these
flat local assets:

- `source-editor.js`, `source-editor.css`
- `codemirror.bundle.js`
- Existing `source-files.js`, `model.js`, `settings.js`, `settings.json`

No CDN, interpreter, framework, runtime package manager, or telemetry is used.

```javascript
const {createSourceEditorWorkspace} = await import('./source-editor.js');
const editor = createSourceEditorWorkspace({
  read: path => apiGetSource(path),
  save: request => apiSaveSource(request),
  renderFileRef: (path, label) => sharedFileRenderer(path, label), // Node or {node}
  onDirtyChange: paths => updateNavigationDirtyState(paths),
  onOpen: path => updateCanonicalSourceRoute(path),
  onSaved: (path, result) => invalidateDisplayedFileMetadata(path),
});
editor.mount(host);
await editor.open('KBs/example.krf', {line: 12});
```

The `read`/`save` callbacks make this component independent of the host's
prefix/auth/request utilities. API errors should be thrown as `Error` objects
with an HTTP `status`; `details` may contain the API's `error` object.
The optional `confirmDiscard(message)` may return a boolean or Promise.
The fallback file display uses `renderSourceFile` from `source-files.js`.

Keep **one workspace instance** while replacing other route content. Move its
`element`, or call `mount(newHost)` to reattach it; do not recreate it on every
Source navigation. Public operations:

| Operation | Behavior |
|---|---|
| `open(path,{line})` | Fetch once, or focus the canonical open document. Returns Promise of document or null on a reported error. |
| `focus(path,line)` | Focus an existing document without a request; optionally jump. |
| `saveActive()` | Save only the focused pane's dirty document. |
| `reloadActive()` | Explicit disk reload; confirms before discarding dirty text. |
| `closeActive()` | Confirm a dirty close; keep other documents. |
| `split('vertical')` | Equal side-by-side panes; moves the existing active view. |
| `split('horizontal')` | Equal stacked panes; moves the existing active view. |
| `hasDirty()`, `dirtyPaths()` | All dirty documents, including parked tabs. |
| `guardNavigation()` | Confirm leaving the editor view without destroying buffers; clean workspaces return true immediately. |
| `destroy()` | Refuses dirty buffers; `destroy({discard:true})` is explicit destructive disposal. |
| `layout`, `getDocument(path)` | Integration/testing inspection. Documents contain live CodeMirror views and are not JSON serializable. |

Classic/modern mode changes must keep this same instance and use CSS changes
and/or `mount(host)`. The workspace retains CodeMirror logical scroll snapshots
through repeated reparenting and through detach/remount; absolute scrollbar
pixels may change when the editor remeasures fonts or pane dimensions. No buffer,
undo history, selection, revision, or dirty marker is replaced by a mode change.

The component registers **no hash/history handlers**. The parent must call its
route guard for navigation that hides/leaves the editor, not for focusing
another retained source tab. It installs a conditional `beforeunload` guard for
all dirty documents and handles Ctrl/Cmd+S while its workspace is visible,
preventing the browser's Save Page action. Dirty state clears when undo returns
to the saved document; failed saves and conflicts retain text, selection, and
undo history. Edits made while a save is pending remain dirty afterward.

Up to four panes and sixteen open documents are supported. The same document
never has two independent buffers: it is moved between panes. Closing a pane
parks its document without discarding it. Tabs retain their actual EditorView,
history, selection, scroll, disk revision, and dirty state. Arrow/Home/End keys
navigate tabs; Delete requests guarded tab closure. Narrow screens stack panes.

## Encodings, newlines, and bounds

- KIF, KRF and MELD use **ISO-8859-1**, matching the existing reader policy.
  UTF-8 is never guessed. Unicode BOMs in these files are rejected explicitly.
- MeTTa uses strict UTF-8. Its optional UTF-8 BOM is removed from editor text and
  restored on save. Invalid UTF-8, NUL bytes, and unrepresentable Latin-1
  characters are rejected, never replaced lossily.
- Uniform LF, CRLF and CR endings are preserved. No-newline files use LF for new
  lines. A save cannot convert an existing newline convention.
- Mixed-newline sources return their **complete original text** but are
  read-only. The visual CodeMirror preview uses LF internally; it cannot save
  that preview. The unchanged original text still round-trips through the
  backend without rewriting. Use an external byte-preserving editor to change
  mixed-newline files.
- Per-source read/write bound: **64 MiB encoded bytes**. It is checked before a
  native read and again after encoding a save. No truncation is performed.
- Workspace admission budget: **256 MiB of opened source bytes**, sixteen
  documents. Undo/history and edits consume additional browser memory.

Bounds were chosen from actual file metadata, not assumed sample sizes:
`KBs/tinyKB.krf` is 8,359,664 bytes; the largest discovered original source was
`KBs/fire/flat-files/nextkb/UniversalVocabularyMt.krf`, 39,816,300 bytes.
These corpus files were not modified or used as write-test fixtures.

CodeMirror's maintained Common Lisp stream mode supplies reader-token
highlighting, strings, escapes, keyword/symbol/number coloring and indentation.
A small local adapter adds genuinely nested `#| ... |#` comments, escaped
`|symbols|`, and visible quote-reader tokens. Bracket matching and explicit
Tab/Enter editing operate locally; there is no Lisp execution, format-on-save,
automatic whole-file reindentation, or MeTTa execution.

## Publication and safety

The backend first reuses `kb_catalog:authorize_sources/2`, which admits only
supported original files rooted at repository `KBs`. A narrow Windows adapter
then opens every ancestor without delete sharing and rejects reparse points,
junctions, non-regular files and multiply-hard-linked source files. The source
is read through one native handle; in-place external writes are denied while
the handle is held. Canonical filesystem spelling is returned for tab identity.

Saves reuse the existing SHA-256, `try_lock/2`, and unique `stage_path/2` helpers.
A same-process mutex plus a nonblocking native cross-process file lock serialize
editor writers. Stable lock files and unique stages live in
`tmp/runtime/source-editor/`, never in the original source tree.

The complete stage is flushed, read back and byte-compared; original security
descriptor and supported attributes are copied. Its mtime advances sufficiently
to invalidate the existing inventory size/time tolerance even for same-sized
edits. Compiler SHA identities and source/catalog/inventory stat identities
therefore become stale naturally. No source inventory, cache, assertion, or
active-generation record is rewritten by Save.

Immediately before atomic native replacement the original path's file identity
is checked again. Failed stages are removed, locks released, and the original
file remains available. Ancestors stay pinned through publication. Stages left
by an abrupt process death are inert managed artifacts, not discoverable KB
sources. No automatic source recovery/overwrite is attempted.

**Platform limits:** the delivered adapter is Windows x64 and requires the
filesystem's `FileRenameInfoEx` POSIX-replacement support. Unsupported
filesystems, security-descriptor changes that cannot be preserved, and
read-only/sharing failures fail closed. There is no less-safe portable fallback.
Windows atomic replacement requires delete sharing: a noncooperating external
program can theoretically rename the leaf in the very small final identity
check/replacement interval. The per-source native lock eliminates that interval
between editor clients; it cannot make unrelated external programs participate
in the protocol. In-place external writes and ancestor swaps are blocked.

## Assets and verification

The flat bundle is generated from pinned development-only dependencies:
CodeMirror state 6.7.4, view 6.43.11, language 6.12.4, commands 6.11.0,
legacy-modes 6.5.4, Lezer highlight 1.2.3, and esbuild 0.28.2.
`package-lock.json` pins transitive packages and integrity values.
`codemirror.LICENSE.txt` contains the MIT notices, exact bundled versions,
registry provenance and integrity hashes. esbuild is only a build tool.

Rebuild only when changing the editor dependency bundle:

```powershell
Set-Location prolog\ow_dr\web
npm.cmd ci --ignore-scripts --no-audit --no-fund
npm.cmd run build:editor
```

Rebuild the native adapter with installed Visual C++ x64 Build Tools:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File prolog\ow_dr\build_source_editor_windows.ps1
```

Focused tests from the repository root:

```powershell
swipl -q -s prolog\ow_dr\tests\test_source_editor_api.pl -g run_tests -t halt
node --test prolog\ow_dr\tests\source-editor.browser.test.mjs
```

PL-Unit creates unique fake repositories under the application test-artifact
directory. It verifies byte/BOM/newline round trips, conflicts, path rejection,
native locks, junctions, write failures, size bounds and real HTTP behavior.
The API test first loads a real fixture assertion, then saves syntactically
incomplete text and verifies that the loaded assertion IDs/generation remain
unchanged. The browser test uses the existing isolated Chromium helper, a local
fixture server, and in-memory disk callbacks; it never calls a live save API.
It checks real CM contenteditable, tabs, dirty close/navigation/unload guards,
undo/redo, splits, Classic-style reparent/detach with dirty buffers and logical
scroll anchors preserved, line jump/scroll preservation, shortcut handling, Common Lisp
tokens, CRLF saves, explicit disk discard, and narrow-screen overflow.

A synthetic 8,442,000-character/126,001-line source opened and jumped in
44–78 ms across isolated Chromium runs on this machine (not an HTTP download/startup
benchmark). All fixture servers/profiles are closed by test cleanup.
