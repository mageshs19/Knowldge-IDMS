# G03 — LRF retrieval

**Phase:** 1 · **Run:** Run-001 · **Assessment:** PARTIAL · **Answer state:** no human or simulated answers consumed.

This is a conditional generic synthesis of the supplied six-program corpus. It contains **21 classified cases** and **14 rule definitions** for this category. Rules shared across categories retain the same RULE IDs; their source variants remain explicitly identified. The complete corpus contains 60 distinct cases and 33 distinct rules.

## 1. Scope and what this sample establishes

This guide covers VM4BD310 → VMDZ4310's selected parent/event LR path, VM7BD200 → VMDZ7200's selected form-area sweep, and the retrieval obligations inside VM1BD526's LRF updater. Each is classified from the executed selector and schema path. Declared LR components and unused schema STORE/MODIFY/ERASE paths are not automatically executed behavior.

Normalize the LR into its effective network operations and custom returns before designing SQL. For 4310, the parent lookup, empty set and filtered exhaustion are distinct source states. For 7200, SWEEP-VMBFAS accesses only VMBFAS; adding a VMBSIAS join would invent a parent precondition. A successful SQL SELECT also does not establish branch output correctness: the delivered 4310 target omits the capital amount that its zero-coupon-rank branch later consumes.

Every recommendation below separates an observed source behavior, an observed target behavior, an unresolved condition and a proposed change. A manually converted program is evidence of a developer's approach; its correctness is not assumed. The reports include a demonstrated missing-field defect, representation conflicts and unresolved operational contracts. All 39 Phase 1 questions remain unanswered.

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

VMDZ7200 reconstructs 432 named bytes plus 46 padding and a 52-byte trailer, yielding 530 bytes. This arithmetic does not prove equivalence to the original whole-record image: target fillers are spaces while the mapping notes packed values in legacy filler areas. Its output counter also binds sequence numbers to a new surrogate ordering. Both byte fidelity and order are distinct consumer questions. [VM7BD200-C005/C006; Q-000005, Q-000008, Q-000025.]

### Archive filtering, host lifetime and helper minimization

7200's qualifying predicate remains strictly before cutoff: use nonzero accounting date, otherwise creation date. The target represents zero with SQL DATE 0001-01-01; the loader/sentinel contract is not supplied. Equal-to-cutoff rows are excluded. OPEN captures current input host values; the subsequent DCLGEN INITIALIZE before FETCH does not erase that opened cursor's cutoff. A later reopen would require restoring it. [VM7BD200-C003/C004; IBM OPEN reference in section 9.]

Eight per-date staging copies and unused template date/timestamp items have removal candidates. The packed creation-date field is the critical exception: direct group MOVE from an eight-character date group would copy bytes rather than perform the required numeric conversion. A proposed no-new-helper alternative uses an elementary validated source such as DA-CCYYMMDD-R(1:8) to the packed field. It remains a source-review proposal requiring the actual compiler and byte tests. Display-date groups can use appropriate direct transfers after their layouts are established. [VM7BD200-C008.]

## 4. Conditional rule catalog

Each rule gives its applicability condition, preserved or changed behavior, minimum-storage reasoning, failure contract, source variants and concrete scenarios. A variant whose originating case belongs to another category is a cross-category technical example, not a reclassification of that program. The actual 33 × 6 rule/program cross-check is [rule-applicability.json](../_audit/rule-applicability.json); its APPLIES_SUPPORTS, APPLIES_VARIANT, APPLIES_CONTRADICTS, UNKNOWN and NOT_APPLICABLE rows are evidence assessments, not automatic production approval.

### RULE-002 — Every branch must receive the exact data it consumes

**Applies when:** Any migration narrows a SELECT, splits a logical record, initializes a host group, or reconstructs a file record. Applies across all four guide categories.

**Migration behavior:** Build branch-specific def-use paths from each output, comparison and update back to a successful retrieval or explicit business assignment. Confirmed 4310 defect: DCLDZBEFFTV is initialized; AM_CNDSTK is absent from the SELECT while NX_CPCRESK is selected twice; the NX_CPCRESK=0 branch therefore emits initialized zero instead of the legacy capital amount. Preserving field names or successful SQL is insufficient. Other projections require the same check without inventing another case.

**Minimum storage:** Add the missing compatible host/output assignment when business policy requires it. A duplicate shadow amount is unnecessary; use the existing DCLGEN amount. INITIALIZE is not a business default. Preserve input hosts until the corresponding query is issued.

**Error and recovery contract:** Never consume stale/initialized result fields after +100 or failure. Wrong branch population is an application defect even when SQLCODE is 0. Keep the observed 4310 discrepancy until corrected code and tests establish behavior.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-002-V01 / VM4BD310-C004 | NX-CPCRE=0 versus nonzero | DEFECT; classified in this guide; G03 |

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

### RULE-011 — Cursor position and SQL outcome belong to the statement that produced them

**Applies when:** Actual cursor scans in 4302/4420/7200. Singleton SELECT with FETCH FIRST 1 and declaration-only cursor flags do not qualify.

**Migration behavior:** OPEN after input hosts are set, FETCH until the operation’s expected +100, consume row data only after 0, and CLOSE every successful open on normal and business early exits.7200 evaluates its date parameters at OPEN; later INITIALIZE of the same DCLGEN before FETCH is compatible with that single open, but reopening requires restoring cutoff hosts. Nested 4302/4420 cursors need independent status while child SQL overwrites SQLCODE.

**Minimum storage:** An EOF flag may disappear only after an immediate FETCH/test/exit restructuring that preserves status ownership. The existing nested paragraph structures justify separate parent/child EOF state. Do not add saved-SQLCODE for every immediate test automatically.

**Error and recovery contract:** OPEN/FETCH/CLOSE failures are distinct; failed OPEN is not empty input and failed CLOSE must not hide an earlier failure. Missing handlers prevent proof of termination and cleanup.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-011-V01 / VM7BD200-C003 | Opened once with archive cutoff | PARTIALLY_PRESERVED; classified in this guide; G03 |

**Scenarios to exercise:** EMPTY-CURSOR; ONE/MANY-ROWS; OPEN-FAIL; FETCH-FAIL; CLOSE-FAIL; NESTED-CHILD-EOF; REOPEN-PARAMETERS; EARLY-BUSINESS-EXIT.

