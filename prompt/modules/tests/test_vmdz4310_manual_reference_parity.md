# `tests/test_vmdz4310_manual_reference_parity.py`

Source: [tests/test_vmdz4310_manual_reference_parity.py](../../../tests/test_vmdz4310_manual_reference_parity.py) | 59 lines.
Owning logic guide: [prompt/10_TESTING_AND_VALIDATION.md](../../10_TESTING_AND_VALIDATION.md).
Source SHA-256: `d5627f4534ef818b6be1d4813baba1b77ff1f2e5a0c2297f07d2631ebabbfba1`.

Generated source map. Read this file to locate the relevant symbols, then inspect the touched source before changing behavior. Lexical calls/branches are not a proof of runtime wiring or semantic equivalence.

## Responsibility

No module-level purpose docstring. The symbol contracts and observed dependencies below are extracted from source; use the owning guide for subsystem context.

## Module-level bindings

`ROOT` (L6), `GENERATED` (L7), `MANUAL` (L8)

## Import declarations

```python
from __future__ import annotations
import re
from pathlib import Path
```

## Symbol contracts and control points

### `_sql_block` - L11-L15

```python
_sql_block(text: str, table: str) -> str
```

Observed calls (lexical order): `text.index`, `text.rfind`.

### `test_parent_select_projection_is_minimal_and_into_aligned` - L18-L30

```python
test_parent_select_projection_is_minimal_and_into_aligned()
```

Observed calls (lexical order): `GENERATED.read_text`, `_sql_block`, `block.index`, `re.findall`, `len`, `c.replace`, `columns.count`.

### `test_input_and_treated_totals_are_both_counted_and_displayed` - L33-L39

```python
test_input_and_treated_totals_are_both_counted_and_displayed()
```

Observed calls (lexical order): `GENERATED.read_text`.

### `test_bounded_lrf_is_singleton_and_fixed_format_is_clean` - L42-L51

```python
test_bounded_lrf_is_singleton_and_fixed_format_is_clean()
```

Observed calls (lexical order): `GENERATED.read_text`, `all`, `generated.splitlines`, `len`, `line[7:72].rstrip`, `max`.

### `test_manual_reference_has_total_input_and_treated_counters` - L54-L59

```python
test_manual_reference_has_total_input_and_treated_counters()
```

Observed calls (lexical order): `MANUAL.read_text`.

## Change responsibility

After modifying this Python file, review [prompt/10_TESTING_AND_VALIDATION.md](../../10_TESTING_AND_VALIDATION.md), update any affected behavioral contracts, then run `python prompt/tools/maintain_docs.py refresh` and `python prompt/tools/maintain_docs.py check` from the repository root. Keep scratch Markdown only in `prompt/temp/`. Generated notes must not be hand-edited; add explanations to the owning guide.
