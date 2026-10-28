# G02 — Update and restart without LRF

**Phase:** 1 · **Run:** Run-001 · **Assessment:** PARTIAL · **Answer state:** no human or simulated answers consumed.

This is a conditional generic synthesis of the supplied six-program corpus. It contains **20 classified cases** and **20 rule definitions** for this category. Rules shared across categories retain the same RULE IDs; their source variants remain explicitly identified. The complete corpus contains 60 distinct cases and 33 distinct rules.

## 1. Scope and what this sample establishes

This guide covers VM1BD567 → VMDZ1567's direct CALC/MODIFY conversion and the non-LRF FFRECAB restart protocol shared by VM1BD526 → VMDZ1526. VM1BD526's LRF business insert/modify remains in G04; the database checkpoint operations themselves do not use an LR. The presence of LRF definitions in VMBTS06 does not reclassify VM1BD567's executed direct DML.

The central result is a recoverable business unit, not a word-for-word COMMIT replacement: the current input record's business change, persisted input position and completion state must agree at each durable boundary. The listings expose several unresolved differences: the legacy 567 counter does not implement its apparent intended cadence, the target has an unguarded short-file skip, initial and later VARCHAR lengths differ, and cumulative counters are narrower than the persisted count. None is hidden by a generic “commit every 100” rule.

Every recommendation below separates an observed source behavior, an observed target behavior, an unresolved condition and a proposed change. A manually converted program is evidence of a developer's approach; its correctness is not assumed. The reports include a demonstrated missing-field defect, representation conflicts and unresolved operational contracts. All 39 Phase 1 questions remain unanswered.

The configured eight decommission identities were not supplied. FFRECAB is visibly used for restart and has a mapped target candidate, while FFRECAT → DZ01FFTB is only a possible second replacement. No supplied producer/consumer path establishes the requested persistent buffer protocol. These gaps are covered by RULE-003/RULE-014 and individual questions; they are not silently classified as absent business work.

### Program participation

| Input / paired report | Role in this guide |
| --- | --- |
| [VM1BD526.cbl](../programs/VM1BD526.cbl__migration.md) | 8 classified cases: VM1BD526-C008, VM1BD526-C009, VM1BD526-C010, VM1BD526-C011, VM1BD526-C012, VM1BD526-C013, VM1BD526-C014, VM1BD526-C015 |
| [VM1BD567.cbl](../programs/VM1BD567.cbl__migration.md) | 12 classified cases: VM1BD567-C001, VM1BD567-C002, VM1BD567-C003, VM1BD567-C004, VM1BD567-C005, VM1BD567-C006, VM1BD567-C007, VM1BD567-C008, VM1BD567-C009, VM1BD567-C010, VM1BD567-C011, VM1BD567-C012 |

## 2. Execution method for a new program

1. Define the actual per-record business effect and key, including every predicate and any added audit/default column. For 567, the six-part form identity includes service, client, creation date, document, detail operation and general operation.
2. Resolve the restart object and key. The mapping names DZ01RSTB while the program executes DZ01RSTV. Prove the updatable-view relationship, uniqueness, qualifier and trigger behavior. The old VM1BDF... key and new VMDZ.../phase/date key are different identities; decide cutover explicitly.
3. Separate fresh, incomplete and completed states. On expected initial SELECT +100, insert an incomplete row. On a valid incomplete checkpoint, validate payload and input identity before skipping. On completion, use an approved scheduler/rerun policy. A missing row is not automatically “fresh” if key migration is unresolved.
4. Define what the persisted count means. Here it is intended to identify a physical input prefix, not a business-key high-water mark. It needs the identical file generation and ordering. Keep positioning reads separate from new progress and reset the per-batch count before normal processing.
5. Validate EOF and count range before the first skip and at every skip read. A saved count exceeding available input must not fall into ordinary completion. The supplied target 567 lacks that guard; report the gap.
6. Complete the business DML for the current record, persist the corresponding cumulative position/flag, then COMMIT in one recoverable Db2 unit. If any step fails, do not advance the durable count. Capture the original diagnostics before cleanup can replace them.
7. At EOF, commit the final remainder and completion marker under the chosen policy. Test empty input, exact batch multiples and lost final-commit acknowledgement separately. Retention metadata does not prove an actual purge job.
8. Reconcile all restart representations: 15-digit payload, active 5/7-digit counters, VARCHAR capacity and supplied length, and optional record snapshot. Retain only helpers needed by the approved protocol; a count-only design does not inherently need two extra 1200-byte record buffers.

## 3. Business conditions, access shape and state

### Direct form update

The original 567 obtains VMBFAR by its composite CALC key, changes the accounting date and MODIFYs it. The target uses one searched UPDATE on DZBFARTV with the six corresponding predicates, setting the mapped accounting date and new audit fields. Service 1815 and the detail/general operation components must not be swapped or dropped. SQLCODE 0 is a successful statement; it is not proof of one affected row without uniqueness or a row-count assertion. +100 is a missing required form and follows the error route. [VM1BD567-C001, C011; RULE-005, RULE-033.]

Blank/zero creation date is a separate policy decision. The target substitutes 0001-01-01 into the searched key; the original uses its incoming key value. This can change which form is addressed. Valid SQL DATE syntax does not approve that identity change. The run date assigned as accounting date and the creation date used in the WHERE clause must remain distinct live values. [VM1BD567-C002; Q-000010.]

### Restart states and durable boundaries

| State / boundary | Observed behavior | Required review / scenario |
| --- | --- | --- |
| Lookup | New program CHAR(8), phase 1 and business DATE select DZ01RSTV; mapping names DZ01RSTB. | Prove DDL identity, unique key and legacy cutover before treating +100 as fresh. |
| Fresh | Insert incomplete flag 0/count 0 with length 1215; no immediate COMMIT. | Crash before first business/final commit; concurrent INSERT; empty file. |
| Resume incomplete | Restore count N, skip N physical records, process N+1. | Require exact immutable file generation/order, validated count and clean EOF state before skip. |
| Normal new record | Complete business UPDATE; advance batch/cumulative state; checkpoint when threshold reached. | Failure must prevent committed count advancement. A successful READ alone is not durable business success. |
| Batch commit | Update count/flag in restart row, then COMMIT. | Business and checkpoint changes require the same recoverable Db2 unit; missing central handlers leave rollback/nonreturn unproved. |
| End of input | Final checkpoint and completion flag 1, then COMMIT. | Zero rows, final partial batch, exact multiple of 100 and lost acknowledgement. |
| Complete row on rerun | Target calls USERABEN. | New policy relative to source; distinguish recognised successful completion, authorised reset and a genuinely invalid rerun. |
| Retention | Values 15 days for 526 and 7 for 567 are stored. | No supplied purge/reset mechanism proves the actual lifecycle. |

The source ranges and questions for these rows are in cases VM1BD526-C008–C015 and VM1BD567-C004–C012. The shared protocol does not make VM1BD526's LRF business write a non-LRF write.

### Concrete restart counterexamples that the generic rule must retain

**Legacy 567 counter:** normal fresh reads/processes never increment CTR-REC, so the apparent >99 commit boundary never fires and final progress adds zero. During restart, PERFORM VARYING changes that same field and leaves it unreset. The target's successful-read count and reset-after-skip are plausible repairs to intended 100-record processing, but they are not byte-for-byte behavior preservation. Q-000021 asks for the actual business unit and repair intent. [VM1BD567-C007.]

**Short input:** target 567 can continue the saved-count loop after EOF and then unconditionally READ again. The target 526 has a STOP01/USERABEN branch but initializes its EOF flag after positioning; the actual abort/file behavior still needs review. Neither case should be described as a validated safe resume. [VM1BD567-C006; VM1BD526-C010; Q-000033.]

**Payload and capacity:** initial INSERT supplies 1215 bytes, but periodic/final UPDATE supplies length 15 while moving the entire count-plus-record group to text. Only the count prefix is supplied under that host length. The record snapshot is never consulted on restart. Active cumulative counters allow 5 digits in 526 and 7 in 567, while NB-READ/persisted count has 15. Reusing NB-READ can avoid an extra narrow total, but positioning must not mutate the fixed skip bound. [VM1BD526-C012, C015; VM1BD567-C008, C012; Q-000029, Q-000032.]

**Input identity and cutover:** a numeric count cannot recognise reordered/replaced input. Changing from the legacy key to the new key can make already processed work appear fresh. A repeated accounting-date assignment may also change audit timestamps or trigger effects. An event INSERT in sibling 526 can duplicate business events even with unique sequence IDs. The scheduler, input-generation and cutover contract must close these gaps. [Q-000028, Q-000030, Q-000031; RULE-001, RULE-026, RULE-028.]

## 4. Conditional rule catalog

Each rule gives its applicability condition, preserved or changed behavior, minimum-storage reasoning, failure contract, source variants and concrete scenarios. A variant whose originating case belongs to another category is a cross-category technical example, not a reclassification of that program. The actual 33 × 6 rule/program cross-check is [rule-applicability.json](../_audit/rule-applicability.json); its APPLIES_SUPPORTS, APPLIES_VARIANT, APPLIES_CONTRADICTS, UNKNOWN and NOT_APPLICABLE rows are evidence assessments, not automatic production approval.

### RULE-001 — Commit business work and its checkpoint as one recoverable unit

**Applies when:** A sequential-input updater has a persisted physical-position checkpoint: demonstrated in 526 and 567, including the LRF insert/update branch of 526.

**Migration behavior:** After the current record succeeds, update the restart count/flag and then COMMIT. The 526 threshold is TELLER NOT < 100; target 567 uses WS-TELLER > 99. On EOF, commit the remainder and completion marker, even when the preceding full batch already committed. This is observed statement order, conditional on one transaction attachment and no hidden commit. The 567 legacy counter defect is a distinct variant, not a working baseline.

**Minimum storage:** A cumulative durable-position count must coexist with a resettable batch count. Reuse TELLER or original-compatible CTR-REC; a second small cumulative counter is avoidable if the existing 15-digit NB-READ is safely reused. No cursor position or full-record buffer is mandatory for a count-only protocol.

**Error and recovery contract:** Failed business DML or failed checkpoint UPDATE must prevent COMMIT. Missing SQLERROR/USERABEN bodies leave rollback and nonreturn unproved. If COMMIT outcome is unknown, reconcile the durable row before replay; a sequence-generated event ID does not make INSERT retry idempotent.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-001-V01 / VM1BD526-C011 | Each processed input record; TELLER not less than 100 or EOF. | SUPPORTED_WITH_GAPS; classified in this guide; G02,G04 |
| RULE-001-V02 / VM1BD567-C010 | Normal hundred-record batch or final remainder. | SUPPORTED_WITH_GAPS; classified in this guide; G02 |

**Scenarios to exercise:** BATCH-099/100/101: inspect count and effects at each boundary; FAIL-AFTER-BUSINESS: neither business nor count durable after rollback; FAIL-AFTER-CHECKPOINT: both revert before commit; LOST-COMMIT-ACK: inspect durable checkpoint; FINAL-EMPTY: completion at count 0.

