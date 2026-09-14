# Teacher guarded file I/O

The optional `kb_llm_paths_windows.dll` removes a PowerShell process launch from
each Windows agent-file path check. It does not change conversation history,
queue admission, audit records, grants, model routing, or the number of saves.
The public `kb_llm_files.pl` interfaces remain unchanged.

## Measurements

On this Windows checkout, the identical benchmark performed five
`locked_file(File, (read_json(...), atomic_json(...)))` updates. Each document
contained 64 KiB of synthetic history plus queue, completed-call and audit
records. The resulting document and revision were read back before cleanup.
No provider, private conversation, live service, or production sidecar was used.

| Path | Five samples (ms) | Mean (ms) | Median (ms) | Subprocesses |
| --- | --- | ---: | ---: | ---: |
| Original | 845.691, 748.783, 809.615, 813.717, 830.193 | 809.600 | 813.717 | 10 |
| Native checks | 90.286, 82.295, 75.915, 81.832, 79.432 | 81.952 | 81.832 | 0 |

That is approximately 9.9 times faster for this local save workload. It is not
a provider or whole-turn latency guarantee. The remaining work includes the
unchanged JSON encoding, byte writing, hashing, normalization and native
filesystem operations. The optimized path additionally checks cached reads'
paths and size; it does not gain speed by caching a path approval.

Reproduce against the checked-out implementation:

```powershell
swipl -q -g "load_files('prolog/ow_dr/tests/test_llm_files.pl',[silent(true)]),benchmark_llm_files,halt"
```

## Safety and durability

- Repository containment is still checked by `owned_name/2`.
- The native adapter freshly checks the drive root and every path component
  with the Windows attribute API. Reparse points, device aliases, alternate
  streams and ambiguous Win32 names are rejected. Only genuine missing-file or
  missing-parent results allow a not-yet-created path; other native errors are
  returned as structured failures.
- The UTF-16 handling and reparse flag checks follow the existing
  `kb_source_editor_windows.c` adapter. Its source-editor leases and mutation
  APIs are not imported or exposed to the Teacher.
- A missing adapter retains an explicit PowerShell fallback. It also examines
  attributes directly, including dangling junctions, rather than treating
  `File.Exists`/`Directory.Exists` as proof a path is safe.
- Native validation errors never trigger a fallback that could override a
  rejection. There is no persistent or timestamp-based path approval cache.
- `read_json/2` checks path safety and the 1 MiB size limit before hashing, even
  for a content-cache hit. A replaced ancestor junction cannot reuse an earlier
  cached JSON value as authorization.
- `atomic_bytes/2` retains its existing unique same-directory staging,
  `flush_output/1`, close, atomic native replacement and owned-stage cleanup.
  `locked_file/2` retains the existing nonblocking native cross-process lock
  and cleanup. No saves, records or lock boundaries are collapsed.

The existing save routine uses stream flush/close and atomic replacement; it
does not itself call an explicit `fsync`/`FlushFileBuffers`. This change does not
remove a synchronization call or claim a new power-loss durability guarantee.
The path guard remains an immediate check under the existing trusted-host-path
contract, not a handle-pinned sandbox against a malicious same-account process
racing filesystem replacement between checking and opening.

## Optional build and publication

```powershell
.\prolog\ow_dr\build_llm_paths_windows.ps1
```

This uses the installed MSVC x64 tools and SWI SDK, following the repository's
existing native-adapter build pattern. It writes only a unique repository-local
build directory and `kb_llm_paths_windows.dll`; scratch output is cleaned.
Where script execution policy blocks `.ps1`, run the equivalent MSVC command
from the script in an authorized developer command prompt. Do not change machine
execution policy.

The generated DLL is untracked local build output, not a source dependency.
Without it, file operations remain guarded and functional through the slower
fallback. A load failure is reported; it is not treated as a successful native
check. Build before separately coordinated publication. Never overwrite a
loaded clock DLL, unload a live adapter forcibly, or restart/kill a service for
this build.

## Focused validation

```powershell
swipl -q -g "load_files('prolog/ow_dr/tests/test_llm_files.pl',[silent(true)]),run_tests([llm_files]),halt"
```

Tests cover scalar UTF-8 and Unicode filenames, fresh cached-read validation,
real junction replacement and dangling junctions, device/stream rejection,
explicit fallback behavior, native error propagation, zero subprocesses in the
fast path, size rejection before hashing, failed/partial stage cleanup, and
actual contention from a second SWI process. Fixtures are synthetic and remain
inside the repository.
