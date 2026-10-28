# Answer impact — Phase 2 / Run-001

Baseline: `Phase-1/Run-001`. This is the isolated six-program TEST_REHEARSAL. Every consumed answer is **SIMULATED_FOR_TEST** and was written by the assistant under the user’s explicit test instruction. There are **zero actual human-approved answers**. All 39 production questions remain OPEN. The three deferred artifact/identity questions remain OPEN in the rehearsal as well.

The source inventory is unchanged. The exact baseline file hashes are recorded in `_audit/run.json`; the exact answer bytes, origin, scope and hashes are in `_audit/questions.json` and `_audit/questions/`. No COBOL source, DCLGEN, mapping sheet, copybook or schema was modified.

## What changed in the analysis

Phase 1 established observed behavior and issued unanswered questions. Phase 2 adds explicit fixture assumptions and tests each against the observed implementation. It retains the VMDZ4310 missing-capital projection, VMDZ1567 short-file restart gap, narrow counter risks, checkpoint payload inconsistency and unresolved event-order changes. An intended repair of the legacy VM1BD567 counting defect is recorded separately from strict equivalence. Missing declarations and physical artifacts remain missing.

Every program report is complete in this revision. Each case has a scoped recheck below and in its report; all four guides include the actual conditional answer impact. All 198 rule/program applicability rows retain their source-based disposition and add the applicable fixture policies and case rechecks. No unknown was converted to production support merely because the assistant supplied an answer.

### Correction of a question premise

Q-000025 originally mislabelled the missing VMDZ270I member as output. Source rechecking established the 20-byte archive parameter INPUT role; the separate 530-byte output is declared inline. The corrected question and final synthetic answer preserve the same stable ID and do not establish output compatibility. Superseded synthetic drafts and hashes are retained in `../../../answer-revisions/`; see [documentation corrections](../../../DOCUMENTATION_CORRECTIONS.md). A separate display-only hash typo in the Phase 1 7200 report is corrected in Phase 2; all machine/source hashes were correct and the frozen baseline remains unchanged.

## Every consumed answer and its scope