**Counterexamples and limits:** 567 legacy fresh CTR-REC remains 0, so its threshold never fires; Separate file writes do not become atomic with Db 2 merely because COMMIT exists; A returning SQLERROR can allow a failed record to be checkpointed.

**Source evidence:** `IDMS Programs/VM1BD526.cbl` physical L148–158; `IDMS Programs/VM1BD526.cbl` physical L230–237; `IDMS Programs/VM1BD526.cbl` physical L103–109; `DB2 Manual converted Programs/VMDZ1526.txt` physical L215–225; `DB2 Manual converted Programs/VMDZ1526.txt` physical L357–380; additional hash-bound ranges in the case ledger.

**Unanswered dependencies:** [Q-000021](../_audit/questions/Q-000021.md), [Q-000028](../_audit/questions/Q-000028.md), [Q-000035](../_audit/questions/Q-000035.md)

### RULE-002 — Every branch must receive the exact data it consumes

**Applies when:** Any migration narrows a SELECT, splits a logical record, initializes a host group, or reconstructs a file record. Applies across all four guide categories.

**Migration behavior:** Build branch-specific def-use paths from each output, comparison and update back to a successful retrieval or explicit business assignment. Confirmed 4310 defect: DCLDZBEFFTV is initialized; AM_CNDSTK is absent from the SELECT while NX_CPCRESK is selected twice; the NX_CPCRESK=0 branch therefore emits initialized zero instead of the legacy capital amount. Preserving field names or successful SQL is insufficient. Other projections require the same check without inventing another case.

**Minimum storage:** Add the missing compatible host/output assignment when business policy requires it. A duplicate shadow amount is unnecessary; use the existing DCLGEN amount. INITIALIZE is not a business default. Preserve input hosts until the corresponding query is issued.

**Error and recovery contract:** Never consume stale/initialized result fields after +100 or failure. Wrong branch population is an application defect even when SQLCODE is 0. Keep the observed 4310 discrepancy until corrected code and tests establish behavior.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-002-V01 / VM4BD310-C004 | NX-CPCRE=0 versus nonzero | DEFECT; cross-category technical example; G03 |

**Scenarios to exercise:** CAPITAL-ZERO-COUNT: nonzero capital with NX_CPCRESK=0; INTEREST-BRANCH: nonzero count; EMPTY-SELECT: no output from invalid hosts; ALTERNATING-BRANCHES: no value leaks from prior record.

**Counterexamples and limits:** 4310 SELECT success does not populate an omitted amount; A whole-record initialize can hide a missing SELECT item by producing plausible zero.

**Source evidence:** `IDMS Programs/VM4BD310.cbl` physical L247–253; `DB2 Manual converted Programs/VMDZ4310.txt` physical L219–263; `DB2 Manual converted Programs/VMDZ4310.txt` physical L393–399.

**Unanswered dependencies:** [Q-000013](../_audit/questions/Q-000013.md), [Q-000026](../_audit/questions/Q-000026.md)

### RULE-003 — Establish the persistent buffer lifecycle before replacing it

**Applies when:** The requested second old/new record pair is a buffer, or an effective dependency actually produces/consumes persistent staging state. No such lifecycle is demonstrated in these six bodies.

**Migration behavior:** CSV logical 871/physical 877 maps FFRECAT to DZ01FFTB, but that alone does not identify the user-configured buffer or establish ownership, key, fill/drain order, retention, commit boundary or replay. Trace producers and consumers, including selected LRF paths and called routines, after the exact pair is supplied. Distinguish these obligations from the proven FFRECAB restart role.

**Minimum storage:** WS-INPUT-KASBONS and KY-RESTART are transient 1200-byte areas, not proof of a persistent buffer table. Do not add queue state or duplicate row buffers based only on their names. Required storage remains undecided until the protocol is known.

**Error and recovery contract:** No claims about fill/consume crash recovery, cleanup or exactly-once delivery can be made. A missing producer/consumer is an evidence gap rather than automatic not-applicable status.

**Executed-case coverage:** no supplied selected path establishes this global configuration obligation. Keep the missing identity/lifecycle question open.

**Scenarios to exercise:** IDENTIFY-PAIR: namespace and table/view resolved; TRACE-PRODUCER-CONSUMER: all effective references; FAIL-BETWEEN-FILL-CONSUME: define durable state after evidence arrives.

**Counterexamples and limits:** FFRECAT being declared in a subschema does not prove use; A VARCHAR restart payload is not automatically a persistent staging queue.

**Unanswered dependencies:** [Q-000011](../_audit/questions/Q-000011.md)

### RULE-005 — Collapse direct CALC plus MODIFY only when the keyed UPDATE preserves the obligation

**Applies when:** 567 directly obtains VMBFAR by CALC, changes the accounting date, then MODIFYs; no intervening read-derived computation or selected LRF parent path exists.

**Migration behavior:** Use the same six predicates: service 1815, client, creation date, document, detail operation and general operation. Update the mapped accounting date plus explicitly introduced audit fields. A prior SELECT/full-row buffer can be omitted only when key uniqueness, locking/constraint and missing-row behavior are established. Mapping names primary-key intent; DCLGEN does not enforce it.

**Minimum storage:** The target references nine of 51 DZBFARTV business hosts. Exact compatible key/date/audit hosts are needed;42 unused generated members and a second full-row buffer are not mandatory helpers. Retain the separate 1200-byte external input layout.

**Error and recovery contract:** UPDATE 0 increments one successful-statement statistic; +100 is an error, not loop EOF. Without uniqueness or an affected-row check,0 may represent multiple rows. Error/abort and actual view triggers need review.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-005-V01 / VM1BD567-C001 | Every successfully read operation record. | SUPPORTED_WITH_GAPS; classified in this guide; G01,G02 |

**Scenarios to exercise:** ONE-FORM: accounting date only plus approved audit; MISSING-FORM: reject; DUPLICATE-KEY: prove prevented or detect; DETAIL-GENERAL-SWAP: distinguish predicates.

**Counterexamples and limits:** A parent/child comment does not add a parent existence check; SQLCODE 0 alone does not prove exactly one form changed.

