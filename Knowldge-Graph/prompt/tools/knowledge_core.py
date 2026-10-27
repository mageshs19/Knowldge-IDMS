"""Immutable input identities, explicit program registration and bounded evidence.

Owned by prompt/system2/01_ARCHITECTURE_AND_CONTRACTS.md. No converter imports.
All paths are workspace-relative. Original inputs are never rewritten.
"""
from __future__ import annotations

import csv
import hashlib
import json
import os
import re
import tempfile
from pathlib import Path
from typing import Any

from knowledge_extract import profile

VERSION = "1.0"
DEFAULT_CONFIG = "prompt/system2/programs.json"
KNOWLEDGE = "prompt/knowledge"
TOPICS = (
    "purpose_io", "lr_idms_expansion", "access_sql", "keys_relationships",
    "cursor_control", "business_conditions", "fields_layout", "dates_nulls",
    "status_errors", "transactions_restart", "paragraph_wiring", "validation",
)
GUIDES = {
    "purpose_io": "prompt/04_LR_IDMS_DB2_CONVERSION.md",
    "lr_idms_expansion": "prompt/04_LR_IDMS_DB2_CONVERSION.md",
    "access_sql": "prompt/05_SQL_CURSOR_AND_BUSINESS_FLOW.md",
    "keys_relationships": "prompt/03_INPUT_METADATA_AND_RESOLUTION.md",
    "cursor_control": "prompt/05_SQL_CURSOR_AND_BUSINESS_FLOW.md",
    "business_conditions": "prompt/05_SQL_CURSOR_AND_BUSINESS_FLOW.md",
    "fields_layout": "prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md",
    "dates_nulls": "prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md",
    "status_errors": "prompt/05_SQL_CURSOR_AND_BUSINESS_FLOW.md",
    "transactions_restart": "prompt/07_UPDATE_RESTART_AND_TRANSACTIONS.md",
    "paragraph_wiring": "prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md",
    "validation": "prompt/10_TESTING_AND_VALIDATION.md",
}
ROLES_A = {"idms", "manual", "original_lr", "copybook", "dclgen", "mapping", "subschema", "sql_include"}
ROLES_B = ROLES_A | {"generated", "expanded_idms", "derived_copybook", "engine_receipt", "engine_review", "engine_log", "compiler_log", "runtime_report"}
TEXT_EXTENSIONS = {".cbl", ".cob", ".cobol", ".cpy", ".txt", ".csv", ".json", ".log", ".jcl", ".ddl", ".sql"}
SAFE_ID = re.compile(r"^[A-Za-z0-9][A-Za-z0-9_.-]{0,79}$")


def hash_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def hash_json(data: Any) -> str:
    return hash_bytes(json.dumps(data, sort_keys=True, ensure_ascii=True, separators=(",", ":")).encode())


