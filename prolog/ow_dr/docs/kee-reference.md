# KEE callable reference

Generated from `kb_kee_registry.pl`; revision `0c6834d4b31242c3e64549e4615a831276dbc9694fbec16ffc93abe8c77182eb`.

| Tool | Schema | Permission | Scope | Effects |
|---|---|---|---|---|
| `kee_catalog_status` | 1 | `knowledge.read` | `all_metadata` | `[knowledge_read]` |
| `kee_find_terms` | 1 | `knowledge.read` | `all_read_mts` | `[knowledge_read]` |
| `kee_definitions` | 1 | `knowledge.read` | `read_mt` | `[knowledge_read]` |
| `kee_occurrences` | 1 | `knowledge.read` | `read_mt` | `[knowledge_read]` |
| `kee_catalog_assertion` | 1 | `knowledge.read` | `read_mt` | `[knowledge_read]` |
| `kee_assertion` | 1 | `knowledge.read` | `read_mt` | `[knowledge_read]` |
| `kee_query` | 1 | `knowledge.query` | `read_mt` | `[knowledge_read,query,telemetry]` |

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