**Source evidence:** `IDMS Programs/VM1BD567.cbl` physical L147–158; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L192–228; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L426–451; `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical L79–91.

**Unanswered dependencies:** [Q-000020](../_audit/questions/Q-000020.md), [Q-000035](../_audit/questions/Q-000035.md), [Q-000037](../_audit/questions/Q-000037.md)

### RULE-007 — The active counter must represent the persisted restart position

**Applies when:** Any count-based restart; observed 526 active total 5 digits,567 total 7 digits, persisted prefix 15 digits.

**Migration behavior:** Separate successful physical input positions, resettable batch counts, current-invocation SQL statement totals and affected-row counts. Validate restored count and increment capacity before use.526 cannot represent totals beyond 99999 in its active field;567 beyond 9999999. ARITH(EXTEND) does not enlarge PIC. A large valid 15-digit payload can still narrow on assignment.

**Minimum storage:** Prefer reusing existing 15-digit NB-READ as cumulative total with separate skip-read control and existing batch count. The fixed skip bound must not increase during positioning. Retain diagnostic counters only when their independent business/reporting obligation is confirmed.

**Error and recovery contract:** Reject malformed, negative/out-of-range or too-short counts before positioning. A counter overflow must prevent checkpoint advancement and completion; no such guard is shown in the targets.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-007-V01 / VM1BD526-C015 | Long input, resume, and statistic reconciliation. | UNRESOLVED; classified in this guide; G02,G04 |
| RULE-007-V02 / VM1BD567-C012 | Long file, resumed invocation and more than one row qualifying an UPDATE. | UNRESOLVED; classified in this guide; G02 |

**Scenarios to exercise:** 526-99999/100000; 567-9999999/10000000; RESTORED-LARGE-COUNT; SKIP-DOES-NOT-ADVANCE-TOTAL; RESUMED-DIAGNOSTIC-VS-CUMULATIVE.

**Counterexamples and limits:** A15-digit serialized count does not make a 5-digit working total safe; Successful UPDATE calls are not necessarily affected-row counts.

**Source evidence:** `IDMS Programs/VM1BD526.cbl` physical L59–64; `IDMS Programs/VM1BD526.cbl` physical L126–157; `DB2 Manual converted Programs/VMDZ1526.txt` physical L54–64; `DB2 Manual converted Programs/VMDZ1526.txt` physical L180–182; `DB2 Manual converted Programs/VMDZ1526.txt` physical L320–365; additional hash-bound ranges in the case ledger.

**Unanswered dependencies:** [Q-000029](../_audit/questions/Q-000029.md)

### RULE-009 — Treat completed-run rejection and retention as explicit business policies

**Applies when:** 526/567 targets add CO-ID-RS = 1 when EOF is observed and reject later execution with the same key.

**Migration behavior:** Commit completion with the final count. Empty fresh input also leads to complete 1/count 0. Retention 15 for 526 and 7 for 567 is stored metadata; no purge/reset code is shown. Completed-row rejection is new relative to the source and must be approved independently of successful ordinary restart.

**Minimum storage:** The existing restart flag represents completion. It must not be confused with EOF during skip, a transient existence flag, or a separate scheduler acknowledgement. No new flag is justified absent another state distinction.

**Error and recovery contract:** A crash after durable final COMMIT but before DISPLAY/CLOSE can leave the scheduler uncertain while a rerun is rejected. Define completion recognition, reset authority and stale-row handling; USERABEN nonreturn is unproved.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-009-V01 / VM1BD526-C013 | EOF, empty input, later same-key execution. | CHANGED_UNRESOLVED; classified in this guide; G02,G04 |
| RULE-009-V02 / VM1BD567-C009 | EOF or empty input, then another execution with same key. | CHANGED_UNRESOLVED; classified in this guide; G02 |

**Scenarios to exercise:** COMPLETE-RERUN; EMPTY-INPUT; FINAL-COMMIT-ACK-LOST; SAME-DATE-DIFFERENT-FILE; RETENTION-EXPIRED.

**Counterexamples and limits:** NB-DAY-RS15/7 does not prove automated deletion; EOF while skipping a too-short file must not become normal completion.

**Source evidence:** `IDMS Programs/VM1BD526.cbl` physical L103–109; `IDMS Programs/VM1BD526.cbl` physical L120–145; `DB2 Manual converted Programs/VMDZ1526.txt` physical L175–183; `DB2 Manual converted Programs/VMDZ1526.txt` physical L337–345; `DB2 Manual converted Programs/VMDZ1526.txt` physical L357–379; additional hash-bound ranges in the case ledger.

**Unanswered dependencies:** [Q-000027](../_audit/questions/Q-000027.md), [Q-000035](../_audit/questions/Q-000035.md)

### RULE-010 — Derive commit cadence from actual counter definitions and updates

**Applies when:** A batch boundary is expressed by a working-storage counter, whether non-LRF567 or the shared 526 restart protocol.

**Migration behavior:** Inspect every assignment, increment and reset.526 increments TELLER per processed record and commits when not less than 100. Original 567 initializes CTR-REC0 but never increments it during normal reading/processing, so a fresh run never reaches >99 and saves 0 at finalization. Its restart PERFORM VARYING can leave N+1, not reset. Target 567 counts successful reads, resets after skip and commits after the current UPDATE at >99: plausible repair, still changed behavior awaiting approval.

**Minimum storage:** Reuse the existing counter with corrected placement if that repair is approved. Keep positioning iterations separate from new business progress; do not add counters to disguise an undefined unit.

**Error and recovery contract:** At N=100, legacy 567 can add 101 after processing just one new row and save 201. This static counterexample must remain visible. Failed business work must never be counted as durable just because READ succeeded.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-010-V01 / VM1BD567-C007 | Fresh input and incomplete restart. | LEGACY_DEFECT_AND_CHANGED_IMPLEMENTATION; classified in this guide; G02 |

**Scenarios to exercise:** FRESH-101-RECORDS: legacy 0 versus target 100+1; LEGACY-RESTART-N100:201 counterexample; TARGET-RESTART-N100: next row 101; FAILURE-BEFORE-UPDATE-SUCCESS.

**Counterexamples and limits:** A paragraph comment describing 100-record commits is not proof that the counter increments; Blindly preserving a known counter defect is not business equivalence.

**Source evidence:** `IDMS Programs/VM1BD567.cbl` physical L57–57; `IDMS Programs/VM1BD567.cbl` physical L117–141; `IDMS Programs/VM1BD567.cbl` physical L147–176; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L230–250; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L283–283; additional hash-bound ranges in the case ledger.

**Unanswered dependencies:** [Q-000021](../_audit/questions/Q-000021.md), [Q-000035](../_audit/questions/Q-000035.md)

### RULE-012 — Date representation and date meaning require separate decisions

**Applies when:** Dates cross packed/display COBOL, SQL DATE X(10), or output layouts in any category; examples include 4310 restoration and 7200 archive filtering.

**Migration behavior:** Prove actual bind/install DATE representation before positional DD.MM.YYYY parsing.7200’s strict cutoff is accounting date<cutoff when nonzero, otherwise creation date<cutoff; target uses 0001-01-01 as the zero sentinel.4310 returns dates to legacy output and must retain approved zero/high-date meanings.526/567 format run and creation dates separately. Preserve each program’s inequalities, pivot and fallback; valid SQL syntax alone does not approve a sentinel.

**Minimum storage:** Reuse one 8-character conversion area and one 10-character formatter where lifetimes do not overlap. A punctuation-bearing date belongs in X(10), not PIC 9(10). A reference-modified alphanumeric 8 source may preserve elementary conversion to a packed target where a group MOVE would copy raw bytes.

**Error and recovery contract:** Test zero, blanks, malformed dates, high dates, leap days and environment format. Do not manufacture a numeric date from failed SQL hosts or silently normalize business values.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-012-V01 / VM4BD310-C006 | DB2 DATE hosts populated | UNRESOLVED; cross-category technical example; G03 |
| RULE-012-V02 / VM7BD200-C004 | Nonzero accounting date else creation date; strictly before cutoff | UNRESOLVED; cross-category technical example; G03 |

**Scenarios to exercise:** CUTOFF-EQUAL: excluded 7200; ZERO-ACCOUNTING-FALLBACK; EUR/ISO-OUTPUT-CONFIG; PACKED-CREATION-CONVERSION; LEAP/INVALID/HIGH-DATE.

**Counterexamples and limits:** 302 uses strict upper bound while 4420 includes equality; Group MOVE of eight display digits into COMP-3 does not perform the required numeric conversion.

**Source evidence:** `IDMS Programs/VM4BD310.cbl` physical L258–263; `DB2 Manual converted Programs/VMDZ4310.txt` physical L404–433; `IDMS Programs/VM7BD200.cbl` physical L188–191; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L366–370; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L417–423.

**Unanswered dependencies:** [Q-000006](../_audit/questions/Q-000006.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000025](../_audit/questions/Q-000025.md)

### RULE-013 — Creation-date sentinel normalization changes a searched business key

**Applies when:** 567 builds the six-part form key with an input creation date that can be zero or blank.

**Migration behavior:** The target substitutes 00010101, then formats SQL DATE 0001-01-01, before UPDATE. The original moved the input directly into the CALC key. This changes row identity and needs loader/business agreement. Do not infer that every zero IDMS date maps to this sentinel or that malformed nonzero bytes follow the same policy.

**Minimum storage:** Use existing input date aliases and DCLGEN date host; no separate sentinel flag is required if the same explicit condition is retained. Keep creation-date key distinct from the run date being assigned as accounting date.

**Error and recovery contract:** A valid sentinel query may still update the wrong or no row. Missing-row UPDATE is an error; obtain the approved handling of blank/zero/invalid original keys.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-013-V01 / VM1BD567-C002 | Input creation date is zero, spaces, a valid nonzero date or malformed nonzero date. | CHANGED_UNRESOLVED; classified in this guide; G01,G02 |

**Scenarios to exercise:** ZERO-DATE; BLANK-DATE; VALID-CREATION; INVALID-NONZERO; SENTINEL-ROW-ABSENT; RUN-DATE-DIFFERS-FROM-CREATION.

**Counterexamples and limits:** SQL accepting year 0001 does not demonstrate the correct business identity; Reusing the run-date host before key execution can update a different form.

**Source evidence:** `IDMS Programs/VM1BD567.cbl` physical L149–158; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L201–219; `Dclgens/DZBFARTV.txt` physical L13–18.

**Unanswered dependencies:** [Q-000010](../_audit/questions/Q-000010.md)

### RULE-014 — Decommissioning removes approved identities and preserves surviving obligations

**Applies when:** The user supplies eight distinct decommission identities, in explicit IDMS/Db 2 namespaces and program scope. No such list is supplied in this sample.

**Migration behavior:** Resolve the exact eight entries through mapping, aliases, COPY expansion, calls and selected LRF paths. For each, record direct/transitive access, data validation, parent existence, ordering, error, restart, file and audit obligations, then identify which are retained elsewhere or explicitly retired. Current distinct-entity count is UNKNOWN. Removed IDMS statements or an unused copybook do not establish approved decommissioning.

**Minimum storage:** Remove obsolete record/helper state only after proving all remaining def-use and interface effects. FFRECAB is actively replaced; VMBEFF/VMBEVEF/VMBFAR remain active. No eight names or automatic storage savings are invented.

**Error and recovery contract:** Removing a parent record must not silently eliminate required missing-parent behavior or referential checks. Cases with unavailable dependencies remain blocked rather than certified absent.

**Executed-case coverage:** no supplied selected path establishes this global configuration obligation. Keep the missing identity/lifecycle question open.

**Scenarios to exercise:** EIGHT-DISTINCT-ENTITIES; ALIAS-DUPLICATE; CALLED-DEPENDENCY-USE; RETAINED-PARENT-VALIDATION; REMOVED-ERROR-OBLIGATION.

**Counterexamples and limits:** Eight occurrences are not necessarily eight identities; Removing VMBD05 or an IDMS include is not proof that its business entity was decommissioned.

**Unanswered dependencies:** [Q-000015](../_audit/questions/Q-000015.md)

### RULE-016 — Locate initial checkpoint creation within the first transaction

**Applies when:** 526/567 restart SELECT returns expected+100 for a fresh run.

**Migration behavior:** Initialize program/date/phase, incomplete 0, count 0 and retention; INSERT a length 1215 payload without an immediate COMMIT.526 moves initial creation earlier than its legacy first-checkpoint STORE;567 preserves creation before work. First durable checkpoint therefore depends on the first business/final transaction. A competing creator and a crash before that commit need explicit treatment.

**Minimum storage:** Use the supported DCLGEN VARCHAR length/data pair and existing count/flag. Do not assume length 4000 is written merely from capacity; currently initial length 1215 differs from subsequent 15.

**Error and recovery contract:** INSERT failure must not proceed without an owned checkpoint. Duplicate creation is not locally retried. With proper rollback a failure before first commit leaves neither initial row nor business writes durable; runtime proof is missing.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-016-V01 / VM1BD526-C009 | Restart SELECT returns+100. | CHANGED_UNRESOLVED; classified in this guide; G02,G04 |
| RULE-016-V02 / VM1BD567-C005 | No checkpoint found. | SUPPORTED_WITH_GAPS; classified in this guide; G02 |

**Scenarios to exercise:** FRESH-ROW; EMPTY-FRESH-FILE; CRASH-BEFORE-FIRST-COMMIT; CONCURRENT-INSERT; RESTART-SELECT-ERROR.

**Counterexamples and limits:** +100 on initial SELECT is expected, but +100 on later UPDATE is a failure; Creating a row in memory is not durable restart establishment.

**Source evidence:** `IDMS Programs/VM1BD526.cbl` physical L130–140; `IDMS Programs/VM1BD526.cbl` physical L230–237; `DB2 Manual converted Programs/VMDZ1526.txt` physical L347–379; `DB2 Manual converted Programs/VMDZ1526.txt` physical L449–461; `IDMS Programs/VM1BD567.cbl` physical L121–129; additional hash-bound ranges in the case ledger.

**Unanswered dependencies:** [Q-000034](../_audit/questions/Q-000034.md), [Q-000035](../_audit/questions/Q-000035.md)

### RULE-017 — Preserve COPY interfaces and the active byte layout of overlays and arrays

**Applies when:** External file/CALL interfaces and REDEFINES/OCCURS appear in any category. DCLGEN host groups are not automatic replacements for those interfaces.

**Migration behavior:** Preserve offsets, lengths, active variant, code page, signs and whole-group MOVE/INITIALIZE semantics.302 retains a 32000-byte service exchange and existing service arrays.4310’s legacy output is 1500 bytes with 257 REDEFINES and two OCCURS clauses aliasing the same 15 x 8=120 bytes, not 30 elements.7200 reconstructs 432 named bytes+46 padding and a 52-byte trailer=530, but filler/binary bytes in the 478-byte raw image remain unresolved.526/567 rely on missing VMDZ205I1200-byte input.

**Minimum storage:** 88 levels, group names and REDEFINES do not independently allocate bytes. Retain required external record storage; reuse compatible active aliases only after target copy proof. Do not flatten an array into a SQL rowset or copy packed bytes as text.

**Error and recovery contract:** Whole-record writes can expose inactive overlays/fillers. Compare complete output bytes and minimum/maximum occurrence/active variant where arrays actually exist; do not invent OCCURS in programs without one.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-017-V01 / VM4BD302-C009 | VM9BC50T QUERY001 exchanges one fixed buffer | PRESERVED_VISIBLE_INTERFACE; cross-category technical example; G01 |
| RULE-017-V02 / VM4BD310-C007 | Build one 1500-byte output for valid mutation | UNRESOLVED; cross-category technical example; G03 |
| RULE-017-V03 / VM4BD420-C007 | Date parameter conversion and each successful output | PRESERVED_VISIBLE_LAYOUT; cross-category technical example; G01 |
| RULE-017-V04 / VM7BD200-C005 | Every selected form | UNRESOLVED; cross-category technical example; G03 |

**Scenarios to exercise:** EXACT-FILE-LENGTH; ACTIVE-OVERLAY; ARRAY-MIN/MAX; LEADING-ZEROS/SIGNS; RAW-FILLER-BYTES; CALL-RETURN-LENGTH.

**Counterexamples and limits:** 257 REDEFINES are not 257 new buffers; Two aliased OCCURS15 declarations do not make 30 independent entries; Named-field equality does not prove archive byte identity.

**Source evidence:** `IDMS Programs/VM4BD302.cbl` physical L73–79; `IDMS Programs/VM4BD302.cbl` physical L323–337; `DB2 Manual converted Programs/VMDZ4302.txt` physical L51–58; `DB2 Manual converted Programs/VMDZ4302.txt` physical L453–467; `Copybook/VM9BC50I.cpy` physical L19–58; additional hash-bound ranges in the case ledger.

**Unanswered dependencies:** [Q-000003](../_audit/questions/Q-000003.md), [Q-000005](../_audit/questions/Q-000005.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000017](../_audit/questions/Q-000017.md), [Q-000019](../_audit/questions/Q-000019.md), [Q-000024](../_audit/questions/Q-000024.md), [Q-000026](../_audit/questions/Q-000026.md), [Q-000037](../_audit/questions/Q-000037.md)

### RULE-022 — Map identities first, then derive exact types from DCLGEN and use sites

**Applies when:** Every mapped field or reconstructed key, including fields not represented by a seeded business case in a guide.

**Migration behavior:** Resolve mapping row/namespace to exact SQL object/column, then DCLGEN host declaration and consuming operation. Hyphen/underscore normalization finds candidates only. Preserve table/view/member/group distinctions. Event NR_IDGOOD is mapping CHAR(20) versus DCLGEN CHAR(28) and target 28 displaydigits, replacing 20 packed/mixed bytes; never truncate to reconcile.7200 mapping RA_BASFMAS _479BFAS has an embedded space.567 unused DA_INVTR spelling drift is separate from executable key fields.

**Minimum storage:** Use exact PIC/USAGE/sign/scale, DATE X(10), TIMESTAMP X(26), and supported VARCHAR length/data structure. All supplied direct projections are NOT NULL without outer joins, so no new indicator is proved necessary here; future nullable expressions require reassessment.

**Error and recovery contract:** Check character-to-number domains, precision/range, sentinel dates and leading zeros.302 amount 13 integer digits feeds an output with 12;420 creationCI8 narrows to 6. Type compatibility cannot be inferred from spelling.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-022-V01 / VM1BD526-C006 | Insert or modification builds key from client, creation date, document ID and operation detail/general. | CONFLICT; cross-category technical example; G03,G04 |
| RULE-022-V02 / VM4BD302-C006 | SW-168=1 after all child rows | CONFLICT; cross-category technical example; G01 |
| RULE-022-V03 / VM4BD310-C005 | Found event decoded for output | CONFLICT; cross-category technical example; G03 |
| RULE-022-V04 / VM4BD420-C004 | StatusC after event scan | CONFLICT; cross-category technical example; G01 |

**Scenarios to exercise:** MAPPING20/DCLGEN28; EMBEDDED-SPACE-NAME; VIEW-BASE-IDENTITY; MAX-AMOUNT; CI-LEADING-ZERO; NULLABLE-QUERY-CHANGE.

**Counterexamples and limits:** Replacing every hyphen with underscore is not a verified mapping; DCLGEN DECLARE TABLE does not prove actual view lineage, uniqueness or constraints.

**Source evidence:** `IDMS Programs/VM1BD526.cbl` physical L66–72; `IDMS Programs/VM1BD526.cbl` physical L174–180; `DB2 Manual converted Programs/VMDZ1526.txt` physical L68–73; `DB2 Manual converted Programs/VMDZ1526.txt` physical L248–254; `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical L360–360; additional hash-bound ranges in the case ledger.