**Counterexamples and limits:** WITH HOLD is not persistent restart position; SQLCODE after child CLOSE cannot describe the parent FETCH; FETCH FIRST 1 is not a cursor FETCH.

**Source evidence:** `IDMS Programs/VM7BD200.cbl` physical L138–140; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L416–556; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L583–587.

**Unanswered dependencies:** [Q-000025](../_audit/questions/Q-000025.md), [Q-000035](../_audit/questions/Q-000035.md)

### RULE-012 — Date representation and date meaning require separate decisions

**Applies when:** Dates cross packed/display COBOL, SQL DATE X(10), or output layouts in any category; examples include 4310 restoration and 7200 archive filtering.

**Migration behavior:** Prove actual bind/install DATE representation before positional DD.MM.YYYY parsing.7200’s strict cutoff is accounting date<cutoff when nonzero, otherwise creation date<cutoff; target uses 0001-01-01 as the zero sentinel.4310 returns dates to legacy output and must retain approved zero/high-date meanings.526/567 format run and creation dates separately. Preserve each program’s inequalities, pivot and fallback; valid SQL syntax alone does not approve a sentinel.

**Minimum storage:** Reuse one 8-character conversion area and one 10-character formatter where lifetimes do not overlap. A punctuation-bearing date belongs in X(10), not PIC 9(10). A reference-modified alphanumeric 8 source may preserve elementary conversion to a packed target where a group MOVE would copy raw bytes.

**Error and recovery contract:** Test zero, blanks, malformed dates, high dates, leap days and environment format. Do not manufacture a numeric date from failed SQL hosts or silently normalize business values.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-012-V01 / VM4BD310-C006 | DB2 DATE hosts populated | UNRESOLVED; classified in this guide; G03 |
| RULE-012-V02 / VM7BD200-C004 | Nonzero accounting date else creation date; strictly before cutoff | UNRESOLVED; classified in this guide; G03 |

**Scenarios to exercise:** CUTOFF-EQUAL: excluded 7200; ZERO-ACCOUNTING-FALLBACK; EUR/ISO-OUTPUT-CONFIG; PACKED-CREATION-CONVERSION; LEAP/INVALID/HIGH-DATE.

**Counterexamples and limits:** 302 uses strict upper bound while 4420 includes equality; Group MOVE of eight display digits into COMP-3 does not perform the required numeric conversion.

**Source evidence:** `IDMS Programs/VM4BD310.cbl` physical L258–263; `DB2 Manual converted Programs/VMDZ4310.txt` physical L404–433; `IDMS Programs/VM7BD200.cbl` physical L188–191; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L366–370; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L417–423.

**Unanswered dependencies:** [Q-000006](../_audit/questions/Q-000006.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000025](../_audit/questions/Q-000025.md)

### RULE-014 — Decommissioning removes approved identities and preserves surviving obligations

**Applies when:** The user supplies eight distinct decommission identities, in explicit IDMS/Db 2 namespaces and program scope. No such list is supplied in this sample.

**Migration behavior:** Resolve the exact eight entries through mapping, aliases, COPY expansion, calls and selected LRF paths. For each, record direct/transitive access, data validation, parent existence, ordering, error, restart, file and audit obligations, then identify which are retained elsewhere or explicitly retired. Current distinct-entity count is UNKNOWN. Removed IDMS statements or an unused copybook do not establish approved decommissioning.

**Minimum storage:** Remove obsolete record/helper state only after proving all remaining def-use and interface effects. FFRECAB is actively replaced; VMBEFF/VMBEVEF/VMBFAR remain active. No eight names or automatic storage savings are invented.

**Error and recovery contract:** Removing a parent record must not silently eliminate required missing-parent behavior or referential checks. Cases with unavailable dependencies remain blocked rather than certified absent.

**Executed-case coverage:** no supplied selected path establishes this global configuration obligation. Keep the missing identity/lifecycle question open.

**Scenarios to exercise:** EIGHT-DISTINCT-ENTITIES; ALIAS-DUPLICATE; CALLED-DEPENDENCY-USE; RETAINED-PARENT-VALIDATION; REMOVED-ERROR-OBLIGATION.

**Counterexamples and limits:** Eight occurrences are not necessarily eight identities; Removing VMBD05 or an IDMS include is not proof that its business entity was decommissioned.

**Unanswered dependencies:** [Q-000015](../_audit/questions/Q-000015.md)

### RULE-015 — Database-read-only programs still need external-file recovery contracts

**Additional cross-program applicability:** The same file-publication/recovery obligation applies to VM4BD310/VMDZ4310. Its mutation output is outside the Db2 unit of work; Q-000019 asks whether to discard partial output and replay immutable input. The full matrix records this condition separately from the seeded archive case. See [Q-000019](../_audit/questions/Q-000019.md). No recovery policy has been answered in Phase 1.

**Applies when:** Programs emit business files, including 7200 archive,4310 mutation,4302 redemption and 4420 selection; no database checkpoint is observed for these visible normal paths.

**Migration behavior:** Document whether a failed run recreates/discards partial output, appends with deduplication, or resumes under an approved scheme. Preserve sequence association and a stable input/database snapshot if replay is expected to reproduce bytes.7200 assigns F-TELLER while writing 530-byte records;4310 writes 1500-byte records. No supplied JCL/downstream contract resolves the policy.

**Minimum storage:** Do not introduce a restart table solely because a cursor exists. Retain output record and any required sequence state. Additional deduplication/ownership storage needs a demonstrated recovery design.

**Error and recovery contract:** SQL rollback does not undo already written file records. Failure after WRITE, short file output, close failure and lost job acknowledgement require their own reconciliation policy.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-015-V01 / VM7BD200-C007 | Failure after partial archive WRITE | UNRESOLVED; classified in this guide; G03 |

**Scenarios to exercise:** FAIL-AFTER-WRITE; RECREATE-PARTIAL-OUTPUT; APPEND-DUPLICATE; CHANGED-DATABASE-BETWEEN-RERUNS; OUTPUT-SEQUENCE-IDENTITY.

**Counterexamples and limits:** Read-only SQL does not mean no external effects; A successful database CLOSE cannot certify a completed output file.

**Source evidence:** `IDMS Programs/VM7BD200.cbl` physical L192–220; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L585–587; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L874–889.

