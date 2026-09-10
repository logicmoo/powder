"""Supplement retained corpus identities; never read/recompile KB payloads."""
import collections
import argparse
import json
import os
from pathlib import Path
import sqlite3
import subprocess
import time

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument("--report-directory", type=Path, required=True)
args = parser.parse_args()
ROOT = Path(__file__).resolve().parents[2]
REPORT = args.report_directory.resolve()
started = time.perf_counter()
db = sqlite3.connect("file:" + str(REPORT / "unique-forms.sqlite") + "?mode=ro", uri=True)
db.execute("PRAGMA cache_size=-16384")
projection = REPORT / "retained-rule-forms.pl"
with projection.open("w", encoding="utf-8", newline="\n") as out:
    for form_id, canonical in db.execute("SELECT id,canonical FROM forms WHERE kind!='gaf'"):
        text = canonical.decode("utf-8").rstrip()
        if not text.endswith("."):
            raise ValueError(f"Malformed canonical form {form_id}")
        out.write(f"inventory_form({form_id},{text[:-1]}).\n")
classified = REPORT / "retained-rule-classification.ndjson"
goal = f"project_retained_forms('{projection.as_posix()}','{classified.as_posix()}'),halt"
subprocess.run(["swipl", "-q", "-s", str(ROOT / "prolog/ow_dr/kb_inventory_rules.pl"), "-g", goal], check=True)
classes = {}
with classified.open(encoding="utf-8") as stream:
    for line in stream:
        row = json.loads(line)
        if row["semanticRule"]:
            classes[row["formId"]] = row

def counter():
    return collections.Counter()

def increment(counts, kind, executable=False, head_count=0):
    counts["occurrenceCount"] += 1
    if kind == "gaf":
        counts["gafCount"] += 1
    elif kind == "other":
        counts["otherCount"] += 1
    else:
        counts["semanticRuleCount"] += 1
        counts["executableRuleCount"] += int(executable)
        counts["logicalRuleDataCount"] += int(not executable)
        counts["headReferenceCount"] += head_count
        counts["rulesWithoutHeadReferences"] += int(head_count == 0)
        counts[kind] += 1

def complete(counts):
    values = dict(counts)
    for field in ("occurrenceCount", "semanticRuleCount", "executableRuleCount", "logicalRuleDataCount",
                  "gafCount", "otherCount", "headReferenceCount", "rulesWithoutHeadReferences"):
        values.setdefault(field, 0)
    assert values["occurrenceCount"] == values["semanticRuleCount"] + values["gafCount"] + values["otherCount"]
    return values

total = counter()
by_source = collections.defaultdict(counter)
by_mt = collections.defaultdict(counter)
heads_source = collections.defaultdict(counter)
heads_mt = collections.defaultdict(counter)
coverage = json.loads((REPORT / "projection-status.json").read_text(encoding="utf-8"))
for source in coverage["sources"]:
    if source["status"] != "complete":
        raise ValueError("This complete-coverage supplement requires complete retained projection evidence")
    by_source[source["source"]]  # Include sources with zero assertions.
evidence = REPORT / "semantic-rule-occurrences.ndjson"
with (REPORT / "assertion-identities.ndjson").open(encoding="utf-8") as stream, evidence.open("w", encoding="utf-8", newline="\n") as out:
    for line in stream:
        row = json.loads(line)
        info = None
        if row["kind"] != "gaf":
            (form_id,) = db.execute("SELECT id FROM forms WHERE hash=? AND canonical=?",
                                   (row["hash"], row["canonical"].encode("utf-8"))).fetchone()
            info = classes.get(form_id)
        kind = info["kind"] if info else ("gaf" if row["kind"] == "gaf" else "other")
        executable = info["executableRule"] if info else False
        for counts in (total, by_source[row["source"]], by_mt[row["mt"]]):
            increment(counts, kind, executable, len(info["heads"]) if info else 0)
        if info:
            out.write(json.dumps({**row, "classification": info}, ensure_ascii=False, separators=(",", ":")) + "\n")
            for head in info["heads"]:
                key = json.dumps(head, ensure_ascii=False, sort_keys=True)
                heads_source[row["source"]][key] += 1
                heads_mt[row["mt"]][key] += 1

unique_forms = counter()
for form_id, kind in db.execute("SELECT id,kind FROM forms"):
    info = classes.get(form_id)
    increment(unique_forms, info["kind"] if info else ("gaf" if kind == "gaf" else "other"),
              info["executableRule"] if info else False, len(info["heads"]) if info else 0)
unique_assertions = counter()
unique_mt = collections.defaultdict(counter)
for form_id, mt, kind in db.execute("SELECT a.form_id,a.mt,f.kind FROM assertions a JOIN forms f ON f.id=a.form_id"):
    info = classes.get(form_id)
    kind = info["kind"] if info else ("gaf" if kind == "gaf" else "other")
    for counts in (unique_assertions, unique_mt[mt]):
        increment(counts, kind, info["executableRule"] if info else False, len(info["heads"]) if info else 0)

