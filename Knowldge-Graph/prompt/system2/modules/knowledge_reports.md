# knowledge_reports.py

Source: [Python](../../tools/knowledge_reports.py); SHA-256 `724baaa470bc6c33b7ebccf17378c609f5cee8882f351646c7afc8b4e75e6fc0`.
Owning guide: [contract](../01_ARCHITECTURE_AND_CONTRACTS.md).

Render per-program evidence and comparison leads without claiming equivalence.

Counter/list differences are review leads, never proof that COBOL logic is absent.
Owned by prompt/system2/01_ARCHITECTURE_AND_CONTRACTS.md.

## Symbols

### safe (L16-L17)

```python
safe(text: object)
```

Read the owning guide and this source span for the actual contract.

### evidence_label (L20-L22)

```python
evidence_label(analysis: dict, evidence: dict)
```

Read the owning guide and this source span for the actual contract.

### comparison_leads (L25-L100)

```python
comparison_leads(analysis: dict)
```

Read the owning guide and this source span for the actual contract.

### render_report (L103-L160)

```python
render_report(analysis: dict, review: dict | None=None)
```

Read the owning guide and this source span for the actual contract.

### save_analysis (L163-L167)

```python
save_analysis(root: Path, analysis: dict, review: dict | None=None)
```

Read the owning guide and this source span for the actual contract.

## Update rule

Change the owning guide together with this source; refresh these generated notes instead of hand-editing them. Scratch Markdown goes only in prompt/temp/. Existing engine source notes are maintained separately by maintain_docs.py.