**Unanswered dependencies:** [Q-000007](../_audit/questions/Q-000007.md), [Q-000038](../_audit/questions/Q-000038.md), [Q-000039](../_audit/questions/Q-000039.md)

### RULE-017 — Preserve COPY interfaces and the active byte layout of overlays and arrays

**Applies when:** External file/CALL interfaces and REDEFINES/OCCURS appear in any category. DCLGEN host groups are not automatic replacements for those interfaces.

**Migration behavior:** Preserve offsets, lengths, active variant, code page, signs and whole-group MOVE/INITIALIZE semantics.302 retains a 32000-byte service exchange and existing service arrays.4310’s legacy output is 1500 bytes with 257 REDEFINES and two OCCURS clauses aliasing the same 15 x 8=120 bytes, not 30 elements.7200 reconstructs 432 named bytes+46 padding and a 52-byte trailer=530, but filler/binary bytes in the 478-byte raw image remain unresolved.526/567 rely on missing VMDZ205I1200-byte input.

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

**Unanswered dependencies:** [Q-000003](../_audit/questions/Q-000003.md), [Q-000005](../_audit/questions/Q-000005.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000017](../_audit/questions/Q-000017.md), [Q-000019](../_audit/questions/Q-000019.md), [Q-000024](../_audit/questions/Q-000024.md), [Q-000026](../_audit/questions/Q-000026.md), [Q-000037](../_audit/questions/Q-000037.md)

### RULE-020 — Carry an LRF parent precondition into SQL only when the selected path performs it

**Applies when:** 526 ST-VMBEVEF explicitly obtains the parent before STORE. Other paths may have a parent traversal, but component lists alone do not.

**Migration behavior:** Resolve selector, OF LR key and 0326=>VMBEFF-NOT-FND from VMBTS07, then execute the corresponding four-key parent lookup before child insertion. Target parent SELECT 0 continues; every nonzero fails. Distinguish a valid parent with no children from missing parent.7200 SWEEP-VMBFAS contains only area child retrieval and must not receive an invented VMBSIAS join.

**Minimum storage:** Keep the request key and prepared child values live across the parent lookup. Existing separate DCLGEN/input groups may provide that lifetime; no extra saved-key area is automatically required.

**Error and recovery contract:** Original 526 missing parent/LR-ERROR explicitly rolls back and aborts. Target equivalent depends on missing SQLERROR. Parent duplicates, concurrent deletion and orphans need constraint evidence.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-020-V01 / VM1BD526-C002 | Insert route ST-VMBEVEF with composite stock key. | SUPPORTED_WITH_GAPS; classified in this guide; G03,G04 |

**Scenarios to exercise:** ONE-PARENT; ABSENT-PARENT; DUPLICATE-PARENT; CHILD-INPUT-SURVIVES-LOOKUP; SWEEP-WITH-NO-PARENT-JOIN.

**Counterexamples and limits:** LR components are not all mandatory joins; Returning from parent SELECT failure must never fall through to INSERT.

**Source evidence:** `IDMS Programs/VM1BD526.cbl` physical L160–195; `Schema/VMBTS07.txt` physical L182–189; `DB2 Manual converted Programs/VMDZ1526.txt` physical L463–527.

**Unanswered dependencies:** [Q-000018](../_audit/questions/Q-000018.md), [Q-000035](../_audit/questions/Q-000035.md)

### RULE-021 — Expand the selected LR path and retain custom status distinctions

**Applies when:** An executed LRF request is present:4310 ALL-VMBEVEF-BY-VMBEFF or 7200 SWEEP-VMBFAS.526’s analogous paths are detailed inG04.

**Migration behavior:** 4310: parent CALC0326=>VMBEFF-NOT-FND; empty set=>NO-VMBEVEF-FND; child 0307=>NO-MORE-VMBEVEF; valid child 0000 proceeds until 0092. All absent/no-match cases abort in the source, though diagnostics differ. Target parent SELECT and filtered child singleton collapse some statuses to+100.7200 SWEEP uses OBTAIN EACH VMBFAS WITHIN AR-VMBFRM1,0307=>VMBFAS-EOA; no VMBSIAS lookup. LR CURRENCY NO RESET is relevant only to a request that reuses it.

**Minimum storage:** Track valid component data on each return; no row buffer is valid merely because part of an LR exists. Separate parent/child groups or existing input key can preserve OF LR request values. Do not import unused selectors into execution.

**Error and recovery contract:** Parent missing, empty child set and all children filtered are distinct scenarios even if the current terminal action is the same. A flattened query must preserve approved diagnostic/business distinctions or record their loss.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-021-V01 / VM4BD310-C002 | Product 1002 and input stock/sequence | PARTIALLY_PRESERVED; classified in this guide; G03 |
| RULE-021-V02 / VM7BD200-C002 | Keyword SWEEP-VMBFAS | PRESERVED_FOR_VISIBLE_PATH; classified in this guide; G03 |

**Scenarios to exercise:** MISSING-PARENT; EMPTY-CHILD-SET; FILTER-NO-MATCH; ONE/MANY-QUALIFIERS; AREA-EMPTY; AREA-EOA; UNUSED-PATH-EXCLUDED.

**Counterexamples and limits:** A generic SQL+100 mapping cannot automatically represent every LR return; Schema ERASE paths do not make a retrieval program an updater.

**Source evidence:** `IDMS Programs/VM4BD310.cbl` physical L181–208; `Schema/VMBTS07.txt` physical L124–136; `DB2 Manual converted Programs/VMDZ4310.txt` physical L217–347; `IDMS Programs/VM7BD200.cbl` physical L179–179; `IDMS Programs/VM7BD200.cbl` physical L203–203; additional hash-bound ranges in the case ledger.

**Unanswered dependencies:** [Q-000022](../_audit/questions/Q-000022.md), [Q-000035](../_audit/questions/Q-000035.md), [Q-000037](../_audit/questions/Q-000037.md)

### RULE-022 — Map identities first, then derive exact types from DCLGEN and use sites

**Applies when:** Every mapped field or reconstructed key, including fields not represented by a seeded business case in a guide.

**Migration behavior:** Resolve mapping row/namespace to exact SQL object/column, then DCLGEN host declaration and consuming operation. Hyphen/underscore normalization finds candidates only. Preserve table/view/member/group distinctions. Event NR_IDGOOD is mapping CHAR(20) versus DCLGEN CHAR(28) and target 28 displaydigits, replacing 20 packed/mixed bytes; never truncate to reconcile.7200 mapping RA_BASFMAS _479BFAS has an embedded space.567 unused DA_INVTR spelling drift is separate from executable key fields.

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

