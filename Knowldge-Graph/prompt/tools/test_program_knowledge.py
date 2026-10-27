"""Offline tests for System 2 collection, not IDMS/DB2 runtime equivalence."""
from __future__ import annotations

import copy
import json
from pathlib import Path
import tempfile
import unittest
import zipfile

from knowledge_core import (
    DEFAULT_CONFIG, KNOWLEDGE, TOPICS, analyze_inputs, artifact_text, csv_register,
    current_analysis, descriptor, ev, hash_json, load_artifact, load_config,
    safe_path, write_json, write_text,
)
from knowledge_extract import canonical, profile, source_lines, split_list
from knowledge_pipeline import build, inventory, verify
from knowledge_reports import comparison_leads
from knowledge_review import aggregate, current_review, export_handoff, import_review, packet, validate_review, verify_handoff

SOURCE = """IDENTIFICATION DIVISION.
PROGRAM-ID. SRC1.
DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-N PIC 9(4) COMP-3.
PROCEDURE DIVISION.
MAIN.
    PERFORM WORK-PARA
    STOP RUN.
WORK-PARA.
    OBTAIN NEXT REC-A WITHIN SET-A.
    IF STATUS-CODE = '0326'
       DISPLAY 'no record'
    END-IF.
    WRITE OUT-REC.
"""
MANUAL = """IDENTIFICATION DIVISION.
PROGRAM-ID. DB1.
DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-N PIC 9(4).
PROCEDURE DIVISION.
MAIN.
    PERFORM 200-WORK
    STOP RUN.
200-WORK.
    EXEC SQL
       SELECT A, B INTO :HA, :HB FROM TABLE-A
       WHERE K = :KEY-HOST
       ORDER BY A DESC
       FETCH FIRST 1 ROW ONLY
    END-EXEC
    IF SQLCODE = 100
       PERFORM SQLERROR
    END-IF.
    WRITE OUT-REC.
"""


class ExtractTests(unittest.TestCase):
    def test_program_id_free(self):
        self.assertEqual(profile(SOURCE, "free")["program_id"], "SRC1")

    def test_program_id_fixed(self):
        text = "\n".join(f"{n:06d} {line:<65}{n:08d}" for n, line in enumerate(SOURCE.splitlines(), 1))
        self.assertEqual(profile(text)["program_id"], "SRC1")

    def test_comment_not_call(self):
        p = profile(SOURCE + "*> PERFORM MISSING-PARA\n", "free")
        self.assertEqual(len(p["calls"]), 1)

    def test_literal_not_call(self):
        p = profile(SOURCE + "    DISPLAY 'PERFORM MISSING-PARA'.\n", "free")
        self.assertEqual(len(p["calls"]), 1)

    def test_literal_whitespace_preserved(self):
        self.assertNotEqual(canonical("MOVE 'A  B' TO X"), canonical("MOVE 'A B' TO X"))

    def test_lowercase_outside_literal_normalized(self):
        self.assertEqual(canonical(" move   'a B' to x"), "MOVE 'a B' TO X")

    def test_projection_and_hosts(self):
        sql = profile(MANUAL, "free")["sql"][0]
        self.assertEqual(sql["projection"], ["A", "B"])
        self.assertEqual(sql["hosts"], [":HA", ":HB"])
        self.assertEqual(sql["ordering"], "A DESC")

    def test_sql_nested_list(self):
        self.assertEqual(split_list("COALESCE(A, 'a,b'), C"), ["COALESCE(A, 'a,b')", "C"])

    def test_unresolved_include_is_not_proven_broken(self):
        p = profile(MANUAL, "free")
        self.assertEqual(p["unresolved_calls"][0]["target"], "SQLERROR")

    def test_thru_target(self):
        p = profile(SOURCE.replace("PERFORM WORK-PARA", "PERFORM WORK-PARA THRU WORK-EXIT") + "WORK-EXIT.\n    EXIT.\n", "free")
        self.assertEqual(p["calls"][0]["through"], "WORK-EXIT")
        self.assertFalse(p["unresolved_calls"])

    def test_repeated_labels(self):
        p = profile(SOURCE + "WORK-PARA.\n    CONTINUE.\n", "free")
        self.assertEqual(p["duplicate_labels"], ["WORK-PARA"])

    def test_unterminated_sql(self):
        self.assertIn("Unterminated EXEC SQL block; extraction incomplete.", profile(MANUAL.replace("END-EXEC", ""), "free")["limitations"])

    def test_sequence_columns_excluded(self):
        rows = source_lines("000100     CONTINUE.                                                    ABC12345")
        self.assertNotIn("ABC12345", rows[0]["body"])


class WorkflowTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.root = Path(self.tmp.name)
        self.addCleanup(self.tmp.cleanup)
        (self.root / "input").mkdir()
        (self.root / "input/idms.cbl").write_text(SOURCE)
        (self.root / "input/manual.cbl").write_text(MANUAL)
        (self.root / "input/generated.cbl").write_text(MANUAL.replace("PIC 9(4).", "PIC 9(4) COMP-3."))
        self.config = {"schema_version": 1, "expected_programs": 1, "chunk_lines": 10,
                       "programs": [{"id": "DB1", "pairing_confirmed": True,
                                     **{r: {"path": f"input/{r}.cbl", "encoding": "utf-8", "format": "free"} for r in ("idms", "manual", "generated")}}], "metadata": []}
        write_json(self.root, DEFAULT_CONFIG, self.config)
        source_root = Path(__file__).resolve().parents[2]
        for name in ("03_BASELINE_REVIEW_PROMPT.md", "04_ENGINE_GAP_PROMPT.md", "05_SYSTEM1_IMPLEMENTATION_PROMPT.md"):
            p = source_root / "prompt/system2" / name
            write_text(self.root, "prompt/system2/" + name, p.read_text())
        self.program = self.config["programs"][0]

    def do_build(self):
        result = build(self.root, self.config, [self.program], ["baseline", "gap"])
        self.assertFalse(result["errors"])
        return result

    def review(self, track="baseline", status="reviewed"):
        a = current_analysis(self.root, "DB1", track)
        sides = ["idms", "manual"] if track == "baseline" else ["manual", "generated"]
        claims = [{"claim_id": "OBS-1", "topic": "purpose_io", "conclusion": "difference", "summary": "Synthetic fixture text differs; this is a test record.",
                   "confidence": "low", "evidence": [ev(next(x for x in a["artifacts"] if x["role"] == r), 1, 3) for r in sides]}]
        value = {"schema_version": 1, "program_id": "DB1", "track": track, "fingerprint": a["fingerprint"], "author": "offline-test", "scope": "static_only",
                 "review_status": status, "covered_chunks": [c["chunk_id"] for c in a["chunks"]],
                 "coverage": [{"topic": t, "status": "unknown", "reason": "Synthetic test only"} for t in TOPICS], "claims": claims}
        if track == "gap":
            baseline = current_review(self.root, current_analysis(self.root, "DB1", "baseline"))
            value["baseline_review_sha256"] = hash_json(baseline) if baseline else None
        return value

    def admit(self, value):
        write_json(self.root, "prompt/temp/review.json", value)
        return import_review(self.root, self.config, self.program, value["track"], "prompt/temp/review.json")

    def test_dual_reports(self):
        result = self.do_build()
        self.assertEqual(len(result["built"]), 2)
        self.assertTrue((self.root / "prompt/knowledge/programs/DB1/01_idms_manual.md").is_file())
        self.assertTrue((self.root / "prompt/knowledge/programs/DB1/02_engine_gaps.md").is_file())

    def test_resume(self):
        self.do_build()
        self.assertEqual(len(self.do_build()["reused"]), 2)

    def test_baseline_excludes_generated(self):
        self.do_build()
        before = current_analysis(self.root, "DB1", "baseline")["fingerprint"]
        (self.root / "input/generated.cbl").write_text(MANUAL + "EXTRA.\n    CONTINUE.\n")
        result = self.do_build()
        self.assertEqual(before, current_analysis(self.root, "DB1", "baseline")["fingerprint"])
        self.assertEqual(result["reused"], ["DB1:baseline"])
        self.assertEqual(result["built"], ["DB1:gap"])

    def test_baseline_excludes_engine_docs(self):
        a = analyze_inputs(self.root, self.config, self.program, "baseline")
        b = analyze_inputs(self.root, self.config, self.program, "gap", {"status": "DOC_SNAPSHOT_ONLY", "fingerprint": "a", "sources": {}})
        c = analyze_inputs(self.root, self.config, self.program, "gap", {"status": "DOC_SNAPSHOT_ONLY", "fingerprint": "b", "sources": {}})
        self.assertNotEqual(b["fingerprint"], c["fingerprint"])
        self.assertEqual(a["fingerprint"], analyze_inputs(self.root, self.config, self.program, "baseline")["fingerprint"])

    def test_stale_source_detected(self):
        self.do_build()
        (self.root / "input/manual.cbl").write_text(MANUAL + "OTHER-PARA.\n    EXIT.\n")
        self.assertEqual(verify(self.root, self.config)["result"], "FAIL")

    def test_import_review(self):
        self.do_build()
        self.assertEqual(self.admit(self.review())["status"], "REVIEW_RECORDED_NOT_CERTIFIED")

    def test_full_chunk_coverage_required(self):
        self.do_build()
        value = self.review()
        value["covered_chunks"] = []
        with self.assertRaisesRegex(ValueError, "every primary"):
            self.admit(value)

    def test_forged_hash_rejected(self):
        self.do_build()
        value = self.review()
        value["claims"][0]["evidence"][0]["sha256"] = "bad"
        with self.assertRaises(ValueError):
            self.admit(value)

    def test_invalid_line_rejected(self):
        self.do_build()
        value = self.review()
        value["claims"][0]["evidence"][0]["end_line"] = 10000
        with self.assertRaises(ValueError):
            self.admit(value)

    def test_comparison_both_sides_required(self):
        self.do_build()
        value = self.review()
        value["claims"][0]["evidence"] = value["claims"][0]["evidence"][:1]
        with self.assertRaisesRegex(ValueError, "both compared"):
            self.admit(value)

    def test_no_production_approval(self):
        self.do_build()
        value = self.review()
        value["production_approved"] = True
        with self.assertRaises(ValueError):
            self.admit(value)

    def test_gap_requires_baseline_review(self):
        self.do_build()
        with self.assertRaisesRegex(ValueError, "independent baseline"):
            self.admit(self.review("gap"))

    def test_gap_binds_baseline(self):
        self.do_build()
        self.admit(self.review())
        self.admit(self.review("gap"))
        value = self.review()
        value["claims"][0]["summary"] += " revised"
        self.admit(value)
        self.assertIsNone(current_review(self.root, current_analysis(self.root, "DB1", "gap")))

    def test_export_hashes_and_no_source_default(self):
        self.do_build()
        value = export_handoff(self.root, self.config, "wave1", False)
        with zipfile.ZipFile(self.root / value["handoff"]) as z:
            self.assertFalse(any(n.endswith(".source") for n in z.namelist()))
            manifest = json.loads(z.read("prompt/knowledge/HANDOFF_MANIFEST.json"))
            import hashlib
            self.assertTrue(all(hashlib.sha256(z.read(n)).hexdigest() == h for n, h in manifest["files"].items()))

    def test_verify_transfer(self):
        self.do_build()
        value = export_handoff(self.root, self.config, "wave1", False)
        self.assertEqual(verify_handoff(self.root, value["handoff"])["result"], "PASS")

    def test_tampered_transfer(self):
        self.do_build()
        value = export_handoff(self.root, self.config, "wave1", False)
        target = self.root / "prompt/temp/bad.zip"
        target.parent.mkdir(parents=True, exist_ok=True)
        with zipfile.ZipFile(self.root / value["handoff"]) as source, zipfile.ZipFile(target, "w") as output:
            for info in source.infolist():
                output.writestr(info.filename, b"tampered" if info.filename.endswith("INDEX.md") else source.read(info.filename))
        with self.assertRaisesRegex(ValueError, "checksum mismatch"):
            verify_handoff(self.root, "prompt/temp/bad.zip")

    def test_export_evidence_opt_in(self):
        self.do_build()
        value = export_handoff(self.root, self.config, "wave1", True)
        with zipfile.ZipFile(self.root / value["handoff"]) as z:
            self.assertTrue(any(n.endswith(".source") for n in z.namelist()))

    def test_no_export_overwrite(self):
        self.do_build()
        export_handoff(self.root, self.config, "wave1", False)
        with self.assertRaises(ValueError):
            export_handoff(self.root, self.config, "wave1", False)

    def test_export_stale_refused(self):
        self.do_build()
        (self.root / "input/idms.cbl").write_text(SOURCE + "DIFFERENT.\n    EXIT.\n")
        with self.assertRaisesRegex(ValueError, "stale/missing"):
            export_handoff(self.root, self.config, "wave1", False)

    def test_packet_bound(self):
        self.do_build()
        with self.assertRaisesRegex(ValueError, "No source was truncated"):
            packet(self.root, self.config, self.program, "baseline", 1, 2, 10)

    def test_packet_temp_location(self):
        self.do_build()
        result = packet(self.root, self.config, self.program, "baseline", 1, 2, 24000)
        self.assertTrue(result["packet"].startswith("prompt/temp/"))
        self.assertTrue((self.root / result["packet"]).is_file())

    def test_unknown_part(self):
        self.do_build()
        with self.assertRaises(ValueError):
            packet(self.root, self.config, self.program, "baseline", 999, 2, 24000)

    def test_originals_preserved(self):
        before = {p: p.read_bytes() for p in (self.root / "input").glob("*")}
        self.do_build()
        aggregate(self.root, self.config)
        self.assertTrue(all(p.read_bytes() == data for p, data in before.items()))

    def test_unknown_generated(self):
        del self.program["generated"]
        self.do_build()
        value = aggregate(self.root, self.config)
        self.assertEqual(value["matrix"][0]["tracks"]["gap"]["status"], "ENGINE_OUTPUT_MISSING")

    def test_wrong_generated_identity(self):
        (self.root / "input/generated.cbl").write_text(MANUAL.replace("DB1", "WRONG"))
        value = build(self.root, self.config, [self.program], ["gap"])
        self.assertEqual(len(value["errors"]), 1)

    def test_duplicate_pair_refused(self):
        bad = copy.deepcopy(self.config)
        bad["programs"].append({**copy.deepcopy(self.program), "id": "DB2"})
        bad["expected_programs"] = 2
        write_json(self.root, DEFAULT_CONFIG, bad)
        with self.assertRaisesRegex(ValueError, "Reused"):
            load_config(self.root)

    def test_count_mismatch(self):
        self.config["expected_programs"] = 75
        write_json(self.root, DEFAULT_CONFIG, self.config)
        with self.assertRaisesRegex(ValueError, "registered 1"):
            load_config(self.root)

    def test_path_traversal_refused(self):
        with self.assertRaises(ValueError):
            safe_path(self.root, "../bad")

    def test_symlink_escape_refused(self):
        path = self.root / "escape"
        try:
            path.symlink_to(self.root.parent, target_is_directory=True)
        except OSError:
            self.skipTest("Symlinks unavailable")
        with self.assertRaises(ValueError):
            safe_path(self.root, "escape/bad")

    def test_markdown_policy(self):
        with self.assertRaises(ValueError):
            write_text(self.root, "bad.md", "do not write")

    def test_strict_encoding(self):
        (self.root / "input/idms.cbl").write_bytes(b'\xff\xfe\x00')
        with self.assertRaises(UnicodeError):
            analyze_inputs(self.root, self.config, self.program, "baseline")

    def test_corrupted_snapshot_detected(self):
        self.do_build()
        a = current_analysis(self.root, "DB1", "baseline")["artifacts"][0]
        (self.root / a["snapshot"]).write_bytes(b"tampered")
        self.assertEqual(verify(self.root, self.config)["result"], "FAIL")

    def test_generic_renamed_inputs(self):
        for name in ("idms", "manual", "generated"):
            p = self.root / f"input/{name}.cbl"
            p.write_text(p.read_text().replace("WORK", "HANDLE").replace("WS-N", "VALUE-X"))
        self.do_build()
        result = current_analysis(self.root, "DB1", "gap")
        self.assertTrue(any("VALUE-X" in x["title"] for x in result["leads"]))

    def test_csv_register_requires_confirmation(self):
        write_text(self.root, "prompt/temp/pairs.csv", "id,idms,manual,pairing_confirmed\nDB1,input/idms.cbl,input/manual.cbl,no\n")
        with self.assertRaises(ValueError):
            csv_register(self.root, "prompt/temp/pairs.csv", DEFAULT_CONFIG, 1)

    def test_75_synthetic_pairs(self):
        programs = []
        for n in range(75):
            specs = {}
            for role, text in (("idms", SOURCE.replace("SRC1", f"SRC{n}")), ("manual", MANUAL.replace("DB1", f"DB{n}")), ("generated", MANUAL.replace("DB1", f"DB{n}"))):
                rel = f"input/{role}{n}.cbl"
                (self.root / rel).write_text(text)
                specs[role] = {"path": rel, "format": "free", "encoding": "utf-8"}
            programs.append({"id": f"DB{n}", "pairing_confirmed": True, **specs})
        cfg = {"schema_version": 1, "expected_programs": 75, "chunk_lines": 80, "programs": programs, "metadata": []}
        write_json(self.root, DEFAULT_CONFIG, cfg)
        load_config(self.root)
        result = build(self.root, cfg, programs, ["baseline", "gap"])
        self.assertFalse(result["errors"])
        self.assertEqual(len(result["built"]), 150)
        self.assertEqual(aggregate(self.root, cfg)["registered_programs"], 75)
        self.assertEqual(len(build(self.root, cfg, programs, ["baseline", "gap"])["reused"]), 150)


