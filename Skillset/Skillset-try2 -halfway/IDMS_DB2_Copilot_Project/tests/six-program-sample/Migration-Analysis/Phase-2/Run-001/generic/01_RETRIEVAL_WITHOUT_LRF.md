# G01 — Retrieval without LRF

**Phase:** 2 · **Run:** Run-001 · **Execution mode:** TEST_REHEARSAL · **Source/production assessment:** PARTIAL · **Baseline:** Phase-1/Run-001.

**Answers:** 36 PROVIDED test assumptions, 3 DEFERRED questions, 0 real human answers. All 39 production questions remain OPEN. The original source findings are retained; the exact scoped rehearsal revisions appear inside every rule and case below.

This is a conditional generic synthesis of the supplied six-program corpus. It contains **22 classified cases** and **20 rule definitions** for this category. Rules shared across categories retain the same RULE IDs; their source variants remain explicitly identified. The complete corpus contains 60 distinct cases and 33 distinct rules.

## 1. Scope and what this sample establishes

This guide covers the direct owner/security/event navigation in VM4BD302 → VMDZ4302 and the direct security/event navigation in VM4BD420 → VMDZ4420. It also covers the non-LRF restart lookup in both updaters and the read obligation folded into VM1BD567's searched UPDATE. A program can contribute a retrieval case here and an update/restart case elsewhere. VM1BD526's business writes remain LRF cases; their restart SELECT is ordinary SQL retrieval. VM1BD567 has no executed LRF request despite LRF declarations in its subschema.

The strongest reusable result is a conditional transformation: replace implicit network currency with explicit key predicates and separate live parent/child storage, then retain the original business reduction and status meanings. A cursor alone does not determine which child wins, whether a parent is mandatory, or how a partial output file is recovered. Those are separate obligations.

Every recommendation below separates an observed source behavior, an observed target behavior, an unresolved condition and a proposed change. A manually converted program is evidence of a developer's approach; its correctness is not assumed. The reports include a demonstrated missing-field defect, representation conflicts and unresolved operational contracts. The frozen Phase 1 snapshots remain unanswered; this Phase 2 revision consumes the current scoped temporary answers listed in section 7.

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

VMDZ4302 writes 90-byte records and VMDZ4420 writes 50-byte records. Their visible mains have no database checkpoint or persisted output position. A crash after some WRITEs can therefore leave partial output even though SQL is read-only. Q-000038 and Q-000039 now supply separate temporary replay/publication policies for these two jobs; their exact stable-input/database-snapshot assumptions are applied below, without claiming real JCL implementation. The temporary record/communication areas are not evidence of a persistent buffer table. [Q-000038; Q-000039; each program report sections 9 and 12.]

### Phase 2: navigation and output decisions under the temporary answers

For 302, the test keeps month-number subtraction, the exact strict/inclusive bounds and its first-creation/strict-greater-transfer CI reducer. Successful service responses, numeric output domains, EUR strings and matching DESC encounter order are assumptions with separate scope. For 420, last qualifying 0060 is intended in the fixture and its top two CI digits are zero. The existing C/D/S state remains sufficient for the proposed removal of the duplicate D flag. These policies leave the real loader, set order, service-error and range contracts open.

Q-000038 and Q-000039 separately assume discard/recreate from stable input and database snapshots, with publication after success. These are external job assumptions; the delivered programs have not acquired a checkpoint, snapshot or publication mechanism. The corpus-wide technical examples from 310/7200 retain their own recovery conditions and must not inherit the navigation assumptions merely because a rule is shared.

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

### RULE-004 — Keep business rejection separate from cursor exhaustion

**Phase 2 conditional rule and scenario revision:** For 420 only, Q-000004 chooses the last encountered qualifying 0060 creation event and restricts the fixture's upper two CI digits to zero; Q-000036 assumes DESC ID reproduces legacy encounter order. Q-000014 supplies EUR parsing for the documented branches. The C/D/S transitions and date <= cutoff remain unchanged. Exercise repeated creations, C→D, future D, S→C, C→S and cutoff equality. The redundant SW-STATUS-D can still be replaced conceptually by existing WS-STATUS = D, but no application edit or compiler validation occurred. Real CI domain and encounter order remain open.

**Exact scoped answer dependencies:** [Q-000004](../_audit/questions/Q-000004.md) [VM4BD420.cbl; PROVIDED]; [Q-000014](../_audit/questions/Q-000014.md) [VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl, VM7BD200.cbl; PROVIDED]; [Q-000017](../_audit/questions/Q-000017.md) [VM1BD526.cbl, VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl; PROVIDED]; [Q-000036](../_audit/questions/Q-000036.md) [VM4BD302.cbl, VM4BD420.cbl; PROVIDED]. Full answer hashes and origin are in section 7.

**Six-program source recheck:** VM1BD526.cbl = N; VM1BD567.cbl = N; VM4BD302.cbl = N; VM4BD310.cbl = N; VM4BD420.cbl = U; VM7BD200.cbl = N. The legend and complete matrix are in section 6; no synthetic answer upgrades the production disposition.

**Applies when:** The 4420 event reducer can stop early because a security is disqualified; other cursor scans apply only when an equivalent business stop is actually present.

**Source-derived migration behavior and production conditions:** Start each parent with blank WS-STATUS. For event date <= PARMDATE, 0060 sets C and replaces the creation key unless already D; 0168 with state flag not 1 sets D and stops; 0217 sets S only from blank. Only C emits a 50-byte output. The legacy artificially assigned 0307 on D; the target separates business D from SQL EOF. Repeated 0060 means last encountered creation CI wins, so child order still matters.

**Minimum storage:** Existing WS-STATUS already carries D. SW-STATUS-D is removable if loop exit and guards use that existing state without changing the C/D/S transitions. EOF state and parent/child host lifetimes remain separate.

**Error and recovery contract:** CLOSE the child on both ordinary EOF and D early termination. Do not classify an SQL failure as a business D or set SQLCODE artificially. Returning handlers and failed CLOSE remain unresolved.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-004-V01 / VM4BD420-C003 | Only events with eventdate≤PARMDATE | PRESERVED_CONDITIONAL_ON_ORDER_TYPES; classified in this guide; G01 |

**Scenarios to exercise:** C-THEN-S: remainsC; S-THEN-C: becomesC; D-AFTER-C: no output; FUTURE-D: ignored; TWO-CREATIONS: last encountered key; DATE-EQUAL: included.

**Counterexamples and limits:** Using EOF as D can wrongly treat an SQL failure as a legitimate exclusion; Replacing encounter order with MAX(date) changes repeated 0060 semantics.

**Source evidence:** `IDMS Programs/VM4BD420.cbl` physical L190–224; `DB2 Manual converted Programs/VMDZ4420.cbl` physical L268–314.

**Question versions / production gaps:** [Q-000004](../_audit/questions/Q-000004.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000017](../_audit/questions/Q-000017.md), [Q-000036](../_audit/questions/Q-000036.md)

### RULE-005 — Collapse direct CALC plus MODIFY only when the keyed UPDATE preserves the obligation

**Phase 2 conditional rule and scenario revision:** For 567 only, Q-000020 permits a hypothetical compatible 1200-byte input layout; Q-000037 assumes the relevant business view and logical key uniqueness; Q-000035 supplies fatal unexpected-error behavior. Under that fixture the direct six-key UPDATE can satisfy the read/modify obligation without a separate SELECT or whole-row shadow buffer. Keep missing-row +100 as failure, and retain duplicate-key/multirow cases outside the uniqueness assumption. Q-000010 separately governs blank/zero creation-date normalization; it must not be inferred from DCLGEN spelling or the key-uniqueness answer.