**Unanswered dependencies:** [Q-000002](../_audit/questions/Q-000002.md), [Q-000004](../_audit/questions/Q-000004.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000017](../_audit/questions/Q-000017.md), [Q-000038](../_audit/questions/Q-000038.md), [Q-000039](../_audit/questions/Q-000039.md), [Q-000026](../_audit/questions/Q-000026.md), [Q-000037](../_audit/questions/Q-000037.md)

### RULE-023 — Keep only storage with a proven lifetime or interface obligation

**Applies when:** Every added or changed working-storage item; technical rule applies to all programs and categories.

**Migration behavior:** Trace definitions, uses, simultaneous values and clobber points. Remove unused 526 SW-DZEVEFC1, unused date groups, and redundant 4420 SW-STATUS-D under the proven alternate guard. Reuse existing stock 12+check 1/client 1+5 aliases after copy validation; duplicate formatted dates often need no storage. Preserve independent nested EOF, cumulative/batch counts, selected child ID and run timestamp only while their semantics require simultaneous values.

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

**Unanswered dependencies:** [Q-000002](../_audit/questions/Q-000002.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000017](../_audit/questions/Q-000017.md), [Q-000020](../_audit/questions/Q-000020.md), [Q-000026](../_audit/questions/Q-000026.md), [Q-000035](../_audit/questions/Q-000035.md)

### RULE-025 — Preserve encounter order when selection or output depends on it

**Applies when:** 526/4310 choose FIRST qualifying event;4302/4420 reduce events in encounter order;7200 associates output sequence with traversal order.

**Migration behavior:** Target DESC NR_ID chooses greatest surrogate where legacy FIRST follows an undefined supplied set order.526 filters 0168/0219;4310 filters 0092.4302 first 0060 and strict-greater 0092 updates depend on order/ties;4420 last 0060 wins and D can terminate early.7200 uses ascending formID instead of demonstrated area order. Prove loader/set/sequence ordering and tie behavior before claiming equivalence; a generated ID is not inherently a business timestamp.

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

**Unanswered dependencies:** [Q-000008](../_audit/questions/Q-000008.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000016](../_audit/questions/Q-000016.md), [Q-000017](../_audit/questions/Q-000017.md), [Q-000018](../_audit/questions/Q-000018.md), [Q-000023](../_audit/questions/Q-000023.md), [Q-000035](../_audit/questions/Q-000035.md), [Q-000036](../_audit/questions/Q-000036.md), [Q-000037](../_audit/questions/Q-000037.md)

### RULE-031 — Classify removal of runtime services separately from business records

**Applies when:** Every program removes or changes generated BIND/READY/FINISH/IDMS-STATUS services and introduces SQL includes or runtime attachment.

**Migration behavior:** Inventory direct verbs plus generated/called effects. Read-only 4310/7200 normal paths do not prove all hidden calls read-only; schemas contain unused writes that are not executed. Resolve SQLCA, SQLERRWS, SQLERROR, USERABEN, generated IDMS members, JCL attachment, compiler/precompile/bind and site standards. A missing delivered dependency is an assurance gap, not proof that an installed program cannot compile.

**Minimum storage:** Use the actual supported SQL interface and avoid duplicate SQLCODE declarations. Missing include fields cannot be counted as invented helpers. External COPY names retain their independent contract.

**Error and recovery contract:** READY removal does not itself establish Db 2 connection/transaction context; FINISH cannot be globally replaced by COMMIT without inspecting unit-of-work and output effects. Generated auto-status policies may differ from WHEN OTHER.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-031-V01 / VM4BD310-C001 | Open batch and close after input EOF | UNRESOLVED; classified in this guide; G03 |
| RULE-031-V02 / VM7BD200-C001 | Start archive extract | UNRESOLVED; classified in this guide; G03 |

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
| RULE-033-V02 / VM1BD567-C011 | Restart SELECT, INSERT, UPDATE, COMMIT or form UPDATE. | UNRESOLVED; cross-category technical example; G01,G02 |
| RULE-033-V03 / VM4BD302-C008 | Each SELECT/OPEN/FETCH/CLOSE | PARTIAL; cross-category technical example; G01 |
| RULE-033-V04 / VM4BD420-C005 | Every Db 2 cursor operation including earlyDclose | PARTIAL; cross-category technical example; G01 |

**Scenarios to exercise:** SQL0-WITH-WARNING; FETCH 100; SELECT100-BY-CONTEXT; UPDATE100; MULTIROW-UPDATE 0; NEGATIVE-SQL-FAIL; CLEANUP-OVERWRITES-SQLCODE; RETURNING-HANDLER; UNKNOWN-COMMIT.

**Counterexamples and limits:** One global IF SQLCODE NOT=0 abort rule breaks expected EOF/restart absence; Calling SQLERROR does not prove rollback or nonreturn; CLOSE/ROLLBACK diagnostics can overwrite the original failure.

**Source evidence:** `IDMS Programs/VM1BD526.cbl` physical L193–195; `IDMS Programs/VM1BD526.cbl` physical L206–227; `IDMS Programs/VM1BD526.cbl` physical L247–254; `DB2 Manual converted Programs/VMDZ1526.txt` physical L331–335; `DB2 Manual converted Programs/VMDZ1526.txt` physical L373–379; additional hash-bound ranges in the case ledger.

**Unanswered dependencies:** [Q-000003](../_audit/questions/Q-000003.md), [Q-000035](../_audit/questions/Q-000035.md)

## 5. Case-by-case migration crosswalk

This section retains every case classified in this category. The prose records what the supplied converter did and where equivalence remains conditional. Evidence hashes and additional ranges are in the linked ledgers; each report contains its complete declaration, field and operation inventories.

### VM1BD526-C002 — LR store parent precondition

**Program:** [VM1BD526.cbl](../programs/VM1BD526.cbl__migration.md) · **Rule/variant:** RULE-020, RULE-020-V01 · **Source assessment:** `SUPPORTED_WITH_GAPS`.

**Condition:** Insert route ST-VMBEVEF with composite stock key.

