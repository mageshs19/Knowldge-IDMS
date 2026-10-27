# VMDZ7200: IDMS to manual DB2 baseline

Analysis fingerprint: `61dfa0efd19834525a33370e4b0a46eba62570b27a9150f8dd38b055aea2a86c`.

**Automated evidence inventory. Business equivalence is NOT established. No compiler or DB2 runtime validation is implied.**

The baseline excludes generated output and converter behavior. The gap track cannot establish its own expected behavior from the generated output.

## Input identities

| Role | File | Physical lines | SHA-256 |
|---|---|---:|---|
| idms | `mainframe/workspace/Program/VM7BD200.cbl` | 222 | `39675b0606a5855c1c4ab353a36160f36a4bd59a77d6ab231926a4f2667f7341` |
| manual | `mainframe/workspace/Manual Output/VMDZ7200.cbl` | 893 | `6eb2ef457d1eee332b84081d432b40b06d6a2a34fce3eeb4dd1a9cfeb14c5b44` |
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

### idms: VM7BD200

Observed: 7 paragraph/section labels, 3 out-of-line PERFORM sites, 0 EXEC SQL blocks.
Verb inventory: `{'ACCEPT': 1, 'ADD': 1, 'BIND': 2, 'CALL': 1, 'CLOSE': 3, 'DISPLAY': 2, 'ELSE': 2, 'END-IF': 3, 'EXIT': 3, 'FINISH': 1, 'GOBACK': 1, 'IF': 3, 'MOVE': 13, 'OBTAIN': 2, 'OPEN': 1, 'PERFORM': 3, 'READ': 1, 'READY': 1, 'WRITE': 1}`.
SQL inventory: `{}`.

| Caller | PERFORM target | THROUGH endpoint | Source lines |
|---|---|---|---|
| `<mainline>` | `BEGIN-PROGRAMMA` | `BEGIN-PROGRAMMA-EXIT` | L138-L138 |
| `<mainline>` | `BEHANDELING` | `BEHANDELING-EXIT` | L139-L140 |
| `<mainline>` | `EINDE-PROGRAMMA` | `EINDE-PROGRAMMA-EXIT` | L141-L141 |

This is not a reachability proof. Paragraph numbering, PERFORM THRU boundaries, fall-through, SECTION scope and external routines must be reviewed separately.

SQL inventory (complete blocks and projections are in the companion JSON):

| Kind | Tables | Lines | Projection items |
|---|---|---|---:|

Extraction limitations:

- Lexical inventory only; no COPY expansion, full CFG, byte-layout proof, compiler, or runtime execution.

### manual: VMDZ7200

Observed: 9 paragraph/section labels, 10 out-of-line PERFORM sites, 8 EXEC SQL blocks.
Verb inventory: `{'ACCEPT': 1, 'ADD': 1, 'CALL': 1, 'CLOSE': 2, 'CONTINUE': 1, 'DISPLAY': 11, 'ELSE': 2, 'END-EVALUATE': 11, 'END-IF': 2, 'EVALUATE': 11, 'EXIT': 2, 'GOBACK': 1, 'IF': 2, 'INITIALIZE': 3, 'MOVE': 161, 'OPEN': 1, 'PERFORM': 10, 'READ': 1, 'SET': 3, 'WHEN': 31, 'WRITE': 1}`.
SQL inventory: `{'CLOSE': 1, 'DECLARE': 1, 'FETCH': 1, 'INCLUDE': 4, 'OPEN': 1}`.

| Caller | PERFORM target | THROUGH endpoint | Source lines |
|---|---|---|---|
| `<mainline>` | `1000-BEGIN-PROGRAMMA` | `1000-BEGIN-PROGRAMMA-EXIT` | L386-L386 |
| `<mainline>` | `2000-TREAT-PROGRAM` | `-` | L387-L387 |
| `<mainline>` | `EINDE-PROGRAMMA` | `EINDE-PROGRAMMA-EXIT` | L388-L388 |
| `2100-OPEN-CURSOR-DZBFASC1` | `SQLERROR` | `-` | L439-L439 |
| `2200-FETCH-CURSOR-DZBFASC1` | `2300-BEHANDELING` | `-` | L536-L536 |
| `2200-FETCH-CURSOR-DZBFASC1` | `SQLERROR` | `-` | L555-L555 |
| `2400-CLOSE-CURSOR-DZBFASC1` | `SQLERROR` | `-` | L571-L571 |
| `2000-TREAT-PROGRAM` | `2100-OPEN-CURSOR-DZBFASC1` | `-` | L585-L585 |
| `2000-TREAT-PROGRAM` | `2200-FETCH-CURSOR-DZBFASC1` | `-` | L586-L586 |
| `2000-TREAT-PROGRAM` | `2400-CLOSE-CURSOR-DZBFASC1` | `-` | L587-L587 |

