# G03 — LRF retrieval

**Phase:** 2 · **Run:** Run-001 · **Execution mode:** TEST_REHEARSAL · **Source/production assessment:** PARTIAL · **Baseline:** Phase-1/Run-001.

**Answers:** 36 PROVIDED test assumptions, 3 DEFERRED questions, 0 real human answers. All 39 production questions remain OPEN. The original source findings are retained; the exact scoped rehearsal revisions appear inside every rule and case below.

This is a conditional generic synthesis of the supplied six-program corpus. It contains **21 classified cases** and **14 rule definitions** for this category. Rules shared across categories retain the same RULE IDs; their source variants remain explicitly identified. The complete corpus contains 60 distinct cases and 33 distinct rules.

## 1. Scope and what this sample establishes

This guide covers VM4BD310 → VMDZ4310's selected parent/event LR path, VM7BD200 → VMDZ7200's selected form-area sweep, and the retrieval obligations inside VM1BD526's LRF updater. Each is classified from the executed selector and schema path. Declared LR components and unused schema STORE/MODIFY/ERASE paths are not automatically executed behavior.

Normalize the LR into its effective network operations and custom returns before designing SQL. For 4310, the parent lookup, empty set and filtered exhaustion are distinct source states. For 7200, SWEEP-VMBFAS accesses only VMBFAS; adding a VMBSIAS join would invent a parent precondition. A successful SQL SELECT also does not establish branch output correctness: the delivered 4310 target omits the capital amount that its zero-coupon-rank branch later consumes.

Every recommendation below separates an observed source behavior, an observed target behavior, an unresolved condition and a proposed change. A manually converted program is evidence of a developer's approach; its correctness is not assumed. The reports include a demonstrated missing-field defect, representation conflicts and unresolved operational contracts. The frozen Phase 1 snapshots remain unanswered; this Phase 2 revision consumes the current scoped temporary answers listed in section 7.

The configured eight decommission identities were not supplied. FFRECAB is visibly used for restart and has a mapped target candidate, while FFRECAT → DZ01FFTB is only a possible second replacement. No supplied producer/consumer path establishes the requested persistent buffer protocol. These gaps are covered by RULE-003/RULE-014 and individual questions; they are not silently classified as absent business work.

### Program participation

| Input / paired report | Role in this guide |
| --- | --- |
| [VM1BD526.cbl](../programs/VM1BD526.cbl__migration.md) | 5 classified cases: VM1BD526-C002, VM1BD526-C004, VM1BD526-C006, VM1BD526-C007, VM1BD526-C014 |
| [VM4BD310.cbl](../programs/VM4BD310.cbl__migration.md) | 8 classified cases: VM4BD310-C001, VM4BD310-C002, VM4BD310-C003, VM4BD310-C004, VM4BD310-C005, VM4BD310-C006, VM4BD310-C007, VM4BD310-C008 |
| [VM7BD200.cbl](../programs/VM7BD200.cbl__migration.md) | 8 classified cases: VM7BD200-C001, VM7BD200-C002, VM7BD200-C003, VM7BD200-C004, VM7BD200-C005, VM7BD200-C006, VM7BD200-C007, VM7BD200-C008 |

## 2. Execution method for a new program

1. Match every executable LR occurrence to its exact selector, OF LR request values, schema path and return names. Read the path's network operations and its control flow, including IF EMPTY, NEXT and explicit RETURN branches.
2. Produce a normalized state table: missing parent, parent with empty set, child rejected by business filter, successful qualifying child, exhausted children, area end and unexpected error. Identify valid component storage for each return.
3. Translate only the selected path. Use separate parent/child SELECTs when the distinction is still required; use a cursor for actual repeated rows. A singleton SELECT with FETCH FIRST is not a FETCH loop. Do not add a join from an LR component list alone.
4. Keep filtering and selection distinct. SQL can push a filter into WHERE only if zero/sentinel/date representation and comparison semantics agree. Replacing first encountered child with greatest surrogate ID needs a separate ordering decision.
5. Trace each branch's consumed fields backwards through successful SELECT/FETCH population. Include fields used only by one IF arm. INITIALIZE is not a substitute for retrieving the amount or key that the branch needs.
6. Reconstruct required external bytes deliberately. Resolve missing converted copybooks before asserting exact layouts. Treat REDEFINES as aliases, check active variants and entire OCCURS storage, and preserve elementary numeric conversion to packed fields.
7. Inspect each SQL status in context and maintain cursor cleanup where a cursor exists. Determine whether the central error routine rolls back/terminates and whether its diagnostics remain those of the original failure.
8. Document output recovery independently of database restart. Neither 4310 nor 7200 has a visible database checkpoint protocol. Record generation/ordering and partial-file publication need their own approved job contract.

## 3. Business conditions, access shape and state

### Resolve the path before choosing SQL

| Selected request | Effective schema operations | Normal/exception returns | Actual target shape |
| --- | --- | --- | --- |
| 310 ALL-VMBEVEF-BY-VMBEFF | Obtain parent by OF LR CALC key; test empty set; OBTAIN EACH child; main stops on first event 0092. | Parent 0326 → VMBEFF-NOT-FND; empty → NO-VMBEVEF-FND; child 0307 → NO-MORE-VMBEVEF. | Parent singleton SELECT plus event-0092 singleton SELECT ordered by ID descending/FETCH FIRST. |
| 7200 SWEEP-VMBFAS | OBTAIN EACH VMBFAS within AR-VMBFRM1. No VMBSIAS access. | 0000 returns row; 0307 → VMBFAS-EOA. | Filtered Db2 cursor, OPEN/FETCH/CLOSE. |
| 526 ST-VMBEVEF retrieval precondition | Obtain required parent before child STORE. | Parent 0326 → VMBEFF-NOT-FND; original failure rolls back/aborts. | Four-key parent SELECT before event INSERT. |
| 526 filtered ALL-VMBEVEF-BY-VMBEFF | Traverse parent children and select first event 0168/service 0219. | Valid selected child required for subsequent MO path. | Greatest matching generated event ID selected by singleton SQL. |

Evidence: Schema/VMBTS07.txt physical L124–136 and L182–189; Schema/VMBTS03.txt physical L88–92; cases VM4BD310-C002/C003, VM7BD200-C002 and VM1BD526-C002/C004. The selected LR path controls the joins and status branches. Other component names and unused ERASE paths remain outside this executable scope.

### Parent/child validity and lost distinctions

In 310, a missing parent has no valid parent/child result. An empty child set has a valid parent but no child. A nonempty set with no event 0092 reaches filtered exhaustion. All three source branches terminate, but their diagnostics differ. The target distinguishes parent SELECT +100 from event SELECT +100, then merges empty set and filtered exhaustion. A single INNER JOIN would collapse still more of that information. Preserve or explicitly approve each classification; SQL +100 alone is not a complete LR status mapping. [VM4BD310-C002; Q-000022.]

The original first 0092 and target maximum NR_ID are not proven equal. The same issue exists for 526's first 0168/0219 update target. Required set ordering, member placement, load sequence and tie policy are absent. A generated identifier is not inherently a date or legacy set position. [VM4BD310-C003; VM1BD526-C004; Q-000016, Q-000023.]

### Branch data and external interfaces

The delivered VMDZ4310 initializes the parent group, projects NX_CPCRESK twice and omits AM_CNDSTK. Its NX_CPCRESK = 0 output arm then moves the initialized zero rather than the legacy capital value. A parent with coupon rank zero and capital 12500 is a concrete static counterexample; a successful SELECT does not fill an omitted column. Keep this defect in the generic branch-population rule and require the existing DCLGEN amount to be populated if capital is intended. No duplicate shadow amount is needed. [VM4BD310-C004; target physical L219–263, L393–399; original L247–253.]

