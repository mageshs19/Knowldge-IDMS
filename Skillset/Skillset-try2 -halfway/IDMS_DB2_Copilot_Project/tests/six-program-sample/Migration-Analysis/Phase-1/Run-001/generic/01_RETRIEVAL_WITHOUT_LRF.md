# G01 — Retrieval without LRF

**Phase:** 1 · **Run:** Run-001 · **Assessment:** PARTIAL · **Answer state:** no human or simulated answers consumed.

This is a conditional generic synthesis of the supplied six-program corpus. It contains **22 classified cases** and **20 rule definitions** for this category. Rules shared across categories retain the same RULE IDs; their source variants remain explicitly identified. The complete corpus contains 60 distinct cases and 33 distinct rules.

## 1. Scope and what this sample establishes

This guide covers the direct owner/security/event navigation in VM4BD302 → VMDZ4302 and the direct security/event navigation in VM4BD420 → VMDZ4420. It also covers the non-LRF restart lookup in both updaters and the read obligation folded into VM1BD567's searched UPDATE. A program can contribute a retrieval case here and an update/restart case elsewhere. VM1BD526's business writes remain LRF cases; their restart SELECT is ordinary SQL retrieval. VM1BD567 has no executed LRF request despite LRF declarations in its subschema.

The strongest reusable result is a conditional transformation: replace implicit network currency with explicit key predicates and separate live parent/child storage, then retain the original business reduction and status meanings. A cursor alone does not determine which child wins, whether a parent is mandatory, or how a partial output file is recovered. Those are separate obligations.

Every recommendation below separates an observed source behavior, an observed target behavior, an unresolved condition and a proposed change. A manually converted program is evidence of a developer's approach; its correctness is not assumed. The reports include a demonstrated missing-field defect, representation conflicts and unresolved operational contracts. All 39 Phase 1 questions remain unanswered.

The configured eight decommission identities were not supplied. FFRECAB is visibly used for restart and has a mapped target candidate, while FFRECAT → DZ01FFTB is only a possible second replacement. No supplied producer/consumer path establishes the requested persistent buffer protocol. These gaps are covered by RULE-003/RULE-014 and individual questions; they are not silently classified as absent business work.

### Program participation

| Input / paired report | Role in this guide |
| --- | --- |
| [VM1BD526.cbl](../programs/VM1BD526.cbl__migration.md) | 2 classified cases: VM1BD526-C008, VM1BD526-C014 |
| [VM1BD567.cbl](../programs/VM1BD567.cbl__migration.md) | 4 classified cases: VM1BD567-C001, VM1BD567-C002, VM1BD567-C004, VM1BD567-C011 |
| [VM4BD302.cbl](../programs/VM4BD302.cbl__migration.md) | 9 classified cases: VM4BD302-C001, VM4BD302-C002, VM4BD302-C003, VM4BD302-C004, VM4BD302-C005, VM4BD302-C006, VM4BD302-C007, VM4BD302-C008, VM4BD302-C009 |
| [VM4BD420.cbl](../programs/VM4BD420.cbl__migration.md) | 7 classified cases: VM4BD420-C001, VM4BD420-C002, VM4BD420-C003, VM4BD420-C004, VM4BD420-C005, VM4BD420-C006, VM4BD420-C007 |

## 2. Execution method for a new program

1. Inventory every direct BIND/READY/OBTAIN/FIND/FINISH occurrence and the effective COPY/CALL dependencies. Remove an IDMS runtime service only after identifying its Db2 attachment, access and error responsibilities. Do not turn a missing generated member into a fabricated SQL statement.
2. Resolve each CALC or owner/member key through the mapping row, exact SQL column, DCLGEN PIC/USAGE and consuming predicate. Keep table, view, DCLGEN member and COBOL group identities separate. Hyphen-to-underscore conversion finds a candidate; it does not prove a mapping.
3. Select the access shape from cardinality and business use: a singleton owner lookup, keyed parent cursor, keyed child cursor, or direct searched UPDATE with no separate read when the read result is not needed. Prove unique-row obligations using DDL or an explicit unresolved question.
4. Set OPEN inputs before OPEN; FETCH into valid separate output groups; inspect that statement's status immediately. Preserve parent keys and business fields while child SQL runs. Retain independent loop state when the paragraph structure allows child SQL to overwrite SQLCODE before the parent loop resumes.
5. Reproduce the reducer with exact inequalities, equal-date behavior, first/last encounter rules and state resets per parent. Establish the required order separately. The delivered DESC event-ID order is not proof of legacy set order.
6. Close every successfully opened child on EOF and business early exit, then close the parent on its own completion. Confirm the unavailable error routine's cleanup/nonreturn behavior. Process no initialized or stale row after failed retrieval.
7. Compare whole output/CALL interfaces, then document file rerun/publication behavior. A read-only SQL program that writes a sequential file still has durable external effects.
8. Minimize added storage by def-use and simultaneous lifetime. Preserve conversion category and interface layout. Report optional counters, diagnostic timestamps and unused template groups separately from business-required state.

## 3. Business conditions, access shape and state

### Direct navigation and business outcomes

| Condition | Required visible behavior / observed target | Evidence case |
| --- | --- | --- |
| 302 service-derived owner missing | Legacy displays/skips all nonzero CALC results; target specifically skips +100 and calls SQLERROR for other results. The distinction is an unresolved error-policy change. | VM4BD302-C001, C002, C008 |
| 302 owner found, no securities | Parent cursor EOF; no output for that input. The query must retain all three owner-key predicates. | VM4BD302-C003 |
| Parent found, no events | Child EOF with freshly reset reducer state; 302 has SW-168 = 0, 420 has blank WS-STATUS, so no output. | VM4BD302-C003, VM4BD420-C002 |
| 302 redemption event | Require 0168, embedded operation 91, event date < cutoff and event date >= maturity-minus-one-month. Lower equality is included; cutoff equality is excluded. January rolls back a year and the day is unchanged. | VM4BD302-C004 |
| 302 CI reduction | First usable earlier 0060 initializes CI; 0092 replaces it only for a strictly greater transfer date below cutoff. Ties retain the first encountered candidate. Eligibility can be true with CI 000000. | VM4BD302-C005 |
| 420 creation/rejection | Process events at or before PARMDATE. 0060 sets C and replaces creation CI; qualifying 0168 with state not '1' sets D and stops; 0217 sets S only from blank. Only C writes. Repeated 0060 uses the last encountered CI. | VM4BD420-C003 |
| 302/420 parameter years | 302 uses the threshold 80; 420 uses 60. The generic rule must retain both variants. | VM4BD302-C001, VM4BD420-C001 |
| 567 direct form read/update | Retrieval may be folded into searched UPDATE only when no read-derived business value is needed and key/cardinality/error behavior remains established. | VM1BD567-C001 |
| Initial restart SELECT +100 | Candidate fresh-run state, subject to object/key/cutover validation; it is not cursor EOF or a missing required business row. | VM1BD526-C008, VM1BD567-C004 |

### Cursor ownership and minimum storage

