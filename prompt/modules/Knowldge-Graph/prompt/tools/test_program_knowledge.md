# `Knowldge-Graph/prompt/tools/test_program_knowledge.py`

Source: [Knowldge-Graph/prompt/tools/test_program_knowledge.py](../../../../../Knowldge-Graph/prompt/tools/test_program_knowledge.py) | 453 lines.
Owning logic guide: [prompt/04_LR_IDMS_DB2_CONVERSION.md](../../../../04_LR_IDMS_DB2_CONVERSION.md).
Source SHA-256: `47b67085ff5fb4ddbe3662d9f77726cd8c73b2d158f51ac2ca88bc0cc39c80bc`.

Generated source map. Read this file to locate the relevant symbols, then inspect the touched source before changing behavior. Lexical calls/branches are not a proof of runtime wiring or semantic equivalence.

## Responsibility

Source-declared description (not an independently verified runtime claim):

> Offline tests for System 2 collection, not IDMS/DB2 runtime equivalence.

## Module-level bindings

`SOURCE` (L21), `MANUAL` (L37)

## Import declarations

```python
from __future__ import annotations
import copy
import json
from pathlib import Path
import tempfile
import unittest
import zipfile
from knowledge_core import DEFAULT_CONFIG, KNOWLEDGE, TOPICS, analyze_inputs, artifact_text, csv_register, current_analysis, descriptor, ev, hash_json, load_artifact, load_config, safe_path, write_json, write_text
from knowledge_extract import canonical, profile, source_lines, split_list
from knowledge_pipeline import build, inventory, verify
from knowledge_reports import comparison_leads
from knowledge_review import aggregate, current_review, export_handoff, import_review, packet, validate_review, verify_handoff
import hashlib
from knowledge_engine import run_engine
import sys
from knowledge_core import engine_identity
```

## Symbol contracts and control points

### `ExtractTests` - L60-L109

```python
class ExtractTests(unittest.TestCase)
```

### `ExtractTests.test_program_id_free` - L61-L62

```python
test_program_id_free(self)
```

Observed calls (lexical order): `profile`, `self.assertEqual`.

### `ExtractTests.test_program_id_fixed` - L64-L66

```python
test_program_id_fixed(self)
```

Observed calls (lexical order): `'\n'.join`, `SOURCE.splitlines`, `enumerate`, `profile`, `self.assertEqual`.

### `ExtractTests.test_comment_not_call` - L68-L70

```python
test_comment_not_call(self)
```

Observed calls (lexical order): `profile`, `len`, `self.assertEqual`.

### `ExtractTests.test_literal_not_call` - L72-L74

```python
test_literal_not_call(self)
```

Observed calls (lexical order): `profile`, `len`, `self.assertEqual`.

### `ExtractTests.test_literal_whitespace_preserved` - L76-L77

```python
test_literal_whitespace_preserved(self)
```

Observed calls (lexical order): `canonical`, `self.assertNotEqual`.

### `ExtractTests.test_lowercase_outside_literal_normalized` - L79-L80

```python
test_lowercase_outside_literal_normalized(self)
```

Observed calls (lexical order): `canonical`, `self.assertEqual`.

### `ExtractTests.test_projection_and_hosts` - L82-L86

```python
test_projection_and_hosts(self)
```

Observed calls (lexical order): `profile`, `self.assertEqual`.

### `ExtractTests.test_sql_nested_list` - L88-L89

```python
test_sql_nested_list(self)
```

Observed calls (lexical order): `self.assertEqual`, `split_list`.

### `ExtractTests.test_unresolved_include_is_not_proven_broken` - L91-L93

```python
test_unresolved_include_is_not_proven_broken(self)
```

Observed calls (lexical order): `profile`, `self.assertEqual`.

### `ExtractTests.test_thru_target` - L95-L98

```python
test_thru_target(self)
```

Observed calls (lexical order): `SOURCE.replace`, `profile`, `self.assertEqual`, `self.assertFalse`.

### `ExtractTests.test_repeated_labels` - L100-L102

```python
test_repeated_labels(self)
```

Observed calls (lexical order): `profile`, `self.assertEqual`.

### `ExtractTests.test_unterminated_sql` - L104-L105

```python
test_unterminated_sql(self)
```

Observed calls (lexical order): `MANUAL.replace`, `profile`, `self.assertIn`.

### `ExtractTests.test_sequence_columns_excluded` - L107-L109

```python
test_sequence_columns_excluded(self)
```

Observed calls (lexical order): `source_lines`, `self.assertNotIn`.

### `WorkflowTests` - L112-L384

