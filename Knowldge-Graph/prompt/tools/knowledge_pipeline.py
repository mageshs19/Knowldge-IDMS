#!/usr/bin/env python3
"""System 2 evidence collection and System 1 knowledge handoff.

Python standard library only. Run from the copied workspace root. This CLI does
not call an AI API, prove equivalence, or grant production approval.
"""
from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

from knowledge_core import (
    DEFAULT_CONFIG, KNOWLEDGE, analyze_inputs, artifact_text, csv_register,
    current_analysis, engine_identity, file_hash, load_config, read_json,
    safe_path, write_json,
)
from knowledge_extract import profile
from knowledge_reports import comparison_leads, save_analysis
from knowledge_review import (
    aggregate, current_review, export_handoff, import_review, packet,
    require_fresh, validate_review, verify_handoff,
)

ROOT = Path(__file__).resolve().parents[2]


def inventory(root: Path, source: str, manual: str, generated: str, encoding: str, source_format: str) -> dict:
    result = {"schema_version": 1, "pairing_policy": "EXPLICIT_CONFIRMATION_REQUIRED_NO_NAMING_GUESS", "files": [], "errors": []}
    for role, folder in (("idms", source), ("manual", manual), ("generated", generated)):
        if not folder:
            continue
        directory = safe_path(root, folder)
        if not directory.is_dir():
            result["errors"].append(f"Missing directory: {folder}")
            continue
        # Only the specified folder; do not silently pick historical nested outputs.
        for file in sorted(directory.iterdir()):
            if not file.is_file() or file.suffix.lower() not in {".cbl", ".cob", ".cobol", ".txt"}:
                continue
            rel = file.relative_to(root).as_posix()
            safe_path(root, rel, exists=True)
            try:
                p = profile(file.read_bytes().decode(encoding), source_format)
                result["files"].append({"role": role, "path": rel, "program_id": p["program_id"], "lines": p["lines"], "sha256": file_hash(file)})
                if not p["program_id"]:
                    result["errors"].append(f"No PROGRAM-ID: {rel}; verify encoding/format")
            except (UnicodeError, LookupError, ValueError) as exc:
                result["errors"].append(f"{rel}: {exc}")
    duplicates = {}
    for item in result["files"]:
        key = (item["role"], item["program_id"])
        duplicates.setdefault(key, []).append(item["path"])
    for (role, pid), paths in duplicates.items():
        if pid and len(paths) > 1:
            result["errors"].append(f"Duplicate {role} PROGRAM-ID {pid}: {paths}; select an exact version explicitly")
    write_json(root, "prompt/temp/system2/inventory.json", result)
    return result


def build(root: Path, config: dict, selected: list[dict], tracks: list[str]) -> dict:
    result = {"built": [], "reused": [], "errors": [], "meaning": "Report generation only, not semantic acceptance"}
    engine = engine_identity(root) if "gap" in tracks else None
    for program in selected:
        for track in tracks:
            try:
                analysis = analyze_inputs(root, config, program, track, engine)
                previous_file = f"{KNOWLEDGE}/programs/{program['id']}/{track}.json"
                previous = read_json(root, previous_file) if safe_path(root, previous_file).is_file() else None
                if previous and previous["fingerprint"] == analysis["fingerprint"]:
                    analysis = previous
                    result["reused"].append(f"{program['id']}:{track}")
                else:
                    analysis["leads"] = comparison_leads(analysis)
                    result["built"].append(f"{program['id']}:{track}")
                review = current_review(root, analysis)
                save_analysis(root, analysis, review)
            except (OSError, ValueError, LookupError, KeyError) as exc:
                result["errors"].append({"program": program["id"], "track": track, "error": str(exc)})
    write_json(root, "prompt/temp/system2/last_build.json", result)
    return result


