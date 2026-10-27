# VMDZ7200: Engine output gap analysis

Analysis fingerprint: `0744e855805739c47a3121de2c20e26195b038a50d27be22cf60faa66c5e4659`.

**Automated evidence inventory. Business equivalence is NOT established. No compiler or DB2 runtime validation is implied.**

The baseline excludes generated output and converter behavior. The gap track cannot establish its own expected behavior from the generated output.

## Input identities

| Role | File | Physical lines | SHA-256 |
|---|---|---:|---|
| idms | `mainframe/workspace/Program/VM7BD200.cbl` | 222 | `39675b0606a5855c1c4ab353a36160f36a4bd59a77d6ab231926a4f2667f7341` |
| manual | `mainframe/workspace/Manual Output/VMDZ7200.cbl` | 893 | `6eb2ef457d1eee332b84081d432b40b06d6a2a34fce3eeb4dd1a9cfeb14c5b44` |
| generated | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl` | 928 | `e0778ed461f118759e9fed0951e6299888777414bc29f74fb1a6528ad1f2ae54` |
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
| engine_log | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/engine.log` | 52 | `17c1493211b5c222a167fb2bf6d352ff7c9387eefb4768cdfc1b206cad59e9ff` |
| engine_review | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Review/VMDZ7200_27-10-2026_003341_27-10-2026_003345.csv` | 166 | `3c296f4b36391d0ebbed1312aa35d26f0863ba94cb2f1b10741d3a12364b2fe7` |
| engine_review | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Review/VMDZ7200_27-10-2026_003341_27-10-2026_003345.txt` | 142 | `b07a3d26ce984d42c874bc02281d4d2251b0e8920b744576847caec00a818c15` |
| engine_review | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Review/semantic_release_gate.txt` | 21 | `21d6192febd41b60567937bfbe312a27dd028771d9105819ae8316d200603c4b` |
| derived_copybook | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/Generated Copybooks/VMDZ205I.cpy` | 1414 | `2833e918d09b4ac3d0869bfe5aa747da130f01220dcecd767f77f4a57986f593` |
| derived_copybook | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/Generated Copybooks/VMDZ270I.cpy` | 23 | `dc180b0c545c1017260f0fdba657ffbbc0d0464c3d1038a1cf9558bce0fef74b` |
| derived_copybook | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/Generated Copybooks/VMDZ510I.cpy` | 1632 | `66b815b9d71c3c87cc42f8c44d5fab4e95bb2c97a47a54014202968cc89626b3` |
| engine_receipt | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/receipt.json` | 954 | `8253fcced5d83d676932314cde25743fc623222c70d234d63f2dc953a8833659` |

Generation provenance: `{'documented_engine_hash_matches': True, 'engine_exit_code': 2, 'original_input_hashes_match': True, 'production_approved': False, 'status': 'BOUND_CAPTURE_RECEIPT'}`. A bound receipt records a run, not a successful conversion or business equivalence.


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

### generated: VMDZ7200

Observed: 12 paragraph/section labels, 11 out-of-line PERFORM sites, 8 EXEC SQL blocks.
Verb inventory: `{'ACCEPT': 1, 'ADD': 3, 'CALL': 1, 'CLOSE': 3, 'CONTINUE': 1, 'DISPLAY': 20, 'ELSE': 2, 'END-EVALUATE': 13, 'END-IF': 3, 'EVALUATE': 13, 'EXIT': 3, 'GOBACK': 1, 'IF': 3, 'INITIALIZE': 1, 'MOVE': 174, 'OPEN': 1, 'PERFORM': 11, 'READ': 1, 'SET': 3, 'WHEN': 37, 'WRITE': 1}`.
SQL inventory: `{'CLOSE': 1, 'DECLARE': 1, 'FETCH': 1, 'INCLUDE': 4, 'OPEN': 1}`.

| Caller | PERFORM target | THROUGH endpoint | Source lines |
|---|---|---|---|
| `<mainline>` | `600-GET-TIMESTAMP` | `-` | L397-L397 |
| `<mainline>` | `BEGIN-PROGRAMMA` | `BEGIN-PROGRAMMA-EXIT` | L398-L398 |
| `<mainline>` | `2200-FETCH-DZBFASC1` | `-` | L399-L399 |
| `<mainline>` | `2300-CLOSE-DZBFASC1` | `-` | L400-L400 |
| `<mainline>` | `EINDE-PROGRAMMA` | `EINDE-PROGRAMMA-EXIT` | L401-L401 |
| `BEGIN-PROGRAMMA` | `2100-OPEN-DZBFASC1` | `-` | L442-L442 |
| `BEHANDELING` | `WRITE-FORM-REC` | `-` | L485-L485 |
| `2100-OPEN-DZBFASC1` | `SQLERROR` | `-` | L784-L784 |
| `2200-FETCH-DZBFASC1` | `BEHANDELING` | `BEHANDELING-EXIT` | L884-L884 |
| `2200-FETCH-DZBFASC1` | `SQLERROR` | `-` | L889-L889 |
| `2300-CLOSE-DZBFASC1` | `SQLERROR` | `-` | L906-L906 |

This is not a reachability proof. Paragraph numbering, PERFORM THRU boundaries, fall-through, SECTION scope and external routines must be reviewed separately.

SQL inventory (complete blocks and projections are in the companion JSON):

| Kind | Tables | Lines | Projection items |
|---|---|---|---:|
| INCLUDE | `` | L233-L233 | 0 |
| INCLUDE | `` | L234-L234 | 0 |
| INCLUDE | `` | L235-L235 | 0 |
| DECLARE | `DZBFASTV` | L242-L331 | 84 |
| OPEN | `` | L775-L777 | 0 |
| FETCH | `` | L793-L879 | 0 |
| CLOSE | `` | L897-L899 | 0 |
| INCLUDE | `` | L926-L928 | 0 |

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

### LEAD-ab6862b330c06c: generated: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L784-L784` (SHA-256 `e0778ed461f11875...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-6b5bc1c8f721f5: generated: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L889-L889` (SHA-256 `e0778ed461f11875...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-114db00fc67952: generated: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L906-L906` (SHA-256 `e0778ed461f11875...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-6972fe2b6bb8f1: generated: dependency not available by exact member name: SQLERRWS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L233-L233` (SHA-256 `e0778ed461f11875...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-133a41a8c2f579: generated: dependency not available by exact member name: SQLCA

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L234-L234` (SHA-256 `e0778ed461f11875...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-855edf1995014d: generated: dependency not available by exact member name: SQLERROR

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L926-L926` (SHA-256 `e0778ed461f11875...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-3801db7921f395: Manual/generated DECLARE blocks differ lexically

Topic: `access_sql`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/05_SQL_CURSOR_AND_BUSINESS_FLOW.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L280-L374` (SHA-256 `6eb2ef457d1eee33...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L242-L331` (SHA-256 `e0778ed461f11875...`)
generated_blocks: 1
manual_blocks: 1
qualification: Projection ordering, QUERYNO, host spelling or equivalent strategies can explain differences. Map by operation, keys and effect.

### LEAD-f15e155cacedeb: Manual/generated FETCH blocks differ lexically

Topic: `access_sql`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/05_SQL_CURSOR_AND_BUSINESS_FLOW.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L446-L532` (SHA-256 `6eb2ef457d1eee33...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L793-L879` (SHA-256 `e0778ed461f11875...`)
generated_blocks: 1
manual_blocks: 1
qualification: Projection ordering, QUERYNO, host spelling or equivalent strategies can explain differences. Map by operation, keys and effect.

### LEAD-631af5c457c0bc: Manual/generated READ/REWRITE/WRITE statements need effect-level comparison

Topic: `purpose_io`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/04_LR_IDMS_DB2_CONVERSION.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L410-L411` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L879-L880` (SHA-256 `6eb2ef457d1eee33...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L431-L432` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L753-L753` (SHA-256 `e0778ed461f11875...`)
generated_statements: 2
manual_statements: 2
qualification: Not a missing-logic verdict. Helpers, numbering, control restructuring or SQL filtering may preserve behavior.

### LEAD-f43fc1fb599019: Manual/generated EVALUATE/IF/WHEN statements need effect-level comparison

Topic: `business_conditions`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/05_SQL_CURSOR_AND_BUSINESS_FLOW.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L394-L394` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L397-L397` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L434-L434` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L435-L435` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L437-L437` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L534-L534` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L535-L535` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L537-L537` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L539-L539` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L565-L565` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L566-L566` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L568-L568` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L605-L605` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L606-L606` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L608-L608` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L610-L610` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L627-L627` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L628-L628` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L630-L630` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L632-L632` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L652-L652` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L653-L653` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L655-L655` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L657-L657` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L667-L667` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L668-L668` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L670-L670` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L672-L672` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L700-L700` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L701-L701` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L703-L703` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L705-L705` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L795-L795` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L796-L796` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L798-L798` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L800-L800` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L810-L810` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L811-L811` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L813-L813` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L815-L815` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L843-L843` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L844-L844` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L846-L846` (SHA-256 `6eb2ef457d1eee33...`)
- `mainframe/workspace/Manual Output/VMDZ7200.cbl:L848-L848` (SHA-256 `6eb2ef457d1eee33...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L412-L412` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L415-L415` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L456-L456` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L457-L457` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L459-L459` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L461-L461` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L470-L470` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L471-L471` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L473-L473` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L475-L475` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L481-L484` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L509-L509` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L510-L510` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L512-L512` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L514-L514` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L529-L529` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L530-L530` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L532-L532` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L534-L534` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L551-L551` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L552-L552` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L554-L554` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L556-L556` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L563-L563` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L564-L564` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L566-L566` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L568-L568` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L593-L593` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L594-L594` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L596-L596` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L598-L598` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L681-L681` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L682-L682` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L684-L684` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L686-L686` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L693-L693` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L694-L694` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L696-L696` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L698-L698` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L723-L723` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L724-L724` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L726-L726` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L728-L728` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L779-L779` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L780-L780` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L782-L782` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L881-L881` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L882-L882` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L885-L885` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L887-L887` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L901-L901` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L902-L902` (SHA-256 `e0778ed461f11875...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ7200_27-10-2026_003341.cbl:L904-L904` (SHA-256 `e0778ed461f11875...`)
generated_statements: 53
manual_statements: 44
qualification: Not a missing-logic verdict. Helpers, numbering, control restructuring or SQL filtering may preserve behavior.

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

There are 27 primary-source chunks. An AI must read every relevant chunk and dependencies; a short report is not a claim that all paths were analyzed.

## Human/AI semantic review pending

Use `packet` to prepare the bounded source-reading task, then `review-import` to attach a source-cited review. Do not hand-edit generated reports; keep draft Markdown in prompt/temp/.

## Production decision

**NOT CERTIFIED.** This knowledge collector never grants deployment approval. Confirmed reference behavior, target metadata, compiler output, and same-input runtime results remain separate evidence obligations.