```python
class WorkflowTests(unittest.TestCase)
```

### `WorkflowTests.setUp` - L113-L129

```python
setUp(self)
```

Observed calls (lexical order): `tempfile.TemporaryDirectory`, `Path`, `self.addCleanup`, `(self.root / 'input').mkdir`, `(self.root / 'input/idms.cbl').write_text`, `(self.root / 'input/manual.cbl').write_text`, `(self.root / 'input/generated.cbl').write_text`, `MANUAL.replace`, `write_json`, `Path(__file__).resolve`, `p.read_text`, `write_text`.

Control points:

- L126: `for name in ('03_BASELINE_REVIEW_PROMPT.md', '04_ENGINE_GAP_PROMPT.md', '05_SYSTEM1_IMPLEMENTATION_PROMPT.md')`

### `WorkflowTests.do_build` - L131-L134

```python
do_build(self)
```

Observed calls (lexical order): `build`, `self.assertFalse`.

### `WorkflowTests.review` - L136-L147

```python
review(self, track='baseline', status='reviewed')
```

Observed calls (lexical order): `current_analysis`, `ev`, `next`, `current_review`, `hash_json`.

Control points:

- L144: `if track == 'gap'`

### `WorkflowTests.admit` - L149-L151

```python
admit(self, value)
```

Observed calls (lexical order): `write_json`, `import_review`.

### `WorkflowTests.test_dual_reports` - L153-L157

```python
test_dual_reports(self)
```

Observed calls (lexical order): `self.do_build`, `len`, `self.assertEqual`, `(self.root / 'prompt/knowledge/programs/DB1/01_idms_manual.md').is_file`, `self.assertTrue`, `(self.root / 'prompt/knowledge/programs/DB1/02_engine_gaps.md').is_file`.

### `WorkflowTests.test_resume` - L159-L161

```python
test_resume(self)
```

Observed calls (lexical order): `self.do_build`, `len`, `self.assertEqual`.

### `WorkflowTests.test_baseline_excludes_generated` - L163-L170

```python
test_baseline_excludes_generated(self)
```

Observed calls (lexical order): `self.do_build`, `current_analysis`, `(self.root / 'input/generated.cbl').write_text`, `self.assertEqual`.

### `WorkflowTests.test_baseline_excludes_engine_docs` - L172-L177

```python
test_baseline_excludes_engine_docs(self)
```

Observed calls (lexical order): `analyze_inputs`, `self.assertNotEqual`, `self.assertEqual`.

### `WorkflowTests.test_stale_source_detected` - L179-L182

```python
test_stale_source_detected(self)
```

Observed calls (lexical order): `self.do_build`, `(self.root / 'input/manual.cbl').write_text`, `self.assertEqual`, `verify`.

### `WorkflowTests.test_import_review` - L184-L186

```python
test_import_review(self)
```

Observed calls (lexical order): `self.do_build`, `self.admit`, `self.assertEqual`, `self.review`.

### `WorkflowTests.test_full_chunk_coverage_required` - L188-L193

```python
test_full_chunk_coverage_required(self)
```

Observed calls (lexical order): `self.do_build`, `self.review`, `self.assertRaisesRegex`, `self.admit`.

### `WorkflowTests.test_forged_hash_rejected` - L195-L200

```python
test_forged_hash_rejected(self)
```

Observed calls (lexical order): `self.do_build`, `self.review`, `self.assertRaises`, `self.admit`.

### `WorkflowTests.test_invalid_line_rejected` - L202-L207

```python
test_invalid_line_rejected(self)
```

Observed calls (lexical order): `self.do_build`, `self.review`, `self.assertRaises`, `self.admit`.

### `WorkflowTests.test_comparison_both_sides_required` - L209-L214

```python
test_comparison_both_sides_required(self)
```

Observed calls (lexical order): `self.do_build`, `self.review`, `self.assertRaisesRegex`, `self.admit`.

### `WorkflowTests.test_no_production_approval` - L216-L221

```python
test_no_production_approval(self)
```

Observed calls (lexical order): `self.do_build`, `self.review`, `self.assertRaises`, `self.admit`.

### `WorkflowTests.test_gap_requires_baseline_review` - L223-L226

```python
test_gap_requires_baseline_review(self)
```

Observed calls (lexical order): `self.do_build`, `self.assertRaisesRegex`, `self.admit`, `self.review`.

### `WorkflowTests.test_gap_binds_baseline` - L228-L235

```python
test_gap_binds_baseline(self)
```

Observed calls (lexical order): `self.do_build`, `self.admit`, `self.review`, `current_analysis`, `current_review`, `self.assertIsNone`.