| Question / exact answer hash | Response / review | Accepted test scope | Previous finding → revised test interpretation | Affected cases / rules / guides | Implementation and remaining work |
| --- | --- | --- | --- | --- | --- |
| [Q-000001](_audit/questions/Q-000001.md) / `fb24fb8354726cad59a054e34efd67e143712c0ea16e6ef006ea168e8f0ec91c` | PROVIDED / TEST_ASSUMPTION_ONLY | VM4BD302.cbl | Phase 1: Is the exact retained month-number subtraction with unchanged day the intended cutoff, including March31→February31, or should production use calendar month-end clamping? → Phase 2: Preserve the observed integer month subtraction for this test; flag real business policy unresolved. | VM4BD302-C004, RULE-027, G01 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. Clarifies whether a legacy edge case should be preserved or deliberately changed; a business answer must not be mistaken for a source fix. |
| [Q-000002](_audit/questions/Q-000002.md) / `0b8a37c38739ac364c3ea5b24ffeb3d3bbeadef4cb1219730086b50171f03d1d` | PROVIDED / TEST_ASSUMPTION_ONLY | VM4BD302.cbl | Phase 1: Are 12-character stock IDs and six-character CIs always decimal digits for this output, and can the13-integer-digit amount exceed the12-integer-digit output capacity? → Phase 2: Use decimal-only stock/CI and amounts within destination range for simulated tests; preserve production domain/range question. | VM4BD302-C006, VM4BD302-C007, RULE-022, RULE-023, G01, G02, G03, G04 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. Controls safe removal of staging helpers and prevention of corrupted/truncated file output; do not claim a newly introduced defect merely from an inherited width. |
| [Q-000003](_audit/questions/Q-000003.md) / `a94c028c8f6e1c7977ecd86c9a8980713172ed2fc5e798ef24e1610af6d1714b` | PROVIDED / TEST_ASSUMPTION_ONLY | VM4BD302.cbl | Phase 1: For VM9BC50T QUERY001/CO-CLE2, which return-major/minor/actual-length values authorize use of issue key and currency, and must failure skip, reject, or abort the input? → Phase 2: Test only successful 2610-byte service responses; preserve an open question for failure policy and the missing executable. | VM4BD302-C001, VM4BD302-C002, VM4BD302-C008, VM4BD302-C009, RULE-006, RULE-032, RULE-033, RULE-017, G01, G02, G03, G04 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. No migration proof of key validity or hidden side effects; converting a failed call result into an owner-not-found can conceal an error. |
| [Q-000004](_audit/questions/Q-000004.md) / `412b5887ee7880e82aca7615ae82553c335cf71dd8e5293736f92bdd42d807a2` | PROVIDED / TEST_ASSUMPTION_ONLY | VM4BD420.cbl | Phase 1: For statusC output, is the last encountered qualifying0060 creation event intended, and are its8-digit embedded creationCI values constrained so the6-digit UIT-NR-CIO-CRE receives the correct identifier? → Phase 2: For test only assume last encountered 0060 is desired and top two creation CI digits are zero; retain real domain/order evidence gaps. | VM4BD420-C003, VM4BD420-C004, RULE-004, RULE-022, G01, G02, G03, G04 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. Separates preserved narrowing behavior from approved business identity and order; confirms whether multiple0060 records are allowed. |
| [Q-000005](_audit/questions/Q-000005.md) / `b9e640fd93cad8bca2f208dc950260dc1a4ac01294775249b02fead0098fa767` | PROVIDED / TEST_ASSUMPTION_ONLY | VM7BD200.cbl | Phase 1: Must the478-byte embedded VMBFAS image preserve every original byte, including the2- and14-byte filler areas noted as containing COMP-3 values, or are blank fillers approved? Supply the generated original record and the downstream layout. → Phase 2: SIMULATED_FOR_TEST: Require compatibility for named business fields and filler bytes. Do not approve blanking without consumer evidence; keep byte compatibility unresolved. | VM7BD200-C005, RULE-017, G01, G02, G03, G04 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. The target reconstructs named fields and blanks filler bytes. The original copies the complete record image. |
| [Q-000006](_audit/questions/Q-000006.md) / `bf79237d7fab06eda9a7151c7a04c73b77834124e3e53a4ba364e8a56abb752a` | PROVIDED / TEST_ASSUMPTION_ONLY | VM7BD200.cbl | Phase 1: Was every accounting date00000000 migrated to Db2 DATE0001-01-01, and must the creation-date fallback and strict less-than cutoff remain exactly as in the original? → Phase 2: SIMULATED_FOR_TEST: Map zero to 0001-01-01 and high date 99999999 to 9999-12-31. Retain strict less-than and the creation-date fallback. Actual migrated data has not been reconciled. | VM7BD200-C004, RULE-012, G01, G02, G03, G04 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. The SQL predicate preserves the original structure only under that sentinel conversion contract. |
| [Q-000007](_audit/questions/Q-000007.md) / `57226ef04f842a3636f8c39fde791eaf29837f18dadb3038329e2b6b3fcda00b` | PROVIDED / TEST_ASSUMPTION_ONLY | VM7BD200.cbl | Phase 1: What job and file policy handles a partially written archive extract: recreate from a frozen row snapshot, append with deduplication, or resume? Supply the operational contract. → Phase 2: SIMULATED_FOR_TEST: Discard partial output and recreate it from a frozen read snapshot. Do not claim exactly-once production processing. | VM7BD200-C007, RULE-015, G01, G03 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. There is no checkpoint table, persisted last-written key, or atomic Db2/file transaction in the supplied program. |
| [Q-000008](_audit/questions/Q-000008.md) / `4c58fd9a2d5926f7eac0c68f656825e781ce1842ef4af00c315c021cbd31d272` | PROVIDED / TEST_ASSUMPTION_ONLY | VM7BD200.cbl | Phase 1: Is output order, including the F-TELLER number associated with each form, a business contract? May the same form set be ordered by Db2 surrogate NR_ID instead of original area order? State tie and concurrency rules. → Phase 2: SIMULATED_FOR_TEST: Order is not business-significant, but F-TELLER must be unique and contiguous within an extract. Retain the production question and require row-set reconciliation. | VM7BD200-C006, RULE-025, G01, G03, G04 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. The same eligible form set can receive different per-form sequence numbers when its order changes. |
| [Q-000009](_audit/questions/Q-000009.md) / `ba03401f9f8a06deb79d84dc9631e2202140868d0512a6e9aae0233cbf9d7766` | PROVIDED / TEST_ASSUMPTION_ONLY | VM1BD526.cbl, VM1BD567.cbl | Phase 1: Should audit timestamps identify job start or each individual business change, and is VMDZ1526 insertion TS_UPDATE = 9999-12-31-23.59.59.999999 the approved never-updated marker? → Phase 2: For simulated tests, define a run-scoped timestamp and the maximum timestamp as a never-updated marker; retain this as intent, not a proven site standard. | VM1BD526-C003, VM1BD526-C016, VM1BD567-C003, RULE-018, RULE-030, G02, G04 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. Determines audit meaning and safe reuse of timestamp storage; using SQL CURRENT TIMESTAMP per row would change observed semantics. |
| [Q-000010](_audit/questions/Q-000010.md) / `81eab6da2b9fd6c53b0805e0a236a6b37c8f3907f1edc01072a709c0072e7ec1` | PROVIDED / TEST_ASSUMPTION_ONLY | VM1BD567.cbl | Phase 1: Must a blank or zero input creation date select the form key dated 0001-01-01, or should such input be rejected or routed to a different outcome? → Phase 2: Test only: designate 0001-01-01 as the missing-creation-date sentinel and include zero, blanks, leap date and invalid nonzero date cases. | VM1BD567-C002, RULE-013, G01, G02 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. The normalization can target a different existing row; a representable SQL DATE does not establish approved missing-date semantics. |
| [Q-000011](_audit/questions/Q-000011.md) / `bb2cb5105bdb292d0e1dd003d147a3dcb88be7621346a46fa099eb2a6aa19574` | DEFERRED / TEST_ASSUMPTION_ONLY | VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl | Phase 1: Is FFRECAT to DZ01FFTB the intended second buffer replacement, and which actual producer/consumer program paths establish its keys, lifecycle, transaction ownership and recovery obligations? → Phase 2: DEFERRED FOR TEST. Retain FFRECAT to DZ01FFTB only as the observed mapping candidate. No buffer DDL or demonstrated producer/consumer lifecycle was supplied. Do not identify an in-memory record-copy helper as this persistent buffer. | RULE-003, G01, G02, G03, G04 | Deferred; no replacement evidence supplied. Production OPEN. Prevents a fabricated buffer migration, hidden producer/consumer transaction claims, or mistaken decommissioning of an unused declaration. |
| [Q-000012](_audit/questions/Q-000012.md) / `51e00e15dd7390a77f08dcf62f3876aa667d349380bb2106c7a718bf0732237b` | DEFERRED / TEST_ASSUMPTION_ONLY | VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl | Phase 1: Which exact COBOL/IDMS/Db2 versions, source/debugging options, compilation/bind settings, site coding standards and generated IDMS record/control members produced these six source pairs? Supply the matching build/dependency bundle. → Phase 2: DEFERRED. No actual build or generated-member bundle is supplied by this rehearsal. Use the visible declarations for static reasoning only; perform no fictitious compile or runtime checks. | G01, G02, G03, G04 | Deferred; no replacement evidence supplied. Production OPEN. Precompile/compile, legacy generated layouts, warning policy, debug lines and site-standard conformance cannot be certified. |
| [Q-000013](_audit/questions/Q-000013.md) / `dfe460e4157f9191cc517497617fe33063ec10bc71e9633e6427b51dd4201783` | PROVIDED / TEST_ASSUMPTION_ONLY | VM4BD310.cbl | Phase 1: For NX-CPCRE=0, must AM-CND-FORM-AS retain the parent AM-CND-STOCK value, including nonzero amounts, or was a zero output deliberately approved? → Phase 2: SIMULATED_FOR_TEST: Preserve the original capital amount. The omitted projection remains a defect; this temporary answer does not fix the source. | VM4BD310-C004, RULE-002, G01, G02, G03, G04 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. The target initializes the DCLGEN and omits AM_CNDSTK from its SELECT, then copies that zero-initialized host in the rank-zero branch. |
| [Q-000014](_audit/questions/Q-000014.md) / `5427518e5ff6db124d8b2e2141f889baa56e69d4ba74c79bd451787e3eb1e2c9` | PROVIDED / TEST_ASSUMPTION_ONLY | VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl, VM7BD200.cbl | Phase 1: Which effective DATE output format and approved legacy zero/high-date conversions apply to the date fields read by these programs? Provide actual package/preparation settings and the load conversion specification. → Phase 2: SIMULATED TEST POLICY: fetched DATE strings use EUR dd.mm.yyyy; legacy 00000000 corresponds to 0001-01-01 and 99999999 to 9999-12-31 where the documented program-specific branch uses that convention. Keep all other predicates, century cutoffs and date arithmetic unchanged. Actual environment and loaded data remain unverified. | VM4BD302-C001, VM4BD302-C004, VM4BD302-C005, VM4BD310-C006, VM4BD420-C001, VM4BD420-C003, VM4BD420-C004, VM4BD420-C006, VM4BD420-C007, VM7BD200-C004, VM7BD200-C008, RULE-006, RULE-027, RULE-025, RULE-012, RULE-004, RULE-022, RULE-023, RULE-017, G01, G02, G03, G04 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. A different returned string format changes comparison operands and file dates. A sentinel convention changes business selection; a source answer alone is not evidence of deployed settings. The programs parse fixed DD.MM.YYYY character positions. A DCLGEN PIC X(10) alone does not establish the output format. |
| [Q-000015](_audit/questions/Q-000015.md) / `4e90098a8c4cb093e43908258e8902a0a22e52b7d37157256d843f609c72825b` | DEFERRED / TEST_ASSUMPTION_ONLY | VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl | Phase 1: Supply the eight distinct approved decommission identities, using IDMS or Db2 names, with namespace, scope and retained business obligations. → Phase 2: DEFERRED FOR TEST. The eight identities have not been supplied. Do not invent names, count schema declarations as an approved list, or authorize deletion of their dependent conditions. All eight remain unresolved. | RULE-014, G01, G02, G03, G04 | Deferred; no replacement evidence supplied. Production OPEN. Prevents an honest eight-entity use/removal checklist and any authorization claim that dependent business conditions may be removed. Unused LR components do not prove decommissioning. The authoritative eight-entity list was not supplied. |
| [Q-000016](_audit/questions/Q-000016.md) / `66b2fd7b2daae388103c02c56d500076a0613a06a9a733379dd0e81b753ca4e9` | PROVIDED / TEST_ASSUMPTION_ONLY | VM1BD526.cbl | Phase 1: Supply the VMBEFF-VMBEVEF set-order definition and specify which matching 0168/0219 event must be updated when several exist: the legacy first qualifying member or the greatest generated NR_ID_479EVEF? → Phase 2: Test-only fixtures can define greatest-ID selection as intended and expose a multi-event counterexample where it differs from legacy set order; do not silently change the original assessment. | VM1BD526-C004, VM1BD526-C005, RULE-025, RULE-019, G01, G03, G04 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. The target may update a different business event while returning success; a sequence surrogate is not proof of legacy set order. |
| [Q-000017](_audit/questions/Q-000017.md) / `9202cc08b72392627f0e771ef016b7eb0bb79de9771a723630cb35dc8513a0a7` | PROVIDED / TEST_ASSUMPTION_ONLY | VM1BD526.cbl, VM4BD302.cbl, VM4BD420.cbl, VM4BD310.cbl | Phase 1: What approved loader and consumer specification maps the legacy 20-byte packed/mixed NR-ID-GOOD to the supplied 28-character NR_IDGOOD_479EVEF, including sign and date conventions, when the mapping sheet still says CHAR(20)? → Phase 2: SIMULATED TEST POLICY: use 28 display digits in widths 8+8+6+3+3, preserve leading zeroes, use nonnegative operation codes and the stated minimum-date convention. Treat CHAR(28) as intended for this test only. Keep the original CHAR(20) CSV row unchanged and visible as a conflict; no actual loader/consumer specification is supplied. | VM1BD526-C003, VM1BD526-C006, VM4BD302-C004, VM4BD302-C005, VM4BD302-C006, VM4BD302-C007, VM4BD310-C005, VM4BD420-C003, VM4BD420-C004, VM4BD420-C007, RULE-018, RULE-022, RULE-027, RULE-025, RULE-023, RULE-004, RULE-017, G01, G02, G03, G04 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. Byte-level equality, existing converted data and downstream lookups cannot be assumed; current target fits the supplied DCLGEN but conflicts with mapping. The key date, operation 91 test and creation-CI output all depend on the byte layout and valid domains. Mechanical MOVE or hyphen replacement cannot establish equivalence. The original key group is20 bytes with packed numeric members. The DCLGEN is CHAR(28), while the mapping says CHAR(20). |
| [Q-000018](_audit/questions/Q-000018.md) / `6269d5bb5d62531ddefe45e2270c9cd7115e3e417218a58c933d4782fe38ac00` | PROVIDED / TEST_ASSUMPTION_ONLY | VM1BD526.cbl | Phase 1: Provide the target parent/event/sequence DDL and legacy CALC/set definitions proving unique parent selection, event foreign-key enforcement, generated event-ID uniqueness and the meaning of new-event NS_IDMSKEY=0. → Phase 2: A test fixture may enforce the four-column parent key, event surrogate PK and parent FK, and reserve IDMSKEY zero for newly created Db2 rows, while leaving actual DDL unverified. | VM1BD526-C002, VM1BD526-C003, VM1BD526-C004, VM1BD526-C005, RULE-020, RULE-018, RULE-025, RULE-019, G01, G03, G04 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. Orphans, duplicate parents, sequence collisions or multirow updates cannot be excluded; zero IDMS-key policy is unexplained. |
| [Q-000019](_audit/questions/Q-000019.md) / `f869f03c4919398b3af058e11be9583e0f1f92c5feb6da59b74f039861d69981` | PROVIDED / TEST_ASSUMPTION_ONLY | VM4BD310.cbl | Phase 1: After failure with some mutation records already written, must the job replace the partial output and rerun the same immutable input from the start, or must downstream processing deduplicate or resume it? → Phase 2: SIMULATED_FOR_TEST: Discard partial output and rerun the immutable input. This is an operational test assumption, not evidence of actual JCL behavior. | VM4BD310-C007, RULE-015, RULE-017, G01, G02, G03, G04 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. No persisted checkpoint connects input position, output records, and sequence counters. |
| [Q-000020](_audit/questions/Q-000020.md) / `635fd2857757b359ca986d7b9edcb5e4187eead589b54f1be785e0c3ead9f049` | PROVIDED / TEST_ASSUMPTION_ONLY | VM1BD526.cbl, VM1BD567.cbl | Phase 1: Supply the exact VMDZ205I member used for these builds and confirm whether its 1200-byte layout and numeric/group aliases are identical to the supplied VMBD205I, apart from the level-01 name. → Phase 2: For an explicitly simulated test only, use a byte-identical 1200-byte copy of VMBD205I with only the level-01 name changed; record that this does not establish the real build layout. | VM1BD526-C001, VM1BD526-C007, VM1BD526-C010, VM1BD567-C001, RULE-008, RULE-023, RULE-026, RULE-005, G01, G02, G03, G04 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. Blocks exact input-host compatibility, no-new-helper proofs, file length validation and full transitive dependency closure. |
| [Q-000021](_audit/questions/Q-000021.md) / `93288bfb0edb3a53caf67f699314c48f3eb79e9b709699cfdc17f7cc904d6fc4` | PROVIDED / TEST_ASSUMPTION_ONLY | VM1BD567.cbl | Phase 1: Is the intended checkpoint the count of successfully processed physical input records, committed every 100 such records, and is the conversion authorized to repair the supplied legacy CTR-REC behavior? → Phase 2: For an explicitly simulated policy answer, declare a successful-record count and 100-record atomic batches as intended, treating the legacy counter issue as a defect and the target cadence as a repair subject to validation. | VM1BD567-C007, VM1BD567-C010, RULE-010, RULE-001, G02, G04 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. A correct intended 100-record checkpoint implementation differs materially from this supplied legacy listing; static equivalence and business correctness must be assessed separately. |
| [Q-000022](_audit/questions/Q-000022.md) / `8a370f537c103f78c66f4e28a27d4f87b8e45971143a085f9d804993f04beee3` | PROVIDED / TEST_ASSUMPTION_ONLY | VM4BD310.cbl | Phase 1: Must parent missing, parent with no events, and parent with events but no event0092 retain distinct diagnostics or rejection categories, even if every condition terminates the batch? → Phase 2: SIMULATED_FOR_TEST: All three conditions are fatal and must remain distinguishable. Preserve the observed diagnostic gap as a separate implementation issue. | VM4BD310-C002, RULE-021, G03 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. The original path returns three distinct custom statuses; the target has parent SELECT+100 and filtered-event SELECT+100, merging two child outcomes. |
| [Q-000023](_audit/questions/Q-000023.md) / `b07a03b4bd49aac9f10a583f3df3d3e35ae2acd5722b79ec84f15b06e9e033ad` | PROVIDED / TEST_ASSUMPTION_ONLY | VM4BD310.cbl | Phase 1: When a stock has multiple event0092 records, must the program choose the first event in the original VMBEFF-VMBEVEF set order, or the event with the greatest relational NR_ID? Please provide the set ORDER definition and the surrogate-ID load and tie rules. → Phase 2: SIMULATED_FOR_TEST: Preserve the first event 0092 selected by the original set traversal. Treat the highest-ID selection as unverified until its ordering is proved. | VM4BD310-C003, RULE-025, G01, G03, G04 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. The output form key and date depend on the chosen event. Descending surrogate ID is not proved equivalent to the original traversal. |
| [Q-000024](_audit/questions/Q-000024.md) / `2ff78084a1afd9632a15aeffd5576f952cd9fd68c71dc7dea229a05c84492dde` | PROVIDED / TEST_ASSUMPTION_ONLY | VM7BD200.cbl | Phase 1: Should mapping logical row193, RA_BASFMAS _479BFAS, be corrected to the exact DCLGEN and SQL identifier RA_BASFMAS_479BFAS? → Phase 2: SIMULATED_FOR_TEST: Accept RA_BASFMAS_479BFAS as the intended spelling while retaining the original CSV bytes and the documented correction. | VM7BD200-C005, RULE-017, G01, G02, G03, G04 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. The mapping has an embedded space. Only a whitespace-normalized candidate matches the actual DCLGEN column. |
| [Q-000025](_audit/questions/Q-000025.md) / `d8ee3a88f15953763825e49b87cd65e76f8277026d9034fe94336555ae37d1dd` | PROVIDED / TEST_ASSUMPTION_ONLY | VM7BD200.cbl | Phase 1: Supply VMDZ270I and confirm its exact 20-byte archive-parameter input layout, including DA-ARCH-YMD and related parameter fields, against supplied VMBZ270I. This corrects the output-role wording of the original Phase 1 question. → Phase 2: SIMULATED TEST ASSUMPTION — corrected role: VMDZ270I is the 20-byte archive-parameter INPUT copybook read from DAARCH, not the 530-byte output record. For this rehearsal only, assume the supplied VMBZ270I parameter layout is retained with its level-01 name changed. The actual VMDZ270I member is still missing, so build/layout closure is not established. This answer makes no claim about REC-FORM filler bytes or output-consumer compatibility; those remain under Q-000005. It supersedes the earlier synthetic draft that incorrectly described an output interface. | VM7BD200-C003, VM7BD200-C004, RULE-011, RULE-012, G01, G02, G03, G04 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. The actual target cutoff-input declarations cannot be compiled or compared. |
| [Q-000026](_audit/questions/Q-000026.md) / `ce9927b5535de374b86e640e0042dff6b30415c95ff9654fcc6cd2e84b29ce40` | PROVIDED / TEST_ASSUMPTION_ONLY | VM4BD310.cbl | Phase 1: Supply VMDZ510I and confirm the exact 1500-byte mutation-output layout, all aliases and OCCURS/REDEFINES against supplied VMBD510I. → Phase 2: SIMULATED TEST ASSUMPTION: VMDZ510I retains the supplied VMBD510I layout with the top-level name changed. No physical copybook is created or claimed present; byte compatibility and build closure remain unresolved. | VM4BD310-C004, VM4BD310-C005, VM4BD310-C007, VM4BD310-C008, RULE-002, RULE-022, RULE-017, RULE-023, G01, G02, G03, G04 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. The actual target output declarations, offsets and array initialization cannot be validated. |
| [Q-000027](_audit/questions/Q-000027.md) / `70cc7265186181e71caf54b342f8683c2b6caa909ea4c90ce9714f212e9a8a13` | PROVIDED / TEST_ASSUMPTION_ONLY | VM1BD526.cbl, VM1BD567.cbl | Phase 1: Is it intended that a checkpoint with CO-ID-RS = 1 makes a same-key rerun abend, including an empty-input completed run, and who may reset or retire that row? → Phase 2: For test only, accept completed same-key reruns as a planned rejection and explicitly retain that policy difference from legacy. | VM1BD526-C013, VM1BD567-C009, RULE-009, G02, G04 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. This is a new externally visible outcome and may affect scheduler success criteria, replay policy and retention. |
| [Q-000028](_audit/questions/Q-000028.md) / `307f13151ea2c2a9072d79583318342298713bd6aea5e8beb32e3e52c282fe59` | PROVIDED / TEST_ASSUMPTION_ONLY | VM1BD526.cbl, VM1BD567.cbl | Phase 1: Are overlapping executions with the same program, phase and business date forbidden by the scheduler, or must the restart implementation acquire and validate an ownership token/lock? → Phase 2: Simulated test may enforce one active owner per key in its harness; the source still contains no ownership check. | VM1BD526-C011, VM1BD567-C010, RULE-001, G02, G04 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. Concurrent runs may process the same records, race checkpoint INSERTs or overwrite progress; supported database isolation alone is not evidence of application ownership. |
| [Q-000029](_audit/questions/Q-000029.md) / `b48442cb0950b2c6d4468c43bed2fea5fa08df45d7ef03d4d6c93f591c3acc01` | PROVIDED / TEST_ASSUMPTION_ONLY | VM1BD526.cbl, VM1BD567.cbl | Phase 1: What is the maximum cumulative successful input count per keyed run and restart, and must counters preserve all 15 checkpoint digits rather than the current 5-digit (VMDZ1526) or 7-digit (VMDZ1567) range? → Phase 2: Simulated boundary data should remain within a stated safe range for happy paths and separately exercise 100000 / 10000000 and oversized restored checkpoints as failures. | VM1BD526-C010, VM1BD526-C015, VM1BD567-C006, VM1BD567-C012, RULE-026, RULE-007, G02, G04 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. Overflow or narrowing can corrupt checkpoint position, causing replay/loss and inaccurate statistics; ARITH(EXTEND) does not enlarge these declared fields. |
| [Q-000030](_audit/questions/Q-000030.md) / `c6f45c011d6eee7ac19059057254a474ae69de9c9ffc88618ce1dee1f967156f` | PROVIDED / TEST_ASSUMPTION_ONLY | VM1BD526.cbl, VM1BD567.cbl | Phase 1: What guarantees that a resumed job uses the same file generation, exact record sequence and contents as the checkpointed run, and what must happen if that identity cannot be verified? → Phase 2: Test-only assumption: immutable, byte-identical sequential input for every retry; add a negative changed-input scenario rather than claiming the code detects it. | VM1BD526-C010, VM1BD567-C006, RULE-026, G02, G04 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. Reordered, inserted, deleted or substituted input can skip unprocessed work or repeat committed work even when the checkpoint count is numerically correct. |
| [Q-000031](_audit/questions/Q-000031.md) / `8d10600a8b7e32103b6225815811cc48e7a1c220a0578cf63e20504397450493` | PROVIDED / TEST_ASSUMPTION_ONLY | VM1BD526.cbl, VM1BD567.cbl | Phase 1: When moving these jobs from IDMS to Db2, are existing FFRECAB checkpoints converted to the new program/phase/date key, or is a verified fresh input/data boundary required before the first Db2 run? → Phase 2: Test only: start with an empty target/checkpoint state and a fresh immutable input; separately test an explicit legacy-count conversion fixture. | VM1BD526-C008, VM1BD567-C004, RULE-028, G01, G02 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. An absent new checkpoint can cause all input to be replayed even if corresponding legacy business work was committed; event INSERT replay can duplicate business events. |
| [Q-000032](_audit/questions/Q-000032.md) / `e597418af19bb6c7916aa3ba63f1483828f2e07acdb8ec894eafdfc16432a406` | PROVIDED / TEST_ASSUMPTION_ONLY | VM1BD526.cbl, VM1BD567.cbl | Phase 1: Should each checkpoint persist only the 15-digit processed count, or all 1215 bytes consisting of the count and last input record, and must the saved record be compared during resume? → Phase 2: For a clearly marked simulated test, define a count-only 15-byte protocol with immutable input; keep the observed 1215-byte initial form as an implementation inconsistency to assess. | VM1BD526-C012, VM1BD567-C008, RULE-029, G02, G04 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. Determines whether record loss is a defect or unused storage, whether 2400 bytes of duplicate record storage are justified, and whether changed-input detection is missing. |
| [Q-000033](_audit/questions/Q-000033.md) / `47dc78a07ac105da36279835f0c9593f3092b073bdd45658efa85a4c4d85f152` | PROVIDED / TEST_ASSUMPTION_ONLY | VM1BD567.cbl | Phase 1: Must a restart whose saved count exceeds the available input records fail before any checkpoint/completion update, and what diagnostic/file-status behavior is required? → Phase 2: Test-only expected policy: fail closed on short/missing input and preserve the last durable checkpoint; the present source still lacks the corresponding guard. | VM1BD567-C006, RULE-026, G02, G04 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. Read-after-EOF can cause a file exception; if runtime permits continuation, a shorter file may be recorded complete at the restored count. Actual file handler is not supplied. |
| [Q-000034](_audit/questions/Q-000034.md) / `8cfa929c0343c57db8bfa3067cfea29072cdf6bb5c98a0e1c06d89f47a0a6d4c` | PROVIDED / TEST_ASSUMPTION_ONLY | VM1BD526.cbl, VM1BD567.cbl | Phase 1: Provide the DDL/catalog identity and field mapping proving that DZ01RSTV is the intended updatable view of DZ01RSTB for FFRECAB, including uniqueness on program, phase and date, authorization/bind qualifier, triggers and constraints. → Phase 2: Test-only fixture: a simple updatable view over one restart table with a unique key (program,phase,date), no hidden commits or triggers; do not treat this as supplied production DDL. | VM1BD526-C008, VM1BD526-C009, VM1BD567-C004, VM1BD567-C005, RULE-028, RULE-016, G01, G02, G04 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. Blocks approved replacement identity, singleton cardinality, update scope and one-unit-of-work claims. |
| [Q-000035](_audit/questions/Q-000035.md) / `5c16a3d26a16b6abf33b13cc2e35196eead61d0130895a637878ec34987e4ebc` | PROVIDED / TEST_ASSUMPTION_ONLY | VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl | Phase 1: What is the exact failure/non-return contract of SQLERROR, SQLERRWS, generated IDMS status/bind members and USERABEN for the six supplied programs, including preservation of the producing diagnostics and rollback of uncommitted work? Supply the implementation members. → Phase 2: SIMULATED TEST POLICY: treat a designated unexpected SQL result as fatal after preserving its original diagnostics. Assume SQLERROR rolls back uncommitted Db2 work and does not return; assume USERABEN does not return. Expected operation-specific +100 outcomes still follow the explicit caller branch. No missing routine has actually been supplied or executed. | VM1BD526-C002, VM1BD526-C004, VM1BD526-C005, VM1BD526-C009, VM1BD526-C011, VM1BD526-C013, VM1BD526-C014, VM1BD567-C001, VM1BD567-C005, VM1BD567-C007, VM1BD567-C009, VM1BD567-C010, VM1BD567-C011, VM4BD302-C002, VM4BD302-C003, VM4BD302-C007, VM4BD302-C008, VM4BD310-C001, VM4BD310-C002, VM4BD310-C008, VM4BD420-C001, VM4BD420-C002, VM4BD420-C005, VM4BD420-C006, VM7BD200-C001, VM7BD200-C003, VM7BD200-C008, RULE-020, RULE-025, RULE-019, RULE-016, RULE-001, RULE-009, RULE-033, RULE-005, RULE-010, RULE-032, RULE-024, RULE-023, RULE-031, RULE-021, RULE-006, RULE-011, G01, G02, G03, G04 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. Without this contract, aborted work, subsequent processing, diagnostic ownership and transaction atomicity cannot be proved. A returning handler can leave the loop active or return with invalid data; missing members block precompile/compile and any claim of equivalent abort/cleanup. A returning error routine can allow invalid output or continued cursor processing; missing cleanup behavior prevents full equivalence. |
| [Q-000036](_audit/questions/Q-000036.md) / `2550df72c8a4f4e75f8f4d82e59bec0d4fd6389fc91bef8205b1019d631854f1` | PROVIDED / TEST_ASSUMPTION_ONLY | VM4BD302.cbl, VM4BD420.cbl | Phase 1: Which exact VMBEFF-VMBEVEF set ordering/member-placement rule and data-load sequence justify using NR_ID_479EVEF DESC as the legacy encounter order, including ties? → Phase 2: For simulation only, assume descending event IDs reproduce the relevant legacy encounter order; retain source-schema/load proof as unresolved. | VM4BD302-C003, VM4BD302-C005, VM4BD420-C002, VM4BD420-C003, RULE-024, RULE-025, RULE-004, G01, G03, G04 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. Without order correlation, equivalent rows can yield a different selected CI. A business answer can define intended order but cannot establish how existing IDs were loaded. |
| [Q-000037](_audit/questions/Q-000037.md) / `2a3a00d3598f0f62e41fc94eb4a3980c5ee2aa0b120f9fae841443bdfd230943` | PROVIDED / TEST_ASSUMPTION_ONLY | VM1BD526.cbl, VM1BD567.cbl, VM4BD302.cbl, VM4BD310.cbl, VM4BD420.cbl, VM7BD200.cbl | Phase 1: Supply the actual CREATE VIEW/base-table/constraint DDL connecting the mapped TB objects to the queried TV objects, including view predicates, duplicate-key rules and nullability for the business tables used by these six programs. → Phase 2: SIMULATED TEST FIXTURE: assume the relevant TV objects are unfiltered projections of the mapped TB objects with the DCLGEN declarations and required logical key uniqueness. This is a hypothetical fixture, not supplied DDL or a catalog verification. Event sequence/FK and restart-key guarantees remain separately scoped. | VM1BD567-C001, VM4BD302-C002, VM4BD302-C003, VM4BD302-C006, VM4BD310-C002, VM4BD310-C003, VM4BD420-C002, VM4BD420-C004, VM7BD200-C002, VM7BD200-C005, RULE-005, RULE-032, RULE-024, RULE-022, RULE-021, RULE-025, RULE-017, G01, G02, G03, G04 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. A filtered or nonunique view can change row coverage, singleton results or parent-child multiplicity even with correctly spelled columns. The mapping names TB objects; actual SQL and supplied DCLGENs name TV objects. View scope and uniqueness are unverified. |
| [Q-000038](_audit/questions/Q-000038.md) / `982880a1645663b8fe9f7dfc97bc3cd268bc304ac6e9ce02694f6b61873d3fcc` | PROVIDED / TEST_ASSUMPTION_ONLY | VM4BD302.cbl | Phase 1: After a failure with some 90-byte output records already written by VMDZ4302.txt, must the job discard and recreate the partial file from a stable input/database snapshot, or use another recovery and downstream publication policy? → Phase 2: SIMULATED TEST POLICY: discard partial output, recreate it from the same immutable input and stable database snapshot, and publish it only after successful completion. This is an external job policy assumed for the test; no JCL or scheduler implementation is supplied or proved. | VM4BD302-C006, RULE-022, RULE-015, G01, G02, G03, G04 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. SQL rollback does not establish rollback of already written file records. A rerun can duplicate or publish incomplete business output without an operational file contract. |
| [Q-000039](_audit/questions/Q-000039.md) / `d0f03e1ae8c2dce4b92d5cf89de68571f0794d6c4b13587daf4951bb58686435` | PROVIDED / TEST_ASSUMPTION_ONLY | VM4BD420.cbl | Phase 1: After a failure with some 50-byte output records already written by VMDZ4420.cbl, must the job discard and recreate the partial file from a stable input/database snapshot, or use another recovery and downstream publication policy? → Phase 2: SIMULATED TEST POLICY: discard partial output, recreate it from the same immutable input and stable database snapshot, and publish it only after successful completion. This is an external job policy assumed for the test; no JCL or scheduler implementation is supplied or proved. | VM4BD420-C004, RULE-022, RULE-015, G01, G02, G03, G04 | Conditional scenario choice only; verify the real business policy and implementation. Production OPEN. SQL rollback does not establish rollback of already written file records. A rerun can duplicate or publish incomplete business output without an operational file contract. |

