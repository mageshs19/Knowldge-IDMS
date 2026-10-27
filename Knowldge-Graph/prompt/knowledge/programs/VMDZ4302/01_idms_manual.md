# VMDZ4302: IDMS to manual DB2 baseline

Analysis fingerprint: `f26c5d290a9ab78198648df89248e93802bdd84c04b10cbac6afbadced1857ed`.

**Automated evidence inventory. Business equivalence is NOT established. No compiler or DB2 runtime validation is implied.**

The baseline excludes generated output and converter behavior. The gap track cannot establish its own expected behavior from the generated output.

## Input identities

| Role | File | Physical lines | SHA-256 |
|---|---|---:|---|
| idms | `mainframe/workspace/Program/VM4BD302.cbl` | 337 | `a51d9730816ce366497308324b517da42e389c055f64ee6b746aca872f0e7c17` |
| manual | `mainframe/workspace/Manual Output/VMDZ4302.txt` | 671 | `25f5d74ab01f76fc77157cb77d5bd83b36511e58320f8737f1225d8a3ffc2d5c` |
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

### idms: VM4BD302

Observed: 4 paragraph/section labels, 4 out-of-line PERFORM sites, 0 EXEC SQL blocks.
Verb inventory: `{'ACCEPT': 1, 'ADD': 2, 'BIND': 4, 'CALL': 7, 'CLOSE': 1, 'CONTINUE': 1, 'DISPLAY': 15, 'ELSE': 5, 'END-IF': 17, 'END-READ': 2, 'FINISH': 1, 'IF': 17, 'INITIALIZE': 2, 'MOVE': 40, 'OBTAIN': 5, 'OPEN': 1, 'PERFORM': 4, 'READ': 2, 'READY': 2, 'STOP': 1, 'SUBTRACT': 2, 'WRITE': 1}`.
SQL inventory: `{}`.

| Caller | PERFORM target | THROUGH endpoint | Source lines |
|---|---|---|---|
| `<mainline>` | `VERWERK-EMISSIONS` | `-` | L224-L224 |
| `VERWERK-EMISSIONS` | `CALL-VM9BC50T` | `-` | L238-L238 |
| `VERWERK-EMISSIONS` | `VERWERK-EFFEKT` | `-` | L254-L254 |
| `VERWERK-EFFEKT` | `NEXT-VMBEVEF` | `-` | L268-L268 |

This is not a reachability proof. Paragraph numbering, PERFORM THRU boundaries, fall-through, SECTION scope and external routines must be reviewed separately.

SQL inventory (complete blocks and projections are in the companion JSON):

| Kind | Tables | Lines | Projection items |
|---|---|---|---:|

Extraction limitations:

- Lexical inventory only; no COPY expansion, full CFG, byte-layout proof, compiler, or runtime execution.
- Complex dialect/control constructs need source-level review; inventory does not execute them.

### manual: VMDZ4302

Observed: 14 paragraph/section labels, 22 out-of-line PERFORM sites, 15 EXEC SQL blocks.
Verb inventory: `{'ACCEPT': 1, 'ADD': 5, 'CALL': 1, 'CLOSE': 1, 'CONTINUE': 3, 'DISPLAY': 33, 'ELSE': 5, 'END-EVALUATE': 8, 'END-IF': 12, 'END-READ': 1, 'EVALUATE': 8, 'IF': 12, 'INITIALIZE': 7, 'MOVE': 75, 'OPEN': 1, 'PERFORM': 22, 'READ': 1, 'SET': 5, 'STOP': 1, 'SUBTRACT': 2, 'WHEN': 20, 'WRITE': 1}`.
SQL inventory: `{'CLOSE': 2, 'DECLARE': 2, 'FETCH': 2, 'INCLUDE': 6, 'OPEN': 2, 'SELECT': 1}`.