### `WorkflowTests.test_export_hashes_and_no_source_default` - L237-L244

```python
test_export_hashes_and_no_source_default(self)
```

Observed calls (lexical order): `self.do_build`, `export_handoff`, `zipfile.ZipFile`, `any`, `n.endswith`, `self.assertFalse`, `z.namelist`, `json.loads`, `z.read`, `all`, `hashlib.sha256`, `hashlib.sha256(z.read(n)).hexdigest`, `manifest['files'].items`, `self.assertTrue`.

### `WorkflowTests.test_verify_transfer` - L246-L249

```python
test_verify_transfer(self)
```

Observed calls (lexical order): `self.do_build`, `export_handoff`, `self.assertEqual`, `verify_handoff`.

### `WorkflowTests.test_tampered_transfer` - L251-L260

```python
test_tampered_transfer(self)
```

Observed calls (lexical order): `self.do_build`, `export_handoff`, `target.parent.mkdir`, `zipfile.ZipFile`, `source.infolist`, `info.filename.endswith`, `output.writestr`, `source.read`, `self.assertRaisesRegex`, `verify_handoff`.

Control points:

- L257: `for info in source.infolist()`

### `WorkflowTests.test_export_evidence_opt_in` - L262-L266

```python
test_export_evidence_opt_in(self)
```

Observed calls (lexical order): `self.do_build`, `export_handoff`, `zipfile.ZipFile`, `any`, `n.endswith`, `self.assertTrue`, `z.namelist`.

### `WorkflowTests.test_no_export_overwrite` - L268-L272

```python
test_no_export_overwrite(self)
```

Observed calls (lexical order): `self.do_build`, `export_handoff`, `self.assertRaises`.

### `WorkflowTests.test_export_stale_refused` - L274-L278

```python
test_export_stale_refused(self)
```

Observed calls (lexical order): `self.do_build`, `(self.root / 'input/idms.cbl').write_text`, `self.assertRaisesRegex`, `export_handoff`.

### `WorkflowTests.test_packet_bound` - L280-L283

```python
test_packet_bound(self)
```

Observed calls (lexical order): `self.do_build`, `self.assertRaisesRegex`, `packet`.

### `WorkflowTests.test_packet_temp_location` - L285-L289

```python
test_packet_temp_location(self)
```

Observed calls (lexical order): `self.do_build`, `packet`, `result['packet'].startswith`, `self.assertTrue`, `(self.root / result['packet']).is_file`.

### `WorkflowTests.test_unknown_part` - L291-L294

```python
test_unknown_part(self)
```

Observed calls (lexical order): `self.do_build`, `self.assertRaises`, `packet`.

### `WorkflowTests.test_originals_preserved` - L296-L300

```python
test_originals_preserved(self)
```

Observed calls (lexical order): `(self.root / 'input').glob`, `p.read_bytes`, `self.do_build`, `aggregate`, `all`, `before.items`, `self.assertTrue`.

### `WorkflowTests.test_unknown_generated` - L302-L306

```python
test_unknown_generated(self)
```

Observed calls (lexical order): `self.do_build`, `aggregate`, `self.assertEqual`.

### `WorkflowTests.test_wrong_generated_identity` - L308-L311

```python
test_wrong_generated_identity(self)
```

Observed calls (lexical order): `(self.root / 'input/generated.cbl').write_text`, `MANUAL.replace`, `build`, `len`, `self.assertEqual`.

### `WorkflowTests.test_duplicate_pair_refused` - L313-L319

```python
test_duplicate_pair_refused(self)
```

Observed calls (lexical order): `copy.deepcopy`, `bad['programs'].append`, `write_json`, `self.assertRaisesRegex`, `load_config`.

### `WorkflowTests.test_count_mismatch` - L321-L325

```python
test_count_mismatch(self)
```

Observed calls (lexical order): `write_json`, `self.assertRaisesRegex`, `load_config`.

### `WorkflowTests.test_path_traversal_refused` - L327-L329

```python
test_path_traversal_refused(self)
```

Observed calls (lexical order): `self.assertRaises`, `safe_path`.

### `WorkflowTests.test_symlink_escape_refused` - L331-L338

```python
test_symlink_escape_refused(self)
```

Observed calls (lexical order): `path.symlink_to`, `self.skipTest`, `self.assertRaises`, `safe_path`.

### `WorkflowTests.test_markdown_policy` - L340-L342

```python
test_markdown_policy(self)
```

Observed calls (lexical order): `self.assertRaises`, `write_text`.