**Original behavior:** VMBTS07 selects ST-VMBEVEF: OBTAIN FIRST VMBEFF by KY-EFFECT OF LR; 0326 returns VMBEFF-NOT-FND; on success STORE VMBEVEF. No VMBWCEF STORE occurs on this selector.

**Delivered Db2 behavior:** A four-key singleton SELECT of DZBEFFTV must yield SQLCODE 0 before 260-INSERT-EVEF is performed; all other codes call SQLERROR.

**Evidence:** `IDMS Programs/VM1BD526.cbl` physical L160–195; `Schema/VMBTS07.txt` physical L182–189; `DB2 Manual converted Programs/VMDZ1526.txt` physical L463–527.

**Unanswered questions:** [Q-000018](../_audit/questions/Q-000018.md), [Q-000035](../_audit/questions/Q-000035.md)

### VM1BD526-C004 — First matching event and custom statuses

**Program:** [VM1BD526.cbl](../programs/VM1BD526.cbl__migration.md) · **Rule/variant:** RULE-025, RULE-025-V01 · **Source assessment:** `UNRESOLVED`.

**Condition:** Update route for stock key, event 0168 and service 0219; parent and child cardinality vary.

**Original behavior:** OBTAIN FIRST on ALL-VMBEVEF-BY-VMBEFF first retrieves parent, returns VMBEFF-NOT-FND on 0326, NO-VMBEVEF-FND for empty set and NO-MORE-VMBEVEF on 0307; program rejects every result other than LR-FOUND.

**Delivered Db2 behavior:** Direct child SELECT filters six columns, ORDER BY NR_ID DESC FETCH FIRST 1. +100 displays ROW NOT FOUND then SQLERROR; no independent parent test remains.

**Evidence:** `IDMS Programs/VM1BD526.cbl` physical L197–212; `Schema/VMBTS07.txt` physical L124–136; `DB2 Manual converted Programs/VMDZ1526.txt` physical L575–601.

**Unanswered questions:** [Q-000016](../_audit/questions/Q-000016.md), [Q-000018](../_audit/questions/Q-000018.md), [Q-000035](../_audit/questions/Q-000035.md)

### VM1BD526-C006 — Composite event key serialization

**Program:** [VM1BD526.cbl](../programs/VM1BD526.cbl__migration.md) · **Rule/variant:** RULE-022, RULE-022-V01 · **Source assessment:** `CONFLICT`.

**Condition:** Insert or modification builds key from client, creation date, document ID and operation detail/general.

**Original behavior:** Packed widths 8,8,6,3,3 plus two filler bytes form a 20-byte record copied into NR-ID-GOOD.

**Delivered Db2 behavior:** Display widths 8,8,6,3,3 form 28 characters copied into DCLGEN CHAR28; mapping still says CHAR20.

**Evidence:** `IDMS Programs/VM1BD526.cbl` physical L66–72; `IDMS Programs/VM1BD526.cbl` physical L174–180; `DB2 Manual converted Programs/VMDZ1526.txt` physical L68–73; `DB2 Manual converted Programs/VMDZ1526.txt` physical L248–254; `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical L360–360; `Dclgens/DZEVEFTV.txt` physical L19–40.

**Unanswered questions:** [Q-000017](../_audit/questions/Q-000017.md)

### VM1BD526-C007 — Stock and client identifier splitting

**Program:** [VM1BD526.cbl](../programs/VM1BD526.cbl__migration.md) · **Rule/variant:** RULE-023, RULE-023-V01 · **Source assessment:** `SUPPORTED_WITH_GAPS`.

**Condition:** All stock-key SQL and insertion client reference.

**Original behavior:** 13-digit stock number copied to composite IDMS group; two-digit sequence group; six-character client group retained.

**Delivered Db2 behavior:** New 13-byte and 6-byte overlay helpers split stock 12+1/client 1+5; sequence staged in PIC99 then packed SQL host.

**Evidence:** `Copybook/VMBD205I.cpy` physical L54–55; `Copybook/VMBD205I.cpy` physical L624–673; `DB2 Manual converted Programs/VMDZ1526.txt` physical L74–85; `DB2 Manual converted Programs/VMDZ1526.txt` physical L230–273; `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical L309–324.

**Unanswered questions:** [Q-000020](../_audit/questions/Q-000020.md)

### VM1BD526-C014 — Operation-specific SQL and error state

**Program:** [VM1BD526.cbl](../programs/VM1BD526.cbl__migration.md) · **Rule/variant:** RULE-033, RULE-033-V01 · **Source assessment:** `UNRESOLVED`.

**Condition:** Any of 8 executable SQL statements, LR status failure, or completed/short-file call.

**Original behavior:** Parent-not-found/LR-ERROR in insert calls IDMS-STOP which displays status, ROLLBACKs and CALLs USERABEN; other LR failures call USERABEN directly; IDMS AUTOSTATUS dependency missing.

**Delivered Db2 behavior:** Restart SELECT accepts 0/+100, parent SELECT only 0, event SELECT 0/+100 distinct displays, all changes/COMMIT only 0; OTHER calls unavailable SQLERROR. No SQLSTATE/SQLWARN/row-count/indicator branch or explicit target ROLLBACK.

**Evidence:** `IDMS Programs/VM1BD526.cbl` physical L193–195; `IDMS Programs/VM1BD526.cbl` physical L206–227; `IDMS Programs/VM1BD526.cbl` physical L247–254; `DB2 Manual converted Programs/VMDZ1526.txt` physical L331–335; `DB2 Manual converted Programs/VMDZ1526.txt` physical L373–379; `DB2 Manual converted Programs/VMDZ1526.txt` physical L401–627.

**Unanswered questions:** [Q-000035](../_audit/questions/Q-000035.md)

### VM4BD310-C001 — Runtime services and normal read-only effect

**Program:** [VM4BD310.cbl](../programs/VM4BD310.cbl__migration.md) · **Rule/variant:** RULE-031, RULE-031-V01 · **Source assessment:** `UNRESOLVED`.

**Condition:** Open batch and close after input EOF

**Original behavior:** BIND/READY retrieval and FINISH with IDMS status routines

**Delivered Db2 behavior:** Db 2 SELECTs plus file open/close; no explicit transaction SQL

**Evidence:** `IDMS Programs/VM4BD310.cbl` physical L137–163; `DB2 Manual converted Programs/VMDZ4310.txt` physical L185–205.

**Unanswered questions:** [Q-000035](../_audit/questions/Q-000035.md)