The parent DCLGEN holds the security key and eventual parent output while the child DCLGEN receives event rows. This visible separation lets VMDZ4420 remove FIND CURRENT VMBEFF without a second query or copied parent key. Both nested implementations use independent parent and child EOF flags. Those roles are needed by the present paragraph structure because child SQL replaces SQLCODE; an inline FETCH/test/EXIT redesign may remove an allocation only after equivalent loop and cleanup behavior is demonstrated. [VM4BD302-C003; VM4BD420-C002; source ranges in section 5.]

`SW-STATUS-D` duplicates existing `WS-STATUS = 'D'` in VMDZ4420. A conditional no-new-helper rewrite can use the existing D state for loop exit and C for the write guard. It must still distinguish business rejection from actual child EOF. The extra event-date scalar in each navigation target duplicates the still-live shared conversion value. VMDZ4302's six-character CI assembly can use slices of existing LAATSTE-CI; its stock assembly can use the output layout only after decimal-domain and offset validation. Optional display counters/timestamps do not become mandatory simply because the manual converter added them. [VM4BD302-C007; VM4BD420-C006.]

### File recovery is part of the retrieval contract

VMDZ4302 writes 90-byte records and VMDZ4420 writes 50-byte records. Their visible mains have no database checkpoint or persisted output position. A crash after some WRITEs can therefore leave partial output even though SQL is read-only. Questions Q-000038 and Q-000039 request separate replay/publication policies for the two jobs; no answer is consumed here. The temporary record/communication areas are not evidence of a persistent buffer table. [Q-000038; Q-000039; each program report sections 9 and 12.]

## 4. Conditional rule catalog

Each rule gives its applicability condition, preserved or changed behavior, minimum-storage reasoning, failure contract, source variants and concrete scenarios. A variant whose originating case belongs to another category is a cross-category technical example, not a reclassification of that program. The actual 33 × 6 rule/program cross-check is [rule-applicability.json](../_audit/rule-applicability.json); its APPLIES_SUPPORTS, APPLIES_VARIANT, APPLIES_CONTRADICTS, UNKNOWN and NOT_APPLICABLE rows are evidence assessments, not automatic production approval.

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

### RULE-004 — Keep business rejection separate from cursor exhaustion

**Applies when:** The 4420 event reducer can stop early because a security is disqualified; other cursor scans apply only when an equivalent business stop is actually present.

**Migration behavior:** Start each parent with blank WS-STATUS. For event date <= PARMDATE, 0060 sets C and replaces the creation key unless already D; 0168 with state flag not 1 sets D and stops; 0217 sets S only from blank. Only C emits a 50-byte output. The legacy artificially assigned 0307 on D; the target separates business D from SQL EOF. Repeated 0060 means last encountered creation CI wins, so child order still matters.

**Minimum storage:** Existing WS-STATUS already carries D. SW-STATUS-D is removable if loop exit and guards use that existing state without changing the C/D/S transitions. EOF state and parent/child host lifetimes remain separate.

**Error and recovery contract:** CLOSE the child on both ordinary EOF and D early termination. Do not classify an SQL failure as a business D or set SQLCODE artificially. Returning handlers and failed CLOSE remain unresolved.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-004-V01 / VM4BD420-C003 | Only events with eventdate≤PARMDATE | PRESERVED_CONDITIONAL_ON_ORDER_TYPES; classified in this guide; G01 |

**Scenarios to exercise:** C-THEN-S: remainsC; S-THEN-C: becomesC; D-AFTER-C: no output; FUTURE-D: ignored; TWO-CREATIONS: last encountered key; DATE-EQUAL: included.

**Counterexamples and limits:** Using EOF as D can wrongly treat an SQL failure as a legitimate exclusion; Replacing encounter order with MAX(date) changes repeated 0060 semantics.

**Source evidence:** `IDMS Programs/VM4BD420.cbl` physical L190–224; `DB2 Manual converted Programs/VMDZ4420.cbl` physical L268–314.

**Unanswered dependencies:** [Q-000004](../_audit/questions/Q-000004.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000017](../_audit/questions/Q-000017.md), [Q-000036](../_audit/questions/Q-000036.md)

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

### RULE-006 — Preserve each program’s parameter and CALL date contract

**Applies when:** 302 and 420 obtain cutoff/service data before database retrieval; the same principle applies only to calls actually executed elsewhere.

**Migration behavior:** 302 uses a year pivot below 80=>20 xx, otherwise 19 xx, and VM9BC50T QUERY001 with CO-CLE2; returned issue/currency is consumed although major/minor/length fields are not checked.420 uses >60=>19 xx, otherwise 20 xx, and ESDATMAS return 0 before setting PARMDATE; failure calls USERABEN. Do not unify these pivots or replace a business parameter with CURRENT DATE.

**Minimum storage:** Reuse existing linkage/COPY fields with their exact lengths and selected overlays. The 32000-byte 302 exchange area and 600-byte 420 date-service area are interfaces, not automatically discardable SQL helpers.

**Error and recovery contract:** Missing service implementations prevent asserting that returned data is valid on every path or that calls are read-only. Prove output validity and nonreturn on failure before reusing their buffers.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-006-V01 / VM4BD302-C001 | Each 40-byte input record and LS-DATE-IND 0 or supplied date | PARTIAL; classified in this guide; G01 |
| RULE-006-V02 / VM4BD420-C001 | DATE-IND0 or supplied date | PARTIAL; classified in this guide; G01 |

**Scenarios to exercise:** PIVOT-59/60/61/79/80: preserve each variant; SERVICE-ERROR: no invalid key consumed; SHORT-RETURN: length contract; PARAMETER-VS-SYSTEM: distinct dates.

**Counterexamples and limits:** Applying the 302 pivot 80 to 420 changes years 61–79; A retained CALL can still contain unresolved database side effects.

**Source evidence:** `IDMS Programs/VM4BD302.cbl` physical L164–177; `IDMS Programs/VM4BD302.cbl` physical L321–337; `DB2 Manual converted Programs/VMDZ4302.txt` physical L266–279; `DB2 Manual converted Programs/VMDZ4302.txt` physical L316–330; `DB2 Manual converted Programs/VMDZ4302.txt` physical L451–467; additional hash-bound ranges in the case ledger.

**Unanswered dependencies:** [Q-000003](../_audit/questions/Q-000003.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000035](../_audit/questions/Q-000035.md)

### RULE-011 — Cursor position and SQL outcome belong to the statement that produced them

**Applies when:** Actual cursor scans in 4302/4420/7200. Singleton SELECT with FETCH FIRST 1 and declaration-only cursor flags do not qualify.

**Migration behavior:** OPEN after input hosts are set, FETCH until the operation’s expected +100, consume row data only after 0, and CLOSE every successful open on normal and business early exits.7200 evaluates its date parameters at OPEN; later INITIALIZE of the same DCLGEN before FETCH is compatible with that single open, but reopening requires restoring cutoff hosts. Nested 4302/4420 cursors need independent status while child SQL overwrites SQLCODE.

**Minimum storage:** An EOF flag may disappear only after an immediate FETCH/test/exit restructuring that preserves status ownership. The existing nested paragraph structures justify separate parent/child EOF state. Do not add saved-SQLCODE for every immediate test automatically.

