# G04 — LRF update and restart

**Phase:** 2 · **Run:** Run-001 · **Execution mode:** TEST_REHEARSAL · **Source/production assessment:** PARTIAL · **Baseline:** Phase-1/Run-001.

**Answers:** 36 PROVIDED test assumptions, 3 DEFERRED questions, 0 real human answers. All 39 production questions remain OPEN. The original source findings are retained; the exact scoped rehearsal revisions appear inside every rule and case below.

This is a conditional generic synthesis of the supplied six-program corpus. It contains **15 classified cases** and **21 rule definitions** for this category. Rules shared across categories retain the same RULE IDs; their source variants remain explicitly identified. The complete corpus contains 60 distinct cases and 33 distinct rules.

## 1. Scope and what this sample establishes

This guide covers VM1BD526 → VMDZ1526. Three executed selectors have different meanings: ST-VMBEVEF obtains a parent then stores a child; ALL-VMBEVEF-BY-VMBEFF walks children; MO-VMBEVEF finds the current child then modifies it. These operations are enclosed by an ordinary FFRECAB-to-Db2 count-based checkpoint protocol. The sibling 567 updater supplies comparative restart counterexamples, not an additional LRF implementation.

Preserve both the selected LR path's conditions and the business decision that invokes it. Only CO-STCIRC-OORD = '1' inserts; every other value modifies. Parent validation, child identity, event/service filters, status distinctions, transaction rollback and durable file position must remain connected. Replacing the LR with SQL that happens to affect a row is insufficient when it selects another child or advances the checkpoint after a failed operation.

Every recommendation below separates an observed source behavior, an observed target behavior, an unresolved condition and a proposed change. A manually converted program is evidence of a developer's approach; its correctness is not assumed. The reports include a demonstrated missing-field defect, representation conflicts and unresolved operational contracts. The frozen Phase 1 snapshots remain unanswered; this Phase 2 revision consumes the current scoped temporary answers listed in section 7.

The configured eight decommission identities were not supplied. FFRECAB is visibly used for restart and has a mapped target candidate, while FFRECAT → DZ01FFTB is only a possible second replacement. No supplied producer/consumer path establishes the requested persistent buffer protocol. These gaps are covered by RULE-003/RULE-014 and individual questions; they are not silently classified as absent business work.

### Program participation

| Input / paired report | Role in this guide |
| --- | --- |
| [VM1BD526.cbl](../programs/VM1BD526.cbl__migration.md) | 15 classified cases: VM1BD526-C001, VM1BD526-C002, VM1BD526-C003, VM1BD526-C004, VM1BD526-C005, VM1BD526-C006, VM1BD526-C007, VM1BD526-C009, VM1BD526-C010, VM1BD526-C011, VM1BD526-C012, VM1BD526-C013, VM1BD526-C014, VM1BD526-C015, VM1BD526-C016 |

## 2. Execution method for a new program

1. Trace the circulation-status IF to the exact selected LR request. Do not normalize all LR verbs to one generic CRUD template: ST, ALL and MO have different prerequisite state and error contracts.
2. Expand ST-VMBEVEF to its parent lookup and child STORE. Map the parent's four-key identity, then child membership fields, sequence/default/audit values and external form-key encoding. Preserve the missing-parent failure before INSERT.
3. Expand ALL-VMBEVEF-BY-VMBEFF to parent/set/child traversal with the original event 0168 and service 0219 filter. Establish which matching child is selected. The target's greatest generated ID is a changed selection until set/load order or explicit business intent establishes it.
4. Expand MO-VMBEVEF to FIND CURRENT plus MODIFY. Replace implicit currency with the stable selected child ID, keep it live, and update only the intended business/audit columns. No cursor is needed for the delivered singleton flow.
5. Connect every failure to durable progress. A failed parent lookup, insert, selection, update or checkpoint must prevent the current input record from becoming committed progress. The missing SQLERROR body leaves rollback/nonreturn unproved even where the visible main calls it.
6. Apply the count-based restart lifecycle described below: resolve new key/cutover, validate incomplete checkpoint and immutable input, skip exactly the saved prefix, process new work, checkpoint and commit atomically, then record completion. Preserve the separate roles of cumulative position and batch count.
7. Audit the working storage around the selected paths and restart code. Reuse input/DCLGEN aliases only while they remain live and exact. Remove unused cursor flags from singleton flow; preserve a selected child ID across updates and a run-start timestamp across INITIALIZE if their policies require those values.
8. Cross-check schema custom outcomes and all commit/crash boundaries. Missing full set definitions, FK/sequence DDL, converted input member and runtime handlers remain explicit unresolved evidence, even if the normal branch matches.

## 3. Business conditions, access shape and state

### Business route, parent/child identity and errors

| Condition / selected operation | Source obligation | Delivered SQL and unresolved detail |
| --- | --- | --- |
| CO-STCIRC-OORD = '1' → ST-VMBEVEF | Parent must exist; insert event 0168/service 0219 under stock product 1002. | Parent SELECT then event INSERT; selected parent lookup returns 22 columns although presence/relationship is the purpose. New sequence/audit/default columns need DDL/policy evidence. |
| Any other circulation value → ALL path | Find first matching 0168/0219 child under the stock key. Blank and unknown flag values also take ELSE. | Filtered child SELECT ordered by generated ID descending; legacy order equivalence unresolved. |
| Successful selection → MO-VMBEVEF | FIND CURRENT VMBEVEF then MODIFY the same child. | Preserve selected NR_ID and UPDATE by that stable identity; do not rebuild identity from the replacement good-key. |
| Missing insert parent | Original VMBEFF-NOT-FND/LR-ERROR invokes explicit rollback/abort. | Target parent nonzero invokes missing SQLERROR; equivalent rollback and nonreturn are unproved. |
| No matching modify child | No valid current child; source rejects non-LR-FOUND. | SELECT +100 is rejected; empty set versus filtered no-match diagnosis is collapsed. |
| UPDATE/INSERT/checkpoint failure | Current record must not become committed input progress. | The visible main calls SQLERROR but does not itself show target ROLLBACK. |

Evidence: VM1BD526-C001–C005 and C014; original physical L148–158, L186–221, L251–256; target L215–225, L463–622; Schema/VMBTS07 selected paths in the individual case ledger.

The target stores a sequence-generated event ID and an explicit parent key instead of relying on network membership. Prove parent uniqueness, child FK/constraint enforcement, set membership semantics and concurrent deletion behavior; a successful parent SELECT alone cannot enforce relationship at the later INSERT. Sequence gaps are possible, and a new ID on retry does not establish business deduplication. No extra copied current-record token is mandatory when the selected DCLGEN ID remains live through UPDATE. [RULE-018–RULE-020; Q-000018.]

### Restart lifecycle enclosing the LRF business work

The checkpoint key changes from the legacy VM1BDF526-A/date/set convention to VMDZ1526/phase 1/SQL DATE. Mapping names FFRECAB → DZ01RSTB, while SQL/DCLGEN use DZ01RSTV. Actual view/base DDL and cutover are unresolved (Q-000031/Q-000034). This is a direct restart lookup; its category binding appears in G01/G02, but the identity obligation still applies to the enclosing LRF job.

| Boundary | Required relationship | Observed implementation / gap |
| --- | --- | --- |
| Fresh row | Incomplete/count 0 belongs to the same run identity as future business work. | INSERT before business loop, length 1215, no immediate COMMIT. Earlier creation than original first-checkpoint STORE. |
| Resume | Saved N identifies exactly the already committed physical input prefix. | Skip N records; identical generation/order not checked. Short skip calls STOP01/USERABEN, whose nonreturn is unavailable. EOF flag initialization occurs after positioning. |
| Business success | Insert or selected-child update succeeds before corresponding progress is durable. | Normal branch order supports this condition; missing handlers prevent proving failure behavior. |
| Batch boundary | Business effects and count advance commit together after 100 processed inputs. | TELLER NOT < 100 causes checkpoint UPDATE then SQL COMMIT. Same transaction attachment/hidden commits unprovided. |
| Final boundary | Final remainder and completion marker describe the same input prefix. | Final checkpoint/COMMIT even for empty input or exact prior batch boundary. |
| Later same-key invocation | Follow approved completed-run/reset policy. | CO-ID-RS = 1 invokes USERABEN; this is new behavior. |
| Lost commit acknowledgement | Determine durable business/checkpoint outcome before retry. | No supplied recovery handler establishes reconciliation; a blind new event INSERT can duplicate business work. |

Cases VM1BD526-C009–C015 bind these statements to physical ranges. The sibling 567 counter defect is a caution against copying apparent 100-record comments without a complete def-use trace; its business update is not an LRF variant.

### Payload, counts and helpers must agree with the chosen protocol

The declared restart text can hold 4000 bytes. Initial INSERT supplies length 1215: a 15-digit count plus a 1200-byte record. Later UPDATE sets length 15 despite moving the full 1215-byte group. The target never consults KY-RESTART to position or validate input. If policy is count-only, duplicate full-record snapshots are candidates for removal after dependency checks; if policy requires the last record, the UPDATE omits it and EOF lifetime must be repaired. Phase 2 Q-000032 chooses count-only persistence for the rehearsal, while retaining the initial-length inconsistency. [VM1BD526-C012.]

The active cumulative total has only five digits, so a persisted 15-digit value can narrow even though the declaration uses ARITH(EXTEND). Retain the cumulative-position role and independent batch role; consider reusing existing NB-READ rather than adding another narrow total. Positioning must keep a fixed skip bound, and out-of-range data must not become a successful checkpoint. [VM1BD526-C015; Q-000029.]

The manual target's unused SW-DZEVEFC1 is not mandatory cursor state because this flow has no executable cursor. Stock/client reconstruction can reuse compatible input aliases if missing VMDZ205I confirms their layout. Run-start audit time must survive row initialization if that is the intended policy, but a particular 42-byte formatting block or a separate maximum-timestamp variable is not inherently required. Added creation/update defaults, NS_IDMSKEY = 0 and the maximum update-timestamp marker remain explicit business questions. [VM1BD526-C006/C007/C016; Q-000009, Q-000017, Q-000020.]

### Phase 2: LRF write policy and restart dependencies

The 526 test retains the exact circulation route, assumes a compatible input layout, unique parent/FK/event-ID fixture and fatal rollback/nonreturn, and permits greatest-ID selection as an intentional test policy. That choice does not prove legacy FIRST equivalence. Q-000017 selects a 28-digit form-key contract, but its minimum-date wording does not prove that the delivered key builder normalizes zero components. The CHAR(20) mapping conflict and missing loader remain visible.

The enclosing restart test assumes immutable input and one owner, chooses count-only persistence and accepts completed same-key rejection. Initial 1215-byte serialization, the narrow active total, and missing runtime/DDL evidence remain. Q-000009 defines run-scoped audit intent, not timestamp continuity across resumed invocations. Successful fixtures still require their parent rows; a literal empty business database is a failure scenario. No code or schema was modified to implement any temporary answer.

## 4. Conditional rule catalog

Each rule gives its applicability condition, preserved or changed behavior, minimum-storage reasoning, failure contract, source variants and concrete scenarios. A variant whose originating case belongs to another category is a cross-category technical example, not a reclassification of that program. The actual 33 × 6 rule/program cross-check is [rule-applicability.json](../_audit/rule-applicability.json); its APPLIES_SUPPORTS, APPLIES_VARIANT, APPLIES_CONTRADICTS, UNKNOWN and NOT_APPLICABLE rows are evidence assessments, not automatic production approval.

### RULE-001 — Commit business work and its checkpoint as one recoverable unit

**Phase 2 conditional rule and scenario revision:** For 567, Q-000021 defines successful-record counting and 100-record atomic batches as test intent; the old CTR-REC behavior remains a legacy defect, and the target cadence is a conditional repair. For both updaters, Q-000028 supplies one owner only in the fixture, Q-000034 supplies a simple same-transaction restart view, and Q-000035 assumes fatal rollback/nonreturn. Trace business DML → checkpoint UPDATE → COMMIT under those assumptions, then retain failure-before/after-checkpoint and lost-acknowledgement scenarios. No source ownership check, central rollback implementation or real atomicity has been demonstrated.

