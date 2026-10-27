# VMDZ1526: IDMS to manual DB2 baseline

Analysis fingerprint: `dc6eea12531898fafd359914af374cdae79df73aaaf7bce76a11794f4d511cc0`.

**Automated evidence inventory. Business equivalence is NOT established. No compiler or DB2 runtime validation is implied.**

The baseline excludes generated output and converter behavior. The gap track cannot establish its own expected behavior from the generated output.

## Input identities

| Role | File | Physical lines | SHA-256 |
|---|---|---:|---|
| idms | `mainframe/workspace/Program/VM1BD526.cbl` | 256 | `07c3a8f83ef7b871346d7de87dc790c8bb7cd5085e9102cd3a3c9bd6eebfd59f` |
| manual | `mainframe/workspace/Manual Output/VMDZ1526.txt` | 627 | `a8ce3fb3704c3c124be9cd3f3f5d2e9500c27a24664d4ce9d69ec5b72122b99f` |
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

### idms: VM1BD526

Observed: 11 paragraph/section labels, 10 out-of-line PERFORM sites, 0 EXEC SQL blocks.
Verb inventory: `{'ADD': 3, 'CALL': 4, 'CLOSE': 1, 'COMMIT': 1, 'DISPLAY': 8, 'ELSE': 3, 'END-IF': 4, 'FINISH': 1, 'IF': 8, 'MODIFY': 2, 'MOVE': 48, 'OBTAIN': 3, 'OPEN': 1, 'PERFORM': 10, 'READ': 1, 'READY': 1, 'ROLLBACK': 1, 'STOP': 1, 'STORE': 2}`.
SQL inventory: `{}`.

| Caller | PERFORM target | THROUGH endpoint | Source lines |
|---|---|---|---|
| `000-STUUR` | `100-INITIALISATIE` | `-` | L104-L104 |
| `000-STUUR` | `200-VERWERK-INFIL` | `-` | L105-L105 |
| `000-STUUR` | `800-TEST-FFRECAB` | `-` | L106-L106 |
| `100-INITIALISATIE` | `110-POSITIONEREN-INFIL` | `-` | L128-L129 |
| `100-INITIALISATIE` | `900-LEES-INFIL` | `-` | L140-L140 |
| `110-POSITIONEREN-INFIL` | `900-LEES-INFIL` | `-` | L144-L144 |
| `110-POSITIONEREN-INFIL` | `STOP01` | `-` | L146-L146 |
| `200-VERWERK-INFIL` | `800-TEST-FFRECAB` | `-` | L155-L155 |
| `200-VERWERK-INFIL` | `900-LEES-INFIL` | `-` | L158-L158 |
| `210-STORE-EFF` | `IDMS-STOP` | `-` | L195-L195 |

This is not a reachability proof. Paragraph numbering, PERFORM THRU boundaries, fall-through, SECTION scope and external routines must be reviewed separately.

SQL inventory (complete blocks and projections are in the companion JSON):

| Kind | Tables | Lines | Projection items |
|---|---|---|---:|

Extraction limitations:

- Lexical inventory only; no COPY expansion, full CFG, byte-layout proof, compiler, or runtime execution.

### manual: VMDZ1526

Observed: 21 paragraph/section labels, 29 out-of-line PERFORM sites, 14 EXEC SQL blocks.
Verb inventory: `{'ADD': 5, 'CALL': 1, 'CLOSE': 1, 'CONTINUE': 7, 'DISPLAY': 12, 'ELSE': 3, 'END-EVALUATE': 9, 'END-IF': 6, 'END-PERFORM': 1, 'EVALUATE': 9, 'IF': 6, 'INITIALIZE': 7, 'MOVE': 83, 'OPEN': 1, 'PERFORM': 29, 'READ': 1, 'SET': 1, 'STOP': 1, 'WHEN': 21}`.
SQL inventory: `{'COMMIT': 1, 'INCLUDE': 6, 'INSERT': 2, 'SELECT': 3, 'UPDATE': 2}`.

| Caller | PERFORM target | THROUGH endpoint | Source lines |
|---|---|---|---|
| `000-STUUR` | `100-INITIALISATIE` | `-` | L176-L176 |
| `000-STUUR` | `200-VERWERK-INFIL` | `-` | L177-L177 |
| `000-STUUR` | `830-PROCESS-COMMIT` | `-` | L178-L178 |
| `100-INITIALISATIE` | `840-GET-TIMESTAMP` | `-` | L187-L187 |
| `100-INITIALISATIE` | `800-RESTART-CONTROL` | `-` | L200-L200 |
| `100-INITIALISATIE` | `900-LEES-INFIL` | `-` | L204-L204 |
| `110-POSITIONEREN-INFIL` | `900-LEES-INFIL` | `-` | L209-L209 |
| `110-POSITIONEREN-INFIL` | `120-STOP01` | `-` | L212-L212 |
| `200-VERWERK-INFIL` | `830-PROCESS-COMMIT` | `-` | L222-L222 |
| `200-VERWERK-INFIL` | `900-LEES-INFIL` | `-` | L224-L224 |
| `210-INSERT-EVFF` | `211-SELECT-EFF` | `-` | L280-L280 |
| `220-UPD-EVEF` | `221-SELECT-EVEF` | `-` | L313-L313 |
| `800-RESTART-CONTROL` | `700-SELECT-DZ01RSTV` | `-` | L329-L329 |
| `810-JOB-IS-RESTART` | `850-CALL-USERABEN` | `-` | L340-L340 |
| `810-JOB-IS-RESTART` | `110-POSITIONEREN-INFIL` | `-` | L342-L342 |
| `820-WRITE-RESTART-REC` | `700-INSERT-DZ01RSTV` | `-` | L355-L355 |
| `830-PROCESS-COMMIT` | `700-UPDATE-DZ01RSTV` | `-` | L368-L368 |
| `830-PROCESS-COMMIT` | `SQLERROR` | `-` | L378-L378 |
| `120-STOP01` | `850-CALL-USERABEN` | `-` | L399-L399 |
| `700-SELECT-DZ01RSTV` | `SQLERROR` | `-` | L426-L426 |
| `700-UPDATE-DZ01RSTV` | `SQLERROR` | `-` | L445-L445 |
| `700-INSERT-DZ01RSTV` | `SQLERROR` | `-` | L459-L459 |
| `211-SELECT-EFF` | `260-INSERT-EVEF` | `-` | L523-L523 |
| `211-SELECT-EFF` | `SQLERROR` | `-` | L526-L526 |
| `260-INSERT-EVEF` | `SQLERROR` | `-` | L572-L572 |
| `221-SELECT-EVEF` | `222-UPDATE-EVEF` | `-` | L593-L593 |
| `221-SELECT-EVEF` | `SQLERROR` | `-` | L597-L597 |
| `221-SELECT-EVEF` | `SQLERROR` | `-` | L600-L600 |
| `222-UPDATE-EVEF` | `SQLERROR` | `-` | L621-L621 |

