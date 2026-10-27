"""Render per-program evidence and comparison leads without claiming equivalence.

Counter/list differences are review leads, never proof that COBOL logic is absent.
Owned by prompt/system2/01_ARCHITECTURE_AND_CONTRACTS.md.
"""
from __future__ import annotations

from collections import Counter
from pathlib import Path
import re

from knowledge_core import GUIDES, KNOWLEDGE, TOPICS, ev, hash_json, write_json, write_text
from knowledge_extract import canonical, mask_literals


def safe(text: object) -> str:
    return str(text).replace("|", "\\|").replace("\n", " ").replace("`", "'")


def evidence_label(analysis: dict, evidence: dict) -> str:
    item = next(a for a in analysis["artifacts"] if a["artifact_id"] == evidence["artifact_id"])
    return f"`{item['path']}:L{evidence['start_line']}-L{evidence['end_line']}` (SHA-256 `{item['sha256'][:16]}...`)"


def comparison_leads(analysis: dict) -> list[dict]:
    artifacts = {a["role"]: a for a in analysis["artifacts"] if "profile" in a}
    leads = []
    def add(topic: str, title: str, evidence: list[dict], details: dict | None = None) -> None:
        signature = hash_json([topic, title, evidence])[:14]
        leads.append({"lead_id": "LEAD-" + signature, "topic": topic, "title": title,
                      "status": "REVIEW_REQUIRED", "evidence": evidence, "details": details or {},
                      "candidate_owner_guide": GUIDES[topic], "root_cause_status": "NOT_ESTABLISHED"})
    for role, item in artifacts.items():
        p = item["profile"]
        for call in p["unresolved_calls"]:
            add("paragraph_wiring", f"{role}: PERFORM target not resolved in this member: {call['target']}",
                [ev(item, call["start_line"], call["end_line"])],
                {"qualification": "May be defined in an external COPY/SQL INCLUDE; not automatically a broken call."})
        for name in p["duplicate_labels"]:
            positions = [d for d in p["paragraphs"] if d["name"] == name]
            add("paragraph_wiring", f"{role}: repeated label {name}; section qualification needs review", [ev(item, x["line"]) for x in positions])
        known = {Path(a["path"]).stem.upper() for a in analysis["artifacts"] if a["role"] in {"copybook", "dclgen", "sql_include", "derived_copybook"}}
        for dep in p["dependencies"]:
            if dep["name"] not in known:
                add("fields_layout", f"{role}: dependency not available by exact member name: {dep['name']}",
                    [ev(item, dep["line"])], {"qualification": "No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance."})
        for sql in p["sql"]:
            duplicates = [col for col, count in Counter(sql["projection"]).items() if count > 1]
            if duplicates:
                add("access_sql", f"{role}: repeated SELECT projection entries", [ev(item, sql["start_line"], sql["end_line"])], {"entries": duplicates})
    if analysis["track"] == "baseline":
        source, manual = artifacts["idms"], artifacts["manual"]
        ids = {"OBTAIN", "FIND", "GET", "STORE", "MODIFY", "ERASE", "BIND", "READY", "FINISH", "COMMIT", "ROLLBACK"}
        access = [s for s in source["profile"]["statements"] if s["verb"] in ids]
        if access and manual["profile"]["sql"]:
            first_sql = next((s for s in manual["profile"]["sql"] if s["kind"] != "INCLUDE"), manual["profile"]["sql"][0])
            add("access_sql", "Map source IDMS operations to manual DB2 operations individually", [ev(source, access[0]["start_line"], access[0]["end_line"]), ev(manual, first_sql["start_line"], first_sql["end_line"])],
                {"source_operation_count": len(access), "manual_sql_block_count": len(manual["profile"]["sql"]), "qualification": "Counts do not imply a one-to-one mapping or equivalence."})
        return leads
    if "generated" not in artifacts:
        add("validation", "Engine output unavailable; do not invent engine behavior", [])
        return leads
    left, right = artifacts["manual"], artifacts["generated"]
    def compare_sql_kind(kind: str) -> None:
        ls = [s for s in left["profile"]["sql"] if s["kind"] == kind]
        rs = [s for s in right["profile"]["sql"] if s["kind"] == kind]
        # Equality here is lexical only. Do not match blocks by paragraph numbers.
        if Counter(s["normalized"] for s in ls) != Counter(s["normalized"] for s in rs):
            samples = [ev(item, s["start_line"], s["end_line"]) for item, seq in ((left, ls), (right, rs)) for s in seq]
            add("access_sql", f"Manual/generated {kind} blocks differ lexically", samples,
                {"manual_blocks": len(ls), "generated_blocks": len(rs), "qualification": "Projection ordering, QUERYNO, host spelling or equivalent strategies can explain differences. Map by operation, keys and effect."})
    for kind in sorted(set(left["profile"]["sql_counts"]) | set(right["profile"]["sql_counts"])):
        if kind != "INCLUDE":
            compare_sql_kind(kind)
    for topic, verbs in (("purpose_io", {"READ", "WRITE", "REWRITE"}), ("transactions_restart", {"COMMIT", "ROLLBACK"}), ("business_conditions", {"IF", "EVALUATE", "WHEN"})):
        ls = [s for s in left["profile"]["statements"] if s["verb"] in verbs]
        rs = [s for s in right["profile"]["statements"] if s["verb"] in verbs]
        if Counter(s["normalized"] for s in ls) != Counter(s["normalized"] for s in rs):
            add(topic, f"Manual/generated {'/'.join(sorted(verbs))} statements need effect-level comparison",
                [ev(item, s["start_line"], s["end_line"]) for item, seq in ((left, ls), (right, rs)) for s in seq],
                {"manual_statements": len(ls), "generated_statements": len(rs), "qualification": "Not a missing-logic verdict. Helpers, numbering, control restructuring or SQL filtering may preserve behavior."})
    # Same-name storage differences are facts about declarations, not proof of a bug.
    def declarations(item: dict) -> dict:
        grouped = {}
        for d in item["profile"]["data"]:
            if d["name"] == "FILLER":
                continue
            pic = re.search(r"\bPIC(?:TURE)?\s+([^ .]+)(.*)", d["text"], re.I)
            if pic:
                grouped.setdefault(d["name"], []).append((canonical(pic.group(0)), d))
        return grouped
    ld, rd = declarations(left), declarations(right)
    for name in sorted(set(ld) & set(rd)):
        if len(ld[name]) != 1 or len(rd[name]) != 1:
            continue
        l, r = ld[name][0], rd[name][0]
        if l[0] != r[0]:
            add("fields_layout", f"Same-name declaration differs: {name}", [ev(left, l[1]["start_line"], l[1]["end_line"]), ev(right, r[1]["start_line"], r[1]["end_line"])],
                {"manual": l[0], "generated": r[0], "qualification": "Review type/representation and data flow; level numbers and field names alone do not establish equivalence."})
    return leads


