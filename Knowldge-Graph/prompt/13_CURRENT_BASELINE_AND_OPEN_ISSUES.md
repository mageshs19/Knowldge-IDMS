# Current baseline and unresolved issues

## Snapshot, not a fresh conversion run

This workspace is based on `IDMS_DB2_V123_4310_Full_Audit_Engine.zip`. V124 deletes
legacy Markdown and rebuilds maintained documentation; it does not fix the known
converter defects. Existing Python engine/test files, source inputs, manual
references, generated COBOL, mappings and non-Markdown validation evidence are
preserved. The only existing non-Markdown edit is the root readme path in
`pyproject.toml`.

The following results are **supplied V123 evidence**, not tests rerun for V124:

- [Pipeline result](../V123_Validation/pipeline_result.json): exit 2.
- [Python test result](../V123_Validation/tests_result.json) and
  [test transcript](../V123_Validation/tests.log): 2,069 passed, 10 skipped, exit 0.
- Current workspace Review CSV: all six metadata-aware structural reports are
  REJECTED. Historical claims of four/five accepted programs are not the latest
  evidence and must not override these reports.

| Program | Passed checks | Failed checks | Skipped checks | Structural result |
|---|---:|---:|---:|---|
| VMDZ1526 | 20 | 6 | 10 | REJECTED |
| VMDZ1567 | 23 | 1 | 12 | REJECTED |
| VMDZ4302 | 24 | 6 | 6 | REJECTED |
| VMDZ4310 | 19 | 3 | 14 | REJECTED |
| VMDZ4420 | 25 | 3 | 8 | REJECTED |
| VMDZ7200 | 23 | 3 | 10 | REJECTED |

The skipped-count column is evidence of checks not run, not a success count.
Structural review, semantic parity and compiler/runtime approval have different
scopes. The semantic gate's text is retained in
[semantic_release_gate.txt](../mainframe/workspace/Review/semantic_release_gate.txt).

## VMDZ4310 findings carried forward

Local paragraph-call relationships were audited, but correct wiring does not
prove field representation or error semantics. Numeric business paragraph
prefixes do not by themselves control execution order.

The unresolved serialized identifier has conflicting evidence: DCLGEN defines
`NR_IDGOOD_479EVEF`/host as CHAR(28)/PIC X(28); mapping data describes CHAR(20);
generated `WS-NR-ID-GOOD` is a 20-byte packed-field group while the manual uses
28 display-digit positions and two filler bytes. A direct group transfer does
not establish field-level conversion. An approved serialization contract is
needed; do not infer it from lengths or add a program-specific override.

The manual parent SELECT repeats `NX_CPCRESK_479BEFF` and does not fetch
`AM_CNDSTK_479BEFF`, although a later zero-coupon-rank branch consumes that amount.
The generated projection includes it. Do not remove a source-required amount
merely to imitate a potentially erroneous manual reference.

The generated bounded child lookup has two SQLCODE 100 abort blocks inherited
from distinct original conditions. The nonnumeric-key guard calls SQLERROR
before the current SQL operation/location assignment. External error routines'
return/termination behavior is not supplied, so these paths are unproved.

FINISH/transaction policy and unavailable SQLERROR/SQLERRWS/SQLCA procedure/data
bodies also prevent compiler/runtime certification. The workspace includes
V123's machine audit, source/manually numbered extracts and paragraph graph:
[full_audit.json](../V123_Validation/full_audit.json),
[paragraph_graphs.json](../V123_Validation/paragraph_graphs.json),
[source-change manifest](../V123_Validation/source_change_manifest.json).

## Other existing limitations relevant to future work

1526 restart/business and 4302 structural/semantic findings are not resolved by
this reorganization. 1567 has operation-level manual UPDATE parity evidence, but
that does not erase its latest metadata-aware review findings or prove original
IDMS missing-row semantics. Consult the actual current per-program report.

The kind-reading fallback to retrieval, caught/skipped enhancement failures,
legacy path/settings copies, and setuptools `src/` packaging mismatch remain
visible implementation limitations. The standalone comparison audit still needs
`--markdown-out prompt/temp/...` to follow the new policy. No documentation claim
should imply these behaviors were changed.

## Production decision

Blocked. Native DB2 precompile, Enterprise COBOL compile/link, actual error
includes, approved representation metadata, and representative differential
runtime/restart/output tests remain necessary. Documentation freshness and Python
unit tests cannot substitute for them.

## V125 knowledge-collection layer

The converter source remains the V123/V124 snapshot. V125 introduces only prompt-
scoped collection/analysis tooling and documentation. A new isolated six-program
convert-to-review run produced six candidates and exit 2, with all six structural
reviews rejected, consistent with the baseline table above. No mainframe compile
or DB2 runtime was performed. The new program dossiers are inventories awaiting
independent semantic review, not new acceptance certificates. The production
75-pair corpus is not present in this workspace.
