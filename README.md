# powder

**Paraconsistent Open World Defeasible Epistemic Reasoner**

A local SWI-Prolog knowledge-base compiler, guarded assertion runtime, and
browser for KIF, KRF, and inert MeTTa data.

The implementation remains in `prolog\ow_dr`, and the original corpus remains
in `KBs`. This rebrand does not rename source predicates, public APIs, durable
assertion IDs, cache formats, or saved browser preferences.

```powershell
swipl .\prolog\ow_dr\app.pl
swipl .\prolog\ow_dr\compile_kb.pl -- KBs
```

The browser opens at **http://localhost:3050/swish/powder/**. See the
[implementation guide](prolog/ow_dr/README.md) for source dialects, cache
recovery, querying, Settings, application-code reload, and current limitations.
