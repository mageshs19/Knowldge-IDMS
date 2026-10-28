# Coverage and validation — Phase 1

This isolated rehearsal covers **6 IDMS inputs, 6 verified Db2 pairs, 6 complete program report documents, 4 generic guides, 60 migration cases, 33 conditional rules and 39 question files**. All six semantic assessments remain PARTIAL. Original application source is unchanged.

Phase 1 consumed no human or simulated answers.

## Inventory and pairing

| IDMS input | Db2 conversion | Report | Cases | Guides | Status |
| --- | --- | --- | --- | --- | --- |
| VM1BD526.cbl | DB2 Manual converted Programs/VMDZ1526.txt | [Report](programs/VM1BD526.cbl__migration.md) | 16 | G01, G02, G03, G04 | PARTIAL |
| VM1BD567.cbl | DB2 Manual converted Programs/VMDZ1567.cbl | [Report](programs/VM1BD567.cbl__migration.md) | 12 | G01, G02 | PARTIAL |
| VM4BD302.cbl | DB2 Manual converted Programs/VMDZ4302.txt | [Report](programs/VM4BD302.cbl__migration.md) | 9 | G01 | PARTIAL |
| VM4BD310.cbl | DB2 Manual converted Programs/VMDZ4310.txt | [Report](programs/VM4BD310.cbl__migration.md) | 8 | G03 | PARTIAL |
| VM4BD420.cbl | DB2 Manual converted Programs/VMDZ4420.cbl | [Report](programs/VM4BD420.cbl__migration.md) | 7 | G01 | PARTIAL |
| VM7BD200.cbl | DB2 Manual converted Programs/VMDZ7200.cbl | [Report](programs/VM7BD200.cbl__migration.md) | 8 | G03 | PARTIAL |

No exclusions, unpaired Db2 files or non-program inputs were found among the six supplied IDMS files. The archive contains 30 source/supporting files: 6 IDMS, 6 Db2, 7 copybooks, 7 DCLGENs, 3 subschema/LRF files and 1 CSV. The same-size 302/310 files have different hashes, PROGRAM-IDs and business paths. VMDZ1526.txt uses cp1252; original bytes are retained.

## Full generic-rule check

Expected rows: 33 × 6 = **198**. Recorded rows: **198**. This is complete recording of applicability decisions, not proof that every rule is implemented correctly or universally resolved.

| Disposition | Rows |
| --- | --- |
| APPLIES_CONTRADICTS | 1 |
| APPLIES_SUPPORTS | 10 |
| APPLIES_VARIANT | 9 |
| NOT_APPLICABLE | 98 |
| UNKNOWN | 80 |

See `_audit/rule-applicability.json` for every tested condition, source reference, exception and unknown. Cases outside a rule’s seeded examples were also checked from source; an applicable row may have no case ID when the existing case ledger did not name that technical cross-check.

## Guide and case coverage

| Guide | Classified cases | File |
| --- | --- | --- |
| G01 | 22 | [01_RETRIEVAL_WITHOUT_LRF.md](generic/01_RETRIEVAL_WITHOUT_LRF.md) |
| G02 | 20 | [02_UPDATE_RESTART_WITHOUT_LRF.md](generic/02_UPDATE_RESTART_WITHOUT_LRF.md) |
| G03 | 21 | [03_LRF_RETRIEVAL.md](generic/03_LRF_RETRIEVAL.md) |
| G04 | 15 | [04_LRF_UPDATE_RESTART.md](generic/04_LRF_UPDATE_RESTART.md) |