semantics = {
    "ruleCount": "Legacy field means executable <===/x_cid_io occurrences ONLY; see compiledSemanticCounts.semanticRuleCount for logical rule-shaped assertions.",
    "semanticRuleCount": "Executable envelopes plus positive implication, biconditional and preserved <== rule-shaped operator data; counted once per assertion, not per conclusion.",
    "logicalRuleDataCount": "Non-executable asserted formulas/operator data. No translation, committed choice, inference or runtime behavior is enabled.",
    "heads": "Syntactic consequent/head leaf references, preserving polarity and side. Multiple/disjunctive conclusions can contribute multiple references; these are not separately asserted facts.",
    "otherCount": "Excludes the recognized semantic rules in this supplement. Legacy otherCount remains unchanged.",
}

def atomic_json(path, data):
    stage = path.with_name(path.name + ".rule-count-stage")
    with stage.open("w", encoding="utf-8", newline="\n") as out:
        json.dump(data, out, ensure_ascii=False, separators=(",", ":"))
        out.write("\n")
        out.flush()
        os.fsync(out.fileno())
    os.replace(stage, path)

def heads_json(counts):
    return [{**json.loads(key), "referenceCount": count} for key, count in sorted(counts.items())]

def unique_counts(counts, total_field):
    data = complete(counts)
    data[total_field] = data.pop("occurrenceCount")
    return data

for source, counts in by_source.items():
    path = Path(source + ".inventory.json")
    if not path.resolve().is_relative_to((ROOT / "KBs").resolve()):
        raise ValueError(f"Sidecar is outside this repository's KB root: {path}")
    data = json.loads(path.read_text(encoding="utf-8"))
    if data.get("schema") != "powder.kb-inventory.v1":
        raise ValueError(f"Not a generated inventory sidecar: {path}")
    data["countSemantics"] = semantics
    data["compiledSemanticCounts"] = complete(counts)
    data["compiledRuleHeads"] = heads_json(heads_source[source])
    atomic_json(path, data)

result = {
    "schema": "powder.semantic-rule-counts.v1",
    "coverage": "complete",
    "sourceCount": len(by_source),
    "occurrences": complete(total),
    "uniqueForms": unique_counts(unique_forms, "formCount"),
    "uniqueFormMicrotheoryAssertions": unique_counts(unique_assertions, "assertionCount"),
    "countSemantics": semantics,
    "evidence": str(evidence),
    "elapsedSeconds": time.perf_counter() - started,
}
catalog_path = ROOT / "KBs/microtheory/_catalog.json"
catalog = json.loads(catalog_path.read_text(encoding="utf-8"))
catalog["semanticRuleCounts"] = result
catalog["countSemantics"] = semantics
written = 0
for entry in catalog["entries"]:
    mt = entry["key"]
    entry["compiledSemanticCounts"] = complete(by_mt[mt])
    entry["compiledUniqueSemanticCounts"] = unique_counts(unique_mt[mt], "assertionCount")
    path = catalog_path.parent / entry["filename"]
    if not path.resolve().is_relative_to(catalog_path.parent.resolve()):
        raise ValueError(f"MT catalog filename escapes its directory: {path}")
    data = json.loads(path.read_text(encoding="utf-8"))
    if data.get("key") != mt or data.get("schema") != "powder.kb-inventory.v1":
        raise ValueError(f"Unexpected MT identity: {path}")
    data["countSemantics"] = semantics
    data["compiledSemanticCounts"] = entry["compiledSemanticCounts"]
    data["compiledUniqueSemanticCounts"] = entry["compiledUniqueSemanticCounts"]
    data["compiledRuleHeads"] = heads_json(heads_mt[mt])
    atomic_json(path, data)
    written += 1
atomic_json(catalog_path, catalog)
unique_path = REPORT / "unique-assertion-counts.json"
unique = json.loads(unique_path.read_text(encoding="utf-8"))
unique["semanticRuleCounts"] = result
unique["countSemantics"] = semantics
atomic_json(unique_path, unique)
summary_path = REPORT / "summary.json"
summary = json.loads(summary_path.read_text(encoding="utf-8"))
summary["uniqueAssertionCounts"] = unique
summary["semanticRuleCounts"] = result
summary["countSemantics"] = semantics
atomic_json(summary_path, summary)
result["microtheoryFilesUpdated"] = written
result["sourceSidecarsUpdated"] = len(by_source)
result["elapsedSeconds"] = time.perf_counter() - started
atomic_json(REPORT / "semantic-rule-counts.json", result)
db.close()
print(json.dumps(result, indent=2))
