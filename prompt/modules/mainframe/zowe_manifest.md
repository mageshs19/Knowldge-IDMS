# `mainframe/zowe_manifest.py`

Source: [mainframe/zowe_manifest.py](../../../mainframe/zowe_manifest.py) | 388 lines.
Owning logic guide: [prompt/02_MAINFRAME_PIPELINE.md](../../02_MAINFRAME_PIPELINE.md).
Source SHA-256: `c7f0555c9c197ae111ec12a8e85a2b13e34ca44cedc67a7b635e7d4e1ed60b75`.

Generated source map. Read this file to locate the relevant symbols, then inspect the touched source before changing behavior. Lexical calls/branches are not a proof of runtime wiring or semantic equivalence.

## Responsibility

Source-declared description (not an independently verified runtime claim):

> One maintained fetch inventory, with an offline workspace rebuild command.

## Module-level bindings

`HEADERS` (L32), `SHEET_NAME` (L33), `HEADER_ROW` (L34), `SOURCE_EXTENSIONS` (L35), `_READY_MODE` (L36), `_WRITE` (L40), `_READ` (L44), `_SQL_WRITE` (L45), `_SQL_READ` (L46), `_COPY_STMT` (L47), `_PREFIX_REPLACING` (L48)

## Import declarations

```python
from __future__ import annotations
import argparse
from dataclasses import dataclass, field
from datetime import datetime, timezone
import hashlib
from pathlib import Path
import re
from collections.abc import Iterable
from contextlib import ExitStack
from openpyxl import Workbook, load_workbook
from openpyxl.comments import Comment
from openpyxl.styles import Alignment, Font, PatternFill
from openpyxl.worksheet.table import Table, TableStyleInfo
from mainframe.zowe_resolver import ProgramDependencies, dclgen_members_for_record, expand_copy_dependencies, logical_text, mask_literals, resolve_dependencies
from mainframe.zowe_rules import FETCH_INVENTORY_FILENAME
from mainframe.zowe_workspace import workspace_root, inventory_path
from mainframe.zowe_report_io import report_lock, atomic_save_workbook
from rules.program_kind_rules import IDMS_WRITE_VERBS
```

## Local dependency notes

- [mainframe/zowe_report_io.py](zowe_report_io.md)
- [mainframe/zowe_resolver.py](zowe_resolver.md)
- [mainframe/zowe_rules.py](zowe_rules.md)
- [mainframe/zowe_workspace.py](zowe_workspace.md)
- [rules/program_kind_rules.py](../rules/program_kind_rules.md)

## Importers (4)

Static imports only; dependency injection, string imports and runtime dispatch can add edges.

- [mainframe/zowe_fetcher.py](zowe_fetcher.md)
- [mainframe/zowe_workspace.py](zowe_workspace.md)
- [tests/test_zowe_fetch_inventory.py](../tests/test_zowe_fetch_inventory.md)
- [tests/test_zowe_reports_history.py](../tests/test_zowe_reports_history.md)

## Symbol contracts and control points

### `InventoryRow` - L54-L64

```python
class InventoryRow()
```

Declared class/data-model fields:

```python
program: str
copybooks: list[str] = field(default_factory=list)
dclgens: list[str] = field(default_factory=list)
subschema: str = ''
mode: str = 'Unknown'
notes: dict[str, str] = field(default_factory=dict)
```

### `InventoryRow.values` - L62-L64

```python
values(self) -> tuple[str, ...]
```

Observed calls (lexical order): `'\n'.join`, `set`, `sorted`.

### `classify_mode` - L67-L107

```python
classify_mode(sources: Iterable[tuple[str, str]], *, complete: bool=True) -> tuple[str, str]
```

Inventory access mode from live source, never from program naming.

Observed calls (lexical order): `logical_text`, `mask_literals`, `re.search`, `_COPY_STMT.finditer`, `copy.group`, `_PREFIX_REPLACING.fullmatch`, `clause.group`, `_COPY_STMT.sub`, `_READY_MODE.finditer`, `match.group`, `match.group(0).strip`, `(update if match.group(1).upper() == 'UPDATE' else retrieval).append`, `match.group(1).upper`, `_WRITE.finditer`, `update.append`, `_SQL_WRITE.search`.
Another 5 call expressions are in this source span; the list is intentionally bounded.