| Caller | PERFORM target | THROUGH endpoint | Source lines |
|---|---|---|---|
| `<mainline>` | `600-GET-TIMESTAMP` | `-` | L282-L282 |
| `<mainline>` | `READ-INPUT` | `-` | L288-L288 |
| `<mainline>` | `VERWERK-EMISSIONS` | `-` | L290-L290 |
| `VERWERK-EMISSIONS` | `CALL-VM9BC50T` | `-` | L320-L320 |
| `VERWERK-EMISSIONS` | `700-SELECT-DZWCEFTV` | `-` | L332-L332 |
| `VERWERK-EMISSIONS` | `READ-INPUT` | `-` | L334-L335 |
| `200-PROCESS-DZBEFFC1` | `710-OPEN-DZBEFFC1` | `-` | L343-L343 |
| `200-PROCESS-DZBEFFC1` | `720-FETCH-DZBEFFC1` | `-` | L344-L344 |
| `200-PROCESS-DZBEFFC1` | `730-CLOSE-DZBEFFC1` | `-` | L345-L346 |
| `200-CHECK-CHILD-EVEF` | `810-OPEN-DZEVEFC1` | `-` | L358-L358 |
| `200-CHECK-CHILD-EVEF` | `820-FETCH-DZEVEFC1` | `-` | L360-L360 |
| `200-CHECK-CHILD-EVEF` | `830-CLOSE-DZEVEFC1` | `-` | L362-L362 |
| `700-SELECT-DZWCEFTV` | `200-PROCESS-DZBEFFC1` | `-` | L504-L504 |
| `700-SELECT-DZWCEFTV` | `SQLERROR` | `-` | L521-L521 |
| `710-OPEN-DZBEFFC1` | `SQLERROR` | `-` | L540-L540 |
| `720-FETCH-DZBEFFC1` | `200-CHECK-CHILD-EVEF` | `-` | L562-L562 |
| `720-FETCH-DZBEFFC1` | `SQLERROR` | `-` | L573-L573 |
| `730-CLOSE-DZBEFFC1` | `SQLERROR` | `-` | L592-L592 |
| `810-OPEN-DZEVEFC1` | `SQLERROR` | `-` | L611-L611 |
| `820-FETCH-DZEVEFC1` | `NEXT-EVEF` | `-` | L633-L633 |
| `820-FETCH-DZEVEFC1` | `SQLERROR` | `-` | L646-L646 |
| `830-CLOSE-DZEVEFC1` | `SQLERROR` | `-` | L665-L665 |

This is not a reachability proof. Paragraph numbering, PERFORM THRU boundaries, fall-through, SECTION scope and external routines must be reviewed separately.

SQL inventory (complete blocks and projections are in the companion JSON):

| Kind | Tables | Lines | Projection items |
|---|---|---|---:|
| INCLUDE | `` | L204-L204 | 0 |
| INCLUDE | `` | L205-L205 | 0 |
| INCLUDE | `` | L208-L208 | 0 |
| INCLUDE | `` | L209-L209 | 0 |
| INCLUDE | `` | L210-L210 | 0 |
| DECLARE | `DZBEFFTV` | L215-L227 | 5 |
| DECLARE | `DZEVEFTV` | L232-L247 | 6 |
| SELECT | `DZWCEFTV` | L492-L500 | 1 |
| OPEN | `` | L531-L533 | 0 |
| FETCH | `` | L550-L557 | 0 |
| CLOSE | `` | L583-L585 | 0 |
| OPEN | `` | L602-L604 | 0 |
| FETCH | `` | L621-L629 | 0 |
| CLOSE | `` | L656-L658 | 0 |
| INCLUDE | `` | L669-L671 | 0 |

Extraction limitations:

- Lexical inventory only; no COPY expansion, full CFG, byte-layout proof, compiler, or runtime execution.
- Debug indicator lines exist; compiler debug mode is not established.
- Complex dialect/control constructs need source-level review; inventory does not execute them.

## Comparison leads, not confirmed defects

