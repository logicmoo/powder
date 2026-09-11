# powder

**Paraconsistent Open World Defeasible Epistemic Reasoner**

A local SWI-Prolog knowledge-base compiler, guarded assertion runtime, and
browser for KIF, KRF/MELD, and inert MeTTa data.

The implementation is in `prolog\ow_dr`. Original sources and their saved
statistics remain in `KBs`; generated loading caches mirror that tree under
`tmp\KBs`, using `.data` and `.index.data` companions. The initial source is
`KBs\sumo\tinyKB.kif`. See [KB organization](KBs/docs/README.md).

```powershell
swipl .\prolog\ow_dr\app.pl
swipl .\prolog\ow_dr\compile_kb.pl -- KBs
```

The browser opens at **http://localhost:3050/**. See the
[implementation guide](prolog/ow_dr/README.md) for source dialects, cache
recovery, querying, Settings, application-code reload, and current limitations.
