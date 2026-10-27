# System 2 IDMS/manual/engine knowledge kit - V125

This portable kit contains prompt instructions, standard-library analysis tools,
the six supplied source/manual sample pairs and metadata, plus captured generated
candidates and review evidence. It does NOT contain the converter implementation.
Replace the sample manifest with your actual 75 explicit pairs on System 2.

## Two mandatory documentation rules

Root readme.md is the only Markdown outside prompt/. Durable documentation belongs
under prompt/; all temporary Markdown, draft AI work and iteration notes belong
under prompt/temp/. Finalized program reports and admitted reviews are stored
under prompt/knowledge/.

Every Python/tool/rule change must update its corresponding owning prompt guide
and module note in the same change. For the local tools run knowledge_docs.py
refresh/check; run maintain_docs.py on the complete System 1 engine workspace,
not this prompt-only kit.

## Start

Read [System 2 instructions](prompt/system2/00_START_SYSTEM2.md) and the
[runbook](prompt/system2/06_RUNBOOK.md).

```bash
python prompt/tools/knowledge_pipeline.py build
python prompt/tools/knowledge_pipeline.py aggregate
python prompt/tools/knowledge_pipeline.py check
python prompt/tools/knowledge_docs.py check
```

Track A compares original IDMS/LR with manual DB2 independently. Track B compares
captured engine-generated COBOL with that baseline. These commands make factual
inventories, not complete semantic review. Use the included bounded AI packets
and review-import workflow to accumulate evidence-backed program knowledge.
No AI service is called and no proprietary source is sent outside the machine.

For fresh conversion, supply a full trusted engine snapshot and its dependency
environment with run-engine --engine-root PATH. Otherwise use generated output
and run receipts produced on System 1. Prompt files alone cannot execute the
converter. Engine guides/module notes here are documentation snapshots; links to
actual engine source resolve only in the complete System 1 workspace.

The included fresh six-program run generated six candidates but exited 2; all
six structural reviews were rejected. Those are retained failures, not approvals.
The actual 75 production pairs, IBM compilation and DB2 runtime validation have
not been performed by this kit.

Candidate rules are transferred through a checksummed knowledge handoff. System 1
must reproduce, inspect the real owner, implement generic logic, add positive/
negative/renamed-identifier tests and update documentation. Never patch generated
COBOL or treat sample counts as proof of production safety.