**Error and recovery contract:** OPEN/FETCH/CLOSE failures are distinct; failed OPEN is not empty input and failed CLOSE must not hide an earlier failure. Missing handlers prevent proof of termination and cleanup.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-011-V01 / VM7BD200-C003 | Opened once with archive cutoff | PARTIALLY_PRESERVED; cross-category technical example; G03 |

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

### RULE-015 — Database-read-only programs still need external-file recovery contracts

**Additional cross-program applicability:** The same file-publication/recovery obligation applies to VM4BD310/VMDZ4310. Its mutation output is outside the Db2 unit of work; Q-000019 asks whether to discard partial output and replay immutable input. The full matrix records this condition separately from the seeded archive case. See [Q-000019](../_audit/questions/Q-000019.md). No recovery policy has been answered in Phase 1.

**Applies when:** Programs emit business files, including 7200 archive,4310 mutation,4302 redemption and 4420 selection; no database checkpoint is observed for these visible normal paths.

**Migration behavior:** Document whether a failed run recreates/discards partial output, appends with deduplication, or resumes under an approved scheme. Preserve sequence association and a stable input/database snapshot if replay is expected to reproduce bytes.7200 assigns F-TELLER while writing 530-byte records;4310 writes 1500-byte records. No supplied JCL/downstream contract resolves the policy.

**Minimum storage:** Do not introduce a restart table solely because a cursor exists. Retain output record and any required sequence state. Additional deduplication/ownership storage needs a demonstrated recovery design.

**Error and recovery contract:** SQL rollback does not undo already written file records. Failure after WRITE, short file output, close failure and lost job acknowledgement require their own reconciliation policy.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-015-V01 / VM7BD200-C007 | Failure after partial archive WRITE | UNRESOLVED; cross-category technical example; G03 |

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
| RULE-017-V01 / VM4BD302-C009 | VM9BC50T QUERY001 exchanges one fixed buffer | PRESERVED_VISIBLE_INTERFACE; classified in this guide; G01 |
| RULE-017-V02 / VM4BD310-C007 | Build one 1500-byte output for valid mutation | UNRESOLVED; cross-category technical example; G03 |
| RULE-017-V03 / VM4BD420-C007 | Date parameter conversion and each successful output | PRESERVED_VISIBLE_LAYOUT; classified in this guide; G01 |
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
| RULE-022-V02 / VM4BD302-C006 | SW-168=1 after all child rows | CONFLICT; classified in this guide; G01 |
| RULE-022-V03 / VM4BD310-C005 | Found event decoded for output | CONFLICT; cross-category technical example; G03 |
| RULE-022-V04 / VM4BD420-C004 | StatusC after event scan | CONFLICT; classified in this guide; G01 |

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
| RULE-023-V02 / VM4BD302-C007 | Only state that remains live may require additional storage | PARTIAL; classified in this guide; G01 |
| RULE-023-V03 / VM4BD310-C008 | Sequential dates/split keys/diagnostics | PARTIALLY_PRESERVED; cross-category technical example; G03 |
| RULE-023-V04 / VM4BD420-C006 | Existing WS-STATUS already represents D | PARTIAL; classified in this guide; G01 |
| RULE-023-V05 / VM7BD200-C008 | Eight date conversions and cutoff | PARTIALLY_PRESERVED; cross-category technical example; G03 |

**Scenarios to exercise:** NO-READS-OF-FLAG; DISJOINT-DATE-LIFETIMES; NESTED-SQL-CLOBBER; LAST-RECORD-AFTER-EOF; PACKED-MOVE; COUNT-ROLE-REUSE.

**Counterexamples and limits:** Every new DCLGEN member is not automatically a mandatory helper; Reusing one variable for simultaneously live values reduces bytes but changes behavior.

