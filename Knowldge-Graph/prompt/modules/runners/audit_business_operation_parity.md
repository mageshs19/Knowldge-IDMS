# `runners/audit_business_operation_parity.py`

Source: [runners/audit_business_operation_parity.py](../../../runners/audit_business_operation_parity.py) | 73 lines.
Owning logic guide: [prompt/09_REVIEW_AND_RELEASE_GATES.md](../../09_REVIEW_AND_RELEASE_GATES.md).
Source SHA-256: `6463b6cf576cc3f249197cea30954c7fd7ed54791f3a4511fd557b11a065b75a`.

Generated source map. Read this file to locate the relevant symbols, then inspect the touched source before changing behavior. Lexical calls/branches are not a proof of runtime wiring or semantic equivalence.

## Responsibility

Source-declared description (not an independently verified runtime claim):

> Audit source IDMS DML family coverage in converted DB2 COBOL candidates.

## Module-level bindings

`DEFAULT_ROOT` (L9), `DEFAULT_PAIRS` (L10)

## Import declarations

```python
from __future__ import annotations
import argparse
from pathlib import Path
from converter.analyzers.program_flow.business_operation_parity_audit import BusinessOperationParityAuditor
```

## Local dependency notes

- [converter/analyzers/program_flow/business_operation_parity_audit.py](../converter/analyzers/program_flow/business_operation_parity_audit.md)

## Importers (1)

Static imports only; dependency injection, string imports and runtime dispatch can add edges.

- [tests/test_audit_business_operation_parity_runner.py](../tests/test_audit_business_operation_parity_runner.md)

## Symbol contracts and control points

### `latest_candidate` - L20-L23

```python
latest_candidate(output_dir: Path, target_prefix: str) -> Path | None
```

Return newest generated output regardless of timestamp/stable filename style.

Observed calls (lexical order): `output_dir.glob`, `path.is_file`, `max`, `path.stat`.

### `main` - L26-L69

```python
main() -> int
```

Observed calls (lexical order): `argparse.ArgumentParser`, `parser.add_argument`, `parser.parse_args`, `BusinessOperationParityAuditor`, `bool`, `parser.error`, `isinstance`, `latest_candidate`, `print`, `source_path.is_file`, `target_path.is_file`, `auditor.audit`, `','.join`, `len`.

Control points:

- L38: `if bool(args.source) != bool(args.output)`
- L41: `for (source_name, target_prefix) in pairs`
- L43: `if args.source and args.output`
- L49: `if target_path is None`
- L53: `if not source_path.is_file() or not target_path.is_file()`
- L64: `for issue in report.issues`
- L66: `for review in report.reviews`

## Change responsibility

After modifying this Python file, review [prompt/09_REVIEW_AND_RELEASE_GATES.md](../../09_REVIEW_AND_RELEASE_GATES.md), update any affected behavioral contracts, then run `python prompt/tools/maintain_docs.py refresh` and `python prompt/tools/maintain_docs.py check` from the repository root. Keep scratch Markdown only in `prompt/temp/`. Generated notes must not be hand-edited; add explanations to the owning guide.
