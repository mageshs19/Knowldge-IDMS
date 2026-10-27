# knowledge_review.py

Source: [Python](../../tools/knowledge_review.py); SHA-256 `66c142d8ebf935fe78cb24b072f52e327a97177ec649a339301127188768371c`.
Owning guide: [contract](../02_REVIEW_AND_HANDOFF.md).

Bounded AI work packets, cited-review admission, knowledge catalog and handoff.

Validation checks provenance, not natural-language truth. It cannot certify code.
Owned by prompt/system2/02_REVIEW_AND_HANDOFF.md.

## Symbols

### current_review (L24-L38)

```python
current_review(root: Path, analysis: dict)
```

Read the owning guide and this source span for the actual contract.

### require_fresh (L41-L46)

```python
require_fresh(root: Path, config: dict, program: dict, track: str, engine: dict | None=None)
```

Read the owning guide and this source span for the actual contract.

### validate_evidence (L49-L56)

```python
validate_evidence(analysis: dict, entry: dict)
```

Read the owning guide and this source span for the actual contract.

### validate_review (L59-L116)

```python
validate_review(analysis: dict, review: dict)
```

Read the owning guide and this source span for the actual contract.

### import_review (L119-L135)

```python
import_review(root: Path, config: dict, program: dict, track: str, path: str)
```

Read the owning guide and this source span for the actual contract.

### packet (L138-L185)

```python
packet(root: Path, config: dict, program: dict, track: str, part: int, per_packet: int, max_chars: int)
```

Read the owning guide and this source span for the actual contract.

### aggregate (L188-L234)

```python
aggregate(root: Path, config: dict)
```

Read the owning guide and this source span for the actual contract.

### export_handoff (L237-L278)

```python
export_handoff(root: Path, config: dict, name: str, include_evidence: bool)
```

Read the owning guide and this source span for the actual contract.

### verify_handoff (L281-L313)

```python
verify_handoff(root: Path, name: str)
```

Validate a knowledge ZIP without extracting or executing anything.

## Update rule

Change the owning guide together with this source; refresh these generated notes instead of hand-editing them. Scratch Markdown goes only in prompt/temp/. Existing engine source notes are maintained separately by maintain_docs.py.