def file_hash(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for part in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(part)
    return digest.hexdigest()


def safe_path(root: Path, name: str, *, exists: bool = False) -> Path:
    if not isinstance(name, str) or not name or "\\" in name:
        raise ValueError("Use nonempty workspace-relative forward-slash paths")
    relative = Path(name)
    if relative.is_absolute() or ".." in relative.parts or ":" in name:
        raise ValueError(f"Unsafe relative path: {name}")
    target = (root / relative).resolve()
    if not target.is_relative_to(root.resolve()):
        raise ValueError(f"Path escapes workspace: {name}")
    if exists and not target.is_file():
        raise ValueError(f"Missing file: {name}")
    return target


def write_text(root: Path, name: str, content: str) -> None:
    if not (name.startswith("prompt/") or name == "readme.md"):
        raise ValueError(f"Knowledge output outside approved prompt location: {name}")
    path = safe_path(root, name)
    path.parent.mkdir(parents=True, exist_ok=True)
    data = content.encode("utf-8")
    if path.is_file() and path.read_bytes() == data:
        return
    fd, temp = tempfile.mkstemp(prefix=".write-", dir=path.parent)
    try:
        with os.fdopen(fd, "wb") as handle:
            handle.write(data)
        os.replace(temp, path)
    finally:
        if os.path.exists(temp):
            os.unlink(temp)


def write_json(root: Path, name: str, data: Any) -> None:
    write_text(root, name, json.dumps(data, indent=2, ensure_ascii=True, sort_keys=True) + "\n")


def read_json(root: Path, name: str) -> Any:
    return json.loads(safe_path(root, name, exists=True).read_text(encoding="utf-8-sig"))


def tool_fingerprint() -> str:
    return hash_json({p.name: file_hash(p) for p in sorted(Path(__file__).parent.glob("knowledge_*.py"))})


def descriptor(value: str | dict, role: str) -> dict:
    data = {"path": value} if isinstance(value, str) else dict(value)
    data.setdefault("encoding", "utf-8-sig")
    data.setdefault("format", "fixed")
    data["role"] = role
    return data


def load_config(root: Path, name: str = DEFAULT_CONFIG) -> dict:
    config = read_json(root, name)
    if config.get("schema_version") != 1:
        raise ValueError("Unsupported knowledge manifest schema_version")
    programs = config.get("programs", [])
    if not programs:
        raise ValueError("No explicit program pairs registered")
    if config.get("expected_programs") != len(programs):
        raise ValueError(f"Expected {config.get('expected_programs')} programs, registered {len(programs)}")
    seen_ids, seen_primary, targets, source_ids = set(), set(), set(), set()
    for program in programs:
        identity = program.get("id", "")
        if not SAFE_ID.fullmatch(identity) or identity.casefold() in seen_ids:
            raise ValueError(f"Invalid/duplicate program knowledge ID: {identity}")
        seen_ids.add(identity.casefold())
        if program.get("pairing_confirmed") is not True:
            raise ValueError(f"Pairing must be explicitly confirmed: {identity}")
        for role in ("idms", "manual"):
            if not program.get(role):
                raise ValueError(f"{identity}: missing required {role} file")
            spec = descriptor(program[role], role)
            path = safe_path(root, spec["path"], exists=True)
            if path in seen_primary:
                raise ValueError(f"Reused original/manual file: {spec['path']}")
            seen_primary.add(path)
            actual = profile(path.read_bytes().decode(spec["encoding"]), spec["format"])["program_id"]
            if not actual or (spec.get("program_id") and actual != spec["program_id"].upper()):
                raise ValueError(f"Unreadable/mismatched PROGRAM-ID: {spec['path']}")
            identities = source_ids if role == "idms" else targets
            if actual in identities:
                raise ValueError(f"Duplicate actual {role} PROGRAM-ID: {actual}")
            identities.add(actual)
        manual = descriptor(program["manual"], "manual")
        if program.get("generated") and safe_path(root, descriptor(program["generated"], "generated")["path"]) == safe_path(root, manual["path"]):
            raise ValueError("Manual and generated must be separate physical files")
    for spec in config.get("metadata", []) + [s for p in programs for s in p.get("metadata", [])]:
        if spec.get("role") not in ROLES_B - {"idms", "manual", "generated"}:
            raise ValueError(f"Unsupported metadata role: {spec.get('role')}")
        safe_path(root, spec["path"], exists=True)
    return config


def program_specs(config: dict, program: dict, track: str) -> list[dict]:
    roles = ROLES_A if track == "baseline" else ROLES_B
    result = [descriptor(program[r], r) for r in ("idms", "manual", "generated", "original_lr", "expanded_idms") if r in roles and program.get(r)]
    for raw in config.get("metadata", []) + program.get("metadata", []):
        if raw.get("role") in roles and (not raw.get("programs") or program["id"] in raw["programs"]):
            result.append(descriptor(raw, raw["role"]))
    if track == "gap" and program.get("engine_receipt"):
        result.append(descriptor(program["engine_receipt"], "engine_receipt"))
    seen = set()
    unique = []
    for spec in result:
        key = (spec["role"], spec["path"])
        if key not in seen:
            unique.append(spec)
            seen.add(key)
    return unique


def load_artifact(root: Path, spec: dict) -> dict:
    path = safe_path(root, spec["path"], exists=True)
    raw = path.read_bytes()
    sha = hash_bytes(raw)
    ident = "A" + hash_json([spec["role"], spec["path"], sha])[:18]
    text = None
    if path.suffix.lower() in TEXT_EXTENSIONS or spec.get("text", False):
        # Strict encoding: never silently replace corrupted EBCDIC bytes.
        text = raw.decode(spec["encoding"])
    lines = len(text.splitlines()) if text is not None else None
    item = {"artifact_id": ident, "role": spec["role"], "path": spec["path"], "sha256": sha,
            "bytes": len(raw), "encoding": spec["encoding"], "format": spec["format"], "lines": lines,
            "snapshot": f"{KNOWLEDGE}/evidence/{sha}.source", "text": text}
    if spec["role"] in {"idms", "manual", "generated", "original_lr", "expanded_idms"}:
        if text is None:
            raise ValueError(f"Primary COBOL must be a text artifact: {spec['path']}")
        item["profile"] = profile(text, spec["format"])
        actual = item["profile"]["program_id"]
        if not actual:
            raise ValueError(f"No readable PROGRAM-ID in {spec['path']}; check encoding/format")
        if spec.get("program_id") and actual != spec["program_id"].upper():
            raise ValueError(f"PROGRAM-ID mismatch in {spec['path']}: expected {spec['program_id']}, found {actual}")
    target = safe_path(root, item["snapshot"])
    target.parent.mkdir(parents=True, exist_ok=True)
    if target.exists():
        if file_hash(target) != sha:
            raise ValueError(f"Immutable evidence snapshot altered: {item['snapshot']}")
    else:
        # Exclusive creation prevents accidental clobber of an existing snapshot.
        with target.open("xb") as handle:
            handle.write(raw)
    return item


def engine_identity(root: Path) -> dict:
    path = root / "prompt/source_manifest.json"
    if not path.exists():
        return {"status": "ENGINE_DOCS_UNAVAILABLE", "fingerprint": None, "sources": {}}
    manifest = json.loads(path.read_text(encoding="utf-8"))
    identities = {n: d["sha256"] for n, d in manifest.get("sources", {}).items()}
    mismatches = [n for n, sha in identities.items() if (root / n).is_file() and file_hash(root / n) != sha]
    available = sum((root / n).is_file() for n in identities)
    return {"status": "STALE_ENGINE_DOCUMENTATION" if mismatches else ("SOURCE_HASHES_VERIFIED" if available == len(identities) and identities else "DOC_SNAPSHOT_ONLY"),
            "fingerprint": hash_json(identities), "document_manifest_sha256": file_hash(path),
            "source_files_present": available, "source_files_documented": len(identities), "mismatches": mismatches,
            "sources": manifest.get("sources", {})}


def analyze_inputs(root: Path, config: dict, program: dict, track: str, engine: dict | None = None) -> dict:
    if track not in {"baseline", "gap"}:
        raise ValueError("Track must be baseline or gap")
    artifacts = [load_artifact(root, s) for s in program_specs(config, program, track)]
    manual_id = next(a["profile"]["program_id"] for a in artifacts if a["role"] == "manual")
    for a in artifacts:
        if a["role"] == "generated" and a["profile"]["program_id"] != manual_id:
            raise ValueError(f"Generated PROGRAM-ID {a['profile']['program_id']} differs from manual {manual_id}")
    identity = [{k: a[k] for k in ("artifact_id", "role", "path", "sha256", "encoding", "format")} for a in artifacts]
    stamp = {"program_id": program["id"], "track": track, "artifacts": identity, "tool_fingerprint": tool_fingerprint()}
    if track == "gap":
        engine = engine if engine is not None else engine_identity(root)
        stamp["engine"] = {k: v for k, v in engine.items() if k != "sources"}
    fingerprint = hash_json(stamp)
    # Every primary source line is in a bounded, reviewable chunk. Nothing is silently truncated.
    chunks = []
    chunk_lines = int(config.get("chunk_lines", 80))
    if not 10 <= chunk_lines <= 200:
        raise ValueError("chunk_lines must be 10..200")
    for a in artifacts:
        if a["lines"] and a["role"] in {"idms", "manual", "generated", "original_lr", "expanded_idms"}:
            for start in range(1, a["lines"] + 1, chunk_lines):
                end = min(start + chunk_lines - 1, a["lines"])
                chunks.append({"chunk_id": a["artifact_id"] + f":L{start}-{end}", "artifact_id": a["artifact_id"], "start_line": start, "end_line": end})
    provenance = {"status": "NOT_APPLICABLE"}
    if track == "gap":
        candidate = next((a for a in artifacts if a["role"] == "generated"), None)
        receipt = next((a for a in artifacts if a["role"] == "engine_receipt"), None)
        provenance = {"status": "ENGINE_OUTPUT_MISSING" if candidate is None else "IMPORTED_CANDIDATE_PRODUCER_UNVERIFIED"}
        if receipt and candidate:
            record = json.loads(receipt["text"] or "{}")
            attached = [x for x in record.get("generated_candidates", []) if x.get("program_id") == program["id"] and x.get("sha256") == candidate["sha256"] and x.get("path") == candidate["path"]]
            originals = {a["path"]: a["sha256"] for a in artifacts if a["role"] in ROLES_A - {"original_lr"}}
            input_match = all(record.get("original_input_hashes", {}).get(n) == sha for n, sha in originals.items())
            source_match = record.get("engine_fingerprint") == (engine or {}).get("fingerprint")
            provenance = {"status": "BOUND_CAPTURE_RECEIPT" if len(attached) == 1 and input_match and source_match else "RECEIPT_MISMATCH_OR_INCOMPLETE",
                          "engine_exit_code": record.get("exit_code"), "original_input_hashes_match": input_match,
                          "documented_engine_hash_matches": source_match, "production_approved": False}
    return {"schema_version": 1, "program_id": program["id"], "track": track, "fingerprint": fingerprint, "generation_provenance": provenance,
            "input_identity": stamp, "artifacts": [{k: v for k, v in a.items() if k != "text"} for a in artifacts],
            "chunks": chunks, "semantic_status": "NOT_REVIEWED", "compile_status": "NOT_VERIFIED",
            "runtime_status": "NOT_VERIFIED", "engine_identity": stamp.get("engine")}


def current_analysis(root: Path, program_id: str, track: str) -> dict:
    if not SAFE_ID.fullmatch(program_id):
        raise ValueError("Invalid program identifier")
    return read_json(root, f"{KNOWLEDGE}/programs/{program_id}/{track}.json")


def artifact_text(root: Path, item: dict) -> str:
    path = safe_path(root, item["snapshot"], exists=True)
    if file_hash(path) != item["sha256"]:
        raise ValueError("Corrupted evidence snapshot")
    if item["lines"] is None:
        raise ValueError("Opaque/binary metadata requires its original reader; no invented line references")
    return path.read_bytes().decode(item["encoding"])


def ev(item: dict, start: int, end: int | None = None) -> dict:
    return {"artifact_id": item["artifact_id"], "sha256": item["sha256"], "start_line": start, "end_line": end or start}


def csv_register(root: Path, csv_path: str, config_path: str, expected: int, metadata: list[dict] | None = None) -> dict:
    with safe_path(root, csv_path, exists=True).open(encoding="utf-8-sig", newline="") as handle:
        rows = list(csv.DictReader(handle))
    if len(rows) != expected:
        raise ValueError(f"Expected {expected} explicitly paired rows, found {len(rows)}")
    programs = []
    for row in rows:
        if row.get("pairing_confirmed", "").strip().lower() != "yes":
            raise ValueError("Each pairing_confirmed CSV value must be yes; file naming is not pairing evidence")
        entry = {"id": row["id"].strip(), "pairing_confirmed": True}
        for role in ("idms", "manual", "generated"):
            if row.get(role, "").strip():
                entry[role] = {"path": row[role].strip(), "encoding": row.get(role + "_encoding", "").strip() or row.get("encoding", "").strip() or "utf-8-sig", "format": row.get(role + "_format", "").strip() or row.get("format", "").strip() or "fixed"}
        programs.append(entry)
    config = {"schema_version": 1, "expected_programs": expected, "chunk_lines": 80, "programs": programs, "metadata": metadata or []}
    # Validate before replacing an existing manifest, and never destroy old reviews.
    temp_name = "prompt/temp/registration_validation.json"
    write_json(root, temp_name, config)
    load_config(root, temp_name)
    write_json(root, config_path, config)
    safe_path(root, temp_name).unlink()
    return config
