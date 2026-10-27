# VMDZ4420: Engine output gap analysis

Analysis fingerprint: `223bbd92281e967fb64cb0d27d2260aca8cff3ce44493109915b6551a0d2d7d3`.

**Automated evidence inventory. Business equivalence is NOT established. No compiler or DB2 runtime validation is implied.**

The baseline excludes generated output and converter behavior. The gap track cannot establish its own expected behavior from the generated output.

## Input identities

| Role | File | Physical lines | SHA-256 |
|---|---|---:|---|
| idms | `mainframe/workspace/Program/VM4BD420.cbl` | 228 | `5239aa4d02575a5eae3148aa49803b5cdbd82dc7ebe4b4664f28e02d06d807d9` |
| manual | `mainframe/workspace/Manual Output/VMDZ4420.cbl` | 499 | `6472953d46f42b11bb9443b0beead6b88871a678fbe90ede4ef7742fb3fa0265` |
| generated | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4420_27-10-2026_003340.cbl` | 500 | `8b1b032af29a9a6c7d36476f6c8c279658d60e498d10c8074315575c90187eed` |
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
| engine_review | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Review/VMDZ4420_27-10-2026_003340_27-10-2026_003345.csv` | 175 | `b602455dace376663a993667aa164cee0fb68948b2389b0a819ebee1ea641ec8` |
| engine_review | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Review/VMDZ4420_27-10-2026_003340_27-10-2026_003345.txt` | 139 | `758797410bd83e7ccd750380f76e964503f550c8c04d275353ca62c20b12de73` |
| engine_review | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Review/semantic_release_gate.txt` | 21 | `21d6192febd41b60567937bfbe312a27dd028771d9105819ae8316d200603c4b` |
| derived_copybook | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/Generated Copybooks/VMDZ205I.cpy` | 1414 | `2833e918d09b4ac3d0869bfe5aa747da130f01220dcecd767f77f4a57986f593` |
| derived_copybook | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/Generated Copybooks/VMDZ270I.cpy` | 23 | `dc180b0c545c1017260f0fdba657ffbbc0d0464c3d1038a1cf9558bce0fef74b` |
| derived_copybook | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/Generated Copybooks/VMDZ510I.cpy` | 1632 | `66b815b9d71c3c87cc42f8c44d5fab4e95bb2c97a47a54014202968cc89626b3` |
| engine_receipt | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/receipt.json` | 954 | `8253fcced5d83d676932314cde25743fc623222c70d234d63f2dc953a8833659` |

Generation provenance: `{'documented_engine_hash_matches': True, 'engine_exit_code': 2, 'original_input_hashes_match': True, 'production_approved': False, 'status': 'BOUND_CAPTURE_RECEIPT'}`. A bound receipt records a run, not a successful conversion or business equivalence.


Physical line numbers refer to decoded files before formatting. Sequence columns are not line numbers. Snapshots are immutable and referenced in the companion JSON.

## Program evidence summaries

### idms: VM4BD420

Observed: 3 paragraph/section labels, 9 out-of-line PERFORM sites, 0 EXEC SQL blocks.
Verb inventory: `{'ACCEPT': 1, 'BIND': 3, 'CALL': 2, 'CLOSE': 1, 'DISPLAY': 4, 'ELSE': 5, 'END-IF': 10, 'EXIT': 1, 'FIND': 1, 'FINISH': 1, 'IF': 10, 'MOVE': 25, 'OBTAIN': 4, 'OPEN': 1, 'PERFORM': 9, 'READY': 1, 'STOP': 1, 'WRITE': 1}`.
SQL inventory: `{}`.

| Caller | PERFORM target | THROUGH endpoint | Source lines |
|---|---|---|---|
| `<mainline>` | `IDMS-STATUS` | `-` | L152-L152 |
| `<mainline>` | `IDMS-STATUS` | `-` | L154-L154 |
| `<mainline>` | `IDMS-STATUS` | `-` | L156-L156 |
| `<mainline>` | `IDMS-STATUS` | `-` | L158-L158 |
| `<mainline>` | `HOOFDVERWERKING` | `-` | L165-L166 |
| `HOOFDVERWERKING` | `IDMS-STATUS` | `-` | L178-L178 |
| `HOOFDVERWERKING` | `VERWERK-VMBEVEF` | `-` | L181-L182 |
| `HOOFDVERWERKING` | `IDMS-STATUS` | `-` | L187-L187 |
| `VERWERK-VMBEVEF` | `IDMS-STATUS` | `-` | L191-L191 |