### VM4BD310-C002 — LRF parent and child outcomes

**Program:** [VM4BD310.cbl](../programs/VM4BD310.cbl__migration.md) · **Rule/variant:** RULE-021, RULE-021-V01 · **Source assessment:** `PARTIALLY_PRESERVED`.

**Condition:** Product 1002 and input stock/sequence

**Original behavior:** Parent CALC, empty child set, each child with custom statuses

**Delivered Db2 behavior:** Separate parent SELECT and filtered child SELECT; +100 on both but different operation

**Evidence:** `IDMS Programs/VM4BD310.cbl` physical L181–208; `Schema/VMBTS07.txt` physical L124–136; `DB2 Manual converted Programs/VMDZ4310.txt` physical L217–347.

**Unanswered questions:** [Q-000022](../_audit/questions/Q-000022.md), [Q-000035](../_audit/questions/Q-000035.md), [Q-000037](../_audit/questions/Q-000037.md)

### VM4BD310-C003 — First matching event order

**Program:** [VM4BD310.cbl](../programs/VM4BD310.cbl__migration.md) · **Rule/variant:** RULE-025, RULE-025-V03 · **Source assessment:** `UNRESOLVED`.

**Condition:** Two or more event 0092 children possible

**Original behavior:** First 0092 in IDMS set traversal

**Delivered Db2 behavior:** Highest NR_ID among event 0092 through DESC FETCH FIRST

**Evidence:** `IDMS Programs/VM4BD310.cbl` physical L200–208; `DB2 Manual converted Programs/VMDZ4310.txt` physical L301–321; `Schema/VMBTS07.txt` physical L133–135.

**Unanswered questions:** [Q-000023](../_audit/questions/Q-000023.md), [Q-000037](../_audit/questions/Q-000037.md)

### VM4BD310-C004 — Capital versus interest output

**Program:** [VM4BD310.cbl](../programs/VM4BD310.cbl__migration.md) · **Rule/variant:** RULE-002, RULE-002-V01 · **Source assessment:** `DEFECT`.

**Condition:** NX-CPCRE=0 versus nonzero

**Original behavior:** Copy AM-CND-STOCK if zero; otherwise AM-INTER-STOCK

**Delivered Db2 behavior:** AM-CNDSTK omitted from SELECT; zero-initialized host copied

**Evidence:** `IDMS Programs/VM4BD310.cbl` physical L247–253; `DB2 Manual converted Programs/VMDZ4310.txt` physical L219–263; `DB2 Manual converted Programs/VMDZ4310.txt` physical L393–399.

**Unanswered questions:** [Q-000013](../_audit/questions/Q-000013.md), [Q-000026](../_audit/questions/Q-000026.md)

### VM4BD310-C005 — Event key and split identifiers

**Program:** [VM4BD310.cbl](../programs/VM4BD310.cbl__migration.md) · **Rule/variant:** RULE-022, RULE-022-V03 · **Source assessment:** `CONFLICT`.

**Condition:** Found event decoded for output

**Original behavior:** 20-byte packed key; 6-byte CI; stock 13, issue 9

**Delivered Db2 behavior:** 28 display digit key in 30 group; split DCLGEN columns reconstructed

**Evidence:** `IDMS Programs/VM4BD310.cbl` physical L73–89; `IDMS Programs/VM4BD310.cbl` physical L217–245; `DB2 Manual converted Programs/VMDZ4310.txt` physical L63–91; `DB2 Manual converted Programs/VMDZ4310.txt` physical L353–392; `Dclgens/DZEVEFTV.txt` physical L19–42.

**Unanswered questions:** [Q-000017](../_audit/questions/Q-000017.md), [Q-000026](../_audit/questions/Q-000026.md)

### VM4BD310-C006 — Date restoration

**Program:** [VM4BD310.cbl](../programs/VM4BD310.cbl__migration.md) · **Rule/variant:** RULE-012, RULE-012-V01 · **Source assessment:** `UNRESOLVED`.

**Condition:** DB2 DATE hosts populated

**Original behavior:** Direct legacy YYYYMMDD

**Delivered Db2 behavior:** EUR parse; 0001→zero, 9999-12-31→99999999

**Evidence:** `IDMS Programs/VM4BD310.cbl` physical L258–263; `DB2 Manual converted Programs/VMDZ4310.txt` physical L404–433.

**Unanswered questions:** [Q-000014](../_audit/questions/Q-000014.md)

### VM4BD310-C007 — Output overlays, arrays and retained business values

**Program:** [VM4BD310.cbl](../programs/VM4BD310.cbl__migration.md) · **Rule/variant:** RULE-017, RULE-017-V02 · **Source assessment:** `UNRESOLVED`.

**Condition:** Build one 1500-byte output for valid mutation

**Original behavior:** VMBD510I initialized; typed moves; 15-date array and 257 overlays retained by COPY

**Delivered Db2 behavior:** Missing VMDZ510I; unchanged visible business constants/old CI/sequence

**Evidence:** `IDMS Programs/VM4BD310.cbl` physical L213–318; `DB2 Manual converted Programs/VMDZ4310.txt` physical L353–481; `Copybook/VMBD510I.cpy` physical L1460–1481.

**Unanswered questions:** [Q-000019](../_audit/questions/Q-000019.md), [Q-000026](../_audit/questions/Q-000026.md)

### VM4BD310-C008 — Minimal helper state

**Program:** [VM4BD310.cbl](../programs/VM4BD310.cbl__migration.md) · **Rule/variant:** RULE-023, RULE-023-V03 · **Source assessment:** `PARTIALLY_PRESERVED`.

**Condition:** Sequential dates/split keys/diagnostics

**Original behavior:** Existing business groups

**Delivered Db2 behavior:** New helpers, unused date groups, optional input count/timestamp

**Evidence:** `DB2 Manual converted Programs/VMDZ4310.txt` physical L55–145; `DB2 Manual converted Programs/VMDZ4310.txt` physical L353–433; `DB2 Manual converted Programs/VMDZ4310.txt` physical L497–507.

**Unanswered questions:** [Q-000026](../_audit/questions/Q-000026.md), [Q-000035](../_audit/questions/Q-000035.md)

### VM7BD200-C001 — Runtime services and selected path effects