## Case-by-case recheck

### VM1BD526-C001 — Circulation-status route

Input: `VM1BD526.cbl`. Rules: RULE-008. Source assessment retained: `SUPPORTED`.

**Test result:** CONDITIONALLY_SUPPORTED_UNEXECUTED

**Test assessment:** The exact circulation test remains flag 1 → INSERT and every other value → UPDATE. Q-000020 permits reasoning with the legacy-compatible 1200-byte input layout for this fixture; it does not supply VMDZ205I or validate the compiled input offset. No routing policy changed.

**Remaining production gap:** Actual VMDZ205I, compiler layout and business input domain remain unverified.

**Scoped scenarios / reasoning checks:**

- Use circulation 1, 0, blank and another code; require precisely the same branch.
- Repeat with the real converted copybook once supplied.

**Rechecked evidence:** `IDMS Programs/VM1BD526.cbl` physical lines 148–158; `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 215–225; `Copybook/VMBD205I.cpy` physical lines 1313–1317

Consumed answer versions: [Q-000020](_audit/questions/Q-000020.md) The exact hashes are in the answer table above and the case ledger.

### VM1BD526-C002 — LR store parent precondition

Input: `VM1BD526.cbl`. Rules: RULE-020. Source assessment retained: `SUPPORTED_WITH_GAPS`.

**Test result:** CONDITIONALLY_SUPPORTED_UNEXECUTED

**Test assessment:** Under Q-000018, one parent exists per four-part key and the child FK is enforced. Under Q-000035, parent +100 and every designated unexpected SQL outcome terminate after rollback. The source parent SELECT before INSERT fits that fixture; concurrent parent disappearance still needs a real FK/isolation test.

**Remaining production gap:** No actual parent/event DDL or SQLERROR implementation has been supplied.

**Scoped scenarios / reasoning checks:**

- No parent: no INSERT or checkpoint advancement.
- Exactly one parent: one child inserted.
- Concurrent parent deletion: designated failure preserves prior committed checkpoint.

**Rechecked evidence:** `IDMS Programs/VM1BD526.cbl` physical lines 160–195; `Schema/VMBTS07.txt` physical lines 182–189; `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 463–527

Consumed answer versions: [Q-000018](_audit/questions/Q-000018.md), [Q-000035](_audit/questions/Q-000035.md) The exact hashes are in the answer table above and the case ledger.

### VM1BD526-C003 — Event insertion defaults and relationship

Input: `VM1BD526.cbl`. Rules: RULE-018. Source assessment retained: `UNRESOLVED`.

**Test result:** CONDITIONALLY_SUPPORTED_UNEXECUTED

**Test assessment:** Q-000009 defines one invocation timestamp and the maximum timestamp as the test never-updated marker; Q-000018 permits generated event identity, parent FK and NS_IDMSKEY zero for new rows; Q-000017 chooses 28 display digits. The listed INSERT assignments match these normal fixture choices. A generated ID still does not make replay of a business INSERT idempotent.

**Remaining production gap:** Actual default/sequence/constraint behavior, loader and consumer compatibility are unresolved.

**Scoped scenarios / reasoning checks:**

- Insert under one valid parent, inspect every business/audit/relationship value.
- Retry an uncommitted batch under rollback; contrast a wrongly replayed durable batch.

**Rechecked evidence:** `IDMS Programs/VM1BD526.cbl` physical lines 160–195; `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 227–280; `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 530–574; `Dclgens/DZEVEFTV.txt` physical lines 10–47

Consumed answer versions: [Q-000009](_audit/questions/Q-000009.md), [Q-000017](_audit/questions/Q-000017.md), [Q-000018](_audit/questions/Q-000018.md) The exact hashes are in the answer table above and the case ledger.

### VM1BD526-C004 — First matching event and custom statuses

Input: `VM1BD526.cbl`. Rules: RULE-025. Source assessment retained: `UNRESOLVED`.

**Test result:** INTENTIONAL_TEST_VARIANT_UNEXECUTED

**Test assessment:** Q-000016 deliberately chooses the greatest generated event ID for this test. The target DESC/FETCH FIRST query implements that fixture choice. If legacy set-first is ID 10 while the greatest ID is 20, the two programs choose different events; that is retained as an intentional test variant, not strict equivalence. Q-000018 excludes orphans only within the hypothetical FK fixture; Q-000035 makes no-result terminal.

**Remaining production gap:** Legacy set-order definition and actual constraints/error diagnostics remain missing; production selection policy stays OPEN.

**Scoped scenarios / reasoning checks:**

- Use two qualifying events with opposite legacy encounter and generated-ID order.
- Test no parent, empty set and all children filtered; no stale selected ID may be updated.

**Rechecked evidence:** `IDMS Programs/VM1BD526.cbl` physical lines 197–212; `Schema/VMBTS07.txt` physical lines 124–136; `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 575–601

Consumed answer versions: [Q-000016](_audit/questions/Q-000016.md), [Q-000018](_audit/questions/Q-000018.md), [Q-000035](_audit/questions/Q-000035.md) The exact hashes are in the answer table above and the case ledger.

### VM1BD526-C005 — Modify current selected event

Input: `VM1BD526.cbl`. Rules: RULE-019. Source assessment retained: `SUPPORTED_WITH_GAPS`.

**Test result:** CONDITIONALLY_SUPPORTED_UNEXECUTED

**Test assessment:** The selected NR_ID is a stable update key under Q-000018 surrogate uniqueness, and Q-000016 defines which event is intended in this test. Only good-key/audit fields change. If another transaction removes that event before UPDATE, +100 must take Q-000035 fatal rollback, not permit the checkpoint to advance.

**Remaining production gap:** No real uniqueness, concurrency or error-routine execution proves the implementation contract.

**Scoped scenarios / reasoning checks:**

- Read chosen ID, update only that row.
- Delete the chosen event between SELECT and UPDATE; require terminal no-row handling.

**Rechecked evidence:** `IDMS Programs/VM1BD526.cbl` physical lines 214–227; `Schema/VMBTS07.txt` physical lines 97–102; `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 302–313; `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 602–622

Consumed answer versions: [Q-000016](_audit/questions/Q-000016.md), [Q-000018](_audit/questions/Q-000018.md), [Q-000035](_audit/questions/Q-000035.md) The exact hashes are in the answer table above and the case ledger.

### VM1BD526-C006 — Composite event key serialization

Input: `VM1BD526.cbl`. Rules: RULE-022. Source assessment retained: `CONFLICT`.

**Test result:** CONFLICT_RETAINED_TEST_ENCODING_DEFINED

**Test assessment:** Q-000017 defines 8+8+6+3+3 display digits and nonnegative components. The target group and CHAR(28) DCLGEN agree with that fixture, while the CSV CHAR(20) conflict and legacy packed representation remain unchanged. The target copies the creation-date component directly; this answer does not demonstrate a zero-date-to-minimum-date conversion in VMDZ1526.

**Remaining production gap:** The actual loader/consumer specification and the zero-date scope of the convention remain absent.

**Scoped scenarios / reasoning checks:**

- Use leading-zero client/document/operation components and a valid eight-digit creation date.
- Compare an original packed20-byte key with the intended28-digit value through a real loader/consumer fixture.
- Keep zero-date input as an unresolved policy/representation case until its exact convention is supplied.

**Rechecked evidence:** `IDMS Programs/VM1BD526.cbl` physical lines 66–72; `IDMS Programs/VM1BD526.cbl` physical lines 174–180; `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 68–73; `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 248–254; `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical lines 360–360; `Dclgens/DZEVEFTV.txt` physical lines 19–40