def render_report(analysis: dict, review: dict | None = None) -> str:
    track, program = analysis["track"], analysis["program_id"]
    title = "IDMS to manual DB2 baseline" if track == "baseline" else "Engine output gap analysis"
    parts = [f"# {program}: {title}", "", f"Analysis fingerprint: `{analysis['fingerprint']}`.", "",
             "**Automated evidence inventory. Business equivalence is NOT established. No compiler or DB2 runtime validation is implied.**", "",
             "The baseline excludes generated output and converter behavior. The gap track cannot establish its own expected behavior from the generated output.", "",
             "## Input identities", "", "| Role | File | Physical lines | SHA-256 |", "|---|---|---:|---|"]
    for a in analysis["artifacts"]:
        parts.append(f"| {a['role']} | `{safe(a['path'])}` | {a['lines'] if a['lines'] is not None else 'opaque'} | `{a['sha256']}` |")
    if track == "gap":
        parts += ["", "Generation provenance: `" + safe(analysis.get("generation_provenance", {})) + "`. A bound receipt records a run, not a successful conversion or business equivalence.", ""]
    parts += ["", "Physical line numbers refer to decoded files before formatting. Sequence columns are not line numbers. Snapshots are immutable and referenced in the companion JSON.", "", "## Program evidence summaries", ""]
    for a in analysis["artifacts"]:
        if "profile" not in a:
            continue
        p = a["profile"]
        parts += [f"### {a['role']}: {p['program_id']}", "",
                  f"Observed: {len(p['paragraphs'])} paragraph/section labels, {len(p['calls'])} out-of-line PERFORM sites, {len(p['sql'])} EXEC SQL blocks.",
                  f"Verb inventory: `{safe(p['verb_counts'])}`.", f"SQL inventory: `{safe(p['sql_counts'])}`.", "",
                  "| Caller | PERFORM target | THROUGH endpoint | Source lines |", "|---|---|---|---|"]
        for call in p["calls"]:
            parts.append(f"| `{call['caller']}` | `{call['target']}` | `{call['through'] or '-'}` | L{call['start_line']}-L{call['end_line']} |")
        parts += ["", "This is not a reachability proof. Paragraph numbering, PERFORM THRU boundaries, fall-through, SECTION scope and external routines must be reviewed separately.", "",
                  "SQL inventory (complete blocks and projections are in the companion JSON):", "", "| Kind | Tables | Lines | Projection items |", "|---|---|---|---:|"]
        for sql in p["sql"]:
            parts.append(f"| {sql['kind']} | `{', '.join(sql['tables'])}` | L{sql['start_line']}-L{sql['end_line']} | {len(sql['projection'])} |")
        parts += ["", "Extraction limitations:", ""] + ["- " + safe(v) for v in p["limitations"]] + [""]
    parts += ["## Comparison leads, not confirmed defects", ""]
    leads = analysis.get("leads", [])
    if not leads:
        parts += ["No lexical lead was emitted. This does not mean semantic parity passed.", ""]
    for lead in leads:
        parts += [f"### {lead['lead_id']}: {safe(lead['title'])}", "", f"Topic: `{lead['topic']}`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.",
                  f"Suggested engine guide: `{lead['candidate_owner_guide']}` (routing hint only).", ""]
        for e in lead["evidence"]:
            parts.append("- " + evidence_label(analysis, e))
        for key, value in lead["details"].items():
            parts.append(f"{key}: {safe(value)}")
        parts += [""]
    parts += ["## Mandatory semantic coverage", "", "| Topic | Review status |", "|---|---|"]
    obligations = {o["topic"]: o for o in (review or {}).get("coverage", [])}
    for topic in TOPICS:
        parts.append(f"| {topic} | {safe(obligations.get(topic, {}).get('status', 'NOT_REVIEWED'))} |")
    parts += ["", f"There are {len(analysis['chunks'])} primary-source chunks. An AI must read every relevant chunk and dependencies; a short report is not a claim that all paths were analyzed.", ""]
    if review:
        reviewed = set(review.get("covered_chunks", []))
        required = {x["chunk_id"] for x in analysis["chunks"]}
        parts += ["## Imported evidence-backed review", "", f"Declared reviewer: `{safe(review['author'])}`. Declared state: `{review['review_status']}`.",
                  f"Primary chunk coverage: {len(reviewed & required)}/{len(required)}. Coverage acknowledgement is a reviewer assertion, not independent proof of having read the source.",
                  "The importer validates identities and reference ranges, not the truth of natural-language conclusions or reviewer authorization.", ""]
        for claim in review["claims"]:
            parts += [f"### {safe(claim['claim_id'])}: {safe(claim['conclusion'])}", "", safe(claim["summary"]), "",
                      f"Root-cause hypothesis: {safe(claim.get('root_cause_hypothesis', 'Not established'))}", ""]
            parts += ["- " + evidence_label(analysis, e) for e in claim["evidence"]] + [""]
    else:
        parts += ["## Human/AI semantic review pending", "", "Use `packet` to prepare the bounded source-reading task, then `review-import` to attach a source-cited review. Do not hand-edit generated reports; keep draft Markdown in prompt/temp/.", ""]
    parts += ["## Production decision", "", "**NOT CERTIFIED.** This knowledge collector never grants deployment approval. Confirmed reference behavior, target metadata, compiler output, and same-input runtime results remain separate evidence obligations.", ""]
    return "\n".join(parts)


def save_analysis(root: Path, analysis: dict, review: dict | None = None) -> None:
    base = f"{KNOWLEDGE}/programs/{analysis['program_id']}"
    write_json(root, f"{base}/{analysis['track']}.json", analysis)
    report = "01_idms_manual.md" if analysis["track"] == "baseline" else "02_engine_gaps.md"
    write_text(root, f"{base}/{report}", render_report(analysis, review))