**Unanswered dependencies:** [Q-000002](../_audit/questions/Q-000002.md), [Q-000004](../_audit/questions/Q-000004.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000017](../_audit/questions/Q-000017.md), [Q-000038](../_audit/questions/Q-000038.md), [Q-000039](../_audit/questions/Q-000039.md), [Q-000026](../_audit/questions/Q-000026.md), [Q-000037](../_audit/questions/Q-000037.md)

### RULE-023 — Keep only storage with a proven lifetime or interface obligation

**Applies when:** Every added or changed working-storage item; technical rule applies to all programs and categories.

**Migration behavior:** Trace definitions, uses, simultaneous values and clobber points. Remove unused 526 SW-DZEVEFC1, unused date groups, and redundant 4420 SW-STATUS-D under the proven alternate guard. Reuse existing stock 12+check 1/client 1+5 aliases after copy validation; duplicate formatted dates often need no storage. Preserve independent nested EOF, cumulative/batch counts, selected child ID and run timestamp only while their semantics require simultaneous values.

**Minimum storage:** Classify each item mandatory business state, required host declaration, optional convention, removable, reused or unresolved. A role can be mandatory without an extra allocation:15-digit NB-READ can replace a duplicate small total under a validated skip redesign.7200 packed creation-date conversion must remain elementary; direct group copy is unsafe.

**Error and recovery contract:** Initialization/reuse must not erase a pending query key, last successful record needed across EOF, or original diagnostics before cleanup. Missing converted copies and SQLERRWS prevent some reuse proofs; proposals are not applied fixes.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-023-V01 / VM1BD526-C007 | All stock-key SQL and insertion client reference. | SUPPORTED_WITH_GAPS; cross-category technical example; G03,G04 |
| RULE-023-V02 / VM4BD302-C007 | Only state that remains live may require additional storage | PARTIAL; cross-category technical example; G01 |
| RULE-023-V03 / VM4BD310-C008 | Sequential dates/split keys/diagnostics | PARTIALLY_PRESERVED; cross-category technical example; G03 |
| RULE-023-V04 / VM4BD420-C006 | Existing WS-STATUS already represents D | PARTIAL; cross-category technical example; G01 |
| RULE-023-V05 / VM7BD200-C008 | Eight date conversions and cutoff | PARTIALLY_PRESERVED; cross-category technical example; G03 |

**Scenarios to exercise:** NO-READS-OF-FLAG; DISJOINT-DATE-LIFETIMES; NESTED-SQL-CLOBBER; LAST-RECORD-AFTER-EOF; PACKED-MOVE; COUNT-ROLE-REUSE.

**Counterexamples and limits:** Every new DCLGEN member is not automatically a mandatory helper; Reusing one variable for simultaneously live values reduces bytes but changes behavior.

**Source evidence:** `Copybook/VMBD205I.cpy` physical L54–55; `Copybook/VMBD205I.cpy` physical L624–673; `DB2 Manual converted Programs/VMDZ1526.txt` physical L74–85; `DB2 Manual converted Programs/VMDZ1526.txt` physical L230–273; `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical L309–324; additional hash-bound ranges in the case ledger.

**Unanswered dependencies:** [Q-000002](../_audit/questions/Q-000002.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000017](../_audit/questions/Q-000017.md), [Q-000020](../_audit/questions/Q-000020.md), [Q-000026](../_audit/questions/Q-000026.md), [Q-000035](../_audit/questions/Q-000035.md)

### RULE-026 — Ordinal file restart requires the identical durable input prefix

**Applies when:** 526/567 restore a physical record count and skip that many sequential records; no saved-key query or file-generation comparison exists.

**Migration behavior:** On valid incomplete checkpointN, discard exactlyN records, reset batch count, then processN+1. Require immutable file generation, byte content and ordering.526 calls STOP01/USERABEN on short skip but initializes its EOF flag after positioning, an ordering issue.567 repeats N reads without EOF guard and unconditionally prefetches again, creating read-after-EOF/false-completion risk. Equal business keys do not make positions interchangeable.

**Minimum storage:** Need count, input EOF and batch state with correct lifetimes, not necessarily a 1200-byte snapshot. If NB-READ also serves as cumulative total, skip reads must not mutate the fixed skip bound. Initialize EOF before the first skip read.

**Error and recovery contract:** Count beyond available input, malformed payload or changed generation must fail before business/checkpoint/completion writes. Missing file-status and abort contracts leave observed short-input outcome unresolved.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-026-V01 / VM1BD526-C010 | Existing incomplete checkpoint. | UNRESOLVED; classified in this guide; G02,G04 |
| RULE-026-V02 / VM1BD567-C006 | Checkpoint incomplete; skip countN may exceed available file. | LIKELY_DEFECT; classified in this guide; G02 |

**Scenarios to exercise:** N0; N=FILE-LENGTH; N>FILE-LENGTH; REORDERED-FILE; DUPLICATE-KEY-RECORDS; SECOND-RESTART; EOF-BEFORE-INITIALIZATION.

**Counterexamples and limits:** CountN is not a business-key high-water mark; Persisting but never comparing KY-RESTART does not verify input identity.

**Source evidence:** `IDMS Programs/VM1BD526.cbl` physical L126–145; `DB2 Manual converted Programs/VMDZ1526.txt` physical L198–213; `DB2 Manual converted Programs/VMDZ1526.txt` physical L337–345; `IDMS Programs/VM1BD567.cbl` physical L117–134; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L178–184; additional hash-bound ranges in the case ledger.

**Unanswered dependencies:** [Q-000020](../_audit/questions/Q-000020.md), [Q-000029](../_audit/questions/Q-000029.md), [Q-000030](../_audit/questions/Q-000030.md), [Q-000033](../_audit/questions/Q-000033.md)

### RULE-028 — Resolve restart identity, target object and legacy cutover explicitly

**Applies when:** 526/567 replace active FFRECAB restart access; the lookup is a non-LRF retrieval even inside 526’s LRF updater.

**Migration behavior:** Mapping logical 867/physical 873 names DZ01RSTB; executed SQL uses DZ01RSTV and DCLDZ01RSTV. Verify their DDL lineage, updatability, unique program/phase/date key and triggers. Legacy VM1BDF526-A/VM1BDF567-A plus date/set 0 becomes VMDZ1526/VMDZ1567, phase 1, SQL DATE. Target does not translate/read legacy checkpoints. Configure whether cutover starts at a verified fresh boundary or migrates a reconciled checkpoint.

**Minimum storage:** Use exact CHAR8 program, SMALLINT phase and DATE host. Existing CS-PROGRAM can be a literal/shared constant if SQLERRWS permits; do not truncate legacy names to manufacture correspondence.

**Error and recovery contract:** Missing row is expected fresh state only after key/cutover identity is resolved. Otherwise a key change can replay committed legacy work. Concurrent ownership and duplicate rows remain separate constraints.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-028-V01 / VM1BD526-C008 | Start keyed by run date and program identity. | UNRESOLVED; classified in this guide; G01,G02 |
| RULE-028-V02 / VM1BD567-C004 | Start keyed by business date. | UNRESOLVED; classified in this guide; G01,G02 |

**Scenarios to exercise:** FRESH-CUTOVER; LEGACY-PARTIAL-RUN; TARGET-VIEW-BASE-DDL; DUPLICATE-RUN-KEY; DIFFERENT-PHASE/DATE.

**Counterexamples and limits:** A TV suffix is not proof of an updatable view over the TB mapping; Program renaming alone does not migrate the saved restart position.

**Source evidence:** `IDMS Programs/VM1BD526.cbl` physical L120–138; `DB2 Manual converted Programs/VMDZ1526.txt` physical L324–355; `DB2 Manual converted Programs/VMDZ1526.txt` physical L401–428; `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical L873–873; `IDMS Programs/VM1BD567.cbl` physical L111–129; additional hash-bound ranges in the case ledger.