### `WorkflowTests.test_strict_encoding` - L344-L347

```python
test_strict_encoding(self)
```

Observed calls (lexical order): `(self.root / 'input/idms.cbl').write_bytes`, `self.assertRaises`, `analyze_inputs`.

### `WorkflowTests.test_corrupted_snapshot_detected` - L349-L353

```python
test_corrupted_snapshot_detected(self)
```

Observed calls (lexical order): `self.do_build`, `current_analysis`, `(self.root / a['snapshot']).write_bytes`, `self.assertEqual`, `verify`.

### `WorkflowTests.test_generic_renamed_inputs` - L355-L361

```python
test_generic_renamed_inputs(self)
```

Observed calls (lexical order): `p.read_text`, `p.read_text().replace`, `p.read_text().replace('WORK', 'HANDLE').replace`, `p.write_text`, `self.do_build`, `current_analysis`, `any`, `self.assertTrue`.

Control points:

- L356: `for name in ('idms', 'manual', 'generated')`

### `WorkflowTests.test_csv_register_requires_confirmation` - L363-L366

```python
test_csv_register_requires_confirmation(self)
```

Observed calls (lexical order): `write_text`, `self.assertRaises`, `csv_register`.

### `WorkflowTests.test_75_synthetic_pairs` - L368-L384

```python
test_75_synthetic_pairs(self)
```

Observed calls (lexical order): `range`, `MANUAL.replace`, `SOURCE.replace`, `(self.root / rel).write_text`, `programs.append`, `write_json`, `load_config`, `build`, `self.assertFalse`, `len`, `self.assertEqual`, `aggregate`.

Control points:

- L370: `for n in range(75)`
- L372: `for (role, text) in (('idms', SOURCE.replace('SRC1', f'SRC{n}')), ('manual', MANUAL.replace('DB1', f'DB{n}')), ('generated', MANUAL.replace('DB1', f'DB{n}')))`

### `EngineAdapterTests` - L387-L449

```python
class EngineAdapterTests(unittest.TestCase)
```

Declared class/data-model fields:

```python
setUp = WorkflowTests.setUp
```

### `EngineAdapterTests.make_engine` - L389-L409

```python
make_engine(self, fail=0, delay=0)
```

Observed calls (lexical order): `(engine / 'mainframe').mkdir`, `(engine / 'prompt').mkdir`, `(engine / 'mainframe/zowe_pipeline.py').write_text`, `(engine / 'mainframe/__init__.py').write_text`, `(engine / 'mainframe').glob`, `hashlib.sha256`, `hashlib.sha256(p.read_bytes()).hexdigest`, `p.read_bytes`, `p.relative_to`, `p.relative_to(engine).as_posix`, `(engine / 'prompt/source_manifest.json').write_text`, `json.dumps`, `'\n'.join`, `path.read_text`, `path.read_text().splitlines`, `path.write_text`.

Control points:

- L405: `for role in ('idms', 'manual')`

### `EngineAdapterTests.test_engine_plan_only` - L411-L418

```python
test_engine_plan_only(self)
```

Observed calls (lexical order): `self.make_engine`, `run_engine`, `self.assertEqual`, `(self.root / 'prompt/temp/system2-engine').exists`, `self.assertFalse`.

### `EngineAdapterTests.test_engine_rejection_keeps_receipt_and_candidate` - L420-L432

```python
test_engine_rejection_keeps_receipt_and_candidate(self)
```

Observed calls (lexical order): `self.make_engine`, `(self.root / 'input/idms.cbl').read_bytes`, `run_engine`, `self.assertEqual`, `analyze_inputs`, `engine_identity`.

### `EngineAdapterTests.test_engine_timeout` - L434-L443

```python
test_engine_timeout(self)
```

Observed calls (lexical order): `self.make_engine`, `run_engine`, `self.assertEqual`, `self.assertIsNone`, `self.program.get`, `self.assertIn`.

### `EngineAdapterTests.test_prompt_only_cannot_execute_engine` - L445-L449

```python
test_prompt_only_cannot_execute_engine(self)
```

Observed calls (lexical order): `self.assertRaisesRegex`, `run_engine`.

## Change responsibility

After modifying this Python file, review [prompt/04_LR_IDMS_DB2_CONVERSION.md](../../../../04_LR_IDMS_DB2_CONVERSION.md), update any affected behavioral contracts, then run `python prompt/tools/maintain_docs.py refresh` and `python prompt/tools/maintain_docs.py check` from the repository root. Keep scratch Markdown only in `prompt/temp/`. Generated notes must not be hand-edited; add explanations to the owning guide.
