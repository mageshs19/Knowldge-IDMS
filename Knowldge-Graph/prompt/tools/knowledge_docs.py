#!/usr/bin/env python3
"""Maintain the System 2 tooling notes; no engine import or code execution.

Update owning guides when behavior changes, then refresh. This tool checks source
and doc freshness, not whether prose fully proves the implementation correct.
"""
from __future__ import annotations

import argparse
import ast
import json
from pathlib import Path

from knowledge_core import file_hash, read_json, safe_path, write_json, write_text

ROOT = Path(__file__).resolve().parents[2]
MANIFEST = "prompt/system2/tool_manifest.json"
ARCH = "prompt/system2/01_ARCHITECTURE_AND_CONTRACTS.md"
REVIEW = "prompt/system2/02_REVIEW_AND_HANDOFF.md"
RUNBOOK = "prompt/system2/06_RUNBOOK.md"
SOURCES = {
    "knowledge_core.py": ARCH,
    "knowledge_extract.py": ARCH,
    "knowledge_reports.py": ARCH,
    "knowledge_review.py": REVIEW,
    "knowledge_engine.py": RUNBOOK,
    "knowledge_pipeline.py": RUNBOOK,
    "knowledge_docs.py": ARCH,
    "test_program_knowledge.py": ARCH,
}


def refresh(root: Path, reviewed: list[str]) -> dict:
    old = read_json(root, MANIFEST) if safe_path(root, MANIFEST).is_file() else {}
    current = {"prompt/tools/" + n: file_hash(safe_path(root, "prompt/tools/" + n, exists=True)) for n in SOURCES}
    if set(reviewed) - set(SOURCES.values()):
        raise ValueError("Unknown System 2 owning guide")
    required = {SOURCES[Path(n).name] for n, sha in current.items() if old.get("sources", {}).get(n, {}).get("sha256") != sha}
    if old:
        pending = [g for g in required if g not in reviewed and file_hash(safe_path(root, g, exists=True)) == old.get("guides", {}).get(g)]
        if pending:
            raise ValueError("Update/review System 2 guides first: " + ", ".join(sorted(pending)))
    manifest = {"schema_version": 1, "sources": {}, "guides": {g: file_hash(safe_path(root, g, exists=True)) for g in sorted(set(SOURCES.values()))}}
    index = ["# System 2 tool source map", "", "Generated symbol navigation, not a semantic proof. After Python changes, update the owning guide, then run `python prompt/tools/knowledge_docs.py refresh` and `check`.", "", "| Tool | Matching note | Owning contract |", "|---|---|---|"]
    for filename, guide in SOURCES.items():
        relative = "prompt/tools/" + filename
        text = safe_path(root, relative, exists=True).read_text(encoding="utf-8")
        tree = ast.parse(text)
        doc = "prompt/system2/modules/" + filename[:-3] + ".md"
        lines = [f"# {filename}", "", f"Source: [Python](../../tools/{filename}); SHA-256 `{current[relative]}`.",
                 f"Owning guide: [contract](../{Path(guide).name}).", "", ast.get_docstring(tree) or "No module docstring.", "", "## Symbols", ""]
        for node in tree.body:
            if isinstance(node, (ast.FunctionDef, ast.AsyncFunctionDef, ast.ClassDef)):
                sig = node.name + ("(" + ast.unparse(node.args) + ")" if hasattr(node, "args") else "")
                lines += [f"### {node.name} (L{node.lineno}-L{node.end_lineno})", "", "```python", sig, "```", "", ast.get_docstring(node) or "Read the owning guide and this source span for the actual contract.", ""]
        lines += ["## Update rule", "", "Change the owning guide together with this source; refresh these generated notes instead of hand-editing them. Scratch Markdown goes only in prompt/temp/. Existing engine source notes are maintained separately by maintain_docs.py.", ""]
        write_text(root, doc, "\n".join(lines))
        manifest["sources"][relative] = {"sha256": current[relative], "doc": doc, "doc_sha256": file_hash(safe_path(root, doc)), "guide": guide}
        index.append(f"| `{filename}` | [note](modules/{filename[:-3]}.md) | [{Path(guide).stem}]({Path(guide).name}) |")
    write_text(root, "prompt/system2/08_TOOL_SOURCE_MAP.md", "\n".join(index) + "\n")
    write_json(root, MANIFEST, manifest)
    return {"result": "REFRESHED", "tool_notes": len(manifest["sources"])}


def check(root: Path) -> dict:
    manifest = read_json(root, MANIFEST)
    errors = []
    for relative, row in manifest["sources"].items():
        for name, sha in ((relative, row["sha256"]), (row["doc"], row["doc_sha256"])):
            if not safe_path(root, name).is_file() or file_hash(safe_path(root, name)) != sha:
                errors.append("Stale or missing: " + name)
    for guide, sha in manifest["guides"].items():
        if not safe_path(root, guide).is_file() or file_hash(safe_path(root, guide)) != sha:
            errors.append("Changed guide needs refresh: " + guide)
    if set(manifest["sources"]) != {"prompt/tools/" + n for n in SOURCES}:
        errors.append("Tool coverage mismatch")
    return {"result": "PASS" if not errors else "FAIL", "scope": "System 2 tool documentation freshness", "tools": len(SOURCES), "errors": errors}


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("command", choices=("refresh", "check"))
    parser.add_argument("--root", type=Path, default=ROOT)
    parser.add_argument("--reviewed-guide", action="append", default=[])
    args = parser.parse_args()
    try:
        result = refresh(args.root.resolve(), args.reviewed_guide) if args.command == "refresh" else check(args.root.resolve())
        print(json.dumps(result, indent=2))
        return 2 if result.get("errors") else 0
    except (OSError, ValueError, KeyError) as exc:
        print(json.dumps({"result": "ERROR", "message": str(exc)}))
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