Consumed answer versions: [Q-000017](_audit/questions/Q-000017.md) The exact hashes are in the answer table above and the case ledger.

### VM1BD526-C007 — Stock and client identifier splitting

Input: `VM1BD526.cbl`. Rules: RULE-023. Source assessment retained: `SUPPORTED_WITH_GAPS`.

**Test result:** TEST_LAYOUT_SUPPORTS_REUSE_PROPOSAL

**Test assessment:** With Q-000020 legacy-compatible aliases, stock12+1, client1+5 and the elementary numeric sequence can be obtained from existing input fields. The extra split/sequence staging buffers become concrete removal candidates for this fixture, subject to qualified-name/type/lifetime checks. No edited or compiled COBOL was produced.

**Remaining production gap:** The real converted copybook and a compile/runtime check of any eventual refactor are still required.

**Scoped scenarios / reasoning checks:**

- Trace stock leading zeros/check digit9, client leading zeros and sequence00/99 through direct aliases.
- Verify original source remains byte-identical.

**Rechecked evidence:** `Copybook/VMBD205I.cpy` physical lines 54–55; `Copybook/VMBD205I.cpy` physical lines 624–673; `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 74–85; `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 230–273; `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical lines 309–324

Consumed answer versions: [Q-000020](_audit/questions/Q-000020.md) The exact hashes are in the answer table above and the case ledger.

### VM1BD526-C008 — Restart lookup and cutover identity

Input: `VM1BD526.cbl`. Rules: RULE-028. Source assessment retained: `UNRESOLVED`.

**Test result:** FRESH_CUTOVER_FIXTURE_ONLY

**Test assessment:** Q-000034 assumes one simple updatable restart object with a unique program/phase/date key; Q-000031 chooses a fresh checkpoint boundary. The source lookup is consistent with that fixture, but contains no legacy key/count conversion. An empty checkpoint is not evidence that all previously committed business work is absent.

**Remaining production gap:** Real cutover reconciliation, restart DDL and existing checkpoint migration remain unresolved.

**Scoped scenarios / reasoning checks:**

- Fresh checkpoint with required business parents available.
- Separate conversion fixture with a reconciled legacy committed count and the new key.
- Literal empty business tables take the missing-parent rejection path.

**Rechecked evidence:** `IDMS Programs/VM1BD526.cbl` physical lines 120–138; `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 324–355; `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 401–428; `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical lines 873–873

Consumed answer versions: [Q-000031](_audit/questions/Q-000031.md), [Q-000034](_audit/questions/Q-000034.md) The exact hashes are in the answer table above and the case ledger.

### VM1BD526-C009 — Fresh checkpoint initialization

Input: `VM1BD526.cbl`. Rules: RULE-016. Source assessment retained: `CHANGED_UNRESOLVED`.

**Test result:** TIMING_SUPPORTED_PAYLOAD_INCONSISTENCY_RETAINED

**Test assessment:** The initial restart INSERT is uncommitted until the first business/checkpoint COMMIT. Q-000034 and Q-000035 make rollback of that fresh row a fixture expectation. Q-000032, assessed in C012, separately exposes its1215-byte initialization as inconsistent with the selected15-byte protocol; timing support does not approve that encoding.

**Remaining production gap:** Actual transaction attachment, runtime rollback and payload correction are unproved.

**Scoped scenarios / reasoning checks:**

- Fail after initial INSERT and before first business action: no new durable checkpoint expected.
- Empty input: final zero-count completion considered separately under C013.

**Rechecked evidence:** `IDMS Programs/VM1BD526.cbl` physical lines 130–140; `IDMS Programs/VM1BD526.cbl` physical lines 230–237; `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 347–379; `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 449–461

Consumed answer versions: [Q-000034](_audit/questions/Q-000034.md), [Q-000035](_audit/questions/Q-000035.md) The exact hashes are in the answer table above and the case ledger.

### VM1BD526-C010 — Count-based resume and skip validation

Input: `VM1BD526.cbl`. Rules: RULE-026. Source assessment retained: `UNRESOLVED`.

**Test result:** PARTIAL_RESUME_FIXTURE_WITH_SOURCE_GAPS

**Test assessment:** Q-000030 supplies immutable ordered input for the positive fixture, Q-000029 confines normal counts to0–99999, and Q-000020 supplies a hypothetical compatible layout. Discarding N physical records then reading N+1 is the intended resume. The source still sets NOT-EOF only after restart positioning; its earlier EOF-state lifetime is not repaired by these assumptions.

**Remaining production gap:** Actual input identity enforcement, deterministic EOF initialization, converted layout and file-runtime behavior remain open.

**Scoped scenarios / reasoning checks:**

- Resume at0,1,99,100 with the same input.
- Use a shorter input: existing STOP01 must terminate under the handler contract.
- Insert a record before the saved prefix: expose skipped/replayed work because code does not verify file identity.

**Rechecked evidence:** `IDMS Programs/VM1BD526.cbl` physical lines 126–145; `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 198–213; `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 337–345

Consumed answer versions: [Q-000020](_audit/questions/Q-000020.md), [Q-000029](_audit/questions/Q-000029.md), [Q-000030](_audit/questions/Q-000030.md) The exact hashes are in the answer table above and the case ledger.

### VM1BD526-C011 — 100-record transaction boundary

Input: `VM1BD526.cbl`. Rules: RULE-001. Source assessment retained: `SUPPORTED_WITH_GAPS`.

**Test result:** CONDITIONAL_ATOMICITY_EXPECTATION_ONLY

**Test assessment:** Q-000028 restricts the fixture to one active owner; Q-000035 assumes rollback and non-return on designated failures. With the separately scoped simple-view fixture, source ordering business DML → checkpoint UPDATE → COMMIT supports a100-record normal batch model. It does not prove real atomicity or safe replay after an uncertain COMMIT.

**Remaining production gap:** Actual attachment, rollback handler, object behavior, scheduler ownership and crash injection remain unverified.

**Scoped scenarios / reasoning checks:**

- Failure before checkpoint, after checkpoint but before COMMIT, and after durable COMMIT.
- Uncertain COMMIT: reconcile the authoritative checkpoint; do not blindly repeat INSERTs.
- Overlapping owners are a negative scenario outside the positive fixture.

**Rechecked evidence:** `IDMS Programs/VM1BD526.cbl` physical lines 148–158; `IDMS Programs/VM1BD526.cbl` physical lines 230–237; `IDMS Programs/VM1BD526.cbl` physical lines 103–109; `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 215–225; `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 357–380

Consumed answer versions: [Q-000028](_audit/questions/Q-000028.md), [Q-000035](_audit/questions/Q-000035.md) The exact hashes are in the answer table above and the case ledger.

### VM1BD526-C012 — Checkpoint payload length and record buffer

Input: `VM1BD526.cbl`. Rules: RULE-029. Source assessment retained: `OBSERVED_INCONSISTENCY`.

**Test result:** CONTRADICTS_TEST_PAYLOAD_POLICY_SOURCE_UNCHANGED

**Test assessment:** Q-000032 selects a15-byte count-only protocol. The periodic/final UPDATE length15 matches it, but fresh INSERT length1215 is an observed inconsistency. KY-RESTART and WS-INPUT-KASBONS are unnecessary for recovery under this chosen test protocol; their elimination is a proposal, not an applied source fix or proof about the persistent buffer.

**Remaining production gap:** Production payload policy remains OPEN; no initializer/validation/helper source change has been made.

**Scoped scenarios / reasoning checks:**

- Compare initial1215-byte and subsequent15-byte declared payloads.
- Restore exactly15 numeric count bytes; separately require rejection of short/nonnumeric data.

**Rechecked evidence:** `IDMS Programs/VM1BD526.cbl` physical lines 230–237; `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 60–63; `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 347–368; `Dclgens/DZ01RSTV.txt` physical lines 16–31

Consumed answer versions: [Q-000032](_audit/questions/Q-000032.md) The exact hashes are in the answer table above and the case ledger.

### VM1BD526-C013 — Completion and repeated run

Input: `VM1BD526.cbl`. Rules: RULE-009. Source assessment retained: `CHANGED_UNRESOLVED`.

**Test result:** INTENTIONAL_TEST_REJECTION_UNEXECUTED

**Test assessment:** Q-000027 explicitly accepts same-key completed reruns as a planned rejection, and Q-000035 assumes USERABEN does not return. The source complete1 branch fits that test policy, including an empty run subsequently retried. This is still a change from the legacy existence-only behavior.

**Remaining production gap:** Actual scheduler handling, retention/reset authority and non-return behavior remain unverified.

**Scoped scenarios / reasoning checks:**

- Run to EOF, then attempt the identical key.
- Complete an empty input then retry; no business DML should run.

**Rechecked evidence:** `IDMS Programs/VM1BD526.cbl` physical lines 103–109; `IDMS Programs/VM1BD526.cbl` physical lines 120–145; `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 175–183; `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 337–345; `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 357–379

Consumed answer versions: [Q-000027](_audit/questions/Q-000027.md), [Q-000035](_audit/questions/Q-000035.md) The exact hashes are in the answer table above and the case ledger.

### VM1BD526-C014 — Operation-specific SQL and error state

Input: `VM1BD526.cbl`. Rules: RULE-033. Source assessment retained: `UNRESOLVED`.

**Test result:** ERROR_CONTRACT_ASSUMED_NOT_IMPLEMENTED_EVIDENCE

**Test assessment:** Q-000035 allows +100 only where explicitly expected: missing restart row creates one; missing parent/event/update remains fatal. It gives a conditional reason why caller code cannot continue after an error routine. Original SQL diagnostics must survive handler SQL; missing handler code, unexamined SQLWARN on SQLCODE0 and ambiguous-COMMIT behavior remain visible.

**Remaining production gap:** No error routine, warning policy or runtime result was supplied.

**Scoped scenarios / reasoning checks:**

- Exercise0, expected100 and unexpected100 separately for each producing statement.
- Exercise negative and other positive SQLCODE; preserve first failure through rollback/logging.
- Inspect SQLCODE0 with warning indicators independently.

**Rechecked evidence:** `IDMS Programs/VM1BD526.cbl` physical lines 193–195; `IDMS Programs/VM1BD526.cbl` physical lines 206–227; `IDMS Programs/VM1BD526.cbl` physical lines 247–254; `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 331–335; `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 373–379; `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 401–627

Consumed answer versions: [Q-000035](_audit/questions/Q-000035.md) The exact hashes are in the answer table above and the case ledger.

### VM1BD526-C015 — Cumulative and per-invocation counters

Input: `VM1BD526.cbl`. Rules: RULE-007. Source assessment retained: `UNRESOLVED`.

**Test result:** CAPACITY_GAP_RETAINED

**Test assessment:** Q-000029 bounds the positive fixture at99999 and requires100000/oversized restored checkpoints as failure scenarios. It does not enlarge S9(5) counters or add a range guard. Reusing the existing15-digit NB-READ for the cumulative role could avoid the duplicate narrow total if skip reads leave its fixed extent unchanged; batch TELLER retains a separate lifetime.

**Remaining production gap:** Actual maximum volume, failure policy and any wider/reused counter implementation require validation.

**Scoped scenarios / reasoning checks:**

- Happy range0–99999.
- At100000 or a larger restored count, require safe rejection or a future validated wider design; current code supplies no explicit guard.

**Rechecked evidence:** `IDMS Programs/VM1BD526.cbl` physical lines 59–64; `IDMS Programs/VM1BD526.cbl` physical lines 126–157; `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 54–64; `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 180–182; `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 320–365; `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 568–568; `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 615–615

Consumed answer versions: [Q-000029](_audit/questions/Q-000029.md) The exact hashes are in the answer table above and the case ledger.

### VM1BD526-C016 — Run-scoped audit timestamp

Input: `VM1BD526.cbl`. Rules: RULE-030. Source assessment retained: `CHANGED_UNRESOLVED`.

**Test result:** TEST_AUDIT_INTENT_DEFINED

**Test assessment:** Q-000009 chooses a run-scoped timestamp. The source captures once per invocation; a positive fixture can treat that invocation as its run, with inserted TS_UPDATE using the maximum marker and modifications using the captured time. A restarted invocation captures a new timestamp. The answer does not settle whether a production logical run must retain one timestamp across restarts.

**Remaining production gap:** Production audit semantics and actual downstream interpretation are still OPEN.

**Scoped scenarios / reasoning checks:**

- Several records in one invocation share its captured timestamp.
- Resume in a later invocation and distinguish new invocation time from an original job-wide time.

**Rechecked evidence:** `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 185–188; `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 274–279; `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 309–312; `DB2 Manual converted Programs/VMDZ1526.txt` physical lines 382–393

Consumed answer versions: [Q-000009](_audit/questions/Q-000009.md) The exact hashes are in the answer table above and the case ledger.

### VM1BD567-C001 — Six-key form lookup and date-only business update

Input: `VM1BD567.cbl`. Rules: RULE-005. Source assessment retained: `SUPPORTED_WITH_GAPS`.

**Test result:** CONDITIONALLY_SUPPORTED_UNEXECUTED

**Test assessment:** Q-000037 supplies unique six-key rows and an unfiltered projection for the fixture; Q-000020 supplies hypothetical compatible input aliases; Q-000035 makes missing-row UPDATE fatal. Under those conditions a searched UPDATE preserves the listed date-only business assignment without a redundant full-record SELECT. Statement success is still not an observed row-count check.

**Remaining production gap:** Actual key constraints, converted copybook and runtime error implementation remain absent.

**Scoped scenarios / reasoning checks:**

- One exact six-key row: change only accounting date and intended audit fields.
- No row: +100 rejected; duplicate-key data is outside the uniqueness fixture and must be tested against actual DDL.

**Rechecked evidence:** `IDMS Programs/VM1BD567.cbl` physical lines 147–158; `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 192–228; `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 426–451; `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical lines 79–91

Consumed answer versions: [Q-000020](_audit/questions/Q-000020.md), [Q-000035](_audit/questions/Q-000035.md), [Q-000037](_audit/questions/Q-000037.md) The exact hashes are in the answer table above and the case ledger.

### VM1BD567-C002 — Creation-date key sentinel

Input: `VM1BD567.cbl`. Rules: RULE-013. Source assessment retained: `CHANGED_UNRESOLVED`.

**Test result:** INTENTIONAL_TEST_SENTINEL_UNEXECUTED

**Test assessment:** Q-000010 selects0001-01-01 for a missing creation date. The visible zero/space branch chooses that key for the test, which can target a different row than the delivered legacy CALC path. A malformed nonzero date is not normalized or explicitly validated by that branch; the answer does not certify its runtime conversion.

**Remaining production gap:** Actual loader/business missing-date policy, input category behavior and invalid-date error handling remain unverified.

**Scoped scenarios / reasoning checks:**

- Zero and blank creation dates select the minimum-date fixture row.
- A valid leap date keeps its own key.
- Malformed nonzero dates must not be silently redirected to the minimum-date row.

**Rechecked evidence:** `IDMS Programs/VM1BD567.cbl` physical lines 149–158; `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 201–219; `Dclgens/DZBFARTV.txt` physical lines 13–18