**Source evidence:** `Copybook/VMBD205I.cpy` physical L54–55; `Copybook/VMBD205I.cpy` physical L624–673; `DB2 Manual converted Programs/VMDZ1526.txt` physical L74–85; `DB2 Manual converted Programs/VMDZ1526.txt` physical L230–273; `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical L309–324; additional hash-bound ranges in the case ledger.

**Unanswered dependencies:** [Q-000002](../_audit/questions/Q-000002.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000017](../_audit/questions/Q-000017.md), [Q-000020](../_audit/questions/Q-000020.md), [Q-000026](../_audit/questions/Q-000026.md), [Q-000035](../_audit/questions/Q-000035.md)

### RULE-024 — Replace network currency with explicit parent keys and cursor lifetimes

**Applies when:** 4302 traverses owner=>security=>events;4420 sweeps securities=>events. Both are direct network access, not executed LRF requests.

**Migration behavior:** 4302 first SELECTs the owner by three keys, then opens a parent cursor constrained by those owner keys and a child cursor constrained by four security keys.4420 parent cursor scans the whole view and opens a similarly keyed child. Parent and child DCLGENs remain separate, so original FIND CURRENT parent can disappear if no child operation overwrites parent values. Establish order independently; both target child cursors order event ID DESC.

**Minimum storage:** Preserve live parent keys and parent output across child scan without redundant saved keys where current groups already separate them. Current paragraph structure uses independent parent/child EOF flags because each SQL overwrites SQLCODE.

**Error and recovery contract:** Parent 0 may have zero children; child+100 is expected exhaustion, not missing parent. Close each child before next parent, and both levels on applicable termination. Missing runtime handlers prevent complete failure-path proof.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-024-V01 / VM4BD302-C003 | Owner found; zero/one/many securities and events | PARTIAL; classified in this guide; G01 |
| RULE-024-V02 / VM4BD420-C002 | All securities; each security starts WS-STATUS space | PARTIAL; classified in this guide; G01 |

**Scenarios to exercise:** NO-PARENTS; ONE-PARENT-NO-CHILDREN; MULTIPLE-PARENTS; CHILD-ERROR; PARENT-VALUES-AFTER-CHILD; KEY-SCOPE-ISOLATION.

**Counterexamples and limits:** A child query without all four parent predicates can mix securities; A SQL join that changes multiplicity/order is not automatically equivalent to nested currency.

**Source evidence:** `IDMS Programs/VM4BD302.cbl` physical L251–277; `IDMS Programs/VM4BD302.cbl` physical L319–319; `DB2 Manual converted Programs/VMDZ4302.txt` physical L215–246; `DB2 Manual converted Programs/VMDZ4302.txt` physical L338–376; `DB2 Manual converted Programs/VMDZ4302.txt` physical L527–666; additional hash-bound ranges in the case ledger.

**Unanswered dependencies:** [Q-000035](../_audit/questions/Q-000035.md), [Q-000036](../_audit/questions/Q-000036.md), [Q-000037](../_audit/questions/Q-000037.md)

### RULE-025 — Preserve encounter order when selection or output depends on it

**Applies when:** 526/4310 choose FIRST qualifying event;4302/4420 reduce events in encounter order;7200 associates output sequence with traversal order.

**Migration behavior:** Target DESC NR_ID chooses greatest surrogate where legacy FIRST follows an undefined supplied set order.526 filters 0168/0219;4310 filters 0092.4302 first 0060 and strict-greater 0092 updates depend on order/ties;4420 last 0060 wins and D can terminate early.7200 uses ascending formID instead of demonstrated area order. Prove loader/set/sequence ordering and tie behavior before claiming equivalence; a generated ID is not inherently a business timestamp.

**Minimum storage:** Keep existing reducer state such as CI/marker or C/D/S where it embodies business reduction. Additional sorting/key state is justified only by an approved deterministic-order specification.

**Error and recovery contract:** Changed order can select a different update target, CI or output ordinal with SQLCODE 0. Snapshot/concurrency and equal timestamps/IDs require explicit tests; FETCH FIRST 1 merely limits cardinality.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-025-V01 / VM1BD526-C004 | Update route for stock key, event 0168 and service 0219; parent and child cardinality vary. | UNRESOLVED; cross-category technical example; G03,G04 |
| RULE-025-V02 / VM4BD302-C005 | Every traversed event, independently of SW-168 | PARTIAL; classified in this guide; G01 |
| RULE-025-V03 / VM4BD310-C003 | Two or more event 0092 children possible | UNRESOLVED; cross-category technical example; G03 |
| RULE-025-V04 / VM7BD200-C006 | Multiple eligible forms | UNRESOLVED; cross-category technical example; G03 |

**Scenarios to exercise:** TWO-QUALIFYING-EVENTS; EQUAL-TRANSFER-DATES; REPEATED-CREATION; D-AT-DIFFERENT-POSITION; REVERSED-LOAD-ORDER; ARCHIVE-SEQUENCE.

**Counterexamples and limits:** Greatest surrogate does not prove legacy first; Absence of ORDER BY does not establish a stable order; Adding ORDER BY date can change a last-encounter rule.

**Source evidence:** `IDMS Programs/VM1BD526.cbl` physical L197–212; `Schema/VMBTS07.txt` physical L124–136; `DB2 Manual converted Programs/VMDZ1526.txt` physical L575–601; `IDMS Programs/VM4BD302.cbl` physical L300–315; `DB2 Manual converted Programs/VMDZ4302.txt` physical L244–244; additional hash-bound ranges in the case ledger.

**Unanswered dependencies:** [Q-000008](../_audit/questions/Q-000008.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000016](../_audit/questions/Q-000016.md), [Q-000017](../_audit/questions/Q-000017.md), [Q-000018](../_audit/questions/Q-000018.md), [Q-000023](../_audit/questions/Q-000023.md), [Q-000035](../_audit/questions/Q-000035.md), [Q-000036](../_audit/questions/Q-000036.md), [Q-000037](../_audit/questions/Q-000037.md)

### RULE-027 — Keep the redemption date window and CI reducer as separate conditions

**Applies when:** 4302 decides whether a security produces its 90-byte redemption output.

**Migration behavior:** Set SW-168 only for event 0168 with embedded operation 91, eventdate<cutoff and eventdate>=maturity minus one month. January wraps to December of the prior year; day is unchanged, including potentially impossible month-end dates. Independently derive CI: ignore 0060 at/after cutoff, accept first earlier 0060, and replace on 0092 only if transferdate>current marker and<cutoff. Equal-date transfer keeps the first encountered; qualifying redemption may still output CI000000.

**Minimum storage:** Existing SW-168, LAATSTE-CI and date marker encode independent business state. Unused LAATSTE-OPD may disappear. Shared conversion workspace may be reused only while cutoff/maturity comparisons remain live.

**Error and recovery contract:** Calendar-clamping month subtraction or requiring a nonzero CI is a business change, not an automatic correction. Preserve strict upper/inclusive lower bounds pending policy answers.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-027-V01 / VM4BD302-C004 | Event code 0168, embedded operation 91, and event date strictly before the cutoff. | PRESERVED_CONDITIONAL_ON_TYPES; classified in this guide; G01 |

**Scenarios to exercise:** LOWER-BOUND-EQUAL; CUTOFF-EQUAL; JANUARY-WRAP; MARCH31-TO-FEBRUARY31; NO-USABLE-CI; EQUAL-TRANSFER-DATE.

**Counterexamples and limits:** SQL ADD_MONTHS-style clamping can change existing comparison behavior; A qualifying 0168 does not alone identify the selected CI.

**Source evidence:** `IDMS Programs/VM4BD302.cbl` physical L282–298; `DB2 Manual converted Programs/VMDZ4302.txt` physical L381–419.

**Unanswered dependencies:** [Q-000001](../_audit/questions/Q-000001.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000017](../_audit/questions/Q-000017.md)

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

### RULE-032 — Singleton owner absence follows the program’s actual skip/abort policy

**Applies when:** 4302 obtains the owner by three keys from VM9BC50T before scanning its securities.

**Migration behavior:** Target singleton SELECT populates the owner on 0, displays/skips on+100, and invokes SQLERROR otherwise. Legacy code displayed/skipped for every non 0000 owner result. This narrows the benign skip class and changes error policy. Prove intended handling, owner uniqueness, service-output validity and view predicates; do not turn every singleton absence into a generic abort.

**Minimum storage:** Use existing owner host fields and returned service keys. No additional owner-present flag is needed if the immediate branch controls opening the parent cursor.

**Error and recovery contract:** A missing owner has no valid fetched owner data and must not open a cursor with stale keys. Duplicate owner, conversion, privilege or deadlock errors are not ordinary absence even when legacy broadly skipped them.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-032-V01 / VM4BD302-C002 | Issue key derived from VM9BC50T | CHANGED_ERROR_POLICY_UNRESOLVED; classified in this guide; G01 |

**Scenarios to exercise:** OWNER-FOUND; OWNER-MISSING; OWNER-DUPLICATE; SERVICE-RETURN-INVALID; OWNER-SQL-FAILURE; NEXT-INPUT-AFTER-SKIP.

**Counterexamples and limits:** SELECT+100 means skip here, but failure for 526 insert-parent lookup; Copying every IDMS nonzero into SQL+100 conflates different failures.

**Source evidence:** `IDMS Programs/VM4BD302.cbl` physical L237–254; `DB2 Manual converted Programs/VMDZ4302.txt` physical L488–523; `Dclgens/DZWCEFTV.txt` physical L10–25.

**Unanswered dependencies:** [Q-000003](../_audit/questions/Q-000003.md), [Q-000035](../_audit/questions/Q-000035.md), [Q-000037](../_audit/questions/Q-000037.md)

### RULE-033 — Own SQL status immediately and preserve first-failure diagnostics through cleanup

**Applies when:** Every SQL statement and surrounding business/error branch, across all categories.

**Migration behavior:** Record operation, SQLCODE, SQLSTATE/SQLWARN where relevant, row validity, expected no-row meaning, cardinality and next action. Observed targets use 0/100/OTHER, no named negative-code branches, no SQLWARN/SQLSTATE/affected-row checks. +100 means expected end for FETCH and absent restart row; missing required parent/event/business UPDATE/checkpoint UPDATE is rejected. SQLCODE 0 may still carry warnings or a multirow searched UPDATE. Do not invent implemented retry logic.

**Minimum storage:** Immediate tests need no automatic saved-code helper. If SQLERROR executes rollback/logging/cleanup SQL before reporting the first failure, preserve original diagnostics in compatible existing/new storage only to that required lifetime. SQL-LOCATION must identify each operation, not a stale prior UPDATE.

**Error and recovery contract:** Verify SQLERROR/USERABEN termination and rollback; otherwise code can continue with invalid data, infinite cursor loop or false checkpoint. Distinguish constraint, duplicate, conversion/null, deadlock/timeout, authorization and ambiguous-commit scenarios when testing actual runtime; exact code/version policy is unprovided.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-033-V01 / VM1BD526-C014 | Any of 8 executable SQL statements, LR status failure, or completed/short-file call. | UNRESOLVED; classified in this guide; G01,G02,G03,G04 |
| RULE-033-V02 / VM1BD567-C011 | Restart SELECT, INSERT, UPDATE, COMMIT or form UPDATE. | UNRESOLVED; classified in this guide; G01,G02 |
| RULE-033-V03 / VM4BD302-C008 | Each SELECT/OPEN/FETCH/CLOSE | PARTIAL; classified in this guide; G01 |
| RULE-033-V04 / VM4BD420-C005 | Every Db 2 cursor operation including earlyDclose | PARTIAL; classified in this guide; G01 |

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

### VM1BD526-C014 — Operation-specific SQL and error state

**Program:** [VM1BD526.cbl](../programs/VM1BD526.cbl__migration.md) · **Rule/variant:** RULE-033, RULE-033-V01 · **Source assessment:** `UNRESOLVED`.

**Condition:** Any of 8 executable SQL statements, LR status failure, or completed/short-file call.

**Original behavior:** Parent-not-found/LR-ERROR in insert calls IDMS-STOP which displays status, ROLLBACKs and CALLs USERABEN; other LR failures call USERABEN directly; IDMS AUTOSTATUS dependency missing.

**Delivered Db2 behavior:** Restart SELECT accepts 0/+100, parent SELECT only 0, event SELECT 0/+100 distinct displays, all changes/COMMIT only 0; OTHER calls unavailable SQLERROR. No SQLSTATE/SQLWARN/row-count/indicator branch or explicit target ROLLBACK.

**Evidence:** `IDMS Programs/VM1BD526.cbl` physical L193–195; `IDMS Programs/VM1BD526.cbl` physical L206–227; `IDMS Programs/VM1BD526.cbl` physical L247–254; `DB2 Manual converted Programs/VMDZ1526.txt` physical L331–335; `DB2 Manual converted Programs/VMDZ1526.txt` physical L373–379; `DB2 Manual converted Programs/VMDZ1526.txt` physical L401–627.

**Unanswered questions:** [Q-000035](../_audit/questions/Q-000035.md)

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

### VM1BD567-C004 — Restart key and table/view identity

**Program:** [VM1BD567.cbl](../programs/VM1BD567.cbl__migration.md) · **Rule/variant:** RULE-028, RULE-028-V02 · **Source assessment:** `UNRESOLVED`.

**Condition:** Start keyed by business date.

**Original behavior:** FFRECAB CALC key VM1BDF567-A/date/NS-SET-FF0; missing sets SW-RECAB N.

**Delivered Db2 behavior:** DZ01RSTV singleton key VMDZ1567/phase 1/SQL DATE; zero resumes,+100 inserts; map points to DZ01RSTB.

**Evidence:** `IDMS Programs/VM1BD567.cbl` physical L111–129; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L269–280; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L356–387; `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical L873–873.