The 1500-byte mutation output has many aliases. The supplied original copybook has 257 REDEFINES and two OCCURS clauses describing the same 15 × 8-byte date area. It does not allocate 30 independent dates. The missing converted VMDZ510I prevents complete byte/offset proof. [VM4BD310-C007; Q-000026.]

VMDZ7200 reconstructs 432 named bytes plus 46 padding and a 52-byte trailer, yielding 530 bytes. This arithmetic does not prove equivalence to the original whole-record image: target fillers are spaces while the mapping notes packed values in legacy filler areas. Its output counter also binds sequence numbers to a new surrogate ordering. Both byte fidelity and order are distinct consumer questions. Corrected Q-000025 separately concerns the 20-byte cutoff parameter input. [VM7BD200-C005/C006; Q-000005, Q-000008.]

### Archive filtering, host lifetime and helper minimization

7200's qualifying predicate remains strictly before cutoff: use nonzero accounting date, otherwise creation date. The target represents zero with SQL DATE 0001-01-01; the loader/sentinel contract is not supplied. Equal-to-cutoff rows are excluded. OPEN captures current input host values; the subsequent DCLGEN INITIALIZE before FETCH does not erase that opened cursor's cutoff. A later reopen would require restoring it. [VM7BD200-C003/C004; IBM OPEN reference in section 9.]

Eight per-date staging copies and unused template date/timestamp items have removal candidates. The packed creation-date field is the critical exception: direct group MOVE from an eight-character date group would copy bytes rather than perform the required numeric conversion. A proposed no-new-helper alternative uses an elementary validated source such as DA-CCYYMMDD-R(1:8) to the packed field. It remains a source-review proposal requiring the actual compiler and byte tests. Display-date groups can use appropriate direct transfers after their layouts are established. [VM7BD200-C008.]

### Phase 2: LR requirements and the corrected archive-input question

Q-000013 explicitly retains the legacy capital amount: the missing AM_CNDSTK projection in 4310 remains a defect. Q-000022 requires all three LR missing-data outcomes to remain distinguishable and fatal: the merged child diagnostic remains an implementation issue. Q-000023 retains first-0092 semantics, so its maximum-ID target selection remains unproved. The 526 test may instead choose greatest ID through its separately scoped Q-000016; those answers are intentionally different.

Corrected Q-000025 concerns VMDZ270I, the missing **20-byte archive-parameter input** read from DAARCH. The test assumes the legacy parameter layout with a renamed level 01, without creating the member. The **530-byte archive output** is the separate inline REC-FORM record; Q-000005 still requires filler compatibility and leaves it unresolved. The original Phase 1 question and superseded synthetic drafts remain preserved in [DOCUMENTATION_CORRECTIONS.md](../../../../DOCUMENTATION_CORRECTIONS.md).

For 7200, Q-000006/Q-000014 supply strict-cutoff sentinel/EUR assumptions, Q-000008 relaxes order significance only for the fixture while retaining contiguous F-TELLER and row-set reconciliation, and Q-000007 assumes a frozen read snapshot for recreation. For 4310, Q-000019 supplies immutable input only; it does not freeze the database or guarantee that two SELECTs reproduce the same rows on rerun.

## 4. Conditional rule catalog

Each rule gives its applicability condition, preserved or changed behavior, minimum-storage reasoning, failure contract, source variants and concrete scenarios. A variant whose originating case belongs to another category is a cross-category technical example, not a reclassification of that program. The actual 33 × 6 rule/program cross-check is [rule-applicability.json](../_audit/rule-applicability.json); its APPLIES_SUPPORTS, APPLIES_VARIANT, APPLIES_CONTRADICTS, UNKNOWN and NOT_APPLICABLE rows are evidence assessments, not automatic production approval.

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
| RULE-002-V01 / VM4BD310-C004 | NX-CPCRE=0 versus nonzero | DEFECT; classified in this guide; G03 |

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

### RULE-011 — Cursor position and SQL outcome belong to the statement that produced them

**Phase 2 conditional rule and scenario revision:** Q-000035 assumes fatal nonreturn for unexpected OPEN/FETCH/CLOSE outcomes; operation-specific FETCH +100 remains normal EOF. The source still contains the same flags, immediate tests and potential continuation if the real handler returns. For 7200, corrected Q-000025 concerns the 20-byte archive-parameter INPUT, so it supports only a hypothetical cutoff-input layout; it has no bearing on 530-byte output compatibility. OPEN-bound host lifetime remains valid for one open; add a reopen scenario requiring cutoff restoration. Nested cursor state remains independently live in 302/420.