def verify(root: Path, config: dict) -> dict:
    errors, checked = [], 0
    engine = engine_identity(root)
    for p in config["programs"]:
        for track in ("baseline", "gap"):
            try:
                analysis = require_fresh(root, config, p, track, engine if track == "gap" else None)
                checked += 1
                for artifact in analysis["artifacts"]:
                    if file_hash(safe_path(root, artifact["snapshot"], exists=True)) != artifact["sha256"]:
                        raise ValueError("Evidence snapshot hash mismatch")
                review = current_review(root, analysis)
                if review:
                    validate_review(analysis, review)
            except (OSError, ValueError, KeyError) as exc:
                errors.append(f"{p['id']}:{track}: {exc}")
    return {"result": "PASS" if not errors else "FAIL", "scope": "Evidence freshness/integrity only; not program correctness", "dossiers": checked, "errors": errors}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, default=ROOT)
    parser.add_argument("--config", default=DEFAULT_CONFIG)
    sub = parser.add_subparsers(dest="command", required=True)
    inv = sub.add_parser("inventory", help="List exact input identities; does not auto-pair programs")
    inv.add_argument("--idms-dir", default="mainframe/workspace/Program")
    inv.add_argument("--manual-dir", default="mainframe/workspace/Manual Output")
    inv.add_argument("--generated-dir", default="mainframe/workspace/Output")
    inv.add_argument("--encoding", default="utf-8-sig")
    inv.add_argument("--format", choices=("fixed", "free"), default="fixed")
    reg = sub.add_parser("register", help="Register explicit confirmed CSV pairs")
    reg.add_argument("--pairs", required=True)
    reg.add_argument("--metadata", help="JSON array of role/path/encoding/format metadata descriptors")
    reg.add_argument("--expected-programs", required=True, type=int)
    b = sub.add_parser("build", help="Generate/reuse both analysis tracks")
    b.add_argument("--program", action="append")
    b.add_argument("--track", choices=("baseline", "gap", "both"), default="both")
    pack = sub.add_parser("packet", help="Create a bounded source-cited prompt for approved AI; no API call")
    pack.add_argument("--program", required=True)
    pack.add_argument("--track", choices=("baseline", "gap"), required=True)
    pack.add_argument("--part", type=int, default=1)
    pack.add_argument("--chunks-per-packet", type=int, default=2)
    pack.add_argument("--max-chars", type=int, default=24000)
    imp = sub.add_parser("review-import", help="Validate and attach AI/human review JSON")
    imp.add_argument("--program", required=True)
    imp.add_argument("--track", choices=("baseline", "gap"), required=True)
    imp.add_argument("--file", required=True)
    excerpt = sub.add_parser("evidence", help="Read a precise metadata/source excerpt by artifact ID")
    excerpt.add_argument("--program", required=True)
    excerpt.add_argument("--track", choices=("baseline", "gap"), required=True)
    excerpt.add_argument("--artifact", required=True)
    excerpt.add_argument("--start", type=int, required=True)
    excerpt.add_argument("--end", type=int, required=True)
    sub.add_parser("aggregate", help="Build cross-program candidate rule catalog")
    sub.add_parser("check", help="Verify knowledge provenance, not business parity")
    exp = sub.add_parser("export", help="Export a checksummed knowledge-only handoff")
    exp.add_argument("--name", required=True)
    exp.add_argument("--include-evidence", action="store_true", help="Include original source snapshots; transfer only under organizational approval")
    handoff = sub.add_parser("verify-handoff", help="Verify transfer ZIP checksums without extraction")
    handoff.add_argument("--file", required=True)
    run = sub.add_parser("run-engine", help="Plan/run frozen engine copy through convert and review only")
    run.add_argument("--engine-root", type=Path, required=True)
    run.add_argument("--program", action="append")
    run.add_argument("--execute", action="store_true")
    run.add_argument("--timeout", type=int, default=300)
    run.add_argument("--python", default=sys.executable)
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    root, code = args.root.resolve(), 0
    try:
        if args.command == "inventory":
            value = inventory(root, args.idms_dir, args.manual_dir, args.generated_dir, args.encoding, args.format)
            code = 2 if value["errors"] else 0
        elif args.command == "verify-handoff":
            value = verify_handoff(root, args.file)
        elif args.command == "register":
            metadata = read_json(root, args.metadata) if args.metadata else []
            if not isinstance(metadata, list):
                raise ValueError("--metadata must contain a JSON array")
            config = csv_register(root, args.pairs, args.config, args.expected_programs, metadata)
            value = {"registered": len(config["programs"]), "manifest": args.config}
        else:
            config = load_config(root, args.config)
            wanted = getattr(args, "program", None)
            wanted = [wanted] if isinstance(wanted, str) else wanted
            selected = [p for p in config["programs"] if not wanted or p["id"] in wanted]
            if wanted and set(wanted) - {p["id"] for p in selected}:
                raise ValueError("Unknown program ID; use the exact knowledge manifest ID")
            if args.command == "build":
                tracks = ["baseline", "gap"] if args.track == "both" else [args.track]
                value = build(root, config, selected, tracks)
                code = 2 if value["errors"] else 0
            elif args.command == "packet":
                value = packet(root, config, selected[0], args.track, args.part, args.chunks_per_packet, args.max_chars)
            elif args.command == "review-import":
                value = import_review(root, config, selected[0], args.track, args.file)
            elif args.command == "evidence":
                analysis = require_fresh(root, config, selected[0], args.track)
                item = next((a for a in analysis["artifacts"] if a["artifact_id"] == args.artifact), None)
                if item is None:
                    raise ValueError("Unknown artifact ID")
                lines = artifact_text(root, item).splitlines()
                if not 1 <= args.start <= args.end <= len(lines) or args.end - args.start >= 200:
                    raise ValueError("Evidence range must exist and contain at most 200 lines")
                value = {"artifact": item["path"], "sha256": item["sha256"], "text": "\n".join(f"L{n}: {lines[n - 1]}" for n in range(args.start, args.end + 1))}
            elif args.command == "aggregate":
                catalog = aggregate(root, config)
                value = {"programs": catalog["registered_programs"], "rule_families": len(catalog["catalog"]), "index": f"{KNOWLEDGE}/INDEX.md", "production_approved": False}
            elif args.command == "export":
                value = export_handoff(root, config, args.name, args.include_evidence)
            elif args.command == "check":
                value = verify(root, config)
                code = 2 if value["errors"] else 0
            elif args.command == "run-engine":
                from knowledge_engine import run_engine
                code, value = run_engine(root, config, args.config, args.engine_root, selected, args.execute, args.timeout, args.python)
            else:
                raise ValueError("Unimplemented command")
        print(json.dumps(value, indent=2, ensure_ascii=True))
        return code
    except (OSError, ValueError, KeyError, TypeError, LookupError) as exc:
        print(json.dumps({"result": "ERROR", "message": str(exc)}, indent=2), file=sys.stderr)
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