**Unanswered questions:** [Q-000031](../_audit/questions/Q-000031.md), [Q-000034](../_audit/questions/Q-000034.md)

### VM1BD567-C011 — Statement-specific status and cleanup

**Program:** [VM1BD567.cbl](../programs/VM1BD567.cbl__migration.md) · **Rule/variant:** RULE-033, RULE-033-V02 · **Source assessment:** `UNRESOLVED`.

**Condition:** Restart SELECT, INSERT, UPDATE, COMMIT or form UPDATE.

**Original behavior:** No explicit VMBFAR missing-row branch; BATCH-AUTOSTATUS and missing IDMS-STATUS determine errors.

**Delivered Db2 behavior:** Only restart SELECT accepts 0/+100; all DML and COMMIT accept 0 only; OTHER prints record count and calls SQLERROR. SQL-LOCATION1100 assigned only for business UPDATE. No SQLSTATE/WARN/row-count/indicator checks.

**Evidence:** `IDMS Programs/VM1BD567.cbl` physical L38–40; `IDMS Programs/VM1BD567.cbl` physical L155–158; `IDMS Programs/VM1BD567.cbl` physical L179–180; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L276–280; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L343–450.

**Unanswered questions:** [Q-000035](../_audit/questions/Q-000035.md)

### VM4BD302-C001 — Parameter date and issue lookup service

**Program:** [VM4BD302.cbl](../programs/VM4BD302.cbl__migration.md) · **Rule/variant:** RULE-006, RULE-006-V01 · **Source assessment:** `PARTIAL`.

**Condition:** Each 40-byte input record and LS-DATE-IND 0 or supplied date

**Original behavior:** Derive cutoff using year<80→2000 else 1900; call VM9BC50T QUERY001/CO-CLE2; use service issue key/currency without checking return fields.

**Delivered Db2 behavior:** Same cutoff and call interface; caller name becomes VMDZ4302; owner date converted to EUR, zero/spaces→00010101.

**Evidence:** `IDMS Programs/VM4BD302.cbl` physical L164–177; `IDMS Programs/VM4BD302.cbl` physical L321–337; `DB2 Manual converted Programs/VMDZ4302.txt` physical L266–279; `DB2 Manual converted Programs/VMDZ4302.txt` physical L316–330; `DB2 Manual converted Programs/VMDZ4302.txt` physical L451–467.

**Unanswered questions:** [Q-000003](../_audit/questions/Q-000003.md), [Q-000014](../_audit/questions/Q-000014.md)

### VM4BD302-C002 — Owner lookup and missing owner

**Program:** [VM4BD302.cbl](../programs/VM4BD302.cbl__migration.md) · **Rule/variant:** RULE-032, RULE-032-V01 · **Source assessment:** `CHANGED_ERROR_POLICY_UNRESOLVED`.

**Condition:** Issue key derived from VM9BC50T

**Original behavior:** OBTAIN CALC VMBWCEF; any non 0000 displays and skips this issue; 0000 starts child securities.

**Delivered Db2 behavior:** SELECT one CO_IDISSUS into its same input host; SQL0 processes, +100 displays/skips; other codes call missing SQLERROR.

**Evidence:** `IDMS Programs/VM4BD302.cbl` physical L237–254; `DB2 Manual converted Programs/VMDZ4302.txt` physical L488–523; `Dclgens/DZWCEFTV.txt` physical L10–25.

**Unanswered questions:** [Q-000003](../_audit/questions/Q-000003.md), [Q-000035](../_audit/questions/Q-000035.md), [Q-000037](../_audit/questions/Q-000037.md)

### VM4BD302-C003 — Two-level owner/member navigation

**Program:** [VM4BD302.cbl](../programs/VM4BD302.cbl__migration.md) · **Rule/variant:** RULE-024, RULE-024-V01 · **Source assessment:** `PARTIAL`.

