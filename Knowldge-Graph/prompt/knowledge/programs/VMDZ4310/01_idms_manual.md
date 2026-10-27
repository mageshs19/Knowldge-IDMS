# VMDZ4310: IDMS to manual DB2 baseline

Analysis fingerprint: `2949b601fc952c9eb0f7f0d5c597f0ccf732362d56bb356faec41adaf29902ec`.

**Automated evidence inventory. Business equivalence is NOT established. No compiler or DB2 runtime validation is implied.**

The baseline excludes generated output and converter behavior. The gap track cannot establish its own expected behavior from the generated output.

## Input identities

| Role | File | Physical lines | SHA-256 |
|---|---|---:|---|
| idms | `mainframe/workspace/Program/VM4BD310.cbl` | 337 | `6b7753f96d95c16709c9960601f901bc497acf79d52b2d1eb290ceefcb79bf84` |
| manual | `mainframe/workspace/Manual Output/VMDZ4310.txt` | 512 | `5bac84467e8ea965aea2ae0d53d1072e0dfe2f8afc6d0d13560ac4bc59f59e8d` |
| copybook | `mainframe/workspace/Copybook/ESDATMAS.cpy` | 39 | `185019c004727a2754201ae1e8f6a272b0fe71de6b8141939118b4c01c752d06` |
| copybook | `mainframe/workspace/Copybook/VM9BC50I.cpy` | 65 | `20efbe9463f2a9eb361f946a0bac4bb629ec30f93ab7dae7487f2dfd65897deb` |
| copybook | `mainframe/workspace/Copybook/VM9BC50O.cpy` | 394 | `7d451f980d1a26c782b19aa96c70842e8a9d87603e0706616a08fed905780da5` |
| copybook | `mainframe/workspace/Copybook/VMBD05.cpy` | 322 | `530ffd3397f3c6fb680cf21d0dd60fa12bc34fb66d105ea816dc03646ae0e27c` |
| copybook | `mainframe/workspace/Copybook/VMBD205I.cpy` | 1414 | `80e1aa6b784c0fa192ebe27b3b03af9240cd0a0605574ed2179e77c265bd4dfb` |
| copybook | `mainframe/workspace/Copybook/VMBD510I.cpy` | 1632 | `9c86827c5a2a49f2c69b11ad987645beb641a6dce53c7c41fd3006746075c03a` |
| copybook | `mainframe/workspace/Copybook/VMBZ270I.cpy` | 23 | `db441dd9e51644d5e7edbcf1829916da454881d535cce510ed207c2bcdb1f193` |
| dclgen | `mainframe/workspace/DCLGen/DZ01RSTV.txt` | 36 | `60ae42a6c7a29185e8230972a5527a232a428f1686d2b90c6a4ec1092abfe342` |
| dclgen | `mainframe/workspace/DCLGen/DZBEFFTV.txt` | 62 | `1398746545f2fb02970f3d6838cd1e420b0ae56adec1bdd4bd49d25d1d22e6f8` |
| dclgen | `mainframe/workspace/DCLGen/DZBFARTV.txt` | 120 | `5cacab9f737c4972f5a6b7aa18212d2322dc5be3b007215a76b630888d7fcb8a` |
| dclgen | `mainframe/workspace/DCLGen/DZBFASTV.txt` | 196 | `00d7e8a369335eaf59644707b4a7f606d8aff550fea8902d1ad17437532f7e3d` |
| dclgen | `mainframe/workspace/DCLGen/DZEVEFTV.txt` | 50 | `acf0d8764ef53ecd00ae763c18bf26d209bb93099666983aaf98c4d2241f70da` |
| dclgen | `mainframe/workspace/DCLGen/DZSIASTV.txt` | 26 | `3ca4890e7d2612e213cdd0cc509a5391f9b698b7815e7b29b2451decae791439` |
| dclgen | `mainframe/workspace/DCLGen/DZWCEFTV.txt` | 28 | `93336302528ec4d2459101f71f7504f0f717e4a7443a833179287ce1538654e7` |
| mapping | `mainframe/workspace/Mapping Sheet/Field Mapping for IDMS to DB2_Final V 1.0_Manual.csv` | 877 | `1b093ae9f5527a7d4f0a7828bf6750ed703508aa38e666e8e209b17c823589cf` |
| subschema | `mainframe/workspace/Subschema/VMBTS03.txt` | 112 | `a1578229fa9086afc8b074cbd526c256099c1ddecfacf30acf5aaa64bdef6fdd` |
| subschema | `mainframe/workspace/Subschema/VMBTS06.txt` | 815 | `40b9b0048afa4e15b939f8a643e04496783084becffb4af42ea4f398b13cd3a0` |
| subschema | `mainframe/workspace/Subschema/VMBTS07.txt` | 191 | `afb3f285d544a5143adb721cbc15637a6fc485ea4f9abdb8e69aeda9a7085ba4` |

Physical line numbers refer to decoded files before formatting. Sequence columns are not line numbers. Snapshots are immutable and referenced in the companion JSON.

## Program evidence summaries

### idms: VM4BD310

