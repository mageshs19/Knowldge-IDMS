# `tests/test_zowe_reports_history.py`

Source: [tests/test_zowe_reports_history.py](../../../tests/test_zowe_reports_history.py) | 351 lines.
Owning logic guide: [prompt/10_TESTING_AND_VALIDATION.md](../../10_TESTING_AND_VALIDATION.md).
Source SHA-256: `bec5cbec98b9102e76d323bb517e3e5ffc1a7b656c5cda2c12729788ce472457`.

Generated source map. Read this file to locate the relevant symbols, then inspect the touched source before changing behavior. Lexical calls/branches are not a proof of runtime wiring or semantic equivalence.

## Responsibility

Source-declared description (not an independently verified runtime claim):

> Offline report/recording logic tests. Fetch, transport and network are forbidden.

## Import declarations

```python
from __future__ import annotations
import ast
from dataclasses import replace
from pathlib import Path
from unittest.mock import Mock
import pytest
import requests
from openpyxl import load_workbook
from mainframe.zowe_manifest import HEADERS as INVENTORY_HEADERS, InventoryRow, make_inventory_row, migrate_legacy_inventory, write_inventory
from mainframe.zowe_resolver import resolve_dependencies
from mainframe.zowe_search_history import HEADERS, HistoryRow, SearchAttempt, SearchHistoryRecorder, exception_attempt, http_attempt, write_search_history
from mainframe.zowe_workspace import clean_generated, ensure_workspace, inventory_path, reports_dir, search_history_path
from mainframe.zowe_libraries import LibrarySearch
from mainframe.zowe_fetcher import ZoweFetcher
```

## Local dependency notes

- [mainframe/zowe_fetcher.py](../mainframe/zowe_fetcher.md)
- [mainframe/zowe_libraries.py](../mainframe/zowe_libraries.md)
- [mainframe/zowe_manifest.py](../mainframe/zowe_manifest.md)
- [mainframe/zowe_resolver.py](../mainframe/zowe_resolver.md)
- [mainframe/zowe_search_history.py](../mainframe/zowe_search_history.md)
- [mainframe/zowe_workspace.py](../mainframe/zowe_workspace.md)

## Symbol contracts and control points

### `offline_only` - L28-L37

```python
offline_only(monkeypatch)
```

Observed calls (lexical order): `monkeypatch.setattr`.

Control points:

- L34: `for method in ('_lookup', 'download', 'locate', 'list_members')`
- L36: `for method in ('fetch_all', '_fetch_program', '_fetch_dependencies', '_fetch_member')`

### `offline_only.forbidden` - L29-L30

```python
forbidden(*args, **kwargs)
```

Observed calls (lexical order): `AssertionError`.

Explicit raises: `AssertionError('Fetch/network prohibited: report logic tests only')`.

### `workspace` - L41-L44

```python
workspace(tmp_path, monkeypatch)
```

Observed calls (lexical order): `monkeypatch.setenv`, `str`, `ensure_workspace`.

### `observation` - L47-L50

```python
observation(program='P1', member='COMMON', run_id='run-1', result='Found', library='TEST.CPY(COMMON)')
```

Observed calls (lexical order): `HistoryRow`.

### `read_history` - L53-L59

```python
read_history(path)
```

Observed calls (lexical order): `load_workbook`, `tuple`, `book.active.iter_rows`, `book.close`.

### `test_report_paths_and_workspace_override` - L62-L66

```python
test_report_paths_and_workspace_override(workspace)
```

Observed calls (lexical order): `reports_dir`, `inventory_path`, `search_history_path`, `reports_dir().is_dir`.

### `test_no_subschema_keeps_empty_cell_and_no_false_missing_warning` - L69-L79

```python
test_no_subschema_keeps_empty_cell_and_no_false_missing_warning(workspace)
```

Observed calls (lexical order): `make_inventory_row`, `resolve_dependencies`, `Path`, `write_inventory`, `load_workbook`, `book.close`.

### `test_unresolved_copy_does_not_claim_subschema_not_required` - L82-L87

```python
test_unresolved_copy_does_not_claim_subschema_not_required()
```

Observed calls (lexical order): `Path`, `make_inventory_row`, `resolve_dependencies`.

### `test_missing_referenced_schema_retains_its_name` - L90-L95

```python
test_missing_referenced_schema_retains_its_name()
```