### LEAD-9fa231b4e4c7e3: idms: dependency not available by exact member name: IDMS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Program/VM4BD302.cbl:L63-L63` (SHA-256 `a51d9730816ce366...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-37ac6babefdb12: idms: dependency not available by exact member name: IDMS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Program/VM4BD302.cbl:L64-L64` (SHA-256 `a51d9730816ce366...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-0cd750d293c8ad: idms: dependency not available by exact member name: IDMS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Program/VM4BD302.cbl:L65-L65` (SHA-256 `a51d9730816ce366...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-48aef8bd835288: idms: dependency not available by exact member name: IDMS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Program/VM4BD302.cbl:L66-L66` (SHA-256 `a51d9730816ce366...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-548f30d82495f0: idms: dependency not available by exact member name: IDMS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Program/VM4BD302.cbl:L67-L67` (SHA-256 `a51d9730816ce366...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-e6141006a18187: idms: dependency not available by exact member name: IDMS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Program/VM4BD302.cbl:L68-L68` (SHA-256 `a51d9730816ce366...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-5a8d6ba69b261c: idms: dependency not available by exact member name: IDMS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Program/VM4BD302.cbl:L69-L69` (SHA-256 `a51d9730816ce366...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-cbf3ea6920fe65: idms: dependency not available by exact member name: IDMS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Program/VM4BD302.cbl:L70-L70` (SHA-256 `a51d9730816ce366...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-d17aa3f80eb14d: idms: dependency not available by exact member name: IDMS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Program/VM4BD302.cbl:L71-L71` (SHA-256 `a51d9730816ce366...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-e92a7982e3f574: manual: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4302.txt:L521-L521` (SHA-256 `25f5d74ab01f76fc...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-47654900e981f4: manual: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4302.txt:L540-L540` (SHA-256 `25f5d74ab01f76fc...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-59bf3e2244c058: manual: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4302.txt:L573-L573` (SHA-256 `25f5d74ab01f76fc...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-f468da5013b92a: manual: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4302.txt:L592-L592` (SHA-256 `25f5d74ab01f76fc...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-865b9f1aabda28: manual: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4302.txt:L611-L611` (SHA-256 `25f5d74ab01f76fc...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-37ce265eb83548: manual: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4302.txt:L646-L646` (SHA-256 `25f5d74ab01f76fc...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-dea708f52ce813: manual: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4302.txt:L665-L665` (SHA-256 `25f5d74ab01f76fc...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-440b25b647de93: manual: dependency not available by exact member name: SQLERRWS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4302.txt:L204-L204` (SHA-256 `25f5d74ab01f76fc...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-2cfa627f33cc5e: manual: dependency not available by exact member name: SQLCA

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4302.txt:L205-L205` (SHA-256 `25f5d74ab01f76fc...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-ef1820a6ec2196: manual: dependency not available by exact member name: SQLERROR

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4302.txt:L669-L669` (SHA-256 `25f5d74ab01f76fc...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-391b0174d9936b: Map source IDMS operations to manual DB2 operations individually

Topic: `access_sql`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/05_SQL_CURSOR_AND_BUSINESS_FLOW.md` (routing hint only).

- `mainframe/workspace/Program/VM4BD302.cbl:L180-L180` (SHA-256 `a51d9730816ce366...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L215-L227` (SHA-256 `25f5d74ab01f76fc...`)
manual_sql_block_count: 15
qualification: Counts do not imply a one-to-one mapping or equivalence.
source_operation_count: 12

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

There are 14 primary-source chunks. An AI must read every relevant chunk and dependencies; a short report is not a claim that all paths were analyzed.

## Human/AI semantic review pending

Use `packet` to prepare the bounded source-reading task, then `review-import` to attach a source-cited review. Do not hand-edit generated reports; keep draft Markdown in prompt/temp/.

## Production decision

**NOT CERTIFIED.** This knowledge collector never grants deployment approval. Confirmed reference behavior, target metadata, compiler output, and same-input runtime results remain separate evidence obligations.
