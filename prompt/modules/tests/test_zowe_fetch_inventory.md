# `tests/test_zowe_fetch_inventory.py`

Source: [tests/test_zowe_fetch_inventory.py](../../../tests/test_zowe_fetch_inventory.py) | 315 lines.
Owning logic guide: [prompt/10_TESTING_AND_VALIDATION.md](../../10_TESTING_AND_VALIDATION.md).
Source SHA-256: `0063b0714c90da71629920f962b7a6b7448edd64136e9ef4a75188704552f84c`.

Generated source map. Read this file to locate the relevant symbols, then inspect the touched source before changing behavior. Lexical calls/branches are not a proof of runtime wiring or semantic equivalence.

## Responsibility

Source-declared description (not an independently verified runtime claim):

> Generic fetch inventory tests: no mainframe credentials or network required.

## Import declarations

```python
from pathlib import Path
from unittest.mock import Mock
import pytest
from openpyxl import load_workbook
from mainframe.zowe_fetcher import ZoweFetcher
from mainframe.zowe_manifest import HEADERS, InventoryRow, build_inventory_rows, classify_mode, write_inventory, build_manifest_rows, write_execution_manifest
from mainframe.zowe_resolver import resolve_dependencies
from mainframe.zowe_workspace import clean_generated, ensure_workspace, inventory_path
from mainframe.zowe_rules import ARTIFACT_EXTENSIONS, FETCH_INVENTORY_FILENAME
from mainframe.zowe_pipeline_steps import step_fetch, step_convert
from mainframe.zowe_search_history import http_attempt
```

## Local dependency notes

- [mainframe/zowe_fetcher.py](../mainframe/zowe_fetcher.md)
- [mainframe/zowe_manifest.py](../mainframe/zowe_manifest.md)
- [mainframe/zowe_pipeline_steps.py](../mainframe/zowe_pipeline_steps.md)
- [mainframe/zowe_resolver.py](../mainframe/zowe_resolver.md)
- [mainframe/zowe_rules.py](../mainframe/zowe_rules.md)
- [mainframe/zowe_search_history.py](../mainframe/zowe_search_history.md)
- [mainframe/zowe_workspace.py](../mainframe/zowe_workspace.md)

## Symbol contracts and control points

### `fixed` - L18-L19

```python
fixed(body, indicator=' ', number=100)
```

### `read_rows` - L22-L28

```python
read_rows(path)
```

Observed calls (lexical order): `load_workbook`, `book.active.iter_rows`, `book.close`.

### `workspace` - L32-L35

```python
workspace(tmp_path, monkeypatch)
```

Observed calls (lexical order): `monkeypatch.setenv`, `str`, `ensure_workspace`.

### `fake_libraries` - L39-L59

```python
fake_libraries(monkeypatch)
```

Observed calls (lexical order): `monkeypatch.setattr`.

### `fake_libraries.Library` - L43-L55

```python
class Library()
```

### `fake_libraries.Library.__init__` - L44-L48

```python
__init__(self, artifact)
```

### `fake_libraries.Library.download` - L50-L55

```python
download(self, member)
```

Observed calls (lexical order): `calls.append`, `registry.get`, `http_attempt`, `content.encode`.

### `test_mode` - L87-L88

```python
test_mode(source, expected)
```

Observed calls (lexical order): `classify_mode`.

### `test_missing_copy_never_certifies_retrieval` - L91-L93

```python
test_missing_copy_never_certifies_retrieval()
```

Observed calls (lexical order): `classify_mode`.

### `test_literal_and_comment_dependency_noise` - L96-L110

```python
test_literal_and_comment_dependency_noise()
```

Observed calls (lexical order): `'\n'.join`, `fixed`, `resolve_dependencies`.

### `test_numbered_and_unsequenced_fixed_comments` - L113-L115

```python
test_numbered_and_unsequenced_fixed_comments()
```

Observed calls (lexical order): `resolve_dependencies`.

### `test_writer_one_sheet_idempotent_upsert` - L118-L133

```python
test_writer_one_sheet_idempotent_upsert(workspace)
```

Observed calls (lexical order): `InventoryRow`, `write_inventory`, `read_rows`, `load_workbook`, `tuple`, `book.close`.

### `test_failure_does_not_overwrite_previous_file` - L136-L144

```python
test_failure_does_not_overwrite_previous_file(workspace, monkeypatch)
```

Observed calls (lexical order): `InventoryRow`, `write_inventory`, `path.read_bytes`, `Mock`, `PermissionError`, `monkeypatch.setattr`, `pytest.raises`, `list`, `path.parent.glob`, `path.with_suffix`, `path.with_suffix('.xlsx.lock').exists`.

### `test_corrupt_inventory_is_not_silently_replaced` - L147-L152

```python
test_corrupt_inventory_is_not_silently_replaced(workspace)
```

Observed calls (lexical order): `inventory_path`, `path.write_bytes`, `pytest.raises`, `InventoryRow`, `write_inventory`, `path.read_bytes`.

### `test_concurrent_writer_refused` - L155-L158

```python
test_concurrent_writer_refused(workspace)
```

Observed calls (lexical order): `inventory_path`, `inventory_path().with_suffix`, `inventory_path().with_suffix('.xlsx.lock').touch`, `pytest.raises`, `InventoryRow`, `write_inventory`.

### `test_duplicate_rows_rejected` - L161-L163

```python
test_duplicate_rows_rejected(workspace)
```

Observed calls (lexical order): `pytest.raises`, `InventoryRow`, `write_inventory`.

### `test_excel_formula_text_is_not_executed` - L166-L171