Observed calls (lexical order): `Path`, `make_inventory_row`, `resolve_dependencies`.

### `test_status_classification` - L100-L104

```python
test_status_classification(status, result)
```

Observed calls (lexical order): `http_attempt`.

### `test_error_details_never_persist_raw_credentials` - L110-L114

```python
test_error_details_never_persist_raw_credentials(exc)
```

Observed calls (lexical order): `exception_attempt`, `type`.

### `test_failed_first_library_then_found_preserves_both` - L117-L122

```python
test_failed_first_library_then_found_preserves_both()
```

Observed calls (lexical order): `SearchHistoryRecorder`, `http_attempt`, `recorder.record`.

### `test_shared_dependency_repeated_for_each_program_with_cache_provenance` - L125-L134

```python
test_shared_dependency_repeated_for_each_program_with_cache_provenance()
```

Observed calls (lexical order): `SearchHistoryRecorder`, `http_attempt`, `recorder.record`, `len`.

### `test_shared_negative_result_is_not_hidden_for_second_program` - L137-L142

```python
test_shared_negative_result_is_not_hidden_for_second_program()
```

Observed calls (lexical order): `SearchHistoryRecorder`, `http_attempt`, `recorder.record`.

### `test_all_three_dependency_types_and_separate_members` - L145-L151

```python
test_all_three_dependency_types_and_separate_members()
```

Observed calls (lexical order): `SearchHistoryRecorder`, `http_attempt`, `recorder.record`.

Control points:

- L147: `for (artifact, member) in (('COPYBOOK', 'CP1'), ('COPYBOOK', 'CP2'), ('DCLGEN', 'DCL1'), ('SUBSCHEMA', 'SUB1'))`

### `test_no_schema_no_invented_history_row` - L154-L161

```python
test_no_schema_no_invented_history_row(workspace)
```

Observed calls (lexical order): `write_search_history`, `read_history`, `load_workbook`, `tuple`, `book.close`.

### `test_absent_trace_is_not_fabricated_as_found` - L164-L168

```python
test_absent_trace_is_not_fabricated_as_found()
```

Observed calls (lexical order): `SearchHistoryRecorder`, `recorder.record`.

### `test_local_save_error_keeps_remote_success` - L171-L175

```python
test_local_save_error_keeps_remote_success()
```

Observed calls (lexical order): `SearchHistoryRecorder`, `http_attempt`, `recorder.record`, `recorder.issue`.

### `test_history_append_new_runs_and_idempotent_republish` - L178-L190

```python
test_history_append_new_runs_and_idempotent_republish(workspace)
```

Observed calls (lexical order): `observation`, `write_search_history`, `replace`, `read_history`, `load_workbook`, `book.close`.

### `test_history_text_not_excel_formulas` - L193-L198

```python
test_history_text_not_excel_formulas(workspace)
```

Observed calls (lexical order): `observation`, `replace`, `write_search_history`, `load_workbook`, `book.close`.

### `test_history_append_failure_retains_previous_file` - L201-L209

```python
test_history_append_failure_retains_previous_file(workspace, monkeypatch)
```

Observed calls (lexical order): `observation`, `write_search_history`, `path.read_bytes`, `Mock`, `PermissionError`, `monkeypatch.setattr`, `pytest.raises`, `path.with_suffix`, `path.with_suffix('.xlsx.lock').exists`, `list`, `path.parent.glob`.

### `test_history_lock_refuses_parallel_writer` - L212-L218

```python
test_history_lock_refuses_parallel_writer(workspace)
```

Observed calls (lexical order): `search_history_path`, `path.with_suffix`, `lock.touch`, `pytest.raises`, `observation`, `write_search_history`, `lock.exists`.

### `test_corrupt_history_is_not_replaced` - L221-L226

```python
test_corrupt_history_is_not_replaced(workspace)
```

Observed calls (lexical order): `search_history_path`, `path.write_bytes`, `pytest.raises`, `observation`, `write_search_history`, `path.read_bytes`.

### `test_modified_history_header_is_not_overwritten` - L229-L238

```python
test_modified_history_header_is_not_overwritten(workspace)
```

Observed calls (lexical order): `observation`, `write_search_history`, `load_workbook`, `book.save`, `book.close`, `path.read_bytes`, `pytest.raises`.