**Program:** [VM7BD200.cbl](../programs/VM7BD200.cbl__migration.md) · **Rule/variant:** RULE-031, RULE-031-V02 · **Source assessment:** `UNRESOLVED`.

**Condition:** Start archive extract

**Original behavior:** BIND RUN/BIND VMBFAS/READY retrieval; FINISH

**Delivered Db2 behavior:** OPEN/CLOSE cursor, no normal Db 2 writes

**Evidence:** `IDMS Programs/VM7BD200.cbl` physical L174–179; `IDMS Programs/VM7BD200.cbl` physical L210–222; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L429–440; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L559–587.

**Unanswered questions:** [Q-000035](../_audit/questions/Q-000035.md)

### VM7BD200-C002 — LRF area sweep without parent join

**Program:** [VM7BD200.cbl](../programs/VM7BD200.cbl__migration.md) · **Rule/variant:** RULE-021, RULE-021-V02 · **Source assessment:** `PRESERVED_FOR_VISIBLE_PATH`.

**Condition:** Keyword SWEEP-VMBFAS

**Original behavior:** OBTAIN EACH VMBFAS area; custom VMBFAS-EOA

**Delivered Db2 behavior:** One view cursor; no VMBSIAS JOIN

**Evidence:** `IDMS Programs/VM7BD200.cbl` physical L179–179; `IDMS Programs/VM7BD200.cbl` physical L203–203; `Schema/VMBTS03.txt` physical L86–110; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L280–374.

**Unanswered questions:** [Q-000037](../_audit/questions/Q-000037.md)

### VM7BD200-C003 — Cursor EOF and parameter lifetime

**Program:** [VM7BD200.cbl](../programs/VM7BD200.cbl__migration.md) · **Rule/variant:** RULE-011, RULE-011-V01 · **Source assessment:** `PARTIALLY_PRESERVED`.

**Condition:** Opened once with archive cutoff

**Original behavior:** FIRST/NEXT until VMBFAS-EOA

**Delivered Db2 behavior:** OPEN 0/FETCH 0 process/FETCH 100 stop/CLOSE; hosts reused after OPEN

**Evidence:** `IDMS Programs/VM7BD200.cbl` physical L138–140; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L416–556; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L583–587.

**Unanswered questions:** [Q-000025](../_audit/questions/Q-000025.md), [Q-000035](../_audit/questions/Q-000035.md)

### VM7BD200-C004 — Archive date filter pushdown

**Program:** [VM7BD200.cbl](../programs/VM7BD200.cbl__migration.md) · **Rule/variant:** RULE-012, RULE-012-V02 · **Source assessment:** `UNRESOLVED`.

**Condition:** Nonzero accounting date else creation date; strictly before cutoff

**Original behavior:** COBOL OR of 2 AND branches

**Delivered Db2 behavior:** WHERE same predicate using DATE zero-sentinel 0001-01-01

**Evidence:** `IDMS Programs/VM7BD200.cbl` physical L188–191; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L366–370; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L417–423.

**Unanswered questions:** [Q-000006](../_audit/questions/Q-000006.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000025](../_audit/questions/Q-000025.md)

### VM7BD200-C005 — Binary archive image reconstruction

**Program:** [VM7BD200.cbl](../programs/VM7BD200.cbl__migration.md) · **Rule/variant:** RULE-017, RULE-017-V04 · **Source assessment:** `UNRESOLVED`.

**Condition:** Every selected form

**Original behavior:** Raw VMBFAS group MOVE to 478 bytes; 530 output

**Delivered Db2 behavior:** 84 column FETCH; 432-byte reconstruction+46 pad+52 trailer

**Evidence:** `IDMS Programs/VM7BD200.cbl` physical L87–94; `IDMS Programs/VM7BD200.cbl` physical L192–200; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L75–198; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L589–879.

**Unanswered questions:** [Q-000005](../_audit/questions/Q-000005.md), [Q-000024](../_audit/questions/Q-000024.md), [Q-000037](../_audit/questions/Q-000037.md)

### VM7BD200-C006 — Archive ordering and counter

**Program:** [VM7BD200.cbl](../programs/VM7BD200.cbl__migration.md) · **Rule/variant:** RULE-025, RULE-025-V04 · **Source assessment:** `UNRESOLVED`.

**Condition:** Multiple eligible forms

**Original behavior:** IDMS area order associates counter to forms

**Delivered Db2 behavior:** ORDER BY surrogate ID ASC; counter per fetch

**Evidence:** `IDMS Programs/VM7BD200.cbl` physical L192–200; `Schema/VMBTS03.txt` physical L90–92; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L371–371; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L597–598.

**Unanswered questions:** [Q-000008](../_audit/questions/Q-000008.md)

### VM7BD200-C007 — External file recovery

**Program:** [VM7BD200.cbl](../programs/VM7BD200.cbl__migration.md) · **Rule/variant:** RULE-015, RULE-015-V01 · **Source assessment:** `UNRESOLVED`.

**Condition:** Failure after partial archive WRITE

**Original behavior:** No persisted checkpoint; file output external

**Delivered Db2 behavior:** No Db 2 checkpoint/restart despite extract writes

**Evidence:** `IDMS Programs/VM7BD200.cbl` physical L192–220; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L585–587; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L874–889.

**Unanswered questions:** [Q-000007](../_audit/questions/Q-000007.md)

### VM7BD200-C008 — Helper minimization with packed conversion

**Program:** [VM7BD200.cbl](../programs/VM7BD200.cbl__migration.md) · **Rule/variant:** RULE-023, RULE-023-V05 · **Source assessment:** `PARTIALLY_PRESERVED`.

**Condition:** Eight date conversions and cutoff

**Original behavior:** Existing packed creation date and display dates

**Delivered Db2 behavior:** 8 redundant per date buffers/template blocks; one packed date conversion exception

**Evidence:** `DB2 Manual converted Programs/VMDZ7200.cbl` physical L54–74; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L202–271; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L603–616; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L625–855.

**Unanswered questions:** [Q-000014](../_audit/questions/Q-000014.md), [Q-000035](../_audit/questions/Q-000035.md)

## 6. Cross-program verification and validation scenarios

Rule applicability is checked against every one of the six IDMS inputs, including programs that did not originate the rule. A rule is not “verified for all programs” merely because it is linked to its seed cases. UNKNOWN records missing evidence; CONTRADICTED retains a demonstrated conflict; NOT_APPLICABLE requires a scoped reason. The 198-cell matrix contains the per-program condition, source evidence, case IDs and unresolved questions. Production status remains PARTIAL where required evidence is missing.