| Case ID | Input | Guides | Rules | Question IDs |
| --- | --- | --- | --- | --- |
| VM1BD526-C001 | VM1BD526.cbl | G04 | RULE-008 | Q-000020 |
| VM1BD526-C002 | VM1BD526.cbl | G03, G04 | RULE-020 | Q-000018, Q-000035 |
| VM1BD526-C003 | VM1BD526.cbl | G04 | RULE-018 | Q-000009, Q-000017, Q-000018 |
| VM1BD526-C004 | VM1BD526.cbl | G03, G04 | RULE-025 | Q-000016, Q-000018, Q-000035 |
| VM1BD526-C005 | VM1BD526.cbl | G04 | RULE-019 | Q-000016, Q-000018, Q-000035 |
| VM1BD526-C006 | VM1BD526.cbl | G03, G04 | RULE-022 | Q-000017 |
| VM1BD526-C007 | VM1BD526.cbl | G03, G04 | RULE-023 | Q-000020 |
| VM1BD526-C008 | VM1BD526.cbl | G01, G02 | RULE-028 | Q-000031, Q-000034 |
| VM1BD526-C009 | VM1BD526.cbl | G02, G04 | RULE-016 | Q-000034, Q-000035 |
| VM1BD526-C010 | VM1BD526.cbl | G02, G04 | RULE-026 | Q-000020, Q-000029, Q-000030 |
| VM1BD526-C011 | VM1BD526.cbl | G02, G04 | RULE-001 | Q-000028, Q-000035 |
| VM1BD526-C012 | VM1BD526.cbl | G02, G04 | RULE-029 | Q-000032 |
| VM1BD526-C013 | VM1BD526.cbl | G02, G04 | RULE-009 | Q-000027, Q-000035 |
| VM1BD526-C014 | VM1BD526.cbl | G01, G02, G03, G04 | RULE-033 | Q-000035 |
| VM1BD526-C015 | VM1BD526.cbl | G02, G04 | RULE-007 | Q-000029 |
| VM1BD526-C016 | VM1BD526.cbl | G04 | RULE-030 | Q-000009 |
| VM1BD567-C001 | VM1BD567.cbl | G01, G02 | RULE-005 | Q-000020, Q-000035, Q-000037 |
| VM1BD567-C002 | VM1BD567.cbl | G01, G02 | RULE-013 | Q-000010 |
| VM1BD567-C003 | VM1BD567.cbl | G02 | RULE-030 | Q-000009 |
| VM1BD567-C004 | VM1BD567.cbl | G01, G02 | RULE-028 | Q-000031, Q-000034 |
| VM1BD567-C005 | VM1BD567.cbl | G02 | RULE-016 | Q-000034, Q-000035 |
| VM1BD567-C006 | VM1BD567.cbl | G02 | RULE-026 | Q-000029, Q-000030, Q-000033 |
| VM1BD567-C007 | VM1BD567.cbl | G02 | RULE-010 | Q-000021, Q-000035 |
| VM1BD567-C008 | VM1BD567.cbl | G02 | RULE-029 | Q-000032 |
| VM1BD567-C009 | VM1BD567.cbl | G02 | RULE-009 | Q-000027, Q-000035 |
| VM1BD567-C010 | VM1BD567.cbl | G02 | RULE-001 | Q-000021, Q-000028, Q-000035 |
| VM1BD567-C011 | VM1BD567.cbl | G01, G02 | RULE-033 | Q-000035 |
| VM1BD567-C012 | VM1BD567.cbl | G02 | RULE-007 | Q-000029 |
| VM4BD302-C001 | VM4BD302.cbl | G01 | RULE-006 | Q-000003, Q-000014 |
| VM4BD302-C002 | VM4BD302.cbl | G01 | RULE-032 | Q-000003, Q-000035, Q-000037 |
| VM4BD302-C003 | VM4BD302.cbl | G01 | RULE-024 | Q-000035, Q-000036, Q-000037 |
| VM4BD302-C004 | VM4BD302.cbl | G01 | RULE-027 | Q-000001, Q-000014, Q-000017 |
| VM4BD302-C005 | VM4BD302.cbl | G01 | RULE-025 | Q-000014, Q-000017, Q-000036 |
| VM4BD302-C006 | VM4BD302.cbl | G01 | RULE-022 | Q-000002, Q-000017, Q-000037, Q-000038 |
| VM4BD302-C007 | VM4BD302.cbl | G01 | RULE-023 | Q-000002, Q-000017, Q-000035 |
| VM4BD302-C008 | VM4BD302.cbl | G01 | RULE-033 | Q-000003, Q-000035 |
| VM4BD302-C009 | VM4BD302.cbl | G01 | RULE-017 | Q-000003 |
| VM4BD310-C001 | VM4BD310.cbl | G03 | RULE-031 | Q-000035 |
| VM4BD310-C002 | VM4BD310.cbl | G03 | RULE-021 | Q-000022, Q-000035, Q-000037 |
| VM4BD310-C003 | VM4BD310.cbl | G03 | RULE-025 | Q-000023, Q-000037 |
| VM4BD310-C004 | VM4BD310.cbl | G03 | RULE-002 | Q-000013, Q-000026 |
| VM4BD310-C005 | VM4BD310.cbl | G03 | RULE-022 | Q-000017, Q-000026 |
| VM4BD310-C006 | VM4BD310.cbl | G03 | RULE-012 | Q-000014 |
| VM4BD310-C007 | VM4BD310.cbl | G03 | RULE-017 | Q-000019, Q-000026 |
| VM4BD310-C008 | VM4BD310.cbl | G03 | RULE-023 | Q-000026, Q-000035 |
| VM4BD420-C001 | VM4BD420.cbl | G01 | RULE-006 | Q-000014, Q-000035 |
| VM4BD420-C002 | VM4BD420.cbl | G01 | RULE-024 | Q-000035, Q-000036, Q-000037 |
| VM4BD420-C003 | VM4BD420.cbl | G01 | RULE-004 | Q-000004, Q-000014, Q-000017, Q-000036 |
| VM4BD420-C004 | VM4BD420.cbl | G01 | RULE-022 | Q-000004, Q-000014, Q-000017, Q-000037, Q-000039 |
| VM4BD420-C005 | VM4BD420.cbl | G01 | RULE-033 | Q-000035 |
| VM4BD420-C006 | VM4BD420.cbl | G01 | RULE-023 | Q-000014, Q-000035 |
| VM4BD420-C007 | VM4BD420.cbl | G01 | RULE-017 | Q-000014, Q-000017 |
| VM7BD200-C001 | VM7BD200.cbl | G03 | RULE-031 | Q-000035 |
| VM7BD200-C002 | VM7BD200.cbl | G03 | RULE-021 | Q-000037 |
| VM7BD200-C003 | VM7BD200.cbl | G03 | RULE-011 | Q-000025, Q-000035 |
| VM7BD200-C004 | VM7BD200.cbl | G03 | RULE-012 | Q-000006, Q-000014, Q-000025 |
| VM7BD200-C005 | VM7BD200.cbl | G03 | RULE-017 | Q-000005, Q-000024, Q-000037 |
| VM7BD200-C006 | VM7BD200.cbl | G03 | RULE-025 | Q-000008 |
| VM7BD200-C007 | VM7BD200.cbl | G03 | RULE-015 | Q-000007 |
| VM7BD200-C008 | VM7BD200.cbl | G03 | RULE-023 | Q-000014, Q-000035 |