class EngineAdapterTests(unittest.TestCase):
    setUp = WorkflowTests.setUp
    def make_engine(self, fail=0, delay=0):
        import hashlib
        engine = self.root / "frozen"
        (engine / "mainframe").mkdir(parents=True)
        (engine / "prompt").mkdir()
        script = ("import os, sys, time\nfrom pathlib import Path\n"
                  "assert sys.argv[1:] == ['all', '--from', 'convert', '--to', 'review']\n"
                  + f"time.sleep({delay})\n"
                  + "out=Path(os.environ['ZOWE_WORKSPACE_ROOT'])/'Output'\n"
                  + "out.mkdir(exist_ok=True)\n"
                  + "(out/'DB1.cbl').write_text('       IDENTIFICATION DIVISION.\\n       PROGRAM-ID. DB1.\\n       PROCEDURE DIVISION.\\n           STOP RUN.\\n')\n"
                  + f"raise SystemExit({fail})\n")
        (engine / "mainframe/zowe_pipeline.py").write_text(script)
        (engine / "mainframe/__init__.py").write_text("")
        sources = {p.relative_to(engine).as_posix(): {"sha256": hashlib.sha256(p.read_bytes()).hexdigest()} for p in (engine / "mainframe").glob("*.py")}
        (engine / "prompt/source_manifest.json").write_text(json.dumps({"sources": sources}))
        for role in ("idms", "manual"):
            path = self.root / self.program[role]["path"]
            path.write_text("\n".join("       " + line for line in path.read_text().splitlines()) + "\n")
            self.program[role]["format"] = "fixed"
        return engine

    def test_engine_plan_only(self):
        from knowledge_engine import run_engine
        import sys
        engine = self.make_engine()
        code, result = run_engine(self.root, self.config, DEFAULT_CONFIG, engine, [self.program], False, 5, sys.executable)
        self.assertEqual(code, 0)
        self.assertEqual(result["execution"], "PLAN_ONLY")
        self.assertFalse((self.root / "prompt/temp/system2-engine").exists())

    def test_engine_rejection_keeps_receipt_and_candidate(self):
        from knowledge_engine import run_engine
        import sys
        engine = self.make_engine(fail=2)
        original = (self.root / "input/idms.cbl").read_bytes()
        code, result = run_engine(self.root, self.config, DEFAULT_CONFIG, engine, [self.program], True, 5, sys.executable)
        self.assertEqual(code, 2)
        self.assertEqual(result["engine_exit_code"], 2)
        self.assertEqual(result["attached_candidates"], 1)
        self.assertEqual(original, (self.root / "input/idms.cbl").read_bytes())
        from knowledge_core import engine_identity
        analysis = analyze_inputs(self.root, self.config, self.program, "gap", engine_identity(engine))
        self.assertEqual(analysis["generation_provenance"]["status"], "BOUND_CAPTURE_RECEIPT")

    def test_engine_timeout(self):
        from knowledge_engine import run_engine
        import sys
        engine = self.make_engine(delay=5)
        code, result = run_engine(self.root, self.config, DEFAULT_CONFIG, engine, [self.program], True, 1, sys.executable)
        self.assertEqual(code, 2)
        self.assertEqual(result["engine_exit_code"], 124)
        self.assertEqual(result["attached_candidates"], 0)
        self.assertIsNone(self.program.get("generated"))
        self.assertIn("previous_generated", self.program)

    def test_prompt_only_cannot_execute_engine(self):
        from knowledge_engine import run_engine
        import sys
        with self.assertRaisesRegex(ValueError, "complete current engine"):
            run_engine(self.root, self.config, DEFAULT_CONFIG, self.root, [self.program], False, 5, sys.executable)


if __name__ == "__main__":
    unittest.main()