**Unanswered dependencies:** [Q-000031](../_audit/questions/Q-000031.md), [Q-000034](../_audit/questions/Q-000034.md)

### RULE-029 — Serialized payload length defines what is actually persisted

**Applies when:** 526/567 use TE_CH_RS_DATA VARCHAR(4000) with a 15-digit count plus 1200-byte record group.

**Migration behavior:** Initial INSERT sets length 1215; periodic/final UPDATE sets length 15 while moving the whole 1215-byte group to text. Under that declared host, only count bytes are supplied by UPDATE. KY-RESTART is never compared or used for positioning. Decide explicitly between count-only protocol and an approved full-record protocol, then align length, schema/version checks and consumers. Do not call the mismatch resolved without that decision.

**Minimum storage:** Count-only can remove KY-RESTART and WS-INPUT-KASBONS after dependency validation; full-record policy needs a valid last successful record across EOF.567 preserves its snapshot on failed READ;526 copies after every READ, including EOF.

**Error and recovery contract:** Before restore, validate length>=15 and numeric/range prefix; if record validation is required, require the full payload and use it. Capacity 4000 and NOT NULL do not validate serialization.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-029-V01 / VM1BD526-C012 | Initial versus periodic/final checkpoint serialization. | OBSERVED_INCONSISTENCY; classified in this guide; G02,G04 |
| RULE-029-V02 / VM1BD567-C008 | Initial, periodic or final checkpoint. | OBSERVED_INCONSISTENCY; classified in this guide; G02 |

**Scenarios to exercise:** INITIAL1215; UPDATE15; SHORT/NONNUMERIC-PAYLOAD; EOF-LAST-RECORD; COUNT-ONLY-REMOVAL; FULL-RECORD-VALIDATION.

**Counterexamples and limits:** MOVE1215 bytes to the text area does not override VARCHAR length 15; A never-read snapshot cannot supply restart identity assurance.

**Source evidence:** `IDMS Programs/VM1BD526.cbl` physical L230–237; `DB2 Manual converted Programs/VMDZ1526.txt` physical L60–63; `DB2 Manual converted Programs/VMDZ1526.txt` physical L347–368; `Dclgens/DZ01RSTV.txt` physical L16–31; `IDMS Programs/VM1BD567.cbl` physical L138–141; additional hash-bound ranges in the case ledger.

**Unanswered dependencies:** [Q-000032](../_audit/questions/Q-000032.md)

### RULE-030 — Preserve audit timestamp lifetime and introduced sentinel meanings

**Applies when:** 526/567 targets introduce audit columns in business writes.

**Migration behavior:** Both capture CURRENT-DATE once and reuse a run timestamp, rather than taking per-row time.526 INSERT supplies that creation timestamp, maximum 9999-12-31-23.59.59.999999 update timestamp, programID and NS_IDMSKEY = 0; later UPDATE replaces update timestamp.567 adds run timestamp/programID to accounting-date UPDATE. Approve each default and trigger interaction; clock time is distinct from passed business date.

**Minimum storage:** Run-start semantics need a timestamp value that survives row initialization; exact 42-byte formatting area and a separate maximum literal variable are optional. Reusing an unused DCLGEN timestamp requires protecting it from INITIALIZE.

**Error and recovery contract:** Replay may preserve business date but change audit time/trigger effects, so date assignment is not automatically fully idempotent. Invalid timestamp/constraint errors must prevent checkpoint commitment.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-030-V01 / VM1BD526-C016 | New event or update to selected event. | CHANGED_UNRESOLVED; cross-category technical example; G04 |
| RULE-030-V02 / VM1BD567-C003 | Each form update. | CHANGED_UNRESOLVED; classified in this guide; G02 |

**Scenarios to exercise:** TWO-ROWS-SAME-RUN-TIME; RESTART-NEW-RUN-TIME; MAXIMUM-INSERT-MARKER; BUSINESS-DATE-DIFFERS-CLOCK; INITIALIZE-PRESERVES-AUDIT.

**Counterexamples and limits:** Changing to CURRENT TIMESTAMP per row alters observed policy; An audit column is not harmless decoration when downstream consumers interpret it.

**Source evidence:** `DB2 Manual converted Programs/VMDZ1526.txt` physical L185–188; `DB2 Manual converted Programs/VMDZ1526.txt` physical L274–279; `DB2 Manual converted Programs/VMDZ1526.txt` physical L309–312; `DB2 Manual converted Programs/VMDZ1526.txt` physical L382–393; `IDMS Programs/VM1BD567.cbl` physical L156–158; additional hash-bound ranges in the case ledger.

**Unanswered dependencies:** [Q-000009](../_audit/questions/Q-000009.md)

### RULE-031 — Classify removal of runtime services separately from business records

**Applies when:** Every program removes or changes generated BIND/READY/FINISH/IDMS-STATUS services and introduces SQL includes or runtime attachment.

**Migration behavior:** Inventory direct verbs plus generated/called effects. Read-only 4310/7200 normal paths do not prove all hidden calls read-only; schemas contain unused writes that are not executed. Resolve SQLCA, SQLERRWS, SQLERROR, USERABEN, generated IDMS members, JCL attachment, compiler/precompile/bind and site standards. A missing delivered dependency is an assurance gap, not proof that an installed program cannot compile.

**Minimum storage:** Use the actual supported SQL interface and avoid duplicate SQLCODE declarations. Missing include fields cannot be counted as invented helpers. External COPY names retain their independent contract.

**Error and recovery contract:** READY removal does not itself establish Db 2 connection/transaction context; FINISH cannot be globally replaced by COMMIT without inspecting unit-of-work and output effects. Generated auto-status policies may differ from WHEN OTHER.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-031-V01 / VM4BD310-C001 | Open batch and close after input EOF | UNRESOLVED; cross-category technical example; G03 |
| RULE-031-V02 / VM7BD200-C001 | Start archive extract | UNRESOLVED; cross-category technical example; G03 |

**Scenarios to exercise:** RESOLVED-INCLUDE-CLOSURE; ATTACHMENT/COMMIT-CONTEXT; USERABEN-NONRETURN; CALL-HIDDEN-SIDE-EFFECT; ACTUAL-PRECOMPILE.

**Counterexamples and limits:** An unused LRF ERASE definition is not a program write; Missing source in the sample does not prove absent production runtime.

**Source evidence:** `IDMS Programs/VM4BD310.cbl` physical L137–163; `DB2 Manual converted Programs/VMDZ4310.txt` physical L185–205; `IDMS Programs/VM7BD200.cbl` physical L174–179; `IDMS Programs/VM7BD200.cbl` physical L210–222; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L429–440; additional hash-bound ranges in the case ledger.

**Unanswered dependencies:** [Q-000035](../_audit/questions/Q-000035.md)

### RULE-033 — Own SQL status immediately and preserve first-failure diagnostics through cleanup

**Applies when:** Every SQL statement and surrounding business/error branch, across all categories.

**Migration behavior:** Record operation, SQLCODE, SQLSTATE/SQLWARN where relevant, row validity, expected no-row meaning, cardinality and next action. Observed targets use 0/100/OTHER, no named negative-code branches, no SQLWARN/SQLSTATE/affected-row checks. +100 means expected end for FETCH and absent restart row; missing required parent/event/business UPDATE/checkpoint UPDATE is rejected. SQLCODE 0 may still carry warnings or a multirow searched UPDATE. Do not invent implemented retry logic.

**Minimum storage:** Immediate tests need no automatic saved-code helper. If SQLERROR executes rollback/logging/cleanup SQL before reporting the first failure, preserve original diagnostics in compatible existing/new storage only to that required lifetime. SQL-LOCATION must identify each operation, not a stale prior UPDATE.

**Error and recovery contract:** Verify SQLERROR/USERABEN termination and rollback; otherwise code can continue with invalid data, infinite cursor loop or false checkpoint. Distinguish constraint, duplicate, conversion/null, deadlock/timeout, authorization and ambiguous-commit scenarios when testing actual runtime; exact code/version policy is unprovided.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-033-V01 / VM1BD526-C014 | Any of 8 executable SQL statements, LR status failure, or completed/short-file call. | UNRESOLVED; classified in this guide; G01,G02,G03,G04 |
| RULE-033-V02 / VM1BD567-C011 | Restart SELECT, INSERT, UPDATE, COMMIT or form UPDATE. | UNRESOLVED; classified in this guide; G01,G02 |
| RULE-033-V03 / VM4BD302-C008 | Each SELECT/OPEN/FETCH/CLOSE | PARTIAL; cross-category technical example; G01 |
| RULE-033-V04 / VM4BD420-C005 | Every Db 2 cursor operation including earlyDclose | PARTIAL; cross-category technical example; G01 |

**Scenarios to exercise:** SQL0-WITH-WARNING; FETCH 100; SELECT100-BY-CONTEXT; UPDATE100; MULTIROW-UPDATE 0; NEGATIVE-SQL-FAIL; CLEANUP-OVERWRITES-SQLCODE; RETURNING-HANDLER; UNKNOWN-COMMIT.

**Counterexamples and limits:** One global IF SQLCODE NOT=0 abort rule breaks expected EOF/restart absence; Calling SQLERROR does not prove rollback or nonreturn; CLOSE/ROLLBACK diagnostics can overwrite the original failure.

**Source evidence:** `IDMS Programs/VM1BD526.cbl` physical L193–195; `IDMS Programs/VM1BD526.cbl` physical L206–227; `IDMS Programs/VM1BD526.cbl` physical L247–254; `DB2 Manual converted Programs/VMDZ1526.txt` physical L331–335; `DB2 Manual converted Programs/VMDZ1526.txt` physical L373–379; additional hash-bound ranges in the case ledger.

**Unanswered dependencies:** [Q-000003](../_audit/questions/Q-000003.md), [Q-000035](../_audit/questions/Q-000035.md)

## 5. Case-by-case migration crosswalk

This section retains every case classified in this category. The prose records what the supplied converter did and where equivalence remains conditional. Evidence hashes and additional ranges are in the linked ledgers; each report contains its complete declaration, field and operation inventories.

### VM1BD526-C008 — Restart lookup and cutover identity

**Program:** [VM1BD526.cbl](../programs/VM1BD526.cbl__migration.md) · **Rule/variant:** RULE-028, RULE-028-V01 · **Source assessment:** `UNRESOLVED`.

**Condition:** Start keyed by run date and program identity.

**Original behavior:** OBTAIN CALC FFRECAB uses VM1BDF526-A, DATE-YMD8, NS-SET-FF0; missing sets SW-FFRECAB1.

**Delivered Db2 behavior:** SELECT DZ01RSTV uses VMDZ1526, phase 1, DATE; zero resumes and+100 creates; mapping names baseDZ01RSTB.