This is not a reachability proof. Paragraph numbering, PERFORM THRU boundaries, fall-through, SECTION scope and external routines must be reviewed separately.

SQL inventory (complete blocks and projections are in the companion JSON):

| Kind | Tables | Lines | Projection items |
|---|---|---|---:|
| INCLUDE | `` | L155-L155 | 0 |
| INCLUDE | `` | L156-L156 | 0 |
| INCLUDE | `` | L159-L159 | 0 |
| INCLUDE | `` | L160-L160 | 0 |
| INCLUDE | `` | L161-L161 | 0 |
| COMMIT | `` | L370-L372 | 0 |
| SELECT | `DZ01RSTV` | L402-L420 | 6 |
| UPDATE | `DZ01RSTV` | L431-L439 | 0 |
| INSERT | `DZ01RSTV` | L450-L453 | 0 |
| SELECT | `DZBEFFTV` | L464-L520 | 22 |
| INSERT | `DZEVEFTV` | L531-L565 | 0 |
| SELECT | `DZEVEFTV` | L576-L589 | 1 |
| UPDATE | `DZEVEFTV` | L604-L611 | 0 |
| INCLUDE | `` | L625-L627 | 0 |

Extraction limitations:

- Lexical inventory only; no COPY expansion, full CFG, byte-layout proof, compiler, or runtime execution.
- Debug indicator lines exist; compiler debug mode is not established.

## Comparison leads, not confirmed defects

### LEAD-c33194c3dd241d: idms: dependency not available by exact member name: IDMS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Program/VM1BD526.cbl:L117-L117` (SHA-256 `07c3a8f83ef7b871...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-f4701a5169e627: idms: dependency not available by exact member name: IDMS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Program/VM1BD526.cbl:L254-L254` (SHA-256 `07c3a8f83ef7b871...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-84334d803939c4: manual: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1526.txt:L378-L378` (SHA-256 `a8ce3fb3704c3c12...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-d4a3567517aab8: manual: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1526.txt:L426-L426` (SHA-256 `a8ce3fb3704c3c12...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-fb216646ce94b3: manual: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1526.txt:L445-L445` (SHA-256 `a8ce3fb3704c3c12...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-304c9e31dc02d6: manual: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1526.txt:L459-L459` (SHA-256 `a8ce3fb3704c3c12...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-a76ffcdcc20ad1: manual: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1526.txt:L526-L526` (SHA-256 `a8ce3fb3704c3c12...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-e690f04f7e6403: manual: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1526.txt:L572-L572` (SHA-256 `a8ce3fb3704c3c12...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-55a7c671817595: manual: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1526.txt:L597-L597` (SHA-256 `a8ce3fb3704c3c12...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-ab0c7a97084ff1: manual: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1526.txt:L600-L600` (SHA-256 `a8ce3fb3704c3c12...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-346e833b8d8aef: manual: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1526.txt:L621-L621` (SHA-256 `a8ce3fb3704c3c12...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-c891267ff51fe3: manual: dependency not available by exact member name: VMDZ205I

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1526.txt:L41-L41` (SHA-256 `a8ce3fb3704c3c12...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-2501b1fcee35a2: manual: dependency not available by exact member name: SQLERRWS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1526.txt:L155-L155` (SHA-256 `a8ce3fb3704c3c12...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-e43b3a3aca1640: manual: dependency not available by exact member name: SQLCA

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1526.txt:L156-L156` (SHA-256 `a8ce3fb3704c3c12...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-bc4e110aa01feb: manual: dependency not available by exact member name: SQLERROR

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1526.txt:L625-L625` (SHA-256 `a8ce3fb3704c3c12...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-c57d87ebd6d85f: Map source IDMS operations to manual DB2 operations individually

Topic: `access_sql`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/05_SQL_CURSOR_AND_BUSINESS_FLOW.md` (routing hint only).

- `mainframe/workspace/Program/VM1BD526.cbl:L107-L107` (SHA-256 `07c3a8f83ef7b871...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L370-L372` (SHA-256 `a8ce3fb3704c3c12...`)
manual_sql_block_count: 14
qualification: Counts do not imply a one-to-one mapping or equivalence.
source_operation_count: 11

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