Consumed answer versions: [Q-000010](_audit/questions/Q-000010.md) The exact hashes are in the answer table above and the case ledger.

### VM1BD567-C003 — Run-scoped audit timestamp

Input: `VM1BD567.cbl`. Rules: RULE-030. Source assessment retained: `CHANGED_UNRESOLVED`.

**Test result:** TEST_AUDIT_INTENT_DEFINED

**Test assessment:** Q-000009 chooses a run-scoped timestamp. The source captures once per invocation and reuses it for UPDATEs; this supports a fixture whose run is one invocation. A resumed invocation captures a new value, so a logical-run timestamp spanning restarts remains undefined. The maximum marker is a526 insertion convention and is not newly imposed on this567 UPDATE.

**Remaining production gap:** Production audit requirements and downstream reconciliation remain open.

**Scoped scenarios / reasoning checks:**

- Two updates within one invocation share the captured value.
- A resumed invocation can use a later timestamp without claiming a preserved original job timestamp.

**Rechecked evidence:** `IDMS Programs/VM1BD567.cbl` physical lines 156–158; `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 162–162; `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 222–226; `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 254–266

Consumed answer versions: [Q-000009](_audit/questions/Q-000009.md) The exact hashes are in the answer table above and the case ledger.

### VM1BD567-C004 — Restart key and table/view identity

Input: `VM1BD567.cbl`. Rules: RULE-028. Source assessment retained: `UNRESOLVED`.

**Test result:** FRESH_CHECKPOINT_FIXTURE_ONLY

**Test assessment:** Q-000031 chooses a fresh checkpoint/cutover fixture and Q-000034 a unique simple restart view. The source builds the new VMDZ1567/phase1/date key and does not translate FFRECAB. Required form rows must exist for the successful business UPDATE; literally empty business tables produce+100. Any legacy-count conversion must account for the demonstrated broken legacy counter rather than trust it blindly.

**Remaining production gap:** Actual cutover/data reconciliation, source count trustworthiness and restart DDL remain unresolved.

**Scoped scenarios / reasoning checks:**

- Fresh checkpoint with valid form rows already represented in the fixture.
- Explicit independently reconciled legacy-count conversion; do not copy a known incorrect zero position.

**Rechecked evidence:** `IDMS Programs/VM1BD567.cbl` physical lines 111–129; `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 269–280; `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 356–387; `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical lines 873–873

Consumed answer versions: [Q-000031](_audit/questions/Q-000031.md), [Q-000034](_audit/questions/Q-000034.md) The exact hashes are in the answer table above and the case ledger.

### VM1BD567-C005 — Fresh restart-row creation

Input: `VM1BD567.cbl`. Rules: RULE-016. Source assessment retained: `SUPPORTED_WITH_GAPS`.

**Test result:** CONDITIONALLY_SUPPORTED_TIMING_ONLY

**Test assessment:** Under Q-000034/Q-000035 the new incomplete restart row belongs to the same transaction as the first work batch, and failure before COMMIT rolls it back. That timing matches source order. Its1215-byte initialization is separately inconsistent with Q-000032 count-only policy and remains C008.

**Remaining production gap:** Actual DDL, attachment and rollback are unverified; initial payload still needs correction for the chosen test policy.

**Scoped scenarios / reasoning checks:**

- Failure just after restart INSERT leaves no durable new row under the assumed rollback contract.
- Duplicate-key race is a designated failure, not an invented automatic retry.

**Rechecked evidence:** `IDMS Programs/VM1BD567.cbl` physical lines 121–129; `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 306–318; `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 410–424

Consumed answer versions: [Q-000034](_audit/questions/Q-000034.md), [Q-000035](_audit/questions/Q-000035.md) The exact hashes are in the answer table above and the case ledger.

### VM1BD567-C006 — Resume skip and short input

Input: `VM1BD567.cbl`. Rules: RULE-026. Source assessment retained: `LIKELY_DEFECT`.

**Test result:** CONTRADICTS_FAIL_CLOSED_TEST_POLICY

**Test assessment:** Q-000033 requires failure before checkpoint/completion change when the input is shorter than the saved count. The current counted skip ignores EOF and the following READ is unconditional. Q-000030 immutability makes valid resumes understandable but does not repair this negative case; Q-000029 bounds do not supply an EOF guard.

**Remaining production gap:** The source lacks the explicit fail-closed branch; actual file runtime/diagnostics and production policy remain unverified.

**Scoped scenarios / reasoning checks:**

- Saved100 with only99 available records must fail before any checkpoint update.
- Saved100 with exactly100 available records reaches EOF on the one intended prefetch and may finish under the completion policy.
- Changed prefix remains a separate undetected-input scenario.

**Rechecked evidence:** `IDMS Programs/VM1BD567.cbl` physical lines 117–134; `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 178–184; `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 238–250; `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 283–303

Consumed answer versions: [Q-000029](_audit/questions/Q-000029.md), [Q-000030](_audit/questions/Q-000030.md), [Q-000033](_audit/questions/Q-000033.md) The exact hashes are in the answer table above and the case ledger.

### VM1BD567-C007 — Legacy counter and repaired/changed commit cadence

Input: `VM1BD567.cbl`. Rules: RULE-010. Source assessment retained: `LEGACY_DEFECT_AND_CHANGED_IMPLEMENTATION`.

**Test result:** INTENDED_REPAIR_FOR_TEST_NOT_EQUIVALENCE

**Test assessment:** Q-000021 defines successful-record count and100-record atomic batches as the test intent. Under Q-000035 non-returning failures, target increments after successful READ, performs UPDATE, then commits at the threshold; that is a candidate repair. The legacy fresh-run count0 and resumed N=100→201 counterexample are retained, so equality with the delivered original is not claimed.

**Remaining production gap:** Real business authorization, fault injection and mainframe count/commit behavior remain open.

**Scoped scenarios / reasoning checks:**

- Fresh99,100,101 rows: target expected boundary after100th successful update.
- Legacy fresh101 retains direct-source zero-count discrepancy.
- ResumeN=100: target resets batch; legacy varying counter creates a different result.

**Rechecked evidence:** `IDMS Programs/VM1BD567.cbl` physical lines 57–57; `IDMS Programs/VM1BD567.cbl` physical lines 117–141; `IDMS Programs/VM1BD567.cbl` physical lines 147–176; `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 230–250; `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 283–283; `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 328–349

Consumed answer versions: [Q-000021](_audit/questions/Q-000021.md), [Q-000035](_audit/questions/Q-000035.md) The exact hashes are in the answer table above and the case ledger.

### VM1BD567-C008 — Checkpoint payload length

Input: `VM1BD567.cbl`. Rules: RULE-029. Source assessment retained: `OBSERVED_INCONSISTENCY`.

**Test result:** CONTRADICTS_TEST_PAYLOAD_POLICY_SOURCE_UNCHANGED

**Test assessment:** Q-000032 selects15 count bytes. The target periodic/final length15 follows that choice; initial length1215 does not. The last-good-record snapshot survives EOF, but no recovery path uses it under count-only semantics, making both1200-byte areas removal candidates solely for this test policy.

**Remaining production gap:** The protocol/validation/refactor is not implemented or production-approved; full-record recovery was not established.

**Scoped scenarios / reasoning checks:**

- Compare initial and updated VARCHAR lengths.
- Restore valid15-digit count and reject short/nonnumeric input before skip in a future implementation check.

**Rechecked evidence:** `IDMS Programs/VM1BD567.cbl` physical lines 138–141; `IDMS Programs/VM1BD567.cbl` physical lines 161–166; `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 54–61; `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 306–338

Consumed answer versions: [Q-000032](_audit/questions/Q-000032.md) The exact hashes are in the answer table above and the case ledger.

### VM1BD567-C009 — Completion and later rerun

Input: `VM1BD567.cbl`. Rules: RULE-009. Source assessment retained: `CHANGED_UNRESOLVED`.

**Test result:** INTENTIONAL_TEST_REJECTION_UNEXECUTED

**Test assessment:** Q-000027 accepts the completed-row abend as a planned test rejection; Q-000035 supplies non-return as an assumption. Source chooses that branch before new business work. Legacy did not expose an equivalent completion flag, and the answer does not define actual reset/retention authority.

**Remaining production gap:** Actual scheduler/reset/retention handling and runtime abort implementation remain open.

**Scoped scenarios / reasoning checks:**

- Complete normal or empty input, then rerun the identical key.
- Confirm no new form UPDATE under the assumed non-returning abort contract.

**Rechecked evidence:** `IDMS Programs/VM1BD567.cbl` physical lines 138–144; `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 184–189; `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 287–303; `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 325–350

Consumed answer versions: [Q-000027](_audit/questions/Q-000027.md), [Q-000035](_audit/questions/Q-000035.md) The exact hashes are in the answer table above and the case ledger.

### VM1BD567-C010 — Business/checkpoint commit and crash recovery

Input: `VM1BD567.cbl`. Rules: RULE-001. Source assessment retained: `SUPPORTED_WITH_GAPS`.

**Test result:** CONDITIONAL_ATOMICITY_EXPECTATION_ONLY

**Test assessment:** Q-000021 chooses the100-successful-record unit; Q-000028 gives one active fixture owner; Q-000035 assumes rollback/non-return. Source business UPDATE → checkpoint UPDATE → COMMIT is consistent with that model. Repeating the same date assignment may be idempotent in value, but audit/trigger effects and uncertain COMMIT still prevent a general exactly-once claim.

**Remaining production gap:** Actual transaction attachment, triggers, ownership and error code need controlled execution.

**Scoped scenarios / reasoning checks:**

- Fail before and after checkpoint UPDATE but before COMMIT.
- After durable COMMIT, resume the unchanged input atN+1.
- Treat uncertain COMMIT and an overlapping owner as unresolved negative cases.

**Rechecked evidence:** `IDMS Programs/VM1BD567.cbl` physical lines 138–176; `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 228–250; `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 325–350; `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 184–189

Consumed answer versions: [Q-000021](_audit/questions/Q-000021.md), [Q-000028](_audit/questions/Q-000028.md), [Q-000035](_audit/questions/Q-000035.md) The exact hashes are in the answer table above and the case ledger.

### VM1BD567-C011 — Statement-specific status and cleanup

Input: `VM1BD567.cbl`. Rules: RULE-033. Source assessment retained: `UNRESOLVED`.

**Test result:** ERROR_CONTRACT_ASSUMED_NOT_PROVED

**Test assessment:** Q-000035 preserves statement-owned failure diagnostics and prohibits continuation after designated failures. Restart SELECT+100 remains expected; business/restart UPDATE+100 remains fatal. Missing SQLERROR implementation, SQLWARN0 treatment and potentially stale SQL-LOCATION1100 remain unresolved.

**Remaining production gap:** No handler or actual diagnostic/fault-injection result has been supplied.

**Scoped scenarios / reasoning checks:**

- Separate restart absence from missing business row.
- Failure in checkpoint UPDATE or COMMIT must report that producing operation, not merely the preceding business location.

**Rechecked evidence:** `IDMS Programs/VM1BD567.cbl` physical lines 38–40; `IDMS Programs/VM1BD567.cbl` physical lines 155–158; `IDMS Programs/VM1BD567.cbl` physical lines 179–180; `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 276–280; `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 343–450

Consumed answer versions: [Q-000035](_audit/questions/Q-000035.md) The exact hashes are in the answer table above and the case ledger.

### VM1BD567-C012 — Counter range and reporting

Input: `VM1BD567.cbl`. Rules: RULE-007. Source assessment retained: `UNRESOLVED`.

**Test result:** CAPACITY_GAP_RETAINED

**Test assessment:** Q-000029 bounds happy paths at9999999 and makes10000000/oversized restored counts negative scenarios. PIC9(7) active total still narrows the15-digit saved count, with no explicit range guard. A single15-digit cumulative NB-READ plus the separate resettable batch role is a reuse proposal, not an applied fix; successful-statement diagnostics remain a different count.

**Remaining production gap:** Actual maximum volume, overflow outcome and any counter-refactor verification remain unresolved.

**Scoped scenarios / reasoning checks:**

- Normal count0–9999999.
- 10000000 and oversized restored payload must not be silently accepted by a future guarded design.
- Verify resumed diagnostic update totals are invocation-scoped rather than reconstructed full-run counts.

**Rechecked evidence:** `IDMS Programs/VM1BD567.cbl` physical lines 57–57; `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 54–61; `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 186–187; `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 245–250; `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 297–300; `DB2 Manual converted Programs/VMDZ1567.cbl` physical lines 444–450

Consumed answer versions: [Q-000029](_audit/questions/Q-000029.md) The exact hashes are in the answer table above and the case ledger.

### VM4BD302-C001 — Parameter date and issue lookup service

Input: `VM4BD302.cbl`. Rules: RULE-006. Source assessment retained: `PARTIAL`.

**Test assessment:** The fixture allows the returned issue key/currency to feed the same QUERY001/selector2 flow. Year 79 still maps to 2079 and year 80 to 1980. The target owner-date formatting is consistent with the assumed EUR fixture; it does not add service-result validation.

**Remaining production gap:** Failed or short service responses remain outside the fixture. The executable, real actual-length/return-code policy and deployed DATE format are still absent.

**Scoped scenarios / reasoning checks:**

- A successful complete response provides the owner key and output currency.
- A short or failed response cannot be labelled owner-not-found merely because the later SELECT returns100.
- Year 79/80 retains the original century boundary.

**Rechecked evidence:** `IDMS Programs/VM4BD302.cbl` physical lines 164–177; `IDMS Programs/VM4BD302.cbl` physical lines 321–337; `DB2 Manual converted Programs/VMDZ4302.txt` physical lines 266–279; `DB2 Manual converted Programs/VMDZ4302.txt` physical lines 316–330; `DB2 Manual converted Programs/VMDZ4302.txt` physical lines 451–467

Consumed answer versions: [Q-000003](_audit/questions/Q-000003.md), [Q-000014](_audit/questions/Q-000014.md) The exact hashes are in the answer table above and the case ledger.

### VM4BD302-C002 — Owner lookup and missing owner

Input: `VM4BD302.cbl`. Rules: RULE-032. Source assessment retained: `CHANGED_ERROR_POLICY_UNRESOLVED`.

**Test assessment:** The zero-row fixture follows SELECT+100 display/skip; the one-row fixture starts the parent cursor. A duplicate-result/error fixture is fatal under Q-000035, whereas the visible legacy CALC branch skips on any non0000. This remains a changed error policy, even when the test accepts the target policy.

**Remaining production gap:** Actual uniqueness/view filters, SQLERROR implementation, and intended treatment of non-absence legacy errors remain unproved. Synthetic fatal intent cannot make the two error branches identical.

**Scoped scenarios / reasoning checks:**

- Zero owner rows: display key and skip the issue.
- One owner: process its securities.
- Multiple owner rows or SQL failure: require fatal handling; no source runtime was executed.