This is not a reachability proof. Paragraph numbering, PERFORM THRU boundaries, fall-through, SECTION scope and external routines must be reviewed separately.

SQL inventory (complete blocks and projections are in the companion JSON):

| Kind | Tables | Lines | Projection items |
|---|---|---|---:|
| INCLUDE | `` | L273-L273 | 0 |
| INCLUDE | `` | L274-L274 | 0 |
| INCLUDE | `` | L277-L277 | 0 |
| DECLARE | `DZBFASTV` | L280-L374 | 84 |
| OPEN | `` | L431-L433 | 0 |
| FETCH | `` | L446-L532 | 0 |
| CLOSE | `` | L561-L563 | 0 |
| INCLUDE | `` | L891-L893 | 0 |

Extraction limitations:

- Lexical inventory only; no COPY expansion, full CFG, byte-layout proof, compiler, or runtime execution.

## Comparison leads, not confirmed defects

### LEAD-1089708522c701: idms: dependency not available by exact member name: IDMS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Program/VM7BD200.cbl:L115-L115` (SHA-256 `39675b0606a5855c...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-b6f5303494a44c: idms: dependency not available by exact member name: IDMS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Program/VM7BD200.cbl:L117-L117` (SHA-256 `39675b0606a5855c...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-902ec2361ad625: idms: dependency not available by exact member name: IDMS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Program/VM7BD200.cbl:L119-L119` (SHA-256 `39675b0606a5855c...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-05d7a7ecb0ad7c: idms: dependency not available by exact member name: IDMS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Program/VM7BD200.cbl:L121-L121` (SHA-256 `39675b0606a5855c...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-ae83d1b6b1fc0a: idms: dependency not available by exact member name: IDMS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Program/VM7BD200.cbl:L123-L123` (SHA-256 `39675b0606a5855c...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-e007f0a40130db: idms: dependency not available by exact member name: IDMS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Program/VM7BD200.cbl:L125-L125` (SHA-256 `39675b0606a5855c...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-894d12da030e27: idms: dependency not available by exact member name: IDMS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Program/VM7BD200.cbl:L127-L127` (SHA-256 `39675b0606a5855c...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-a35f6f195d43b8: idms: dependency not available by exact member name: IDMS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Program/VM7BD200.cbl:L222-L222` (SHA-256 `39675b0606a5855c...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-a6512ea0e15772: manual: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L439-L439` (SHA-256 `6eb2ef457d1eee33...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-de4b1c97e056e3: manual: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L555-L555` (SHA-256 `6eb2ef457d1eee33...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-bf4122bf42fec6: manual: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L571-L571` (SHA-256 `6eb2ef457d1eee33...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-882de692f1cf11: manual: dependency not available by exact member name: VMDZ270I

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L200-L200` (SHA-256 `6eb2ef457d1eee33...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-803905ab87795d: manual: dependency not available by exact member name: SQLERRWS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L273-L273` (SHA-256 `6eb2ef457d1eee33...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-8d1517a2273b7a: manual: dependency not available by exact member name: SQLCA

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L274-L274` (SHA-256 `6eb2ef457d1eee33...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-52d5fde8d12188: manual: dependency not available by exact member name: SQLERROR

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L891-L891` (SHA-256 `6eb2ef457d1eee33...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-7fa6e5bb12641f: Map source IDMS operations to manual DB2 operations individually

Topic: `access_sql`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/05_SQL_CURSOR_AND_BUSINESS_FLOW.md` (routing hint only).

- `mainframe/workspace/Program/VM7BD200.cbl:L175-L175` (SHA-256 `39675b0606a5855c...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L280-L374` (SHA-256 `6eb2ef457d1eee33...`)
manual_sql_block_count: 8
qualification: Counts do not imply a one-to-one mapping or equivalence.
source_operation_count: 6

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

There are 15 primary-source chunks. An AI must read every relevant chunk and dependencies; a short report is not a claim that all paths were analyzed.

## Human/AI semantic review pending

Use `packet` to prepare the bounded source-reading task, then `review-import` to attach a source-cited review. Do not hand-edit generated reports; keep draft Markdown in prompt/temp/.

## Production decision

**NOT CERTIFIED.** This knowledge collector never grants deployment approval. Confirmed reference behavior, target metadata, compiler output, and same-input runtime results remain separate evidence obligations.