**Condition:** Owner found; zero/one/many securities and events

**Original behavior:** FIRST/NEXT securities within owner; FIRST/NEXT events within security; parent currency implicit.

**Delivered Db2 behavior:** Parent cursor with three owner predicates; nested child cursor with full four-part security key; independent EOC state and close per scope.

**Evidence:** `IDMS Programs/VM4BD302.cbl` physical L251–277; `IDMS Programs/VM4BD302.cbl` physical L319–319; `DB2 Manual converted Programs/VMDZ4302.txt` physical L215–246; `DB2 Manual converted Programs/VMDZ4302.txt` physical L338–376; `DB2 Manual converted Programs/VMDZ4302.txt` physical L527–666.

**Unanswered questions:** [Q-000035](../_audit/questions/Q-000035.md), [Q-000036](../_audit/questions/Q-000036.md), [Q-000037](../_audit/questions/Q-000037.md)

### VM4BD302-C004 — Redemption window

**Program:** [VM4BD302.cbl](../programs/VM4BD302.cbl__migration.md) · **Rule/variant:** RULE-027, RULE-027-V01 · **Source assessment:** `PRESERVED_CONDITIONAL_ON_TYPES`.

**Condition:** Event code 0168, embedded operation 91, and event date strictly before the cutoff.

**Original behavior:** Set SW-168 when eventdate≥maturity minus one month; subtract month keeping day; January rolls December/prior year.

**Delivered Db2 behavior:** Same conjunction and month arithmetic after date/key format changes. No real calendar-normalization routine.

**Evidence:** `IDMS Programs/VM4BD302.cbl` physical L282–298; `DB2 Manual converted Programs/VMDZ4302.txt` physical L381–419.

**Unanswered questions:** [Q-000001](../_audit/questions/Q-000001.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000017](../_audit/questions/Q-000017.md)

### VM4BD302-C005 — Creation and transfer CI selection

**Program:** [VM4BD302.cbl](../programs/VM4BD302.cbl__migration.md) · **Rule/variant:** RULE-025, RULE-025-V02 · **Source assessment:** `PARTIAL`.

**Condition:** Every traversed event, independently of SW-168

**Original behavior:** Ignore 0060 at/after cutoff; first qualifying 0060 sets marker 1/CI;0092 replaces if embedded transferdate>marker and<cutoff. Strict tie comparison preserves first encountered maximum.

**Delivered Db2 behavior:** Same branches, CI1+5 recombined. Child order forced surrogate descending; drops never-read LAATSTE-OPD assignment/storage.

**Evidence:** `IDMS Programs/VM4BD302.cbl` physical L300–315; `DB2 Manual converted Programs/VMDZ4302.txt` physical L244–244; `DB2 Manual converted Programs/VMDZ4302.txt` physical L421–447.

**Unanswered questions:** [Q-000014](../_audit/questions/Q-000014.md), [Q-000017](../_audit/questions/Q-000017.md), [Q-000036](../_audit/questions/Q-000036.md)

### VM4BD302-C006 — Mapped values, composite event key and output

**Program:** [VM4BD302.cbl](../programs/VM4BD302.cbl__migration.md) · **Rule/variant:** RULE-022, RULE-022-V02 · **Source assessment:** `CONFLICT`.

**Condition:** SW-168=1 after all child rows

**Original behavior:** Output six-digit CI, amount S9(12)V9(6), currency, issue, 13-digit stock/check; event key decoded through packed/mixed 20-byte group.

**Delivered Db2 behavior:** DCLGEN DECIMAL(15),2 amount; reconstruct 12+1 stock; event key display 28; NOT NULL selected columns have no indicators.