**Rechecked evidence:** `IDMS Programs/VM4BD302.cbl` physical lines 237–254; `DB2 Manual converted Programs/VMDZ4302.txt` physical lines 488–523; `Dclgens/DZWCEFTV.txt` physical lines 10–25

Consumed answer versions: [Q-000003](_audit/questions/Q-000003.md), [Q-000035](_audit/questions/Q-000035.md), [Q-000037](_audit/questions/Q-000037.md) The exact hashes are in the answer table above and the case ledger.

### VM4BD302-C003 — Two-level owner/member navigation

Input: `VM4BD302.cbl`. Rules: RULE-024. Source assessment retained: `PARTIAL`.

**Test assessment:** With those explicit fixture conditions, the three-key owner cursor and four-key event cursor enumerate the intended nested scopes. Parent data stays in DCLDZBEFFTV while child fetches populate DCLDZEVEFTV, so no new saved-parent-key group is required. Independent EOF flags remain needed by this paragraph structure.

**Remaining production gap:** The actual set-placement/load order, relation constraints and error/cleanup body are missing. The assumption does not establish parent output order or a consistent database snapshot.

**Scoped scenarios / reasoning checks:**

- No securities: parent FETCH100 ends without child work.
- A security with zero events leaves SW-168 zero and emits nothing.
- A child error must not fall through to optional output or use stale hosts.

**Rechecked evidence:** `IDMS Programs/VM4BD302.cbl` physical lines 251–277; `IDMS Programs/VM4BD302.cbl` physical lines 319–319; `DB2 Manual converted Programs/VMDZ4302.txt` physical lines 215–246; `DB2 Manual converted Programs/VMDZ4302.txt` physical lines 338–376; `DB2 Manual converted Programs/VMDZ4302.txt` physical lines 527–666

Consumed answer versions: [Q-000035](_audit/questions/Q-000035.md), [Q-000036](_audit/questions/Q-000036.md), [Q-000037](_audit/questions/Q-000037.md) The exact hashes are in the answer table above and the case ledger.

### VM4BD302-C004 — Redemption window

Input: `VM4BD302.cbl`. Rules: RULE-027. Source assessment retained: `PRESERVED_CONDITIONAL_ON_TYPES`.

**Test assessment:** The four-part eligibility conjunction remains event 0168, operation 91, date<cutoff, and date>=maturity-minus-one-month. The lower bound is inclusive and the cutoff is exclusive. March 31 deliberately produces an integer February 31 threshold in this rehearsal; no calendar correction is silently introduced.

**Remaining production gap:** Real calendar business policy, migrated date/key encodings and operational data remain unresolved. This is conditional preservation of the supplied branches, not proof that the calendar policy is desirable.

**Scoped scenarios / reasoning checks:**

- Lower-bound equality is eligible when all other predicates hold.
- Cutoff equality is excluded.
- A March 31 maturity versus February 28 event distinguishes retained integer subtraction from month-end clamping.

**Rechecked evidence:** `IDMS Programs/VM4BD302.cbl` physical lines 282–298; `DB2 Manual converted Programs/VMDZ4302.txt` physical lines 381–419

Consumed answer versions: [Q-000001](_audit/questions/Q-000001.md), [Q-000014](_audit/questions/Q-000014.md), [Q-000017](_audit/questions/Q-000017.md) The exact hashes are in the answer table above and the case ledger.

### VM4BD302-C005 — Creation and transfer CI selection

Input: `VM4BD302.cbl`. Rules: RULE-025. Source assessment retained: `PARTIAL`.

**Test assessment:** The first earlier 0060 sets CI; later 0060 events do not replace it. A 0092 replaces only when its embedded transfer date is strictly larger than the marker and below cutoff, so an equal-date tie keeps the first maximum. Q-000036 permits reasoning under one chosen order; reversing that order remains a counterexample with different CI.

**Remaining production gap:** Actual IDMS set order and load correlation are still missing. No answer permits copying420’s last-creation rule into302. The 20/28-byte declaration conflict remains in the source artifacts.

**Scoped scenarios / reasoning checks:**

- Two qualifying 0060 rows with different CIs select the first encountered.
- Equal maximum0092 transfer dates retain the first candidate.
- A redemption with no usable0060/0092 can retain CI 000000.

**Rechecked evidence:** `IDMS Programs/VM4BD302.cbl` physical lines 300–315; `DB2 Manual converted Programs/VMDZ4302.txt` physical lines 244–244; `DB2 Manual converted Programs/VMDZ4302.txt` physical lines 421–447

Consumed answer versions: [Q-000014](_audit/questions/Q-000014.md), [Q-000017](_audit/questions/Q-000017.md), [Q-000036](_audit/questions/Q-000036.md) The exact hashes are in the answer table above and the case ledger.

### VM4BD302-C006 — Mapped values, composite event key and output

Input: `VM4BD302.cbl`. Rules: RULE-022. Source assessment retained: `CONFLICT`.

**Test assessment:** The bounded fixture permits 12+1 stock reconstruction and six-digit CI output while preserving the 90-byte layout. CHAR(20) in the mapping still conflicts with CHAR(28) in DCLGEN. Q-000038 adds an external job expectation: already written records are discarded and rebuilt from the same input/database snapshot, then published only on success.

**Remaining production gap:** No loader specification, real domain/range data, byte-image reconciliation, file-disposition/JCL or publication implementation was supplied. Db2 rollback does not remove sequential records already written.

**Scoped scenarios / reasoning checks:**

- In-range decimal stock/CI and amount produce the intended declared fields in source reasoning.
- A 13-integer-digit amount beyond the 12-integer-digit destination lies outside the happy fixture and remains a range case.
- Failure after two writes requires discarding the partial file; no actual recovery run occurred.

**Rechecked evidence:** `IDMS Programs/VM4BD302.cbl` physical lines 105–123; `IDMS Programs/VM4BD302.cbl` physical lines 269–275; `DB2 Manual converted Programs/VMDZ4302.txt` physical lines 87–110; `DB2 Manual converted Programs/VMDZ4302.txt` physical lines 364–375; `Mapping/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` physical lines 360–360; `Dclgens/DZEVEFTV.txt` physical lines 19–43

Consumed answer versions: [Q-000002](_audit/questions/Q-000002.md), [Q-000017](_audit/questions/Q-000017.md), [Q-000037](_audit/questions/Q-000037.md), [Q-000038](_audit/questions/Q-000038.md) The exact hashes are in the answer table above and the case ledger.

### VM4BD302-C007 — Minimal working storage

Input: `VM4BD302.cbl`. Rules: RULE-023. Source assessment retained: `PARTIAL`.

**Test assessment:** Directly filling existing LAATSTE-CI slices removes the six-byte CI helper without losing a simultaneous value. A verified12+1 view of the existing output stock receiver can remove its 13-byte assembly helper under the assumed numeric domain. The two unused date groups and duplicate event-date scalar remain removal candidates. Parent and child EOF roles remain distinct.

**Remaining production gap:** The proposed receiver overlay/refmod and any inline FETCH restructuring require real COBOL/precompile regression. DATE format, handler implementation and actual data domains are not supplied by these assumptions.

**Scoped scenarios / reasoning checks:**

- Two consecutive child events overwrite the same six-byte CI receiver only at the original selection point.
- Parent keys remain live during child SQL and must not be overlaid by helper reuse.
- Removing the duplicate event date is valid only until its staging group is overwritten.

**Rechecked evidence:** `DB2 Manual converted Programs/VMDZ4302.txt` physical lines 75–201; `DB2 Manual converted Programs/VMDZ4302.txt` physical lines 369–398; `DB2 Manual converted Programs/VMDZ4302.txt` physical lines 428–444

Consumed answer versions: [Q-000002](_audit/questions/Q-000002.md), [Q-000017](_audit/questions/Q-000017.md), [Q-000035](_audit/questions/Q-000035.md) The exact hashes are in the answer table above and the case ledger.

### VM4BD302-C008 — Statement-owned SQL outcome

Input: `VM4BD302.cbl`. Rules: RULE-033. Source assessment retained: `PARTIAL`.

**Test assessment:** Under Q-000035, OPEN/FETCH/CLOSE OTHER branches stop rather than re-entering a loop with unchanged EOF flags. SELECT/FETCH+100 still take their explicit missing/EOF paths. This establishes the rehearsal’s intended failure outcome, while the source still lacks the included handler and service-result checks.

**Remaining production gap:** No SQLERROR/SQLERRWS/USERABEN executable was supplied. Diagnostics, rollback, cleanup, positive-warning policy and file publication remain operationally unverified; broad legacy non0000 skip behavior is not equivalent to fatal target errors.

**Scoped scenarios / reasoning checks:**

- FETCH100 must not process stale data.
- Unexpected child FETCH error must not reach the later eligible WRITE.
- A failing CLOSE must preserve its own producing diagnostics before any subsequent SQL.

**Rechecked evidence:** `IDMS Programs/VM4BD302.cbl` physical lines 179–215; `IDMS Programs/VM4BD302.cbl` physical lines 245–268; `DB2 Manual converted Programs/VMDZ4302.txt` physical lines 502–666

Consumed answer versions: [Q-000003](_audit/questions/Q-000003.md), [Q-000035](_audit/questions/Q-000035.md) The exact hashes are in the answer table above and the case ledger.

### VM4BD302-C009 — CALL interface tables and overlays

Input: `VM4BD302.cbl`. Rules: RULE-017. Source assessment retained: `PRESERVED_VISIBLE_INTERFACE`.

**Test assessment:** The 32000-byte communication area and fixed OCCURS/REDEFINES interfaces remain unchanged; no SQL rowset is implied. A successful fixture explains valid issue-key/currency use, but the caller still has no response-length or return-status gate. This does not justify deleting unused-looking table tails or replacing the interface with DCLGEN.

**Remaining production gap:** The service executable and real maximum/short-response contract remain absent. No complete byte-buffer exchange or copybook compilation was executed.

**Scoped scenarios / reasoning checks:**

- Selector2 activates the intended internal-number key overlay.
- A successful 2610-byte response is a fixture condition, not a supplied runtime result.
- Maximum occurrence and stale-tail behavior still require the real service contract.

**Rechecked evidence:** `IDMS Programs/VM4BD302.cbl` physical lines 73–79; `IDMS Programs/VM4BD302.cbl` physical lines 323–337; `DB2 Manual converted Programs/VMDZ4302.txt` physical lines 51–58; `DB2 Manual converted Programs/VMDZ4302.txt` physical lines 453–467; `Copybook/VM9BC50I.cpy` physical lines 19–58; `Copybook/VM9BC50O.cpy` physical lines 99–348

Consumed answer versions: [Q-000003](_audit/questions/Q-000003.md) The exact hashes are in the answer table above and the case ledger.

### VM4BD310-C001 — Runtime services and normal read-only effect

Input: `VM4BD310.cbl`. Rules: RULE-031. Source assessment retained: `UNRESOLVED`.

**Test assessment:** CONDITIONAL_FATAL_EXIT_ONLY

**Revised finding:** With that fixture, a designated lookup failure cannot fall through into output processing. It does not establish Db2 attachment, effective IDMS generated services or real cleanup. The visible program remains retrieval-only with external file writes.

**Remaining production gap:** Missing runtime members, precompile/bind settings and actual termination/cleanup behavior remain unresolved under Q-000012 and Q-000035.

**Validation performed:** Static source, schema, declaration and exact-answer scope recheck. No COBOL compilation, SQL execution or real failure/restart test.

**Scoped scenarios / reasoning checks:**

- Inject a parent SQL error before any output and another after earlier file writes. The hypothetical handler must stop the current record; earlier file records still require the separate replay policy.

**Rechecked evidence:** `IDMS Programs/VM4BD310.cbl` physical lines 137–163; `DB2 Manual converted Programs/VMDZ4310.txt` physical lines 185–205

Consumed answer versions: [Q-000035](_audit/questions/Q-000035.md) The exact hashes are in the answer table above and the case ledger.

### VM4BD310-C002 — LRF parent and child outcomes

Input: `VM4BD310.cbl`. Rules: RULE-021. Source assessment retained: `PARTIALLY_PRESERVED`.

**Test assessment:** CONTRADICTS_TEST_DIAGNOSTIC_POLICY

**Revised finding:** The parent SELECT +100 is distinct from event SELECT +100. The latter still merges empty child set with filtered-out children, so fatal termination can match the fixture while business diagnosis does not. No synthetic answer adds the absent existence discrimination.

**Remaining production gap:** Actual view/schema constraints and handlers are missing. A separate child-existence test or a real approved merged-outcome policy would be needed; the present test policy expressly rejects merging.

**Validation performed:** Static source, schema, declaration and exact-answer scope recheck. No COBOL compilation, SQL execution or real failure/restart test.

**Scoped scenarios / reasoning checks:**

- Compare three fixtures: no parent; parent with zero children; parent with children whose event code is not 0092. The current target exposes only two no-data operation paths.

**Rechecked evidence:** `IDMS Programs/VM4BD310.cbl` physical lines 181–208; `Schema/VMBTS07.txt` physical lines 124–136; `DB2 Manual converted Programs/VMDZ4310.txt` physical lines 217–347

Consumed answer versions: [Q-000022](_audit/questions/Q-000022.md), [Q-000035](_audit/questions/Q-000035.md), [Q-000037](_audit/questions/Q-000037.md) The exact hashes are in the answer table above and the case ledger.

### VM4BD310-C003 — First matching event order

Input: `VM4BD310.cbl`. Rules: RULE-025. Source assessment retained: `UNRESOLVED`.

**Test assessment:** ORDER_EQUIVALENCE_STILL_UNRESOLVED

**Revised finding:** DESC/FETCH FIRST continues to select greatest NR_ID, not an evidenced legacy encounter position. A one-match fixture is conditionally equivalent; two matches in reverse encounter/ID order produce a counterexample. The unrelated 526 greatest-ID test policy is not applied here.

**Remaining production gap:** Need base set order, migrated ID/order evidence and the actual business selection contract. Do not mark all multi-event cases preserved.

**Validation performed:** Static source, schema, declaration and exact-answer scope recheck. No COBOL compilation, SQL execution or real failure/restart test.

**Scoped scenarios / reasoning checks:**

- Take legacy encounter order [event A with ID 10, event B with ID 20], both 0092 and different form keys. Legacy selects A while target selects B; actual production feasibility requires the missing order evidence.

**Rechecked evidence:** `IDMS Programs/VM4BD310.cbl` physical lines 200–208; `DB2 Manual converted Programs/VMDZ4310.txt` physical lines 301–321; `Schema/VMBTS07.txt` physical lines 133–135

Consumed answer versions: [Q-000023](_audit/questions/Q-000023.md), [Q-000037](_audit/questions/Q-000037.md) The exact hashes are in the answer table above and the case ledger.

### VM4BD310-C004 — Capital versus interest output

Input: `VM4BD310.cbl`. Rules: RULE-002. Source assessment retained: `DEFECT`.