Control points:

- L79: `for (name, source) in sources`
- L81: `if '�' in text or re.search('>>\\s*IF\\b', text, re.I)`
- L83: `for copy in _COPY_STMT.finditer(text)`
- L87: `if clause and (not _PREFIX_REPLACING.fullmatch(clause.group(0)))`
- L90: `for match in _READY_MODE.finditer(text)`
- L93: `for match in _WRITE.finditer(text)`
- L95: `if _SQL_WRITE.search(text)`
- L97: `if _READ.search(text) or _SQL_READ.search(text)`
- Another 3 conditions/loops exist in this source span.

### `make_inventory_row` - L110-L153

```python
make_inventory_row(deps: ProgramDependencies, source: str, *, source_path: Path, copy_sources: Iterable[tuple[str, str]]=(), observations: dict[tuple[str, str], str] | None=None, origin: str='Local workspace scan (not a mainframe fetch)') -> InventoryRow
```

Build the five columns and per-cell evidence from the same fetch closure.

Observed calls (lexical order): `list`, `name.upper`, `classify_mode`, `all`, `hashlib.sha256`, `hashlib.sha256(source.encode()).hexdigest`, `source.encode`, `datetime.now`, `datetime.now(timezone.utc).isoformat`, `'\n'.join`, `observations.get`, `set`, `sorted`, `InventoryRow`.

Control points:

- L131: `for (column, artifact, members) in ((HEADERS[1], 'COPYBOOK', deps.copybooks), (HEADERS[2], 'DCLGEN', deps.dclgens), (HEADERS[3], 'SUBSCHEMA', [deps.subschema] if deps.subschema else...`
- L145: `if not deps.subschema`
- L150: `if not all((member in loaded for member in deps.copybooks))`

### `_existing_rows` - L156-L184

```python
_existing_rows(path: Path) -> dict[str, InventoryRow]
```

Observed calls (lexical order): `path.exists`, `load_workbook`, `ValueError`, `range`, `sheet.cell`, `tuple`, `sheet.iter_rows`, `any`, `str`, `values[0].strip`, `values[0].strip().upper`, `InventoryRow`, `values[1].splitlines`, `values[2].splitlines`, `enumerate`, `book.close`.

Control points:

- L157: `if not path.exists()`
- L162: `if book.sheetnames != [SHEET_NAME]`
- L165: `if tuple((sheet.cell(HEADER_ROW, c).value for c in range(1, 6))) != HEADERS`
- L168: `for cells in sheet.iter_rows(min_row=HEADER_ROW + 1, max_col=5)`
- L169: `if not any((c.value is not None for c in cells))`
- L173: `if not name or name in result or any((c.data_type == 'f' for c in cells))`

Explicit raises: `ValueError('expected a single Program Inventory sheet')`; `ValueError('inventory column schema does not match')`; `ValueError('duplicate/empty member or formula in inventory')`; `ValueError(f'Cannot read inventory {path}; original file retained: {exc}')`.

### `_workbook` - L187-L246

```python
_workbook(rows: list[InventoryRow]) -> Workbook
```

Observed calls (lexical order): `Workbook`, `sheet.merge_cells`, `Font`, `PatternFill`, `len`, `Alignment`, `enumerate`, `sheet.cell`, `row.values`, `ValueError`, `row.notes.get`, `Comment`, `max`, `v.splitlines`, `min`, `zip`.
Another 3 call expressions are in this source span; the list is intentionally bounded.

Control points:

- L204: `for (col, title) in enumerate(HEADERS, 1)`
- L210: `for (number, row) in enumerate(rows, HEADER_ROW + 1)`
- L211: `for (column, value) in enumerate(row.values(), 1)`
- L212: `if len(value) > 32767`
- L220: `if note`
- L221: `if len(note) > 32767`
- L224: `if 'WARNING:' in note`
- L227: `if number % 2 == 0`
- Another 2 conditions/loops exist in this source span.

Explicit raises: `ValueError(f'Excel cell limit exceeded for {row.program}; no truncated report written')`; `ValueError(f'Excel evidence limit exceeded for {row.program}')`.

### `write_inventory` - L249-L283

```python
write_inventory(rows: Iterable[InventoryRow], path: Path | None=None) -> tuple[Path, int]
```

