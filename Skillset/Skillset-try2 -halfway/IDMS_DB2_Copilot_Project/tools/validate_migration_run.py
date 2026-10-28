#!/usr/bin/env python3
"""Portable entry point to the canonical skill's read-only validator."""
from pathlib import Path
import runpy

if __name__ == "__main__":
    script = (Path(__file__).resolve().parents[1] / ".github" / "skills" /
              "analyze-idms-db2-migration" / "scripts" / "validate_run.py")
    runpy.run_path(str(script), run_name="__main__")