```python
test_excel_formula_text_is_not_executed(workspace)
```

Observed calls (lexical order): `InventoryRow`, `write_inventory`, `load_workbook`, `book.close`.

### `test_cleanup_preserves_only_inventory_and_inputs` - L174-L186

```python
test_cleanup_preserves_only_inventory_and_inputs(workspace)
```

Observed calls (lexical order): `InventoryRow`, `write_inventory`, `path.read_bytes`, `(workspace / name).write_text`, `(workspace / 'Review/old').mkdir`, `(workspace / 'Review/old/report.txt').touch`, `clean_generated`, `(workspace / 'Output').iterdir`, `list`, `(workspace / 'Review').iterdir`, `(workspace / 'Program/original.cbl').read_text`.

Control points:

- L177: `for name in ('Output/stale.cbl', 'Review/approved.txt', 'Program/original.cbl')`

### `test_fetch_uses_lr_elements_and_records_missing_members` - L189-L207

```python
test_fetch_uses_lr_elements_and_records_missing_members(workspace, fake_libraries)
```

Observed calls (lexical order): `registry.update`, `ZoweFetcher`, `ZoweFetcher(['APP0001']).fetch_all`, `read_rows`, `calls.count`, `load_workbook`, `book.close`.

### `test_missing_copy_and_stale_disk_file_are_not_success` - L210-L218

```python
test_missing_copy_and_stale_disk_file_are_not_success(workspace, fake_libraries)
```

Observed calls (lexical order): `(workspace / 'Copybook/MISSING.cpy').write_text`, `ZoweFetcher`, `ZoweFetcher(['P1']).fetch_all`, `read_rows`, `load_workbook`, `book.close`.

### `test_failed_program_and_unattempted_selected_rows_replace_stale_success` - L221-L231

```python
test_failed_program_and_unattempted_selected_rows_replace_stale_success(workspace, fake_libraries)
```

Observed calls (lexical order): `InventoryRow`, `write_inventory`, `pytest.raises`, `ZoweFetcher`, `ZoweFetcher(['P1', 'P2', 'P3']).fetch_all`, `inventory_path`, `read_rows`.

### `test_write_inside_copy_is_update` - L234-L239

```python
test_write_inside_copy_is_update(workspace, fake_libraries)
```

Observed calls (lexical order): `ZoweFetcher`, `ZoweFetcher(['P1']).fetch_all`, `read_rows`.

### `test_partial_fetch_keeps_other_rows_and_deduplicates_selection` - L242-L248

```python
test_partial_fetch_keeps_other_rows_and_deduplicates_selection(workspace, fake_libraries)
```

Observed calls (lexical order): `ZoweFetcher`, `ZoweFetcher(['P1']).fetch_all`, `ZoweFetcher(['p2', 'P2']).fetch_all`, `inventory_path`, `read_rows`, `set`.

### `test_75_programs_one_inventory_shared_downloads_once` - L251-L264

```python
test_75_programs_one_inventory_shared_downloads_once(workspace, fake_libraries)
```

Observed calls (lexical order): `range`, `ZoweFetcher`, `ZoweFetcher(members).fetch_all`, `inventory_path`, `len`, `read_rows`, `calls.count`, `(workspace / 'reports').glob`, `list`.

Control points:

- L254: `for member in members`

### `test_six_source_assets_offline_match_fetch_resolution` - L267-L284

```python
test_six_source_assets_offline_match_fetch_resolution(workspace, fake_libraries)
```

Observed calls (lexical order): `Path`, `Path(__file__).resolve`, `(source_root / folder).iterdir`, `path.is_file`, `path.read_text`, `path.stem.upper`, `sorted`, `ZoweFetcher`, `ZoweFetcher(members).fetch_all`, `read_rows`, `build_inventory_rows`, `len`, `list`, `r.values`, `sum`, `build_manifest_rows`.
Another 1 call expressions are in this source span; the list is intentionally bounded.

Control points:

- L270: `for (folder, artifact) in (('Program', 'PROGRAM'), ('Copybook', 'COPYBOOK'), ('Subschema', 'SUBSCHEMA'), ('DCLGen', 'DCLGEN'))`
- L272: `for path in (source_root / folder).iterdir()`
- L273: `if path.is_file()`

### `test_fetch_to_convert_workbook_survives` - L287-L297

```python
test_fetch_to_convert_workbook_survives(workspace, fake_libraries, monkeypatch)
```

Observed calls (lexical order): `monkeypatch.setattr`, `step_fetch`, `inventory_path`, `inventory_path().read_bytes`, `(workspace / 'Mapping Sheet/mapping.csv').write_text`, `step_convert`.

### `test_empty_program_list_is_not_default_selection` - L300-L302

```python
test_empty_program_list_is_not_default_selection(workspace)
```

Observed calls (lexical order): `pytest.raises`, `ZoweFetcher`.

### `test_continued_literal_is_not_dependency_or_mode_evidence` - L306-L315

```python
test_continued_literal_is_not_dependency_or_mode_evidence()
```

Observed calls (lexical order): `'\n'.join`, `fixed`, `classify_mode`, `resolve_dependencies`.

## Change responsibility

After modifying this Python file, review [prompt/10_TESTING_AND_VALIDATION.md](../../10_TESTING_AND_VALIDATION.md), update any affected behavioral contracts, then run `python prompt/tools/maintain_docs.py refresh` and `python prompt/tools/maintain_docs.py check` from the repository root. Keep scratch Markdown only in `prompt/temp/`. Generated notes must not be hand-edited; add explanations to the owning guide.
