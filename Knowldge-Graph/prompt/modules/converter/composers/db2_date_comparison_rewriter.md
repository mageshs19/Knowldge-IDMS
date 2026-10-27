# `converter/composers/db2_date_comparison_rewriter.py`

Source: [converter/composers/db2_date_comparison_rewriter.py](../../../../converter/composers/db2_date_comparison_rewriter.py) | 338 lines.
Owning logic guide: [prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md](../../../06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md).
Source SHA-256: `43746b56b68155bad3a7f0f83e98a865f9816bdd5949a17f70824d17c015c5d4`.

Generated source map. Read this file to locate the relevant symbols, then inspect the touched source before changing behavior. Lexical calls/branches are not a proof of runtime wiring or semantic equivalence.

## Responsibility

Source-declared description (not an independently verified runtime claim):

> DB2 date comparison rewriter.

## Module-level bindings

`DEFAULT_INDENT` (L96), `LEFT_SEQUENCE_END` (L99), `INDICATOR_INDEX` (L100), `BODY_START` (L101), `BODY_END` (L102), `LINE_WIDTH` (L103), `BODY_WIDTH` (L104), `__all__` (L338)

## Import declarations

```python
from __future__ import annotations
import re
from converter.composers.db2_date_condition_assembler import Db2DateConditionAssembler
from converter.composers.db2_date_field_detector import Db2DateFieldDetector
from converter.composers.db2_date_line_utils import Db2DateLineUtils
from rules.db2_date_conversion_rules import CONDITION_SCAN_LIMIT, DB2_DATE_CONVERSION_BANNER_TEMPLATE, DB2_DATE_CONVERSION_LINE_TEMPLATES, DB2_DATE_HIGH_NUMERIC_LITERAL, DB2_DATE_HIGH_VALUE_LITERAL, DB2_DATE_LOW_VALUE_LITERAL, DB2_DATE_MESSAGES, DB2_DATE_REFUSAL_COMMENT_TEMPLATE, EMIT_DATE_REFUSAL_COMMENT, ENFORCE_DATE_COMPARISON_CONVERSION, MAX_DATE_OPERANDS_PER_CONDITION
```

## Local dependency notes

- [converter/composers/db2_date_condition_assembler.py](db2_date_condition_assembler.md)
- [converter/composers/db2_date_field_detector.py](db2_date_field_detector.md)
- [converter/composers/db2_date_line_utils.py](db2_date_line_utils.md)
- [rules/db2_date_conversion_rules.py](../../rules/db2_date_conversion_rules.md)

## Importers (2)

Static imports only; dependency injection, string imports and runtime dispatch can add edges.

- [converter/composers/db2_date_comparison_composer.py](db2_date_comparison_composer.md)
- [tests/test_db2_date_comparison.py](../../tests/test_db2_date_comparison.md)

## Symbol contracts and control points

### `Db2DateComparisonRewriter` - L107-L335

```python
class Db2DateComparisonRewriter()
```

### `Db2DateComparisonRewriter.__init__` - L108-L122

```python
__init__(self, line_utils: Db2DateLineUtils | None=None, assembler: Db2DateConditionAssembler | None=None, detector: Db2DateFieldDetector | None=None) -> None
```

Observed calls (lexical order): `Db2DateLineUtils`, `Db2DateConditionAssembler`, `Db2DateFieldDetector`.

### `Db2DateComparisonRewriter.rewrite_date_comparisons` - L127-L189

```python
rewrite_date_comparisons(self, lines: list[str]) -> list[str]
```

Observed calls (lexical order): `list`, `len`, `self.assembler.span_at`, `output.append`, `self.detector.operands_in`, `output.extend`, `self._refusal_reason`, `self._refuse`, `DB2_DATE_CONVERSION_BANNER_TEMPLATE.format`, `self._conversion_block`, `self._rewritten_condition_lines`, `self.messages.append`, `DB2_DATE_MESSAGES['converted'].format`.

Control points:

- L130: `if not ENFORCE_DATE_COMPARISON_CONVERSION`
- L138: `while index < len(lines)`
- L141: `if span is None`
- L148: `if not operands`
- L155: `if refusal`
- L170: `for operand in operands`
- L181: `if converted_conditions`

### `Db2DateComparisonRewriter._conversion_block` - L194-L208

```python
_conversion_block(self, indent: str, operand) -> list[str]
```

Observed calls (lexical order): `self.line_utils.helper_name`, `template.format`.

### `Db2DateComparisonRewriter._rewritten_condition_lines` - L213-L231

```python
_rewritten_condition_lines(self, lines: list[str], span, operands) -> list[str]
```

Each physical line with `FIELD OF GROUP` replaced by its helper.

Observed calls (lexical order): `self._operand_pattern`, `self.line_utils.helper_name`, `self._substitute`.

### `Db2DateComparisonRewriter._substitute` - L233-L262

```python
_substitute(self, line: str, replacements) -> str
```

Rewrite columns 8-72 only, then reassemble the record.

Observed calls (lexical order): `str`, `str(line or '').rstrip`, `self._is_fixed_record`, `self._apply`, `original.ljust`, `new_body.rstrip`, `len`, `trimmed.ljust`.

Control points:

- L241: `if not self._is_fixed_record(original)`
- L253: `if new_body == body`
- L258: `if len(trimmed) > BODY_WIDTH`

### `Db2DateComparisonRewriter._is_fixed_record` - L265-L272

```python
_is_fixed_record(line: str) -> bool
```

Columns 1-6 numeric is the only reliable fixed-format marker.

Observed calls (lexical order): `str`, `len`, `text[0:LEFT_SEQUENCE_END].isdigit`.

Control points:

- L269: `if len(text) < BODY_START`

### `Db2DateComparisonRewriter._apply` - L275-L281

```python
_apply(text: str, replacements) -> str
```

Observed calls (lexical order): `str`, `pattern.sub`.

Control points:

- L278: `for (pattern, helper) in replacements`

### `Db2DateComparisonRewriter._operand_pattern` - L284-L293

```python
_operand_pattern(operand)
```

`FIELD OF GROUP` with flexible whitespace, whole-token only.

Observed calls (lexical order): `re.compile`, `re.escape`.

### `Db2DateComparisonRewriter._refusal_reason` - L298-L318

```python
_refusal_reason(self, span, operands) -> str
```

Observed calls (lexical order): `self.messages.append`, `DB2_DATE_MESSAGES['condition_unterminated'].format`, `len`, `DB2_DATE_MESSAGES['too_many_operands'].format`.

Control points:

- L299: `if not span.complete`
- L308: `if len(operands) > MAX_DATE_OPERANDS_PER_CONDITION`

### `Db2DateComparisonRewriter._refuse` - L321-L335

```python
_refuse(span, operands, reason: str) -> list[str]
```

A pass that cannot convert must say so IN the generated COBOL.

Observed calls (lexical order): `DB2_DATE_REFUSAL_COMMENT_TEMPLATE.format`.

Control points:

- L323: `if not EMIT_DATE_REFUSAL_COMMENT`

## Change responsibility

After modifying this Python file, review [prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md](../../../06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md), update any affected behavioral contracts, then run `python prompt/tools/maintain_docs.py refresh` and `python prompt/tools/maintain_docs.py check` from the repository root. Keep scratch Markdown only in `prompt/temp/`. Generated notes must not be hand-edited; add explanations to the owning guide.