| Scenario family | Inputs / boundary | Expected assessment or required outcome |
| --- | --- | --- |
| LR status partition | Missing parent; empty set; nonempty/no 0092; one/many qualifiers; empty area. | Preserve valid-component state and approved distinct diagnostics; do not invent parent checks for SWEEP-VMBFAS. |
| Selected event | Two qualifying events with reversed set and surrogate order. | Establish which child is intended; neither DESC nor FETCH FIRST alone proves legacy-first equivalence. |
| 4310 amount branch | NX_CPCRE = 0 with nonzero capital; nonzero rank with interest; alternating requests. | Capital/interest must originate from the correct successful parent retrieval; current omitted-capital defect remains. |
| Archive predicate | Accounting before/equal/after cutoff; zero accounting and creation alternatives. | Strict less-than and approved fallback survive loading/sentinel conversion. |
| Archive/interface bytes | Packed creation date, filler binary content, all 15 mutation date occurrences, whole output lengths. | Check actual bytes and active aliases, not only named values or static length arithmetic. |
| Cursor/output failures | Initial OPEN error, FETCH error, EOF, CLOSE failure, partial file, reopen after host initialization. | Original diagnostics and no invalid row; restore parameters on reopen; apply separately approved file recovery. |

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
| [Q-000007](../_audit/questions/Q-000007.md) | VM7BD200.cbl | What job and file policy handles a partially written archive extract: recreate from a frozen row snapshot, append with deduplication, or resume? Supply the operational contract. |
| [Q-000008](../_audit/questions/Q-000008.md) | VM7BD200.cbl | Is output order, including the F-TELLER number associated with each form, a business contract? May the same form set be ordered by Db 2 surrogate NR_ID instead of original area order? State tie and concurrency rules. |
| [Q-000011](../_audit/questions/Q-000011.md) | VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl | Is FFRECAT to DZ01FFTB the intended second buffer replacement, and which actual producer/consumer program paths establish its keys, lifecycle, transaction ownership and recovery obligations? |
| [Q-000012](../_audit/questions/Q-000012.md) | VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl | Which exact COBOL/IDMS/Db 2 versions, source/debugging options, compilation/bind settings, site coding standards and generated IDMS record/control members produced these six source pairs? Supply the matching build/dependency bundle. |
| [Q-000013](../_audit/questions/Q-000013.md) | VM4BD310.cbl | For NX-CPCRE=0, must AM-CND-FORM-AS retain the parent AM-CND-STOCK value, including nonzero amounts, or was a zero output deliberately approved? |
| [Q-000014](../_audit/questions/Q-000014.md) | VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl, VM7BD200.cbl | Which effective DATE output format and approved legacy zero/high-date conversions apply to the date fields read by these programs? Provide actual package/preparation settings and the load conversion specification. |
| [Q-000015](../_audit/questions/Q-000015.md) | VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl | Supply the eight distinct approved decommission identities, using IDMS or Db 2 names, with namespace, scope and retained business obligations. |
| [Q-000016](../_audit/questions/Q-000016.md) | VM1BD526.cbl | Supply the VMBEFF-VMBEVEF set-order definition and specify which matching 0168/0219 event must be updated when several exist: the legacy first qualifying member or the greatest generated NR_ID_479EVEF? |
| [Q-000017](../_audit/questions/Q-000017.md) | VM1BD526.cbl, VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl | What approved loader and consumer specification maps the legacy 20-byte packed/mixed NR-ID-GOOD to the supplied 28-character NR_IDGOOD_479EVEF, including sign and date conventions, when the mapping sheet still says CHAR(20)? |
| [Q-000018](../_audit/questions/Q-000018.md) | VM1BD526.cbl | Provide the target parent/event/sequence DDL and legacy CALC/set definitions proving unique parent selection, event foreign-key enforcement, generated event-ID uniqueness and the meaning of new-event NS_IDMSKEY=0. |
| [Q-000019](../_audit/questions/Q-000019.md) | VM4BD310.cbl | After failure with some mutation records already written, must the job replace the partial output and rerun the same immutable input from the start, or must downstream processing deduplicate or resume it? |
| [Q-000020](../_audit/questions/Q-000020.md) | VM1BD526.cbl, VM1BD567.cbl | Supply the exact VMDZ205I member used for these builds and confirm whether its 1200-byte layout and numeric/group aliases are identical to the supplied VMBD205I, apart from the level-01 name. |
| [Q-000022](../_audit/questions/Q-000022.md) | VM4BD310.cbl | Must parent missing, parent with no events, and parent with events but no event 0092 retain distinct diagnostics or rejection categories, even if every condition terminates the batch? |
| [Q-000023](../_audit/questions/Q-000023.md) | VM4BD310.cbl | When a stock has multiple event 0092 records, must the program choose the first event in the original VMBEFF-VMBEVEF set order, or the event with the greatest relational NR_ID? Please provide the set ORDER definition and the surrogate-ID load and tie rules. |
| [Q-000024](../_audit/questions/Q-000024.md) | VM7BD200.cbl | Should mapping logical row 193, RA_BASFMAS _479BFAS, be corrected to the exact DCLGEN and SQL identifier RA_BASFMAS_479BFAS? |
| [Q-000025](../_audit/questions/Q-000025.md) | VM7BD200.cbl | Supply VMDZ270I and confirm the exact archive-output layout and its consumer contract against supplied VMBZ270I. |
| [Q-000026](../_audit/questions/Q-000026.md) | VM4BD310.cbl | Supply VMDZ510I and confirm the exact 1500-byte mutation-output layout, all aliases and OCCURS/REDEFINES against supplied VMBD510I. |
| [Q-000035](../_audit/questions/Q-000035.md) | VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl | What is the exact failure/non-return contract of SQLERROR, SQLERRWS, generated IDMS status/bind members and USERABEN for the six supplied programs, including preservation of the producing diagnostics and rollback of uncommitted work? Supply the implementation members. |
| [Q-000036](../_audit/questions/Q-000036.md) | VM4BD302.cbl, VM4BD420.cbl | Which exact VMBEFF-VMBEVEF set ordering/member-placement rule and data-load sequence justify using NR_ID_479EVEF DESC as the legacy encounter order, including ties? |
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