**Test assessment:** DEFECT_RETAINED

**Revised finding:** For NX_CPCRESK=0 and nonzero AM_CNDSTK, INITIALIZE followed by the current projection leaves the consumed amount zero. The interest branch has its selected host. The fixture strengthens the expected result but cannot repair the missing column or duplicate coupon-rank projection.

**Remaining production gap:** The projection defect needs a separately authorized source repair and executable validation; missing output copybook and real consumer/layout proof remain open.

**Validation performed:** Static source, schema, declaration and exact-answer scope recheck. No COBOL compilation, SQL execution or real failure/restart test.

**Scoped scenarios / reasoning checks:**

- For capital 123.45 and rank 0, expect 123.45 but source def-use predicts zero. With nonzero rank and interest 56.78, the visible interest host is populated. These are static expectations, not executed COBOL.

**Rechecked evidence:** `IDMS Programs/VM4BD310.cbl` physical lines 247–253; `DB2 Manual converted Programs/VMDZ4310.txt` physical lines 219–263; `DB2 Manual converted Programs/VMDZ4310.txt` physical lines 393–399

Consumed answer versions: [Q-000013](_audit/questions/Q-000013.md), [Q-000026](_audit/questions/Q-000026.md) The exact hashes are in the answer table above and the case ledger.

### VM4BD310-C005 — Event key and split identifiers

Input: `VM4BD310.cbl`. Rules: RULE-022. Source assessment retained: `CONFLICT`.

**Test assessment:** CONDITIONAL_FORMAT_ONLY

**Revised finding:** Under those exact fixture widths the 28-byte DCLGEN key can populate the existing 30-byte group with two padding bytes, and its components can be traced to output. The original CHAR(20) CSV conflict and packed-to-display conversion remain recorded. Subtype 000 still yields MU; nonzero subtypes still reject.

**Remaining production gap:** The real loader/consumer contract, signed/value domains and missing target layout are unverified. Do not apply the 28-digit assumption to arbitrary fields or normalize the CSV globally.

**Validation performed:** Static source, schema, declaration and exact-answer scope recheck. No COBOL compilation, SQL execution or real failure/restart test.

**Scoped scenarios / reasoning checks:**

- Use leading-zero client/date/document components and operation codes 000, 001 and 999. Confirm the first is the only accepted subtype and that rejection occurs before output; compare real byte layouts when supplied.

**Rechecked evidence:** `IDMS Programs/VM4BD310.cbl` physical lines 73–89; `IDMS Programs/VM4BD310.cbl` physical lines 217–245; `DB2 Manual converted Programs/VMDZ4310.txt` physical lines 63–91; `DB2 Manual converted Programs/VMDZ4310.txt` physical lines 353–392; `Dclgens/DZEVEFTV.txt` physical lines 19–42

Consumed answer versions: [Q-000017](_audit/questions/Q-000017.md), [Q-000026](_audit/questions/Q-000026.md) The exact hashes are in the answer table above and the case ledger.

### VM4BD310-C006 — Date restoration

Input: `VM4BD310.cbl`. Rules: RULE-012. Source assessment retained: `UNRESOLVED`.

**Test assessment:** CONDITIONAL_DATE_TRANSLATION

**Revised finding:** The two visible conversion sequences restore zero/high sentinels or reorder day/month/year to YYYYMMDD under the EUR fixture. This removes ambiguity for the rehearsal scenario only. An ISO-formatted host remains a deliberate out-of-contract counterexample.

**Remaining production gap:** Actual preparation/subsystem settings and converted data have not been supplied; sentinel use must remain field-specific. No environment setting is inferred from DCLGEN X(10).

**Validation performed:** Static source, schema, declaration and exact-answer scope recheck. No COBOL compilation, SQL execution or real failure/restart test.

**Scoped scenarios / reasoning checks:**

- Reason through 01.01.0001, 31.12.9999 and 29.02.2024, then use 2024-02-29 as a negative-format case. No date SQL or COBOL conversion was executed.

**Rechecked evidence:** `IDMS Programs/VM4BD310.cbl` physical lines 258–263; `DB2 Manual converted Programs/VMDZ4310.txt` physical lines 404–433

Consumed answer versions: [Q-000014](_audit/questions/Q-000014.md) The exact hashes are in the answer table above and the case ledger.

### VM4BD310-C007 — Output overlays, arrays and retained business values

Input: `VM4BD310.cbl`. Rules: RULE-017. Source assessment retained: `UNRESOLVED`.

**Test assessment:** CONDITIONAL_LAYOUT_AND_EXTERNAL_REPLAY

**Revised finding:** The fixture supports reasoning about one 15-date area, its aliases and the 1500-byte record. It does not supply the actual copybook. Discard/recreate avoids retaining a partial file only if the external job enforces it. Immutable input alone does not freeze the database read by the two SELECTs.

**Remaining production gap:** Need actual VMDZ510I, file disposition/publication controls and a database-consistency decision. A changed database can change replayed output even with byte-identical input.

**Validation performed:** Static source, schema, declaration and exact-answer scope recheck. No COBOL compilation, SQL execution or real failure/restart test.

**Scoped scenarios / reasoning checks:**

- Fail after an output WRITE, discard the partial file, then replay the same input. Compare both a stable database and a changed event/parent snapshot; only the former is a candidate for equal business output.

**Rechecked evidence:** `IDMS Programs/VM4BD310.cbl` physical lines 213–318; `DB2 Manual converted Programs/VMDZ4310.txt` physical lines 353–481; `Copybook/VMBD510I.cpy` physical lines 1460–1481

Consumed answer versions: [Q-000019](_audit/questions/Q-000019.md), [Q-000026](_audit/questions/Q-000026.md) The exact hashes are in the answer table above and the case ledger.

### VM4BD310-C008 — Minimal helper state

Input: `VM4BD310.cbl`. Rules: RULE-023. Source assessment retained: `PARTIALLY_PRESERVED`.

**Test assessment:** REMOVAL_PROPOSALS_NOT_APPLIED

**Revised finding:** The two immediate per-date copies and two unused date groups remain removable candidates in the visible body. Direct key/output slicing can be considered for the assumed layout after numeric-domain checks. Optional timestamp/input counters are not mandatory migration state; SQLERRWS expansion remains unknown.

**Remaining production gap:** Do not remove typed numeric conversion, live key components or unknown include fields. Missing actual target layout/compiler/runtime prevents accepting a production rewrite.

**Validation performed:** Static source, schema, declaration and exact-answer scope recheck. No COBOL compilation, SQL execution or real failure/restart test.

**Scoped scenarios / reasoning checks:**

- Trace each proposed receiving item through all writes and reads; retain the selected event key until output is complete and preserve diagnostics before termination. No helper-removal code was applied or compiled.

**Rechecked evidence:** `DB2 Manual converted Programs/VMDZ4310.txt` physical lines 55–145; `DB2 Manual converted Programs/VMDZ4310.txt` physical lines 353–433; `DB2 Manual converted Programs/VMDZ4310.txt` physical lines 497–507

Consumed answer versions: [Q-000026](_audit/questions/Q-000026.md), [Q-000035](_audit/questions/Q-000035.md) The exact hashes are in the answer table above and the case ledger.

### VM4BD420-C001 — As-of date and date-service call

Input: `VM4BD420.cbl`. Rules: RULE-006. Source assessment retained: `PARTIAL`.

**Test assessment:** The retained date-service branch still accepts only ESDATMAS return0. Year 60 maps to 2060 and 61 to 1961, independently of 302’s80 cutoff. Later EUR conversion can be reasoned about under Q-000014, but Q-000035 does not supply ESDATMAS calendar validation or make its return values predictable.

**Remaining production gap:** ESDATMAS, USERABEN, build options and deployed DATE format remain unavailable. Actual service failure, calendar and side-effect behavior is untested.

**Scoped scenarios / reasoning checks:**

- Year 60/61 exercises the exact original century boundary.
- Return0 supplies PARMDATE; nonzero must reach the assumed nonreturning abort.
- A non-EUR actual returned DATE would invalidate the fixture; no deployed format was checked.

**Rechecked evidence:** `IDMS Programs/VM4BD420.cbl` physical lines 119–148; `DB2 Manual converted Programs/VMDZ4420.cbl` physical lines 209–238; `DB2 Manual converted Programs/VMDZ4420.cbl` physical lines 282–295; `Copybook/ESDATMAS.cpy` physical lines 15–38

Consumed answer versions: [Q-000014](_audit/questions/Q-000014.md), [Q-000035](_audit/questions/Q-000035.md) The exact hashes are in the answer table above and the case ledger.

### VM4BD420-C002 — Area sweep and nested events

Input: `VM4BD420.cbl`. Rules: RULE-024. Source assessment retained: `PARTIAL`.

**Test assessment:** The parent scan covers the chosen fixture row set and each child query uses the complete four-part key. Retaining the separate parent host group replaces FIND CURRENT without a new saved key. Child SQL100 and business D are different exits, both followed by normal CLOSE when their preceding operations succeed.

**Remaining production gap:** Actual area/view equivalence, parent row ordering, child set/load order, snapshot consistency and runtime cleanup are not proved by the assumptions.

**Scoped scenarios / reasoning checks:**

- Empty parent scan produces empty output.
- A parent with no events retains space status and writes nothing.
- A disqualifying child stops its own cursor scope without ending the parent scan.

**Rechecked evidence:** `IDMS Programs/VM4BD420.cbl` physical lines 151–188; `DB2 Manual converted Programs/VMDZ4420.cbl` physical lines 164–196; `DB2 Manual converted Programs/VMDZ4420.cbl` physical lines 245–279; `DB2 Manual converted Programs/VMDZ4420.cbl` physical lines 376–474

Consumed answer versions: [Q-000035](_audit/questions/Q-000035.md), [Q-000036](_audit/questions/Q-000036.md), [Q-000037](_audit/questions/Q-000037.md) The exact hashes are in the answer table above and the case ledger.

### VM4BD420-C003 — C/D/S state and early disqualification

Input: `VM4BD420.cbl`. Rules: RULE-004. Source assessment retained: `PRESERVED_CONDITIONAL_ON_ORDER_TYPES`.

**Test assessment:** For one chosen valid-domain encounter order, the original artificial 0307 exit, target extra D flag and proposed existing-WS-STATUS-only exit yield the same C/D/S/output decision in 2801 model sequences. Date equality remains eligible; 0168 with state not1 suppresses output, while state 1 does not. Reversing two 0060 rows changes the selected CI and remains an order counterexample.

**Remaining production gap:** The Python state model does not validate SQL, IDMS currency or data conversion. Actual order/domain evidence remains missing, and the source has not been changed to remove the flag.

**Scoped scenarios / reasoning checks:**

- 0217 then0060 and 0060 then0217 both finishC absent a disqualifier.
- 0060 then0168/state 0 finishesD with no output; state 1 preservesC.
- Two 0060 rows select the last encountered CI under this scoped fixture.

**Rechecked evidence:** `IDMS Programs/VM4BD420.cbl` physical lines 190–224; `DB2 Manual converted Programs/VMDZ4420.cbl` physical lines 268–314

Consumed answer versions: [Q-000004](_audit/questions/Q-000004.md), [Q-000014](_audit/questions/Q-000014.md), [Q-000017](_audit/questions/Q-000017.md), [Q-000036](_audit/questions/Q-000036.md) The exact hashes are in the answer table above and the case ledger.

### VM4BD420-C004 — Output and expanded composite key

Input: `VM4BD420.cbl`. Rules: RULE-022. Source assessment retained: `CONFLICT`.

**Test assessment:** Under those bounds, the 8-digit creation CI narrows to the intended 6-digit output, while the 50-byte declared layout and direct packed amount MOVEs are retained. The mapping20 versus DCLGEN28 conflict remains. Q-000039 requires a failed extract’s partial file to be discarded and rebuilt from a stable snapshot before downstream publication.

**Remaining production gap:** Actual CI domains, loader/view definitions, packed output bytes, file/JCL disposition and publication behavior remain unverified. There is no in-program restart checkpoint to resume the partial extract.

**Scoped scenarios / reasoning checks:**

- CI 00123456 becomes the intended 123456 under the fixture.
- A creation CI with nonzero upper digits is outside the approved test domain and cannot be declared safe.
- Failure after writes requires rebuilding the whole extract, not resuming viaWITH HOLD.

**Rechecked evidence:** `IDMS Programs/VM4BD420.cbl` physical lines 61–84; `IDMS Programs/VM4BD420.cbl` physical lines 213–221; `DB2 Manual converted Programs/VMDZ4420.cbl` physical lines 50–73; `DB2 Manual converted Programs/VMDZ4420.cbl` physical lines 316–339; `Dclgens/DZBEFFTV.txt` physical lines 37–59; `Dclgens/DZEVEFTV.txt` physical lines 19–43

Consumed answer versions: [Q-000004](_audit/questions/Q-000004.md), [Q-000014](_audit/questions/Q-000014.md), [Q-000017](_audit/questions/Q-000017.md), [Q-000037](_audit/questions/Q-000037.md), [Q-000039](_audit/questions/Q-000039.md) The exact hashes are in the answer table above and the case ledger.

### VM4BD420-C005 — EOF/error separation and cursor cleanup

Input: `VM4BD420.cbl`. Rules: RULE-033. Source assessment retained: `PARTIAL`.

**Test assessment:** Under the fixture a failed OPEN/FETCH/CLOSE cannot return to the unchanged loop flags, so the known failure path does not silently continue. A business D still closes the child normally and suppresses output; it never becomes synthetic SQL+100. The distinction survives the answer-driven revision.

**Remaining production gap:** SQLERROR/IDMS-STATUS/USERABEN implementations and failure cleanup remain absent. No handler, warning, rollback or early-close fault was executed; sequential output recovery has a separate external policy.

**Scoped scenarios / reasoning checks:**

- SuccessfulD exit: CLOSE child and do notWRITE.
- FETCH100: ordinary EOF without stale processing.
- CLOSE failure after C: fatal fixture outcome before any successful completion/publication claim.

**Rechecked evidence:** `IDMS Programs/VM4BD420.cbl` physical lines 151–191; `IDMS Programs/VM4BD420.cbl` physical lines 199–224; `DB2 Manual converted Programs/VMDZ4420.cbl` physical lines 357–494

Consumed answer versions: [Q-000035](_audit/questions/Q-000035.md) The exact hashes are in the answer table above and the case ledger.

### VM4BD420-C006 — Only justified helper storage

Input: `VM4BD420.cbl`. Rules: RULE-023. Source assessment retained: `PARTIAL`.

**Test assessment:** SW-STATUS-D remains removable because everyY assignment immediately follows WS-STATUS=D and no intervening successful branch changes it before exit. The existing-state-only variant matched legacy/target output decisions across 2801 model sequences. Comparing the still-live reordered date removes the duplicate scalar; neither change allows parent/child EOF to share one state.

**Remaining production gap:** No COBOL source was edited or compiled. Runtime error handling and date settings remain unverified; the model covers decoded successful paths, not database/failure semantics.

