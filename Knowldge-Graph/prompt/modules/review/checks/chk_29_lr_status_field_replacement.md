# `review/checks/chk_29_lr_status_field_replacement.py`

Source: [review/checks/chk_29_lr_status_field_replacement.py](../../../../review/checks/chk_29_lr_status_field_replacement.py) | 117 lines.
Owning logic guide: [prompt/09_REVIEW_AND_RELEASE_GATES.md](../../../09_REVIEW_AND_RELEASE_GATES.md).
Source SHA-256: `760bb96b7b0b935bc6f68c7668e3744e7ca584518668d9867d61f5b02f201c4f`.

Generated source map. Read this file to locate the relevant symbols, then inspect the touched source before changing behavior. Lexical calls/branches are not a proof of runtime wiring or semantic equivalence.

## Responsibility

Source-declared description (not an independently verified runtime claim):

> CHK-29 LR-STATUS field - replaced with cursor end-of-cursor logic.

## Import declarations

```python
from __future__ import annotations
from review.engine import metadata as meta
from review.engine.check_base import CRITICAL, BOTH, Check
from review.standards import cobol_standards as std
```

## Local dependency notes

- [review/engine/__init__.py](../engine/__init__.md)
- [review/engine/check_base.py](../engine/check_base.md)
- [review/engine/metadata.py](../engine/metadata.md)
- [review/standards/__init__.py](../standards/__init__.md)
- [review/standards/cobol_standards.py](../standards/cobol_standards.md)

## Symbol contracts and control points

### `LRStatusFieldReplacementCheck` - L21-L117

```python
class LRStatusFieldReplacementCheck(Check)
```

Declared class/data-model fields:

```python
CHECK_ID = 'CHK-29'
TITLE = 'LR-STATUS field - replaced with cursor end-of-cursor logic'
SEVERITY = CRITICAL
APPLIES_TO = BOTH
ORDER = 290
```

### `LRStatusFieldReplacementCheck.relevant` - L28-L46

```python
relevant(self, ctx, view) -> bool
```

True when this program WAS a logical-record program.

Observed calls (lexical order): `l.logical.upper`, `any`.

### `LRStatusFieldReplacementCheck.not_relevant_reason` - L48-L49

```python
not_relevant_reason(self) -> str
```

### `LRStatusFieldReplacementCheck.review` - L51-L117

```python
review(self, ctx, view, record)
```

Observed calls (lexical order): `record.expect_none`, `l.logical.upper`, `any`, `record.expect`.

## Change responsibility

After modifying this Python file, review [prompt/09_REVIEW_AND_RELEASE_GATES.md](../../../09_REVIEW_AND_RELEASE_GATES.md), update any affected behavioral contracts, then run `python prompt/tools/maintain_docs.py refresh` and `python prompt/tools/maintain_docs.py check` from the repository root. Keep scratch Markdown only in `prompt/temp/`. Generated notes must not be hand-edited; add explanations to the owning guide.
