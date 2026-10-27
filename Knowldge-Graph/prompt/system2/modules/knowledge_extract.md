# knowledge_extract.py

Source: [Python](../../tools/knowledge_extract.py); SHA-256 `600b131745b519111d5e9932ea3f9444976a8aefb170b5b07e83e3651bd1f03e`.
Owning guide: [contract](../01_ARCHITECTURE_AND_CONTRACTS.md).

Independent, deliberately partial COBOL evidence inventory for System 2.

No converter imports. Inventories are navigation evidence, not compiler results,
full COBOL parsing, a complete CFG, or proof of business equivalence.

## Symbols

### mask_literals (L28-L29)

```python
mask_literals(text: str)
```

Read the owning guide and this source span for the actual contract.

### canonical (L32-L39)

```python
canonical(text: str)
```

Normalize nonliteral whitespace/case; never alter literal contents.

### source_lines (L42-L57)

```python
source_lines(text: str, source_format: str='fixed')
```

Read the owning guide and this source span for the actual contract.

### split_list (L60-L72)

```python
split_list(value: str)
```

Top-level comma split; nested expressions stay together.

### profile (L75-L194)

```python
profile(text: str, source_format: str='fixed')
```

Read the owning guide and this source span for the actual contract.

## Update rule

Change the owning guide together with this source; refresh these generated notes instead of hand-editing them. Scratch Markdown goes only in prompt/temp/. Existing engine source notes are maintained separately by maintain_docs.py.