**Scoped scenarios / reasoning checks:**

- Replace the loop’s extra D flag test with WS-STATUS=D and retain SQL EOF separately.
- Use WS-STATUS=C for the final write guard.
- Reuse date staging only before a later output-date conversion overwrites it.

**Rechecked evidence:** `DB2 Manual converted Programs/VMDZ4420.cbl` physical lines 61–151; `DB2 Manual converted Programs/VMDZ4420.cbl` physical lines 262–314

Consumed answer versions: [Q-000014](_audit/questions/Q-000014.md), [Q-000035](_audit/questions/Q-000035.md) The exact hashes are in the answer table above and the case ledger.

### VM4BD420-C007 — Date overlays and file boundaries

Input: `VM4BD420.cbl`. Rules: RULE-017. Source assessment retained: `PRESERVED_VISIBLE_LAYOUT`.

**Test assessment:** The existing DATE6 REDEFINES still aliases six bytes, and the added date overlay aliases eight bytes without a second allocation. The visible50-byte output arithmetic is unchanged. The expanded28-byte copied event group is not an overlay of the former20-byte representation and still requires external conversion proof.

**Remaining production gap:** Generated IDMS layouts, actual compiler/buffer bytes and loader definitions remain absent. Static arithmetic cannot establish byte-equivalent packed output or date-service behavior.

**Scoped scenarios / reasoning checks:**

- Minimum/maximum DATE sentinels map to the scoped zero/high numeric forms.
- No OCCURS or SQL rowset is introduced by these visible interfaces.
- Do not replace a typed numeric MOVE with a rawgroup MOVE to a packed field.

**Rechecked evidence:** `IDMS Programs/VM4BD420.cbl` physical lines 87–106; `DB2 Manual converted Programs/VMDZ4420.cbl` physical lines 113–151; `DB2 Manual converted Programs/VMDZ4420.cbl` physical lines 316–339; `Copybook/ESDATMAS.cpy` physical lines 15–38

Consumed answer versions: [Q-000014](_audit/questions/Q-000014.md), [Q-000017](_audit/questions/Q-000017.md) The exact hashes are in the answer table above and the case ledger.

### VM7BD200-C001 — Runtime services and selected path effects

Input: `VM7BD200.cbl`. Rules: RULE-031. Source assessment retained: `UNRESOLVED`.

**Test assessment:** CONDITIONAL_RUNTIME_EXIT_ONLY

**Revised finding:** Under the fixture, empty archive control input or an OPEN/FETCH/CLOSE failure stops further processing. Normal selected LRF access and target SQL remain retrieval-only. Fatal Db2 handling does not undo previous file writes or establish missing attachment behavior.

**Remaining production gap:** Actual error/abort members, generated controls, JCL and preparation options are still missing under Q-000012/Q-000035.

**Validation performed:** Static source, schema, declaration and exact-answer scope recheck. No COBOL compilation, SQL execution or real failure/restart test.

**Scoped scenarios / reasoning checks:**

- Distinguish empty DAARCH control input, which calls USERABEN, from an empty eligible database set, which reaches normal FETCH +100 with no archive WRITE.

**Rechecked evidence:** `IDMS Programs/VM7BD200.cbl` physical lines 174–179; `IDMS Programs/VM7BD200.cbl` physical lines 210–222; `DB2 Manual converted Programs/VMDZ7200.cbl` physical lines 429–440; `DB2 Manual converted Programs/VMDZ7200.cbl` physical lines 559–587

Consumed answer versions: [Q-000035](_audit/questions/Q-000035.md) The exact hashes are in the answer table above and the case ledger.

### VM7BD200-C002 — LRF area sweep without parent join

Input: `VM7BD200.cbl`. Rules: RULE-021. Source assessment retained: `PRESERVED_FOR_VISIBLE_PATH`.

**Test assessment:** PRESERVED_SELECTED_PATH_WITH_FIXTURE_DDL

**Revised finding:** SWEEP-VMBFAS expands to OBTAIN EACH VMBFAS in the area. No VMBSIAS lookup is added. The same forms can be considered for the target cursor under the hypothetical view scope and separately scoped date policy. This path conclusion is source-derived, not human-confirmed.

**Remaining production gap:** Actual DZBFASTV definition and load/cutoff conversion remain missing. Presence of VMBSIAS among LR components does not authorize a join, rejection or decommission inference.

**Validation performed:** Static source, schema, declaration and exact-answer scope recheck. No COBOL compilation, SQL execution or real failure/restart test.

**Scoped scenarios / reasoning checks:**

- Include an eligible form without a related parent row in a hypothetical fixture: the selected legacy path does not request a parent, so adding an INNER JOIN would incorrectly exclude that form.

**Rechecked evidence:** `IDMS Programs/VM7BD200.cbl` physical lines 179–179; `IDMS Programs/VM7BD200.cbl` physical lines 203–203; `Schema/VMBTS03.txt` physical lines 86–110; `DB2 Manual converted Programs/VMDZ7200.cbl` physical lines 280–374

Consumed answer versions: [Q-000037](_audit/questions/Q-000037.md) The exact hashes are in the answer table above and the case ledger.

### VM7BD200-C003 — Cursor EOF and parameter lifetime

Input: `VM7BD200.cbl`. Rules: RULE-011. Source assessment retained: `PARTIALLY_PRESERVED`.

**Test assessment:** CONDITIONAL_CURSOR_FAILURE_EXIT

**Revised finding:** The visible OPEN 0, FETCH 0/process, FETCH +100/stop and CLOSE sequence remains coherent under the fixture. Clearing result hosts before FETCH does not change the cutoff already bound at OPEN. A reopen would require restoring cutoff inputs. The EOC flag is a convention, not proof of an external recovery protocol.

**Remaining production gap:** Actual VMDZ270I, handler behavior and OPEN diagnostic context are missing. SQLCODE 0 warnings remain outside the shown tests; the fixture does not manufacture SQLWARN handling.

**Validation performed:** Static source, schema, declaration and exact-answer scope recheck. No COBOL compilation, SQL execution or real failure/restart test.

**Scoped scenarios / reasoning checks:**

- Exercise the reasoning cases OPEN failure, first FETCH +100, one successful row then +100, and unexpected FETCH/CLOSE result. Only successful FETCH may format and write an archive record.

**Rechecked evidence:** `IDMS Programs/VM7BD200.cbl` physical lines 138–140; `DB2 Manual converted Programs/VMDZ7200.cbl` physical lines 416–556; `DB2 Manual converted Programs/VMDZ7200.cbl` physical lines 583–587

Consumed answer versions: [Q-000025](_audit/questions/Q-000025.md), [Q-000035](_audit/questions/Q-000035.md) The exact hashes are in the answer table above and the case ledger.

### VM7BD200-C004 — Archive date filter pushdown

Input: `VM7BD200.cbl`. Rules: RULE-012. Source assessment retained: `UNRESOLVED`.

**Test assessment:** CONDITIONAL_PREDICATE_MATCH

**Revised finding:** Accounting date controls when it is not the minimum sentinel; creation date controls only when accounting is the sentinel. Both comparisons stay strictly less than the input archive cutoff. The cutoff is read from DAARCH, not derived from the linkage/system-date branch.

**Remaining production gap:** Real VMDZ270I, load conversion and effective DATE output setting remain unverified. An actual historical minimum date cannot be silently treated as absent without the business contract.

**Validation performed:** Static source, schema, declaration and exact-answer scope recheck. No COBOL compilation, SQL execution or real failure/restart test.

**Scoped scenarios / reasoning checks:**

- Test before/equal/after cutoff for a nonzero accounting date, then the same creation-date cases with accounting zero. Equality remains excluded; changing the fallback to OR without its accounting condition would be incorrect.

**Rechecked evidence:** `IDMS Programs/VM7BD200.cbl` physical lines 188–191; `DB2 Manual converted Programs/VMDZ7200.cbl` physical lines 366–370; `DB2 Manual converted Programs/VMDZ7200.cbl` physical lines 417–423

Consumed answer versions: [Q-000006](_audit/questions/Q-000006.md), [Q-000014](_audit/questions/Q-000014.md), [Q-000025](_audit/questions/Q-000025.md) The exact hashes are in the answer table above and the case ledger.

### VM7BD200-C005 — Binary archive image reconstruction

Input: `VM7BD200.cbl`. Rules: RULE-017. Source assessment retained: `UNRESOLVED`.

**Test assessment:** BYTE_FIDELITY_UNRESOLVED

**Revised finding:** The 84 projection/host pairs and 432+46+52=530 length arithmetic remain supported static checks. They do not establish original filler byte equivalence. The corrected mapping spelling is a local documented exception; it does not authorize blanking legacy packed/filler content or rewriting all mapping names.

**Remaining production gap:** Original generated record bytes, output-consumer specification and real row reconciliation remain missing. Corrected Q-000025 concerns the input parameter record and cannot resolve this output contract.

**Validation performed:** Static source, schema, declaration and exact-answer scope recheck. No COBOL compilation, SQL execution or real failure/restart test.

**Scoped scenarios / reasoning checks:**

- Compare a legacy record whose filler includes packed-zero bytes with target spaces; equal length and equal named business values are insufficient. Preserve the mismatch as an unresolved output obligation.

**Rechecked evidence:** `IDMS Programs/VM7BD200.cbl` physical lines 87–94; `IDMS Programs/VM7BD200.cbl` physical lines 192–200; `DB2 Manual converted Programs/VMDZ7200.cbl` physical lines 75–198; `DB2 Manual converted Programs/VMDZ7200.cbl` physical lines 589–879

Consumed answer versions: [Q-000005](_audit/questions/Q-000005.md), [Q-000024](_audit/questions/Q-000024.md), [Q-000037](_audit/questions/Q-000037.md) The exact hashes are in the answer table above and the case ledger.

### VM7BD200-C006 — Archive ordering and counter

Input: `VM7BD200.cbl`. Rules: RULE-025. Source assessment retained: `UNRESOLVED`.

**Test assessment:** TEST_POLICY_ACCEPTS_ORDER_CHANGE_WITH_LIMITS

**Revised finding:** The rehearsal may compare the eligible business row set independently of counter-to-form association, then separately check counter continuity. It does not prove IDMS area order equals NR_ID ASC. Counter overflow, failed/repeated runs and downstream reliance on a particular ordinal are outside this assumed acceptance.

**Remaining production gap:** Actual downstream order/sequence policy, data scope and reconciliation are still required. Retain the source order change and production question.

**Validation performed:** Static source, schema, declaration and exact-answer scope recheck. No COBOL compilation, SQL execution or real failure/restart test.

**Scoped scenarios / reasoning checks:**

- For two eligible forms encountered in reverse legacy/surrogate order, accept the same business row set only under Q-000008, and require counters 1 and 2 once each. Do not demand the same ordinal/form pairing for this fixture.

**Rechecked evidence:** `IDMS Programs/VM7BD200.cbl` physical lines 192–200; `Schema/VMBTS03.txt` physical lines 90–92; `DB2 Manual converted Programs/VMDZ7200.cbl` physical lines 371–371; `DB2 Manual converted Programs/VMDZ7200.cbl` physical lines 597–598

Consumed answer versions: [Q-000008](_audit/questions/Q-000008.md) The exact hashes are in the answer table above and the case ledger.

### VM7BD200-C007 — External file recovery

Input: `VM7BD200.cbl`. Rules: RULE-015. Source assessment retained: `UNRESOLVED`.

**Test assessment:** EXTERNAL_RECOVERY_ASSUMED

**Revised finding:** The fixture uses whole-extract replay, not a new checkpoint or cursor-resume protocol. The transient WS-TELLER restarts with the extract. A successful recreation can be compared to that frozen snapshot, but only the external job can discard and control publication of a partial file.

**Remaining production gap:** No JCL, scheduler, publication gate, real snapshot facility or recovery execution is supplied. Db2 rollback cannot be asserted to remove already written sequential-file records.

**Validation performed:** Static source, schema, declaration and exact-answer scope recheck. No COBOL compilation, SQL execution or real failure/restart test.

**Scoped scenarios / reasoning checks:**

- Fail before the first WRITE, after an interior WRITE and near normal close. Discard each partial result, recreate from the same frozen row set and publish only through the separately implemented job contract.

**Rechecked evidence:** `IDMS Programs/VM7BD200.cbl` physical lines 192–220; `DB2 Manual converted Programs/VMDZ7200.cbl` physical lines 585–587; `DB2 Manual converted Programs/VMDZ7200.cbl` physical lines 874–889

Consumed answer versions: [Q-000007](_audit/questions/Q-000007.md) The exact hashes are in the answer table above and the case ledger.

### VM7BD200-C008 — Helper minimization with packed conversion

Input: `VM7BD200.cbl`. Rules: RULE-023. Source assessment retained: `PARTIALLY_PRESERVED`.

**Test assessment:** TYPED_CONVERSION_REQUIRED

**Revised finding:** Eight per-date buffers can be evaluated for reuse of one existing conversion area. The creation-date receiving field is COMP-3, so its elementary alphanumeric-to-numeric conversion remains essential. A reference-modified eight-digit source is a proposed no-new-buffer option; a raw group MOVE is not equivalent. Numeric WS-DA-ARCH-YMD holding dotted text remains an unnecessary category mismatch.

**Remaining production gap:** No compiler or byte-image tests were performed. Keep unknown diagnostic includes and the actual input-copybook gap unresolved; no helper was removed from source.

**Validation performed:** Static source, schema, declaration and exact-answer scope recheck. No COBOL compilation, SQL execution or real failure/restart test.

**Scoped scenarios / reasoning checks:**

- For zero, high and ordinary eight-digit dates, compare the proposed elementary numeric transfer to the current X(8)-to-COMP-3 transfer. Also demonstrate why copying the group bytes directly would not be an acceptable packed representation.

**Rechecked evidence:** `DB2 Manual converted Programs/VMDZ7200.cbl` physical lines 54–74; `DB2 Manual converted Programs/VMDZ7200.cbl` physical lines 202–271; `DB2 Manual converted Programs/VMDZ7200.cbl` physical lines 603–616; `DB2 Manual converted Programs/VMDZ7200.cbl` physical lines 625–855

Consumed answer versions: [Q-000014](_audit/questions/Q-000014.md), [Q-000035](_audit/questions/Q-000035.md) The exact hashes are in the answer table above and the case ledger.

## Unchanged evidence and remaining validation

No question was superseded and no actual human answer was accepted. The synthetic missing-copybook assumptions do not close build dependencies. Q-000011 (buffer lifecycle), Q-000012 (build/generated dependencies), and Q-000015 (eight decommission identities) are explicitly deferred. Actual DDL, data conversion, ordering, SQL error-routine behavior and output publication contracts still require evidence even where a test fixture assumes them.

Structural validation and the separate Python models are described in `../../../TEST_RESULTS.md`. Precompile, COBOL compile/link, Db2 bind/execution, real crash/restart, concurrency and business byte-image reconciliation were **not performed**. Test results cannot authorize production conversion or deployment.