## Evidence gaps and material findings

The reports retain the confirmed VMDZ4310 missing-capital projection, legacy VM1BD567 counter defect, VMDZ1567 short-file restart gap, 1215-to-15-byte checkpoint difference, narrow cumulative counters, event-order changes, and the CHAR(20)/CHAR(28) conflict. No synthetic policy closes a source finding.

Missing target VMDZ205I/VMDZ510I/VMDZ270I, SQLERROR/SQLERRWS, generated IDMS members, called executables, actual DDL/catalog constraints and build settings prevent a complete build or universal semantics claim. Helper ledgers distinguish allocated storage, aliases and optional/removable groups; no blanket count treats every added item as mandatory. The complete grouped inventories are retained in `_audit/program-findings.json` and section 6 of each report.

Eight requested decommission identities: **0 supplied, 8 unresolved**. Restart mapping FFRECAB → DZ01RSTB is observed, while executed SQL uses DZ01RSTV; view/base DDL remains missing. FFRECAT → DZ01FFTB is a mapping candidate only. No persistent buffer lifecycle is established by this sample.

## Questions and answer states

| State dimension | Counts |
| --- | --- |
| Response | {'UNANSWERED': 39} |
| Review | {'NOT_REVIEWED': 39} |
| Resolution | {'OPEN': 39} |
| Production | {'OPEN': 39} |

Original Phase 1 question snapshots are in `_audit/questions/` of the baseline. Phase 2 snapshots contain the exact synthetic answers consumed. The shared editable question folder is outside preserved runs.

## Validation levels

| Level | Actually performed | Practical limit |
| --- | --- | --- |
| Source review | Complete visible pair and supplied dependency inspection; physical evidence anchors, field and helper ledgers; 60 cases | Missing dependencies stay unresolved |
| Structural checks | Bundled validator verifies recursive input/report census, hashes, links, matrix and answer scope/provenance | Does not prove prose or business correctness |
| Static LRF checks | 84 SELECT/FETCH columns and order reconciled; 432+46+52=530 layout arithmetic; capital projection checked | Not byte-image reconciliation or execution |
| Python scenario models | Separate labelled models/branch simulations are recorded in TEST_RESULTS.md | Do not execute COBOL or Db2 |
| Precompile, compile/link, bind | NOT PERFORMED | Missing environment/dependencies |
| Db2, crash/restart, concurrency, real data reconciliation | NOT PERFORMED | Production validation still required |

Source/configuration/answer fingerprints are in `_audit/run.json`. Source preservation also compares all normalized copies and original extracted files against SOURCE_MANIFEST.json.