**Exact scoped answer dependencies:** [Q-000021](../_audit/questions/Q-000021.md) [VM1BD567.cbl; PROVIDED]; [Q-000028](../_audit/questions/Q-000028.md) [VM1BD526.cbl, VM1BD567.cbl; PROVIDED]; [Q-000034](../_audit/questions/Q-000034.md) [VM1BD526.cbl, VM1BD567.cbl; PROVIDED]; [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. Full answer hashes and origin are in section 7.

**Six-program source recheck:** VM1BD526.cbl = U; VM1BD567.cbl = U; VM4BD302.cbl = N; VM4BD310.cbl = N; VM4BD420.cbl = N; VM7BD200.cbl = N. The legend and complete matrix are in section 6; no synthetic answer upgrades the production disposition.

**Applies when:** A sequential-input updater has a persisted physical-position checkpoint: demonstrated in 526 and 567, including the LRF insert/update branch of 526.

**Source-derived migration behavior and production conditions:** After the current record succeeds, update the restart count/flag and then COMMIT. The 526 threshold is TELLER NOT < 100; target 567 uses WS-TELLER > 99. On EOF, commit the remainder and completion marker, even when the preceding full batch already committed. This is observed statement order, conditional on one transaction attachment and no hidden commit. The 567 legacy counter defect is a distinct variant, not a working baseline.

**Minimum storage:** A cumulative durable-position count must coexist with a resettable batch count. Reuse TELLER or original-compatible CTR-REC; a second small cumulative counter is avoidable if the existing 15-digit NB-READ is safely reused. No cursor position or full-record buffer is mandatory for a count-only protocol.

**Error and recovery contract:** Failed business DML or failed checkpoint UPDATE must prevent COMMIT. Missing SQLERROR/USERABEN bodies leave rollback and nonreturn unproved. If COMMIT outcome is unknown, reconcile the durable row before replay; a sequence-generated event ID does not make INSERT retry idempotent.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-001-V01 / VM1BD526-C011 | Each processed input record; TELLER not less than 100 or EOF. | SUPPORTED_WITH_GAPS; classified in this guide; G02,G04 |
| RULE-001-V02 / VM1BD567-C010 | Normal hundred-record batch or final remainder. | SUPPORTED_WITH_GAPS; cross-category technical example; G02 |

**Scenarios to exercise:** BATCH-099/100/101: inspect count and effects at each boundary; FAIL-AFTER-BUSINESS: neither business nor count durable after rollback; FAIL-AFTER-CHECKPOINT: both revert before commit; LOST-COMMIT-ACK: inspect durable checkpoint; FINAL-EMPTY: completion at count 0.

**Counterexamples and limits:** 567 legacy fresh CTR-REC remains 0, so its threshold never fires; Separate file writes do not become atomic with Db 2 merely because COMMIT exists; A returning SQLERROR can allow a failed record to be checkpointed.

**Source evidence:** `IDMS Programs/VM1BD526.cbl` physical L148–158; `IDMS Programs/VM1BD526.cbl` physical L230–237; `IDMS Programs/VM1BD526.cbl` physical L103–109; `DB2 Manual converted Programs/VMDZ1526.txt` physical L215–225; `DB2 Manual converted Programs/VMDZ1526.txt` physical L357–380; additional hash-bound ranges in the case ledger.

**Question versions / production gaps:** [Q-000021](../_audit/questions/Q-000021.md), [Q-000028](../_audit/questions/Q-000028.md), [Q-000035](../_audit/questions/Q-000035.md)

### RULE-002 — Every branch must receive the exact data it consumes

**Phase 2 conditional rule and scenario revision:** Q-000013 requires the legacy capital amount for 310 when NX_CPCRE = 0. This strengthens the test oracle: use a nonzero parent amount such as 12500 and require that value in output. The delivered SELECT still omits AM_CNDSTK and consumes initialized zero; it remains a defect, not a resolved question. Q-000026 only assumes the original output layout for reasoning and does not supply VMDZ510I. Add amount population to the existing DCLGEN path in a future implementation; no duplicate helper is required by this policy.

**Exact scoped answer dependencies:** [Q-000013](../_audit/questions/Q-000013.md) [VM4BD310.cbl; PROVIDED]; [Q-000026](../_audit/questions/Q-000026.md) [VM4BD310.cbl; PROVIDED]. Full answer hashes and origin are in section 7.

**Six-program source recheck:** VM1BD526.cbl = S; VM1BD567.cbl = S; VM4BD302.cbl = S; VM4BD310.cbl = C; VM4BD420.cbl = S; VM7BD200.cbl = S. The legend and complete matrix are in section 6; no synthetic answer upgrades the production disposition.

**Applies when:** Any migration narrows a SELECT, splits a logical record, initializes a host group, or reconstructs a file record. Applies across all four guide categories.

**Source-derived migration behavior and production conditions:** Build branch-specific def-use paths from each output, comparison and update back to a successful retrieval or explicit business assignment. Confirmed 4310 defect: DCLDZBEFFTV is initialized; AM_CNDSTK is absent from the SELECT while NX_CPCRESK is selected twice; the NX_CPCRESK=0 branch therefore emits initialized zero instead of the legacy capital amount. Preserving field names or successful SQL is insufficient. Other projections require the same check without inventing another case.

**Minimum storage:** Add the missing compatible host/output assignment when business policy requires it. A duplicate shadow amount is unnecessary; use the existing DCLGEN amount. INITIALIZE is not a business default. Preserve input hosts until the corresponding query is issued.

**Error and recovery contract:** Never consume stale/initialized result fields after +100 or failure. Wrong branch population is an application defect even when SQLCODE is 0. Keep the observed 4310 discrepancy until corrected code and tests establish behavior.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-002-V01 / VM4BD310-C004 | NX-CPCRE=0 versus nonzero | DEFECT; cross-category technical example; G03 |

**Scenarios to exercise:** CAPITAL-ZERO-COUNT: nonzero capital with NX_CPCRESK=0; INTEREST-BRANCH: nonzero count; EMPTY-SELECT: no output from invalid hosts; ALTERNATING-BRANCHES: no value leaks from prior record.

**Counterexamples and limits:** 4310 SELECT success does not populate an omitted amount; A whole-record initialize can hide a missing SELECT item by producing plausible zero.

**Source evidence:** `IDMS Programs/VM4BD310.cbl` physical L247–253; `DB2 Manual converted Programs/VMDZ4310.txt` physical L219–263; `DB2 Manual converted Programs/VMDZ4310.txt` physical L393–399.

**Question versions / production gaps:** [Q-000013](../_audit/questions/Q-000013.md), [Q-000026](../_audit/questions/Q-000026.md)

### RULE-003 — Establish the persistent buffer lifecycle before replacing it

**Phase 2 conditional rule and scenario revision:** Q-000011 is DEFERRED. FFRECAT → DZ01FFTB remains a mapping candidate, with no established producer, consumer, key, ownership, fill/drain, purge or restart lifecycle. The rehearsal cannot construct a buffer migration rule from transient record copies. Keep every affected program's buffer applicability unresolved where dependency evidence is absent; no fictional table or storage-saving claim is introduced.

**Exact scoped answer dependencies:** [Q-000011](../_audit/questions/Q-000011.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; DEFERRED]. Full answer hashes and origin are in section 7.

**Six-program source recheck:** VM1BD526.cbl = U; VM1BD567.cbl = U; VM4BD302.cbl = U; VM4BD310.cbl = U; VM4BD420.cbl = U; VM7BD200.cbl = U. The legend and complete matrix are in section 6; no synthetic answer upgrades the production disposition.

**Applies when:** The requested second old/new record pair is a buffer, or an effective dependency actually produces/consumes persistent staging state. No such lifecycle is demonstrated in these six bodies.

**Source-derived migration behavior and production conditions:** CSV logical 871/physical 877 maps FFRECAT to DZ01FFTB, but that alone does not identify the user-configured buffer or establish ownership, key, fill/drain order, retention, commit boundary or replay. Trace producers and consumers, including selected LRF paths and called routines, after the exact pair is supplied. Distinguish these obligations from the proven FFRECAB restart role.

**Minimum storage:** WS-INPUT-KASBONS and KY-RESTART are transient 1200-byte areas, not proof of a persistent buffer table. Do not add queue state or duplicate row buffers based only on their names. Required storage remains undecided until the protocol is known.

**Error and recovery contract:** No claims about fill/consume crash recovery, cleanup or exactly-once delivery can be made. A missing producer/consumer is an evidence gap rather than automatic not-applicable status.

**Executed-case coverage:** no supplied selected path establishes this global configuration obligation. Keep the missing identity/lifecycle question open.

**Scenarios to exercise:** IDENTIFY-PAIR: namespace and table/view resolved; TRACE-PRODUCER-CONSUMER: all effective references; FAIL-BETWEEN-FILL-CONSUME: define durable state after evidence arrives.

**Counterexamples and limits:** FFRECAT being declared in a subschema does not prove use; A VARCHAR restart payload is not automatically a persistent staging queue.

**Question versions / production gaps:** [Q-000011](../_audit/questions/Q-000011.md)

### RULE-007 — The active counter must represent the persisted restart position

**Phase 2 conditional rule and scenario revision:** Q-000029 limits happy-path fixtures to the current counter ranges and separately requires 100000 for 526, 10000000 for 567 and oversized restored counts as failure boundaries. It does not prove either source detects overflow: the narrow declarations and absent range guards remain. Preserve the full cumulative-position role and a separate resettable batch role. Reusing the existing 15-digit NB-READ is a conditional redesign; verify that skip reads cannot move their own fixed bound. No mainframe overflow test was executed.

**Exact scoped answer dependencies:** [Q-000029](../_audit/questions/Q-000029.md) [VM1BD526.cbl, VM1BD567.cbl; PROVIDED]. Full answer hashes and origin are in section 7.

**Six-program source recheck:** VM1BD526.cbl = U; VM1BD567.cbl = U; VM4BD302.cbl = N; VM4BD310.cbl = N; VM4BD420.cbl = N; VM7BD200.cbl = N. The legend and complete matrix are in section 6; no synthetic answer upgrades the production disposition.

**Applies when:** Any count-based restart; observed 526 active total 5 digits,567 total 7 digits, persisted prefix 15 digits.

**Source-derived migration behavior and production conditions:** Separate successful physical input positions, resettable batch counts, current-invocation SQL statement totals and affected-row counts. Validate restored count and increment capacity before use.526 cannot represent totals beyond 99999 in its active field;567 beyond 9999999. ARITH(EXTEND) does not enlarge PIC. A large valid 15-digit payload can still narrow on assignment.

**Minimum storage:** Prefer reusing existing 15-digit NB-READ as cumulative total with separate skip-read control and existing batch count. The fixed skip bound must not increase during positioning. Retain diagnostic counters only when their independent business/reporting obligation is confirmed.

**Error and recovery contract:** Reject malformed, negative/out-of-range or too-short counts before positioning. A counter overflow must prevent checkpoint advancement and completion; no such guard is shown in the targets.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-007-V01 / VM1BD526-C015 | Long input, resume, and statistic reconciliation. | UNRESOLVED; classified in this guide; G02,G04 |
| RULE-007-V02 / VM1BD567-C012 | Long file, resumed invocation and more than one row qualifying an UPDATE. | UNRESOLVED; cross-category technical example; G02 |

**Scenarios to exercise:** 526-99999/100000; 567-9999999/10000000; RESTORED-LARGE-COUNT; SKIP-DOES-NOT-ADVANCE-TOTAL; RESUMED-DIAGNOSTIC-VS-CUMULATIVE.

**Counterexamples and limits:** A15-digit serialized count does not make a 5-digit working total safe; Successful UPDATE calls are not necessarily affected-row counts.

**Source evidence:** `IDMS Programs/VM1BD526.cbl` physical L59–64; `IDMS Programs/VM1BD526.cbl` physical L126–157; `DB2 Manual converted Programs/VMDZ1526.txt` physical L54–64; `DB2 Manual converted Programs/VMDZ1526.txt` physical L180–182; `DB2 Manual converted Programs/VMDZ1526.txt` physical L320–365; additional hash-bound ranges in the case ledger.

**Question versions / production gaps:** [Q-000029](../_audit/questions/Q-000029.md)

### RULE-008 — Retain the exact circulation flag’s insert/else routing

**Phase 2 conditional rule and scenario revision:** Q-000020 allows a hypothetical legacy-compatible input layout for 526/567, but only 526 uses this circulation route. Test flag '1', '0', blank and another value: the delivered equality still inserts only for '1', with all other values modifying. The temporary copybook assumption does not validate the real field offset, actual VMDZ205I or a newly restricted input domain. No extra insert/update flag is justified.

**Exact scoped answer dependencies:** [Q-000020](../_audit/questions/Q-000020.md) [VM1BD526.cbl, VM1BD567.cbl; PROVIDED]. Full answer hashes and origin are in section 7.

**Six-program source recheck:** VM1BD526.cbl = S; VM1BD567.cbl = N; VM4BD302.cbl = N; VM4BD310.cbl = N; VM4BD420.cbl = N; VM7BD200.cbl = N. The legend and complete matrix are in section 6; no synthetic answer upgrades the production disposition.

**Applies when:** 526 processes a successfully read operation record whose CO-STCIRC-OORD chooses event creation or modification.

**Source-derived migration behavior and production conditions:** Only equality to character 1 selects insertion; every other value selects modification. Insert creates event 0168/service 0219 under product 1002. The ELSE includes blanks and unknown values in both listings; adding validation is a separate policy change. Both branches belong to the same per-record checkpoint protocol.

**Minimum storage:** Use the existing input flag and compatible aliases. No new insert/update switch is required. Resolve missing VMDZ205I before asserting offset/type identity.

**Error and recovery contract:** Failure in either branch must prevent count commitment. Parent/child error and rollback details come from the selected LR path, not merely the routing IF.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-008-V01 / VM1BD526-C001 | One successfully read input record; CO-STCIRC-OORD equals 1 or any other value. | SUPPORTED; classified in this guide; G04 |

**Scenarios to exercise:** FLAG-1: insert; FLAG-0: modify; FLAG-BLANK: observedELSE; FLAG-OTHER: observedELSE; BRANCH-FAIL: no checkpoint advancement.

**Counterexamples and limits:** Interpreting ELSE as only 0 would narrow existing behavior; Incrementing a read count before failed DML does not authorize persisting it.

**Source evidence:** `IDMS Programs/VM1BD526.cbl` physical L148–158; `DB2 Manual converted Programs/VMDZ1526.txt` physical L215–225; `Copybook/VMBD205I.cpy` physical L1313–1317.

**Question versions / production gaps:** [Q-000020](../_audit/questions/Q-000020.md)

### RULE-009 — Treat completed-run rejection and retention as explicit business policies

**Phase 2 conditional rule and scenario revision:** Q-000027 accepts a completed same-key rerun as a planned test rejection for both updaters. This is an intentional difference from the delivered legacy behavior, not evidence of equivalence. With Q-000035's assumed nonreturn, no new work follows that rejection. Keep empty input completion, exact batch completion, final-commit acknowledgement loss, authorised reset and retention expiry as separate scenarios. Retention values 15/7 still do not establish an implemented purge or scheduler recognition mechanism.

**Exact scoped answer dependencies:** [Q-000027](../_audit/questions/Q-000027.md) [VM1BD526.cbl, VM1BD567.cbl; PROVIDED]; [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. Full answer hashes and origin are in section 7.

**Six-program source recheck:** VM1BD526.cbl = U; VM1BD567.cbl = U; VM4BD302.cbl = N; VM4BD310.cbl = N; VM4BD420.cbl = N; VM7BD200.cbl = N. The legend and complete matrix are in section 6; no synthetic answer upgrades the production disposition.

**Applies when:** 526/567 targets add CO-ID-RS = 1 when EOF is observed and reject later execution with the same key.

**Source-derived migration behavior and production conditions:** Commit completion with the final count. Empty fresh input also leads to complete 1/count 0. Retention 15 for 526 and 7 for 567 is stored metadata; no purge/reset code is shown. Completed-row rejection is new relative to the source and must be approved independently of successful ordinary restart.

**Minimum storage:** The existing restart flag represents completion. It must not be confused with EOF during skip, a transient existence flag, or a separate scheduler acknowledgement. No new flag is justified absent another state distinction.

**Error and recovery contract:** A crash after durable final COMMIT but before DISPLAY/CLOSE can leave the scheduler uncertain while a rerun is rejected. Define completion recognition, reset authority and stale-row handling; USERABEN nonreturn is unproved.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-009-V01 / VM1BD526-C013 | EOF, empty input, later same-key execution. | CHANGED_UNRESOLVED; classified in this guide; G02,G04 |
| RULE-009-V02 / VM1BD567-C009 | EOF or empty input, then another execution with same key. | CHANGED_UNRESOLVED; cross-category technical example; G02 |

**Scenarios to exercise:** COMPLETE-RERUN; EMPTY-INPUT; FINAL-COMMIT-ACK-LOST; SAME-DATE-DIFFERENT-FILE; RETENTION-EXPIRED.

**Counterexamples and limits:** NB-DAY-RS15/7 does not prove automated deletion; EOF while skipping a too-short file must not become normal completion.

**Source evidence:** `IDMS Programs/VM1BD526.cbl` physical L103–109; `IDMS Programs/VM1BD526.cbl` physical L120–145; `DB2 Manual converted Programs/VMDZ1526.txt` physical L175–183; `DB2 Manual converted Programs/VMDZ1526.txt` physical L337–345; `DB2 Manual converted Programs/VMDZ1526.txt` physical L357–379; additional hash-bound ranges in the case ledger.

**Question versions / production gaps:** [Q-000027](../_audit/questions/Q-000027.md), [Q-000035](../_audit/questions/Q-000035.md)

### RULE-012 — Date representation and date meaning require separate decisions

**Phase 2 conditional rule and scenario revision:** Q-000014 supplies EUR output and the documented zero/high sentinel convention only to 302/420/310/7200; Q-000006 specifically keeps 7200's strict cutoff and accounting-zero creation-date fallback. Corrected Q-000025 assumes its 20-byte cutoff input layout. Test equality exclusion, leap/high/zero dates and packed creation-date transfer. These assumptions do not prove loaded data or package settings, and they do not authorize applying the same conversion to 526/567. In particular, Q-000017 does not prove 526's key builder normalizes zero creation-date components.

**Exact scoped answer dependencies:** [Q-000006](../_audit/questions/Q-000006.md) [VM7BD200.cbl; PROVIDED]; [Q-000014](../_audit/questions/Q-000014.md) [VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl, VM7BD200.cbl; PROVIDED]; [Q-000025](../_audit/questions/Q-000025.md) [VM7BD200.cbl; PROVIDED]. Full answer hashes and origin are in section 7.

**Six-program source recheck:** VM1BD526.cbl = V; VM1BD567.cbl = U; VM4BD302.cbl = U; VM4BD310.cbl = U; VM4BD420.cbl = U; VM7BD200.cbl = U. The legend and complete matrix are in section 6; no synthetic answer upgrades the production disposition.

**Applies when:** Dates cross packed/display COBOL, SQL DATE X(10), or output layouts in any category; examples include 4310 restoration and 7200 archive filtering.

**Source-derived migration behavior and production conditions:** Prove actual bind/install DATE representation before positional DD.MM.YYYY parsing.7200’s strict cutoff is accounting date<cutoff when nonzero, otherwise creation date<cutoff; target uses 0001-01-01 as the zero sentinel.4310 returns dates to legacy output and must retain approved zero/high-date meanings.526/567 format run and creation dates separately. Preserve each program’s inequalities, pivot and fallback; valid SQL syntax alone does not approve a sentinel.

**Minimum storage:** Reuse one 8-character conversion area and one 10-character formatter where lifetimes do not overlap. A punctuation-bearing date belongs in X(10), not PIC 9(10). A reference-modified alphanumeric 8 source may preserve elementary conversion to a packed target where a group MOVE would copy raw bytes.

**Error and recovery contract:** Test zero, blanks, malformed dates, high dates, leap days and environment format. Do not manufacture a numeric date from failed SQL hosts or silently normalize business values.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-012-V01 / VM4BD310-C006 | DB2 DATE hosts populated | UNRESOLVED; cross-category technical example; G03 |
| RULE-012-V02 / VM7BD200-C004 | Nonzero accounting date else creation date; strictly before cutoff | UNRESOLVED; cross-category technical example; G03 |

**Scenarios to exercise:** CUTOFF-EQUAL: excluded 7200; ZERO-ACCOUNTING-FALLBACK; EUR/ISO-OUTPUT-CONFIG; PACKED-CREATION-CONVERSION; LEAP/INVALID/HIGH-DATE.

**Counterexamples and limits:** 302 uses strict upper bound while 4420 includes equality; Group MOVE of eight display digits into COMP-3 does not perform the required numeric conversion.

**Source evidence:** `IDMS Programs/VM4BD310.cbl` physical L258–263; `DB2 Manual converted Programs/VMDZ4310.txt` physical L404–433; `IDMS Programs/VM7BD200.cbl` physical L188–191; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L366–370; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L417–423.

**Question versions / production gaps:** [Q-000006](../_audit/questions/Q-000006.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000025](../_audit/questions/Q-000025.md)

### RULE-014 — Decommissioning removes approved identities and preserves surviving obligations

**Phase 2 conditional rule and scenario revision:** Q-000015 is DEFERRED: all eight approved identities remain unknown. The rehearsal cannot declare any set of eight schema records decommissioned or remove parent/error/restart obligations. Keep the per-entity checklist unresolved until actual names, namespaces, scopes and retained duties arrive. Removing IDMS includes or unused helpers is not a substitute for that approval.

**Exact scoped answer dependencies:** [Q-000015](../_audit/questions/Q-000015.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; DEFERRED]. Full answer hashes and origin are in section 7.

**Six-program source recheck:** VM1BD526.cbl = U; VM1BD567.cbl = U; VM4BD302.cbl = U; VM4BD310.cbl = U; VM4BD420.cbl = U; VM7BD200.cbl = U. The legend and complete matrix are in section 6; no synthetic answer upgrades the production disposition.

**Applies when:** The user supplies eight distinct decommission identities, in explicit IDMS/Db 2 namespaces and program scope. No such list is supplied in this sample.

**Source-derived migration behavior and production conditions:** Resolve the exact eight entries through mapping, aliases, COPY expansion, calls and selected LRF paths. For each, record direct/transitive access, data validation, parent existence, ordering, error, restart, file and audit obligations, then identify which are retained elsewhere or explicitly retired. Current distinct-entity count is UNKNOWN. Removed IDMS statements or an unused copybook do not establish approved decommissioning.

**Minimum storage:** Remove obsolete record/helper state only after proving all remaining def-use and interface effects. FFRECAB is actively replaced; VMBEFF/VMBEVEF/VMBFAR remain active. No eight names or automatic storage savings are invented.

**Error and recovery contract:** Removing a parent record must not silently eliminate required missing-parent behavior or referential checks. Cases with unavailable dependencies remain blocked rather than certified absent.

**Executed-case coverage:** no supplied selected path establishes this global configuration obligation. Keep the missing identity/lifecycle question open.

**Scenarios to exercise:** EIGHT-DISTINCT-ENTITIES; ALIAS-DUPLICATE; CALLED-DEPENDENCY-USE; RETAINED-PARENT-VALIDATION; REMOVED-ERROR-OBLIGATION.

**Counterexamples and limits:** Eight occurrences are not necessarily eight identities; Removing VMBD05 or an IDMS include is not proof that its business entity was decommissioned.

**Question versions / production gaps:** [Q-000015](../_audit/questions/Q-000015.md)

### RULE-016 — Locate initial checkpoint creation within the first transaction

**Phase 2 conditional rule and scenario revision:** Q-000034 assumes a simple unique-key restart view without hidden triggers/commits; Q-000035 assumes rollback and nonreturn on failure. Under that hypothetical fixture, the initial row is in the same first transaction as business work or empty-file completion. Initial length remains 1215, and Q-000032's count-only policy does not repair that inconsistency. Test competing INSERT, failure before first commit and empty fresh input. Do not describe an in-memory successful INSERT as durable progress before COMMIT.

**Exact scoped answer dependencies:** [Q-000032](../_audit/questions/Q-000032.md) [VM1BD526.cbl, VM1BD567.cbl; PROVIDED]; [Q-000034](../_audit/questions/Q-000034.md) [VM1BD526.cbl, VM1BD567.cbl; PROVIDED]; [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. Full answer hashes and origin are in section 7.

**Six-program source recheck:** VM1BD526.cbl = U; VM1BD567.cbl = U; VM4BD302.cbl = N; VM4BD310.cbl = N; VM4BD420.cbl = N; VM7BD200.cbl = N. The legend and complete matrix are in section 6; no synthetic answer upgrades the production disposition.

**Applies when:** 526/567 restart SELECT returns expected+100 for a fresh run.

**Source-derived migration behavior and production conditions:** Initialize program/date/phase, incomplete 0, count 0 and retention; INSERT a length 1215 payload without an immediate COMMIT.526 moves initial creation earlier than its legacy first-checkpoint STORE;567 preserves creation before work. First durable checkpoint therefore depends on the first business/final transaction. A competing creator and a crash before that commit need explicit treatment.

**Minimum storage:** Use the supported DCLGEN VARCHAR length/data pair and existing count/flag. Do not assume length 4000 is written merely from capacity; currently initial length 1215 differs from subsequent 15.

**Error and recovery contract:** INSERT failure must not proceed without an owned checkpoint. Duplicate creation is not locally retried. With proper rollback a failure before first commit leaves neither initial row nor business writes durable; runtime proof is missing.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-016-V01 / VM1BD526-C009 | Restart SELECT returns+100. | CHANGED_UNRESOLVED; classified in this guide; G02,G04 |
| RULE-016-V02 / VM1BD567-C005 | No checkpoint found. | SUPPORTED_WITH_GAPS; cross-category technical example; G02 |

**Scenarios to exercise:** FRESH-ROW; EMPTY-FRESH-FILE; CRASH-BEFORE-FIRST-COMMIT; CONCURRENT-INSERT; RESTART-SELECT-ERROR.

**Counterexamples and limits:** +100 on initial SELECT is expected, but +100 on later UPDATE is a failure; Creating a row in memory is not durable restart establishment.

**Source evidence:** `IDMS Programs/VM1BD526.cbl` physical L130–140; `IDMS Programs/VM1BD526.cbl` physical L230–237; `DB2 Manual converted Programs/VMDZ1526.txt` physical L347–379; `DB2 Manual converted Programs/VMDZ1526.txt` physical L449–461; `IDMS Programs/VM1BD567.cbl` physical L121–129; additional hash-bound ranges in the case ledger.

**Question versions / production gaps:** [Q-000034](../_audit/questions/Q-000034.md), [Q-000035](../_audit/questions/Q-000035.md)

### RULE-017 — Preserve COPY interfaces and the active byte layout of overlays and arrays

**Phase 2 conditional rule and scenario revision:** Separate interface roles before applying an answer. Q-000026 assumes 310's original 1500-byte mutation output layout; it does not supply the converted member. Q-000005 explicitly retains 7200 named-field AND filler compatibility, so blanked filler remains unresolved. Corrected Q-000025 is a 20-byte parameter INPUT, not the 530-byte output. Q-000024 accepts the exact RA_BASFMAS_479BFAS spelling for test while preserving the CSV. Q-000003 covers only a successful complete service response; Q-000017's 28-digit event encoding remains scoped to four programs. Preserve overlay/occurrence aliasing and elementary packed conversion; no answer makes a whole-record byte comparison unnecessary.

**Exact scoped answer dependencies:** [Q-000003](../_audit/questions/Q-000003.md) [VM4BD302.cbl; PROVIDED]; [Q-000005](../_audit/questions/Q-000005.md) [VM7BD200.cbl; PROVIDED]; [Q-000014](../_audit/questions/Q-000014.md) [VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl, VM7BD200.cbl; PROVIDED]; [Q-000017](../_audit/questions/Q-000017.md) [VM1BD526.cbl, VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl; PROVIDED]; [Q-000019](../_audit/questions/Q-000019.md) [VM4BD310.cbl; PROVIDED]; [Q-000024](../_audit/questions/Q-000024.md) [VM7BD200.cbl; PROVIDED]; [Q-000025](../_audit/questions/Q-000025.md) [VM7BD200.cbl; PROVIDED]; [Q-000026](../_audit/questions/Q-000026.md) [VM4BD310.cbl; PROVIDED]; [Q-000037](../_audit/questions/Q-000037.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. Full answer hashes and origin are in section 7.

**Six-program source recheck:** VM1BD526.cbl = U; VM1BD567.cbl = U; VM4BD302.cbl = S; VM4BD310.cbl = U; VM4BD420.cbl = S; VM7BD200.cbl = U. The legend and complete matrix are in section 6; no synthetic answer upgrades the production disposition.

**Applies when:** External file/CALL interfaces and REDEFINES/OCCURS appear in any category. DCLGEN host groups are not automatic replacements for those interfaces.

**Source-derived migration behavior and production conditions:** Preserve offsets, lengths, active variant, code page, signs and whole-group MOVE/INITIALIZE semantics.302 retains a 32000-byte service exchange and existing service arrays.4310’s legacy output is 1500 bytes with 257 REDEFINES and two OCCURS clauses aliasing the same 15 x 8=120 bytes, not 30 elements.7200 reconstructs 432 named bytes+46 padding and a 52-byte trailer=530, but filler/binary bytes in the 478-byte raw image remain unresolved.526/567 rely on missing VMDZ205I1200-byte input.

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

**Question versions / production gaps:** [Q-000003](../_audit/questions/Q-000003.md), [Q-000005](../_audit/questions/Q-000005.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000017](../_audit/questions/Q-000017.md), [Q-000019](../_audit/questions/Q-000019.md), [Q-000024](../_audit/questions/Q-000024.md), [Q-000026](../_audit/questions/Q-000026.md), [Q-000037](../_audit/questions/Q-000037.md)

### RULE-018 — Normalize LRF child STORE into explicit relationship and default behavior

**Phase 2 conditional rule and scenario revision:** For 526, Q-000018 supplies hypothetical parent uniqueness/FK/event-PK guarantees and reserves IDMSKEY zero for new Db2 rows; Q-000017 chooses a 28-display-digit form-key layout while the CSV CHAR(20) conflict remains. Q-000009 chooses run-scoped audit time and the maximum never-updated marker as test intent. Keep parent-deleted-between, constraint/sequence failure and duplicate replay scenarios. A run timestamp can be recaptured on a restarted invocation; continuity across invocations is not established. The minimum-date convention does not add missing normalization to the actual key builder.

**Exact scoped answer dependencies:** [Q-000009](../_audit/questions/Q-000009.md) [VM1BD526.cbl, VM1BD567.cbl; PROVIDED]; [Q-000017](../_audit/questions/Q-000017.md) [VM1BD526.cbl, VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl; PROVIDED]; [Q-000018](../_audit/questions/Q-000018.md) [VM1BD526.cbl; PROVIDED]. Full answer hashes and origin are in section 7.

**Six-program source recheck:** VM1BD526.cbl = U; VM1BD567.cbl = N; VM4BD302.cbl = N; VM4BD310.cbl = N; VM4BD420.cbl = N; VM7BD200.cbl = N. The legend and complete matrix are in section 6; no synthetic answer upgrades the production disposition.

**Applies when:** 526 selects ST-VMBEVEF under circulation flag 1; supplied path obtains VMBEFF then stores VMBEVEF.

**Source-derived migration behavior and production conditions:** Copy the verified parent’s four-part key into child FK columns, generate event ID via DZEVEFSQ, populate event 0168/service 0219, form key, date, split CI, state and approved audit/default columns. Automatic/mandatory set membership and database exits require full schema/DDL evidence; the path text alone does not prove those side effects. IDMSKEY = 0 and maximum TS_UPDATE are introduced policies.

**Minimum storage:** Existing event DCLGEN/input aliases can supply values. An entire parent row is currently selected for presence but its 22 outputs are not inherently mandatory. Preserve child input across parent SQL; do not initialize away live data.

**Error and recovery contract:** Missing parent must prevent INSERT; parent deletion between lookup/insert requires FK/isolation protection. Sequence allocation may leave gaps and does not prevent duplicate business events after retry.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-018-V01 / VM1BD526-C003 | Insert route, parent lookup successful. | UNRESOLVED; classified in this guide; G04 |

**Scenarios to exercise:** PARENT-EXISTS; PARENT-MISSING; PARENT-REMOVED-BETWEEN; DUPLICATE-INPUT; SEQUENCE/CONSTRAINT-ERROR; DEFAULT-FIELDS.

**Counterexamples and limits:** A successful parent SELECT alone does not enforce relationship at INSERT; Generating a fresh surrogate on retry can create a duplicate business event.

**Source evidence:** `IDMS Programs/VM1BD526.cbl` physical L160–195; `DB2 Manual converted Programs/VMDZ1526.txt` physical L227–280; `DB2 Manual converted Programs/VMDZ1526.txt` physical L530–574; `Dclgens/DZEVEFTV.txt` physical L10–47.

**Question versions / production gaps:** [Q-000009](../_audit/questions/Q-000009.md), [Q-000017](../_audit/questions/Q-000017.md), [Q-000018](../_audit/questions/Q-000018.md)

### RULE-019 — Replace LRF current-record modification with a preserved stable identity

**Phase 2 conditional rule and scenario revision:** Q-000016 permits greatest-ID selection as an intentional 526 test policy, unlike the 310 first-0092 policy. With Q-000018's hypothetical unique event identity and Q-000035's fatal failure contract, preserve that selected ID until the UPDATE completes. A reversed legacy set-order fixture must still demonstrate that greatest ID can select another source child. Missing row after selection, stale ID after failure and concurrent deletion remain negative cases. No extra current-record token is required when the existing ID stays live.

**Exact scoped answer dependencies:** [Q-000016](../_audit/questions/Q-000016.md) [VM1BD526.cbl; PROVIDED]; [Q-000018](../_audit/questions/Q-000018.md) [VM1BD526.cbl; PROVIDED]; [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. Full answer hashes and origin are in section 7.

**Six-program source recheck:** VM1BD526.cbl = U; VM1BD567.cbl = N; VM4BD302.cbl = N; VM4BD310.cbl = N; VM4BD420.cbl = N; VM7BD200.cbl = N. The legend and complete matrix are in section 6; no synthetic answer upgrades the production disposition.

**Applies when:** 526 MO-VMBEVEF follows successful filtered LRF retrieval; normalized path FIND CURRENT VMBEVEF then MODIFY.

**Source-derived migration behavior and production conditions:** Target retains NR-ID-479EVEF from the selected row and UPDATEs that identity, changing good-key and audit fields only. Correctness first requires that the chosen row matches legacy FIRST semantics. Stable identity replaces IDMS currency; it must survive intervening assignments, and actual uniqueness must be enforced. No cursor is required for this singleton flow.

**Minimum storage:** The existing DCLGEN ID is sufficient while live; no copied current-record token is mandatory. Do not clear the group or rebuild ID from changed business values before UPDATE.

**Error and recovery contract:** No successful lookup means no valid current child. +100 or other UPDATE error must not checkpoint the record. Concurrent deletion/change and affected-row cardinality are unresolved without constraints/runtime.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-019-V01 / VM1BD526-C005 | Successful prior event selection, replacement good key prepared. | SUPPORTED_WITH_GAPS; classified in this guide; G04 |

**Scenarios to exercise:** FOUND-ONE-THEN-UPDATE; LOOKUP-100-NO-UPDATE; SELECTED-ID-RETAINED; ROW-DELETED-BETWEEN; MULTIPLE-QUALIFIERS-ORDER.

**Counterexamples and limits:** Updating by the new good-key instead of the selected ID can target another row; A stale DCLGEN ID after lookup failure is not current-record currency.

**Source evidence:** `IDMS Programs/VM1BD526.cbl` physical L214–227; `Schema/VMBTS07.txt` physical L97–102; `DB2 Manual converted Programs/VMDZ1526.txt` physical L302–313; `DB2 Manual converted Programs/VMDZ1526.txt` physical L602–622.

**Question versions / production gaps:** [Q-000016](../_audit/questions/Q-000016.md), [Q-000018](../_audit/questions/Q-000018.md), [Q-000035](../_audit/questions/Q-000035.md)

### RULE-020 — Carry an LRF parent precondition into SQL only when the selected path performs it

**Phase 2 conditional rule and scenario revision:** Q-000018 supplies the parent/FK fixture only for 526; Q-000035 assumes missing-parent failure terminates after rollback. Keep the four-key parent lookup before child INSERT and forbid fall-through on +100. This does not add a parent lookup to 7200's SWEEP-VMBFAS: its selected schema path remains a VMBFAS-only area sweep. Test duplicate/missing parent and disappearance between SELECT/INSERT; actual DDL and concurrency behavior remain unverified.

**Exact scoped answer dependencies:** [Q-000018](../_audit/questions/Q-000018.md) [VM1BD526.cbl; PROVIDED]; [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. Full answer hashes and origin are in section 7.

**Six-program source recheck:** VM1BD526.cbl = U; VM1BD567.cbl = N; VM4BD302.cbl = N; VM4BD310.cbl = N; VM4BD420.cbl = N; VM7BD200.cbl = N. The legend and complete matrix are in section 6; no synthetic answer upgrades the production disposition.

**Applies when:** 526 ST-VMBEVEF explicitly obtains the parent before STORE. Other paths may have a parent traversal, but component lists alone do not.

**Source-derived migration behavior and production conditions:** Resolve selector, OF LR key and 0326=>VMBEFF-NOT-FND from VMBTS07, then execute the corresponding four-key parent lookup before child insertion. Target parent SELECT 0 continues; every nonzero fails. Distinguish a valid parent with no children from missing parent.7200 SWEEP-VMBFAS contains only area child retrieval and must not receive an invented VMBSIAS join.

**Minimum storage:** Keep the request key and prepared child values live across the parent lookup. Existing separate DCLGEN/input groups may provide that lifetime; no extra saved-key area is automatically required.

**Error and recovery contract:** Original 526 missing parent/LR-ERROR explicitly rolls back and aborts. Target equivalent depends on missing SQLERROR. Parent duplicates, concurrent deletion and orphans need constraint evidence.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-020-V01 / VM1BD526-C002 | Insert route ST-VMBEVEF with composite stock key. | SUPPORTED_WITH_GAPS; classified in this guide; G03,G04 |

**Scenarios to exercise:** ONE-PARENT; ABSENT-PARENT; DUPLICATE-PARENT; CHILD-INPUT-SURVIVES-LOOKUP; SWEEP-WITH-NO-PARENT-JOIN.

**Counterexamples and limits:** LR components are not all mandatory joins; Returning from parent SELECT failure must never fall through to INSERT.

**Source evidence:** `IDMS Programs/VM1BD526.cbl` physical L160–195; `Schema/VMBTS07.txt` physical L182–189; `DB2 Manual converted Programs/VMDZ1526.txt` physical L463–527.

**Question versions / production gaps:** [Q-000018](../_audit/questions/Q-000018.md), [Q-000035](../_audit/questions/Q-000035.md)

### RULE-022 — Map identities first, then derive exact types from DCLGEN and use sites

**Phase 2 conditional rule and scenario revision:** Q-000017 chooses CHAR(28) event-key intent for 526/302/420/310, but preserves the original CHAR(20) CSV conflict and supplies no loader/consumer proof. Q-000002 constrains only 302's numeric stock/CI/amount fixture; Q-000004 constrains only 420's top two CI digits. Q-000014 supplies date format only to its four-program scope. Q-000037 assumes view identity/key declarations for reasoning, while actual DDL/nullability remains absent. Keep key widths, signs, scale and per-output range tests. Q-000038/Q-000039 address output recovery, not field typing. No blanket hyphen-to-underscore rewrite is validated.

**Exact scoped answer dependencies:** [Q-000002](../_audit/questions/Q-000002.md) [VM4BD302.cbl; PROVIDED]; [Q-000004](../_audit/questions/Q-000004.md) [VM4BD420.cbl; PROVIDED]; [Q-000014](../_audit/questions/Q-000014.md) [VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl, VM7BD200.cbl; PROVIDED]; [Q-000017](../_audit/questions/Q-000017.md) [VM1BD526.cbl, VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl; PROVIDED]; [Q-000026](../_audit/questions/Q-000026.md) [VM4BD310.cbl; PROVIDED]; [Q-000037](../_audit/questions/Q-000037.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]; [Q-000038](../_audit/questions/Q-000038.md) [VM4BD302.cbl; PROVIDED]; [Q-000039](../_audit/questions/Q-000039.md) [VM4BD420.cbl; PROVIDED]. Full answer hashes and origin are in section 7.

**Six-program source recheck:** VM1BD526.cbl = U; VM1BD567.cbl = U; VM4BD302.cbl = U; VM4BD310.cbl = U; VM4BD420.cbl = U; VM7BD200.cbl = U. The legend and complete matrix are in section 6; no synthetic answer upgrades the production disposition.

**Applies when:** Every mapped field or reconstructed key, including fields not represented by a seeded business case in a guide.

**Source-derived migration behavior and production conditions:** Resolve mapping row/namespace to exact SQL object/column, then DCLGEN host declaration and consuming operation. Hyphen/underscore normalization finds candidates only. Preserve table/view/member/group distinctions. Event NR_IDGOOD is mapping CHAR(20) versus DCLGEN CHAR(28) and target 28 displaydigits, replacing 20 packed/mixed bytes; never truncate to reconcile.7200 mapping RA_BASFMAS _479BFAS has an embedded space.567 unused DA_INVTR spelling drift is separate from executable key fields.

**Minimum storage:** Use exact PIC/USAGE/sign/scale, DATE X(10), TIMESTAMP X(26), and supported VARCHAR length/data structure. All supplied direct projections are NOT NULL without outer joins, so no new indicator is proved necessary here; future nullable expressions require reassessment.

**Error and recovery contract:** Check character-to-number domains, precision/range, sentinel dates and leading zeros.302 amount 13 integer digits feeds an output with 12;420 creationCI8 narrows to 6. Type compatibility cannot be inferred from spelling.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-022-V01 / VM1BD526-C006 | Insert or modification builds key from client, creation date, document ID and operation detail/general. | CONFLICT; classified in this guide; G03,G04 |
| RULE-022-V02 / VM4BD302-C006 | SW-168=1 after all child rows | CONFLICT; cross-category technical example; G01 |
| RULE-022-V03 / VM4BD310-C005 | Found event decoded for output | CONFLICT; cross-category technical example; G03 |
| RULE-022-V04 / VM4BD420-C004 | StatusC after event scan | CONFLICT; cross-category technical example; G01 |

**Scenarios to exercise:** MAPPING20/DCLGEN28; EMBEDDED-SPACE-NAME; VIEW-BASE-IDENTITY; MAX-AMOUNT; CI-LEADING-ZERO; NULLABLE-QUERY-CHANGE.

**Counterexamples and limits:** Replacing every hyphen with underscore is not a verified mapping; DCLGEN DECLARE TABLE does not prove actual view lineage, uniqueness or constraints.

**Source evidence:** `IDMS Programs/VM1BD526.cbl` physical L66–72; `IDMS Programs/VM1BD526.cbl` physical L174–180; `DB2 Manual converted Programs/VMDZ1526.txt` physical L68–73; `DB2 Manual converted Programs/VMDZ1526.txt` physical L248–254; `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical L360–360; additional hash-bound ranges in the case ledger.

**Question versions / production gaps:** [Q-000002](../_audit/questions/Q-000002.md), [Q-000004](../_audit/questions/Q-000004.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000017](../_audit/questions/Q-000017.md), [Q-000038](../_audit/questions/Q-000038.md), [Q-000039](../_audit/questions/Q-000039.md), [Q-000026](../_audit/questions/Q-000026.md), [Q-000037](../_audit/questions/Q-000037.md)

### RULE-023 — Keep only storage with a proven lifetime or interface obligation

**Phase 2 conditional rule and scenario revision:** The source-derived removable/optional classifications remain; answers narrow only the fixture conditions. Q-000020/Q-000026 allow hypothetical input/output aliases without supplying copybooks. Q-000002/Q-000014/Q-000017 constrain particular domains/date/key representations, and Q-000035 supplies assumed diagnostic lifetime on fatal failure. Reuse compatible fields only while simultaneous values remain safe. Q-000032's count-only policy supports conditional removal of unused 1200-byte restart snapshots, but cannot remove cumulative/batch roles or fix payload length by documentation. 420's duplicate D flag and 7200's per-date buffers retain the same proposals; packed conversion remains mandatory.

**Exact scoped answer dependencies:** [Q-000002](../_audit/questions/Q-000002.md) [VM4BD302.cbl; PROVIDED]; [Q-000014](../_audit/questions/Q-000014.md) [VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl, VM7BD200.cbl; PROVIDED]; [Q-000017](../_audit/questions/Q-000017.md) [VM1BD526.cbl, VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl; PROVIDED]; [Q-000020](../_audit/questions/Q-000020.md) [VM1BD526.cbl, VM1BD567.cbl; PROVIDED]; [Q-000026](../_audit/questions/Q-000026.md) [VM4BD310.cbl; PROVIDED]; [Q-000032](../_audit/questions/Q-000032.md) [VM1BD526.cbl, VM1BD567.cbl; PROVIDED]; [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. Full answer hashes and origin are in section 7.

**Six-program source recheck:** VM1BD526.cbl = V; VM1BD567.cbl = V; VM4BD302.cbl = V; VM4BD310.cbl = V; VM4BD420.cbl = V; VM7BD200.cbl = V. The legend and complete matrix are in section 6; no synthetic answer upgrades the production disposition.

**Applies when:** Every added or changed working-storage item; technical rule applies to all programs and categories.

**Source-derived migration behavior and production conditions:** Trace definitions, uses, simultaneous values and clobber points. Remove unused 526 SW-DZEVEFC1, unused date groups, and redundant 4420 SW-STATUS-D under the proven alternate guard. Reuse existing stock 12+check 1/client 1+5 aliases after copy validation; duplicate formatted dates often need no storage. Preserve independent nested EOF, cumulative/batch counts, selected child ID and run timestamp only while their semantics require simultaneous values.

**Minimum storage:** Classify each item mandatory business state, required host declaration, optional convention, removable, reused or unresolved. A role can be mandatory without an extra allocation:15-digit NB-READ can replace a duplicate small total under a validated skip redesign.7200 packed creation-date conversion must remain elementary; direct group copy is unsafe.

**Error and recovery contract:** Initialization/reuse must not erase a pending query key, last successful record needed across EOF, or original diagnostics before cleanup. Missing converted copies and SQLERRWS prevent some reuse proofs; proposals are not applied fixes.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-023-V01 / VM1BD526-C007 | All stock-key SQL and insertion client reference. | SUPPORTED_WITH_GAPS; classified in this guide; G03,G04 |
| RULE-023-V02 / VM4BD302-C007 | Only state that remains live may require additional storage | PARTIAL; cross-category technical example; G01 |
| RULE-023-V03 / VM4BD310-C008 | Sequential dates/split keys/diagnostics | PARTIALLY_PRESERVED; cross-category technical example; G03 |
| RULE-023-V04 / VM4BD420-C006 | Existing WS-STATUS already represents D | PARTIAL; cross-category technical example; G01 |
| RULE-023-V05 / VM7BD200-C008 | Eight date conversions and cutoff | PARTIALLY_PRESERVED; cross-category technical example; G03 |

**Scenarios to exercise:** NO-READS-OF-FLAG; DISJOINT-DATE-LIFETIMES; NESTED-SQL-CLOBBER; LAST-RECORD-AFTER-EOF; PACKED-MOVE; COUNT-ROLE-REUSE.

**Counterexamples and limits:** Every new DCLGEN member is not automatically a mandatory helper; Reusing one variable for simultaneously live values reduces bytes but changes behavior.

**Source evidence:** `Copybook/VMBD205I.cpy` physical L54–55; `Copybook/VMBD205I.cpy` physical L624–673; `DB2 Manual converted Programs/VMDZ1526.txt` physical L74–85; `DB2 Manual converted Programs/VMDZ1526.txt` physical L230–273; `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical L309–324; additional hash-bound ranges in the case ledger.

**Question versions / production gaps:** [Q-000002](../_audit/questions/Q-000002.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000017](../_audit/questions/Q-000017.md), [Q-000020](../_audit/questions/Q-000020.md), [Q-000026](../_audit/questions/Q-000026.md), [Q-000035](../_audit/questions/Q-000035.md)

### RULE-025 — Preserve encounter order when selection or output depends on it

**Phase 2 conditional rule and scenario revision:** Do not merge the four ordering policies. Q-000016 allows greatest-ID selection as an intentional 526 fixture change; Q-000023 requires original first-0092 semantics in 310 and leaves maximum-ID equivalence unproved. Q-000036 assumes DESC ID matches legacy encounter order in 302/420, retaining their first/last/tie reducers. Q-000008 makes archive order non-business-significant only for 7200's test, while requiring unique contiguous F-TELLER within the extract and row-set reconciliation. Test reversed order and ties separately for each policy. None supplies set ORDER/load evidence or automatically upgrades a source assessment.

**Exact scoped answer dependencies:** [Q-000008](../_audit/questions/Q-000008.md) [VM7BD200.cbl; PROVIDED]; [Q-000014](../_audit/questions/Q-000014.md) [VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl, VM7BD200.cbl; PROVIDED]; [Q-000016](../_audit/questions/Q-000016.md) [VM1BD526.cbl; PROVIDED]; [Q-000017](../_audit/questions/Q-000017.md) [VM1BD526.cbl, VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl; PROVIDED]; [Q-000018](../_audit/questions/Q-000018.md) [VM1BD526.cbl; PROVIDED]; [Q-000023](../_audit/questions/Q-000023.md) [VM4BD310.cbl; PROVIDED]; [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]; [Q-000036](../_audit/questions/Q-000036.md) [VM4BD302.cbl, VM4BD420.cbl; PROVIDED]; [Q-000037](../_audit/questions/Q-000037.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. Full answer hashes and origin are in section 7.

**Six-program source recheck:** VM1BD526.cbl = U; VM1BD567.cbl = N; VM4BD302.cbl = U; VM4BD310.cbl = U; VM4BD420.cbl = U; VM7BD200.cbl = U. The legend and complete matrix are in section 6; no synthetic answer upgrades the production disposition.

**Applies when:** 526/4310 choose FIRST qualifying event;4302/4420 reduce events in encounter order;7200 associates output sequence with traversal order.

**Source-derived migration behavior and production conditions:** Target DESC NR_ID chooses greatest surrogate where legacy FIRST follows an undefined supplied set order.526 filters 0168/0219;4310 filters 0092.4302 first 0060 and strict-greater 0092 updates depend on order/ties;4420 last 0060 wins and D can terminate early.7200 uses ascending formID instead of demonstrated area order. Prove loader/set/sequence ordering and tie behavior before claiming equivalence; a generated ID is not inherently a business timestamp.

**Minimum storage:** Keep existing reducer state such as CI/marker or C/D/S where it embodies business reduction. Additional sorting/key state is justified only by an approved deterministic-order specification.

**Error and recovery contract:** Changed order can select a different update target, CI or output ordinal with SQLCODE 0. Snapshot/concurrency and equal timestamps/IDs require explicit tests; FETCH FIRST 1 merely limits cardinality.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-025-V01 / VM1BD526-C004 | Update route for stock key, event 0168 and service 0219; parent and child cardinality vary. | UNRESOLVED; classified in this guide; G03,G04 |
| RULE-025-V02 / VM4BD302-C005 | Every traversed event, independently of SW-168 | PARTIAL; cross-category technical example; G01 |
| RULE-025-V03 / VM4BD310-C003 | Two or more event 0092 children possible | UNRESOLVED; cross-category technical example; G03 |
| RULE-025-V04 / VM7BD200-C006 | Multiple eligible forms | UNRESOLVED; cross-category technical example; G03 |

**Scenarios to exercise:** TWO-QUALIFYING-EVENTS; EQUAL-TRANSFER-DATES; REPEATED-CREATION; D-AT-DIFFERENT-POSITION; REVERSED-LOAD-ORDER; ARCHIVE-SEQUENCE.

**Counterexamples and limits:** Greatest surrogate does not prove legacy first; Absence of ORDER BY does not establish a stable order; Adding ORDER BY date can change a last-encounter rule.

**Source evidence:** `IDMS Programs/VM1BD526.cbl` physical L197–212; `Schema/VMBTS07.txt` physical L124–136; `DB2 Manual converted Programs/VMDZ1526.txt` physical L575–601; `IDMS Programs/VM4BD302.cbl` physical L300–315; `DB2 Manual converted Programs/VMDZ4302.txt` physical L244–244; additional hash-bound ranges in the case ledger.

**Question versions / production gaps:** [Q-000008](../_audit/questions/Q-000008.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000016](../_audit/questions/Q-000016.md), [Q-000017](../_audit/questions/Q-000017.md), [Q-000018](../_audit/questions/Q-000018.md), [Q-000023](../_audit/questions/Q-000023.md), [Q-000035](../_audit/questions/Q-000035.md), [Q-000036](../_audit/questions/Q-000036.md), [Q-000037](../_audit/questions/Q-000037.md)

### RULE-026 — Ordinal file restart requires the identical durable input prefix

**Phase 2 conditional rule and scenario revision:** Q-000030 assumes immutable byte-identical input for both updaters, so ordinal skip can be reasoned about only under that condition. Q-000029 keeps happy paths in range and demands boundary failures. For 567, Q-000033 requires fail-closed behavior when saved N exceeds available records; the source still lacks the guard, so the negative scenario fails the intended contract by static inspection. Q-000020 is only a hypothetical 1200-byte layout. For 526 retain the post-positioning EOF initialization concern. Neither program detects changed generation merely because the test input is immutable.

**Exact scoped answer dependencies:** [Q-000020](../_audit/questions/Q-000020.md) [VM1BD526.cbl, VM1BD567.cbl; PROVIDED]; [Q-000029](../_audit/questions/Q-000029.md) [VM1BD526.cbl, VM1BD567.cbl; PROVIDED]; [Q-000030](../_audit/questions/Q-000030.md) [VM1BD526.cbl, VM1BD567.cbl; PROVIDED]; [Q-000033](../_audit/questions/Q-000033.md) [VM1BD567.cbl; PROVIDED]. Full answer hashes and origin are in section 7.

**Six-program source recheck:** VM1BD526.cbl = U; VM1BD567.cbl = U; VM4BD302.cbl = N; VM4BD310.cbl = N; VM4BD420.cbl = N; VM7BD200.cbl = N. The legend and complete matrix are in section 6; no synthetic answer upgrades the production disposition.

**Applies when:** 526/567 restore a physical record count and skip that many sequential records; no saved-key query or file-generation comparison exists.

**Source-derived migration behavior and production conditions:** On valid incomplete checkpointN, discard exactlyN records, reset batch count, then processN+1. Require immutable file generation, byte content and ordering.526 calls STOP01/USERABEN on short skip but initializes its EOF flag after positioning, an ordering issue.567 repeats N reads without EOF guard and unconditionally prefetches again, creating read-after-EOF/false-completion risk. Equal business keys do not make positions interchangeable.

**Minimum storage:** Need count, input EOF and batch state with correct lifetimes, not necessarily a 1200-byte snapshot. If NB-READ also serves as cumulative total, skip reads must not mutate the fixed skip bound. Initialize EOF before the first skip read.

**Error and recovery contract:** Count beyond available input, malformed payload or changed generation must fail before business/checkpoint/completion writes. Missing file-status and abort contracts leave observed short-input outcome unresolved.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-026-V01 / VM1BD526-C010 | Existing incomplete checkpoint. | UNRESOLVED; classified in this guide; G02,G04 |
| RULE-026-V02 / VM1BD567-C006 | Checkpoint incomplete; skip countN may exceed available file. | LIKELY_DEFECT; cross-category technical example; G02 |

**Scenarios to exercise:** N0; N=FILE-LENGTH; N>FILE-LENGTH; REORDERED-FILE; DUPLICATE-KEY-RECORDS; SECOND-RESTART; EOF-BEFORE-INITIALIZATION.

**Counterexamples and limits:** CountN is not a business-key high-water mark; Persisting but never comparing KY-RESTART does not verify input identity.

**Source evidence:** `IDMS Programs/VM1BD526.cbl` physical L126–145; `DB2 Manual converted Programs/VMDZ1526.txt` physical L198–213; `DB2 Manual converted Programs/VMDZ1526.txt` physical L337–345; `IDMS Programs/VM1BD567.cbl` physical L117–134; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L178–184; additional hash-bound ranges in the case ledger.

**Question versions / production gaps:** [Q-000020](../_audit/questions/Q-000020.md), [Q-000029](../_audit/questions/Q-000029.md), [Q-000030](../_audit/questions/Q-000030.md), [Q-000033](../_audit/questions/Q-000033.md)

### RULE-029 — Serialized payload length defines what is actually persisted

**Phase 2 conditional rule and scenario revision:** Q-000032 chooses a count-only 15-byte protocol with immutable input for both test updaters. This makes never-read 1200-byte snapshot helpers candidates for conditional removal after include/consumer checks. It does not change the source: initial INSERT still supplies 1215 and subsequent UPDATE 15, so serialization remains inconsistent with the chosen canonical protocol. Keep short/nondigit payload, restored-range and EOF cases. Any full-record protocol is outside this test choice and would require both persistence and actual record comparison.

**Exact scoped answer dependencies:** [Q-000032](../_audit/questions/Q-000032.md) [VM1BD526.cbl, VM1BD567.cbl; PROVIDED]. Full answer hashes and origin are in section 7.

**Six-program source recheck:** VM1BD526.cbl = U; VM1BD567.cbl = U; VM4BD302.cbl = N; VM4BD310.cbl = N; VM4BD420.cbl = N; VM7BD200.cbl = N. The legend and complete matrix are in section 6; no synthetic answer upgrades the production disposition.

**Applies when:** 526/567 use TE_CH_RS_DATA VARCHAR(4000) with a 15-digit count plus 1200-byte record group.

**Source-derived migration behavior and production conditions:** Initial INSERT sets length 1215; periodic/final UPDATE sets length 15 while moving the whole 1215-byte group to text. Under that declared host, only count bytes are supplied by UPDATE. KY-RESTART is never compared or used for positioning. Decide explicitly between count-only protocol and an approved full-record protocol, then align length, schema/version checks and consumers. Do not call the mismatch resolved without that decision.

**Minimum storage:** Count-only can remove KY-RESTART and WS-INPUT-KASBONS after dependency validation; full-record policy needs a valid last successful record across EOF.567 preserves its snapshot on failed READ;526 copies after every READ, including EOF.

**Error and recovery contract:** Before restore, validate length>=15 and numeric/range prefix; if record validation is required, require the full payload and use it. Capacity 4000 and NOT NULL do not validate serialization.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-029-V01 / VM1BD526-C012 | Initial versus periodic/final checkpoint serialization. | OBSERVED_INCONSISTENCY; classified in this guide; G02,G04 |
| RULE-029-V02 / VM1BD567-C008 | Initial, periodic or final checkpoint. | OBSERVED_INCONSISTENCY; cross-category technical example; G02 |

**Scenarios to exercise:** INITIAL1215; UPDATE15; SHORT/NONNUMERIC-PAYLOAD; EOF-LAST-RECORD; COUNT-ONLY-REMOVAL; FULL-RECORD-VALIDATION.

**Counterexamples and limits:** MOVE1215 bytes to the text area does not override VARCHAR length 15; A never-read snapshot cannot supply restart identity assurance.

**Source evidence:** `IDMS Programs/VM1BD526.cbl` physical L230–237; `DB2 Manual converted Programs/VMDZ1526.txt` physical L60–63; `DB2 Manual converted Programs/VMDZ1526.txt` physical L347–368; `Dclgens/DZ01RSTV.txt` physical L16–31; `IDMS Programs/VM1BD567.cbl` physical L138–141; additional hash-bound ranges in the case ledger.

**Question versions / production gaps:** [Q-000032](../_audit/questions/Q-000032.md)

### RULE-030 — Preserve audit timestamp lifetime and introduced sentinel meanings

**Phase 2 conditional rule and scenario revision:** Q-000009 chooses run-scoped audit time and the maximum never-updated marker as test intent. The source captures CURRENT-DATE during initialization, so rows in one invocation share that value; a restarted invocation can recapture another value. Do not infer continuous timestamp identity across restarts. Preserve the passed business date separately from clock time. A reusable live timestamp role may be necessary, while the exact formatting block and separate maximum literal storage remain optional implementation choices. Trigger/audit-consumer semantics remain unprovided.

**Exact scoped answer dependencies:** [Q-000009](../_audit/questions/Q-000009.md) [VM1BD526.cbl, VM1BD567.cbl; PROVIDED]. Full answer hashes and origin are in section 7.

**Six-program source recheck:** VM1BD526.cbl = U; VM1BD567.cbl = U; VM4BD302.cbl = N; VM4BD310.cbl = N; VM4BD420.cbl = N; VM7BD200.cbl = N. The legend and complete matrix are in section 6; no synthetic answer upgrades the production disposition.

**Applies when:** 526/567 targets introduce audit columns in business writes.

**Source-derived migration behavior and production conditions:** Both capture CURRENT-DATE once and reuse a run timestamp, rather than taking per-row time.526 INSERT supplies that creation timestamp, maximum 9999-12-31-23.59.59.999999 update timestamp, programID and NS_IDMSKEY = 0; later UPDATE replaces update timestamp.567 adds run timestamp/programID to accounting-date UPDATE. Approve each default and trigger interaction; clock time is distinct from passed business date.

**Minimum storage:** Run-start semantics need a timestamp value that survives row initialization; exact 42-byte formatting area and a separate maximum literal variable are optional. Reusing an unused DCLGEN timestamp requires protecting it from INITIALIZE.

**Error and recovery contract:** Replay may preserve business date but change audit time/trigger effects, so date assignment is not automatically fully idempotent. Invalid timestamp/constraint errors must prevent checkpoint commitment.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-030-V01 / VM1BD526-C016 | New event or update to selected event. | CHANGED_UNRESOLVED; classified in this guide; G04 |
| RULE-030-V02 / VM1BD567-C003 | Each form update. | CHANGED_UNRESOLVED; cross-category technical example; G02 |

**Scenarios to exercise:** TWO-ROWS-SAME-RUN-TIME; RESTART-NEW-RUN-TIME; MAXIMUM-INSERT-MARKER; BUSINESS-DATE-DIFFERS-CLOCK; INITIALIZE-PRESERVES-AUDIT.

**Counterexamples and limits:** Changing to CURRENT TIMESTAMP per row alters observed policy; An audit column is not harmless decoration when downstream consumers interpret it.

**Source evidence:** `DB2 Manual converted Programs/VMDZ1526.txt` physical L185–188; `DB2 Manual converted Programs/VMDZ1526.txt` physical L274–279; `DB2 Manual converted Programs/VMDZ1526.txt` physical L309–312; `DB2 Manual converted Programs/VMDZ1526.txt` physical L382–393; `IDMS Programs/VM1BD567.cbl` physical L156–158; additional hash-bound ranges in the case ledger.

**Question versions / production gaps:** [Q-000009](../_audit/questions/Q-000009.md)

### RULE-031 — Classify removal of runtime services separately from business records

**Phase 2 conditional rule and scenario revision:** Q-000035 supplies a hypothetical fatal SQLERROR/USERABEN contract, but no routine body or generated include. Q-000012 remains DEFERRED for actual build, attachment, compiler/precompile/bind and generated-member context. Therefore retain all dependency gaps and do not assert successful IDMS-service replacement, precompile or runtime cleanup. A selected read-only LR path stays read-only, while missing called routines remain unknown rather than silently side-effect-free.

**Exact scoped answer dependencies:** [Q-000012](../_audit/questions/Q-000012.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; DEFERRED]; [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. Full answer hashes and origin are in section 7.

**Six-program source recheck:** VM1BD526.cbl = U; VM1BD567.cbl = U; VM4BD302.cbl = U; VM4BD310.cbl = U; VM4BD420.cbl = U; VM7BD200.cbl = U. The legend and complete matrix are in section 6; no synthetic answer upgrades the production disposition.

**Applies when:** Every program removes or changes generated BIND/READY/FINISH/IDMS-STATUS services and introduces SQL includes or runtime attachment.

**Source-derived migration behavior and production conditions:** Inventory direct verbs plus generated/called effects. Read-only 4310/7200 normal paths do not prove all hidden calls read-only; schemas contain unused writes that are not executed. Resolve SQLCA, SQLERRWS, SQLERROR, USERABEN, generated IDMS members, JCL attachment, compiler/precompile/bind and site standards. A missing delivered dependency is an assurance gap, not proof that an installed program cannot compile.

**Minimum storage:** Use the actual supported SQL interface and avoid duplicate SQLCODE declarations. Missing include fields cannot be counted as invented helpers. External COPY names retain their independent contract.

**Error and recovery contract:** READY removal does not itself establish Db 2 connection/transaction context; FINISH cannot be globally replaced by COMMIT without inspecting unit-of-work and output effects. Generated auto-status policies may differ from WHEN OTHER.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-031-V01 / VM4BD310-C001 | Open batch and close after input EOF | UNRESOLVED; cross-category technical example; G03 |
| RULE-031-V02 / VM7BD200-C001 | Start archive extract | UNRESOLVED; cross-category technical example; G03 |

**Scenarios to exercise:** RESOLVED-INCLUDE-CLOSURE; ATTACHMENT/COMMIT-CONTEXT; USERABEN-NONRETURN; CALL-HIDDEN-SIDE-EFFECT; ACTUAL-PRECOMPILE.

**Counterexamples and limits:** An unused LRF ERASE definition is not a program write; Missing source in the sample does not prove absent production runtime.

**Source evidence:** `IDMS Programs/VM4BD310.cbl` physical L137–163; `DB2 Manual converted Programs/VMDZ4310.txt` physical L185–205; `IDMS Programs/VM7BD200.cbl` physical L174–179; `IDMS Programs/VM7BD200.cbl` physical L210–222; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L429–440; additional hash-bound ranges in the case ledger.

**Question versions / production gaps:** [Q-000035](../_audit/questions/Q-000035.md)

### RULE-033 — Own SQL status immediately and preserve first-failure diagnostics through cleanup

**Phase 2 conditional rule and scenario revision:** Q-000035 defines designated unexpected SQL results as fatal after original diagnostics are preserved and uncommitted Db2 work is rolled back; expected +100 still follows each caller's branch. This answers test intent only. The delivered main still lacks SQLWARN/SQLSTATE/affected-row checks and named retry logic, and the real handler may issue cleanup SQL or return until its body is supplied. Exercise expected FETCH EOF, absent initial checkpoint, missing required parent/event/UPDATE, warning with SQLCODE0, cleanup overwrite and ambiguous commit separately. Q-000003 does not resolve failed service-call status merely by providing a successful service fixture.

**Exact scoped answer dependencies:** [Q-000003](../_audit/questions/Q-000003.md) [VM4BD302.cbl; PROVIDED]; [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. Full answer hashes and origin are in section 7.

**Six-program source recheck:** VM1BD526.cbl = U; VM1BD567.cbl = U; VM4BD302.cbl = U; VM4BD310.cbl = U; VM4BD420.cbl = U; VM7BD200.cbl = U. The legend and complete matrix are in section 6; no synthetic answer upgrades the production disposition.

**Applies when:** Every SQL statement and surrounding business/error branch, across all categories.

**Source-derived migration behavior and production conditions:** Record operation, SQLCODE, SQLSTATE/SQLWARN where relevant, row validity, expected no-row meaning, cardinality and next action. Observed targets use 0/100/OTHER, no named negative-code branches, no SQLWARN/SQLSTATE/affected-row checks. +100 means expected end for FETCH and absent restart row; missing required parent/event/business UPDATE/checkpoint UPDATE is rejected. SQLCODE 0 may still carry warnings or a multirow searched UPDATE. Do not invent implemented retry logic.

**Minimum storage:** Immediate tests need no automatic saved-code helper. If SQLERROR executes rollback/logging/cleanup SQL before reporting the first failure, preserve original diagnostics in compatible existing/new storage only to that required lifetime. SQL-LOCATION must identify each operation, not a stale prior UPDATE.

**Error and recovery contract:** Verify SQLERROR/USERABEN termination and rollback; otherwise code can continue with invalid data, infinite cursor loop or false checkpoint. Distinguish constraint, duplicate, conversion/null, deadlock/timeout, authorization and ambiguous-commit scenarios when testing actual runtime; exact code/version policy is unprovided.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-033-V01 / VM1BD526-C014 | Any of 8 executable SQL statements, LR status failure, or completed/short-file call. | UNRESOLVED; classified in this guide; G01,G02,G03,G04 |
| RULE-033-V02 / VM1BD567-C011 | Restart SELECT, INSERT, UPDATE, COMMIT or form UPDATE. | UNRESOLVED; cross-category technical example; G01,G02 |
| RULE-033-V03 / VM4BD302-C008 | Each SELECT/OPEN/FETCH/CLOSE | PARTIAL; cross-category technical example; G01 |
| RULE-033-V04 / VM4BD420-C005 | Every Db 2 cursor operation including earlyDclose | PARTIAL; cross-category technical example; G01 |

**Scenarios to exercise:** SQL0-WITH-WARNING; FETCH 100; SELECT100-BY-CONTEXT; UPDATE100; MULTIROW-UPDATE 0; NEGATIVE-SQL-FAIL; CLEANUP-OVERWRITES-SQLCODE; RETURNING-HANDLER; UNKNOWN-COMMIT.

**Counterexamples and limits:** One global IF SQLCODE NOT=0 abort rule breaks expected EOF/restart absence; Calling SQLERROR does not prove rollback or nonreturn; CLOSE/ROLLBACK diagnostics can overwrite the original failure.

**Source evidence:** `IDMS Programs/VM1BD526.cbl` physical L193–195; `IDMS Programs/VM1BD526.cbl` physical L206–227; `IDMS Programs/VM1BD526.cbl` physical L247–254; `DB2 Manual converted Programs/VMDZ1526.txt` physical L331–335; `DB2 Manual converted Programs/VMDZ1526.txt` physical L373–379; additional hash-bound ranges in the case ledger.

**Question versions / production gaps:** [Q-000003](../_audit/questions/Q-000003.md), [Q-000035](../_audit/questions/Q-000035.md)

## 5. Case-by-case migration crosswalk

This section retains every case classified in this category. The prose records what the supplied converter did and where equivalence remains conditional. Evidence hashes and additional ranges are in the linked ledgers; each report contains its complete declaration, field and operation inventories.

### VM1BD526-C001 — Circulation-status route

**Phase 2 rehearsal assessment (CONDITIONALLY_SUPPORTED_UNEXECUTED):** The exact circulation test remains flag 1 → INSERT and every other value → UPDATE. Q-000020 permits reasoning with the legacy-compatible 1200-byte input layout for this fixture; it does not supply VMDZ205I or validate the compiled input offset. No routing policy changed.

**Revised scenario conditions / expected checks:**

- Use circulation 1, 0, blank and another code; require precisely the same branch.
- Repeat with the real converted copybook once supplied.

**Production finding retained:** Actual VMDZ205I, compiler layout and business input domain remain unverified.

**Applied answer versions:** [Q-000020](../_audit/questions/Q-000020.md) [VM1BD526.cbl, VM1BD567.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM1BD526.cbl](../programs/VM1BD526.cbl__migration.md) · **Rule/variant:** RULE-008, RULE-008-V01 · **Source assessment:** `SUPPORTED`.

**Condition:** One successfully read input record; CO-STCIRC-OORD equals 1 or any other value.

**Original behavior:** The exact condition CO-STCIRC-OORD = 1 invokes 210-STORE-EFF; every other value invokes 220-MOD-EVEF.

**Delivered Db2 behavior:** The same equality routes to 210-INSERT-EVFF or 220-UPD-EVEF; there is no new validation for blank/unknown values.

**Evidence:** `IDMS Programs/VM1BD526.cbl` physical L148–158; `DB2 Manual converted Programs/VMDZ1526.txt` physical L215–225; `Copybook/VMBD205I.cpy` physical L1313–1317.

**Question versions / production gaps:** [Q-000020](../_audit/questions/Q-000020.md)

### VM1BD526-C002 — LR store parent precondition

**Phase 2 rehearsal assessment (CONDITIONALLY_SUPPORTED_UNEXECUTED):** Under Q-000018, one parent exists per four-part key and the child FK is enforced. Under Q-000035, parent +100 and every designated unexpected SQL outcome terminate after rollback. The source parent SELECT before INSERT fits that fixture; concurrent parent disappearance still needs a real FK/isolation test.

**Revised scenario conditions / expected checks:**

- No parent: no INSERT or checkpoint advancement.
- Exactly one parent: one child inserted.
- Concurrent parent deletion: designated failure preserves prior committed checkpoint.

**Production finding retained:** No actual parent/event DDL or SQLERROR implementation has been supplied.

**Applied answer versions:** [Q-000018](../_audit/questions/Q-000018.md) [VM1BD526.cbl; PROVIDED]; [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM1BD526.cbl](../programs/VM1BD526.cbl__migration.md) · **Rule/variant:** RULE-020, RULE-020-V01 · **Source assessment:** `SUPPORTED_WITH_GAPS`.

**Condition:** Insert route ST-VMBEVEF with composite stock key.

**Original behavior:** VMBTS07 selects ST-VMBEVEF: OBTAIN FIRST VMBEFF by KY-EFFECT OF LR; 0326 returns VMBEFF-NOT-FND; on success STORE VMBEVEF. No VMBWCEF STORE occurs on this selector.

**Delivered Db2 behavior:** A four-key singleton SELECT of DZBEFFTV must yield SQLCODE 0 before 260-INSERT-EVEF is performed; all other codes call SQLERROR.

**Evidence:** `IDMS Programs/VM1BD526.cbl` physical L160–195; `Schema/VMBTS07.txt` physical L182–189; `DB2 Manual converted Programs/VMDZ1526.txt` physical L463–527.

**Question versions / production gaps:** [Q-000018](../_audit/questions/Q-000018.md), [Q-000035](../_audit/questions/Q-000035.md)

### VM1BD526-C003 — Event insertion defaults and relationship

**Phase 2 rehearsal assessment (CONDITIONALLY_SUPPORTED_UNEXECUTED):** Q-000009 defines one invocation timestamp and the maximum timestamp as the test never-updated marker; Q-000018 permits generated event identity, parent FK and NS_IDMSKEY zero for new rows; Q-000017 chooses 28 display digits. The listed INSERT assignments match these normal fixture choices. A generated ID still does not make replay of a business INSERT idempotent.

**Revised scenario conditions / expected checks:**

- Insert under one valid parent, inspect every business/audit/relationship value.
- Retry an uncommitted batch under rollback; contrast a wrongly replayed durable batch.

**Production finding retained:** Actual default/sequence/constraint behavior, loader and consumer compatibility are unresolved.

**Applied answer versions:** [Q-000009](../_audit/questions/Q-000009.md) [VM1BD526.cbl, VM1BD567.cbl; PROVIDED]; [Q-000017](../_audit/questions/Q-000017.md) [VM1BD526.cbl, VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl; PROVIDED]; [Q-000018](../_audit/questions/Q-000018.md) [VM1BD526.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM1BD526.cbl](../programs/VM1BD526.cbl__migration.md) · **Rule/variant:** RULE-018, RULE-018-V01 · **Source assessment:** `UNRESOLVED`.

**Condition:** Insert route, parent lookup successful.

**Original behavior:** VMBEVEF initialized with spaces, creation date set to run date, event/service 0168/0219, packed good key and six-character client reference; path stores child under current parent.

**Delivered Db2 behavior:** INSERT includes explicit parent foreign-key fields, a DZEVEFSQ-derived 20-digit ID, run date, same event/service, 28-character good key, split client reference, blank state, job timestamp, maximum update timestamp, program ID and zero NS_IDMSKEY.

**Evidence:** `IDMS Programs/VM1BD526.cbl` physical L160–195; `DB2 Manual converted Programs/VMDZ1526.txt` physical L227–280; `DB2 Manual converted Programs/VMDZ1526.txt` physical L530–574; `Dclgens/DZEVEFTV.txt` physical L10–47.

**Question versions / production gaps:** [Q-000009](../_audit/questions/Q-000009.md), [Q-000017](../_audit/questions/Q-000017.md), [Q-000018](../_audit/questions/Q-000018.md)

### VM1BD526-C004 — First matching event and custom statuses

**Phase 2 rehearsal assessment (INTENTIONAL_TEST_VARIANT_UNEXECUTED):** Q-000016 deliberately chooses the greatest generated event ID for this test. The target DESC/FETCH FIRST query implements that fixture choice. If legacy set-first is ID 10 while the greatest ID is 20, the two programs choose different events; that is retained as an intentional test variant, not strict equivalence. Q-000018 excludes orphans only within the hypothetical FK fixture; Q-000035 makes no-result terminal.

**Revised scenario conditions / expected checks:**

- Use two qualifying events with opposite legacy encounter and generated-ID order.
- Test no parent, empty set and all children filtered; no stale selected ID may be updated.

**Production finding retained:** Legacy set-order definition and actual constraints/error diagnostics remain missing; production selection policy stays OPEN.

**Applied answer versions:** [Q-000016](../_audit/questions/Q-000016.md) [VM1BD526.cbl; PROVIDED]; [Q-000018](../_audit/questions/Q-000018.md) [VM1BD526.cbl; PROVIDED]; [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM1BD526.cbl](../programs/VM1BD526.cbl__migration.md) · **Rule/variant:** RULE-025, RULE-025-V01 · **Source assessment:** `UNRESOLVED`.

**Condition:** Update route for stock key, event 0168 and service 0219; parent and child cardinality vary.

**Original behavior:** OBTAIN FIRST on ALL-VMBEVEF-BY-VMBEFF first retrieves parent, returns VMBEFF-NOT-FND on 0326, NO-VMBEVEF-FND for empty set and NO-MORE-VMBEVEF on 0307; program rejects every result other than LR-FOUND.

**Delivered Db2 behavior:** Direct child SELECT filters six columns, ORDER BY NR_ID DESC FETCH FIRST 1. +100 displays ROW NOT FOUND then SQLERROR; no independent parent test remains.

**Evidence:** `IDMS Programs/VM1BD526.cbl` physical L197–212; `Schema/VMBTS07.txt` physical L124–136; `DB2 Manual converted Programs/VMDZ1526.txt` physical L575–601.

**Question versions / production gaps:** [Q-000016](../_audit/questions/Q-000016.md), [Q-000018](../_audit/questions/Q-000018.md), [Q-000035](../_audit/questions/Q-000035.md)

### VM1BD526-C005 — Modify current selected event

**Phase 2 rehearsal assessment (CONDITIONALLY_SUPPORTED_UNEXECUTED):** The selected NR_ID is a stable update key under Q-000018 surrogate uniqueness, and Q-000016 defines which event is intended in this test. Only good-key/audit fields change. If another transaction removes that event before UPDATE, +100 must take Q-000035 fatal rollback, not permit the checkpoint to advance.

**Revised scenario conditions / expected checks:**

- Read chosen ID, update only that row.
- Delete the chosen event between SELECT and UPDATE; require terminal no-row handling.

**Production finding retained:** No real uniqueness, concurrency or error-routine execution proves the implementation contract.

**Applied answer versions:** [Q-000016](../_audit/questions/Q-000016.md) [VM1BD526.cbl; PROVIDED]; [Q-000018](../_audit/questions/Q-000018.md) [VM1BD526.cbl; PROVIDED]; [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM1BD526.cbl](../programs/VM1BD526.cbl__migration.md) · **Rule/variant:** RULE-019, RULE-019-V01 · **Source assessment:** `SUPPORTED_WITH_GAPS`.

**Condition:** Successful prior event selection, replacement good key prepared.

**Original behavior:** MO-VMBEVEF path performs FIND CURRENT VMBEVEF then MODIFY; program requires LR-FOUND.

**Delivered Db2 behavior:** UPDATE by selected NR_ID changes only NR_IDGOOD plus audit timestamp/user; SQLCODE 0 increments statement count; all other codes call SQLERROR.

**Evidence:** `IDMS Programs/VM1BD526.cbl` physical L214–227; `Schema/VMBTS07.txt` physical L97–102; `DB2 Manual converted Programs/VMDZ1526.txt` physical L302–313; `DB2 Manual converted Programs/VMDZ1526.txt` physical L602–622.

**Question versions / production gaps:** [Q-000016](../_audit/questions/Q-000016.md), [Q-000018](../_audit/questions/Q-000018.md), [Q-000035](../_audit/questions/Q-000035.md)

### VM1BD526-C006 — Composite event key serialization

**Phase 2 rehearsal assessment (CONFLICT_RETAINED_TEST_ENCODING_DEFINED):** Q-000017 defines 8+8+6+3+3 display digits and nonnegative components. The target group and CHAR(28) DCLGEN agree with that fixture, while the CSV CHAR(20) conflict and legacy packed representation remain unchanged. The target copies the creation-date component directly; this answer does not demonstrate a zero-date-to-minimum-date conversion in VMDZ1526.

**Revised scenario conditions / expected checks:**

- Use leading-zero client/document/operation components and a valid eight-digit creation date.
- Compare an original packed20-byte key with the intended28-digit value through a real loader/consumer fixture.
- Keep zero-date input as an unresolved policy/representation case until its exact convention is supplied.

**Production finding retained:** The actual loader/consumer specification and the zero-date scope of the convention remain absent.

**Applied answer versions:** [Q-000017](../_audit/questions/Q-000017.md) [VM1BD526.cbl, VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM1BD526.cbl](../programs/VM1BD526.cbl__migration.md) · **Rule/variant:** RULE-022, RULE-022-V01 · **Source assessment:** `CONFLICT`.

**Condition:** Insert or modification builds key from client, creation date, document ID and operation detail/general.

**Original behavior:** Packed widths 8,8,6,3,3 plus two filler bytes form a 20-byte record copied into NR-ID-GOOD.

**Delivered Db2 behavior:** Display widths 8,8,6,3,3 form 28 characters copied into DCLGEN CHAR28; mapping still says CHAR20.

**Evidence:** `IDMS Programs/VM1BD526.cbl` physical L66–72; `IDMS Programs/VM1BD526.cbl` physical L174–180; `DB2 Manual converted Programs/VMDZ1526.txt` physical L68–73; `DB2 Manual converted Programs/VMDZ1526.txt` physical L248–254; `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical L360–360; `Dclgens/DZEVEFTV.txt` physical L19–40.

**Question versions / production gaps:** [Q-000017](../_audit/questions/Q-000017.md)

### VM1BD526-C007 — Stock and client identifier splitting

**Phase 2 rehearsal assessment (TEST_LAYOUT_SUPPORTS_REUSE_PROPOSAL):** With Q-000020 legacy-compatible aliases, stock12+1, client1+5 and the elementary numeric sequence can be obtained from existing input fields. The extra split/sequence staging buffers become concrete removal candidates for this fixture, subject to qualified-name/type/lifetime checks. No edited or compiled COBOL was produced.

**Revised scenario conditions / expected checks:**

- Trace stock leading zeros/check digit9, client leading zeros and sequence00/99 through direct aliases.
- Verify original source remains byte-identical.

**Production finding retained:** The real converted copybook and a compile/runtime check of any eventual refactor are still required.

**Applied answer versions:** [Q-000020](../_audit/questions/Q-000020.md) [VM1BD526.cbl, VM1BD567.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM1BD526.cbl](../programs/VM1BD526.cbl__migration.md) · **Rule/variant:** RULE-023, RULE-023-V01 · **Source assessment:** `SUPPORTED_WITH_GAPS`.

**Condition:** All stock-key SQL and insertion client reference.

**Original behavior:** 13-digit stock number copied to composite IDMS group; two-digit sequence group; six-character client group retained.

**Delivered Db2 behavior:** New 13-byte and 6-byte overlay helpers split stock 12+1/client 1+5; sequence staged in PIC99 then packed SQL host.

**Evidence:** `Copybook/VMBD205I.cpy` physical L54–55; `Copybook/VMBD205I.cpy` physical L624–673; `DB2 Manual converted Programs/VMDZ1526.txt` physical L74–85; `DB2 Manual converted Programs/VMDZ1526.txt` physical L230–273; `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical L309–324.

**Question versions / production gaps:** [Q-000020](../_audit/questions/Q-000020.md)

### VM1BD526-C009 — Fresh checkpoint initialization

**Phase 2 rehearsal assessment (TIMING_SUPPORTED_PAYLOAD_INCONSISTENCY_RETAINED):** The initial restart INSERT is uncommitted until the first business/checkpoint COMMIT. Q-000034 and Q-000035 make rollback of that fresh row a fixture expectation. Q-000032, assessed in C012, separately exposes its1215-byte initialization as inconsistent with the selected15-byte protocol; timing support does not approve that encoding.

**Revised scenario conditions / expected checks:**

- Fail after initial INSERT and before first business action: no new durable checkpoint expected.
- Empty input: final zero-count completion considered separately under C013.

**Production finding retained:** Actual transaction attachment, runtime rollback and payload correction are unproved.

**Applied answer versions:** [Q-000034](../_audit/questions/Q-000034.md) [VM1BD526.cbl, VM1BD567.cbl; PROVIDED]; [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM1BD526.cbl](../programs/VM1BD526.cbl__migration.md) · **Rule/variant:** RULE-016, RULE-016-V01 · **Source assessment:** `CHANGED_UNRESOLVED`.

**Condition:** Restart SELECT returns+100.

**Original behavior:** Initializes legacy row fields and 15-day retention; row first STORED after the first 100-record batch or at EOF.

**Delivered Db2 behavior:** INSERTS incomplete row immediately with retention 15, zero 15-digit count and 1215-byte payload; first commit remains a business-batch/final boundary.

**Evidence:** `IDMS Programs/VM1BD526.cbl` physical L130–140; `IDMS Programs/VM1BD526.cbl` physical L230–237; `DB2 Manual converted Programs/VMDZ1526.txt` physical L347–379; `DB2 Manual converted Programs/VMDZ1526.txt` physical L449–461.

**Question versions / production gaps:** [Q-000034](../_audit/questions/Q-000034.md), [Q-000035](../_audit/questions/Q-000035.md)

### VM1BD526-C010 — Count-based resume and skip validation

**Phase 2 rehearsal assessment (PARTIAL_RESUME_FIXTURE_WITH_SOURCE_GAPS):** Q-000030 supplies immutable ordered input for the positive fixture, Q-000029 confines normal counts to0–99999, and Q-000020 supplies a hypothetical compatible layout. Discarding N physical records then reading N+1 is the intended resume. The source still sets NOT-EOF only after restart positioning; its earlier EOF-state lifetime is not repaired by these assumptions.

**Revised scenario conditions / expected checks:**

- Resume at0,1,99,100 with the same input.
- Use a shorter input: existing STOP01 must terminate under the handler contract.
- Insert a record before the saved prefix: expose skipped/replayed work because code does not verify file identity.

**Production finding retained:** Actual input identity enforcement, deterministic EOF initialization, converted layout and file-runtime behavior remain open.

**Applied answer versions:** [Q-000020](../_audit/questions/Q-000020.md) [VM1BD526.cbl, VM1BD567.cbl; PROVIDED]; [Q-000029](../_audit/questions/Q-000029.md) [VM1BD526.cbl, VM1BD567.cbl; PROVIDED]; [Q-000030](../_audit/questions/Q-000030.md) [VM1BD526.cbl, VM1BD567.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM1BD526.cbl](../programs/VM1BD526.cbl__migration.md) · **Rule/variant:** RULE-026, RULE-026-V01 · **Source assessment:** `UNRESOLVED`.

**Condition:** Existing incomplete checkpoint.

**Original behavior:** Skips exactly NS-REC-FF-IN records with TELLER, calls STOP01 if EOF while positioning; resets TELLER and reads next record.

**Delivered Db2 behavior:** Copies payload to group, repeats NB-READ skip reads; same EOF STOP01; resets cumulative total from NB-READ, then TELLER and EOF flag before next read. EOF flag is explicitly initialized only after skips.

**Evidence:** `IDMS Programs/VM1BD526.cbl` physical L126–145; `DB2 Manual converted Programs/VMDZ1526.txt` physical L198–213; `DB2 Manual converted Programs/VMDZ1526.txt` physical L337–345.

**Question versions / production gaps:** [Q-000020](../_audit/questions/Q-000020.md), [Q-000029](../_audit/questions/Q-000029.md), [Q-000030](../_audit/questions/Q-000030.md)

### VM1BD526-C011 — 100-record transaction boundary

**Phase 2 rehearsal assessment (CONDITIONAL_ATOMICITY_EXPECTATION_ONLY):** Q-000028 restricts the fixture to one active owner; Q-000035 assumes rollback and non-return on designated failures. With the separately scoped simple-view fixture, source ordering business DML → checkpoint UPDATE → COMMIT supports a100-record normal batch model. It does not prove real atomicity or safe replay after an uncertain COMMIT.

**Revised scenario conditions / expected checks:**

- Failure before checkpoint, after checkpoint but before COMMIT, and after durable COMMIT.
- Uncertain COMMIT: reconcile the authoritative checkpoint; do not blindly repeat INSERTs.
- Overlapping owners are a negative scenario outside the positive fixture.

**Production finding retained:** Actual attachment, rollback handler, object behavior, scheduler ownership and crash injection remain unverified.

**Applied answer versions:** [Q-000028](../_audit/questions/Q-000028.md) [VM1BD526.cbl, VM1BD567.cbl; PROVIDED]; [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM1BD526.cbl](../programs/VM1BD526.cbl__migration.md) · **Rule/variant:** RULE-001, RULE-001-V01 · **Source assessment:** `SUPPORTED_WITH_GAPS`.

**Condition:** Each processed input record; TELLER not less than 100 or EOF.

**Original behavior:** Business LRF work, add batch TELLER to FFRECAB total, MODIFY/STORE checkpoint, COMMIT; final checkpoint then FINISH.

**Delivered Db2 behavior:** Business SQL, save cumulative read count, update restart row, COMMIT; final commit marks complete at EOF. Count matches processed rows only if every error routine terminates.

**Evidence:** `IDMS Programs/VM1BD526.cbl` physical L148–158; `IDMS Programs/VM1BD526.cbl` physical L230–237; `IDMS Programs/VM1BD526.cbl` physical L103–109; `DB2 Manual converted Programs/VMDZ1526.txt` physical L215–225; `DB2 Manual converted Programs/VMDZ1526.txt` physical L357–380.

**Question versions / production gaps:** [Q-000028](../_audit/questions/Q-000028.md), [Q-000035](../_audit/questions/Q-000035.md)

### VM1BD526-C012 — Checkpoint payload length and record buffer

**Phase 2 rehearsal assessment (CONTRADICTS_TEST_PAYLOAD_POLICY_SOURCE_UNCHANGED):** Q-000032 selects a15-byte count-only protocol. The periodic/final UPDATE length15 matches it, but fresh INSERT length1215 is an observed inconsistency. KY-RESTART and WS-INPUT-KASBONS are unnecessary for recovery under this chosen test protocol; their elimination is a proposal, not an applied source fix or proof about the persistent buffer.

**Revised scenario conditions / expected checks:**

- Compare initial1215-byte and subsequent15-byte declared payloads.
- Restore exactly15 numeric count bytes; separately require rejection of short/nonnumeric data.

**Production finding retained:** Production payload policy remains OPEN; no initializer/validation/helper source change has been made.

**Applied answer versions:** [Q-000032](../_audit/questions/Q-000032.md) [VM1BD526.cbl, VM1BD567.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM1BD526.cbl](../programs/VM1BD526.cbl__migration.md) · **Rule/variant:** RULE-029, RULE-029-V01 · **Source assessment:** `OBSERVED_INCONSISTENCY`.

**Condition:** Initial versus periodic/final checkpoint serialization.

**Original behavior:** Persists NS-REC-FF-IN; no 1200-byte input-record checkpoint is visible.

**Delivered Db2 behavior:** Initial length 1215; every update length 15; KY-RESTART and snapshot never validate or drive resume.

**Evidence:** `IDMS Programs/VM1BD526.cbl` physical L230–237; `DB2 Manual converted Programs/VMDZ1526.txt` physical L60–63; `DB2 Manual converted Programs/VMDZ1526.txt` physical L347–368; `Dclgens/DZ01RSTV.txt` physical L16–31.

**Question versions / production gaps:** [Q-000032](../_audit/questions/Q-000032.md)

### VM1BD526-C013 — Completion and repeated run

**Phase 2 rehearsal assessment (INTENTIONAL_TEST_REJECTION_UNEXECUTED):** Q-000027 explicitly accepts same-key completed reruns as a planned rejection, and Q-000035 assumes USERABEN does not return. The source complete1 branch fits that test policy, including an empty run subsequently retried. This is still a change from the legacy existence-only behavior.

**Revised scenario conditions / expected checks:**

- Run to EOF, then attempt the identical key.
- Complete an empty input then retry; no business DML should run.

**Production finding retained:** Actual scheduler handling, retention/reset authority and non-return behavior remain unverified.

**Applied answer versions:** [Q-000027](../_audit/questions/Q-000027.md) [VM1BD526.cbl, VM1BD567.cbl; PROVIDED]; [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM1BD526.cbl](../programs/VM1BD526.cbl__migration.md) · **Rule/variant:** RULE-009, RULE-009-V01 · **Source assessment:** `CHANGED_UNRESOLVED`.

**Condition:** EOF, empty input, later same-key execution.

**Original behavior:** Final FFRECAB count is stored then FINISH; a later run can skip count and encounter EOF.

**Delivered Db2 behavior:** Final checkpoint CO-ID-RS = 1; a later selected row with 1 calls USERABEN; no deletion or retention enforcement appears.

**Evidence:** `IDMS Programs/VM1BD526.cbl` physical L103–109; `IDMS Programs/VM1BD526.cbl` physical L120–145; `DB2 Manual converted Programs/VMDZ1526.txt` physical L175–183; `DB2 Manual converted Programs/VMDZ1526.txt` physical L337–345; `DB2 Manual converted Programs/VMDZ1526.txt` physical L357–379.

**Question versions / production gaps:** [Q-000027](../_audit/questions/Q-000027.md), [Q-000035](../_audit/questions/Q-000035.md)

### VM1BD526-C014 — Operation-specific SQL and error state

**Phase 2 rehearsal assessment (ERROR_CONTRACT_ASSUMED_NOT_IMPLEMENTED_EVIDENCE):** Q-000035 allows +100 only where explicitly expected: missing restart row creates one; missing parent/event/update remains fatal. It gives a conditional reason why caller code cannot continue after an error routine. Original SQL diagnostics must survive handler SQL; missing handler code, unexamined SQLWARN on SQLCODE0 and ambiguous-COMMIT behavior remain visible.

**Revised scenario conditions / expected checks:**

- Exercise0, expected100 and unexpected100 separately for each producing statement.
- Exercise negative and other positive SQLCODE; preserve first failure through rollback/logging.
- Inspect SQLCODE0 with warning indicators independently.

**Production finding retained:** No error routine, warning policy or runtime result was supplied.

**Applied answer versions:** [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM1BD526.cbl](../programs/VM1BD526.cbl__migration.md) · **Rule/variant:** RULE-033, RULE-033-V01 · **Source assessment:** `UNRESOLVED`.

**Condition:** Any of 8 executable SQL statements, LR status failure, or completed/short-file call.

**Original behavior:** Parent-not-found/LR-ERROR in insert calls IDMS-STOP which displays status, ROLLBACKs and CALLs USERABEN; other LR failures call USERABEN directly; IDMS AUTOSTATUS dependency missing.

**Delivered Db2 behavior:** Restart SELECT accepts 0/+100, parent SELECT only 0, event SELECT 0/+100 distinct displays, all changes/COMMIT only 0; OTHER calls unavailable SQLERROR. No SQLSTATE/SQLWARN/row-count/indicator branch or explicit target ROLLBACK.

**Evidence:** `IDMS Programs/VM1BD526.cbl` physical L193–195; `IDMS Programs/VM1BD526.cbl` physical L206–227; `IDMS Programs/VM1BD526.cbl` physical L247–254; `DB2 Manual converted Programs/VMDZ1526.txt` physical L331–335; `DB2 Manual converted Programs/VMDZ1526.txt` physical L373–379; `DB2 Manual converted Programs/VMDZ1526.txt` physical L401–627.

**Question versions / production gaps:** [Q-000035](../_audit/questions/Q-000035.md)

### VM1BD526-C015 — Cumulative and per-invocation counters

**Phase 2 rehearsal assessment (CAPACITY_GAP_RETAINED):** Q-000029 bounds the positive fixture at99999 and requires100000/oversized restored checkpoints as failure scenarios. It does not enlarge S9(5) counters or add a range guard. Reusing the existing15-digit NB-READ for the cumulative role could avoid the duplicate narrow total if skip reads leave its fixed extent unchanged; batch TELLER retains a separate lifetime.

**Revised scenario conditions / expected checks:**

- Happy range0–99999.
- At100000 or a larger restored count, require safe rejection or a future validated wider design; current code supplies no explicit guard.

**Production finding retained:** Actual maximum volume, failure policy and any wider/reused counter implementation require validation.

**Applied answer versions:** [Q-000029](../_audit/questions/Q-000029.md) [VM1BD526.cbl, VM1BD567.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM1BD526.cbl](../programs/VM1BD526.cbl__migration.md) · **Rule/variant:** RULE-007, RULE-007-V01 · **Source assessment:** `UNRESOLVED`.

**Condition:** Long input, resume, and statistic reconciliation.

**Original behavior:** TELLER is a 5-digit batch/skip counter; persistent total resides in unavailable FFRECAB layout.

**Delivered Db2 behavior:** Total and insert/update metrics are 5-digit packed; saved count 15-digit; total is restored but insert/update totals restart at 0.

**Evidence:** `IDMS Programs/VM1BD526.cbl` physical L59–64; `IDMS Programs/VM1BD526.cbl` physical L126–157; `DB2 Manual converted Programs/VMDZ1526.txt` physical L54–64; `DB2 Manual converted Programs/VMDZ1526.txt` physical L180–182; `DB2 Manual converted Programs/VMDZ1526.txt` physical L320–365; `DB2 Manual converted Programs/VMDZ1526.txt` physical L568–568; `DB2 Manual converted Programs/VMDZ1526.txt` physical L615–615.

**Question versions / production gaps:** [Q-000029](../_audit/questions/Q-000029.md)

### VM1BD526-C016 — Run-scoped audit timestamp

**Phase 2 rehearsal assessment (TEST_AUDIT_INTENT_DEFINED):** Q-000009 chooses a run-scoped timestamp. The source captures once per invocation; a positive fixture can treat that invocation as its run, with inserted TS_UPDATE using the maximum marker and modifications using the captured time. A restarted invocation captures a new timestamp. The answer does not settle whether a production logical run must retain one timestamp across restarts.

**Revised scenario conditions / expected checks:**

- Several records in one invocation share its captured timestamp.
- Resume in a later invocation and distinguish new invocation time from an original job-wide time.

**Production finding retained:** Production audit semantics and actual downstream interpretation are still OPEN.

**Applied answer versions:** [Q-000009](../_audit/questions/Q-000009.md) [VM1BD526.cbl, VM1BD567.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM1BD526.cbl](../programs/VM1BD526.cbl__migration.md) · **Rule/variant:** RULE-030, RULE-030-V01 · **Source assessment:** `CHANGED_UNRESOLVED`.

**Condition:** New event or update to selected event.

**Original behavior:** No corresponding audit timestamps/user columns in the listed legacy moves.

**Delivered Db2 behavior:** One CURRENT-DATE capture provides TS_CREATE/TS_UPDATE values; INSERT TS_UPDATE gets maximum sentinel; ID_USERID receives CS-PROGRAM.

**Evidence:** `DB2 Manual converted Programs/VMDZ1526.txt` physical L185–188; `DB2 Manual converted Programs/VMDZ1526.txt` physical L274–279; `DB2 Manual converted Programs/VMDZ1526.txt` physical L309–312; `DB2 Manual converted Programs/VMDZ1526.txt` physical L382–393.

**Question versions / production gaps:** [Q-000009](../_audit/questions/Q-000009.md)

## 6. Cross-program verification and validation scenarios

### All 33 rules rechecked against all six programs

The following source-disposition grid retains the complete baseline evidence assessment after applying the scoped test questions. `S` = APPLIES_SUPPORTS, `V` = APPLIES_VARIANT, `C` = APPLIES_CONTRADICTS, `U` = UNKNOWN, `N` = NOT_APPLICABLE. S/V are scoped static observations, not production sign-off. Temporary policies add conditional rehearsal interpretations; they do not replace missing production evidence or repair source contradictions. The current [rule-applicability.json](../_audit/rule-applicability.json) carries each condition, evidence range, answer version and recheck annotation.

All 198 cells remain represented: 10 S, 9 V, 1 C, 80 U and 98 N. The single contradiction is the 4310 branch-field population defect. UNKNOWN includes real order, type, error, DDL, restart and missing-dependency obligations; a generic guide cannot declare them safe for all six programs from synthetic answers.

| Rule | VM1BD526.cbl | VM1BD567.cbl | VM4BD302.cbl | VM4BD310.cbl | VM4BD420.cbl | VM7BD200.cbl |
| --- | --- | --- | --- | --- | --- | --- |
| RULE-001 | U | U | N | N | N | N |
| RULE-002 | S | S | S | C | S | S |
| RULE-003 | U | U | U | U | U | U |
| RULE-004 | N | N | N | N | U | N |
| RULE-005 | N | U | N | N | N | N |
| RULE-006 | N | N | U | N | U | N |
| RULE-007 | U | U | N | N | N | N |
| RULE-008 | S | N | N | N | N | N |
| RULE-009 | U | U | N | N | N | N |
| RULE-010 | S | V | N | N | N | N |
| RULE-011 | N | N | U | N | U | U |
| RULE-012 | V | U | U | U | U | U |
| RULE-013 | N | U | N | N | N | N |
| RULE-014 | U | U | U | U | U | U |
| RULE-015 | N | N | U | U | U | U |
| RULE-016 | U | U | N | N | N | N |
| RULE-017 | U | U | S | U | S | U |
| RULE-018 | U | N | N | N | N | N |
| RULE-019 | U | N | N | N | N | N |
| RULE-020 | U | N | N | N | N | N |
| RULE-021 | U | N | N | U | N | S |
| RULE-022 | U | U | U | U | U | U |
| RULE-023 | V | V | V | V | V | V |
| RULE-024 | N | N | U | N | U | N |
| RULE-025 | U | N | U | U | U | U |
| RULE-026 | U | U | N | N | N | N |
| RULE-027 | N | N | V | N | N | N |
| RULE-028 | U | U | N | N | N | N |
| RULE-029 | U | U | N | N | N | N |
| RULE-030 | U | U | N | N | N | N |
| RULE-031 | U | U | U | U | U | U |
| RULE-032 | N | N | U | N | N | N |
| RULE-033 | U | U | U | U | U | U |


Rule applicability is checked against every one of the six IDMS inputs, including programs that did not originate the rule. A rule is not “verified for all programs” merely because it is linked to its seed cases. UNKNOWN records missing evidence; APPLIES_CONTRADICTS retains a demonstrated conflict; NOT_APPLICABLE requires a scoped reason. The 198-cell matrix contains the per-program condition, source evidence, case IDs and unresolved questions. Production status remains PARTIAL where required evidence is missing.

| Scenario family | Inputs / boundary | Expected assessment or required outcome |
| --- | --- | --- |
| Routing | Flag '1', '0', blank and unexpected values. | Only equality 1 inserts; the observed ELSE remains modification unless business authorizes narrower input validation. |
| Parent relationship | Missing/duplicate parent, parent deleted between lookup and INSERT, FK/sequence failure. | No invalid child creation or committed progress; constraints and transaction behavior must be established. |
| Child choice/update | No matching event, one match, two 0168/0219 matches, selected row deleted/changed. | Select the approved child, preserve stable ID, and reject missing UPDATE without advancing checkpoint. |
| Key/audit representation | 20-byte legacy mixed key versus 28-character SQL key; leading zeros, signs, run restart timestamp. | Use approved encoding/defaults and exact types; an answer cannot by itself prove loader or copybook compatibility. |
| Checkpoint boundaries | 0/99/100/101 records, skip N, short file, changed generation, final commit acknowledgement. | Business event and durable count remain consistent; incomplete/complete outcomes reflect an approved lifecycle. |
| Payload/helper alternatives | Initial 1215 versus later 15, counter overflow, last-record across EOF, removed unused cursor flag. | Only storage with a proven role remains; serialization and actual mainframe behavior still need validation. |

These are production-oriented test specifications. Static source tracing, declaration arithmetic and separate Python reasoning models can demonstrate a particular condition or counterexample. They cannot establish COBOL compiler behavior, SQL runtime behavior, complete output byte compatibility or job recovery on the real mainframe. Actual environment tests must report their own inputs, observed outputs and evidence.

## 7. Exact answer versions, origin and accepted scope

The corpus has **36 PROVIDED temporary answers, 3 DEFERRED questions, 0 real human answers and 39 production questions still OPEN**. Every row below has origin `SIMULATED_FOR_TEST` and review state `TEST_ASSUMPTION_ONLY`; the explicit origin column makes that provenance travel with the answer. A provided answer resolves only its stated rehearsal policy. Deferred Q-000011/Q-000012/Q-000015 remain open even for the test.

Links open the exact Phase 2 snapshots consumed here. The SHA-256 is the full marked answer block, including its scope/provenance metadata; the raw snapshot hash is additionally recorded in [questions.json](../_audit/questions.json). The original unanswered Phase 1 snapshots and both superseded Q-000025 drafts remain preserved. Q-000025's current version identifies the 20-byte parameter input, with answer SHA-256 `d8ee3a88f15953763825e49b87cd65e76f8277026d9034fe94336555ae37d1dd`.

Each listed input scope is exact. Shared technical rules may cite an example from another category, but its answer cannot be applied to a different program merely because the guide includes it. The condition in the exact snapshot remains part of the scope.

| Question / response | Origin | Accepted input scope | Answer SHA-256 | Exact temporary policy or deferral |
| --- | --- | --- | --- | --- |
| [Q-000002](../_audit/questions/Q-000002.md) / PROVIDED | SIMULATED_FOR_TEST | VM4BD302.cbl | `0b8a37c38739ac364c3ea5b24ffeb3d3bbeadef4cb1219730086b50171f03d1d` | Use decimal-only stock/CI and amounts within destination range for simulated tests; preserve production domain/range question. |
| [Q-000003](../_audit/questions/Q-000003.md) / PROVIDED | SIMULATED_FOR_TEST | VM4BD302.cbl | `a94c028c8f6e1c7977ecd86c9a8980713172ed2fc5e798ef24e1610af6d1714b` | Test only successful 2610-byte service responses; preserve an open question for failure policy and the missing executable. |
| [Q-000004](../_audit/questions/Q-000004.md) / PROVIDED | SIMULATED_FOR_TEST | VM4BD420.cbl | `412b5887ee7880e82aca7615ae82553c335cf71dd8e5293736f92bdd42d807a2` | For test only assume last encountered 0060 is desired and top two creation CI digits are zero; retain real domain/order evidence gaps. |
| [Q-000005](../_audit/questions/Q-000005.md) / PROVIDED | SIMULATED_FOR_TEST | VM7BD200.cbl | `b9e640fd93cad8bca2f208dc950260dc1a4ac01294775249b02fead0098fa767` | SIMULATED_FOR_TEST: Require compatibility for named business fields and filler bytes. Do not approve blanking without consumer evidence; keep byte compatibility unresolved. |
| [Q-000006](../_audit/questions/Q-000006.md) / PROVIDED | SIMULATED_FOR_TEST | VM7BD200.cbl | `bf79237d7fab06eda9a7151c7a04c73b77834124e3e53a4ba364e8a56abb752a` | SIMULATED_FOR_TEST: Map zero to 0001-01-01 and high date 99999999 to 9999-12-31. Retain strict less-than and the creation-date fallback. Actual migrated data has not been reconciled. |
| [Q-000008](../_audit/questions/Q-000008.md) / PROVIDED | SIMULATED_FOR_TEST | VM7BD200.cbl | `4c58fd9a2d5926f7eac0c68f656825e781ce1842ef4af00c315c021cbd31d272` | SIMULATED_FOR_TEST: Order is not business-significant, but F-TELLER must be unique and contiguous within an extract. Retain the production question and require row-set reconciliation. |
| [Q-000009](../_audit/questions/Q-000009.md) / PROVIDED | SIMULATED_FOR_TEST | VM1BD526.cbl, VM1BD567.cbl | `ba03401f9f8a06deb79d84dc9631e2202140868d0512a6e9aae0233cbf9d7766` | For simulated tests, define a run-scoped timestamp and the maximum timestamp as a never-updated marker; retain this as intent, not a proven site standard. |
| [Q-000011](../_audit/questions/Q-000011.md) / DEFERRED | SIMULATED_FOR_TEST | VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl | `bb2cb5105bdb292d0e1dd003d147a3dcb88be7621346a46fa099eb2a6aa19574` | DEFERRED FOR TEST. Retain FFRECAT to DZ01FFTB only as the observed mapping candidate. No buffer DDL or demonstrated producer/consumer lifecycle was supplied. Do not identify an in-memory record-copy helper as this persistent buffer. |
| [Q-000012](../_audit/questions/Q-000012.md) / DEFERRED | SIMULATED_FOR_TEST | VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl | `51e00e15dd7390a77f08dcf62f3876aa667d349380bb2106c7a718bf0732237b` | DEFERRED. No actual build or generated-member bundle is supplied by this rehearsal. Use the visible declarations for static reasoning only; perform no fictitious compile or runtime checks. |
| [Q-000013](../_audit/questions/Q-000013.md) / PROVIDED | SIMULATED_FOR_TEST | VM4BD310.cbl | `dfe460e4157f9191cc517497617fe33063ec10bc71e9633e6427b51dd4201783` | SIMULATED_FOR_TEST: Preserve the original capital amount. The omitted projection remains a defect; this temporary answer does not fix the source. |
| [Q-000014](../_audit/questions/Q-000014.md) / PROVIDED | SIMULATED_FOR_TEST | VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl, VM7BD200.cbl | `5427518e5ff6db124d8b2e2141f889baa56e69d4ba74c79bd451787e3eb1e2c9` | SIMULATED TEST POLICY: fetched DATE strings use EUR dd.mm.yyyy; legacy 00000000 corresponds to 0001-01-01 and 99999999 to 9999-12-31 where the documented program-specific branch uses that convention. Keep all other predicates, century cutoffs and date arithmetic unchanged. Actual environment and loaded data remain unverified. |
| [Q-000015](../_audit/questions/Q-000015.md) / DEFERRED | SIMULATED_FOR_TEST | VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl | `4e90098a8c4cb093e43908258e8902a0a22e52b7d37157256d843f609c72825b` | DEFERRED FOR TEST. The eight identities have not been supplied. Do not invent names, count schema declarations as an approved list, or authorize deletion of their dependent conditions. All eight remain unresolved. |
| [Q-000016](../_audit/questions/Q-000016.md) / PROVIDED | SIMULATED_FOR_TEST | VM1BD526.cbl | `66b2fd7b2daae388103c02c56d500076a0613a06a9a733379dd0e81b753ca4e9` | Test-only fixtures can define greatest-ID selection as intended and expose a multi-event counterexample where it differs from legacy set order; do not silently change the original assessment. |
| [Q-000017](../_audit/questions/Q-000017.md) / PROVIDED | SIMULATED_FOR_TEST | VM1BD526.cbl, VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl | `9202cc08b72392627f0e771ef016b7eb0bb79de9771a723630cb35dc8513a0a7` | SIMULATED TEST POLICY: use 28 display digits in widths 8+8+6+3+3, preserve leading zeroes, use nonnegative operation codes and the stated minimum-date convention. Treat CHAR(28) as intended for this test only. Keep the original CHAR(20) CSV row unchanged and visible as a conflict; no actual loader/consumer specification is supplied. |
| [Q-000018](../_audit/questions/Q-000018.md) / PROVIDED | SIMULATED_FOR_TEST | VM1BD526.cbl | `6269d5bb5d62531ddefe45e2270c9cd7115e3e417218a58c933d4782fe38ac00` | A test fixture may enforce the four-column parent key, event surrogate PK and parent FK, and reserve IDMSKEY zero for newly created Db2 rows, while leaving actual DDL unverified. |
| [Q-000019](../_audit/questions/Q-000019.md) / PROVIDED | SIMULATED_FOR_TEST | VM4BD310.cbl | `f869f03c4919398b3af058e11be9583e0f1f92c5feb6da59b74f039861d69981` | SIMULATED_FOR_TEST: Discard partial output and rerun the immutable input. This is an operational test assumption, not evidence of actual JCL behavior. |
| [Q-000020](../_audit/questions/Q-000020.md) / PROVIDED | SIMULATED_FOR_TEST | VM1BD526.cbl, VM1BD567.cbl | `635fd2857757b359ca986d7b9edcb5e4187eead589b54f1be785e0c3ead9f049` | For an explicitly simulated test only, use a byte-identical 1200-byte copy of VMBD205I with only the level-01 name changed; record that this does not establish the real build layout. |
| [Q-000021](../_audit/questions/Q-000021.md) / PROVIDED | SIMULATED_FOR_TEST | VM1BD567.cbl | `93288bfb0edb3a53caf67f699314c48f3eb79e9b709699cfdc17f7cc904d6fc4` | For an explicitly simulated policy answer, declare a successful-record count and 100-record atomic batches as intended, treating the legacy counter issue as a defect and the target cadence as a repair subject to validation. |
| [Q-000023](../_audit/questions/Q-000023.md) / PROVIDED | SIMULATED_FOR_TEST | VM4BD310.cbl | `b07a03b4bd49aac9f10a583f3df3d3e35ae2acd5722b79ec84f15b06e9e033ad` | SIMULATED_FOR_TEST: Preserve the first event 0092 selected by the original set traversal. Treat the highest-ID selection as unverified until its ordering is proved. |
| [Q-000024](../_audit/questions/Q-000024.md) / PROVIDED | SIMULATED_FOR_TEST | VM7BD200.cbl | `2ff78084a1afd9632a15aeffd5576f952cd9fd68c71dc7dea229a05c84492dde` | SIMULATED_FOR_TEST: Accept RA_BASFMAS_479BFAS as the intended spelling while retaining the original CSV bytes and the documented correction. |
| [Q-000025](../_audit/questions/Q-000025.md) / PROVIDED | SIMULATED_FOR_TEST | VM7BD200.cbl | `d8ee3a88f15953763825e49b87cd65e76f8277026d9034fe94336555ae37d1dd` | SIMULATED TEST ASSUMPTION — corrected role: VMDZ270I is the 20-byte archive-parameter INPUT copybook read from DAARCH, not the 530-byte output record. For this rehearsal only, assume the supplied VMBZ270I parameter layout is retained with its level-01 name changed. The actual VMDZ270I member is still missing, so build/layout closure is not established. This answer makes no claim about REC-FORM filler bytes or output-consumer compatibility; those remain under Q-000005. It supersedes the earlier synthetic draft that incorrectly described an output interface. |
| [Q-000026](../_audit/questions/Q-000026.md) / PROVIDED | SIMULATED_FOR_TEST | VM4BD310.cbl | `ce9927b5535de374b86e640e0042dff6b30415c95ff9654fcc6cd2e84b29ce40` | SIMULATED TEST ASSUMPTION: VMDZ510I retains the supplied VMBD510I layout with the top-level name changed. No physical copybook is created or claimed present; byte compatibility and build closure remain unresolved. |
| [Q-000027](../_audit/questions/Q-000027.md) / PROVIDED | SIMULATED_FOR_TEST | VM1BD526.cbl, VM1BD567.cbl | `70cc7265186181e71caf54b342f8683c2b6caa909ea4c90ce9714f212e9a8a13` | For test only, accept completed same-key reruns as a planned rejection and explicitly retain that policy difference from legacy. |
| [Q-000028](../_audit/questions/Q-000028.md) / PROVIDED | SIMULATED_FOR_TEST | VM1BD526.cbl, VM1BD567.cbl | `307f13151ea2c2a9072d79583318342298713bd6aea5e8beb32e3e52c282fe59` | Simulated test may enforce one active owner per key in its harness; the source still contains no ownership check. |
| [Q-000029](../_audit/questions/Q-000029.md) / PROVIDED | SIMULATED_FOR_TEST | VM1BD526.cbl, VM1BD567.cbl | `b48442cb0950b2c6d4468c43bed2fea5fa08df45d7ef03d4d6c93f591c3acc01` | Simulated boundary data should remain within a stated safe range for happy paths and separately exercise 100000 / 10000000 and oversized restored checkpoints as failures. |
| [Q-000030](../_audit/questions/Q-000030.md) / PROVIDED | SIMULATED_FOR_TEST | VM1BD526.cbl, VM1BD567.cbl | `c6f45c011d6eee7ac19059057254a474ae69de9c9ffc88618ce1dee1f967156f` | Test-only assumption: immutable, byte-identical sequential input for every retry; add a negative changed-input scenario rather than claiming the code detects it. |
| [Q-000031](../_audit/questions/Q-000031.md) / PROVIDED | SIMULATED_FOR_TEST | VM1BD526.cbl, VM1BD567.cbl | `8d10600a8b7e32103b6225815811cc48e7a1c220a0578cf63e20504397450493` | Test only: start with an empty target/checkpoint state and a fresh immutable input; separately test an explicit legacy-count conversion fixture. |
| [Q-000032](../_audit/questions/Q-000032.md) / PROVIDED | SIMULATED_FOR_TEST | VM1BD526.cbl, VM1BD567.cbl | `e597418af19bb6c7916aa3ba63f1483828f2e07acdb8ec894eafdfc16432a406` | For a clearly marked simulated test, define a count-only 15-byte protocol with immutable input; keep the observed 1215-byte initial form as an implementation inconsistency to assess. |
| [Q-000033](../_audit/questions/Q-000033.md) / PROVIDED | SIMULATED_FOR_TEST | VM1BD567.cbl | `47dc78a07ac105da36279835f0c9593f3092b073bdd45658efa85a4c4d85f152` | Test-only expected policy: fail closed on short/missing input and preserve the last durable checkpoint; the present source still lacks the corresponding guard. |
| [Q-000034](../_audit/questions/Q-000034.md) / PROVIDED | SIMULATED_FOR_TEST | VM1BD526.cbl, VM1BD567.cbl | `8cfa929c0343c57db8bfa3067cfea29072cdf6bb5c98a0e1c06d89f47a0a6d4c` | Test-only fixture: a simple updatable view over one restart table with a unique key (program,phase,date), no hidden commits or triggers; do not treat this as supplied production DDL. |
| [Q-000035](../_audit/questions/Q-000035.md) / PROVIDED | SIMULATED_FOR_TEST | VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl | `5c16a3d26a16b6abf33b13cc2e35196eead61d0130895a637878ec34987e4ebc` | SIMULATED TEST POLICY: treat a designated unexpected SQL result as fatal after preserving its original diagnostics. Assume SQLERROR rolls back uncommitted Db2 work and does not return; assume USERABEN does not return. Expected operation-specific +100 outcomes still follow the explicit caller branch. No missing routine has actually been supplied or executed. |
| [Q-000036](../_audit/questions/Q-000036.md) / PROVIDED | SIMULATED_FOR_TEST | VM4BD302.cbl, VM4BD420.cbl | `2550df72c8a4f4e75f8f4d82e59bec0d4fd6389fc91bef8205b1019d631854f1` | For simulation only, assume descending event IDs reproduce the relevant legacy encounter order; retain source-schema/load proof as unresolved. |
| [Q-000037](../_audit/questions/Q-000037.md) / PROVIDED | SIMULATED_FOR_TEST | VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl | `2a3a00d3598f0f62e41fc94eb4a3980c5ee2aa0b120f9fae841443bdfd230943` | SIMULATED TEST FIXTURE: assume the relevant TV objects are unfiltered projections of the mapped TB objects with the DCLGEN declarations and required logical key uniqueness. This is a hypothetical fixture, not supplied DDL or a catalog verification. Event sequence/FK and restart-key guarantees remain separately scoped. |
| [Q-000038](../_audit/questions/Q-000038.md) / PROVIDED | SIMULATED_FOR_TEST | VM4BD302.cbl | `982880a1645663b8fe9f7dfc97bc3cd268bc304ac6e9ce02694f6b61873d3fcc` | SIMULATED TEST POLICY: discard partial output, recreate it from the same immutable input and stable database snapshot, and publish it only after successful completion. This is an external job policy assumed for the test; no JCL or scheduler implementation is supplied or proved. |
| [Q-000039](../_audit/questions/Q-000039.md) / PROVIDED | SIMULATED_FOR_TEST | VM4BD420.cbl | `d0f03e1ae8c2dce4b92d5cf89de68571f0794d6c4b13587daf4951bb58686435` | SIMULATED TEST POLICY: discard partial output, recreate it from the same immutable input and stable database snapshot, and publish it only after successful completion. This is an external job policy assumed for the test; no JCL or scheduler implementation is supplied or proved. |

## 8. What Phase 2 resolves and what remains open

This revision consumes the exact assistant-written test answers and revisits each affected rule and case without changing the application sources or the frozen Phase 1 baseline. It makes several test expectations explicit: the intended 567 counting unit, count-only persistence, completed-run rejection, selected event policy by program, date/key fixture representations, output replay assumptions and fatal-handler intent. Those are conditional scenario choices rather than human-approved production requirements.

Source defects remain source defects. The missing 4310 capital projection and lost LR diagnostic distinction are not repaired by answers. The 567 short-file guard and counter capacities remain issues. Initial 1215-byte versus later 15-byte restart serialization remains inconsistent with the chosen count-only protocol. Archive filler compatibility, actual ordering, loaded key/date conversion, real copybooks, DDL, central routines and build/run evidence remain open.

The question-premise recheck corrected Q-000025's role: VMDZ270I is the 20-byte parameter input, while REC-FORM supplies a separate 530-byte output. See [DOCUMENTATION_CORRECTIONS.md](../../../../DOCUMENTATION_CORRECTIONS.md) and the current question snapshot. The real converted member is still missing; no substitute file was created or declared present.

For a real second run, replace rehearsal assumptions with genuine scoped business answers and the requested artifacts, then recheck source/configuration/answer fingerprints and all affected cases and rule/program cells. A successful structural validation verifies report/evidence consistency; it does not execute COBOL or certify production equivalence. No precompile, compile/link, bind, live SQL, file-byte regression, runtime fault injection or real business approval is claimed here.

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
