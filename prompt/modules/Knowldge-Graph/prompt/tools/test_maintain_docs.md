# `Knowldge-Graph/prompt/tools/test_maintain_docs.py`

Source: [Knowldge-Graph/prompt/tools/test_maintain_docs.py](../../../../../Knowldge-Graph/prompt/tools/test_maintain_docs.py) | 161 lines.
Owning logic guide: [prompt/04_LR_IDMS_DB2_CONVERSION.md](../../../../04_LR_IDMS_DB2_CONVERSION.md).
Source SHA-256: `d560b30f842c81311f8c0f5855c4c4208357f4ff6d0d37ace5393eca6f9a19b8`.

Generated source map. Read this file to locate the relevant symbols, then inspect the touched source before changing behavior. Lexical calls/branches are not a proof of runtime wiring or semantic equivalence.

## Responsibility

Source-declared description (not an independently verified runtime claim):

> Isolated tests for documentation maintenance, not converter validation.

## Module-level bindings

`MODULE_PATH` (L11), `SPEC` (L12), `docs` (L13)

## Import declarations

```python
from __future__ import annotations
import contextlib
import importlib.util
import io
import json
import tempfile
import unittest
from pathlib import Path
```

## Symbol contracts and control points

### `DocumentationTests` - L18-L157

```python
class DocumentationTests(unittest.TestCase)
```

### `DocumentationTests.setUp` - L19-L32

```python
setUp(self)
```

Observed calls (lexical order): `parent.mkdir`, `tempfile.TemporaryDirectory`, `Path`, `(self.root / 'prompt/tools').mkdir`, `(self.root / 'prompt/temp').mkdir`, `(self.root / 'readme.md').write_text`, `(self.root / 'pyproject.toml').write_text`, `docs.GUIDES.values`, `(self.root / guide).write_text`, `self.put`.

Control points:

- L28: `for guide in docs.GUIDES.values()`

### `DocumentationTests.tearDown` - L34-L35

```python
tearDown(self)
```

Observed calls (lexical order): `self.tmp.cleanup`.

### `DocumentationTests.put` - L37-L40

```python
put(self, name: str, text: str)
```

Observed calls (lexical order): `path.parent.mkdir`, `path.write_text`.

### `DocumentationTests.build` - L42-L44

```python
build(self, reviewed=None)
```

Observed calls (lexical order): `contextlib.redirect_stdout`, `io.StringIO`, `docs.build`.

### `DocumentationTests.check` - L46-L49

```python
check(self)
```

Observed calls (lexical order): `contextlib.redirect_stdout`, `io.StringIO`, `docs.check`, `json.loads`, `output.getvalue`.

### `DocumentationTests.test_complete_coverage_and_valid_navigation` - L51-L59

```python
test_complete_coverage_and_valid_navigation(self)
```

Observed calls (lexical order): `self.assertEqual`, `self.build`, `self.check`, `(self.root / 'prompt/modules/mainframe/worker.md').read_text`, `self.assertIn`.

### `DocumentationTests.test_stale_python_detected` - L61-L66

```python
test_stale_python_detected(self)
```

Observed calls (lexical order): `self.build`, `self.put`, `self.check`, `self.assertEqual`, `any`, `self.assertTrue`.

### `DocumentationTests.test_guide_review_required_before_refresh` - L68-L74

```python
test_guide_review_required_before_refresh(self)
```

Observed calls (lexical order): `self.build`, `self.put`, `self.assertEqual`, `(self.root / 'prompt/temp/documentation_sync_needed.json').exists`, `self.assertTrue`, `self.check`.

### `DocumentationTests.test_changed_guide_satisfies_review` - L76-L81

```python
test_changed_guide_satisfies_review(self)
```

Observed calls (lexical order): `self.build`, `self.put`, `self.assertEqual`, `self.check`.

### `DocumentationTests.test_new_source_requires_documentation` - L83-L88

```python
test_new_source_requires_documentation(self)
```

Observed calls (lexical order): `self.build`, `self.put`, `self.check`, `self.assertEqual`, `any`, `self.assertTrue`.

### `DocumentationTests.test_removed_module_note_is_pruned` - L90-L95

```python
test_removed_module_note_is_pruned(self)
```

Observed calls (lexical order): `self.build`, `(self.root / 'tests/test_worker.py').unlink`, `self.assertEqual`, `(self.root / 'prompt/modules/tests/test_worker.md').exists`, `self.assertFalse`, `self.check`.

### `DocumentationTests.test_markdown_outside_prompt_rejected` - L97-L102

```python
test_markdown_outside_prompt_rejected(self)
```

Observed calls (lexical order): `self.build`, `self.put`, `self.check`, `self.assertEqual`, `any`, `self.assertTrue`.

### `DocumentationTests.test_temporary_markdown_allowed` - L104-L107

```python
test_temporary_markdown_allowed(self)
```

Observed calls (lexical order): `self.build`, `self.put`, `self.assertEqual`, `self.check`.

### `DocumentationTests.test_broken_local_link_rejected` - L109-L114

```python
test_broken_local_link_rejected(self)
```

Observed calls (lexical order): `self.build`, `self.put`, `self.check`, `self.assertEqual`, `any`, `self.assertTrue`.

### `DocumentationTests.test_manual_edit_of_generated_note_rejected` - L116-L121

```python
test_manual_edit_of_generated_note_rejected(self)
```

Observed calls (lexical order): `self.build`, `self.put`, `self.check`, `self.assertEqual`, `any`, `self.assertTrue`.

### `DocumentationTests.test_relative_import_resolution` - L123-L127

```python
test_relative_import_resolution(self)
```

Observed calls (lexical order): `self.put`, `self.build`, `docs.load_manifest`, `self.assertIn`.

### `DocumentationTests.test_data_model_fields_documented` - L129-L133

```python
test_data_model_fields_documented(self)
```

Observed calls (lexical order): `self.put`, `self.build`, `(self.root / 'prompt/modules/mainframe/model.md').read_text`, `self.assertIn`.

### `DocumentationTests.test_malformed_python_fails_refresh` - L135-L138

```python
test_malformed_python_fails_refresh(self)
```

Observed calls (lexical order): `self.put`, `self.assertRaises`, `self.build`.

### `DocumentationTests.test_tool_changes_require_maintenance_review` - L140-L145

```python
test_tool_changes_require_maintenance_review(self)
```

Observed calls (lexical order): `self.build`, `self.put`, `self.assertEqual`, `self.check`.

### `DocumentationTests.test_engine_python_is_never_modified` - L147-L152

```python
test_engine_python_is_never_modified(self)
```

Observed calls (lexical order): `docs.sources`, `p.read_bytes`, `p.relative_to`, `str`, `self.build`, `self.check`, `self.assertEqual`.

### `DocumentationTests.test_inline_code_is_not_a_markdown_link` - L154-L157

```python
test_inline_code_is_not_a_markdown_link(self)
```

Observed calls (lexical order): `self.build`, `self.put`, `self.assertEqual`, `self.check`.

## Change responsibility

After modifying this Python file, review [prompt/04_LR_IDMS_DB2_CONVERSION.md](../../../../04_LR_IDMS_DB2_CONVERSION.md), update any affected behavioral contracts, then run `python prompt/tools/maintain_docs.py refresh` and `python prompt/tools/maintain_docs.py check` from the repository root. Keep scratch Markdown only in `prompt/temp/`. Generated notes must not be hand-edited; add explanations to the owning guide.