This is not a reachability proof. Paragraph numbering, PERFORM THRU boundaries, fall-through, SECTION scope and external routines must be reviewed separately.

SQL inventory (complete blocks and projections are in the companion JSON):

| Kind | Tables | Lines | Projection items |
|---|---|---|---:|

Extraction limitations:

- Lexical inventory only; no COPY expansion, full CFG, byte-layout proof, compiler, or runtime execution.

### manual: VMDZ4420

Observed: 10 paragraph/section labels, 16 out-of-line PERFORM sites, 13 EXEC SQL blocks.
Verb inventory: `{'ACCEPT': 1, 'ADD': 2, 'CALL': 2, 'CLOSE': 1, 'CONTINUE': 2, 'DISPLAY': 24, 'ELSE': 5, 'END-EVALUATE': 8, 'END-IF': 9, 'EVALUATE': 8, 'IF': 9, 'INITIALIZE': 3, 'MOVE': 56, 'OPEN': 1, 'PERFORM': 16, 'SET': 4, 'STOP': 1, 'WHEN': 20, 'WRITE': 1}`.
SQL inventory: `{'CLOSE': 2, 'DECLARE': 2, 'FETCH': 2, 'INCLUDE': 5, 'OPEN': 2}`.

| Caller | PERFORM target | THROUGH endpoint | Source lines |
|---|---|---|---|
| `<mainline>` | `600-GET-TIMESTAMP` | `-` | L241-L241 |
| `<mainline>` | `710-OPEN-DZBEFFC1` | `-` | L247-L247 |
| `<mainline>` | `720-FETCH-DZBEFFC1` | `-` | L248-L248 |
| `<mainline>` | `730-CLOSE-DZBEFFC1` | `-` | L249-L249 |
| `HOOFDVERWERKING` | `810-OPEN-DZEVEFC1` | `-` | L266-L266 |
| `HOOFDVERWERKING` | `820-FETCH-DZEVEFC1` | `-` | L269-L270 |
| `HOOFDVERWERKING` | `830-CLOSE-DZEVEFC1` | `-` | L271-L271 |
| `HOOFDVERWERKING` | `WRITE-UITRECORD` | `-` | L276-L276 |
| `710-OPEN-DZBEFFC1` | `SQLERROR` | `-` | L370-L370 |
| `720-FETCH-DZBEFFC1` | `HOOFDVERWERKING` | `-` | L396-L396 |
| `720-FETCH-DZBEFFC1` | `SQLERROR` | `-` | L401-L401 |
| `730-CLOSE-DZBEFFC1` | `SQLERROR` | `-` | L420-L420 |
| `810-OPEN-DZEVEFC1` | `SQLERROR` | `-` | L439-L439 |
| `820-FETCH-DZEVEFC1` | `VERWERK-VMBEVEF` | `-` | L460-L460 |
| `820-FETCH-DZEVEFC1` | `SQLERROR` | `-` | L473-L473 |
| `830-CLOSE-DZEVEFC1` | `SQLERROR` | `-` | L492-L492 |

This is not a reachability proof. Paragraph numbering, PERFORM THRU boundaries, fall-through, SECTION scope and external routines must be reviewed separately.

SQL inventory (complete blocks and projections are in the companion JSON):

| Kind | Tables | Lines | Projection items |
|---|---|---|---:|
| INCLUDE | `` | L154-L154 | 0 |
| INCLUDE | `` | L155-L155 | 0 |
| INCLUDE | `` | L158-L158 | 0 |
| INCLUDE | `` | L159-L159 | 0 |
| DECLARE | `DZBEFFTV` | L164-L177 | 9 |
| DECLARE | `DZEVEFTV` | L182-L196 | 5 |
| OPEN | `` | L361-L363 | 0 |
| FETCH | `` | L380-L391 | 0 |
| CLOSE | `` | L411-L413 | 0 |
| OPEN | `` | L430-L432 | 0 |
| FETCH | `` | L449-L456 | 0 |
| CLOSE | `` | L483-L485 | 0 |
| INCLUDE | `` | L497-L499 | 0 |

Extraction limitations:

