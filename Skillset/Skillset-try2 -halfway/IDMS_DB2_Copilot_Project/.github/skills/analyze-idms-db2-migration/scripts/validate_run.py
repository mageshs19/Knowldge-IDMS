#!/usr/bin/env python3
"""Read-only artifact validation; does not parse COBOL or execute Db2."""
from __future__ import annotations

import argparse
import hashlib
import json
import re
import sys
from pathlib import Path

GUIDES = {
    "G01": "01_RETRIEVAL_WITHOUT_LRF.md",
    "G02": "02_UPDATE_RESTART_WITHOUT_LRF.md",
    "G03": "03_LRF_RETRIEVAL.md",
    "G04": "04_LRF_UPDATE_RESTART.md",
}
DISPOSITIONS = {
    "APPLIES_SUPPORTS", "APPLIES_VARIANT", "APPLIES_CONTRADICTS",
    "NOT_APPLICABLE", "UNKNOWN", "NOT_A_PROGRAM",
}
STATUSES = {"COMPLETE_STATIC", "PARTIAL", "BLOCKED", "NOT_A_PROGRAM"}
START = b"<!-- HUMAN-ANSWER-START -->"
END = b"<!-- HUMAN-ANSWER-END -->"


def sha(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def answer_bytes(data: bytes) -> bytes:
    if data.count(START) != 1 or data.count(END) != 1:
        raise ValueError("exactly one pair of answer markers is required")
    start = data.index(START) + len(START)
    end = data.index(END)
    if end < start:
        raise ValueError("answer markers are out of order")
    return data[start:end]


class Audit:
    def __init__(self, run: Path):
        self.run = run.resolve()
        self.errors: list[str] = []
        self.checks = 0
        self.counts: dict[str, int] = {}

    def check(self, ok: bool, message: str) -> None:
        self.checks += 1
        if not ok:
            self.errors.append(message)

    def file(self, path: Path, label: str) -> bytes:
        try:
            return path.read_bytes()
        except OSError as exc:
            self.check(False, f"{label}: {exc}")
            return b""

    def json(self, rel: str) -> dict:
        path = self.run / rel
        try:
            value = json.loads(path.read_text(encoding="utf-8"))
            if not isinstance(value, dict):
                raise ValueError("expected a JSON object")
            self.check(value.get("schema_version") == 2, f"{rel}: schema_version must be 2")
            return value
        except (OSError, ValueError) as exc:
            self.check(False, f"{rel}: {exc}")
            return {}

    def unique(self, items: list[dict], key: str, label: str) -> dict:
        result = {}
        if not isinstance(items, list):
            self.check(False, f"{label}: expected an array")
            return result
        for item in items:
            if not isinstance(item, dict):
                self.check(False, f"{label}: expected object entries")
                continue
            identity = item.get(key)
            self.check(isinstance(identity, str) and bool(identity), f"{label}: missing {key}")
            self.check(identity not in result, f"{label}: duplicate {key} {identity}")
            result[identity] = item
        return result

    def evidence(self, records: list, input_root: Path, encodings: dict) -> None:
        for record in records:
            if not isinstance(record, dict):
                self.check(False, "evidence records must be objects")
                continue
            # Official URLs and explicitly unavailable dependencies have separate provenance.
            if record.get("url") or record.get("unavailable"):
                continue
            path = record.get("path")
            self.check(bool(path), "source evidence is missing its path")
            if not path:
                continue
            source = (input_root / path).resolve()
            data = self.file(source, f"evidence {path}")
            if record.get("sha256"):
                self.check(sha(data) == record["sha256"], f"evidence hash changed: {path}")
            first, last = record.get("line_start"), record.get("line_end")
            if first is not None or last is not None:
                try:
                    lines = data.decode(encodings.get(path, "utf-8-sig")).splitlines()
                    ok = isinstance(first, int) and isinstance(last, int) and 1 <= first <= last <= len(lines)
                    self.check(ok, f"invalid physical line range: {path}:{first}-{last}")
                except (UnicodeError, LookupError) as exc:
                    self.check(False, f"evidence encoding {path}: {exc}")

    def validate(self) -> dict:
        run = self.json("_audit/run.json")
        if not run:
            return self.result()
        phase = run.get("phase")
        self.check(phase in (1, 2), "phase must be 1 or 2")
        roots = run.get("roots", {})
        self.check(bool(roots.get("input")) and bool(roots.get("project")), "input/project roots required")
        input_root = (self.run / roots.get("input", ".")).resolve()
        project_root = (self.run / roots.get("project", "../..")).resolve()
        mode = run.get("execution_mode", "PRODUCTION_ANALYSIS")
        test_mode = mode == "TEST_REHEARSAL"
        self.check(mode in {"TEST_REHEARSAL", "PRODUCTION_ANALYSIS"}, "unknown execution_mode")
        if test_mode:
            self.check(bool(roots.get("test")), "test runs require roots.test")
            test_root = (self.run / roots.get("test", ".")).resolve()
            self.check(self.run.is_relative_to(test_root), "test run is outside test root")
            self.check(input_root.is_relative_to(test_root), "test inputs are outside test root")
            self.check(project_root.is_relative_to(test_root), "test project is outside test root")
        else:
            self.check(not run.get("simulated_answers_allowed", False), "production permits synthetic answers")

        inputs = self.unique(run.get("inputs", []), "input_id", "inputs")
        encodings = {v.get("path"): v.get("encoding", "utf-8-sig") for v in inputs.values()}
        for identity, item in inputs.items():
            path = item.get("path", "")
            self.check(bool(path), f"input {identity}: path missing")
            data = self.file(input_root / path, f"input {identity}")
            self.check(bool(item.get("sha256")), f"input {identity}: hash missing")
            self.check(sha(data) == item.get("sha256"), f"source hash changed: {path}")
        excluded = {x.get("input_id") for x in run.get("exclusions", [])}
        idms_folder = input_root / run.get("idms_subdirectory", "IDMS Programs")
        self.check(idms_folder.is_dir(), "configured IDMS input directory is missing")
        actual_idms_files = {x.relative_to(input_root).as_posix() for x in idms_folder.rglob("*") if x.is_file()}
        declared_idms_files = {v.get("path") for v in inputs.values() if v.get("category") == "IDMS"}
        self.check(actual_idms_files == declared_idms_files, "inventory does not cover every file in configured IDMS directory")
        self.check(excluded <= set(inputs), "exclusion refers to an unknown input")
        idms = {k for k, v in inputs.items() if v.get("category") == "IDMS"} - excluded
        programs = self.unique(run.get("programs", []), "input_id", "programs")
        self.check(set(programs) == idms, "IDMS input/report identity sets differ")
        reports = {}
        for identity, program in programs.items():
            self.check(program.get("status") in STATUSES, f"{identity}: invalid report status")
            rel = program.get("report", "")
            data = self.file(self.run / rel, f"report {identity}")
            text = data.decode("utf-8", errors="replace")
            reports[identity] = text
            headings = [int(x) for x in re.findall(r"^##\s+(\d+)\.\s", text, re.M)]
            self.check(headings == list(range(1, 16)), f"{identity}: require fifteen ordered report sections")
            self.check(identity in text, f"{identity}: identity not present in report")
        actual_reports = {x.relative_to(self.run).as_posix() for x in (self.run / "programs").rglob("*__migration.md")}
        declared_reports = {x.get("report") for x in programs.values()}
        self.check(actual_reports == declared_reports, "declared and actual report files differ")

        guides = self.unique(run.get("guides", []), "guide_id", "guides")
        self.check(set(guides) == set(GUIDES), "exactly four expected guide IDs required")
        guide_text = {}
        for guide_id, name in GUIDES.items():
            rel = guides.get(guide_id, {}).get("path", f"generic/{name}")
            self.check(Path(rel).name == name, f"{guide_id}: wrong guide filename")
            guide_text[guide_id] = self.file(self.run / rel, guide_id).decode("utf-8", errors="replace")
        self.check({x.name for x in (self.run / "generic").glob("*.md")} == set(GUIDES.values()),
                   "actual generic directory must contain exactly four expected guides")
        self.check((self.run / "COVERAGE_AND_VALIDATION.md").is_file(), "coverage document missing")

        cases_doc = self.json("_audit/cases.json")
        rules_doc = self.json("_audit/rules.json")
        matrix = self.json("_audit/rule-applicability.json")
        questions_doc = self.json("_audit/questions.json")
        cases = self.unique(cases_doc.get("cases", []), "case_id", "cases")
        rules = self.unique(rules_doc.get("rules", []), "rule_id", "rules")
        questions = self.unique(questions_doc.get("questions", []), "question_id", "questions")
        for identity, program in programs.items():
            found = {k for k, v in cases.items() if v.get("input_id") == identity}
            self.check(set(program.get("case_ids", [])) == found, f"{identity}: manifest case inventory differs")
            self.check(set(program.get("question_ids", [])) <= set(questions), f"{identity}: unknown question ID")
        for case_id, case in cases.items():
            identity = case.get("input_id")
            self.check(identity in programs, f"{case_id}: unknown input")
            self.check(case_id in reports.get(identity, ""), f"{case_id}: missing from program report")
            gids = case.get("classification", {}).get("guide_ids", [])
            self.check(bool(gids) and set(gids) <= set(GUIDES), f"{case_id}: invalid guide membership")
            rids = case.get("rule_ids", [])
            self.check(bool(rids) and set(rids) <= set(rules), f"{case_id}: missing/unknown rule linkage")
            self.check(set(case.get("question_ids", [])) <= set(questions), f"{case_id}: unknown question")
            for gid in gids:
                self.check(case_id in guide_text.get(gid, ""), f"{case_id}: missing from {gid} crosswalk")
            for rid in rids:
                self.check(case_id in rules.get(rid, {}).get("case_ids", []), f"{case_id}/{rid}: nonreciprocal rule linkage")
            self.evidence(case.get("evidence", []), input_root, encodings)
        for rule_id, rule in rules.items():
            self.check(set(rule.get("case_ids", [])) <= set(cases), f"{rule_id}: unknown case")
            self.check(set(rule.get("question_ids", [])) <= set(questions), f"{rule_id}: unknown question")
            gids = rule.get("guide_ids", [])
            self.check(bool(gids) and set(gids) <= set(GUIDES), f"{rule_id}: invalid guide membership")
            for gid in gids:
                self.check(rule_id in guide_text.get(gid, ""), f"{rule_id}: missing from {gid}")
            self.evidence(rule.get("evidence", []), input_root, encodings)

        rows = matrix.get("rows", [])
        expected = {(r, p) for r in rules for p in programs}
        actual = [(x.get("rule_id"), x.get("input_id")) for x in rows]
        self.check(len(actual) == len(set(actual)), "duplicate rule/input matrix row")
        self.check(set(actual) == expected, "rule/input matrix is incomplete or has extra rows")
        self.check(set(matrix.get("rule_ids", [])) == set(rules), "matrix rule IDs differ")
        self.check(set(matrix.get("input_ids", [])) == set(programs), "matrix input IDs differ")
        for row in rows:
            label = f"{row.get('rule_id')}/{row.get('input_id')}"
            self.check(row.get("disposition") in DISPOSITIONS, f"{label}: invalid disposition")
            self.check(bool(row.get("tested_condition")), f"{label}: tested condition missing")
            self.check(bool(row.get("evidence") or row.get("question_ids")), f"{label}: no evidence/question")
            self.check(set(row.get("case_ids", [])) <= set(cases), f"{label}: unknown case")
            self.check(set(row.get("question_ids", [])) <= set(questions), f"{label}: unknown question")
            for cid in row.get("case_ids", []):
                self.check(cases.get(cid, {}).get("input_id") == row.get("input_id"),
                           f"{label}: matrix case belongs to another input")
                self.check(cid in rules.get(row.get("rule_id"), {}).get("case_ids", []),
                           f"{label}: matrix case is not linked to this rule")
            self.evidence(row.get("evidence", []), input_root, encodings)

        real_answer_ids = set()
        for qid, question in questions.items():
            raw = self.file(self.run / question.get("raw_snapshot", ""), f"{qid} snapshot")
            self.check(sha(raw) == question.get("file_sha256"), f"{qid}: snapshot hash mismatch")
            title = re.search(rb"^#\s+(Q-[0-9]+)\b", raw, re.M)
            self.check(bool(title) and title.group(1).decode("ascii") == qid,
                       f"{qid}: question ID differs from snapshot heading")
            self.evidence(question.get("evidence", []), input_root, encodings)
            try:
                answer = answer_bytes(raw)
                self.check(sha(answer) == question.get("answer_sha256"), f"{qid}: answer hash mismatch")
            except ValueError as exc:
                self.check(False, f"{qid}: {exc}")
                answer = b""
            origin = question.get("answer_origin", "HUMAN")
            answer_text = answer.decode("utf-8", errors="replace")
            answer_match = re.search(
                r"^Answer:[ \t]*(.*?)(?=^Applies to these programs / business conditions:|^Exceptions:|"
                r"^Supporting business reference or evidence:|^Answered by / date.*?:|^Supersedes.*?:|\Z)",
                answer_text, re.M | re.S)
            substantive = bool(answer_match and answer_match.group(1).strip())
            if question.get("review_state") == "ACCEPTED_FOR_SCOPE":
                self.check(origin == "HUMAN" and substantive,
                           f"{qid}: accepted human intent lacks a substantive answer or has ambiguous answer formatting")
                self.check(question.get("response_state") in {"PROVIDED", "INCOMPLETE"},
                           f"{qid}: accepted human answer has incompatible detected response state")
                if origin == "HUMAN" and substantive and question.get("response_state") in {"PROVIDED", "INCOMPLETE"}:
                    real_answer_ids.add(qid)
            simulated = origin == "SIMULATED_FOR_TEST" or b"SIMULATED_FOR_TEST" in answer
            if simulated:
                self.check(test_mode and run.get("simulated_answers_allowed") is True, f"{qid}: synthetic answer outside authorized test mode")
                self.check(origin == "SIMULATED_FOR_TEST", f"{qid}: synthetic answer origin mismatch")
                self.check(question.get("review_state") == "TEST_ASSUMPTION_ONLY", f"{qid}: synthetic answer promoted to human acceptance")
                self.check(question.get("production_resolution") == "OPEN", f"{qid}: synthetic answer closed production question")
                self.check(b"Answer origin: SIMULATED_FOR_TEST" in answer, f"{qid}: answer text lacks synthetic label")
                self.check(question.get("resolution_state") in {"OPEN", "RESOLVED_FOR_TEST_ONLY"}, f"{qid}: invalid synthetic resolution")
            if phase == 1 and test_mode:
                self.check(question.get("response_state") == "UNANSWERED", f"{qid}: Phase 1 fixture must remain unanswered")
        for owner in list(cases.values()) + list(rules.values()) + rows:
            refs = owner.get("answer_refs", [])
            if owner.get("evidence_state") == "HUMAN_CONFIRMED_INTENT":
                self.check(bool(refs) and all(
                    ref.get("question_id") in real_answer_ids
                    for ref in refs), "human-confirmed evidence lacks accepted real human answer references")
            for ref in refs:
                q = questions.get(ref.get("question_id"), {})
                self.check(bool(q), "answer reference has unknown question")
                self.check(ref.get("answer_sha256") == q.get("answer_sha256"), "answer reference hash mismatch")
                self.check(ref.get("accepted_scope") == q.get("accepted_scope"), "answer reference scope mismatch")
                scope = q.get("accepted_scope", {})
                allowed = scope.get("input_ids", []) if isinstance(scope, dict) else q.get("accepted_input_ids", [])
                self.check(isinstance(allowed, list) and bool(allowed), "answer lacks explicit accepted input scope")
                if not isinstance(allowed, list):
                    allowed = []
                if owner.get("input_id"):
                    self.check(owner["input_id"] in allowed, "answer applied outside accepted program scope")
                elif owner.get("rule_id"):
                    owning_inputs = {cases.get(cid, {}).get("input_id") for cid in owner.get("case_ids", [])}
                    # A whole-corpus check may establish an additional application
                    # outside the rule's seeded examples. Require that row to name
                    # this precise question and retain an applicable/unknown scope.
                    owning_inputs.update(row.get("input_id") for row in rows
                        if row.get("rule_id") == owner["rule_id"]
                        and ref.get("question_id") in row.get("question_ids", [])
                        and row.get("disposition") in {"APPLIES_SUPPORTS", "APPLIES_VARIANT",
                                                       "APPLIES_CONTRADICTS", "UNKNOWN"})
                    self.check(bool(owning_inputs.intersection(allowed)),
                               "rule answer is unrelated to its case/applicability scope")
                if q.get("answer_origin") == "SIMULATED_FOR_TEST":
                    self.check(ref.get("answer_origin") == "SIMULATED_FOR_TEST", "answer reference lost synthetic provenance")
                    self.check(owner.get("evidence_state") != "HUMAN_CONFIRMED_INTENT", "synthetic answer promoted to human-confirmed evidence")

        config = run.get("configuration", {})
        if config.get("snapshot"):
            data = self.file(self.run / config["snapshot"], "configuration snapshot")
            self.check(sha(data) == config.get("hash"), "configuration snapshot hash mismatch")
        if phase == 2:
            self.check((self.run / "ANSWER_IMPACT.md").is_file(), "Phase 2 answer impact document missing")
            baseline = run.get("baseline_run")
            self.check(bool(baseline), "Phase 2 baseline missing")
            entries = run.get("baseline_files", [])
            self.check(bool(entries), "Phase 2 baseline fingerprints missing")
            declared = set()
            for entry in entries:
                rel = entry.get("path", "")
                declared.add(rel)
                data = self.file(project_root / rel, "preserved baseline")
                self.check(sha(data) == entry.get("sha256"), f"baseline changed: {rel}")
            if baseline:
                base = project_root / baseline
                actual_files = {x.relative_to(project_root).as_posix() for x in base.rglob("*") if x.is_file()}
                self.check(actual_files == declared, "baseline fingerprint inventory differs")
        self.counts = {"programs": len(programs), "guides": len(guides), "cases": len(cases),
                       "rules": len(rules), "matrix_rows": len(rows), "questions": len(questions)}
        return self.result()

    def result(self) -> dict:
        return {"status": "PASS" if not self.errors else "FAIL", "run": str(self.run),
                "artifact_checks": self.checks, "counts": self.counts, "errors": self.errors,
                "scope": "Artifact consistency and source/answer hashes only; no COBOL/Db2 execution."}


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--run", required=True, type=Path)
    parser.add_argument("--json", action="store_true")
    args = parser.parse_args(argv)
    try:
        result = Audit(args.run).validate()
    except (TypeError, KeyError, ValueError, OSError, AttributeError) as exc:
        result = {"status": "FAIL", "errors": [f"Invalid ledger structure: {exc}"]}
    if args.json:
        print(json.dumps(result, indent=2))
    else:
        print(f"{result['status']}: {args.run}")
        print(json.dumps(result.get("counts", {}), sort_keys=True))
        for error in result["errors"]:
            print(f"  ERROR: {error}")
        print(result.get("scope", ""))
    return 0 if result["status"] == "PASS" else 1


if __name__ == "__main__":
    sys.exit(main())
