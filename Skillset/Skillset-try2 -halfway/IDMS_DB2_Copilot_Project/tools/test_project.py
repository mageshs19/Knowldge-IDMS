#!/usr/bin/env python3
"""Exercise the delivered artifact workflow in isolated temporary copies."""
from __future__ import annotations

import hashlib
import importlib.util
import json
import shutil
import tempfile
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SAMPLE = ROOT / "tests" / "six-program-sample"
VALIDATOR = ROOT / ".github/skills/analyze-idms-db2-migration/scripts/validate_run.py"
spec = importlib.util.spec_from_file_location("migration_validator", VALIDATOR)
sys.dont_write_bytecode = True
module = importlib.util.module_from_spec(spec)
assert spec.loader is not None
spec.loader.exec_module(module)


def digest_tree(root):
    return {p.relative_to(root).as_posix(): hashlib.sha256(p.read_bytes()).hexdigest()
            for p in root.rglob("*") if p.is_file() and "__pycache__" not in p.parts}


def edit_json(path, edit):
    value = json.loads(path.read_text(encoding="utf-8"))
    edit(value)
    path.write_text(json.dumps(value, indent=2), encoding="utf-8")


def main():
    results = []
    before = digest_tree(SAMPLE)
    for phase in (1, 2):
        path = SAMPLE / f"Migration-Analysis/Phase-{phase}/Run-001"
        result = module.Audit(path).validate()
        if result["status"] != "PASS":
            print(json.dumps(result, indent=2))
            return 1
        results.append({"test": f"Phase {phase} complete artifact validation", "result": "PASS",
                        "checks": result["artifact_checks"], "counts": result["counts"]})

    def missing_report(sample, run):
        next((run / "programs").glob("*__migration.md")).unlink()

    def missing_matrix(sample, run):
        edit_json(run / "_audit/rule-applicability.json", lambda j: j["rows"].pop())

    def duplicate_matrix(sample, run):
        edit_json(run / "_audit/rule-applicability.json", lambda j: j["rows"].append(j["rows"][0]))

    def changed_source(sample, run):
        p = sample / "Mainframe/workspace/IDMS Programs/VM1BD526.cbl"
        p.write_bytes(p.read_bytes() + b"\nTEST MUTATION\n")

    def omitted_input(sample, run):
        p = sample / "Mainframe/workspace/IDMS Programs/unlisted-member"
        p.write_text("       IDENTIFICATION DIVISION.\n       PROGRAM-ID. EXTRA.\n", encoding="ascii")

    def changed_baseline(sample, run):
        p = next((sample / "Migration-Analysis/Phase-1/Run-001/programs").glob("*__migration.md"))
        p.write_bytes(p.read_bytes() + b"\nTEST MUTATION\n")

    def changed_answer(sample, run):
        q = json.loads((run / "_audit/questions.json").read_text())["questions"][0]
        p = run / q["raw_snapshot"]
        p.write_bytes(p.read_bytes().replace(module.START, module.START + b"\nTEST MUTATION"))

    def promoted_synthetic(sample, run):
        def edit(j):
            q = next(q for q in j["questions"] if q["answer_origin"] == "SIMULATED_FOR_TEST")
            q["review_state"] = "ACCEPTED_FOR_SCOPE"
            q["production_resolution"] = "RESOLVED"
        edit_json(run / "_audit/questions.json", edit)

    def production_import(sample, run):
        def edit(j):
            j["execution_mode"] = "PRODUCTION_ANALYSIS"
            j["simulated_answers_allowed"] = False
        edit_json(run / "_audit/run.json", edit)

    def scope_leak(sample, run):
        cases = json.loads((run / "_audit/cases.json").read_text())
        case = next(c for c in cases["cases"] if c.get("answer_refs"))
        ref = case["answer_refs"][0]
        other = next(c["input_id"] for c in cases["cases"] if c["input_id"] != case["input_id"])
        ref["accepted_scope"]["input_ids"] = [other]
        def edit(j):
            q = next(q for q in j["questions"] if q["question_id"] == ref["question_id"])
            q["accepted_scope"] = ref["accepted_scope"]
        edit_json(run / "_audit/questions.json", edit)
        (run / "_audit/cases.json").write_text(json.dumps(cases, indent=2))

    def wrong_matrix_case(sample, run):
        cases = json.loads((run / "_audit/cases.json").read_text())["cases"]
        def edit(j):
            row = j["rows"][0]
            row["case_ids"] = [next(c["case_id"] for c in cases if c["input_id"] != row["input_id"])]
        edit_json(run / "_audit/rule-applicability.json", edit)

    def unsupported_rule_answer_scope(sample, run):
        # RULE-015 has a legitimate additional 4310 application beyond its
        # seeded archive case. Removing that scope must invalidate Q-000019.
        def edit(j):
            row = next(r for r in j["rows"] if r["rule_id"] == "RULE-015" and r["input_id"] == "VM4BD310.cbl")
            row["disposition"] = "NOT_APPLICABLE"
        edit_json(run / "_audit/rule-applicability.json", edit)

    def bad_matrix_evidence(sample, run):
        def edit(j):
            j["rows"][0]["evidence"] = [{"path": "MISSING-TEST.cbl", "line_start": 999, "line_end": 1000}]
        edit_json(run / "_audit/rule-applicability.json", edit)

    def human_without_answer(sample, run):
        def edit(j):
            j["cases"][0]["evidence_state"] = "HUMAN_CONFIRMED_INTENT"
            j["cases"][0]["answer_refs"] = []
        edit_json(run / "_audit/cases.json", edit)

    def wrong_question_id(sample, run):
        def edit(j):
            j["questions"][0]["question_id"] = "Q-999999"
        edit_json(run / "_audit/questions.json", edit)

    def accepted_blank_answer(sample, run):
        ledger = json.loads((run / "_audit/questions.json").read_text())
        q = ledger["questions"][0]
        path = run / q["raw_snapshot"]
        original = path.read_bytes()
        empty = (b"\n## Human answer\n\nResponse state: UNANSWERED\n\nAnswer origin: HUMAN\n\n"
                 b"Answer:\n\nApplies to these programs / business conditions:\n\n")
        raw = original.split(module.START)[0] + module.START + empty + module.END + original.split(module.END)[1]
        path.write_bytes(raw)
        q.update(file_sha256=module.sha(raw), answer_sha256=module.sha(empty), answer_origin="HUMAN",
                 response_state="PROVIDED", review_state="ACCEPTED_FOR_SCOPE", production_resolution="RESOLVED")
        (run / "_audit/questions.json").write_text(json.dumps(ledger, indent=2))

    mutations = [
        ("Missing report detected", missing_report, "report"),
        ("Missing rule/program matrix row detected", missing_matrix, "matrix"),
        ("Duplicate rule/program matrix row detected", duplicate_matrix, "duplicate"),
        ("Changed original source detected", changed_source, "source hash"),
        ("Unlisted IDMS input detected", omitted_input, "inventory does not cover"),
        ("Changed Phase 1 baseline detected", changed_baseline, "baseline changed"),
        ("Changed consumed answer detected", changed_answer, "hash mismatch"),
        ("Synthetic answer promotion rejected", promoted_synthetic, "synthetic answer"),
        ("Synthetic answer in production rejected", production_import, "synthetic answer"),
        ("Answer applied outside accepted input scope rejected", scope_leak, "outside accepted program scope"),
        ("Matrix case from another program rejected", wrong_matrix_case, "another input"),
        ("Rule answer outside case and applicability scope rejected", unsupported_rule_answer_scope, "case/applicability scope"),
        ("Invalid matrix evidence rejected", bad_matrix_evidence, "evidence MISSING-TEST.cbl"),
        ("Human-confirmed label without real answer rejected", human_without_answer, "lacks accepted real human"),
        ("Question identity mismatch rejected", wrong_question_id, "differs from snapshot heading"),
        ("Blank answer cannot be accepted as human intent", accepted_blank_answer, "lacks a substantive answer"),
    ]
    for name, mutate, expected in mutations:
        with tempfile.TemporaryDirectory(prefix="idms-db2-check-") as tmp:
            sample = Path(tmp) / "six-program-sample"
            shutil.copytree(SAMPLE, sample)
            run = sample / "Migration-Analysis/Phase-2/Run-001"
            mutate(sample, run)
            result = module.Audit(run).validate()
            if result["status"] != "FAIL" or not any(expected in e for e in result["errors"]):
                print(json.dumps({"test": name, "unexpected": result}, indent=2))
                return 1
            results.append({"test": name, "result": "PASS", "meaning": "deliberate invalid copy was rejected"})

    # Independently check original/archive working-copy integrity, not just the run manifest.
    manifest = json.loads((SAMPLE / "SOURCE_MANIFEST.json").read_text())
    for item in manifest["files"]:
        for path in [SAMPLE / "source-original" / item["archive_path"],
                     SAMPLE / "Mainframe/workspace" / item["workspace_path"]]:
            if hashlib.sha256(path.read_bytes()).hexdigest() != item["sha256"]:
                raise AssertionError(f"source manifest mismatch: {path}")
    archive = SAMPLE / manifest["archive"]
    assert hashlib.sha256(archive.read_bytes()).hexdigest() == manifest["archive_sha256"]
    results.append({"test": "All 30 original and normalized files plus RAR match supplied hashes", "result": "PASS"})

    # The rehearsal corrected an interface-role premise before final Phase 2.
    # Prove that its superseded synthetic drafts and final reference are retained.
    revisions_root = SAMPLE / "answer-revisions"
    revisions = json.loads((revisions_root / "ANSWER_REVISIONS.json").read_text(encoding="utf-8"))
    for revision in revisions["revisions"]:
        prior = (revisions_root / revision["superseded_snapshot"]).read_bytes()
        current = (revisions_root / revision["current_snapshot"]).read_bytes()
        assert module.sha(prior) == revision["superseded_file_sha256"]
        assert module.sha(module.answer_bytes(prior)) == revision["superseded_answer_sha256"]
        assert module.sha(current) == revision["current_file_sha256"]
        assert module.sha(module.answer_bytes(current)) == revision["current_answer_sha256"]
    results.append({"test": "Superseded synthetic drafts and final answer version retain exact hashes", "result": "PASS"})

    # Rerun the read-only validator and prove that repeated checking changes no test artifacts.
    assert module.Audit(SAMPLE / "Migration-Analysis/Phase-2/Run-001").validate()["status"] == "PASS"
    assert digest_tree(SAMPLE) == before
    results.append({"test": "Repeated validation preserves all delivered test bytes", "result": "PASS"})
    print(json.dumps({"status": "PASS", "tests": results,
                      "scope": "Artifact tests only. COBOL precompile/compile/Db2 execution not performed."}, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