- Lexical inventory only; no COPY expansion, full CFG, byte-layout proof, compiler, or runtime execution.
- Debug indicator lines exist; compiler debug mode is not established.

### generated: VMDZ4420

Observed: 11 paragraph/section labels, 16 out-of-line PERFORM sites, 13 EXEC SQL blocks.
Verb inventory: `{'ACCEPT': 1, 'ADD': 2, 'CALL': 2, 'CLOSE': 1, 'CONTINUE': 2, 'DISPLAY': 27, 'ELSE': 5, 'END-EVALUATE': 8, 'END-IF': 9, 'EVALUATE': 8, 'IF': 9, 'INITIALIZE': 3, 'MOVE': 57, 'OPEN': 1, 'PERFORM': 16, 'SET': 6, 'STOP': 1, 'WHEN': 20, 'WRITE': 1}`.
SQL inventory: `{'CLOSE': 2, 'DECLARE': 2, 'FETCH': 2, 'INCLUDE': 5, 'OPEN': 2}`.

| Caller | PERFORM target | THROUGH endpoint | Source lines |
|---|---|---|---|
| `<mainline>` | `600-GET-TIMESTAMP` | `-` | L214-L214 |
| `ES-TYPE-DAG` | `2100-OPEN-DZBEFFC1` | `-` | L251-L251 |
| `ES-TYPE-DAG` | `2200-FETCH-DZBEFFC1` | `-` | L252-L252 |
| `ES-TYPE-DAG` | `2300-CLOSE-DZBEFFC1` | `-` | L256-L256 |
| `HOOFDVERWERKING` | `3100-OPEN-DZEVEFC1` | `-` | L273-L273 |
| `HOOFDVERWERKING` | `3200-FETCH-DZEVEFC1` | `-` | L275-L276 |
| `HOOFDVERWERKING` | `3300-CLOSE-DZEVEFC1` | `-` | L277-L277 |
| `HOOFDVERWERKING` | `WRITE-UITRECORD` | `-` | L280-L280 |
| `2100-OPEN-DZBEFFC1` | `SQLERROR` | `-` | L364-L364 |
| `2200-FETCH-DZBEFFC1` | `HOOFDVERWERKING` | `-` | L389-L389 |
| `2200-FETCH-DZBEFFC1` | `SQLERROR` | `-` | L394-L394 |
| `2300-CLOSE-DZBEFFC1` | `SQLERROR` | `-` | L411-L411 |
| `3100-OPEN-DZEVEFC1` | `SQLERROR` | `-` | L428-L428 |
| `3200-FETCH-DZEVEFC1` | `VERWERK-VMBEVEF` | `-` | L448-L448 |
| `3200-FETCH-DZEVEFC1` | `SQLERROR` | `-` | L461-L461 |
| `3300-CLOSE-DZEVEFC1` | `SQLERROR` | `-` | L478-L478 |

This is not a reachability proof. Paragraph numbering, PERFORM THRU boundaries, fall-through, SECTION scope and external routines must be reviewed separately.

SQL inventory (complete blocks and projections are in the companion JSON):

| Kind | Tables | Lines | Projection items |
|---|---|---|---:|
| INCLUDE | `` | L108-L108 | 0 |
| INCLUDE | `` | L109-L109 | 0 |
| INCLUDE | `` | L110-L110 | 0 |
| INCLUDE | `` | L111-L111 | 0 |
| DECLARE | `DZBEFFTV` | L122-L135 | 9 |
| DECLARE | `DZEVEFTV` | L137-L151 | 5 |
| OPEN | `` | L355-L357 | 0 |
| FETCH | `` | L373-L384 | 0 |
| CLOSE | `` | L402-L404 | 0 |
| OPEN | `` | L419-L421 | 0 |
| FETCH | `` | L437-L444 | 0 |
| CLOSE | `` | L469-L471 | 0 |
| INCLUDE | `` | L498-L500 | 0 |

Extraction limitations:

- Lexical inventory only; no COPY expansion, full CFG, byte-layout proof, compiler, or runtime execution.

## Comparison leads, not confirmed defects