**Evidence:** `IDMS Programs/VM1BD526.cbl` physical L120–138; `DB2 Manual converted Programs/VMDZ1526.txt` physical L324–355; `DB2 Manual converted Programs/VMDZ1526.txt` physical L401–428; `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical L873–873.

**Unanswered questions:** [Q-000031](../_audit/questions/Q-000031.md), [Q-000034](../_audit/questions/Q-000034.md)

### VM1BD526-C009 — Fresh checkpoint initialization

**Program:** [VM1BD526.cbl](../programs/VM1BD526.cbl__migration.md) · **Rule/variant:** RULE-016, RULE-016-V01 · **Source assessment:** `CHANGED_UNRESOLVED`.

**Condition:** Restart SELECT returns+100.

**Original behavior:** Initializes legacy row fields and 15-day retention; row first STORED after the first 100-record batch or at EOF.

**Delivered Db2 behavior:** INSERTS incomplete row immediately with retention 15, zero 15-digit count and 1215-byte payload; first commit remains a business-batch/final boundary.

**Evidence:** `IDMS Programs/VM1BD526.cbl` physical L130–140; `IDMS Programs/VM1BD526.cbl` physical L230–237; `DB2 Manual converted Programs/VMDZ1526.txt` physical L347–379; `DB2 Manual converted Programs/VMDZ1526.txt` physical L449–461.

**Unanswered questions:** [Q-000034](../_audit/questions/Q-000034.md), [Q-000035](../_audit/questions/Q-000035.md)

### VM1BD526-C010 — Count-based resume and skip validation

**Program:** [VM1BD526.cbl](../programs/VM1BD526.cbl__migration.md) · **Rule/variant:** RULE-026, RULE-026-V01 · **Source assessment:** `UNRESOLVED`.

**Condition:** Existing incomplete checkpoint.

**Original behavior:** Skips exactly NS-REC-FF-IN records with TELLER, calls STOP01 if EOF while positioning; resets TELLER and reads next record.

**Delivered Db2 behavior:** Copies payload to group, repeats NB-READ skip reads; same EOF STOP01; resets cumulative total from NB-READ, then TELLER and EOF flag before next read. EOF flag is explicitly initialized only after skips.

**Evidence:** `IDMS Programs/VM1BD526.cbl` physical L126–145; `DB2 Manual converted Programs/VMDZ1526.txt` physical L198–213; `DB2 Manual converted Programs/VMDZ1526.txt` physical L337–345.

**Unanswered questions:** [Q-000020](../_audit/questions/Q-000020.md), [Q-000029](../_audit/questions/Q-000029.md), [Q-000030](../_audit/questions/Q-000030.md)

### VM1BD526-C011 — 100-record transaction boundary

**Program:** [VM1BD526.cbl](../programs/VM1BD526.cbl__migration.md) · **Rule/variant:** RULE-001, RULE-001-V01 · **Source assessment:** `SUPPORTED_WITH_GAPS`.

**Condition:** Each processed input record; TELLER not less than 100 or EOF.

**Original behavior:** Business LRF work, add batch TELLER to FFRECAB total, MODIFY/STORE checkpoint, COMMIT; final checkpoint then FINISH.

**Delivered Db2 behavior:** Business SQL, save cumulative read count, update restart row, COMMIT; final commit marks complete at EOF. Count matches processed rows only if every error routine terminates.

**Evidence:** `IDMS Programs/VM1BD526.cbl` physical L148–158; `IDMS Programs/VM1BD526.cbl` physical L230–237; `IDMS Programs/VM1BD526.cbl` physical L103–109; `DB2 Manual converted Programs/VMDZ1526.txt` physical L215–225; `DB2 Manual converted Programs/VMDZ1526.txt` physical L357–380.

**Unanswered questions:** [Q-000028](../_audit/questions/Q-000028.md), [Q-000035](../_audit/questions/Q-000035.md)

### VM1BD526-C012 — Checkpoint payload length and record buffer

**Program:** [VM1BD526.cbl](../programs/VM1BD526.cbl__migration.md) · **Rule/variant:** RULE-029, RULE-029-V01 · **Source assessment:** `OBSERVED_INCONSISTENCY`.

**Condition:** Initial versus periodic/final checkpoint serialization.

**Original behavior:** Persists NS-REC-FF-IN; no 1200-byte input-record checkpoint is visible.

**Delivered Db2 behavior:** Initial length 1215; every update length 15; KY-RESTART and snapshot never validate or drive resume.

**Evidence:** `IDMS Programs/VM1BD526.cbl` physical L230–237; `DB2 Manual converted Programs/VMDZ1526.txt` physical L60–63; `DB2 Manual converted Programs/VMDZ1526.txt` physical L347–368; `Dclgens/DZ01RSTV.txt` physical L16–31.

**Unanswered questions:** [Q-000032](../_audit/questions/Q-000032.md)

### VM1BD526-C013 — Completion and repeated run

**Program:** [VM1BD526.cbl](../programs/VM1BD526.cbl__migration.md) · **Rule/variant:** RULE-009, RULE-009-V01 · **Source assessment:** `CHANGED_UNRESOLVED`.

**Condition:** EOF, empty input, later same-key execution.

**Original behavior:** Final FFRECAB count is stored then FINISH; a later run can skip count and encounter EOF.

**Delivered Db2 behavior:** Final checkpoint CO-ID-RS = 1; a later selected row with 1 calls USERABEN; no deletion or retention enforcement appears.

**Evidence:** `IDMS Programs/VM1BD526.cbl` physical L103–109; `IDMS Programs/VM1BD526.cbl` physical L120–145; `DB2 Manual converted Programs/VMDZ1526.txt` physical L175–183; `DB2 Manual converted Programs/VMDZ1526.txt` physical L337–345; `DB2 Manual converted Programs/VMDZ1526.txt` physical L357–379.

**Unanswered questions:** [Q-000027](../_audit/questions/Q-000027.md), [Q-000035](../_audit/questions/Q-000035.md)

### VM1BD526-C014 — Operation-specific SQL and error state

**Program:** [VM1BD526.cbl](../programs/VM1BD526.cbl__migration.md) · **Rule/variant:** RULE-033, RULE-033-V01 · **Source assessment:** `UNRESOLVED`.

**Condition:** Any of 8 executable SQL statements, LR status failure, or completed/short-file call.

**Original behavior:** Parent-not-found/LR-ERROR in insert calls IDMS-STOP which displays status, ROLLBACKs and CALLs USERABEN; other LR failures call USERABEN directly; IDMS AUTOSTATUS dependency missing.

**Delivered Db2 behavior:** Restart SELECT accepts 0/+100, parent SELECT only 0, event SELECT 0/+100 distinct displays, all changes/COMMIT only 0; OTHER calls unavailable SQLERROR. No SQLSTATE/SQLWARN/row-count/indicator branch or explicit target ROLLBACK.

**Evidence:** `IDMS Programs/VM1BD526.cbl` physical L193–195; `IDMS Programs/VM1BD526.cbl` physical L206–227; `IDMS Programs/VM1BD526.cbl` physical L247–254; `DB2 Manual converted Programs/VMDZ1526.txt` physical L331–335; `DB2 Manual converted Programs/VMDZ1526.txt` physical L373–379; `DB2 Manual converted Programs/VMDZ1526.txt` physical L401–627.

**Unanswered questions:** [Q-000035](../_audit/questions/Q-000035.md)

### VM1BD526-C015 — Cumulative and per-invocation counters

**Program:** [VM1BD526.cbl](../programs/VM1BD526.cbl__migration.md) · **Rule/variant:** RULE-007, RULE-007-V01 · **Source assessment:** `UNRESOLVED`.

**Condition:** Long input, resume, and statistic reconciliation.

**Original behavior:** TELLER is a 5-digit batch/skip counter; persistent total resides in unavailable FFRECAB layout.

**Delivered Db2 behavior:** Total and insert/update metrics are 5-digit packed; saved count 15-digit; total is restored but insert/update totals restart at 0.

**Evidence:** `IDMS Programs/VM1BD526.cbl` physical L59–64; `IDMS Programs/VM1BD526.cbl` physical L126–157; `DB2 Manual converted Programs/VMDZ1526.txt` physical L54–64; `DB2 Manual converted Programs/VMDZ1526.txt` physical L180–182; `DB2 Manual converted Programs/VMDZ1526.txt` physical L320–365; `DB2 Manual converted Programs/VMDZ1526.txt` physical L568–568; `DB2 Manual converted Programs/VMDZ1526.txt` physical L615–615.

**Unanswered questions:** [Q-000029](../_audit/questions/Q-000029.md)

### VM1BD567-C001 — Six-key form lookup and date-only business update

**Program:** [VM1BD567.cbl](../programs/VM1BD567.cbl__migration.md) · **Rule/variant:** RULE-005, RULE-005-V01 · **Source assessment:** `SUPPORTED_WITH_GAPS`.

**Condition:** Every successfully read operation record.

**Original behavior:** MOVE1815 and five input key components into VMBFAR; OBTAIN CALC fetches the whole row; set DA-INFSD-GDIFAR to run date then MODIFY.

**Delivered Db2 behavior:** A searched UPDATE uses all six mapped key components, changes accounting date plus audit timestamp/user; successful SQL increments one statement counter.

**Evidence:** `IDMS Programs/VM1BD567.cbl` physical L147–158; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L192–228; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L426–451; `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical L79–91.

**Unanswered questions:** [Q-000020](../_audit/questions/Q-000020.md), [Q-000035](../_audit/questions/Q-000035.md), [Q-000037](../_audit/questions/Q-000037.md)

### VM1BD567-C002 — Creation-date key sentinel

**Program:** [VM1BD567.cbl](../programs/VM1BD567.cbl__migration.md) · **Rule/variant:** RULE-013, RULE-013-V01 · **Source assessment:** `CHANGED_UNRESOLVED`.

**Condition:** Input creation date is zero, spaces, a valid nonzero date or malformed nonzero date.

**Original behavior:** Input value moved directly into packed creation-date CALC key; no sentinel normalization in program.

**Delivered Db2 behavior:** Zero/space group becomes 00010101 then EUR string; malformed nonzero values are not checked before SQL.

**Evidence:** `IDMS Programs/VM1BD567.cbl` physical L149–158; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L201–219; `Dclgens/DZBFARTV.txt` physical L13–18.

**Unanswered questions:** [Q-000010](../_audit/questions/Q-000010.md)

### VM1BD567-C003 — Run-scoped audit timestamp

**Program:** [VM1BD567.cbl](../programs/VM1BD567.cbl__migration.md) · **Rule/variant:** RULE-030, RULE-030-V02 · **Source assessment:** `CHANGED_UNRESOLVED`.

**Condition:** Each form update.

**Original behavior:** Business date is changed, with no listed audit fields.

**Delivered Db2 behavior:** One startup CURRENT-DATE value is reused for TS_UPDATE on every form; program ID becomes ID_USERID.

**Evidence:** `IDMS Programs/VM1BD567.cbl` physical L156–158; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L162–162; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L222–226; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L254–266.

**Unanswered questions:** [Q-000009](../_audit/questions/Q-000009.md)

### VM1BD567-C004 — Restart key and table/view identity