**Exact scoped answer dependencies:** [Q-000010](../_audit/questions/Q-000010.md) [VM1BD567.cbl; PROVIDED]; [Q-000020](../_audit/questions/Q-000020.md) [VM1BD526.cbl, VM1BD567.cbl; PROVIDED]; [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]; [Q-000037](../_audit/questions/Q-000037.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. Full answer hashes and origin are in section 7.

**Six-program source recheck:** VM1BD526.cbl = N; VM1BD567.cbl = U; VM4BD302.cbl = N; VM4BD310.cbl = N; VM4BD420.cbl = N; VM7BD200.cbl = N. The legend and complete matrix are in section 6; no synthetic answer upgrades the production disposition.

**Applies when:** 567 directly obtains VMBFAR by CALC, changes the accounting date, then MODIFYs; no intervening read-derived computation or selected LRF parent path exists.

**Source-derived migration behavior and production conditions:** Use the same six predicates: service 1815, client, creation date, document, detail operation and general operation. Update the mapped accounting date plus explicitly introduced audit fields. A prior SELECT/full-row buffer can be omitted only when key uniqueness, locking/constraint and missing-row behavior are established. Mapping names primary-key intent; DCLGEN does not enforce it.

**Minimum storage:** The target references nine of 51 DZBFARTV business hosts. Exact compatible key/date/audit hosts are needed;42 unused generated members and a second full-row buffer are not mandatory helpers. Retain the separate 1200-byte external input layout.

**Error and recovery contract:** UPDATE 0 increments one successful-statement statistic; +100 is an error, not loop EOF. Without uniqueness or an affected-row check,0 may represent multiple rows. Error/abort and actual view triggers need review.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-005-V01 / VM1BD567-C001 | Every successfully read operation record. | SUPPORTED_WITH_GAPS; classified in this guide; G01,G02 |

**Scenarios to exercise:** ONE-FORM: accounting date only plus approved audit; MISSING-FORM: reject; DUPLICATE-KEY: prove prevented or detect; DETAIL-GENERAL-SWAP: distinguish predicates.

**Counterexamples and limits:** A parent/child comment does not add a parent existence check; SQLCODE 0 alone does not prove exactly one form changed.

**Source evidence:** `IDMS Programs/VM1BD567.cbl` physical L147–158; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L192–228; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L426–451; `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical L79–91.

**Question versions / production gaps:** [Q-000020](../_audit/questions/Q-000020.md), [Q-000035](../_audit/questions/Q-000035.md), [Q-000037](../_audit/questions/Q-000037.md)

### RULE-006 — Preserve each program’s parameter and CALL date contract

**Phase 2 conditional rule and scenario revision:** Q-000003 restricts 302's service fixture to successful, complete 2610-byte VM9BC50T responses; it does not answer failed/short-response handling. Q-000014 assumes EUR fetched DATE representation only for its four named programs. Keep 302's year pivot 80 and 420's pivot 60, and keep ESDATMAS/USERABEN's visible branch. Q-000035 assumes nonreturn on fatal errors, while missing service executables and return/length validation remain production gaps. Add a short-response counterexample that must not be relabelled ordinary owner absence.

**Exact scoped answer dependencies:** [Q-000003](../_audit/questions/Q-000003.md) [VM4BD302.cbl; PROVIDED]; [Q-000014](../_audit/questions/Q-000014.md) [VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl, VM7BD200.cbl; PROVIDED]; [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. Full answer hashes and origin are in section 7.

**Six-program source recheck:** VM1BD526.cbl = N; VM1BD567.cbl = N; VM4BD302.cbl = U; VM4BD310.cbl = N; VM4BD420.cbl = U; VM7BD200.cbl = N. The legend and complete matrix are in section 6; no synthetic answer upgrades the production disposition.

**Applies when:** 302 and 420 obtain cutoff/service data before database retrieval; the same principle applies only to calls actually executed elsewhere.

**Source-derived migration behavior and production conditions:** 302 uses a year pivot below 80=>20 xx, otherwise 19 xx, and VM9BC50T QUERY001 with CO-CLE2; returned issue/currency is consumed although major/minor/length fields are not checked.420 uses >60=>19 xx, otherwise 20 xx, and ESDATMAS return 0 before setting PARMDATE; failure calls USERABEN. Do not unify these pivots or replace a business parameter with CURRENT DATE.

**Minimum storage:** Reuse existing linkage/COPY fields with their exact lengths and selected overlays. The 32000-byte 302 exchange area and 600-byte 420 date-service area are interfaces, not automatically discardable SQL helpers.

**Error and recovery contract:** Missing service implementations prevent asserting that returned data is valid on every path or that calls are read-only. Prove output validity and nonreturn on failure before reusing their buffers.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-006-V01 / VM4BD302-C001 | Each 40-byte input record and LS-DATE-IND 0 or supplied date | PARTIAL; classified in this guide; G01 |
| RULE-006-V02 / VM4BD420-C001 | DATE-IND0 or supplied date | PARTIAL; classified in this guide; G01 |

**Scenarios to exercise:** PIVOT-59/60/61/79/80: preserve each variant; SERVICE-ERROR: no invalid key consumed; SHORT-RETURN: length contract; PARAMETER-VS-SYSTEM: distinct dates.

**Counterexamples and limits:** Applying the 302 pivot 80 to 420 changes years 61–79; A retained CALL can still contain unresolved database side effects.

**Source evidence:** `IDMS Programs/VM4BD302.cbl` physical L164–177; `IDMS Programs/VM4BD302.cbl` physical L321–337; `DB2 Manual converted Programs/VMDZ4302.txt` physical L266–279; `DB2 Manual converted Programs/VMDZ4302.txt` physical L316–330; `DB2 Manual converted Programs/VMDZ4302.txt` physical L451–467; additional hash-bound ranges in the case ledger.

**Question versions / production gaps:** [Q-000003](../_audit/questions/Q-000003.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000035](../_audit/questions/Q-000035.md)

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
| RULE-011-V01 / VM7BD200-C003 | Opened once with archive cutoff | PARTIALLY_PRESERVED; cross-category technical example; G03 |

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
| RULE-012-V01 / VM4BD310-C006 | DB2 DATE hosts populated | UNRESOLVED; cross-category technical example; G03 |
| RULE-012-V02 / VM7BD200-C004 | Nonzero accounting date else creation date; strictly before cutoff | UNRESOLVED; cross-category technical example; G03 |

**Scenarios to exercise:** CUTOFF-EQUAL: excluded 7200; ZERO-ACCOUNTING-FALLBACK; EUR/ISO-OUTPUT-CONFIG; PACKED-CREATION-CONVERSION; LEAP/INVALID/HIGH-DATE.

**Counterexamples and limits:** 302 uses strict upper bound while 4420 includes equality; Group MOVE of eight display digits into COMP-3 does not perform the required numeric conversion.

**Source evidence:** `IDMS Programs/VM4BD310.cbl` physical L258–263; `DB2 Manual converted Programs/VMDZ4310.txt` physical L404–433; `IDMS Programs/VM7BD200.cbl` physical L188–191; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L366–370; `DB2 Manual converted Programs/VMDZ7200.cbl` physical L417–423.

**Question versions / production gaps:** [Q-000006](../_audit/questions/Q-000006.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000025](../_audit/questions/Q-000025.md)

### RULE-013 — Creation-date sentinel normalization changes a searched business key

**Phase 2 conditional rule and scenario revision:** For 567 only, Q-000010 chooses 0001-01-01 as the missing creation-date sentinel in the test key. The target's blank/zero substitution is therefore an intended fixture policy while remaining a source behavior change. Keep valid leap date, blank, zero, malformed nonzero date and absent sentinel-key row as distinct cases. No new sentinel switch is required, and this answer must not be applied to the run date or to unrelated programs.

**Exact scoped answer dependencies:** [Q-000010](../_audit/questions/Q-000010.md) [VM1BD567.cbl; PROVIDED]. Full answer hashes and origin are in section 7.

**Six-program source recheck:** VM1BD526.cbl = N; VM1BD567.cbl = U; VM4BD302.cbl = N; VM4BD310.cbl = N; VM4BD420.cbl = N; VM7BD200.cbl = N. The legend and complete matrix are in section 6; no synthetic answer upgrades the production disposition.

**Applies when:** 567 builds the six-part form key with an input creation date that can be zero or blank.

**Source-derived migration behavior and production conditions:** The target substitutes 00010101, then formats SQL DATE 0001-01-01, before UPDATE. The original moved the input directly into the CALC key. This changes row identity and needs loader/business agreement. Do not infer that every zero IDMS date maps to this sentinel or that malformed nonzero bytes follow the same policy.

**Minimum storage:** Use existing input date aliases and DCLGEN date host; no separate sentinel flag is required if the same explicit condition is retained. Keep creation-date key distinct from the run date being assigned as accounting date.

**Error and recovery contract:** A valid sentinel query may still update the wrong or no row. Missing-row UPDATE is an error; obtain the approved handling of blank/zero/invalid original keys.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-013-V01 / VM1BD567-C002 | Input creation date is zero, spaces, a valid nonzero date or malformed nonzero date. | CHANGED_UNRESOLVED; classified in this guide; G01,G02 |

**Scenarios to exercise:** ZERO-DATE; BLANK-DATE; VALID-CREATION; INVALID-NONZERO; SENTINEL-ROW-ABSENT; RUN-DATE-DIFFERS-FROM-CREATION.

**Counterexamples and limits:** SQL accepting year 0001 does not demonstrate the correct business identity; Reusing the run-date host before key execution can update a different form.

**Source evidence:** `IDMS Programs/VM1BD567.cbl` physical L149–158; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L201–219; `Dclgens/DZBFARTV.txt` physical L13–18.

**Question versions / production gaps:** [Q-000010](../_audit/questions/Q-000010.md)

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
| RULE-015-V01 / VM7BD200-C007 | Failure after partial archive WRITE | UNRESOLVED; cross-category technical example; G03 |

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
| RULE-017-V01 / VM4BD302-C009 | VM9BC50T QUERY001 exchanges one fixed buffer | PRESERVED_VISIBLE_INTERFACE; classified in this guide; G01 |
| RULE-017-V02 / VM4BD310-C007 | Build one 1500-byte output for valid mutation | UNRESOLVED; cross-category technical example; G03 |
| RULE-017-V03 / VM4BD420-C007 | Date parameter conversion and each successful output | PRESERVED_VISIBLE_LAYOUT; classified in this guide; G01 |
| RULE-017-V04 / VM7BD200-C005 | Every selected form | UNRESOLVED; cross-category technical example; G03 |

**Scenarios to exercise:** EXACT-FILE-LENGTH; ACTIVE-OVERLAY; ARRAY-MIN/MAX; LEADING-ZEROS/SIGNS; RAW-FILLER-BYTES; CALL-RETURN-LENGTH.

**Counterexamples and limits:** 257 REDEFINES are not 257 new buffers; Two aliased OCCURS15 declarations do not make 30 independent entries; Named-field equality does not prove archive byte identity.

**Source evidence:** `IDMS Programs/VM4BD302.cbl` physical L73–79; `IDMS Programs/VM4BD302.cbl` physical L323–337; `DB2 Manual converted Programs/VMDZ4302.txt` physical L51–58; `DB2 Manual converted Programs/VMDZ4302.txt` physical L453–467; `Copybook/VM9BC50I.cpy` physical L19–58; additional hash-bound ranges in the case ledger.

**Question versions / production gaps:** [Q-000003](../_audit/questions/Q-000003.md), [Q-000005](../_audit/questions/Q-000005.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000017](../_audit/questions/Q-000017.md), [Q-000019](../_audit/questions/Q-000019.md), [Q-000024](../_audit/questions/Q-000024.md), [Q-000026](../_audit/questions/Q-000026.md), [Q-000037](../_audit/questions/Q-000037.md)

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
| RULE-022-V01 / VM1BD526-C006 | Insert or modification builds key from client, creation date, document ID and operation detail/general. | CONFLICT; cross-category technical example; G03,G04 |
| RULE-022-V02 / VM4BD302-C006 | SW-168=1 after all child rows | CONFLICT; classified in this guide; G01 |
| RULE-022-V03 / VM4BD310-C005 | Found event decoded for output | CONFLICT; cross-category technical example; G03 |
| RULE-022-V04 / VM4BD420-C004 | StatusC after event scan | CONFLICT; classified in this guide; G01 |

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
| RULE-023-V01 / VM1BD526-C007 | All stock-key SQL and insertion client reference. | SUPPORTED_WITH_GAPS; cross-category technical example; G03,G04 |
| RULE-023-V02 / VM4BD302-C007 | Only state that remains live may require additional storage | PARTIAL; classified in this guide; G01 |
| RULE-023-V03 / VM4BD310-C008 | Sequential dates/split keys/diagnostics | PARTIALLY_PRESERVED; cross-category technical example; G03 |
| RULE-023-V04 / VM4BD420-C006 | Existing WS-STATUS already represents D | PARTIAL; classified in this guide; G01 |
| RULE-023-V05 / VM7BD200-C008 | Eight date conversions and cutoff | PARTIALLY_PRESERVED; cross-category technical example; G03 |

**Scenarios to exercise:** NO-READS-OF-FLAG; DISJOINT-DATE-LIFETIMES; NESTED-SQL-CLOBBER; LAST-RECORD-AFTER-EOF; PACKED-MOVE; COUNT-ROLE-REUSE.

**Counterexamples and limits:** Every new DCLGEN member is not automatically a mandatory helper; Reusing one variable for simultaneously live values reduces bytes but changes behavior.

**Source evidence:** `Copybook/VMBD205I.cpy` physical L54–55; `Copybook/VMBD205I.cpy` physical L624–673; `DB2 Manual converted Programs/VMDZ1526.txt` physical L74–85; `DB2 Manual converted Programs/VMDZ1526.txt` physical L230–273; `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical L309–324; additional hash-bound ranges in the case ledger.

**Question versions / production gaps:** [Q-000002](../_audit/questions/Q-000002.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000017](../_audit/questions/Q-000017.md), [Q-000020](../_audit/questions/Q-000020.md), [Q-000026](../_audit/questions/Q-000026.md), [Q-000035](../_audit/questions/Q-000035.md)

### RULE-024 — Replace network currency with explicit parent keys and cursor lifetimes

**Phase 2 conditional rule and scenario revision:** Q-000036 assumes DESC event ID matches the relevant legacy encounter order only for 302/420; Q-000037 assumes unfiltered views and logical key uniqueness; Q-000035 assumes fatal error handling. Under these explicit conditions the three-key owner/parent and four-key parent/child cursor scopes are a useful test pattern. Parent storage remains live through child SQL. Keep no-child, multiple-parent, child-error and reordered-data counterexamples outside the assumptions. An arbitrary join still cannot replace the reducer without cardinality/order proof.

**Exact scoped answer dependencies:** [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]; [Q-000036](../_audit/questions/Q-000036.md) [VM4BD302.cbl, VM4BD420.cbl; PROVIDED]; [Q-000037](../_audit/questions/Q-000037.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. Full answer hashes and origin are in section 7.

**Six-program source recheck:** VM1BD526.cbl = N; VM1BD567.cbl = N; VM4BD302.cbl = U; VM4BD310.cbl = N; VM4BD420.cbl = U; VM7BD200.cbl = N. The legend and complete matrix are in section 6; no synthetic answer upgrades the production disposition.

**Applies when:** 4302 traverses owner=>security=>events;4420 sweeps securities=>events. Both are direct network access, not executed LRF requests.

**Source-derived migration behavior and production conditions:** 4302 first SELECTs the owner by three keys, then opens a parent cursor constrained by those owner keys and a child cursor constrained by four security keys.4420 parent cursor scans the whole view and opens a similarly keyed child. Parent and child DCLGENs remain separate, so original FIND CURRENT parent can disappear if no child operation overwrites parent values. Establish order independently; both target child cursors order event ID DESC.

**Minimum storage:** Preserve live parent keys and parent output across child scan without redundant saved keys where current groups already separate them. Current paragraph structure uses independent parent/child EOF flags because each SQL overwrites SQLCODE.

**Error and recovery contract:** Parent 0 may have zero children; child+100 is expected exhaustion, not missing parent. Close each child before next parent, and both levels on applicable termination. Missing runtime handlers prevent complete failure-path proof.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-024-V01 / VM4BD302-C003 | Owner found; zero/one/many securities and events | PARTIAL; classified in this guide; G01 |
| RULE-024-V02 / VM4BD420-C002 | All securities; each security starts WS-STATUS space | PARTIAL; classified in this guide; G01 |

**Scenarios to exercise:** NO-PARENTS; ONE-PARENT-NO-CHILDREN; MULTIPLE-PARENTS; CHILD-ERROR; PARENT-VALUES-AFTER-CHILD; KEY-SCOPE-ISOLATION.

**Counterexamples and limits:** A child query without all four parent predicates can mix securities; A SQL join that changes multiplicity/order is not automatically equivalent to nested currency.

**Source evidence:** `IDMS Programs/VM4BD302.cbl` physical L251–277; `IDMS Programs/VM4BD302.cbl` physical L319–319; `DB2 Manual converted Programs/VMDZ4302.txt` physical L215–246; `DB2 Manual converted Programs/VMDZ4302.txt` physical L338–376; `DB2 Manual converted Programs/VMDZ4302.txt` physical L527–666; additional hash-bound ranges in the case ledger.

**Question versions / production gaps:** [Q-000035](../_audit/questions/Q-000035.md), [Q-000036](../_audit/questions/Q-000036.md), [Q-000037](../_audit/questions/Q-000037.md)

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
| RULE-025-V01 / VM1BD526-C004 | Update route for stock key, event 0168 and service 0219; parent and child cardinality vary. | UNRESOLVED; cross-category technical example; G03,G04 |
| RULE-025-V02 / VM4BD302-C005 | Every traversed event, independently of SW-168 | PARTIAL; classified in this guide; G01 |
| RULE-025-V03 / VM4BD310-C003 | Two or more event 0092 children possible | UNRESOLVED; cross-category technical example; G03 |
| RULE-025-V04 / VM7BD200-C006 | Multiple eligible forms | UNRESOLVED; cross-category technical example; G03 |

**Scenarios to exercise:** TWO-QUALIFYING-EVENTS; EQUAL-TRANSFER-DATES; REPEATED-CREATION; D-AT-DIFFERENT-POSITION; REVERSED-LOAD-ORDER; ARCHIVE-SEQUENCE.

**Counterexamples and limits:** Greatest surrogate does not prove legacy first; Absence of ORDER BY does not establish a stable order; Adding ORDER BY date can change a last-encounter rule.

**Source evidence:** `IDMS Programs/VM1BD526.cbl` physical L197–212; `Schema/VMBTS07.txt` physical L124–136; `DB2 Manual converted Programs/VMDZ1526.txt` physical L575–601; `IDMS Programs/VM4BD302.cbl` physical L300–315; `DB2 Manual converted Programs/VMDZ4302.txt` physical L244–244; additional hash-bound ranges in the case ledger.

**Question versions / production gaps:** [Q-000008](../_audit/questions/Q-000008.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000016](../_audit/questions/Q-000016.md), [Q-000017](../_audit/questions/Q-000017.md), [Q-000018](../_audit/questions/Q-000018.md), [Q-000023](../_audit/questions/Q-000023.md), [Q-000035](../_audit/questions/Q-000035.md), [Q-000036](../_audit/questions/Q-000036.md), [Q-000037](../_audit/questions/Q-000037.md)

### RULE-027 — Keep the redemption date window and CI reducer as separate conditions

**Phase 2 conditional rule and scenario revision:** For 302, Q-000001 deliberately retains integer month-number subtraction with the day unchanged, including a March31→February31 comparison value. Q-000014 retains exact date predicates under the EUR fixture; Q-000017 supplies the scoped event-key representation. The oracle remains event0168/operation91, lower-bound inclusive and cutoff exclusive, with the separate CI reducer. Test January, month-end, cutoff equality, no usable CI and equal transfer dates. Calendar clamping is not introduced, and the real business policy remains open.

**Exact scoped answer dependencies:** [Q-000001](../_audit/questions/Q-000001.md) [VM4BD302.cbl; PROVIDED]; [Q-000014](../_audit/questions/Q-000014.md) [VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl, VM7BD200.cbl; PROVIDED]; [Q-000017](../_audit/questions/Q-000017.md) [VM1BD526.cbl, VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl; PROVIDED]. Full answer hashes and origin are in section 7.

**Six-program source recheck:** VM1BD526.cbl = N; VM1BD567.cbl = N; VM4BD302.cbl = V; VM4BD310.cbl = N; VM4BD420.cbl = N; VM7BD200.cbl = N. The legend and complete matrix are in section 6; no synthetic answer upgrades the production disposition.

**Applies when:** 4302 decides whether a security produces its 90-byte redemption output.

**Source-derived migration behavior and production conditions:** Set SW-168 only for event 0168 with embedded operation 91, eventdate<cutoff and eventdate>=maturity minus one month. January wraps to December of the prior year; day is unchanged, including potentially impossible month-end dates. Independently derive CI: ignore 0060 at/after cutoff, accept first earlier 0060, and replace on 0092 only if transferdate>current marker and<cutoff. Equal-date transfer keeps the first encountered; qualifying redemption may still output CI000000.

**Minimum storage:** Existing SW-168, LAATSTE-CI and date marker encode independent business state. Unused LAATSTE-OPD may disappear. Shared conversion workspace may be reused only while cutoff/maturity comparisons remain live.

**Error and recovery contract:** Calendar-clamping month subtraction or requiring a nonzero CI is a business change, not an automatic correction. Preserve strict upper/inclusive lower bounds pending policy answers.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-027-V01 / VM4BD302-C004 | Event code 0168, embedded operation 91, and event date strictly before the cutoff. | PRESERVED_CONDITIONAL_ON_TYPES; classified in this guide; G01 |

**Scenarios to exercise:** LOWER-BOUND-EQUAL; CUTOFF-EQUAL; JANUARY-WRAP; MARCH31-TO-FEBRUARY31; NO-USABLE-CI; EQUAL-TRANSFER-DATE.

**Counterexamples and limits:** SQL ADD_MONTHS-style clamping can change existing comparison behavior; A qualifying 0168 does not alone identify the selected CI.

**Source evidence:** `IDMS Programs/VM4BD302.cbl` physical L282–298; `DB2 Manual converted Programs/VMDZ4302.txt` physical L381–419.

**Question versions / production gaps:** [Q-000001](../_audit/questions/Q-000001.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000017](../_audit/questions/Q-000017.md)

### RULE-028 — Resolve restart identity, target object and legacy cutover explicitly

**Phase 2 conditional rule and scenario revision:** Q-000031 permits a fresh target/checkpoint fixture and a separate explicit legacy-count conversion fixture; Q-000034 assumes an updatable uniquely keyed restart view. “Empty target/checkpoint state” is not permission to remove required parent/form business rows from successful business fixtures: literal empty business tables exercise rejection, while successful updates need their separately scoped prerequisites. The actual key rename and absence of automatic legacy-checkpoint translation remain source facts. Test fresh boundary, explicit count conversion and an unconverted partial legacy run; production cutover is still unresolved.

**Exact scoped answer dependencies:** [Q-000031](../_audit/questions/Q-000031.md) [VM1BD526.cbl, VM1BD567.cbl; PROVIDED]; [Q-000034](../_audit/questions/Q-000034.md) [VM1BD526.cbl, VM1BD567.cbl; PROVIDED]. Full answer hashes and origin are in section 7.

**Six-program source recheck:** VM1BD526.cbl = U; VM1BD567.cbl = U; VM4BD302.cbl = N; VM4BD310.cbl = N; VM4BD420.cbl = N; VM7BD200.cbl = N. The legend and complete matrix are in section 6; no synthetic answer upgrades the production disposition.

**Applies when:** 526/567 replace active FFRECAB restart access; the lookup is a non-LRF retrieval even inside 526’s LRF updater.

**Source-derived migration behavior and production conditions:** Mapping logical 867/physical 873 names DZ01RSTB; executed SQL uses DZ01RSTV and DCLDZ01RSTV. Verify their DDL lineage, updatability, unique program/phase/date key and triggers. Legacy VM1BDF526-A/VM1BDF567-A plus date/set 0 becomes VMDZ1526/VMDZ1567, phase 1, SQL DATE. Target does not translate/read legacy checkpoints. Configure whether cutover starts at a verified fresh boundary or migrates a reconciled checkpoint.

**Minimum storage:** Use exact CHAR8 program, SMALLINT phase and DATE host. Existing CS-PROGRAM can be a literal/shared constant if SQLERRWS permits; do not truncate legacy names to manufacture correspondence.

**Error and recovery contract:** Missing row is expected fresh state only after key/cutover identity is resolved. Otherwise a key change can replay committed legacy work. Concurrent ownership and duplicate rows remain separate constraints.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-028-V01 / VM1BD526-C008 | Start keyed by run date and program identity. | UNRESOLVED; classified in this guide; G01,G02 |
| RULE-028-V02 / VM1BD567-C004 | Start keyed by business date. | UNRESOLVED; classified in this guide; G01,G02 |

**Scenarios to exercise:** FRESH-CUTOVER; LEGACY-PARTIAL-RUN; TARGET-VIEW-BASE-DDL; DUPLICATE-RUN-KEY; DIFFERENT-PHASE/DATE.

**Counterexamples and limits:** A TV suffix is not proof of an updatable view over the TB mapping; Program renaming alone does not migrate the saved restart position.

**Source evidence:** `IDMS Programs/VM1BD526.cbl` physical L120–138; `DB2 Manual converted Programs/VMDZ1526.txt` physical L324–355; `DB2 Manual converted Programs/VMDZ1526.txt` physical L401–428; `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical L873–873; `IDMS Programs/VM1BD567.cbl` physical L111–129; additional hash-bound ranges in the case ledger.

**Question versions / production gaps:** [Q-000031](../_audit/questions/Q-000031.md), [Q-000034](../_audit/questions/Q-000034.md)

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

### RULE-032 — Singleton owner absence follows the program’s actual skip/abort policy

**Phase 2 conditional rule and scenario revision:** For 302, Q-000003 supplies only a valid complete service result, Q-000037 a unique unfiltered owner view, and Q-000035 fatal unexpected SQL errors. SELECT +100 still displays/skips, while duplicate/other error terminates in the fixture. The legacy visible CALC branch skipped on every nonzero, so this is a changed error policy even if the temporary policy accepts it. Do not consume stale owner hosts or treat a failed service response as legitimate owner absence.

**Exact scoped answer dependencies:** [Q-000003](../_audit/questions/Q-000003.md) [VM4BD302.cbl; PROVIDED]; [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]; [Q-000037](../_audit/questions/Q-000037.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. Full answer hashes and origin are in section 7.

**Six-program source recheck:** VM1BD526.cbl = N; VM1BD567.cbl = N; VM4BD302.cbl = U; VM4BD310.cbl = N; VM4BD420.cbl = N; VM7BD200.cbl = N. The legend and complete matrix are in section 6; no synthetic answer upgrades the production disposition.

**Applies when:** 4302 obtains the owner by three keys from VM9BC50T before scanning its securities.

**Source-derived migration behavior and production conditions:** Target singleton SELECT populates the owner on 0, displays/skips on+100, and invokes SQLERROR otherwise. Legacy code displayed/skipped for every non 0000 owner result. This narrows the benign skip class and changes error policy. Prove intended handling, owner uniqueness, service-output validity and view predicates; do not turn every singleton absence into a generic abort.

**Minimum storage:** Use existing owner host fields and returned service keys. No additional owner-present flag is needed if the immediate branch controls opening the parent cursor.

**Error and recovery contract:** A missing owner has no valid fetched owner data and must not open a cursor with stale keys. Duplicate owner, conversion, privilege or deadlock errors are not ordinary absence even when legacy broadly skipped them.

| Variant / source case | Condition that selects it | Source assessment / category scope |
| --- | --- | --- |
| RULE-032-V01 / VM4BD302-C002 | Issue key derived from VM9BC50T | CHANGED_ERROR_POLICY_UNRESOLVED; classified in this guide; G01 |

**Scenarios to exercise:** OWNER-FOUND; OWNER-MISSING; OWNER-DUPLICATE; SERVICE-RETURN-INVALID; OWNER-SQL-FAILURE; NEXT-INPUT-AFTER-SKIP.

**Counterexamples and limits:** SELECT+100 means skip here, but failure for 526 insert-parent lookup; Copying every IDMS nonzero into SQL+100 conflates different failures.

**Source evidence:** `IDMS Programs/VM4BD302.cbl` physical L237–254; `DB2 Manual converted Programs/VMDZ4302.txt` physical L488–523; `Dclgens/DZWCEFTV.txt` physical L10–25.

**Question versions / production gaps:** [Q-000003](../_audit/questions/Q-000003.md), [Q-000035](../_audit/questions/Q-000035.md), [Q-000037](../_audit/questions/Q-000037.md)

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
| RULE-033-V02 / VM1BD567-C011 | Restart SELECT, INSERT, UPDATE, COMMIT or form UPDATE. | UNRESOLVED; classified in this guide; G01,G02 |
| RULE-033-V03 / VM4BD302-C008 | Each SELECT/OPEN/FETCH/CLOSE | PARTIAL; classified in this guide; G01 |
| RULE-033-V04 / VM4BD420-C005 | Every Db 2 cursor operation including earlyDclose | PARTIAL; classified in this guide; G01 |

**Scenarios to exercise:** SQL0-WITH-WARNING; FETCH 100; SELECT100-BY-CONTEXT; UPDATE100; MULTIROW-UPDATE 0; NEGATIVE-SQL-FAIL; CLEANUP-OVERWRITES-SQLCODE; RETURNING-HANDLER; UNKNOWN-COMMIT.

**Counterexamples and limits:** One global IF SQLCODE NOT=0 abort rule breaks expected EOF/restart absence; Calling SQLERROR does not prove rollback or nonreturn; CLOSE/ROLLBACK diagnostics can overwrite the original failure.

**Source evidence:** `IDMS Programs/VM1BD526.cbl` physical L193–195; `IDMS Programs/VM1BD526.cbl` physical L206–227; `IDMS Programs/VM1BD526.cbl` physical L247–254; `DB2 Manual converted Programs/VMDZ1526.txt` physical L331–335; `DB2 Manual converted Programs/VMDZ1526.txt` physical L373–379; additional hash-bound ranges in the case ledger.

**Question versions / production gaps:** [Q-000003](../_audit/questions/Q-000003.md), [Q-000035](../_audit/questions/Q-000035.md)

## 5. Case-by-case migration crosswalk

This section retains every case classified in this category. The prose records what the supplied converter did and where equivalence remains conditional. Evidence hashes and additional ranges are in the linked ledgers; each report contains its complete declaration, field and operation inventories.

### VM1BD526-C008 — Restart lookup and cutover identity

**Phase 2 rehearsal assessment (FRESH_CUTOVER_FIXTURE_ONLY):** Q-000034 assumes one simple updatable restart object with a unique program/phase/date key; Q-000031 chooses a fresh checkpoint boundary. The source lookup is consistent with that fixture, but contains no legacy key/count conversion. An empty checkpoint is not evidence that all previously committed business work is absent.

**Revised scenario conditions / expected checks:**

- Fresh checkpoint with required business parents available.
- Separate conversion fixture with a reconciled legacy committed count and the new key.
- Literal empty business tables take the missing-parent rejection path.

**Production finding retained:** Real cutover reconciliation, restart DDL and existing checkpoint migration remain unresolved.

**Applied answer versions:** [Q-000031](../_audit/questions/Q-000031.md) [VM1BD526.cbl, VM1BD567.cbl; PROVIDED]; [Q-000034](../_audit/questions/Q-000034.md) [VM1BD526.cbl, VM1BD567.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM1BD526.cbl](../programs/VM1BD526.cbl__migration.md) · **Rule/variant:** RULE-028, RULE-028-V01 · **Source assessment:** `UNRESOLVED`.

**Condition:** Start keyed by run date and program identity.

**Original behavior:** OBTAIN CALC FFRECAB uses VM1BDF526-A, DATE-YMD8, NS-SET-FF0; missing sets SW-FFRECAB1.

**Delivered Db2 behavior:** SELECT DZ01RSTV uses VMDZ1526, phase 1, DATE; zero resumes and+100 creates; mapping names baseDZ01RSTB.

**Evidence:** `IDMS Programs/VM1BD526.cbl` physical L120–138; `DB2 Manual converted Programs/VMDZ1526.txt` physical L324–355; `DB2 Manual converted Programs/VMDZ1526.txt` physical L401–428; `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical L873–873.

**Question versions / production gaps:** [Q-000031](../_audit/questions/Q-000031.md), [Q-000034](../_audit/questions/Q-000034.md)

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

### VM1BD567-C001 — Six-key form lookup and date-only business update

**Phase 2 rehearsal assessment (CONDITIONALLY_SUPPORTED_UNEXECUTED):** Q-000037 supplies unique six-key rows and an unfiltered projection for the fixture; Q-000020 supplies hypothetical compatible input aliases; Q-000035 makes missing-row UPDATE fatal. Under those conditions a searched UPDATE preserves the listed date-only business assignment without a redundant full-record SELECT. Statement success is still not an observed row-count check.

**Revised scenario conditions / expected checks:**

- One exact six-key row: change only accounting date and intended audit fields.
- No row: +100 rejected; duplicate-key data is outside the uniqueness fixture and must be tested against actual DDL.

**Production finding retained:** Actual key constraints, converted copybook and runtime error implementation remain absent.

**Applied answer versions:** [Q-000020](../_audit/questions/Q-000020.md) [VM1BD526.cbl, VM1BD567.cbl; PROVIDED]; [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]; [Q-000037](../_audit/questions/Q-000037.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM1BD567.cbl](../programs/VM1BD567.cbl__migration.md) · **Rule/variant:** RULE-005, RULE-005-V01 · **Source assessment:** `SUPPORTED_WITH_GAPS`.

**Condition:** Every successfully read operation record.

**Original behavior:** MOVE1815 and five input key components into VMBFAR; OBTAIN CALC fetches the whole row; set DA-INFSD-GDIFAR to run date then MODIFY.

**Delivered Db2 behavior:** A searched UPDATE uses all six mapped key components, changes accounting date plus audit timestamp/user; successful SQL increments one statement counter.

**Evidence:** `IDMS Programs/VM1BD567.cbl` physical L147–158; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L192–228; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L426–451; `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical L79–91.

**Question versions / production gaps:** [Q-000020](../_audit/questions/Q-000020.md), [Q-000035](../_audit/questions/Q-000035.md), [Q-000037](../_audit/questions/Q-000037.md)

### VM1BD567-C002 — Creation-date key sentinel

**Phase 2 rehearsal assessment (INTENTIONAL_TEST_SENTINEL_UNEXECUTED):** Q-000010 selects0001-01-01 for a missing creation date. The visible zero/space branch chooses that key for the test, which can target a different row than the delivered legacy CALC path. A malformed nonzero date is not normalized or explicitly validated by that branch; the answer does not certify its runtime conversion.

**Revised scenario conditions / expected checks:**

- Zero and blank creation dates select the minimum-date fixture row.
- A valid leap date keeps its own key.
- Malformed nonzero dates must not be silently redirected to the minimum-date row.

**Production finding retained:** Actual loader/business missing-date policy, input category behavior and invalid-date error handling remain unverified.

**Applied answer versions:** [Q-000010](../_audit/questions/Q-000010.md) [VM1BD567.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM1BD567.cbl](../programs/VM1BD567.cbl__migration.md) · **Rule/variant:** RULE-013, RULE-013-V01 · **Source assessment:** `CHANGED_UNRESOLVED`.

**Condition:** Input creation date is zero, spaces, a valid nonzero date or malformed nonzero date.

**Original behavior:** Input value moved directly into packed creation-date CALC key; no sentinel normalization in program.

**Delivered Db2 behavior:** Zero/space group becomes 00010101 then EUR string; malformed nonzero values are not checked before SQL.

**Evidence:** `IDMS Programs/VM1BD567.cbl` physical L149–158; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L201–219; `Dclgens/DZBFARTV.txt` physical L13–18.

**Question versions / production gaps:** [Q-000010](../_audit/questions/Q-000010.md)

### VM1BD567-C004 — Restart key and table/view identity

**Phase 2 rehearsal assessment (FRESH_CHECKPOINT_FIXTURE_ONLY):** Q-000031 chooses a fresh checkpoint/cutover fixture and Q-000034 a unique simple restart view. The source builds the new VMDZ1567/phase1/date key and does not translate FFRECAB. Required form rows must exist for the successful business UPDATE; literally empty business tables produce+100. Any legacy-count conversion must account for the demonstrated broken legacy counter rather than trust it blindly.

**Revised scenario conditions / expected checks:**

- Fresh checkpoint with valid form rows already represented in the fixture.
- Explicit independently reconciled legacy-count conversion; do not copy a known incorrect zero position.

**Production finding retained:** Actual cutover/data reconciliation, source count trustworthiness and restart DDL remain unresolved.

**Applied answer versions:** [Q-000031](../_audit/questions/Q-000031.md) [VM1BD526.cbl, VM1BD567.cbl; PROVIDED]; [Q-000034](../_audit/questions/Q-000034.md) [VM1BD526.cbl, VM1BD567.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM1BD567.cbl](../programs/VM1BD567.cbl__migration.md) · **Rule/variant:** RULE-028, RULE-028-V02 · **Source assessment:** `UNRESOLVED`.

**Condition:** Start keyed by business date.

**Original behavior:** FFRECAB CALC key VM1BDF567-A/date/NS-SET-FF0; missing sets SW-RECAB N.

**Delivered Db2 behavior:** DZ01RSTV singleton key VMDZ1567/phase 1/SQL DATE; zero resumes,+100 inserts; map points to DZ01RSTB.

**Evidence:** `IDMS Programs/VM1BD567.cbl` physical L111–129; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L269–280; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L356–387; `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical L873–873.

**Question versions / production gaps:** [Q-000031](../_audit/questions/Q-000031.md), [Q-000034](../_audit/questions/Q-000034.md)

### VM1BD567-C011 — Statement-specific status and cleanup

**Phase 2 rehearsal assessment (ERROR_CONTRACT_ASSUMED_NOT_PROVED):** Q-000035 preserves statement-owned failure diagnostics and prohibits continuation after designated failures. Restart SELECT+100 remains expected; business/restart UPDATE+100 remains fatal. Missing SQLERROR implementation, SQLWARN0 treatment and potentially stale SQL-LOCATION1100 remain unresolved.

**Revised scenario conditions / expected checks:**

- Separate restart absence from missing business row.
- Failure in checkpoint UPDATE or COMMIT must report that producing operation, not merely the preceding business location.

**Production finding retained:** No handler or actual diagnostic/fault-injection result has been supplied.

**Applied answer versions:** [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM1BD567.cbl](../programs/VM1BD567.cbl__migration.md) · **Rule/variant:** RULE-033, RULE-033-V02 · **Source assessment:** `UNRESOLVED`.

**Condition:** Restart SELECT, INSERT, UPDATE, COMMIT or form UPDATE.

**Original behavior:** No explicit VMBFAR missing-row branch; BATCH-AUTOSTATUS and missing IDMS-STATUS determine errors.

**Delivered Db2 behavior:** Only restart SELECT accepts 0/+100; all DML and COMMIT accept 0 only; OTHER prints record count and calls SQLERROR. SQL-LOCATION1100 assigned only for business UPDATE. No SQLSTATE/WARN/row-count/indicator checks.

**Evidence:** `IDMS Programs/VM1BD567.cbl` physical L38–40; `IDMS Programs/VM1BD567.cbl` physical L155–158; `IDMS Programs/VM1BD567.cbl` physical L179–180; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L276–280; `DB2 Manual converted Programs/VMDZ1567.cbl` physical L343–450.

**Question versions / production gaps:** [Q-000035](../_audit/questions/Q-000035.md)

### VM4BD302-C001 — Parameter date and issue lookup service

**Phase 2 rehearsal assessment (STATIC_CONDITIONAL_RECHECK):** The fixture allows the returned issue key/currency to feed the same QUERY001/selector2 flow. Year 79 still maps to 2079 and year 80 to 1980. The target owner-date formatting is consistent with the assumed EUR fixture; it does not add service-result validation.

**Case-specific test condition:** Use only successful 2610-byte VM9BC50T responses; interpret fetched DATE as EUR with the scoped zero/high sentinels.

**Revised scenario conditions / expected checks:**

- A successful complete response provides the owner key and output currency.
- A short or failed response cannot be labelled owner-not-found merely because the later SELECT returns100.
- Year 79/80 retains the original century boundary.

**Production finding retained:** Failed or short service responses remain outside the fixture. The executable, real actual-length/return-code policy and deployed DATE format are still absent.

**Applied answer versions:** [Q-000003](../_audit/questions/Q-000003.md) [VM4BD302.cbl; PROVIDED]; [Q-000014](../_audit/questions/Q-000014.md) [VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl, VM7BD200.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM4BD302.cbl](../programs/VM4BD302.cbl__migration.md) · **Rule/variant:** RULE-006, RULE-006-V01 · **Source assessment:** `PARTIAL`.

**Condition:** Each 40-byte input record and LS-DATE-IND 0 or supplied date

**Original behavior:** Derive cutoff using year<80→2000 else 1900; call VM9BC50T QUERY001/CO-CLE2; use service issue key/currency without checking return fields.

**Delivered Db2 behavior:** Same cutoff and call interface; caller name becomes VMDZ4302; owner date converted to EUR, zero/spaces→00010101.

**Evidence:** `IDMS Programs/VM4BD302.cbl` physical L164–177; `IDMS Programs/VM4BD302.cbl` physical L321–337; `DB2 Manual converted Programs/VMDZ4302.txt` physical L266–279; `DB2 Manual converted Programs/VMDZ4302.txt` physical L316–330; `DB2 Manual converted Programs/VMDZ4302.txt` physical L451–467.

**Question versions / production gaps:** [Q-000003](../_audit/questions/Q-000003.md), [Q-000014](../_audit/questions/Q-000014.md)

### VM4BD302-C002 — Owner lookup and missing owner

**Phase 2 rehearsal assessment (STATIC_CONDITIONAL_RECHECK):** The zero-row fixture follows SELECT+100 display/skip; the one-row fixture starts the parent cursor. A duplicate-result/error fixture is fatal under Q-000035, whereas the visible legacy CALC branch skips on any non0000. This remains a changed error policy, even when the test accepts the target policy.

**Case-specific test condition:** Assume a valid service result, an unfiltered uniquely keyed owner view, and a fatal nonreturning SQLERROR for unexpected SQL results.

**Revised scenario conditions / expected checks:**

- Zero owner rows: display key and skip the issue.
- One owner: process its securities.
- Multiple owner rows or SQL failure: require fatal handling; no source runtime was executed.

**Production finding retained:** Actual uniqueness/view filters, SQLERROR implementation, and intended treatment of non-absence legacy errors remain unproved. Synthetic fatal intent cannot make the two error branches identical.

**Applied answer versions:** [Q-000003](../_audit/questions/Q-000003.md) [VM4BD302.cbl; PROVIDED]; [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]; [Q-000037](../_audit/questions/Q-000037.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM4BD302.cbl](../programs/VM4BD302.cbl__migration.md) · **Rule/variant:** RULE-032, RULE-032-V01 · **Source assessment:** `CHANGED_ERROR_POLICY_UNRESOLVED`.

**Condition:** Issue key derived from VM9BC50T

**Original behavior:** OBTAIN CALC VMBWCEF; any non 0000 displays and skips this issue; 0000 starts child securities.

**Delivered Db2 behavior:** SELECT one CO_IDISSUS into its same input host; SQL0 processes, +100 displays/skips; other codes call missing SQLERROR.

**Evidence:** `IDMS Programs/VM4BD302.cbl` physical L237–254; `DB2 Manual converted Programs/VMDZ4302.txt` physical L488–523; `Dclgens/DZWCEFTV.txt` physical L10–25.

**Question versions / production gaps:** [Q-000003](../_audit/questions/Q-000003.md), [Q-000035](../_audit/questions/Q-000035.md), [Q-000037](../_audit/questions/Q-000037.md)

### VM4BD302-C003 — Two-level owner/member navigation

**Phase 2 rehearsal assessment (STATIC_CONDITIONAL_RECHECK):** With those explicit fixture conditions, the three-key owner cursor and four-key event cursor enumerate the intended nested scopes. Parent data stays in DCLDZBEFFTV while child fetches populate DCLDZEVEFTV, so no new saved-parent-key group is required. Independent EOF flags remain needed by this paragraph structure.

**Case-specific test condition:** Assume unfiltered view membership/required keys and descending generated IDs equal the relevant legacy child encounter order; unexpected SQL failures do not return.

**Revised scenario conditions / expected checks:**

- No securities: parent FETCH100 ends without child work.
- A security with zero events leaves SW-168 zero and emits nothing.
- A child error must not fall through to optional output or use stale hosts.

**Production finding retained:** The actual set-placement/load order, relation constraints and error/cleanup body are missing. The assumption does not establish parent output order or a consistent database snapshot.

**Applied answer versions:** [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]; [Q-000036](../_audit/questions/Q-000036.md) [VM4BD302.cbl, VM4BD420.cbl; PROVIDED]; [Q-000037](../_audit/questions/Q-000037.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM4BD302.cbl](../programs/VM4BD302.cbl__migration.md) · **Rule/variant:** RULE-024, RULE-024-V01 · **Source assessment:** `PARTIAL`.

**Condition:** Owner found; zero/one/many securities and events

**Original behavior:** FIRST/NEXT securities within owner; FIRST/NEXT events within security; parent currency implicit.

**Delivered Db2 behavior:** Parent cursor with three owner predicates; nested child cursor with full four-part security key; independent EOC state and close per scope.

**Evidence:** `IDMS Programs/VM4BD302.cbl` physical L251–277; `IDMS Programs/VM4BD302.cbl` physical L319–319; `DB2 Manual converted Programs/VMDZ4302.txt` physical L215–246; `DB2 Manual converted Programs/VMDZ4302.txt` physical L338–376; `DB2 Manual converted Programs/VMDZ4302.txt` physical L527–666.

**Question versions / production gaps:** [Q-000035](../_audit/questions/Q-000035.md), [Q-000036](../_audit/questions/Q-000036.md), [Q-000037](../_audit/questions/Q-000037.md)

### VM4BD302-C004 — Redemption window

**Phase 2 rehearsal assessment (STATIC_CONDITIONAL_RECHECK):** The four-part eligibility conjunction remains event 0168, operation 91, date<cutoff, and date>=maturity-minus-one-month. The lower bound is inclusive and the cutoff is exclusive. March 31 deliberately produces an integer February 31 threshold in this rehearsal; no calendar correction is silently introduced.

**Case-specific test condition:** Retain integer month subtraction without calendar clamping, use EUR-derived numeric event dates, and decode operation 91 from the assumed28-digit key.

**Revised scenario conditions / expected checks:**

- Lower-bound equality is eligible when all other predicates hold.
- Cutoff equality is excluded.
- A March 31 maturity versus February 28 event distinguishes retained integer subtraction from month-end clamping.

**Production finding retained:** Real calendar business policy, migrated date/key encodings and operational data remain unresolved. This is conditional preservation of the supplied branches, not proof that the calendar policy is desirable.

**Applied answer versions:** [Q-000001](../_audit/questions/Q-000001.md) [VM4BD302.cbl; PROVIDED]; [Q-000014](../_audit/questions/Q-000014.md) [VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl, VM7BD200.cbl; PROVIDED]; [Q-000017](../_audit/questions/Q-000017.md) [VM1BD526.cbl, VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM4BD302.cbl](../programs/VM4BD302.cbl__migration.md) · **Rule/variant:** RULE-027, RULE-027-V01 · **Source assessment:** `PRESERVED_CONDITIONAL_ON_TYPES`.

**Condition:** Event code 0168, embedded operation 91, and event date strictly before the cutoff.

**Original behavior:** Set SW-168 when eventdate≥maturity minus one month; subtract month keeping day; January rolls December/prior year.

**Delivered Db2 behavior:** Same conjunction and month arithmetic after date/key format changes. No real calendar-normalization routine.

**Evidence:** `IDMS Programs/VM4BD302.cbl` physical L282–298; `DB2 Manual converted Programs/VMDZ4302.txt` physical L381–419.

**Question versions / production gaps:** [Q-000001](../_audit/questions/Q-000001.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000017](../_audit/questions/Q-000017.md)

### VM4BD302-C005 — Creation and transfer CI selection

**Phase 2 rehearsal assessment (STATIC_CONDITIONAL_RECHECK):** The first earlier 0060 sets CI; later 0060 events do not replace it. A 0092 replaces only when its embedded transfer date is strictly larger than the marker and below cutoff, so an equal-date tie keeps the first maximum. Q-000036 permits reasoning under one chosen order; reversing that order remains a counterexample with different CI.

**Case-specific test condition:** Use the scoped EUR/sentinel and 28-digit key fixtures, and assume target descending IDs reproduce legacy encounter order.

**Revised scenario conditions / expected checks:**

- Two qualifying 0060 rows with different CIs select the first encountered.
- Equal maximum0092 transfer dates retain the first candidate.
- A redemption with no usable0060/0092 can retain CI 000000.

**Production finding retained:** Actual IDMS set order and load correlation are still missing. No answer permits copying420’s last-creation rule into302. The 20/28-byte declaration conflict remains in the source artifacts.

**Applied answer versions:** [Q-000014](../_audit/questions/Q-000014.md) [VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl, VM7BD200.cbl; PROVIDED]; [Q-000017](../_audit/questions/Q-000017.md) [VM1BD526.cbl, VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl; PROVIDED]; [Q-000036](../_audit/questions/Q-000036.md) [VM4BD302.cbl, VM4BD420.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM4BD302.cbl](../programs/VM4BD302.cbl__migration.md) · **Rule/variant:** RULE-025, RULE-025-V02 · **Source assessment:** `PARTIAL`.

**Condition:** Every traversed event, independently of SW-168

**Original behavior:** Ignore 0060 at/after cutoff; first qualifying 0060 sets marker 1/CI;0092 replaces if embedded transferdate>marker and<cutoff. Strict tie comparison preserves first encountered maximum.

**Delivered Db2 behavior:** Same branches, CI1+5 recombined. Child order forced surrogate descending; drops never-read LAATSTE-OPD assignment/storage.

**Evidence:** `IDMS Programs/VM4BD302.cbl` physical L300–315; `DB2 Manual converted Programs/VMDZ4302.txt` physical L244–244; `DB2 Manual converted Programs/VMDZ4302.txt` physical L421–447.

**Question versions / production gaps:** [Q-000014](../_audit/questions/Q-000014.md), [Q-000017](../_audit/questions/Q-000017.md), [Q-000036](../_audit/questions/Q-000036.md)

### VM4BD302-C006 — Mapped values, composite event key and output

**Phase 2 rehearsal assessment (STATIC_CONDITIONAL_RECHECK):** The bounded fixture permits 12+1 stock reconstruction and six-digit CI output while preserving the 90-byte layout. CHAR(20) in the mapping still conflicts with CHAR(28) in DCLGEN. Q-000038 adds an external job expectation: already written records are discarded and rebuilt from the same input/database snapshot, then published only on success.

**Case-specific test condition:** Use decimal-only stock/CI, amounts within the output capacity, the 28-display-digit key fixture, unfiltered DCLGEN-compatible views, and discard/recreate partial output before publication.

**Revised scenario conditions / expected checks:**

- In-range decimal stock/CI and amount produce the intended declared fields in source reasoning.
- A 13-integer-digit amount beyond the 12-integer-digit destination lies outside the happy fixture and remains a range case.
- Failure after two writes requires discarding the partial file; no actual recovery run occurred.

**Production finding retained:** No loader specification, real domain/range data, byte-image reconciliation, file-disposition/JCL or publication implementation was supplied. Db2 rollback does not remove sequential records already written.

**Applied answer versions:** [Q-000002](../_audit/questions/Q-000002.md) [VM4BD302.cbl; PROVIDED]; [Q-000017](../_audit/questions/Q-000017.md) [VM1BD526.cbl, VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl; PROVIDED]; [Q-000037](../_audit/questions/Q-000037.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]; [Q-000038](../_audit/questions/Q-000038.md) [VM4BD302.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM4BD302.cbl](../programs/VM4BD302.cbl__migration.md) · **Rule/variant:** RULE-022, RULE-022-V02 · **Source assessment:** `CONFLICT`.

**Condition:** SW-168=1 after all child rows

**Original behavior:** Output six-digit CI, amount S9(12)V9(6), currency, issue, 13-digit stock/check; event key decoded through packed/mixed 20-byte group.

**Delivered Db2 behavior:** DCLGEN DECIMAL(15),2 amount; reconstruct 12+1 stock; event key display 28; NOT NULL selected columns have no indicators.

**Evidence:** `IDMS Programs/VM4BD302.cbl` physical L105–123; `IDMS Programs/VM4BD302.cbl` physical L269–275; `DB2 Manual converted Programs/VMDZ4302.txt` physical L87–110; `DB2 Manual converted Programs/VMDZ4302.txt` physical L364–375; `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical L360–360; `Dclgens/DZEVEFTV.txt` physical L19–43.

**Question versions / production gaps:** [Q-000002](../_audit/questions/Q-000002.md), [Q-000017](../_audit/questions/Q-000017.md), [Q-000037](../_audit/questions/Q-000037.md), [Q-000038](../_audit/questions/Q-000038.md)

### VM4BD302-C007 — Minimal working storage

**Phase 2 rehearsal assessment (STATIC_CONDITIONAL_RECHECK):** Directly filling existing LAATSTE-CI slices removes the six-byte CI helper without losing a simultaneous value. A verified12+1 view of the existing output stock receiver can remove its 13-byte assembly helper under the assumed numeric domain. The two unused date groups and duplicate event-date scalar remain removal candidates. Parent and child EOF roles remain distinct.

**Case-specific test condition:** Use bounded numeric output domains and the 28-digit key fixture; unexpected SQL failure is nonreturning for the scenario.

**Revised scenario conditions / expected checks:**

- Two consecutive child events overwrite the same six-byte CI receiver only at the original selection point.
- Parent keys remain live during child SQL and must not be overlaid by helper reuse.
- Removing the duplicate event date is valid only until its staging group is overwritten.

**Production finding retained:** The proposed receiver overlay/refmod and any inline FETCH restructuring require real COBOL/precompile regression. DATE format, handler implementation and actual data domains are not supplied by these assumptions.

**Applied answer versions:** [Q-000002](../_audit/questions/Q-000002.md) [VM4BD302.cbl; PROVIDED]; [Q-000017](../_audit/questions/Q-000017.md) [VM1BD526.cbl, VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl; PROVIDED]; [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM4BD302.cbl](../programs/VM4BD302.cbl__migration.md) · **Rule/variant:** RULE-023, RULE-023-V02 · **Source assessment:** `PARTIAL`.

**Condition:** Only state that remains live may require additional storage

**Original behavior:** SW-EOF, SW-168, cutoff/maturity, packed key, CI and call interface already exist.

**Delivered Db2 behavior:** Adds counters/logging, staging groups and two cursor flags; several staging values have safe existing receivers or are unused.

**Evidence:** `DB2 Manual converted Programs/VMDZ4302.txt` physical L75–201; `DB2 Manual converted Programs/VMDZ4302.txt` physical L369–398; `DB2 Manual converted Programs/VMDZ4302.txt` physical L428–444.

**Question versions / production gaps:** [Q-000002](../_audit/questions/Q-000002.md), [Q-000017](../_audit/questions/Q-000017.md), [Q-000035](../_audit/questions/Q-000035.md)

### VM4BD302-C008 — Statement-owned SQL outcome

**Phase 2 rehearsal assessment (STATIC_CONDITIONAL_RECHECK):** Under Q-000035, OPEN/FETCH/CLOSE OTHER branches stop rather than re-entering a loop with unchanged EOF flags. SELECT/FETCH+100 still take their explicit missing/EOF paths. This establishes the rehearsal’s intended failure outcome, while the source still lacks the included handler and service-result checks.

**Case-specific test condition:** Unexpected SQL results preserve their producing diagnostics, roll back uncommitted Db2 work and do not return; the service fixture covers successful responses only.

**Revised scenario conditions / expected checks:**

- FETCH100 must not process stale data.
- Unexpected child FETCH error must not reach the later eligible WRITE.
- A failing CLOSE must preserve its own producing diagnostics before any subsequent SQL.

**Production finding retained:** No SQLERROR/SQLERRWS/USERABEN executable was supplied. Diagnostics, rollback, cleanup, positive-warning policy and file publication remain operationally unverified; broad legacy non0000 skip behavior is not equivalent to fatal target errors.

**Applied answer versions:** [Q-000003](../_audit/questions/Q-000003.md) [VM4BD302.cbl; PROVIDED]; [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM4BD302.cbl](../programs/VM4BD302.cbl__migration.md) · **Rule/variant:** RULE-033, RULE-033-V03 · **Source assessment:** `PARTIAL`.

**Condition:** Each SELECT/OPEN/FETCH/CLOSE

**Original behavior:** Startup failures call USERABEN; owner/traversal non 0000 stops/skips in main code; no IDMS-STATUS routine invoked for traversal.

**Delivered Db2 behavior:** SELECT/FETCH handle 0/100; OPEN/CLOSE only 0; all other SQLCODE via SQLERROR; flags isolate nested success/EOF.

**Evidence:** `IDMS Programs/VM4BD302.cbl` physical L179–215; `IDMS Programs/VM4BD302.cbl` physical L245–268; `DB2 Manual converted Programs/VMDZ4302.txt` physical L502–666.

**Question versions / production gaps:** [Q-000003](../_audit/questions/Q-000003.md), [Q-000035](../_audit/questions/Q-000035.md)

### VM4BD302-C009 — CALL interface tables and overlays

**Phase 2 rehearsal assessment (STATIC_CONDITIONAL_RECHECK):** The 32000-byte communication area and fixed OCCURS/REDEFINES interfaces remain unchanged; no SQL rowset is implied. A successful fixture explains valid issue-key/currency use, but the caller still has no response-length or return-status gate. This does not justify deleting unused-looking table tails or replacing the interface with DCLGEN.

**Case-specific test condition:** For this rehearsal, consider only successful 2610-byte service responses; preserve the supplied copybook layouts and replacement context.

**Revised scenario conditions / expected checks:**

- Selector2 activates the intended internal-number key overlay.
- A successful 2610-byte response is a fixture condition, not a supplied runtime result.
- Maximum occurrence and stale-tail behavior still require the real service contract.

**Production finding retained:** The service executable and real maximum/short-response contract remain absent. No complete byte-buffer exchange or copybook compilation was executed.

**Applied answer versions:** [Q-000003](../_audit/questions/Q-000003.md) [VM4BD302.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM4BD302.cbl](../programs/VM4BD302.cbl__migration.md) · **Rule/variant:** RULE-017, RULE-017-V01 · **Source assessment:** `PRESERVED_VISIBLE_INTERFACE`.

**Condition:** VM9BC50T QUERY001 exchanges one fixed buffer

**Original behavior:** COPY REPLACING BC50I/BC50O; group moves to/from 32000 one-byte OCCURS; key overlay selector 2.

**Delivered Db2 behavior:** Same copybooks, replacement context and whole-group transfer; no SQL rowsets introduced.

**Evidence:** `IDMS Programs/VM4BD302.cbl` physical L73–79; `IDMS Programs/VM4BD302.cbl` physical L323–337; `DB2 Manual converted Programs/VMDZ4302.txt` physical L51–58; `DB2 Manual converted Programs/VMDZ4302.txt` physical L453–467; `Copybook/VM9BC50I.cpy` physical L19–58; `Copybook/VM9BC50O.cpy` physical L99–348.

**Question versions / production gaps:** [Q-000003](../_audit/questions/Q-000003.md)

### VM4BD420-C001 — As-of date and date-service call

**Phase 2 rehearsal assessment (STATIC_CONDITIONAL_RECHECK):** The retained date-service branch still accepts only ESDATMAS return0. Year 60 maps to 2060 and 61 to 1961, independently of 302’s80 cutoff. Later EUR conversion can be reasoned about under Q-000014, but Q-000035 does not supply ESDATMAS calendar validation or make its return values predictable.

**Case-specific test condition:** Use EUR fetched DATE strings and scoped sentinel conversion; USERABEN and unexpected-SQL error paths do not return in the test fixture.

**Revised scenario conditions / expected checks:**

- Year 60/61 exercises the exact original century boundary.
- Return0 supplies PARMDATE; nonzero must reach the assumed nonreturning abort.
- A non-EUR actual returned DATE would invalidate the fixture; no deployed format was checked.

**Production finding retained:** ESDATMAS, USERABEN, build options and deployed DATE format remain unavailable. Actual service failure, calendar and side-effect behavior is untested.

**Applied answer versions:** [Q-000014](../_audit/questions/Q-000014.md) [VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl, VM7BD200.cbl; PROVIDED]; [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM4BD420.cbl](../programs/VM4BD420.cbl__migration.md) · **Rule/variant:** RULE-006, RULE-006-V02 · **Source assessment:** `PARTIAL`.

**Condition:** DATE-IND0 or supplied date

**Original behavior:** Two-digit year>60→19 else 20; call ESDATMAS; return 0 supplies PARMDATE, otherwise USERABEN.

**Delivered Db2 behavior:** Same parameter/date-service flow and copybook; later fetched DATE parsed as EUR with minimum/maximum sentinel substitution.

**Evidence:** `IDMS Programs/VM4BD420.cbl` physical L119–148; `DB2 Manual converted Programs/VMDZ4420.cbl` physical L209–238; `DB2 Manual converted Programs/VMDZ4420.cbl` physical L282–295; `Copybook/ESDATMAS.cpy` physical L15–38.

**Question versions / production gaps:** [Q-000014](../_audit/questions/Q-000014.md), [Q-000035](../_audit/questions/Q-000035.md)

### VM4BD420-C002 — Area sweep and nested events

**Phase 2 rehearsal assessment (STATIC_CONDITIONAL_RECHECK):** The parent scan covers the chosen fixture row set and each child query uses the complete four-part key. Retaining the separate parent host group replaces FIND CURRENT without a new saved key. Child SQL100 and business D are different exits, both followed by normal CLOSE when their preceding operations succeed.

**Case-specific test condition:** Assume unfiltered view coverage/keys, relevant child order equivalence and fatal unexpected SQL failure.

**Revised scenario conditions / expected checks:**

- Empty parent scan produces empty output.
- A parent with no events retains space status and writes nothing.
- A disqualifying child stops its own cursor scope without ending the parent scan.

**Production finding retained:** Actual area/view equivalence, parent row ordering, child set/load order, snapshot consistency and runtime cleanup are not proved by the assumptions.

**Applied answer versions:** [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]; [Q-000036](../_audit/questions/Q-000036.md) [VM4BD302.cbl, VM4BD420.cbl; PROVIDED]; [Q-000037](../_audit/questions/Q-000037.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM4BD420.cbl](../programs/VM4BD420.cbl__migration.md) · **Rule/variant:** RULE-024, RULE-024-V02 · **Source assessment:** `PARTIAL`.

**Condition:** All securities; each security starts WS-STATUS space

**Original behavior:** FIRST/NEXT in area, FIRST/NEXT events, FIND CURRENT parent before next area read.

**Delivered Db2 behavior:** Unfiltered read-only parent cursor; keyed child cursor; parent DCLGEN group persists, so FIND CURRENT removed. No parent order, child IDdescending.

**Evidence:** `IDMS Programs/VM4BD420.cbl` physical L151–188; `DB2 Manual converted Programs/VMDZ4420.cbl` physical L164–196; `DB2 Manual converted Programs/VMDZ4420.cbl` physical L245–279; `DB2 Manual converted Programs/VMDZ4420.cbl` physical L376–474.

**Question versions / production gaps:** [Q-000035](../_audit/questions/Q-000035.md), [Q-000036](../_audit/questions/Q-000036.md), [Q-000037](../_audit/questions/Q-000037.md)

### VM4BD420-C003 — C/D/S state and early disqualification

**Phase 2 rehearsal assessment (STATIC_CONDITIONAL_RECHECK):** For one chosen valid-domain encounter order, the original artificial 0307 exit, target extra D flag and proposed existing-WS-STATUS-only exit yield the same C/D/S/output decision in 2801 model sequences. Date equality remains eligible; 0168 with state not1 suppresses output, while state 1 does not. Reversing two 0060 rows changes the selected CI and remains an order counterexample.

**Case-specific test condition:** Treat the last encountered qualifying 0060 as intended, constrain the upper two creation-CI digits to zero, and use the scoped date/key/order fixtures.

**Revised scenario conditions / expected checks:**

- 0217 then0060 and 0060 then0217 both finishC absent a disqualifier.
- 0060 then0168/state 0 finishesD with no output; state 1 preservesC.
- Two 0060 rows select the last encountered CI under this scoped fixture.

**Production finding retained:** The Python state model does not validate SQL, IDMS currency or data conversion. Actual order/domain evidence remains missing, and the source has not been changed to remove the flag.

**Applied answer versions:** [Q-000004](../_audit/questions/Q-000004.md) [VM4BD420.cbl; PROVIDED]; [Q-000014](../_audit/questions/Q-000014.md) [VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl, VM7BD200.cbl; PROVIDED]; [Q-000017](../_audit/questions/Q-000017.md) [VM1BD526.cbl, VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl; PROVIDED]; [Q-000036](../_audit/questions/Q-000036.md) [VM4BD302.cbl, VM4BD420.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM4BD420.cbl](../programs/VM4BD420.cbl__migration.md) · **Rule/variant:** RULE-004, RULE-004-V01 · **Source assessment:** `PRESERVED_CONDITIONAL_ON_ORDER_TYPES`.

**Condition:** Only events with eventdate≤PARMDATE

**Original behavior:** 0060→C/save key unlessD;0168 withstate≠1→D and artificial ERROR-STATUS0307;0217→S only ifspace. D terminates child walk and suppresses output. End-of-set writes onlyC.

**Delivered Db2 behavior:** Same state transitions; SW-STATUS-D replaces artificial database status; close child then write only ifnotD andC.

**Evidence:** `IDMS Programs/VM4BD420.cbl` physical L190–224; `DB2 Manual converted Programs/VMDZ4420.cbl` physical L268–314.

**Question versions / production gaps:** [Q-000004](../_audit/questions/Q-000004.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000017](../_audit/questions/Q-000017.md), [Q-000036](../_audit/questions/Q-000036.md)

### VM4BD420-C004 — Output and expanded composite key

**Phase 2 rehearsal assessment (STATIC_CONDITIONAL_RECHECK):** Under those bounds, the 8-digit creation CI narrows to the intended 6-digit output, while the 50-byte declared layout and direct packed amount MOVEs are retained. The mapping20 versus DCLGEN28 conflict remains. Q-000039 requires a failed extract’s partial file to be discarded and rebuilt from a stable snapshot before downstream publication.

**Case-specific test condition:** Use last-creation selection with zero upper CI digits, EUR dates, the 28-digit key fixture, DCLGEN-compatible views and partial-output discard/recreate/publication policy.

**Revised scenario conditions / expected checks:**

- CI 00123456 becomes the intended 123456 under the fixture.
- A creation CI with nonzero upper digits is outside the approved test domain and cannot be declared safe.
- Failure after writes requires rebuilding the whole extract, not resuming viaWITH HOLD.

**Production finding retained:** Actual CI domains, loader/view definitions, packed output bytes, file/JCL disposition and publication behavior remain unverified. There is no in-program restart checkpoint to resume the partial extract.

**Applied answer versions:** [Q-000004](../_audit/questions/Q-000004.md) [VM4BD420.cbl; PROVIDED]; [Q-000014](../_audit/questions/Q-000014.md) [VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl, VM7BD200.cbl; PROVIDED]; [Q-000017](../_audit/questions/Q-000017.md) [VM1BD526.cbl, VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl; PROVIDED]; [Q-000037](../_audit/questions/Q-000037.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]; [Q-000039](../_audit/questions/Q-000039.md) [VM4BD420.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM4BD420.cbl](../programs/VM4BD420.cbl__migration.md) · **Rule/variant:** RULE-022, RULE-022-V04 · **Source assessment:** `CONFLICT`.

**Condition:** StatusC after event scan

**Original behavior:** Output two packed 15,2 amounts, creationCI9(6), issue 4, sequence 9(4), issue dateX8, stockR2X12.

**Delivered Db2 behavior:** Same file layout; DCLGEN amounts/sequence moved numerically; stockCHAR12 directly; date convertedEUR→8 digits; creationkey 20 packed→28 display.

**Evidence:** `IDMS Programs/VM4BD420.cbl` physical L61–84; `IDMS Programs/VM4BD420.cbl` physical L213–221; `DB2 Manual converted Programs/VMDZ4420.cbl` physical L50–73; `DB2 Manual converted Programs/VMDZ4420.cbl` physical L316–339; `Dclgens/DZBEFFTV.txt` physical L37–59; `Dclgens/DZEVEFTV.txt` physical L19–43.

**Question versions / production gaps:** [Q-000004](../_audit/questions/Q-000004.md), [Q-000014](../_audit/questions/Q-000014.md), [Q-000017](../_audit/questions/Q-000017.md), [Q-000037](../_audit/questions/Q-000037.md), [Q-000039](../_audit/questions/Q-000039.md)

### VM4BD420-C005 — EOF/error separation and cursor cleanup

**Phase 2 rehearsal assessment (STATIC_CONDITIONAL_RECHECK):** Under the fixture a failed OPEN/FETCH/CLOSE cannot return to the unchanged loop flags, so the known failure path does not silently continue. A business D still closes the child normally and suppresses output; it never becomes synthetic SQL+100. The distinction survives the answer-driven revision.

**Case-specific test condition:** Unexpected SQL errors are fatal after diagnostic preservation/rollback; normal FETCH+100 remains EOF.

**Revised scenario conditions / expected checks:**

- SuccessfulD exit: CLOSE child and do notWRITE.
- FETCH100: ordinary EOF without stale processing.
- CLOSE failure after C: fatal fixture outcome before any successful completion/publication claim.

**Production finding retained:** SQLERROR/IDMS-STATUS/USERABEN implementations and failure cleanup remain absent. No handler, warning, rollback or early-close fault was executed; sequential output recovery has a separate external policy.

**Applied answer versions:** [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM4BD420.cbl](../programs/VM4BD420.cbl__migration.md) · **Rule/variant:** RULE-033, RULE-033-V04 · **Source assessment:** `PARTIAL`.

**Condition:** Every Db 2 cursor operation including earlyDclose

**Original behavior:** IDMS-STATUS on bind/ready and each fetchedrecord; DB-END-OF-SET controls loops; legacy D synthesizes 0307.

**Delivered Db2 behavior:** Each OPEN/CLOSE handles 0/OTHER; FETCH0/100/OTHER. Independent flags; successful earlyD closes cursor then no write.

**Evidence:** `IDMS Programs/VM4BD420.cbl` physical L151–191; `IDMS Programs/VM4BD420.cbl` physical L199–224; `DB2 Manual converted Programs/VMDZ4420.cbl` physical L357–494.

**Question versions / production gaps:** [Q-000035](../_audit/questions/Q-000035.md)

### VM4BD420-C006 — Only justified helper storage

**Phase 2 rehearsal assessment (STATIC_CONDITIONAL_RECHECK):** SW-STATUS-D remains removable because everyY assignment immediately follows WS-STATUS=D and no intervening successful branch changes it before exit. The existing-state-only variant matched legacy/target output decisions across 2801 model sequences. Comparing the still-live reordered date removes the duplicate scalar; neither change allows parent/child EOF to share one state.

**Case-specific test condition:** Use the scoped EUR date interpretation and nonreturning SQL failure contract while preserving all successful-path state transitions.

**Revised scenario conditions / expected checks:**

- Replace the loop’s extra D flag test with WS-STATUS=D and retain SQL EOF separately.
- Use WS-STATUS=C for the final write guard.
- Reuse date staging only before a later output-date conversion overwrites it.

**Production finding retained:** No COBOL source was edited or compiled. Runtime error handling and date settings remain unverified; the model covers decoded successful paths, not database/failure semantics.

**Applied answer versions:** [Q-000014](../_audit/questions/Q-000014.md) [VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl, VM7BD200.cbl; PROVIDED]; [Q-000035](../_audit/questions/Q-000035.md) [VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM4BD420.cbl](../programs/VM4BD420.cbl__migration.md) · **Rule/variant:** RULE-023, RULE-023-V04 · **Source assessment:** `PARTIAL`.

**Condition:** Existing WS-STATUS already represents D

**Original behavior:** Existing WS-STATUS, composite-key area, PARMDATE/dateoverlays.

**Delivered Db2 behavior:** Extra SW-STATUS-D and duplicate eventdate removable; two independent cursor flags needed by present nestedPERFORM shape; counters/timestamp are diagnostic.

**Evidence:** `DB2 Manual converted Programs/VMDZ4420.cbl` physical L61–151; `DB2 Manual converted Programs/VMDZ4420.cbl` physical L262–314.

**Question versions / production gaps:** [Q-000014](../_audit/questions/Q-000014.md), [Q-000035](../_audit/questions/Q-000035.md)

### VM4BD420-C007 — Date overlays and file boundaries

**Phase 2 rehearsal assessment (STATIC_CONDITIONAL_RECHECK):** The existing DATE6 REDEFINES still aliases six bytes, and the added date overlay aliases eight bytes without a second allocation. The visible50-byte output arithmetic is unchanged. The expanded28-byte copied event group is not an overlay of the former20-byte representation and still requires external conversion proof.

**Case-specific test condition:** Use the scoped EUR/sentinel and 28-digit event-key fixture while retaining the supplied date interface and output field definitions.

**Revised scenario conditions / expected checks:**

- Minimum/maximum DATE sentinels map to the scoped zero/high numeric forms.
- No OCCURS or SQL rowset is introduced by these visible interfaces.
- Do not replace a typed numeric MOVE with a rawgroup MOVE to a packed field.

**Production finding retained:** Generated IDMS layouts, actual compiler/buffer bytes and loader definitions remain absent. Static arithmetic cannot establish byte-equivalent packed output or date-service behavior.

**Applied answer versions:** [Q-000014](../_audit/questions/Q-000014.md) [VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl, VM7BD200.cbl; PROVIDED]; [Q-000017](../_audit/questions/Q-000017.md) [VM1BD526.cbl, VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl; PROVIDED]. No answer is treated as production approval.

**Program:** [VM4BD420.cbl](../programs/VM4BD420.cbl__migration.md) · **Rule/variant:** RULE-017, RULE-017-V03 · **Source assessment:** `PRESERVED_VISIBLE_LAYOUT`.

**Condition:** Date parameter conversion and each successful output

**Original behavior:** DATE6 redefinesDATE6R reversed fields; group moves make explicit DDMMYY order. No source OCCURS or SQL arrays.

**Delivered Db2 behavior:** Same legacy overlay; new DA-CCYYMMDD-R is an 8 byte alias; output remains 50 bytes and is initialized perwrite.

**Evidence:** `IDMS Programs/VM4BD420.cbl` physical L87–106; `DB2 Manual converted Programs/VMDZ4420.cbl` physical L113–151; `DB2 Manual converted Programs/VMDZ4420.cbl` physical L316–339; `Copybook/ESDATMAS.cpy` physical L15–38.

**Question versions / production gaps:** [Q-000014](../_audit/questions/Q-000014.md), [Q-000017](../_audit/questions/Q-000017.md)

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
| Empty owner/parent/child levels | Exercise owner absent, owner present/no parent, parent/no child separately. | Only the approved missing-owner skip is benign; each cursor EOF must leave no stale row eligible for output. |
| 302 exact window | Below/equal/above both bounds; January rollover; March 31 month subtraction. | Retain strict cutoff and inclusive lower bound; the test preserves integer subtraction; actual calendar-policy approval remains open. |
| Encounter-order reducer | Reverse two creations; two equal-date transfers; no usable CI with qualifying redemption. | Preserve first/last/tie semantics for the chosen order, including possible CI 000000 in 302. |
| 420 C/D/S and no-extra-D-flag | Creation/status/redemption permutations, future/equal dates, disqualifying state versus state 1. | D stops and suppresses output; C writes; a no-helper rewrite must produce the same state and selected CI. |
| SQL lifecycle failures | OPEN/FETCH/CLOSE error at both levels, returning handler, cleanup overwriting SQLCODE. | Do not process invalid hosts or loop forever; preserve original failure and close only appropriately opened resources. |
| Representation/partial file | Maximum amount, leading-zero keys, DATE format variants, failure after output WRITE. | Approved numeric domains and byte layout; partial output must follow the exact per-job test policy and still-open production recovery contract. |

These are production-oriented test specifications. Static source tracing, declaration arithmetic and separate Python reasoning models can demonstrate a particular condition or counterexample. They cannot establish COBOL compiler behavior, SQL runtime behavior, complete output byte compatibility or job recovery on the real mainframe. Actual environment tests must report their own inputs, observed outputs and evidence.

## 7. Exact answer versions, origin and accepted scope

The corpus has **36 PROVIDED temporary answers, 3 DEFERRED questions, 0 real human answers and 39 production questions still OPEN**. Every row below has origin `SIMULATED_FOR_TEST` and review state `TEST_ASSUMPTION_ONLY`; the explicit origin column makes that provenance travel with the answer. A provided answer resolves only its stated rehearsal policy. Deferred Q-000011/Q-000012/Q-000015 remain open even for the test.

Links open the exact Phase 2 snapshots consumed here. The SHA-256 is the full marked answer block, including its scope/provenance metadata; the raw snapshot hash is additionally recorded in [questions.json](../_audit/questions.json). The original unanswered Phase 1 snapshots and both superseded Q-000025 drafts remain preserved. Q-000025's current version identifies the 20-byte parameter input, with answer SHA-256 `d8ee3a88f15953763825e49b87cd65e76f8277026d9034fe94336555ae37d1dd`.

Each listed input scope is exact. Shared technical rules may cite an example from another category, but its answer cannot be applied to a different program merely because the guide includes it. The condition in the exact snapshot remains part of the scope.

| Question / response | Origin | Accepted input scope | Answer SHA-256 | Exact temporary policy or deferral |
| --- | --- | --- | --- | --- |
| [Q-000001](../_audit/questions/Q-000001.md) / PROVIDED | SIMULATED_FOR_TEST | VM4BD302.cbl | `fb24fb8354726cad59a054e34efd67e143712c0ea16e6ef006ea168e8f0ec91c` | Preserve the observed integer month subtraction for this test; flag real business policy unresolved. |
| [Q-000002](../_audit/questions/Q-000002.md) / PROVIDED | SIMULATED_FOR_TEST | VM4BD302.cbl | `0b8a37c38739ac364c3ea5b24ffeb3d3bbeadef4cb1219730086b50171f03d1d` | Use decimal-only stock/CI and amounts within destination range for simulated tests; preserve production domain/range question. |
| [Q-000003](../_audit/questions/Q-000003.md) / PROVIDED | SIMULATED_FOR_TEST | VM4BD302.cbl | `a94c028c8f6e1c7977ecd86c9a8980713172ed2fc5e798ef24e1610af6d1714b` | Test only successful 2610-byte service responses; preserve an open question for failure policy and the missing executable. |
| [Q-000004](../_audit/questions/Q-000004.md) / PROVIDED | SIMULATED_FOR_TEST | VM4BD420.cbl | `412b5887ee7880e82aca7615ae82553c335cf71dd8e5293736f92bdd42d807a2` | For test only assume last encountered 0060 is desired and top two creation CI digits are zero; retain real domain/order evidence gaps. |
| [Q-000005](../_audit/questions/Q-000005.md) / PROVIDED | SIMULATED_FOR_TEST | VM7BD200.cbl | `b9e640fd93cad8bca2f208dc950260dc1a4ac01294775249b02fead0098fa767` | SIMULATED_FOR_TEST: Require compatibility for named business fields and filler bytes. Do not approve blanking without consumer evidence; keep byte compatibility unresolved. |
| [Q-000006](../_audit/questions/Q-000006.md) / PROVIDED | SIMULATED_FOR_TEST | VM7BD200.cbl | `bf79237d7fab06eda9a7151c7a04c73b77834124e3e53a4ba364e8a56abb752a` | SIMULATED_FOR_TEST: Map zero to 0001-01-01 and high date 99999999 to 9999-12-31. Retain strict less-than and the creation-date fallback. Actual migrated data has not been reconciled. |
| [Q-000007](../_audit/questions/Q-000007.md) / PROVIDED | SIMULATED_FOR_TEST | VM7BD200.cbl | `57226ef04f842a3636f8c39fde791eaf29837f18dadb3038329e2b6b3fcda00b` | SIMULATED_FOR_TEST: Discard partial output and recreate it from a frozen read snapshot. Do not claim exactly-once production processing. |
| [Q-000008](../_audit/questions/Q-000008.md) / PROVIDED | SIMULATED_FOR_TEST | VM7BD200.cbl | `4c58fd9a2d5926f7eac0c68f656825e781ce1842ef4af00c315c021cbd31d272` | SIMULATED_FOR_TEST: Order is not business-significant, but F-TELLER must be unique and contiguous within an extract. Retain the production question and require row-set reconciliation. |
| [Q-000010](../_audit/questions/Q-000010.md) / PROVIDED | SIMULATED_FOR_TEST | VM1BD567.cbl | `81eab6da2b9fd6c53b0805e0a236a6b37c8f3907f1edc01072a709c0072e7ec1` | Test only: designate 0001-01-01 as the missing-creation-date sentinel and include zero, blanks, leap date and invalid nonzero date cases. |
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
| [Q-000023](../_audit/questions/Q-000023.md) / PROVIDED | SIMULATED_FOR_TEST | VM4BD310.cbl | `b07a03b4bd49aac9f10a583f3df3d3e35ae2acd5722b79ec84f15b06e9e033ad` | SIMULATED_FOR_TEST: Preserve the first event 0092 selected by the original set traversal. Treat the highest-ID selection as unverified until its ordering is proved. |
| [Q-000024](../_audit/questions/Q-000024.md) / PROVIDED | SIMULATED_FOR_TEST | VM7BD200.cbl | `2ff78084a1afd9632a15aeffd5576f952cd9fd68c71dc7dea229a05c84492dde` | SIMULATED_FOR_TEST: Accept RA_BASFMAS_479BFAS as the intended spelling while retaining the original CSV bytes and the documented correction. |
| [Q-000025](../_audit/questions/Q-000025.md) / PROVIDED | SIMULATED_FOR_TEST | VM7BD200.cbl | `d8ee3a88f15953763825e49b87cd65e76f8277026d9034fe94336555ae37d1dd` | SIMULATED TEST ASSUMPTION — corrected role: VMDZ270I is the 20-byte archive-parameter INPUT copybook read from DAARCH, not the 530-byte output record. For this rehearsal only, assume the supplied VMBZ270I parameter layout is retained with its level-01 name changed. The actual VMDZ270I member is still missing, so build/layout closure is not established. This answer makes no claim about REC-FORM filler bytes or output-consumer compatibility; those remain under Q-000005. It supersedes the earlier synthetic draft that incorrectly described an output interface. |
| [Q-000026](../_audit/questions/Q-000026.md) / PROVIDED | SIMULATED_FOR_TEST | VM4BD310.cbl | `ce9927b5535de374b86e640e0042dff6b30415c95ff9654fcc6cd2e84b29ce40` | SIMULATED TEST ASSUMPTION: VMDZ510I retains the supplied VMBD510I layout with the top-level name changed. No physical copybook is created or claimed present; byte compatibility and build closure remain unresolved. |
| [Q-000031](../_audit/questions/Q-000031.md) / PROVIDED | SIMULATED_FOR_TEST | VM1BD526.cbl, VM1BD567.cbl | `8d10600a8b7e32103b6225815811cc48e7a1c220a0578cf63e20504397450493` | Test only: start with an empty target/checkpoint state and a fresh immutable input; separately test an explicit legacy-count conversion fixture. |
| [Q-000032](../_audit/questions/Q-000032.md) / PROVIDED | SIMULATED_FOR_TEST | VM1BD526.cbl, VM1BD567.cbl | `e597418af19bb6c7916aa3ba63f1483828f2e07acdb8ec894eafdfc16432a406` | For a clearly marked simulated test, define a count-only 15-byte protocol with immutable input; keep the observed 1215-byte initial form as an implementation inconsistency to assess. |
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