Upsert programs into reports/, migrating legacy Review inventory safely.

Observed calls (lexical order): `Path`, `inventory_path`, `legacy.is_file`, `legacy.is_symlink`, `legacy.parent.is_symlink`, `ExitStack`, `sorted`, `report_lock`, `stack.enter_context`, `_existing_rows`, `_existing_rows(legacy).items`, `ValueError`, `records.setdefault`, `set`, `row.program.strip`, `row.program.strip().upper`.
Another 6 call expressions are in this source span; the list is intentionally bounded.

Control points:

- L260: `for candidate in sorted({path, legacy} if migrate else {path}, key=str)`
- L263: `if migrate`
- L264: `for (key, row) in _existing_rows(legacy).items()`
- L265: `if key in records and records[key] != row`
- L269: `for row in rows`
- L271: `if not key or key in incoming`
- L281: `if migrate`

Explicit raises: `ValueError(f'Conflicting legacy/current inventory row {key}; both originals retained')`; `ValueError('Each incoming inventory member must have one unique nonempty name')`.

### `migrate_legacy_inventory` - L286-L292

```python
migrate_legacy_inventory(root: Path | None=None) -> Path | None
```

Local-only migration, including before conversion cleanup; no fetch call.

Observed calls (lexical order): `Path`, `workspace_root`, `old.is_file`, `old.is_symlink`, `old.parent.is_symlink`, `write_inventory`.

Control points:

- L290: `if old.is_file() and (not old.is_symlink()) and (not old.parent.is_symlink())`

### `_local_members` - L295-L305

```python
_local_members(folder: Path) -> dict[str, Path]
```

Observed calls (lexical order): `folder.is_dir`, `folder.iterdir`, `sorted`, `path.is_file`, `path.suffix.lower`, `path.stem.upper`, `ValueError`.

Control points:

- L297: `if not folder.is_dir()`
- L299: `for path in sorted(folder.iterdir())`
- L300: `if path.is_file() and path.suffix.lower() in SOURCE_EXTENSIONS | {'.cpy'}`
- L302: `if key in result`

Explicit raises: `ValueError(f'Ambiguous local member {key} in {folder}')`.

### `build_inventory_rows` - L308-L359

```python
build_inventory_rows(root: Path | None=None) -> list[InventoryRow]
```

Rebuild current local inputs without credentials or network access.

Observed calls (lexical order): `Path`, `workspace_root`, `_local_members`, `programs.items`, `sorted`, `path.read_text`, `resolve_dependencies`, `expand_copy_dependencies`, `schemas.get`, `schema_path.relative_to`, `list`, `dclgen_members_for_record`, `members.extend`, `set`, `dclgens.get`, `target.relative_to`.
Another 5 call expressions are in this source span; the list is intentionally bounded.

Control points:

- L316: `for (program, path) in sorted(programs.items())`
- L337: `if deps.subschema`
- L343: `for record in deps.records`
- L346: `for member in deps.dclgens`

### `build_manifest_rows` - L362-L365

```python
build_manifest_rows() -> list[str]
```

Compatibility view of the inventory; no broken legacy constant imports.

Observed calls (lexical order): `' - '.join`, `row.values`, `value.replace`, `build_inventory_rows`.

### `write_execution_manifest` - L368-L371

```python
write_execution_manifest() -> tuple[Path | None, int]
```

Compatibility entrypoint now maintains the same Excel inventory.

Observed calls (lexical order): `build_inventory_rows`, `write_inventory`.

### `main` - L374-L384

```python
main() -> None
```

Observed calls (lexical order): `argparse.ArgumentParser`, `parser.add_argument`, `parser.parse_args`, `workspace_root`, `build_inventory_rows`, `print`, `write_inventory`.

Control points:

- L380: `if not rows`

## Change responsibility

After modifying this Python file, review [prompt/02_MAINFRAME_PIPELINE.md](../../02_MAINFRAME_PIPELINE.md), update any affected behavioral contracts, then run `python prompt/tools/maintain_docs.py refresh` and `python prompt/tools/maintain_docs.py check` from the repository root. Keep scratch Markdown only in `prompt/temp/`. Generated notes must not be hand-edited; add explanations to the owning guide.
