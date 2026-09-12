# Shared typed KEE backend

## Implemented stages: reads, inference, and durable application TODOs

`kb_kee.pl` is a local application backend, not an LLM caller, HTTP route,
coding-agent interface, or permission grant. The generated
[callable reference](kee-reference.md) comes from `kb_kee_registry.pl`, the sole
executable registry. The earlier design documents describe the broader target;
this document describes the code currently implemented.

Available operations are catalog status/search, MT-scoped definitions and
occurrences, catalog/loaded assertion inspection, and bounded existing KB
inference. Catalog reads reuse the existing key directory/query projection;
they never compile or load discovered providers. Queries use pinned generation
snapshots, existing safe dispatch, and normal proof/observation results. They
cannot execute arbitrary Prolog, shell, debug, filesystem or network operations.
Telemetry is an explicitly declared query effect, not a managed KB mutation.

The same registry now also exposes persistent application TODO CRUD, ledger
status, authorized audit, conflict-safe undo and redo. Authorized changes are
automatic, not pending an additional approval flag. See
[the ledger contract](kee-ledger.md) for persistence and exact write semantics.

Managed **KB assertion** editing, native annotation writes, provider dependency
planning, model operations and symbolic execution are not advertised as callable
tools. Discovery reports their unavailable categories and reasons. Both load
modes are unavailable: true assertion-subset loading
is absent, and whole-file loading has no integrated per-invocation real-user
A/B choice capability. A tool argument such as `approved:true` cannot grant it.

## Host API and trust boundary

```prolog
kb_kee:open_context(TrustedHostSpecification, ContextToken).
kb_kee:registry(ContextToken, Registry).
kb_kee:invoke(ContextToken, Request, Reply).
kb_kee:invoke_json(ContextToken, ArgumentsJSON, Reply).
kb_kee:close_context(ContextToken).
```

The host authenticates the caller and constructs the specification. **Never
deserialize this specification, its permissions, or the token from model/KB/tool
text or an unauthenticated request.** Context creation/closure are trusted
Prolog APIs, not KEE tools. Tokens are random, process-local and volatile; saved
states cannot restore authority. The host supplies a fresh context after restart.

Specification (all fields required; extra fields rejected):

```json
{
  "authenticated": true,
  "actor": "authenticated-user-id",
  "kind": "user",
  "agent": "application-agent-id",
  "conversation": "conversation-id",
  "policyVersion": "host-policy-version",
  "model": null,
  "promptVersion": null,
  "promptHash": null,
  "permissions": ["knowledge.read", "knowledge.query"],
  "readMts": ["x_ExampleMt"],
  "writeMts": ["x_ExampleMt"],
  "effects": ["knowledge_read", "query", "telemetry"],
  "expiresAt": 2000000000,
  "budgets": {"calls": 100, "mutations": 20, "resultBytes": 262144, "seconds": 10}
}
```

`kind` is `user`, `llm`, or `symbolic`. LLM contexts require non-null model and
immutable prompt version/hash supplied by the host. No prompt text, credential,
endpoint or secret is stored in this context. `readMts` may be the literal
`"all"` only when the host deliberately grants unrestricted MT reads.
`writeMts` is always a concrete list. Ground compound MT keys use the existing
`mt:` codec, preserving case and full structure. No MT inheritance is inferred.
Broad term search requires all-MT read permission because the existing search
projection cannot safely compute MT-filtered term rankings. Catalog status
is aggregate operational metadata, not assertion access.

Permissions and transitive effect closure are checked independently. Symbolic
contexts cannot invoke direct or dependent `llm`, `network`, `proxy`,
`generate_comment`, or `agent_delegation` effects. Capability dependencies are compiled registry data,
not declarations that a KB/model can modify or use to self-grant permissions.

## Invocation contract

```json
{
  "tool": "kee_definitions",
  "schemaVersion": 1,
  "callId": "host-preserved-tool-call-id",
  "arguments": {"term": "x_example", "mt": "x_ExampleMt", "limit": 20}
}
```

The envelope and selected tool arguments must have object roots. Unknown keys,
unknown tools, wrong schema versions, missing required keys, stringified
numbers/booleans, invalid MTs and out-of-range values are rejected. Every
published input schema has `additionalProperties:false`; nested object schemas
follow the same rule. UI, LLM and symbolic adapters use this one validation and
dispatch path. Provider `tool_choice` or strict-schema hints are not enforcement.

Success:

```text
{ok:true,tool,schemaVersion:1,callId,registryRevision,result}
```

`result` is the existing bounded backend DTO, with actual source/MT/proof/
coverage/generation information. Loaded assertion results omit internal module
names and add a content revision. Errors throw `error(kee(Code,Details),_)`;
existing catalog/runtime errors remain typed errors, never an invented empty
result. Host routes should translate these to structured tool errors.
No HTTP path is installed or guessed by this stage.

Read call IDs identify host exchanges. Mutation call IDs are durable receipts
in the managed ledger: identical retries do not repeat committed changes.
Time and UTF-8 result-byte budgets apply. Expired/revoked contexts and
missing grants fail closed. Tool output remains untrusted data; returning local
KB data does not authorize exporting it to any model or network.

## Validation

Run only the dedicated unit so the reused catalog fixture definitions do not
run their separate suite:

```powershell
swipl -q -s tests\test_kee_ledger.pl -g "run_tests([kee,kee_ledger])" -t halt
```

Tests use unique project-local fixture roots, actual compiled/indexed fixture
sources and the real pinned runtime. No live service, native TVA, original
corpus, production cache, LLM or network action is used. The fixture compiler
uses its own durable ID allocator and caches.