**Evidence:** `IDMS Programs/VM4BD302.cbl` physical L105–123; `IDMS Programs/VM4BD302.cbl` physical L269–275; `DB2 Manual converted Programs/VMDZ4302.txt` physical L87–110; `DB2 Manual converted Programs/VMDZ4302.txt` physical L364–375; `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical L360–360; `Dclgens/DZEVEFTV.txt` physical L19–43.

**Unanswered questions:** [Q-000002](../_audit/questions/Q-000002.md), [Q-000017](../_audit/questions/Q-000017.md), [Q-000037](../_audit/questions/Q-000037.md), [Q-000038](../_audit/questions/Q-000038.md)

### VM4BD302-C007 — Minimal working storage

**Program:** [VM4BD302.cbl](../programs/VM4BD302.cbl__migration.md) · **Rule/variant:** RULE-023, RULE-023-V02 · **Source assessment:** `PARTIAL`.

**Condition:** Only state that remains live may require additional storage

**Original behavior:** SW-EOF, SW-168, cutoff/maturity, packed key, CI and call interface already exist.

**Delivered Db2 behavior:** Adds counters/logging, staging groups and two cursor flags; several staging values have safe existing receivers or are unused.

**Evidence:** `DB2 Manual converted Programs/VMDZ4302.txt` physical L75–201; `DB2 Manual converted Programs/VMDZ4302.txt` physical L369–398; `DB2 Manual converted Programs/VMDZ4302.txt` physical L428–444.

**Unanswered questions:** [Q-000002](../_audit/questions/Q-000002.md), [Q-000017](../_audit/questions/Q-000017.md), [Q-000035](../_audit/questions/Q-000035.md)

### VM4BD302-C008 — Statement-owned SQL outcome

**Program:** [VM4BD302.cbl](../programs/VM4BD302.cbl__migration.md) · **Rule/variant:** RULE-033, RULE-033-V03 · **Source assessment:** `PARTIAL`.

**Condition:** Each SELECT/OPEN/FETCH/CLOSE

**Original behavior:** Startup failures call USERABEN; owner/traversal non 0000 stops/skips in main code; no IDMS-STATUS routine invoked for traversal.

**Delivered Db2 behavior:** SELECT/FETCH handle 0/100; OPEN/CLOSE only 0; all other SQLCODE via SQLERROR; flags isolate nested success/EOF.

**Evidence:** `IDMS Programs/VM4BD302.cbl` physical L179–215; `IDMS Programs/VM4BD302.cbl` physical L245–268; `DB2 Manual converted Programs/VMDZ4302.txt` physical L502–666.

**Unanswered questions:** [Q-000003](../_audit/questions/Q-000003.md), [Q-000035](../_audit/questions/Q-000035.md)

### VM4BD302-C009 — CALL interface tables and overlays

**Program:** [VM4BD302.cbl](../programs/VM4BD302.cbl__migration.md) · **Rule/variant:** RULE-017, RULE-017-V01 · **Source assessment:** `PRESERVED_VISIBLE_INTERFACE`.

**Condition:** VM9BC50T QUERY001 exchanges one fixed buffer

**Original behavior:** COPY REPLACING BC50I/BC50O; group moves to/from 32000 one-byte OCCURS; key overlay selector 2.

**Delivered Db2 behavior:** Same copybooks, replacement context and whole-group transfer; no SQL rowsets introduced.

**Evidence:** `IDMS Programs/VM4BD302.cbl` physical L73–79; `IDMS Programs/VM4BD302.cbl` physical L323–337; `DB2 Manual converted Programs/VMDZ4302.txt` physical L51–58; `DB2 Manual converted Programs/VMDZ4302.txt` physical L453–467; `Copybook/VM9BC50I.cpy` physical L19–58; `Copybook/VM9BC50O.cpy` physical L99–348.

**Unanswered questions:** [Q-000003](../_audit/questions/Q-000003.md)

### VM4BD420-C001 — As-of date and date-service call

**Program:** [VM4BD420.cbl](../programs/VM4BD420.cbl__migration.md) · **Rule/variant:** RULE-006, RULE-006-V02 · **Source assessment:** `PARTIAL`.

**Condition:** DATE-IND0 or supplied date

**Original behavior:** Two-digit year>60→19 else 20; call ESDATMAS; return 0 supplies PARMDATE, otherwise USERABEN.

**Delivered Db2 behavior:** Same parameter/date-service flow and copybook; later fetched DATE parsed as EUR with minimum/maximum sentinel substitution.

**Evidence:** `IDMS Programs/VM4BD420.cbl` physical L119–148; `DB2 Manual converted Programs/VMDZ4420.cbl` physical L209–238; `DB2 Manual converted Programs/VMDZ4420.cbl` physical L282–295; `Copybook/ESDATMAS.cpy` physical L15–38.

**Unanswered questions:** [Q-000014](../_audit/questions/Q-000014.md), [Q-000035](../_audit/questions/Q-000035.md)

### VM4BD420-C002 — Area sweep and nested events

**Program:** [VM4BD420.cbl](../programs/VM4BD420.cbl__migration.md) · **Rule/variant:** RULE-024, RULE-024-V02 · **Source assessment:** `PARTIAL`.

**Condition:** All securities; each security starts WS-STATUS space

**Original behavior:** FIRST/NEXT in area, FIRST/NEXT events, FIND CURRENT parent before next area read.

**Delivered Db2 behavior:** Unfiltered read-only parent cursor; keyed child cursor; parent DCLGEN group persists, so FIND CURRENT removed. No parent order, child IDdescending.

**Evidence:** `IDMS Programs/VM4BD420.cbl` physical L151–188; `DB2 Manual converted Programs/VMDZ4420.cbl` physical L164–196; `DB2 Manual converted Programs/VMDZ4420.cbl` physical L245–279; `DB2 Manual converted Programs/VMDZ4420.cbl` physical L376–474.

**Unanswered questions:** [Q-000035](../_audit/questions/Q-000035.md), [Q-000036](../_audit/questions/Q-000036.md), [Q-000037](../_audit/questions/Q-000037.md)

### VM4BD420-C003 — C/D/S state and early disqualification

**Program:** [VM4BD420.cbl](../programs/VM4BD420.cbl__migration.md) · **Rule/variant:** RULE-004, RULE-004-V01 · **Source assessment:** `PRESERVED_CONDITIONAL_ON_ORDER_TYPES`.

**Condition:** Only events with eventdate≤PARMDATE

**Original behavior:** 0060→C/save key unlessD;0168 withstate≠1→D and artificial ERROR-STATUS0307;0217→S only ifspace. D terminates child walk and suppresses output. End-of-set writes onlyC.

**Delivered Db2 behavior:** Same state transitions; SW-STATUS-D replaces artificial database status; close child then write only ifnotD andC.

**Evidence:** `IDMS Programs/VM4BD420.cbl` physical L190–224; `DB2 Manual converted Programs/VMDZ4420.cbl` physical L268–314.

**Unanswered questions:** [Q-000004](../_audit/questions/Q-000004.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000017](../_audit/questions/Q-000017.md), [Q-000036](../_audit/questions/Q-000036.md)

### VM4BD420-C004 — Output and expanded composite key

**Program:** [VM4BD420.cbl](../programs/VM4BD420.cbl__migration.md) · **Rule/variant:** RULE-022, RULE-022-V04 · **Source assessment:** `CONFLICT`.

**Condition:** StatusC after event scan

**Original behavior:** Output two packed 15,2 amounts, creationCI9(6), issue 4, sequence 9(4), issue dateX8, stockR2X12.

**Delivered Db2 behavior:** Same file layout; DCLGEN amounts/sequence moved numerically; stockCHAR12 directly; date convertedEUR→8 digits; creationkey 20 packed→28 display.

**Evidence:** `IDMS Programs/VM4BD420.cbl` physical L61–84; `IDMS Programs/VM4BD420.cbl` physical L213–221; `DB2 Manual converted Programs/VMDZ4420.cbl` physical L50–73; `DB2 Manual converted Programs/VMDZ4420.cbl` physical L316–339; `Dclgens/DZBEFFTV.txt` physical L37–59; `Dclgens/DZEVEFTV.txt` physical L19–43.

**Unanswered questions:** [Q-000004](../_audit/questions/Q-000004.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000017](../_audit/questions/Q-000017.md), [Q-000037](../_audit/questions/Q-000037.md), [Q-000039](../_audit/questions/Q-000039.md)

### VM4BD420-C005 — EOF/error separation and cursor cleanup

**Program:** [VM4BD420.cbl](../programs/VM4BD420.cbl__migration.md) · **Rule/variant:** RULE-033, RULE-033-V04 · **Source assessment:** `PARTIAL`.

**Condition:** Every Db 2 cursor operation including earlyDclose

**Original behavior:** IDMS-STATUS on bind/ready and each fetchedrecord; DB-END-OF-SET controls loops; legacy D synthesizes 0307.

**Delivered Db2 behavior:** Each OPEN/CLOSE handles 0/OTHER; FETCH0/100/OTHER. Independent flags; successful earlyD closes cursor then no write.

**Evidence:** `IDMS Programs/VM4BD420.cbl` physical L151–191; `IDMS Programs/VM4BD420.cbl` physical L199–224; `DB2 Manual converted Programs/VMDZ4420.cbl` physical L357–494.

**Unanswered questions:** [Q-000035](../_audit/questions/Q-000035.md)

### VM4BD420-C006 — Only justified helper storage

**Program:** [VM4BD420.cbl](../programs/VM4BD420.cbl__migration.md) · **Rule/variant:** RULE-023, RULE-023-V04 · **Source assessment:** `PARTIAL`.

**Condition:** Existing WS-STATUS already represents D

**Original behavior:** Existing WS-STATUS, composite-key area, PARMDATE/dateoverlays.

**Delivered Db2 behavior:** Extra SW-STATUS-D and duplicate eventdate removable; two independent cursor flags needed by present nestedPERFORM shape; counters/timestamp are diagnostic.

**Evidence:** `DB2 Manual converted Programs/VMDZ4420.cbl` physical L61–151; `DB2 Manual converted Programs/VMDZ4420.cbl` physical L262–314.

**Unanswered questions:** [Q-000014](../_audit/questions/Q-000014.md), [Q-000035](../_audit/questions/Q-000035.md)

### VM4BD420-C007 — Date overlays and file boundaries

**Program:** [VM4BD420.cbl](../programs/VM4BD420.cbl__migration.md) · **Rule/variant:** RULE-017, RULE-017-V03 · **Source assessment:** `PRESERVED_VISIBLE_LAYOUT`.

**Condition:** Date parameter conversion and each successful output

**Original behavior:** DATE6 redefinesDATE6R reversed fields; group moves make explicit DDMMYY order. No source OCCURS or SQL arrays.

**Delivered Db2 behavior:** Same legacy overlay; new DA-CCYYMMDD-R is an 8 byte alias; output remains 50 bytes and is initialized perwrite.

**Evidence:** `IDMS Programs/VM4BD420.cbl` physical L87–106; `DB2 Manual converted Programs/VMDZ4420.cbl` physical L113–151; `DB2 Manual converted Programs/VMDZ4420.cbl` physical L316–339; `Copybook/ESDATMAS.cpy` physical L15–38.

**Unanswered questions:** [Q-000014](../_audit/questions/Q-000014.md), [Q-000017](../_audit/questions/Q-000017.md)

## 6. Cross-program verification and validation scenarios

Rule applicability is checked against every one of the six IDMS inputs, including programs that did not originate the rule. A rule is not “verified for all programs” merely because it is linked to its seed cases. UNKNOWN records missing evidence; CONTRADICTED retains a demonstrated conflict; NOT_APPLICABLE requires a scoped reason. The 198-cell matrix contains the per-program condition, source evidence, case IDs and unresolved questions. Production status remains PARTIAL where required evidence is missing.

| Scenario family | Inputs / boundary | Expected assessment or required outcome |
| --- | --- | --- |
| Empty owner/parent/child levels | Exercise owner absent, owner present/no parent, parent/no child separately. | Only the approved missing-owner skip is benign; each cursor EOF must leave no stale row eligible for output. |
| 302 exact window | Below/equal/above both bounds; January rollover; March 31 month subtraction. | Retain strict cutoff and inclusive lower bound; calendar clamping remains an unanswered business change. |
| Encounter-order reducer | Reverse two creations; two equal-date transfers; no usable CI with qualifying redemption. | Preserve first/last/tie semantics for the chosen order, including possible CI 000000 in 302. |
| 420 C/D/S and no-extra-D-flag | Creation/status/redemption permutations, future/equal dates, disqualifying state versus state 1. | D stops and suppresses output; C writes; a no-helper rewrite must produce the same state and selected CI. |
| SQL lifecycle failures | OPEN/FETCH/CLOSE error at both levels, returning handler, cleanup overwriting SQLCODE. | Do not process invalid hosts or loop forever; preserve original failure and close only appropriately opened resources. |
| Representation/partial file | Maximum amount, leading-zero keys, DATE format variants, failure after output WRITE. | Approved numeric domains and byte layout; partial output must follow the unanswered per-job recovery policy. |

These are production-oriented test specifications. Static source tracing, declaration arithmetic and separate Python reasoning models can demonstrate a particular condition or counterexample. They cannot establish COBOL compiler behavior, SQL runtime behavior, complete output byte compatibility or job recovery on the real mainframe. Actual environment tests must report their own inputs, observed outputs and evidence.

## 7. Open business and evidence questions

Each link opens the exact unanswered Phase 1 snapshot. Editable current question files live in `Migration-Analysis/Human-in-Loops/`. A later answer must be applied only to its accepted file/case scope and must not rewrite this baseline. The following includes category questions and applicable shared technical questions; it does not imply that every question applies to every program.

| Question | Affected files | Decision or evidence required |
| --- | --- | --- |
| [Q-000001](../_audit/questions/Q-000001.md) | VM4BD302.cbl | Is the exact retained month-number subtraction with unchanged day the intended cutoff, including March 31→February 31, or should production use calendar month-end clamping? |
| [Q-000002](../_audit/questions/Q-000002.md) | VM4BD302.cbl | Are 12-character stock IDs and six-character CIs always decimal digits for this output, and can the 13-integer-digit amount exceed the 12-integer-digit output capacity? |
| [Q-000003](../_audit/questions/Q-000003.md) | VM4BD302.cbl | For VM9BC50T QUERY001/CO-CLE2, which return-major/minor/actual-length values authorize use of issue key and currency, and must failure skip, reject, or abort the input? |
| [Q-000004](../_audit/questions/Q-000004.md) | VM4BD420.cbl | For statusC output, is the last encountered qualifying 0060 creation event intended, and are its 8-digit embedded creationCI values constrained so the 6-digit UIT-NR-CIO-CRE receives the correct identifier? |
| [Q-000005](../_audit/questions/Q-000005.md) | VM7BD200.cbl | Must the 478-byte embedded VMBFAS image preserve every original byte, including the 2- and 14-byte filler areas noted as containing COMP-3 values, or are blank fillers approved? Supply the generated original record and the downstream layout. |
| [Q-000006](../_audit/questions/Q-000006.md) | VM7BD200.cbl | Was every accounting date 00000000 migrated to Db 2 DATE0001-01-01, and must the creation-date fallback and strict less-than cutoff remain exactly as in the original? |
| [Q-000007](../_audit/questions/Q-000007.md) | VM7BD200.cbl | What job and file policy handles a partially written archive extract: recreate from a frozen row snapshot, append with deduplication, or resume? Supply the operational contract. |
| [Q-000008](../_audit/questions/Q-000008.md) | VM7BD200.cbl | Is output order, including the F-TELLER number associated with each form, a business contract? May the same form set be ordered by Db 2 surrogate NR_ID instead of original area order? State tie and concurrency rules. |
| [Q-000010](../_audit/questions/Q-000010.md) | VM1BD567.cbl | Must a blank or zero input creation date select the form key dated 0001-01-01, or should such input be rejected or routed to a different outcome? |
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
| [Q-000023](../_audit/questions/Q-000023.md) | VM4BD310.cbl | When a stock has multiple event 0092 records, must the program choose the first event in the original VMBEFF-VMBEVEF set order, or the event with the greatest relational NR_ID? Please provide the set ORDER definition and the surrogate-ID load and tie rules. |
| [Q-000024](../_audit/questions/Q-000024.md) | VM7BD200.cbl | Should mapping logical row 193, RA_BASFMAS _479BFAS, be corrected to the exact DCLGEN and SQL identifier RA_BASFMAS_479BFAS? |
| [Q-000025](../_audit/questions/Q-000025.md) | VM7BD200.cbl | Supply VMDZ270I and confirm the exact archive-output layout and its consumer contract against supplied VMBZ270I. |
| [Q-000026](../_audit/questions/Q-000026.md) | VM4BD310.cbl | Supply VMDZ510I and confirm the exact 1500-byte mutation-output layout, all aliases and OCCURS/REDEFINES against supplied VMBD510I. |
| [Q-000031](../_audit/questions/Q-000031.md) | VM1BD526.cbl, VM1BD567.cbl | When moving these jobs from IDMS to Db 2, are existing FFRECAB checkpoints converted to the new program/phase/date key, or is a verified fresh input/data boundary required before the first Db 2 run? |
| [Q-000034](../_audit/questions/Q-000034.md) | VM1BD526.cbl, VM1BD567.cbl | Provide the DDL/catalog identity and field mapping proving that DZ01RSTV is the intended updatable view of DZ01RSTB for FFRECAB, including uniqueness on program, phase and date, authorization/bind qualifier, triggers and constraints. |
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