### LEAD-d818a20a90408c: idms: PERFORM target not resolved in this member: IDMS-STATUS

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Program/VM4BD420.cbl:L152-L152` (SHA-256 `5239aa4d02575a5e...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-dc7d1dc798306c: idms: PERFORM target not resolved in this member: IDMS-STATUS

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Program/VM4BD420.cbl:L154-L154` (SHA-256 `5239aa4d02575a5e...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-74b0e7718357b9: idms: PERFORM target not resolved in this member: IDMS-STATUS

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Program/VM4BD420.cbl:L156-L156` (SHA-256 `5239aa4d02575a5e...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-512ca0abcf2882: idms: PERFORM target not resolved in this member: IDMS-STATUS

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Program/VM4BD420.cbl:L158-L158` (SHA-256 `5239aa4d02575a5e...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-035d08073925c3: idms: PERFORM target not resolved in this member: IDMS-STATUS

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Program/VM4BD420.cbl:L178-L178` (SHA-256 `5239aa4d02575a5e...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-826bab844832fc: idms: PERFORM target not resolved in this member: IDMS-STATUS

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Program/VM4BD420.cbl:L187-L187` (SHA-256 `5239aa4d02575a5e...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-73ecbbb595f08f: idms: PERFORM target not resolved in this member: IDMS-STATUS

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Program/VM4BD420.cbl:L191-L191` (SHA-256 `5239aa4d02575a5e...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-dcd84359f5bbbb: idms: dependency not available by exact member name: IDMS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Program/VM4BD420.cbl:L228-L228` (SHA-256 `5239aa4d02575a5e...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-61af8e9655c19a: manual: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4420.cbl:L370-L370` (SHA-256 `6472953d46f42b11...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-09b5401da7049f: manual: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4420.cbl:L401-L401` (SHA-256 `6472953d46f42b11...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-dc5cbb4d64a880: manual: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4420.cbl:L420-L420` (SHA-256 `6472953d46f42b11...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-7e1be793952cc6: manual: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4420.cbl:L439-L439` (SHA-256 `6472953d46f42b11...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-fe56b0227b249a: manual: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4420.cbl:L473-L473` (SHA-256 `6472953d46f42b11...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-af51ee303c72d6: manual: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4420.cbl:L492-L492` (SHA-256 `6472953d46f42b11...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-deb1cd3a913385: manual: dependency not available by exact member name: SQLERRWS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4420.cbl:L154-L154` (SHA-256 `6472953d46f42b11...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-991f16da60b1f0: manual: dependency not available by exact member name: SQLCA

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4420.cbl:L155-L155` (SHA-256 `6472953d46f42b11...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-95924d9b414545: manual: dependency not available by exact member name: SQLERROR

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4420.cbl:L497-L497` (SHA-256 `6472953d46f42b11...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-5adf346aa02a84: generated: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4420_27-10-2026_003340.cbl:L364-L364` (SHA-256 `8b1b032af29a9a6c...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-bafc7c15973b0d: generated: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4420_27-10-2026_003340.cbl:L394-L394` (SHA-256 `8b1b032af29a9a6c...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-7d5ff23af650d7: generated: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4420_27-10-2026_003340.cbl:L411-L411` (SHA-256 `8b1b032af29a9a6c...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-e663e4a2a23f97: generated: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4420_27-10-2026_003340.cbl:L428-L428` (SHA-256 `8b1b032af29a9a6c...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-fe37fee9b7d861: generated: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4420_27-10-2026_003340.cbl:L461-L461` (SHA-256 `8b1b032af29a9a6c...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-0232d1ebd98713: generated: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4420_27-10-2026_003340.cbl:L478-L478` (SHA-256 `8b1b032af29a9a6c...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-9c9c4ae2acf37d: generated: dependency not available by exact member name: SQLERRWS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4420_27-10-2026_003340.cbl:L108-L108` (SHA-256 `8b1b032af29a9a6c...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-3ab4fbe2b3c37a: generated: dependency not available by exact member name: SQLCA

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4420_27-10-2026_003340.cbl:L109-L109` (SHA-256 `8b1b032af29a9a6c...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-c6138b4ce8c461: generated: dependency not available by exact member name: SQLERROR

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4420_27-10-2026_003340.cbl:L498-L498` (SHA-256 `8b1b032af29a9a6c...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-e2dea4114e279b: Manual/generated DECLARE blocks differ lexically