**Program:** [VM1BD567.cbl](../programs/VM1BD567.cbl__migration.md) · **Rule/variant:** RULE-028, RULE-028-V02 · **Source assessment:** `UNRESOLVED`.

**Condition:** Start keyed by business date.

**Original behavior:** FFRECAB CALC key VM1BDF567-A/date/NS-SET-FF0; missing sets SW-RECAB N.

**Delivered Db2 behavior:** DZ01RSTV singleton key VMDZ1567/phase 1/SQL DATE; zero resumes,+100 inserts; map points to DZ01RSTB.

**Evidence:** `IDMS Programs/VM1BD567.cbl` physical L111–129; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L269–280; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L356–387; `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical L873–873.

**Unanswered questions:** [Q-000031](../_audit/questions/Q-000031.md), [Q-000034](../_audit/questions/Q-000034.md)

### VM1BD567-C005 — Fresh restart-row creation

**Program:** [VM1BD567.cbl](../programs/VM1BD567.cbl__migration.md) · **Rule/variant:** RULE-016, RULE-016-V02 · **Source assessment:** `SUPPORTED_WITH_GAPS`.

**Condition:** No checkpoint found.

**Original behavior:** Initializes count 0, set/record types,7-day retention and STOREs FFRECAB before business processing.

**Delivered Db2 behavior:** INSERTs incomplete restart row with retention 7 and 1215-byte count+record payload, no immediate COMMIT.

**Evidence:** `IDMS Programs/VM1BD567.cbl` physical L121–129; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L306–318; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L410–424.

**Unanswered questions:** [Q-000034](../_audit/questions/Q-000034.md), [Q-000035](../_audit/questions/Q-000035.md)

### VM1BD567-C006 — Resume skip and short input

**Program:** [VM1BD567.cbl](../programs/VM1BD567.cbl__migration.md) · **Rule/variant:** RULE-026, RULE-026-V02 · **Source assessment:** `LIKELY_DEFECT`.

**Condition:** Checkpoint incomplete; skip countN may exceed available file.

**Original behavior:** PERFORM VARYING CTR-REC FROM1 stops at EOF or CTR-REC>N; no extra read if EOF.

**Delivered Db2 behavior:** Performs N READs without EOF termination then unconditional prefetched READ; restores total inside loop and resets batch after loop.

**Evidence:** `IDMS Programs/VM1BD567.cbl` physical L117–134; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L178–184; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L238–250; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L283–303.

**Unanswered questions:** [Q-000029](../_audit/questions/Q-000029.md), [Q-000030](../_audit/questions/Q-000030.md), [Q-000033](../_audit/questions/Q-000033.md)

### VM1BD567-C007 — Legacy counter and repaired/changed commit cadence

**Program:** [VM1BD567.cbl](../programs/VM1BD567.cbl__migration.md) · **Rule/variant:** RULE-010, RULE-010-V01 · **Source assessment:** `LEGACY_DEFECT_AND_CHANGED_IMPLEMENTATION`.

**Condition:** Fresh input and incomplete restart.

**Original behavior:** CTR-REC stays 0 for ordinary fresh processing: READ has no increment, so >99 never triggers and final checkpoint adds 0. On a normal resume of N successfully skipped records, PERFORM VARYING leaves CTR-REC N+1, with no reset before new business work.

**Delivered Db2 behavior:** Read increments WS-TELLER and cumulative count; each successful update then tests>99; reset after positioning and checkpoint; intended 100-record cadence appears implemented for normal flow in which errors terminate processing.

**Evidence:** `IDMS Programs/VM1BD567.cbl` physical L57–57; `IDMS Programs/VM1BD567.cbl` physical L117–141; `IDMS Programs/VM1BD567.cbl` physical L147–176; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L230–250; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L283–283; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L328–349.

**Unanswered questions:** [Q-000021](../_audit/questions/Q-000021.md), [Q-000035](../_audit/questions/Q-000035.md)

### VM1BD567-C008 — Checkpoint payload length

**Program:** [VM1BD567.cbl](../programs/VM1BD567.cbl__migration.md) · **Rule/variant:** RULE-029, RULE-029-V02 · **Source assessment:** `OBSERVED_INCONSISTENCY`.

**Condition:** Initial, periodic or final checkpoint.

**Original behavior:** Only count field updated in FFRECAB; record payload not shown.

**Delivered Db2 behavior:** Initial 1215 bytes becomes 15 on UPDATE; extra snapshot is held across EOF but not serialized past 15 or checked on resume.

**Evidence:** `IDMS Programs/VM1BD567.cbl` physical L138–141; `IDMS Programs/VM1BD567.cbl` physical L161–166; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L54–61; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L306–338.

**Unanswered questions:** [Q-000032](../_audit/questions/Q-000032.md)

### VM1BD567-C009 — Completion and later rerun

**Program:** [VM1BD567.cbl](../programs/VM1BD567.cbl__migration.md) · **Rule/variant:** RULE-009, RULE-009-V02 · **Source assessment:** `CHANGED_UNRESOLVED`.

**Condition:** EOF or empty input, then another execution with same key.

**Original behavior:** Final count modification and FINISH; no completion marker or explicit rerun abend.

**Delivered Db2 behavior:** Final CO-ID-RS = 1 and COMMIT; selected complete row displays PREVIOUS RUN COMPLETE then USERABEN.

**Evidence:** `IDMS Programs/VM1BD567.cbl` physical L138–144; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L184–189; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L287–303; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L325–350.

**Unanswered questions:** [Q-000027](../_audit/questions/Q-000027.md), [Q-000035](../_audit/questions/Q-000035.md)

### VM1BD567-C010 — Business/checkpoint commit and crash recovery

**Program:** [VM1BD567.cbl](../programs/VM1BD567.cbl__migration.md) · **Rule/variant:** RULE-001, RULE-001-V02 · **Source assessment:** `SUPPORTED_WITH_GAPS`.

**Condition:** Normal hundred-record batch or final remainder.

**Original behavior:** Intended order is business modification then checkpoint MODIFY then COMMIT/FINISH, but supplied counter breaks cadence/count.

**Delivered Db2 behavior:** Business UPDATE, save cumulative count and completion, UPDATE checkpoint, COMMIT; no persistent external output file; final DISPLAY follows commit.

**Evidence:** `IDMS Programs/VM1BD567.cbl` physical L138–176; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L228–250; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L325–350; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L184–189.

**Unanswered questions:** [Q-000021](../_audit/questions/Q-000021.md), [Q-000028](../_audit/questions/Q-000028.md), [Q-000035](../_audit/questions/Q-000035.md)

### VM1BD567-C011 — Statement-specific status and cleanup

**Program:** [VM1BD567.cbl](../programs/VM1BD567.cbl__migration.md) · **Rule/variant:** RULE-033, RULE-033-V02 · **Source assessment:** `UNRESOLVED`.

**Condition:** Restart SELECT, INSERT, UPDATE, COMMIT or form UPDATE.

**Original behavior:** No explicit VMBFAR missing-row branch; BATCH-AUTOSTATUS and missing IDMS-STATUS determine errors.

**Delivered Db2 behavior:** Only restart SELECT accepts 0/+100; all DML and COMMIT accept 0 only; OTHER prints record count and calls SQLERROR. SQL-LOCATION1100 assigned only for business UPDATE. No SQLSTATE/WARN/row-count/indicator checks.

**Evidence:** `IDMS Programs/VM1BD567.cbl` physical L38–40; `IDMS Programs/VM1BD567.cbl` physical L155–158; `IDMS Programs/VM1BD567.cbl` physical L179–180; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L276–280; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L343–450.

**Unanswered questions:** [Q-000035](../_audit/questions/Q-000035.md)

### VM1BD567-C012 — Counter range and reporting

**Program:** [VM1BD567.cbl](../programs/VM1BD567.cbl__migration.md) · **Rule/variant:** RULE-007, RULE-007-V02 · **Source assessment:** `UNRESOLVED`.

**Condition:** Long file, resumed invocation and more than one row qualifying an UPDATE.

**Original behavior:** CTR-REC9(9) intended counter has flawed update logic; FFRECAB effective type unavailable.

**Delivered Db2 behavior:** Cumulative count 9(7), batch 9(9), update-call countS9(11), serialized count 9(15); update metric resets on restart while total restores.

**Evidence:** `IDMS Programs/VM1BD567.cbl` physical L57–57; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L54–61; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L186–187; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L245–250; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L297–300; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L444–450.

**Unanswered questions:** [Q-000029](../_audit/questions/Q-000029.md)

## 6. Cross-program verification and validation scenarios

Rule applicability is checked against every one of the six IDMS inputs, including programs that did not originate the rule. A rule is not “verified for all programs” merely because it is linked to its seed cases. UNKNOWN records missing evidence; CONTRADICTED retains a demonstrated conflict; NOT_APPLICABLE requires a scoped reason. The 198-cell matrix contains the per-program condition, source evidence, case IDs and unresolved questions. Production status remains PARTIAL where required evidence is missing.

| Scenario family | Inputs / boundary | Expected assessment or required outcome |
| --- | --- | --- |
| Business key/cardinality | One/missing/duplicate form; swap detail/general components; blank/zero creation date. | Exactly intended form or approved failure; SQL 0 alone must not be treated as proven singleton. |
| Cadence and legacy defect | Fresh 0/1/99/100/101/200 records and restart N = 100. | Trace actual counter assignments; retain the supplied legacy defect and conditional target repair separately. |
| Skip/identity | N = 0, N = input length, N > input length, reordered/replaced input. | No skipped new work, repeated committed work or false completion; fail safely when input identity or position is invalid. |
| Payload/capacity | Lengths 1215/15/<15, nondigits, restored large count, 99999/100000 and 9999999/10000000. | Validate serialization and active range; initial/later payload discrepancy remains until the contract and code agree. |
| Crash boundaries | Fail before business, after business, after checkpoint UPDATE, before/after COMMIT, lost acknowledgement. | Durable business and checkpoint describe one prefix; ambiguous outcome is reconciled before retry. |
| Ownership/completion | Concurrent same-key jobs, completed row, empty fresh run, reset/retention/cutover. | Approved owner and lifecycle behavior; stored retention values do not substitute for a working purge/reset mechanism. |

These are production-oriented test specifications. Static source tracing, declaration arithmetic and separate Python reasoning models can demonstrate a particular condition or counterexample. They cannot establish COBOL compiler behavior, SQL runtime behavior, complete output byte compatibility or job recovery on the real mainframe. Actual environment tests must report their own inputs, observed outputs and evidence.

## 7. Open business and evidence questions

Each link opens the exact unanswered Phase 1 snapshot. Editable current question files live in `Migration-Analysis/Human-in-Loops/`. A later answer must be applied only to its accepted file/case scope and must not rewrite this baseline. The following includes category questions and applicable shared technical questions; it does not imply that every question applies to every program.

| Question | Affected files | Decision or evidence required |
| --- | --- | --- |
| [Q-000002](../_audit/questions/Q-000002.md) | VM4BD302.cbl | Are 12-character stock IDs and six-character CIs always decimal digits for this output, and can the 13-integer-digit amount exceed the 12-integer-digit output capacity? |
| [Q-000003](../_audit/questions/Q-000003.md) | VM4BD302.cbl | For VM9BC50T QUERY001/CO-CLE2, which return-major/minor/actual-length values authorize use of issue key and currency, and must failure skip, reject, or abort the input? |
| [Q-000004](../_audit/questions/Q-000004.md) | VM4BD420.cbl | For statusC output, is the last encountered qualifying 0060 creation event intended, and are its 8-digit embedded creationCI values constrained so the 6-digit UIT-NR-CIO-CRE receives the correct identifier? |
| [Q-000005](../_audit/questions/Q-000005.md) | VM7BD200.cbl | Must the 478-byte embedded VMBFAS image preserve every original byte, including the 2- and 14-byte filler areas noted as containing COMP-3 values, or are blank fillers approved? Supply the generated original record and the downstream layout. |
| [Q-000006](../_audit/questions/Q-000006.md) | VM7BD200.cbl | Was every accounting date 00000000 migrated to Db 2 DATE0001-01-01, and must the creation-date fallback and strict less-than cutoff remain exactly as in the original? |
| [Q-000009](../_audit/questions/Q-000009.md) | VM1BD526.cbl, VM1BD567.cbl | Should audit timestamps identify job start or each individual business change, and is VMDZ1526 insertion TS_UPDATE = 9999-12-31-23.59.59.999999 the approved never-updated marker? |
| [Q-000010](../_audit/questions/Q-000010.md) | VM1BD567.cbl | Must a blank or zero input creation date select the form key dated 0001-01-01, or should such input be rejected or routed to a different outcome? |
| [Q-000011](../_audit/questions/Q-000011.md) | VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl | Is FFRECAT to DZ01FFTB the intended second buffer replacement, and which actual producer/consumer program paths establish its keys, lifecycle, transaction ownership and recovery obligations? |
| [Q-000012](../_audit/questions/Q-000012.md) | VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl | Which exact COBOL/IDMS/Db 2 versions, source/debugging options, compilation/bind settings, site coding standards and generated IDMS record/control members produced these six source pairs? Supply the matching build/dependency bundle. |
| [Q-000013](../_audit/questions/Q-000013.md) | VM4BD310.cbl | For NX-CPCRE=0, must AM-CND-FORM-AS retain the parent AM-CND-STOCK value, including nonzero amounts, or was a zero output deliberately approved? |
| [Q-000014](../_audit/questions/Q-000014.md) | VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl, VM7BD200.cbl | Which effective DATE output format and approved legacy zero/high-date conversions apply to the date fields read by these programs? Provide actual package/preparation settings and the load conversion specification. |
| [Q-000015](../_audit/questions/Q-000015.md) | VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl | Supply the eight distinct approved decommission identities, using IDMS or Db 2 names, with namespace, scope and retained business obligations. |
| [Q-000017](../_audit/questions/Q-000017.md) | VM1BD526.cbl, VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl | What approved loader and consumer specification maps the legacy 20-byte packed/mixed NR-ID-GOOD to the supplied 28-character NR_IDGOOD_479EVEF, including sign and date conventions, when the mapping sheet still says CHAR(20)? |
| [Q-000019](../_audit/questions/Q-000019.md) | VM4BD310.cbl | After failure with some mutation records already written, must the job replace the partial output and rerun the same immutable input from the start, or must downstream processing deduplicate or resume it? |
| [Q-000020](../_audit/questions/Q-000020.md) | VM1BD526.cbl, VM1BD567.cbl | Supply the exact VMDZ205I member used for these builds and confirm whether its 1200-byte layout and numeric/group aliases are identical to the supplied VMBD205I, apart from the level-01 name. |
| [Q-000021](../_audit/questions/Q-000021.md) | VM1BD567.cbl | Is the intended checkpoint the count of successfully processed physical input records, committed every 100 such records, and is the conversion authorized to repair the supplied legacy CTR-REC behavior? |
| [Q-000024](../_audit/questions/Q-000024.md) | VM7BD200.cbl | Should mapping logical row 193, RA_BASFMAS _479BFAS, be corrected to the exact DCLGEN and SQL identifier RA_BASFMAS_479BFAS? |
| [Q-000025](../_audit/questions/Q-000025.md) | VM7BD200.cbl | Supply VMDZ270I and confirm the exact archive-output layout and its consumer contract against supplied VMBZ270I. |
| [Q-000026](../_audit/questions/Q-000026.md) | VM4BD310.cbl | Supply VMDZ510I and confirm the exact 1500-byte mutation-output layout, all aliases and OCCURS/REDEFINES against supplied VMBD510I. |
| [Q-000027](../_audit/questions/Q-000027.md) | VM1BD526.cbl, VM1BD567.cbl | Is it intended that a checkpoint with CO-ID-RS = 1 makes a same-key rerun abend, including an empty-input completed run, and who may reset or retire that row? |
| [Q-000028](../_audit/questions/Q-000028.md) | VM1BD526.cbl, VM1BD567.cbl | Are overlapping executions with the same program, phase and business date forbidden by the scheduler, or must the restart implementation acquire and validate an ownership token/lock? |
| [Q-000029](../_audit/questions/Q-000029.md) | VM1BD526.cbl, VM1BD567.cbl | What is the maximum cumulative successful input count per keyed run and restart, and must counters preserve all 15 checkpoint digits rather than the current 5-digit (VMDZ1526) or 7-digit (VMDZ1567) range? |
| [Q-000030](../_audit/questions/Q-000030.md) | VM1BD526.cbl, VM1BD567.cbl | What guarantees that a resumed job uses the same file generation, exact record sequence and contents as the checkpointed run, and what must happen if that identity cannot be verified? |
| [Q-000031](../_audit/questions/Q-000031.md) | VM1BD526.cbl, VM1BD567.cbl | When moving these jobs from IDMS to Db 2, are existing FFRECAB checkpoints converted to the new program/phase/date key, or is a verified fresh input/data boundary required before the first Db 2 run? |
| [Q-000032](../_audit/questions/Q-000032.md) | VM1BD526.cbl, VM1BD567.cbl | Should each checkpoint persist only the 15-digit processed count, or all 1215 bytes consisting of the count and last input record, and must the saved record be compared during resume? |
| [Q-000033](../_audit/questions/Q-000033.md) | VM1BD567.cbl | Must a restart whose saved count exceeds the available input records fail before any checkpoint/completion update, and what diagnostic/file-status behavior is required? |
| [Q-000034](../_audit/questions/Q-000034.md) | VM1BD526.cbl, VM1BD567.cbl | Provide the DDL/catalog identity and field mapping proving that DZ01RSTV is the intended updatable view of DZ01RSTB for FFRECAB, including uniqueness on program, phase and date, authorization/bind qualifier, triggers and constraints. |
| [Q-000035](../_audit/questions/Q-000035.md) | VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl | What is the exact failure/non-return contract of SQLERROR, SQLERRWS, generated IDMS status/bind members and USERABEN for the six supplied programs, including preservation of the producing diagnostics and rollback of uncommitted work? Supply the implementation members. |
| [Q-000037](../_audit/questions/Q-000037.md) | VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl | Supply the actual CREATE VIEW/base-table/constraint DDL connecting the mapped TB objects to the queried TV objects, including view predicates, duplicate-key rules and nullability for the business tables used by these six programs. |
| [Q-000038](../_audit/questions/Q-000038.md) | VM4BD302.cbl | After a failure with some 90-byte output records already written by VMDZ4302.txt, must the job discard and recreate the partial file from a stable input/database snapshot, or use another recovery and downstream publication policy? |
| [Q-000039](../_audit/questions/Q-000039.md) | VM4BD420.cbl | After a failure with some 50-byte output records already written by VMDZ4420.cbl, must the job discard and recreate the partial file from a stable input/database snapshot, or use another recovery and downstream publication policy? |

## 8. Carrying this guide into Phase 2

Preserve this complete Phase 1 guide and its source/configuration/question fingerprints. Read each answered question, record answer origin and scope, and recheck every affected program, case, rule variant and matrix row. Update the guide's conditional rule and its failure/boundary scenarios where an answer changes intent. Keep source defects, missing DDL/copybooks and unexecuted runtime tests visible until actual evidence resolves them.

For the user-authorized rehearsal, temporary answers must be labelled `SIMULATED_FOR_TEST` and `TEST_ASSUMPTION_ONLY`. They can establish a hypothetical test policy, but cannot become human approval, production-confirmed intent, invented missing files or a successful mainframe test. A future real run must use genuine business answers and evidence with the same scoped reconciliation.

## 9. Evidence and platform reference scope

All program/dependency citations use physical file lines beneath `tests/six-program-sample/Mainframe/workspace/`. They are not the COBOL sequence numbers printed in columns 1–6. The original source hashes and exact evidence ranges are recorded in [cases.json](../_audit/cases.json), [rules.json](../_audit/rules.json), [program-findings.json](../_audit/program-findings.json) and [run.json](../_audit/run.json). The supplied CSV has 871 logical rows including its header over 877 physical lines; quoted multiline cells make those coordinate systems different.

The following official documentation is conditional platform background already cited in the individual program reviews. The installation's actual COBOL, IDMS and Db2 versions and options are missing; these URLs are not evidence of a successful build or of the site's behavior.

- [IBM Db2 SQLCODE +100](https://www.ibm.com/docs/en/db2-for-zos/13.0.0?topic=codes-100): distinguish no row for singleton/search operations from cursor exhaustion using the application context.
- [IBM Db2 SQLCODE 000](https://www.ibm.com/docs/en/db2-for-zos/13.0.0?topic=codes-000): a zero SQLCODE does not eliminate warning review.
- [IBM Db2 OPEN](https://www.ibm.com/docs/en/db2-for-zos/13.0.0?topic=statements-open): input host values are used when the cursor is opened; restore them before a subsequent reopen.
- [IBM Db2 datetime strings](https://www.ibm.com/docs/en/db2-for-zos/13.0.0?topic=values-string-representations-datetime) and [DATE FORMAT](https://www.ibm.com/docs/en/db2-for-zos/13.0.0?topic=2-date-format-field-date-decp-value): valid date input representation and effective fetched output format are separate concerns.
- [IBM COBOL REDEFINES](https://www.ibm.com/docs/en/cobol-zos/6.5.0?topic=entry-redefines-clause), [group moves](https://www.ibm.com/docs/en/cobol-zos/6.3.0?topic=statement-group-moves) and [reference modification](https://www.ibm.com/docs/en/cobol-zos/6.3.0?topic=reference-modification): alias storage and transfer category must survive a no-helper rewrite.
- [Broadcom IDMS DML COBOL reference](https://ftpdocs.broadcom.com/cadocs/0/CA%20IDMS%2018%205%20User%20Bookshelf-ENU/Bookshelf_Files/HTML/IDMS_DML_COBOL_Ref_ENU/949156.html): FINISH/ROLLBACK behavior must be integrated with the actual run-unit and target transaction context.

No COBOL source, copybook, DCLGEN, schema or mapping file was changed for this analysis. No precompile, compile/link, bind, Db2 execution, runtime crash injection, concurrency test or business approval is represented by this guide. Static findings and proposed validation scenarios remain separately labelled.
