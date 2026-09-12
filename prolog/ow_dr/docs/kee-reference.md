# KEE callable reference

Generated from `kb_kee_registry.pl`; revision `66160f8c661314d81f1a1787bae274bdfab1df2215be15a054d3132c607673ca`.

| Tool | Schema | Permission | Scope | Effects |
|---|---|---|---|---|
| `kee_catalog_status` | 1 | `[knowledge.read]` | `all_metadata` | `[knowledge_read]` |
| `kee_find_terms` | 1 | `[knowledge.read]` | `all_read_mts` | `[knowledge_read]` |
| `kee_definitions` | 1 | `[knowledge.read]` | `read_mt` | `[knowledge_read]` |
| `kee_occurrences` | 1 | `[knowledge.read]` | `read_mt` | `[knowledge_read]` |
| `kee_catalog_assertion` | 1 | `[knowledge.read]` | `read_mt` | `[knowledge_read]` |
| `kee_assertion` | 1 | `[knowledge.read]` | `read_mt` | `[knowledge_read]` |
| `kee_query` | 1 | `[knowledge.query]` | `read_mt` | `[knowledge_read,query,telemetry]` |
| `kee_ledger_status` | 1 | `[changeset.read]` | `all_metadata` | `[application_read]` |
| `kee_todo_list` | 1 | `[todo.read]` | `read_mt` | `[application_read]` |
| `kee_todo_get` | 1 | `[todo.read]` | `resource_read` | `[application_read]` |
| `kee_todo_create` | 1 | `[todo.write]` | `write_mt` | `[application_write]` |
| `kee_todo_update` | 1 | `[todo.write]` | `write_mt` | `[application_write]` |
| `kee_todo_delete` | 1 | `[todo.write]` | `resource_write` | `[application_write]` |
| `kee_audit` | 1 | `[changeset.read]` | `read_mt` | `[application_read]` |
| `kee_undo` | 1 | `[changeset.undo,todo.write]` | `resource_write` | `[application_write]` |
| `kee_redo` | 1 | `[changeset.undo,todo.write]` | `resource_write` | `[application_write]` |

## `kee_catalog_status`

Inspect catalog coverage and freshness.

```json
{"additionalProperties":false,"properties": {},"required": [],"type":"object"}
```

## `kee_find_terms`

Find terms in the published all-file catalog.

```json
{
  "additionalProperties":false,
  "properties": {
    "group": {
      "enum": [
	"all",
	"predicates",
	"functions",
	"collections",
	"microtheories",
	"external_symbols",
	"do_invocations",
	"typed_other",
	"individuals",
	"unclassified"
      ],
      "type":"string"
    },
    "limit": {"maximum":100,"minimum":1,"type":"integer"},
    "offset": {"maximum":1000000,"minimum":0,"type":"integer"},
    "q": {"maxLength":256,"minLength":0,"type":"string"},
    "scope": {"enum": ["all", "loaded", "unloaded" ],"type":"string"}
  },
  "required": ["q" ],
  "type":"object"
}
```

## `kee_definitions`

Read source-verified definitions in one explicit MT.

```json
{
  "additionalProperties":false,
  "properties": {
    "limit": {"maximum":100,"minimum":1,"type":"integer"},
    "mt": {"maxLength":4096,"minLength":1,"type":"string"},
    "offset": {"maximum":1000000,"minimum":0,"type":"integer"},
    "scope": {"enum": ["all", "loaded", "unloaded" ],"type":"string"},
    "term": {"maxLength":4096,"minLength":1,"type":"string"}
  },
  "required": ["term", "mt" ],
  "type":"object"
}
```

## `kee_occurrences`

Read semantic occurrences in one explicit MT.

```json
{
  "additionalProperties":false,
  "properties": {
    "limit": {"maximum":100,"minimum":1,"type":"integer"},
    "mt": {"maxLength":4096,"minLength":1,"type":"string"},
    "offset": {"maximum":1000000,"minimum":0,"type":"integer"},
    "scope": {"enum": ["all", "loaded", "unloaded" ],"type":"string"},
    "term": {"maxLength":4096,"minLength":1,"type":"string"}
  },
  "required": ["term", "mt" ],
  "type":"object"
}
```

## `kee_catalog_assertion`

Read one source-verified catalog assertion.

```json
{
  "additionalProperties":false,
  "properties": {
    "id": {"maxLength":128,"minLength":1,"type":"string"},
    "mt": {"maxLength":4096,"minLength":1,"type":"string"},
    "source": {"maxLength":4096,"minLength":1,"type":"string"},
    "term": {"maxLength":4096,"minLength":1,"type":"string"}
  },
  "required": ["term", "source", "id", "mt" ],
  "type":"object"
}
```

## `kee_assertion`