Topic: `access_sql`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/05_SQL_CURSOR_AND_BUSINESS_FLOW.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4420.cbl:L164-L177` (SHA-256 `6472953d46f42b11...`)
- `mainframe/workspace/Manual Output/VMDZ4420.cbl:L182-L196` (SHA-256 `6472953d46f42b11...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4420_27-10-2026_003340.cbl:L122-L135` (SHA-256 `8b1b032af29a9a6c...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4420_27-10-2026_003340.cbl:L137-L151` (SHA-256 `8b1b032af29a9a6c...`)
generated_blocks: 2
manual_blocks: 2
qualification: Projection ordering, QUERYNO, host spelling or equivalent strategies can explain differences. Map by operation, keys and effect.

### LEAD-cf0e874a6584f4: Manual/generated FETCH blocks differ lexically

Topic: `access_sql`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/05_SQL_CURSOR_AND_BUSINESS_FLOW.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4420.cbl:L380-L391` (SHA-256 `6472953d46f42b11...`)
- `mainframe/workspace/Manual Output/VMDZ4420.cbl:L449-L456` (SHA-256 `6472953d46f42b11...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4420_27-10-2026_003340.cbl:L373-L384` (SHA-256 `8b1b032af29a9a6c...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4420_27-10-2026_003340.cbl:L437-L444` (SHA-256 `8b1b032af29a9a6c...`)
generated_blocks: 2
manual_blocks: 2
qualification: Projection ordering, QUERYNO, host spelling or equivalent strategies can explain differences. Map by operation, keys and effect.

### LEAD-0b841769a6591b: Same-name declaration differs: WS-CT-OPD-CRE

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4420.cbl:L72-L72` (SHA-256 `6472953d46f42b11...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4420_27-10-2026_003340.cbl:L78-L78` (SHA-256 `8b1b032af29a9a6c...`)
generated: PIC S9(3) COMP-3.
manual: PIC 9(3) VALUE ZEROES.
qualification: Review type/representation and data flow; level numbers and field names alone do not establish equivalence.

### LEAD-dc234d81b497b0: Same-name declaration differs: WS-CT-OPG-CRE

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4420.cbl:L73-L73` (SHA-256 `6472953d46f42b11...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4420_27-10-2026_003340.cbl:L79-L79` (SHA-256 `8b1b032af29a9a6c...`)
generated: PIC 9(3) COMP-3.
manual: PIC 9(3) VALUE ZEROES.
qualification: Review type/representation and data flow; level numbers and field names alone do not establish equivalence.

### LEAD-58edf815dbd655: Same-name declaration differs: WS-DA-CR-CRE

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4420.cbl:L70-L70` (SHA-256 `6472953d46f42b11...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4420_27-10-2026_003340.cbl:L76-L76` (SHA-256 `8b1b032af29a9a6c...`)
generated: PIC 9(8) COMP-3.
manual: PIC 9(8) VALUE ZEROES.
qualification: Review type/representation and data flow; level numbers and field names alone do not establish equivalence.

### LEAD-fb4577bd1a0556: Same-name declaration differs: WS-NR-CIO-CRE

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4420.cbl:L69-L69` (SHA-256 `6472953d46f42b11...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4420_27-10-2026_003340.cbl:L75-L75` (SHA-256 `8b1b032af29a9a6c...`)
generated: PIC 9(8) COMP-3.
manual: PIC 9(8) VALUE ZEROES.
qualification: Review type/representation and data flow; level numbers and field names alone do not establish equivalence.

### LEAD-d13dbefa4689fb: Same-name declaration differs: WS-NR-ID-CRE

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4420.cbl:L71-L71` (SHA-256 `6472953d46f42b11...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4420_27-10-2026_003340.cbl:L77-L77` (SHA-256 `8b1b032af29a9a6c...`)
generated: PIC 9(6) COMP-3.
manual: PIC 9(6) VALUE ZEROES.
qualification: Review type/representation and data flow; level numbers and field names alone do not establish equivalence.

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

There are 17 primary-source chunks. An AI must read every relevant chunk and dependencies; a short report is not a claim that all paths were analyzed.

## Human/AI semantic review pending

Use `packet` to prepare the bounded source-reading task, then `review-import` to attach a source-cited review. Do not hand-edit generated reports; keep draft Markdown in prompt/temp/.

## Production decision

**NOT CERTIFIED.** This knowledge collector never grants deployment approval. Confirmed reference behavior, target metadata, compiler output, and same-input runtime results remain separate evidence obligations.