**Exact scoped answer dependencies:** [Q-000025](../_audit/questions/Q-000025.md) [VM7BD200.cbl; PROVIDED]; [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. Full answer hashes and origin are in section 7.

**Six-program source recheck:** VM1BD526.cbl = N; VM1BD567.cbl = N; VM4BD302.cbl = U; VM4BD310.cbl = N; VM4BD420.cbl = U; VM7BD200.cbl = U. The legend and complete matrix are in section 6; no synthetic answer upgrades the production disposition.

**Applies when:** Actual cursor scans in 4302/4420/7200. Singleton SELECT with FETCH FIRST 1 and declaration-only cursor flags do not qualify.

**Source-derived migration behavior and production conditions:** OPEN after input hosts are set, FETCH until the operation’s expected +100, consume row data only after 0, and CLOSE every successful open on normal and business early exits.7200 evaluates its date parameters at OPEN; later INITIALIZE of the same DCLGEN before FETCH is compatible with that single open, but reopening requires restoring cutoff hosts. Nested 4302/4420 cursors need independent status while child SQL overwrites SQLCODE.

**Minimum storage:** An EOF flag may disappear only after an immediate FETCH/test/exit restructuring that preserves status ownership. The existing nested paragraph structures justify separate parent/child EOF state. Do not add saved-SQLCODE for every immediate test automatically.

**Error and recovery contract:** OPEN/FETCH/CLOSE failures are distinct; failed OPEN is not empty input and failed CLOSE must not hide an earlier failure. Missing handlers prevent proof of termination and cleanup.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-011-V01 / VM7BD200-C003 | Opened once with archive cutoff | PARTIALLY_PRESERVED; classified in this guide; G03 |

**Scenarios to exercise:** EMPTY-CURSOR; ONE/MANY-ROWS; OPEN-FAIL; FETCH-FAIL; CLOSE-FAIL; NESTED-CHILD-EOF; REOPEN-PARAMETERS; EARLY-BUSINESS-EXIT.

**Counterexamples and limits:** WITH HOLD is not persistent restart position; SQLCODE after child CLOSE cannot describe the parent FETCH; FETCH FIRST 1 is not a cursor FETCH.

**Source evidence:** `IDMS Programs/VM7BD200.cbl` physical L138–140; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L416–556; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L583–587.

**Question versions / production gaps:** [Q-000025](../_audit/questions/Q-000025.md), [Q-000035](../_audit/questions/Q-000035.md)

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
| RULE-012-V01 / VM4BD310-C006 | DB2 DATE hosts populated | UNRESOLVED; classified in this guide; G03 |
| RULE-012-V02 / VM7BD200-C004 | Nonzero accounting date else creation date; strictly before cutoff | UNRESOLVED; classified in this guide; G03 |

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

### RULE-015 — Database-read-only programs still need external-file recovery contracts

**Phase 2 conditional rule and scenario revision:** Recovery assumptions remain per job. Q-000007 for 7200 discards partial output and recreates from a frozen read snapshot. Q-000019 for 4310 discards partial output and reruns immutable INPUT only; it does not establish a frozen database snapshot for its two SELECTs, so concurrent Db2 changes can still alter rerun output. Q-000038/Q-000039 for 302/420 separately assume stable input/database snapshots and publication only after success. Exercise partial WRITE, changed database, rerun and publication failure under each precise condition. None supplies JCL, scheduler implementation or exactly-once production evidence.

**Exact scoped answer dependencies:** [Q-000007](../_audit/questions/Q-000007.md) [VM7BD200.cbl; PROVIDED]; [Q-000019](../_audit/questions/Q-000019.md) [VM4BD310.cbl; PROVIDED]; [Q-000038](../_audit/questions/Q-000038.md) [VM4BD302.cbl; PROVIDED]; [Q-000039](../_audit/questions/Q-000039.md) [VM4BD420.cbl; PROVIDED]. Full answer hashes and origin are in section 7.

**Six-program source recheck:** VM1BD526.cbl = N; VM1BD567.cbl = N; VM4BD302.cbl = U; VM4BD310.cbl = U; VM4BD420.cbl = U; VM7BD200.cbl = U. The legend and complete matrix are in section 6; no synthetic answer upgrades the production disposition.

**Additional cross-program applicability:** The same file-publication/recovery obligation applies to VM4BD310/VMDZ4310. Its mutation output is outside the Db2 unit of work; Q-000019 asks whether to discard partial output and replay immutable input. The full matrix records this condition separately from the seeded archive case. See [Q-000019](../_audit/questions/Q-000019.md). Phase 2 applies the separately scoped recovery assumptions below; no production recovery contract has been supplied.

**Applies when:** Programs emit business files, including 7200 archive,4310 mutation,4302 redemption and 4420 selection; no database checkpoint is observed for these visible normal paths.

**Source-derived migration behavior and production conditions:** Document whether a failed run recreates/discards partial output, appends with deduplication, or resumes under an approved scheme. Preserve sequence association and a stable input/database snapshot if replay is expected to reproduce bytes.7200 assigns F-TELLER while writing 530-byte records;4310 writes 1500-byte records. No supplied JCL/downstream contract resolves the policy.

**Minimum storage:** Do not introduce a restart table solely because a cursor exists. Retain output record and any required sequence state. Additional deduplication/ownership storage needs a demonstrated recovery design.

**Error and recovery contract:** SQL rollback does not undo already written file records. Failure after WRITE, short file output, close failure and lost job acknowledgement require their own reconciliation policy.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-015-V01 / VM7BD200-C007 | Failure after partial archive WRITE | UNRESOLVED; classified in this guide; G03 |

**Scenarios to exercise:** FAIL-AFTER-WRITE; RECREATE-PARTIAL-OUTPUT; APPEND-DUPLICATE; CHANGED-DATABASE-BETWEEN-RERUNS; OUTPUT-SEQUENCE-IDENTITY.

**Counterexamples and limits:** Read-only SQL does not mean no external effects; A successful database CLOSE cannot certify a completed output file.

**Source evidence:** `IDMS Programs/VM7BD200.cbl` physical L192–220; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L585–587; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L874–889.

**Question versions / production gaps:** [Q-000007](../_audit/questions/Q-000007.md), [Q-000038](../_audit/questions/Q-000038.md), [Q-000039](../_audit/questions/Q-000039.md)

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
| RULE-017-V02 / VM4BD310-C007 | Build one 1500-byte output for valid mutation | UNRESOLVED; classified in this guide; G03 |
| RULE-017-V03 / VM4BD420-C007 | Date parameter conversion and each successful output | PRESERVED_VISIBLE_LAYOUT; cross-category technical example; G01 |
| RULE-017-V04 / VM7BD200-C005 | Every selected form | UNRESOLVED; classified in this guide; G03 |

**Scenarios to exercise:** EXACT-FILE-LENGTH; ACTIVE-OVERLAY; ARRAY-MIN/MAX; LEADING-ZEROS/SIGNS; RAW-FILLER-BYTES; CALL-RETURN-LENGTH.

**Counterexamples and limits:** 257 REDEFINES are not 257 new buffers; Two aliased OCCURS15 declarations do not make 30 independent entries; Named-field equality does not prove archive byte identity.

**Source evidence:** `IDMS Programs/VM4BD302.cbl` physical L73–79; `IDMS Programs/VM4BD302.cbl` physical L323–337; `DB2 Manual converted Programs/VMDZ4302.txt` physical L51–58; `DB2 Manual converted Programs/VMDZ4302.txt` physical L453–467; `Copybook/VM9BC50I.cpy` physical L19–58; additional hash-bound ranges in the case ledger.

**Question versions / production gaps:** [Q-000003](../_audit/questions/Q-000003.md), [Q-000005](../_audit/questions/Q-000005.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000017](../_audit/questions/Q-000017.md), [Q-000019](../_audit/questions/Q-000019.md), [Q-000024](../_audit/questions/Q-000024.md), [Q-000026](../_audit/questions/Q-000026.md), [Q-000037](../_audit/questions/Q-000037.md)

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

### RULE-021 — Expand the selected LR path and retain custom status distinctions

**Phase 2 conditional rule and scenario revision:** For 310, Q-000022 requires parent missing, empty child set and nonempty-but-no-0092 to remain distinguishable and fatal. Q-000035 supplies only assumed nonreturn. The delivered two-SELECT implementation still merges the latter two diagnostics, so the requirement exposes an implementation issue rather than closing it. Q-000037's hypothetical view/key contract does not recover the lost distinction. For 7200, keep only selected-path row/area-end outcomes and do not import custom statuses from unused parent or ERASE paths.

**Exact scoped answer dependencies:** [Q-000022](../_audit/questions/Q-000022.md) [VM4BD310.cbl; PROVIDED]; [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]; [Q-000037](../_audit/questions/Q-000037.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. Full answer hashes and origin are in section 7.

**Six-program source recheck:** VM1BD526.cbl = U; VM1BD567.cbl = N; VM4BD302.cbl = N; VM4BD310.cbl = U; VM4BD420.cbl = N; VM7BD200.cbl = S. The legend and complete matrix are in section 6; no synthetic answer upgrades the production disposition.

**Applies when:** An executed LRF request is present:4310 ALL-VMBEVEF-BY-VMBEFF or 7200 SWEEP-VMBFAS.526’s analogous paths are detailed inG04.

**Source-derived migration behavior and production conditions:** 4310: parent CALC0326=>VMBEFF-NOT-FND; empty set=>NO-VMBEVEF-FND; child 0307=>NO-MORE-VMBEVEF; valid child 0000 proceeds until 0092. All absent/no-match cases abort in the source, though diagnostics differ. Target parent SELECT and filtered child singleton collapse some statuses to+100.7200 SWEEP uses OBTAIN EACH VMBFAS WITHIN AR-VMBFRM1,0307=>VMBFAS-EOA; no VMBSIAS lookup. LR CURRENCY NO RESET is relevant only to a request that reuses it.

**Minimum storage:** Track valid component data on each return; no row buffer is valid merely because part of an LR exists. Separate parent/child groups or existing input key can preserve OF LR request values. Do not import unused selectors into execution.

**Error and recovery contract:** Parent missing, empty child set and all children filtered are distinct scenarios even if the current terminal action is the same. A flattened query must preserve approved diagnostic/business distinctions or record their loss.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-021-V01 / VM4BD310-C002 | Product 1002 and input stock/sequence | PARTIALLY_PRESERVED; classified in this guide; G03 |
| RULE-021-V02 / VM7BD200-C002 | Keyword SWEEP-VMBFAS | PRESERVED_FOR_VISIBLE_PATH; classified in this guide; G03 |

**Scenarios to exercise:** MISSING-PARENT; EMPTY-CHILD-SET; FILTER-NO-MATCH; ONE/MANY-QUALIFIERS; AREA-EMPTY; AREA-EOA; UNUSED-PATH-EXCLUDED.

**Counterexamples and limits:** A generic SQL+100 mapping cannot automatically represent every LR return; Schema ERASE paths do not make a retrieval program an updater.

**Source evidence:** `IDMS Programs/VM4BD310.cbl` physical L181–208; `Schema/VMBTS07.txt` physical L124–136; `DB2 Manual converted Programs/VMDZ4310.txt` physical L217–347; `IDMS Programs/VM7BD200.cbl` physical L179–179; `IDMS Programs/VM7BD200.cbl` physical L203–203; additional hash-bound ranges in the case ledger.

**Question versions / production gaps:** [Q-000022](../_audit/questions/Q-000022.md), [Q-000035](../_audit/questions/Q-000035.md), [Q-000037](../_audit/questions/Q-000037.md)

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
| RULE-022-V03 / VM4BD310-C005 | Found event decoded for output | CONFLICT; classified in this guide; G03 |
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
| RULE-023-V03 / VM4BD310-C008 | Sequential dates/split keys/diagnostics | PARTIALLY_PRESERVED; classified in this guide; G03 |
| RULE-023-V04 / VM4BD420-C006 | Existing WS-STATUS already represents D | PARTIAL; cross-category technical example; G01 |
| RULE-023-V05 / VM7BD200-C008 | Eight date conversions and cutoff | PARTIALLY_PRESERVED; classified in this guide; G03 |

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
| RULE-025-V03 / VM4BD310-C003 | Two or more event 0092 children possible | UNRESOLVED; classified in this guide; G03 |
| RULE-025-V04 / VM7BD200-C006 | Multiple eligible forms | UNRESOLVED; classified in this guide; G03 |

**Scenarios to exercise:** TWO-QUALIFYING-EVENTS; EQUAL-TRANSFER-DATES; REPEATED-CREATION; D-AT-DIFFERENT-POSITION; REVERSED-LOAD-ORDER; ARCHIVE-SEQUENCE.

**Counterexamples and limits:** Greatest surrogate does not prove legacy first; Absence of ORDER BY does not establish a stable order; Adding ORDER BY date can change a last-encounter rule.

**Source evidence:** `IDMS Programs/VM1BD526.cbl` physical L197–212; `Schema/VMBTS07.txt` physical L124–136; `DB2 Manual converted Programs/VMDZ1526.txt` physical L575–601; `IDMS Programs/VM4BD302.cbl` physical L300–315; `DB2 Manual converted Programs/VMDZ4302.txt` physical L244–244; additional hash-bound ranges in the case ledger.

**Question versions / production gaps:** [Q-000008](../_audit/questions/Q-000008.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000016](../_audit/questions/Q-000016.md), [Q-000017](../_audit/questions/Q-000017.md), [Q-000018](../_audit/questions/Q-000018.md), [Q-000023](../_audit/questions/Q-000023.md), [Q-000035](../_audit/questions/Q-000035.md), [Q-000036](../_audit/questions/Q-000036.md), [Q-000037](../_audit/questions/Q-000037.md)

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
| RULE-031-V01 / VM4BD310-C001 | Open batch and close after input EOF | UNRESOLVED; classified in this guide; G03 |
| RULE-031-V02 / VM7BD200-C001 | Start archive extract | UNRESOLVED; classified in this guide; G03 |

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

### VM4BD310-C001 — Runtime services and normal read-only effect

**Phase 2 rehearsal assessment (CONDITIONAL_FATAL_EXIT_ONLY):** With that fixture, a designated lookup failure cannot fall through into output processing. It does not establish Db2 attachment, effective IDMS generated services or real cleanup. The visible program remains retrieval-only with external file writes.

**Case-specific test condition:** Q-000035 assumes SQLERROR preserves the producing diagnostics, rolls back uncommitted Db2 work and never returns; USERABEN also never returns.

**Revised scenario conditions / expected checks:**

- Inject a parent SQL error before any output and another after earlier file writes. The hypothetical handler must stop the current record; earlier file records still require the separate replay policy.

**Production finding retained:** Missing runtime members, precompile/bind settings and actual termination/cleanup behavior remain unresolved under Q-000012 and Q-000035.

**Applied answer versions:** [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM4BD310.cbl](../programs/VM4BD310.cbl__migration.md) · **Rule/variant:** RULE-031, RULE-031-V01 · **Source assessment:** `UNRESOLVED`.

**Condition:** Open batch and close after input EOF

**Original behavior:** BIND/READY retrieval and FINISH with IDMS status routines

**Delivered Db2 behavior:** Db 2 SELECTs plus file open/close; no explicit transaction SQL

**Evidence:** `IDMS Programs/VM4BD310.cbl` physical L137–163; `DB2 Manual converted Programs/VMDZ4310.txt` physical L185–205.

**Question versions / production gaps:** [Q-000035](../_audit/questions/Q-000035.md)

### VM4BD310-C002 — LRF parent and child outcomes

**Phase 2 rehearsal assessment (CONTRADICTS_TEST_DIAGNOSTIC_POLICY):** The parent SELECT +100 is distinct from event SELECT +100. The latter still merges empty child set with filtered-out children, so fatal termination can match the fixture while business diagnosis does not. No synthetic answer adds the absent existence discrimination.

**Case-specific test condition:** Q-000022 requires missing parent, empty child set and a nonempty set without event 0092 to remain three distinguishable fatal outcomes. Q-000035 assumes fatal nonreturn; Q-000037 supplies only hypothetical unfiltered views and logical uniqueness.

**Revised scenario conditions / expected checks:**

- Compare three fixtures: no parent; parent with zero children; parent with children whose event code is not 0092. The current target exposes only two no-data operation paths.

**Production finding retained:** Actual view/schema constraints and handlers are missing. A separate child-existence test or a real approved merged-outcome policy would be needed; the present test policy expressly rejects merging.

**Applied answer versions:** [Q-000022](../_audit/questions/Q-000022.md) [VM4BD310.cbl; PROVIDED]; [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]; [Q-000037](../_audit/questions/Q-000037.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM4BD310.cbl](../programs/VM4BD310.cbl__migration.md) · **Rule/variant:** RULE-021, RULE-021-V01 · **Source assessment:** `PARTIALLY_PRESERVED`.

**Condition:** Product 1002 and input stock/sequence

**Original behavior:** Parent CALC, empty child set, each child with custom statuses

**Delivered Db2 behavior:** Separate parent SELECT and filtered child SELECT; +100 on both but different operation

**Evidence:** `IDMS Programs/VM4BD310.cbl` physical L181–208; `Schema/VMBTS07.txt` physical L124–136; `DB2 Manual converted Programs/VMDZ4310.txt` physical L217–347.

**Question versions / production gaps:** [Q-000022](../_audit/questions/Q-000022.md), [Q-000035](../_audit/questions/Q-000035.md), [Q-000037](../_audit/questions/Q-000037.md)

### VM4BD310-C003 — First matching event order

**Phase 2 rehearsal assessment (ORDER_EQUIVALENCE_STILL_UNRESOLVED):** DESC/FETCH FIRST continues to select greatest NR_ID, not an evidenced legacy encounter position. A one-match fixture is conditionally equivalent; two matches in reverse encounter/ID order produce a counterexample. The unrelated 526 greatest-ID test policy is not applied here.

**Case-specific test condition:** Q-000023 explicitly retains the original first event 0092 in set traversal. Q-000037 assumes logical key uniqueness but does not define legacy set order or the relationship between loaded surrogate IDs and that order.

**Revised scenario conditions / expected checks:**

- Take legacy encounter order [event A with ID 10, event B with ID 20], both 0092 and different form keys. Legacy selects A while target selects B; actual production feasibility requires the missing order evidence.

**Production finding retained:** Need base set order, migrated ID/order evidence and the actual business selection contract. Do not mark all multi-event cases preserved.

**Applied answer versions:** [Q-000023](../_audit/questions/Q-000023.md) [VM4BD310.cbl; PROVIDED]; [Q-000037](../_audit/questions/Q-000037.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM4BD310.cbl](../programs/VM4BD310.cbl__migration.md) · **Rule/variant:** RULE-025, RULE-025-V03 · **Source assessment:** `UNRESOLVED`.

**Condition:** Two or more event 0092 children possible

**Original behavior:** First 0092 in IDMS set traversal

**Delivered Db2 behavior:** Highest NR_ID among event 0092 through DESC FETCH FIRST

**Evidence:** `IDMS Programs/VM4BD310.cbl` physical L200–208; `DB2 Manual converted Programs/VMDZ4310.txt` physical L301–321; `Schema/VMBTS07.txt` physical L133–135.

**Question versions / production gaps:** [Q-000023](../_audit/questions/Q-000023.md), [Q-000037](../_audit/questions/Q-000037.md)

### VM4BD310-C004 — Capital versus interest output

**Phase 2 rehearsal assessment (DEFECT_RETAINED):** For NX_CPCRESK=0 and nonzero AM_CNDSTK, INITIALIZE followed by the current projection leaves the consumed amount zero. The interest branch has its selected host. The fixture strengthens the expected result but cannot repair the missing column or duplicate coupon-rank projection.

**Case-specific test condition:** Q-000013 requires the original capital amount. Q-000026 assumes the legacy 1500-byte output layout only as a test interface; it does not provide VMDZ510I.

**Revised scenario conditions / expected checks:**

- For capital 123.45 and rank 0, expect 123.45 but source def-use predicts zero. With nonzero rank and interest 56.78, the visible interest host is populated. These are static expectations, not executed COBOL.

**Production finding retained:** The projection defect needs a separately authorized source repair and executable validation; missing output copybook and real consumer/layout proof remain open.

**Applied answer versions:** [Q-000013](../_audit/questions/Q-000013.md) [VM4BD310.cbl; PROVIDED]; [Q-000026](../_audit/questions/Q-000026.md) [VM4BD310.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM4BD310.cbl](../programs/VM4BD310.cbl__migration.md) · **Rule/variant:** RULE-002, RULE-002-V01 · **Source assessment:** `DEFECT`.

**Condition:** NX-CPCRE=0 versus nonzero

**Original behavior:** Copy AM-CND-STOCK if zero; otherwise AM-INTER-STOCK

**Delivered Db2 behavior:** AM-CNDSTK omitted from SELECT; zero-initialized host copied

**Evidence:** `IDMS Programs/VM4BD310.cbl` physical L247–253; `DB2 Manual converted Programs/VMDZ4310.txt` physical L219–263; `DB2 Manual converted Programs/VMDZ4310.txt` physical L393–399.

**Question versions / production gaps:** [Q-000013](../_audit/questions/Q-000013.md), [Q-000026](../_audit/questions/Q-000026.md)

### VM4BD310-C005 — Event key and split identifiers

**Phase 2 rehearsal assessment (CONDITIONAL_FORMAT_ONLY):** Under those exact fixture widths the 28-byte DCLGEN key can populate the existing 30-byte group with two padding bytes, and its components can be traced to output. The original CHAR(20) CSV conflict and packed-to-display conversion remain recorded. Subtype 000 still yields MU; nonzero subtypes still reject.

**Case-specific test condition:** Q-000017 assumes 28 display digits in widths 8+8+6+3+3, leading zero retention and nonnegative operation codes. Q-000026 assumes the old output layout only for a test scenario.

**Revised scenario conditions / expected checks:**

- Use leading-zero client/date/document components and operation codes 000, 001 and 999. Confirm the first is the only accepted subtype and that rejection occurs before output; compare real byte layouts when supplied.

**Production finding retained:** The real loader/consumer contract, signed/value domains and missing target layout are unverified. Do not apply the 28-digit assumption to arbitrary fields or normalize the CSV globally.

**Applied answer versions:** [Q-000017](../_audit/questions/Q-000017.md) [VM1BD526.cbl, VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl; PROVIDED]; [Q-000026](../_audit/questions/Q-000026.md) [VM4BD310.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM4BD310.cbl](../programs/VM4BD310.cbl__migration.md) · **Rule/variant:** RULE-022, RULE-022-V03 · **Source assessment:** `CONFLICT`.

**Condition:** Found event decoded for output

**Original behavior:** 20-byte packed key; 6-byte CI; stock 13, issue 9

**Delivered Db2 behavior:** 28 display digit key in 30 group; split DCLGEN columns reconstructed

**Evidence:** `IDMS Programs/VM4BD310.cbl` physical L73–89; `IDMS Programs/VM4BD310.cbl` physical L217–245; `DB2 Manual converted Programs/VMDZ4310.txt` physical L63–91; `DB2 Manual converted Programs/VMDZ4310.txt` physical L353–392; `Dclgens/DZEVEFTV.txt` physical L19–42.

**Question versions / production gaps:** [Q-000017](../_audit/questions/Q-000017.md), [Q-000026](../_audit/questions/Q-000026.md)

### VM4BD310-C006 — Date restoration

**Phase 2 rehearsal assessment (CONDITIONAL_DATE_TRANSLATION):** The two visible conversion sequences restore zero/high sentinels or reorder day/month/year to YYYYMMDD under the EUR fixture. This removes ambiguity for the rehearsal scenario only. An ISO-formatted host remains a deliberate out-of-contract counterexample.

**Case-specific test condition:** Q-000014 assumes EUR dd.mm.yyyy output and the approved test sentinel pairs 00000000/0001-01-01 and 99999999/9999-12-31.

**Revised scenario conditions / expected checks:**

- Reason through 01.01.0001, 31.12.9999 and 29.02.2024, then use 2024-02-29 as a negative-format case. No date SQL or COBOL conversion was executed.

**Production finding retained:** Actual preparation/subsystem settings and converted data have not been supplied; sentinel use must remain field-specific. No environment setting is inferred from DCLGEN X(10).

**Applied answer versions:** [Q-000014](../_audit/questions/Q-000014.md) [VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl, VM7BD200.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM4BD310.cbl](../programs/VM4BD310.cbl__migration.md) · **Rule/variant:** RULE-012, RULE-012-V01 · **Source assessment:** `UNRESOLVED`.

**Condition:** DB2 DATE hosts populated

**Original behavior:** Direct legacy YYYYMMDD

**Delivered Db2 behavior:** EUR parse; 0001→zero, 9999-12-31→99999999

**Evidence:** `IDMS Programs/VM4BD310.cbl` physical L258–263; `DB2 Manual converted Programs/VMDZ4310.txt` physical L404–433.

**Question versions / production gaps:** [Q-000014](../_audit/questions/Q-000014.md)

### VM4BD310-C007 — Output overlays, arrays and retained business values

**Phase 2 rehearsal assessment (CONDITIONAL_LAYOUT_AND_EXTERNAL_REPLAY):** The fixture supports reasoning about one 15-date area, its aliases and the 1500-byte record. It does not supply the actual copybook. Discard/recreate avoids retaining a partial file only if the external job enforces it. Immutable input alone does not freeze the database read by the two SELECTs.

**Case-specific test condition:** Q-000026 conditionally preserves the supplied VMBD510I layout under the target top-level name. Q-000019 says discard partial output and rerun immutable input.

**Revised scenario conditions / expected checks:**

- Fail after an output WRITE, discard the partial file, then replay the same input. Compare both a stable database and a changed event/parent snapshot; only the former is a candidate for equal business output.

**Production finding retained:** Need actual VMDZ510I, file disposition/publication controls and a database-consistency decision. A changed database can change replayed output even with byte-identical input.

**Applied answer versions:** [Q-000019](../_audit/questions/Q-000019.md) [VM4BD310.cbl; PROVIDED]; [Q-000026](../_audit/questions/Q-000026.md) [VM4BD310.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM4BD310.cbl](../programs/VM4BD310.cbl__migration.md) · **Rule/variant:** RULE-017, RULE-017-V02 · **Source assessment:** `UNRESOLVED`.

**Condition:** Build one 1500-byte output for valid mutation

**Original behavior:** VMBD510I initialized; typed moves; 15-date array and 257 overlays retained by COPY

**Delivered Db2 behavior:** Missing VMDZ510I; unchanged visible business constants/old CI/sequence

**Evidence:** `IDMS Programs/VM4BD310.cbl` physical L213–318; `DB2 Manual converted Programs/VMDZ4310.txt` physical L353–481; `Copybook/VMBD510I.cpy` physical L1460–1481.

**Question versions / production gaps:** [Q-000019](../_audit/questions/Q-000019.md), [Q-000026](../_audit/questions/Q-000026.md)

### VM4BD310-C008 — Minimal helper state

**Phase 2 rehearsal assessment (REMOVAL_PROPOSALS_NOT_APPLIED):** The two immediate per-date copies and two unused date groups remain removable candidates in the visible body. Direct key/output slicing can be considered for the assumed layout after numeric-domain checks. Optional timestamp/input counters are not mandatory migration state; SQLERRWS expansion remains unknown.

**Case-specific test condition:** Q-000026 makes old-layout field reuse a hypothetical interface assumption. Q-000035 supplies the nonreturning error fixture but no diagnostic declarations.

**Revised scenario conditions / expected checks:**

- Trace each proposed receiving item through all writes and reads; retain the selected event key until output is complete and preserve diagnostics before termination. No helper-removal code was applied or compiled.

**Production finding retained:** Do not remove typed numeric conversion, live key components or unknown include fields. Missing actual target layout/compiler/runtime prevents accepting a production rewrite.

**Applied answer versions:** [Q-000026](../_audit/questions/Q-000026.md) [VM4BD310.cbl; PROVIDED]; [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM4BD310.cbl](../programs/VM4BD310.cbl__migration.md) · **Rule/variant:** RULE-023, RULE-023-V03 · **Source assessment:** `PARTIALLY_PRESERVED`.

**Condition:** Sequential dates/split keys/diagnostics

**Original behavior:** Existing business groups

**Delivered Db2 behavior:** New helpers, unused date groups, optional input count/timestamp

**Evidence:** `DB2 Manual converted Programs/VMDZ4310.txt` physical L55–145; `DB2 Manual converted Programs/VMDZ4310.txt` physical L353–433; `DB2 Manual converted Programs/VMDZ4310.txt` physical L497–507.

**Question versions / production gaps:** [Q-000026](../_audit/questions/Q-000026.md), [Q-000035](../_audit/questions/Q-000035.md)

### VM7BD200-C001 — Runtime services and selected path effects

**Phase 2 rehearsal assessment (CONDITIONAL_RUNTIME_EXIT_ONLY):** Under the fixture, empty archive control input or an OPEN/FETCH/CLOSE failure stops further processing. Normal selected LRF access and target SQL remain retrieval-only. Fatal Db2 handling does not undo previous file writes or establish missing attachment behavior.

**Case-specific test condition:** Q-000035 assumes fatal nonreturn for designated unexpected SQL results and USERABEN.

**Revised scenario conditions / expected checks:**

- Distinguish empty DAARCH control input, which calls USERABEN, from an empty eligible database set, which reaches normal FETCH +100 with no archive WRITE.

**Production finding retained:** Actual error/abort members, generated controls, JCL and preparation options are still missing under Q-000012/Q-000035.

**Applied answer versions:** [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM7BD200.cbl](../programs/VM7BD200.cbl__migration.md) · **Rule/variant:** RULE-031, RULE-031-V02 · **Source assessment:** `UNRESOLVED`.

**Condition:** Start archive extract

**Original behavior:** BIND RUN/BIND VMBFAS/READY retrieval; FINISH

**Delivered Db2 behavior:** OPEN/CLOSE cursor, no normal Db 2 writes

**Evidence:** `IDMS Programs/VM7BD200.cbl` physical L174–179; `IDMS Programs/VM7BD200.cbl` physical L210–222; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L429–440; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L559–587.

**Question versions / production gaps:** [Q-000035](../_audit/questions/Q-000035.md)

### VM7BD200-C002 — LRF area sweep without parent join

**Phase 2 rehearsal assessment (PRESERVED_SELECTED_PATH_WITH_FIXTURE_DDL):** SWEEP-VMBFAS expands to OBTAIN EACH VMBFAS in the area. No VMBSIAS lookup is added. The same forms can be considered for the target cursor under the hypothetical view scope and separately scoped date policy. This path conclusion is source-derived, not human-confirmed.

**Case-specific test condition:** Q-000037 assumes the relevant view is an unfiltered projection with the supplied column declarations; it does not alter the selected LR keyword.

**Revised scenario conditions / expected checks:**

- Include an eligible form without a related parent row in a hypothetical fixture: the selected legacy path does not request a parent, so adding an INNER JOIN would incorrectly exclude that form.

**Production finding retained:** Actual DZBFASTV definition and load/cutoff conversion remain missing. Presence of VMBSIAS among LR components does not authorize a join, rejection or decommission inference.

**Applied answer versions:** [Q-000037](../_audit/questions/Q-000037.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM7BD200.cbl](../programs/VM7BD200.cbl__migration.md) · **Rule/variant:** RULE-021, RULE-021-V02 · **Source assessment:** `PRESERVED_FOR_VISIBLE_PATH`.

**Condition:** Keyword SWEEP-VMBFAS

**Original behavior:** OBTAIN EACH VMBFAS area; custom VMBFAS-EOA

**Delivered Db2 behavior:** One view cursor; no VMBSIAS JOIN

**Evidence:** `IDMS Programs/VM7BD200.cbl` physical L179–179; `IDMS Programs/VM7BD200.cbl` physical L203–203; `Schema/VMBTS03.txt` physical L86–110; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L280–374.

**Question versions / production gaps:** [Q-000037](../_audit/questions/Q-000037.md)

### VM7BD200-C003 — Cursor EOF and parameter lifetime

**Phase 2 rehearsal assessment (CONDITIONAL_CURSOR_FAILURE_EXIT):** The visible OPEN 0, FETCH 0/process, FETCH +100/stop and CLOSE sequence remains coherent under the fixture. Clearing result hosts before FETCH does not change the cutoff already bound at OPEN. A reopen would require restoring cutoff inputs. The EOC flag is a convention, not proof of an external recovery protocol.

**Case-specific test condition:** Q-000035 assumes unexpected cursor failures do not return. Corrected Q-000025 assumes only the 20-byte archive-parameter input layout for the test.

**Revised scenario conditions / expected checks:**

- Exercise the reasoning cases OPEN failure, first FETCH +100, one successful row then +100, and unexpected FETCH/CLOSE result. Only successful FETCH may format and write an archive record.

**Production finding retained:** Actual VMDZ270I, handler behavior and OPEN diagnostic context are missing. SQLCODE 0 warnings remain outside the shown tests; the fixture does not manufacture SQLWARN handling.

**Applied answer versions:** [Q-000025](../_audit/questions/Q-000025.md) [VM7BD200.cbl; PROVIDED]; [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM7BD200.cbl](../programs/VM7BD200.cbl__migration.md) · **Rule/variant:** RULE-011, RULE-011-V01 · **Source assessment:** `PARTIALLY_PRESERVED`.

**Condition:** Opened once with archive cutoff

**Original behavior:** FIRST/NEXT until VMBFAS-EOA

**Delivered Db2 behavior:** OPEN 0/FETCH 0 process/FETCH 100 stop/CLOSE; hosts reused after OPEN

**Evidence:** `IDMS Programs/VM7BD200.cbl` physical L138–140; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L416–556; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L583–587.

**Question versions / production gaps:** [Q-000025](../_audit/questions/Q-000025.md), [Q-000035](../_audit/questions/Q-000035.md)

### VM7BD200-C004 — Archive date filter pushdown

**Phase 2 rehearsal assessment (CONDITIONAL_PREDICATE_MATCH):** Accounting date controls when it is not the minimum sentinel; creation date controls only when accounting is the sentinel. Both comparisons stay strictly less than the input archive cutoff. The cutoff is read from DAARCH, not derived from the linkage/system-date branch.

**Case-specific test condition:** Q-000006 and Q-000014 define only the test zero/high sentinel pairs and EUR returned DATE format; corrected Q-000025 assumes the supplied 20-byte control input fields.

**Revised scenario conditions / expected checks:**

- Test before/equal/after cutoff for a nonzero accounting date, then the same creation-date cases with accounting zero. Equality remains excluded; changing the fallback to OR without its accounting condition would be incorrect.

**Production finding retained:** Real VMDZ270I, load conversion and effective DATE output setting remain unverified. An actual historical minimum date cannot be silently treated as absent without the business contract.

**Applied answer versions:** [Q-000006](../_audit/questions/Q-000006.md) [VM7BD200.cbl; PROVIDED]; [Q-000014](../_audit/questions/Q-000014.md) [VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl, VM7BD200.cbl; PROVIDED]; [Q-000025](../_audit/questions/Q-000025.md) [VM7BD200.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM7BD200.cbl](../programs/VM7BD200.cbl__migration.md) · **Rule/variant:** RULE-012, RULE-012-V02 · **Source assessment:** `UNRESOLVED`.

**Condition:** Nonzero accounting date else creation date; strictly before cutoff

**Original behavior:** COBOL OR of 2 AND branches

**Delivered Db2 behavior:** WHERE same predicate using DATE zero-sentinel 0001-01-01

**Evidence:** `IDMS Programs/VM7BD200.cbl` physical L188–191; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L366–370; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L417–423.

**Question versions / production gaps:** [Q-000006](../_audit/questions/Q-000006.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000025](../_audit/questions/Q-000025.md)

### VM7BD200-C005 — Binary archive image reconstruction

**Phase 2 rehearsal assessment (BYTE_FIDELITY_UNRESOLVED):** The 84 projection/host pairs and 432+46+52=530 length arithmetic remain supported static checks. They do not establish original filler byte equivalence. The corrected mapping spelling is a local documented exception; it does not authorize blanking legacy packed/filler content or rewriting all mapping names.

**Case-specific test condition:** Q-000005 requires compatibility of named fields and filler bytes. Q-000024 chooses the exact RA_BASFMAS_479BFAS spelling for the test. Q-000037 assumes only view scope/types.

**Revised scenario conditions / expected checks:**

- Compare a legacy record whose filler includes packed-zero bytes with target spaces; equal length and equal named business values are insufficient. Preserve the mismatch as an unresolved output obligation.

**Production finding retained:** Original generated record bytes, output-consumer specification and real row reconciliation remain missing. Corrected Q-000025 concerns the input parameter record and cannot resolve this output contract.

**Applied answer versions:** [Q-000005](../_audit/questions/Q-000005.md) [VM7BD200.cbl; PROVIDED]; [Q-000024](../_audit/questions/Q-000024.md) [VM7BD200.cbl; PROVIDED]; [Q-000037](../_audit/questions/Q-000037.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM7BD200.cbl](../programs/VM7BD200.cbl__migration.md) · **Rule/variant:** RULE-017, RULE-017-V04 · **Source assessment:** `UNRESOLVED`.

**Condition:** Every selected form

**Original behavior:** Raw VMBFAS group MOVE to 478 bytes; 530 output

**Delivered Db2 behavior:** 84 column FETCH; 432-byte reconstruction+46 pad+52 trailer

**Evidence:** `IDMS Programs/VM7BD200.cbl` physical L87–94; `IDMS Programs/VM7BD200.cbl` physical L192–200; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L75–198; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L589–879.

**Question versions / production gaps:** [Q-000005](../_audit/questions/Q-000005.md), [Q-000024](../_audit/questions/Q-000024.md), [Q-000037](../_audit/questions/Q-000037.md)

### VM7BD200-C006 — Archive ordering and counter

**Phase 2 rehearsal assessment (TEST_POLICY_ACCEPTS_ORDER_CHANGE_WITH_LIMITS):** The rehearsal may compare the eligible business row set independently of counter-to-form association, then separately check counter continuity. It does not prove IDMS area order equals NR_ID ASC. Counter overflow, failed/repeated runs and downstream reliance on a particular ordinal are outside this assumed acceptance.

**Case-specific test condition:** Q-000008 allows order to be immaterial only in the isolated test, while requiring F-TELLER to be unique and contiguous within one extract.

**Revised scenario conditions / expected checks:**

- For two eligible forms encountered in reverse legacy/surrogate order, accept the same business row set only under Q-000008, and require counters 1 and 2 once each. Do not demand the same ordinal/form pairing for this fixture.

**Production finding retained:** Actual downstream order/sequence policy, data scope and reconciliation are still required. Retain the source order change and production question.

**Applied answer versions:** [Q-000008](../_audit/questions/Q-000008.md) [VM7BD200.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM7BD200.cbl](../programs/VM7BD200.cbl__migration.md) · **Rule/variant:** RULE-025, RULE-025-V04 · **Source assessment:** `UNRESOLVED`.

**Condition:** Multiple eligible forms

**Original behavior:** IDMS area order associates counter to forms

**Delivered Db2 behavior:** ORDER BY surrogate ID ASC; counter per fetch

**Evidence:** `IDMS Programs/VM7BD200.cbl` physical L192–200; `Schema/VMBTS03.txt` physical L90–92; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L371–371; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L597–598.

**Question versions / production gaps:** [Q-000008](../_audit/questions/Q-000008.md)

### VM7BD200-C007 — External file recovery

**Phase 2 rehearsal assessment (EXTERNAL_RECOVERY_ASSUMED):** The fixture uses whole-extract replay, not a new checkpoint or cursor-resume protocol. The transient WS-TELLER restarts with the extract. A successful recreation can be compared to that frozen snapshot, but only the external job can discard and control publication of a partial file.

**Case-specific test condition:** Q-000007 assumes partial output is discarded and recreated from a frozen database read snapshot.

**Revised scenario conditions / expected checks:**

- Fail before the first WRITE, after an interior WRITE and near normal close. Discard each partial result, recreate from the same frozen row set and publish only through the separately implemented job contract.

**Production finding retained:** No JCL, scheduler, publication gate, real snapshot facility or recovery execution is supplied. Db2 rollback cannot be asserted to remove already written sequential-file records.

**Applied answer versions:** [Q-000007](../_audit/questions/Q-000007.md) [VM7BD200.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM7BD200.cbl](../programs/VM7BD200.cbl__migration.md) · **Rule/variant:** RULE-015, RULE-015-V01 · **Source assessment:** `UNRESOLVED`.

**Condition:** Failure after partial archive WRITE

**Original behavior:** No persisted checkpoint; file output external

**Delivered Db2 behavior:** No Db 2 checkpoint/restart despite extract writes

**Evidence:** `IDMS Programs/VM7BD200.cbl` physical L192–220; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L585–587; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L874–889.

**Question versions / production gaps:** [Q-000007](../_audit/questions/Q-000007.md)

### VM7BD200-C008 — Helper minimization with packed conversion

**Phase 2 rehearsal assessment (TYPED_CONVERSION_REQUIRED):** Eight per-date buffers can be evaluated for reuse of one existing conversion area. The creation-date receiving field is COMP-3, so its elementary alphanumeric-to-numeric conversion remains essential. A reference-modified eight-digit source is a proposed no-new-buffer option; a raw group MOVE is not equivalent. Numeric WS-DA-ARCH-YMD holding dotted text remains an unnecessary category mismatch.

**Case-specific test condition:** Q-000014 fixes the test DATE representation; Q-000035 defines the nonreturning error fixture without supplying the actual includes.

**Revised scenario conditions / expected checks:**

- For zero, high and ordinary eight-digit dates, compare the proposed elementary numeric transfer to the current X(8)-to-COMP-3 transfer. Also demonstrate why copying the group bytes directly would not be an acceptable packed representation.

**Production finding retained:** No compiler or byte-image tests were performed. Keep unknown diagnostic includes and the actual input-copybook gap unresolved; no helper was removed from source.

**Applied answer versions:** [Q-000014](../_audit/questions/Q-000014.md) [VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl, VM7BD200.cbl; PROVIDED]; [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM7BD200.cbl](../programs/VM7BD200.cbl__migration.md) · **Rule/variant:** RULE-023, RULE-023-V05 · **Source assessment:** `PARTIALLY_PRESERVED`.

**Condition:** Eight date conversions and cutoff

**Original behavior:** Existing packed creation date and display dates

**Delivered Db2 behavior:** 8 redundant per date buffers/template blocks; one packed date conversion exception

**Evidence:** `DB2 Manual converted Programs/VMDZ7200.cbl` physical L54–74; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L202–271; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L603–616; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L625–855.

**Question versions / production gaps:** [Q-000014](../_audit/questions/Q-000014.md), [Q-000035](../_audit/questions/Q-000035.md)

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
| LR status partition | Missing parent; empty set; nonempty/no 0092; one/many qualifiers; empty area. | Preserve valid-component state and approved distinct diagnostics; do not invent parent checks for SWEEP-VMBFAS. |
| Selected event | Two qualifying events with reversed set and surrogate order. | Establish which child is intended; neither DESC nor FETCH FIRST alone proves legacy-first equivalence. |
| 4310 amount branch | NX_CPCRE = 0 with nonzero capital; nonzero rank with interest; alternating requests. | Capital/interest must originate from the correct successful parent retrieval; current omitted-capital defect remains. |
| Archive predicate | Accounting before/equal/after cutoff; zero accounting and creation alternatives. | Strict less-than and approved fallback survive loading/sentinel conversion. |
| Archive/interface bytes | Packed creation date, filler binary content, all 15 mutation date occurrences, whole output lengths. | Check actual bytes and active aliases, not only named values or static length arithmetic. |
| Cursor/output failures | Initial OPEN error, FETCH error, EOF, CLOSE failure, partial file, reopen after host initialization. | Original diagnostics and no invalid row; restore parameters on reopen; apply separately approved file recovery. |

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
| [Q-000007](../_audit/questions/Q-000007.md) / PROVIDED | SIMULATED_FOR_TEST | VM7BD200.cbl | `57226ef04f842a3636f8c39fde791eaf29837f18dadb3038329e2b6b3fcda00b` | SIMULATED_FOR_TEST: Discard partial output and recreate it from a frozen read snapshot. Do not claim exactly-once production processing. |
| [Q-000008](../_audit/questions/Q-000008.md) / PROVIDED | SIMULATED_FOR_TEST | VM7BD200.cbl | `4c58fd9a2d5926f7eac0c68f656825e781ce1842ef4af00c315c021cbd31d272` | SIMULATED_FOR_TEST: Order is not business-significant, but F-TELLER must be unique and contiguous within an extract. Retain the production question and require row-set reconciliation. |
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
| [Q-000022](../_audit/questions/Q-000022.md) / PROVIDED | SIMULATED_FOR_TEST | VM4BD310.cbl | `8a370f537c103f78c66f4e28a27d4f87b8e45971143a085f9d804993f04beee3` | SIMULATED_FOR_TEST: All three conditions are fatal and must remain distinguishable. Preserve the observed diagnostic gap as a separate implementation issue. |
| [Q-000023](../_audit/questions/Q-000023.md) / PROVIDED | SIMULATED_FOR_TEST | VM4BD310.cbl | `b07a03b4bd49aac9f10a583f3df3d3e35ae2acd5722b79ec84f15b06e9e033ad` | SIMULATED_FOR_TEST: Preserve the first event 0092 selected by the original set traversal. Treat the highest-ID selection as unverified until its ordering is proved. |
| [Q-000024](../_audit/questions/Q-000024.md) / PROVIDED | SIMULATED_FOR_TEST | VM7BD200.cbl | `2ff78084a1afd9632a15aeffd5576f952cd9fd68c71dc7dea229a05c84492dde` | SIMULATED_FOR_TEST: Accept RA_BASFMAS_479BFAS as the intended spelling while retaining the original CSV bytes and the documented correction. |
| [Q-000025](../_audit/questions/Q-000025.md) / PROVIDED | SIMULATED_FOR_TEST | VM7BD200.cbl | `d8ee3a88f15953763825e49b87cd65e76f8277026d9034fe94336555ae37d1dd` | SIMULATED TEST ASSUMPTION — corrected role: VMDZ270I is the 20-byte archive-parameter INPUT copybook read from DAARCH, not the 530-byte output record. For this rehearsal only, assume the supplied VMBZ270I parameter layout is retained with its level-01 name changed. The actual VMDZ270I member is still missing, so build/layout closure is not established. This answer makes no claim about REC-FORM filler bytes or output-consumer compatibility; those remain under Q-000005. It supersedes the earlier synthetic draft that incorrectly described an output interface. |
| [Q-000026](../_audit/questions/Q-000026.md) / PROVIDED | SIMULATED_FOR_TEST | VM4BD310.cbl | `ce9927b5535de374b86e640e0042dff6b30415c95ff9654fcc6cd2e84b29ce40` | SIMULATED TEST ASSUMPTION: VMDZ510I retains the supplied VMBD510I layout with the top-level name changed. No physical copybook is created or claimed present; byte compatibility and build closure remain unresolved. |
| [Q-000032](../_audit/questions/Q-000032.md) / PROVIDED | SIMULATED_FOR_TEST | VM1BD526.cbl, VM1BD567.cbl | `e597418af19bb6c7916aa3ba63f1483828f2e07acdb8ec894eafdfc16432a406` | For a clearly marked simulated test, define a count-only 15-byte protocol with immutable input; keep the observed 1215-byte initial form as an implementation inconsistency to assess. |
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