### `test_invalid_new_history_rows_rejected` - L244-L247

```python
test_invalid_new_history_rows_rejected(workspace, change)
```

Observed calls (lexical order): `pytest.raises`, `observation`, `replace`, `write_search_history`, `search_history_path`, `search_history_path().exists`.

### `test_history_symlink_is_never_written` - L250-L256

```python
test_history_symlink_is_never_written(workspace)
```

Observed calls (lexical order): `target.write_bytes`, `search_history_path`, `search_history_path().symlink_to`, `pytest.raises`, `observation`, `write_search_history`, `target.read_bytes`.

### `test_excel_row_limit_preserves_existing` - L259-L265

```python
test_excel_row_limit_preserves_existing(workspace, monkeypatch)
```

Observed calls (lexical order): `observation`, `write_search_history`, `path.read_bytes`, `monkeypatch.setattr`, `pytest.raises`.

### `test_legacy_inventory_migrates_and_retains_unselected_rows` - L268-L277

```python
test_legacy_inventory_migrates_and_retains_unselected_rows(workspace)
```

Observed calls (lexical order): `InventoryRow`, `write_inventory`, `legacy.exists`, `load_workbook`, `book.close`.

### `test_conflicting_legacy_reports_refused_without_deletion` - L280-L288

```python
test_conflicting_legacy_reports_refused_without_deletion(workspace)
```

Observed calls (lexical order): `InventoryRow`, `write_inventory`, `inventory_path`, `inventory_path().read_bytes`, `pytest.raises`, `migrate_legacy_inventory`, `legacy.exists`.

### `test_migration_save_failure_leaves_legacy_intact` - L291-L299

```python
test_migration_save_failure_leaves_legacy_intact(workspace, monkeypatch)
```

Observed calls (lexical order): `InventoryRow`, `write_inventory`, `legacy.read_bytes`, `Mock`, `PermissionError`, `monkeypatch.setattr`, `pytest.raises`, `migrate_legacy_inventory`, `inventory_path`, `inventory_path().exists`.

### `test_cleanup_migrates_legacy_and_keeps_both_reports` - L302-L313

```python
test_cleanup_migrates_legacy_and_keeps_both_reports(workspace)
```

Observed calls (lexical order): `InventoryRow`, `write_inventory`, `observation`, `write_search_history`, `path.read_bytes`, `(workspace / 'Review/old_approval.txt').write_text`, `(workspace / 'Output/old.cbl').write_text`, `clean_generated`, `inventory_path`, `inventory_path().exists`, `(workspace / 'Review').iterdir`, `list`, `(workspace / 'Output').iterdir`.

### `test_75_program_associations_append_new_run` - L316-L324

```python
test_75_program_associations_append_new_run(workspace)
```

Observed calls (lexical order): `SearchHistoryRecorder`, `http_attempt`, `range`, `recorder.record`, `write_search_history`, `len`, `read_history`, `replace`.

Control points:

- L319: `for i in range(75)`

### `test_publish_reports_keeps_history_if_inventory_fails` - L327-L334

```python
test_publish_reports_keeps_history_if_inventory_fails(workspace, monkeypatch)
```

Observed calls (lexical order): `object.__new__`, `SearchHistoryRecorder`, `observation`, `Mock`, `PermissionError`, `monkeypatch.setattr`, `pytest.raises`, `InventoryRow`, `obj._publish_reports`, `read_history`, `search_history_path`.

### `test_static_integration_records_attempts_before_success_return` - L337-L351

```python
test_static_integration_records_attempts_before_success_return()
```

Inspect adapter integration without executing ANY lookup/fetch function.

Observed calls (lexical order): `Path`, `Path(__file__).resolve`, `(root / 'mainframe/zowe_libraries.py').read_text`, `ast.parse`, `ast.walk`, `isinstance`, `next`, `enumerate`, `ast.unparse`, `(root / 'mainframe/zowe_fetcher.py').read_text`.

## Change responsibility

After modifying this Python file, review [prompt/10_TESTING_AND_VALIDATION.md](../../10_TESTING_AND_VALIDATION.md), update any affected behavioral contracts, then run `python prompt/tools/maintain_docs.py refresh` and `python prompt/tools/maintain_docs.py check` from the repository root. Keep scratch Markdown only in `prompt/temp/`. Generated notes must not be hand-edited; add explanations to the owning guide.