Observed: 9 paragraph/section labels, 13 out-of-line PERFORM sites, 0 EXEC SQL blocks.
Verb inventory: `{'ADD': 2, 'BIND': 3, 'CALL': 4, 'CLOSE': 1, 'CONTINUE': 1, 'DISPLAY': 7, 'ELSE': 1, 'END-EVALUATE': 1, 'END-IF': 4, 'END-PERFORM': 1, 'END-READ': 1, 'EVALUATE': 1, 'EXIT': 1, 'FINISH': 1, 'IF': 4, 'INITIALIZE': 1, 'MOVE': 34, 'OBTAIN': 2, 'OPEN': 1, 'PERFORM': 14, 'READ': 1, 'READY': 1, 'SET': 2, 'STOP': 1, 'STRING': 3, 'WHEN': 2, 'WRITE': 1}`.
SQL inventory: `{}`.

| Caller | PERFORM target | THROUGH endpoint | Source lines |
|---|---|---|---|
| `MAIN` | `INIT-TREATMENT` | `-` | L123-L123 |
| `MAIN` | `TREAT-MUTATIES` | `-` | L124-L124 |
| `MAIN` | `END-TREATMENT` | `-` | L125-L125 |
| `INIT-TREATMENT` | `IDMS-STATUS` | `-` | L139-L139 |
| `INIT-TREATMENT` | `IDMS-STATUS` | `-` | L143-L143 |
| `INIT-TREATMENT` | `IDMS-STATUS` | `-` | L147-L147 |
| `INIT-TREATMENT` | `IDMS-STATUS` | `-` | L152-L152 |
| `INIT-TREATMENT` | `READ-MUTATIES` | `-` | L154-L155 |
| `END-TREATMENT` | `IDMS-STATUS` | `-` | L163-L163 |
| `TREAT-MUTATIES` | `SEARCH-MUTATIES` | `-` | L174-L174 |
| `TREAT-MUTATIES` | `MOVE-MUTATIES` | `-` | L175-L175 |
| `TREAT-MUTATIES` | `WRITE-MUTATIES` | `-` | L176-L176 |
| `TREAT-MUTATIES` | `READ-MUTATIES` | `-` | L177-L178 |

This is not a reachability proof. Paragraph numbering, PERFORM THRU boundaries, fall-through, SECTION scope and external routines must be reviewed separately.

SQL inventory (complete blocks and projections are in the companion JSON):

| Kind | Tables | Lines | Projection items |
|---|---|---|---:|

Extraction limitations:

- Lexical inventory only; no COPY expansion, full CFG, byte-layout proof, compiler, or runtime execution.

### manual: VMDZ4310

Observed: 9 paragraph/section labels, 13 out-of-line PERFORM sites, 7 EXEC SQL blocks.
Verb inventory: `{'ADD': 3, 'CALL': 1, 'CLOSE': 1, 'CONTINUE': 3, 'DISPLAY': 18, 'ELSE': 1, 'END-EVALUATE': 5, 'END-IF': 1, 'END-READ': 1, 'EVALUATE': 5, 'IF': 1, 'INITIALIZE': 6, 'MOVE': 71, 'OPEN': 1, 'PERFORM': 13, 'READ': 1, 'SET': 2, 'STOP': 1, 'STRING': 3, 'WHEN': 14, 'WRITE': 1}`.
SQL inventory: `{'INCLUDE': 5, 'SELECT': 2}`.

| Caller | PERFORM target | THROUGH endpoint | Source lines |
|---|---|---|---|
| `MAIN` | `1000-INIT-TREATMENT` | `-` | L178-L178 |
| `MAIN` | `2000-TREAT-MUTATIES` | `-` | L179-L179 |
| `MAIN` | `3000-END-TREATMENT` | `-` | L180-L180 |
| `1000-INIT-TREATMENT` | `1100-GET-TIMESTAMP` | `-` | L188-L188 |
| `1000-INIT-TREATMENT` | `1200-READ-MUTATIES` | `-` | L193-L194 |
| `2000-TREAT-MUTATIES` | `2100-SEARCH-MUTATIES` | `-` | L210-L210 |
| `2000-TREAT-MUTATIES` | `2200-MOVE-MUTATIES` | `-` | L211-L211 |
| `2000-TREAT-MUTATIES` | `2300-WRITE-MUTATIES` | `-` | L212-L212 |
| `2000-TREAT-MUTATIES` | `1200-READ-MUTATIES` | `-` | L213-L214 |
| `2100-SEARCH-MUTATIES` | `SQLERROR` | `-` | L278-L278 |
| `2100-SEARCH-MUTATIES` | `SQLERROR` | `-` | L288-L288 |
| `2100-SEARCH-MUTATIES` | `SQLERROR` | `-` | L336-L336 |
| `2100-SEARCH-MUTATIES` | `SQLERROR` | `-` | L346-L346 |

This is not a reachability proof. Paragraph numbering, PERFORM THRU boundaries, fall-through, SECTION scope and external routines must be reviewed separately.

SQL inventory (complete blocks and projections are in the companion JSON):