Read one loaded assertion at an expected generation.

```json
{
  "additionalProperties":false,
  "properties": {
    "generation": {"maximum":9007199254740991,"minimum":0,"type":"integer"},
    "id": {"maxLength":128,"minLength":1,"type":"string"},
    "mt": {"maxLength":4096,"minLength":1,"type":"string"}
  },
  "required": ["id", "mt", "generation" ],
  "type":"object"
}
```

## `kee_query`

Execute bounded KB inference in one explicit MT.

```json
{
  "additionalProperties":false,
  "properties": {
    "generation": {"maximum":9007199254740991,"minimum":0,"type":"integer"},
    "limit": {"maximum":100,"minimum":1,"type":"integer"},
    "mt": {"maxLength":4096,"minLength":1,"type":"string"},
    "query": {"maxLength":16384,"minLength":1,"type":"string"},
    "seconds": {"maximum":30,"minimum":0.01,"type":"number"}
  },
  "required": ["query", "mt", "generation" ],
  "type":"object"
}
```

## `kee_ledger_status`

Inspect managed application ledger revision and counts.

```json
{"additionalProperties":false,"properties": {},"required": [],"type":"object"}
```

## `kee_todo_list`

List persistent application TODOs in one scope.

```json
{
  "additionalProperties":false,
  "properties": {
    "limit": {"maximum":100,"minimum":1,"type":"integer"},
    "mt": {"anyOf": [ {"type":"null"},  {"maxLength":4096,"minLength":1,"type":"string"} ]},
    "offset": {"maximum":1000000,"minimum":0,"type":"integer"},
    "status": {"enum": ["open", "in_progress", "blocked", "done", "cancelled" ],"type":"string"}
  },
  "required": ["mt" ],
  "type":"object"
}
```

## `kee_todo_get`

Inspect one persistent application TODO.

```json
{
  "additionalProperties":false,
  "properties": {"id": {"maxLength":128,"minLength":1,"type":"string"}},
  "required": ["id" ],
  "type":"object"
}
```

## `kee_todo_create`

Create an audited application TODO automatically.

```json
{
  "additionalProperties":false,
  "properties": {
    "data": {
      "additionalProperties":false,
      "properties": {
	"acceptance": {
	  "items": {
	    "additionalProperties":false,
	    "properties": {
	      "given": {"maxLength":4096,"minLength":1,"type":"string"},
	      "then": {"maxLength":4096,"minLength":1,"type":"string"},
	      "when": {"maxLength":4096,"minLength":1,"type":"string"}
	    },
	    "required": ["given", "when", "then" ],
	    "type":"object"
	  },
	  "maxItems":100,
	  "type":"array"
	},
	"dependencies": {
	  "items": {"maxLength":128,"minLength":1,"type":"string"},
	  "maxItems":100,
	  "type":"array"
	},
	"description": {"maxLength":16000,"minLength":0,"type":"string"},
	"evidence": {
	  "items": {
	    "additionalProperties":false,
	    "properties": {
	      "kind": {"enum": ["assertion", "query", "changeset", "reference" ],"type":"string"},
	      "note": {"maxLength":4096,"minLength":0,"type":"string"},
	      "reference": {"maxLength":1024,"minLength":1,"type":"string"}
	    },
	    "required": ["kind", "reference", "note" ],
	    "type":"object"
	  },
	  "maxItems":100,
	  "type":"array"
	},
	"links": {
	  "additionalProperties":false,
	  "properties": {
	    "agent": {"anyOf": [ {"type":"null"},  {"maxLength":256,"minLength":1,"type":"string"} ]},
	    "assertions": {
	      "items": {"maxLength":128,"minLength":1,"type":"string"},
	      "maxItems":100,
	      "type":"array"
	    },
	    "changesets": {
	      "items": {"maxLength":128,"minLength":1,"type":"string"},
	      "maxItems":100,
	      "type":"array"
	    },
	    "conversation": {"anyOf": [ {"type":"null"},  {"maxLength":256,"minLength":1,"type":"string"} ]}
	  },
	  "required": ["conversation", "agent", "changesets", "assertions" ],
	  "type":"object"
	},
	"priority": {"maximum":100,"minimum":0,"type":"integer"},
	"status": {"enum": ["open", "in_progress", "blocked", "done", "cancelled" ],"type":"string"},
	"title": {"maxLength":256,"minLength":1,"type":"string"}
      },
      "required": [
	"title",
	"description",
	"status",
	"priority",
	"dependencies",
	"evidence",
	"acceptance",
	"links"
      ],
      "type":"object"
    },
    "mt": {"anyOf": [ {"type":"null"},  {"maxLength":4096,"minLength":1,"type":"string"} ]},
    "revision": {"maxLength":64,"minLength":64,"type":"string"}
  },
  "required": ["revision", "mt", "data" ],
  "type":"object"
}
```

