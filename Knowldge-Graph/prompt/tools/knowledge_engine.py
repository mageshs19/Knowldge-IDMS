"""Optional frozen-engine adapter: isolated copies, convert -> review only.

This is filesystem isolation for trusted project code, NOT an OS security sandbox.
No fetch, upload, package installation, generated-source patching, or credential
copying is performed by this adapter. See the System 2 runbook.
"""
from __future__ import annotations

import json
import os
import signal
import subprocess
import sys
import uuid
from datetime import datetime, timezone
from pathlib import Path

from knowledge_core import (
    DEFAULT_CONFIG, descriptor, engine_identity, file_hash, hash_json, program_specs,
    safe_path, write_json,
)
from knowledge_extract import profile


def run_engine(root: Path, config: dict, config_name: str, engine_root: Path,
               programs: list[dict], execute: bool, timeout: int, python: str) -> tuple[int, dict]:
    engine_root = engine_root.resolve()
    identity = engine_identity(engine_root)
    if identity["status"] != "SOURCE_HASHES_VERIFIED":
        raise ValueError("A complete current engine snapshot is required for execution. Prompt-only mode supports baseline and imported generated output.")
    if not (engine_root / "mainframe/zowe_pipeline.py").is_file():
        raise ValueError("Supplied snapshot has no mainframe.zowe_pipeline adapter")
    if not 1 <= timeout <= 7200:
        raise ValueError("Timeout must be 1..7200 seconds")
    command = [python, "-m", "mainframe.zowe_pipeline", "all", "--from", "convert", "--to", "review"]
    plan = {"command": command, "programs": [p["id"] for p in programs], "engine_fingerprint": identity["fingerprint"],
            "network_steps": "NO_FETCH_OR_UPLOAD", "timeout_seconds": timeout,
            "execution": "PLAN_ONLY", "note": "Pass --execute only for a trusted engine. The adapter is not a security sandbox."}
    if not execute:
        return 0, plan
    stamp = datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%SZ") + "-" + uuid.uuid4().hex[:8]
    prefix = f"prompt/temp/system2-engine/{stamp}"
    staging = safe_path(root, prefix + "/engine")
    workspace = safe_path(root, prefix + "/workspace")
    staging.mkdir(parents=True)
    staged_code = {}
    # Copy documented Python sources only. Never copy .env, credentials or old outputs.
    for name, info in identity["sources"].items():
        if name.startswith("tests/"):
            continue
        original = safe_path(engine_root, name, exists=True)
        target = staging / name
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes(original.read_bytes())
        staged_code[name] = info["sha256"]
    # Templates/configuration used by the existing project, not personal settings.
    for directory in ("config", "converter", "rules", "patterns", "catalogs", "runners", "review", "mainframe"):
        for original in (engine_root / directory).rglob("*"):
            if not original.is_file() or original.suffix.lower() not in {".json", ".toml", ".yaml", ".yml", ".txt", ".csv", ".cbl", ".cpy", ".sql"}:
                continue
            rel = original.relative_to(engine_root)
            if "workspace" in rel.parts or any(part.startswith(".") for part in rel.parts) or "__pycache__" in rel.parts:
                continue
            safe_path(engine_root, rel.as_posix(), exists=True)
            target = staging / rel
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_bytes(original.read_bytes())
            staged_code[rel.as_posix()] = file_hash(original)
    # Stops dotenv search from walking into an outer user's environment file.
    (staging / ".env").write_text("# Isolated analysis run. No remote credentials.\n", encoding="utf-8")
    folders = {"idms": "Program", "manual": "Manual Output", "copybook": "Copybook", "sql_include": "Copybook", "dclgen": "DCLGen", "mapping": "Mapping Sheet", "subschema": "Subschema"}
    original_hashes, staged_inputs, expected_targets = {}, {}, {}
    for p in programs:
        manual_spec = descriptor(p["manual"], "manual")
        manual_text = safe_path(root, manual_spec["path"], exists=True).read_bytes().decode(manual_spec["encoding"])
        target_id = profile(manual_text, manual_spec["format"])["program_id"]
        if not target_id or target_id in expected_targets.values():
            raise ValueError("Missing or duplicate DB2 target identity")
        expected_targets[p["id"]] = target_id
        for spec in program_specs(config, p, "baseline"):
            if spec["role"] not in folders:
                continue
            original = safe_path(root, spec["path"], exists=True)
            original_hashes[spec["path"]] = file_hash(original)
            name = original.name
            content = original.read_bytes()
            if spec["role"] in {"idms", "manual"}:
                text = content.decode(spec["encoding"])
                member = profile(text, spec["format"])["program_id"]
                if not member:
                    raise ValueError("Input PROGRAM-ID is not readable")
                if spec["format"] != "fixed":
                    raise ValueError("The existing adapter has only been wired for fixed-format COBOL; do not silently reformat free source")
                name = member + ".cbl"
                content = text.encode("utf-8")
            elif original.suffix.lower() in {".csv", ".txt", ".cpy", ".cbl", ".sql"}:
                content = content.decode(spec["encoding"]).encode("utf-8")
            destination = f"{folders[spec['role']]}/{name}"
            sha = __import__('hashlib').sha256(content).hexdigest()
            if destination in staged_inputs and staged_inputs[destination] != sha:
                raise ValueError(f"Conflicting input member names: {destination}")
            staged_inputs[destination] = sha
            target = workspace / destination
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_bytes(content)
    for folder in set(folders.values()) | {"Output", "Review", "Logs"}:
        (workspace / folder).mkdir(exist_ok=True)
    # Restrict inherited environment; no remote credentials or former workspace roots.
    env = {k: v for k, v in os.environ.items() if k in {"PATH", "SYSTEMROOT", "WINDIR", "HOME", "USERPROFILE", "TMP", "TEMP", "TMPDIR", "LANG", "LC_ALL", "VIRTUAL_ENV", "LD_LIBRARY_PATH"}}
    env.update({"ZOWE_WORKSPACE_ROOT": str(workspace), "IDMS_INPUT_DIR": str(workspace),
                "PYTHONPATH": str(staging) + os.pathsep + str(staging / "src"), "PYTHONUNBUFFERED": "1", "PYTHONDONTWRITEBYTECODE": "1"})
    transcript = safe_path(root, prefix + "/engine.log")
    timed_out, error = False, None
    with transcript.open("wb") as output:
        try:
            process = subprocess.Popen(command, cwd=staging, env=env, stdout=output, stderr=subprocess.STDOUT,
                                       start_new_session=os.name != "nt")
            try:
                exit_code = process.wait(timeout=timeout)
            except subprocess.TimeoutExpired:
                timed_out = True
                if os.name == "nt":
                    subprocess.run(["taskkill", "/PID", str(process.pid), "/T", "/F"], stdout=output, stderr=subprocess.STDOUT, check=False)
                else:
                    os.killpg(process.pid, signal.SIGKILL)
                process.wait()
                exit_code = 124
        except OSError as exc:
            exit_code, error = 127, str(exc)
    # Promote finished artifacts out of scratch before attaching them to the manifest.
    # This allows the staged engine copy to be cleaned without losing active evidence.
    durable_prefix = f"prompt/knowledge/engine_runs/{stamp}"
    durable = safe_path(root, durable_prefix)
    for directory in ("Output", "Review", "Logs"):
        for produced in (workspace / directory).rglob("*"):
            if not produced.is_file():
                continue
            rel = produced.relative_to(workspace)
            if produced.suffix.lower() == ".md":
                # Any draft Markdown emitted by an external engine stays in prompt/temp/.
                continue
            destination = durable / rel
            destination.parent.mkdir(parents=True, exist_ok=True)
            destination.write_bytes(produced.read_bytes())
    durable.mkdir(parents=True, exist_ok=True)
    (durable / "engine.log").write_bytes(transcript.read_bytes())
    transcript = durable / "engine.log"
    generated = {}
    for path in sorted((durable / "Output").glob("*.cbl")):
        text = path.read_text(encoding="utf-8-sig")
        pid = profile(text)["program_id"]
        generated.setdefault(pid, []).append(path)
    receipt_name = durable_prefix + "/receipt.json"
    manifest_backup = prefix + "/manifest_before.json"
    write_json(root, manifest_backup, config)
    attached, errors = [], []
    for p in programs:
        # An unsuccessful new run cannot leave an older candidate active by accident.
        if p.get("generated"):
            p["previous_generated"] = p["generated"]
        p.pop("generated", None)
        p.pop("expanded_idms", None)
        p["engine_receipt"] = receipt_name
        p["metadata"] = [m for m in p.get("metadata", []) if m.get("role") not in {"engine_review", "engine_log", "derived_copybook"}]
        choices = generated.get(expected_targets[p["id"]], [])
        if len(choices) != 1:
            errors.append(f"{p['id']}: expected one output, found {len(choices)}")
            continue
        path = choices[0]
        p["generated"] = {"path": path.relative_to(root).as_posix(), "program_id": expected_targets[p["id"]], "encoding": "utf-8-sig", "format": "fixed"}
        p["engine_receipt"] = receipt_name
        preserved = [m for m in p.get("metadata", []) if m.get("role") not in {"engine_review", "engine_log", "derived_copybook"}]
        evidence = [{"path": transcript.relative_to(root).as_posix(), "role": "engine_log", "encoding": "utf-8", "format": "free"}]
        for report in sorted((durable / "Review").glob("*")):
            if report.is_file() and (report.name.startswith(expected_targets[p["id"]] + "_") or report.name == "semantic_release_gate.txt"):
                evidence.append({"path": report.relative_to(root).as_posix(), "role": "engine_review", "encoding": "utf-8-sig", "format": "free"})
        for derived in sorted((durable / "Output/Generated Copybooks").glob("*.cpy")):
            evidence.append({"path": derived.relative_to(root).as_posix(), "role": "derived_copybook", "encoding": "utf-8-sig", "format": "fixed"})
        p["metadata"] = preserved + evidence
        intermediate = durable / "Output/LRF" / (expected_targets[p["id"]] + "_lrf_to_idms.cbl")
        if intermediate.is_file():
            intermediate_id = profile(intermediate.read_text(encoding="utf-8-sig"))["program_id"]
            if intermediate_id:
                p["expanded_idms"] = {"path": intermediate.relative_to(root).as_posix(), "encoding": "utf-8-sig", "format": "fixed", "program_id": intermediate_id}
        attached.append({"program_id": p["id"], "path": p["generated"]["path"], "sha256": file_hash(path)})
    unchanged = all(file_hash(safe_path(root, name, exists=True)) == sha for name, sha in original_hashes.items())
    receipt = {**plan, "execution": "EXECUTED", "exit_code": exit_code, "timed_out": timed_out, "launch_error": error,
               "generated_candidates": attached, "attachment_errors": errors, "original_inputs_unchanged": unchanged,
               "engine_files": staged_code, "staged_inputs": staged_inputs, "original_input_hashes": original_hashes,
               "transcript": transcript.relative_to(root).as_posix(), "transcript_sha256": file_hash(transcript),
               "production_approved": False, "generated_status": "CANDIDATE_ONLY_EVEN_IF_EXIT_ZERO",
               "metadata_transcoding": "Staged text inputs decoded with configured encoding and encoded UTF-8. Original files untouched."}
    write_json(root, receipt_name, receipt)
    if not unchanged:
        raise ValueError("Original input hashes changed during execution; inspect receipt and do not proceed")
    write_json(root, config_name, config)
    return (0 if exit_code == 0 and not errors else 2), {"receipt": receipt_name, "engine_exit_code": exit_code,
            "attached_candidates": len(attached), "errors": errors, "original_inputs_unchanged": unchanged,
            "next": "Run build to analyze attached candidate output; engine rejection is preserved, never a parity pass."}