| Kind | Tables | Lines | Projection items |
|---|---|---|---:|
| INCLUDE | `` | L161-L161 | 0 |
| INCLUDE | `` | L162-L162 | 0 |
| INCLUDE | `` | L163-L163 | 0 |
| INCLUDE | `` | L164-L164 | 0 |
| SELECT | `DZBEFFTV` | L232-L263 | 12 |
| SELECT | `DZEVEFTV` | L303-L321 | 4 |
| INCLUDE | `` | L510-L512 | 0 |

Extraction limitations:

- Lexical inventory only; no COPY expansion, full CFG, byte-layout proof, compiler, or runtime execution.

## Comparison leads, not confirmed defects

### LEAD-3d4d7375725b4d: idms: PERFORM target not resolved in this member: IDMS-STATUS

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Program/VM4BD310.cbl:L139-L139` (SHA-256 `6b7753f96d95c167...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-2dfaa2c88fe315: idms: PERFORM target not resolved in this member: IDMS-STATUS

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Program/VM4BD310.cbl:L143-L143` (SHA-256 `6b7753f96d95c167...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-8f5948038c3975: idms: PERFORM target not resolved in this member: IDMS-STATUS

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Program/VM4BD310.cbl:L147-L147` (SHA-256 `6b7753f96d95c167...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-2daa6ac3ed8140: idms: PERFORM target not resolved in this member: IDMS-STATUS

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Program/VM4BD310.cbl:L152-L152` (SHA-256 `6b7753f96d95c167...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-2f30385c5ece8d: idms: PERFORM target not resolved in this member: IDMS-STATUS

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Program/VM4BD310.cbl:L163-L163` (SHA-256 `6b7753f96d95c167...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-40f9aa8ca0edcb: idms: dependency not available by exact member name: IDMS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Program/VM4BD310.cbl:L337-L337` (SHA-256 `6b7753f96d95c167...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-7f614d960ab1e9: manual: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4310.txt:L278-L278` (SHA-256 `5bac84467e8ea965...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-aeb6a3d1edcb47: manual: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4310.txt:L288-L288` (SHA-256 `5bac84467e8ea965...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-563a6007343ef2: manual: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4310.txt:L336-L336` (SHA-256 `5bac84467e8ea965...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-3de38b0611d5a9: manual: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4310.txt:L346-L346` (SHA-256 `5bac84467e8ea965...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-3bb9b1369826fb: manual: dependency not available by exact member name: VMDZ510I

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4310.txt:L150-L150` (SHA-256 `5bac84467e8ea965...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-92ba74884ee4b5: manual: dependency not available by exact member name: SQLERRWS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4310.txt:L161-L161` (SHA-256 `5bac84467e8ea965...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-27c07abf52e102: manual: dependency not available by exact member name: SQLCA

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4310.txt:L162-L162` (SHA-256 `5bac84467e8ea965...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-1a8c2f2dacd001: manual: dependency not available by exact member name: SQLERROR

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4310.txt:L510-L510` (SHA-256 `5bac84467e8ea965...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-8f7d13cf15cfb3: manual: repeated SELECT projection entries

Topic: `access_sql`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/05_SQL_CURSOR_AND_BUSINESS_FLOW.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4310.txt:L232-L263` (SHA-256 `5bac84467e8ea965...`)
entries: ['NX_CPCRESK_479BEFF']

### LEAD-c5732cb189edef: Map source IDMS operations to manual DB2 operations individually

Topic: `access_sql`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/05_SQL_CURSOR_AND_BUSINESS_FLOW.md` (routing hint only).

- `mainframe/workspace/Program/VM4BD310.cbl:L137-L138` (SHA-256 `6b7753f96d95c167...`)
- `mainframe/workspace/Manual Output/VMDZ4310.txt:L232-L263` (SHA-256 `5bac84467e8ea965...`)
manual_sql_block_count: 7
qualification: Counts do not imply a one-to-one mapping or equivalence.
source_operation_count: 7

## Mandatory semantic coverage

| Topic | Review status |
|---|---|
| purpose_io | NOT_REVIEWED |
| lr_idms_expansion | NOT_REVIEWED |
| access_sql | NOT_REVIEWED |
| keys_relationships | NOT_REVIEWED |
| cursor_control | NOT_REVIEWED |
| business_conditions | NOT_REVIEWED |
| fields_layout | NOT_REVIEWED |
| dates_nulls | NOT_REVIEWED |
| status_errors | NOT_REVIEWED |
| transactions_restart | NOT_REVIEWED |
| paragraph_wiring | NOT_REVIEWED |
| validation | NOT_REVIEWED |

There are 12 primary-source chunks. An AI must read every relevant chunk and dependencies; a short report is not a claim that all paths were analyzed.

## Human/AI semantic review pending

Use `packet` to prepare the bounded source-reading task, then `review-import` to attach a source-cited review. Do not hand-edit generated reports; keep draft Markdown in prompt/temp/.

## Production decision

**NOT CERTIFIED.** This knowledge collector never grants deployment approval. Confirmed reference behavior, target metadata, compiler output, and same-input runtime results remain separate evidence obligations.