## `kee_todo_update`

Replace an application TODO at an expected revision.

```json
{
  "additionalProperties":false,
  "properties": {
    "data": {
      "additionalProperties":false,
      "properties": {
	"acceptance": {
	  "items": {
	    "additionalProperties":false,
	    "properties": {
	      "given": {"maxLength":4096,"minLength":1,"type":"string"},
	      "then": {"maxLength":4096,"minLength":1,"type":"string"},
	      "when": {"maxLength":4096,"minLength":1,"type":"string"}
	    },
	    "required": ["given", "when", "then" ],
	    "type":"object"
	  },
	  "maxItems":100,
	  "type":"array"
	},
	"dependencies": {
	  "items": {"maxLength":128,"minLength":1,"type":"string"},
	  "maxItems":100,
	  "type":"array"
	},
	"description": {"maxLength":16000,"minLength":0,"type":"string"},
	"evidence": {
	  "items": {
	    "additionalProperties":false,
	    "properties": {
	      "kind": {"enum": ["assertion", "query", "changeset", "reference" ],"type":"string"},
	      "note": {"maxLength":4096,"minLength":0,"type":"string"},
	      "reference": {"maxLength":1024,"minLength":1,"type":"string"}
	    },
	    "required": ["kind", "reference", "note" ],
	    "type":"object"
	  },
	  "maxItems":100,
	  "type":"array"
	},
	"links": {
	  "additionalProperties":false,
	  "properties": {
	    "agent": {"anyOf": [ {"type":"null"},  {"maxLength":256,"minLength":1,"type":"string"} ]},
	    "assertions": {
	      "items": {"maxLength":128,"minLength":1,"type":"string"},
	      "maxItems":100,
	      "type":"array"
	    },
	    "changesets": {
	      "items": {"maxLength":128,"minLength":1,"type":"string"},
	      "maxItems":100,
	      "type":"array"
	    },
	    "conversation": {"anyOf": [ {"type":"null"},  {"maxLength":256,"minLength":1,"type":"string"} ]}
	  },
	  "required": ["conversation", "agent", "changesets", "assertions" ],
	  "type":"object"
	},
	"priority": {"maximum":100,"minimum":0,"type":"integer"},
	"status": {"enum": ["open", "in_progress", "blocked", "done", "cancelled" ],"type":"string"},
	"title": {"maxLength":256,"minLength":1,"type":"string"}
      },
      "required": [
	"title",
	"description",
	"status",
	"priority",
	"dependencies",
	"evidence",
	"acceptance",
	"links"
      ],
      "type":"object"
    },
    "id": {"maxLength":128,"minLength":1,"type":"string"},
    "mt": {"anyOf": [ {"type":"null"},  {"maxLength":4096,"minLength":1,"type":"string"} ]},
    "resourceRevision": {"maxLength":64,"minLength":64,"type":"string"},
    "revision": {"maxLength":64,"minLength":64,"type":"string"}
  },
  "required": ["revision", "id", "resourceRevision", "mt", "data" ],
  "type":"object"
}
```

## `kee_todo_delete`

Tombstone an application TODO without deleting its audit history.

```json
{
  "additionalProperties":false,
  "properties": {
    "id": {"maxLength":128,"minLength":1,"type":"string"},
    "resourceRevision": {"maxLength":64,"minLength":64,"type":"string"},
    "revision": {"maxLength":64,"minLength":64,"type":"string"}
  },
  "required": ["revision", "id", "resourceRevision" ],
  "type":"object"
}
```

## `kee_audit`

Read MT-authorized managed application changesets.

```json
{
  "additionalProperties":false,
  "properties": {
    "limit": {"maximum":100,"minimum":1,"type":"integer"},
    "mt": {"anyOf": [ {"type":"null"},  {"maxLength":4096,"minLength":1,"type":"string"} ]},
    "offset": {"maximum":1000000,"minimum":0,"type":"integer"}
  },
  "required": ["mt" ],
  "type":"object"
}
```

## `kee_undo`

Undo a TODO changeset only when affected versions still match.

```json
{
  "additionalProperties":false,
  "properties": {
    "changeset": {"maxLength":128,"minLength":1,"type":"string"},
    "revision": {"maxLength":64,"minLength":64,"type":"string"}
  },
  "required": ["revision", "changeset" ],
  "type":"object"
}
```

## `kee_redo`

Redo an undo changeset only when affected versions still match.

```json
{
  "additionalProperties":false,
  "properties": {
    "changeset": {"maxLength":128,"minLength":1,"type":"string"},
    "revision": {"maxLength":64,"minLength":64,"type":"string"}
  },
  "required": ["revision", "changeset" ],
  "type":"object"
}
```
