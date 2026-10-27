# VMDZ1526: Engine output gap analysis

Analysis fingerprint: `4cbebafae969510c4e0c925ba7c16638d1cfd24b2b5dfc715b576086a1a212d1`.

**Automated evidence inventory. Business equivalence is NOT established. No compiler or DB2 runtime validation is implied.**

The baseline excludes generated output and converter behavior. The gap track cannot establish its own expected behavior from the generated output.

## Input identities

| Role | File | Physical lines | SHA-256 |
|---|---|---:|---|
| idms | `mainframe/workspace/Program/VM1BD526.cbl` | 256 | `07c3a8f83ef7b871346d7de87dc790c8bb7cd5085e9102cd3a3c9bd6eebfd59f` |
| manual | `mainframe/workspace/Manual Output/VMDZ1526.txt` | 627 | `a8ce3fb3704c3c124be9cd3f3f5d2e9500c27a24664d4ce9d69ec5b72122b99f` |
| generated | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl` | 686 | `c2733eb68b3d75466d0f5458c3db4dac41a6b2022861b3e3181c5646bd9a249c` |
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
| engine_review | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Review/VMDZ1526_27-10-2026_003334_27-10-2026_003345.csv` | 164 | `76ed4668ac83c43e56be2bee2a1748c528954a1b58101a042db1315f4325481e` |
| engine_review | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Review/VMDZ1526_27-10-2026_003334_27-10-2026_003345.txt` | 141 | `7a23d9f685d32f6236030c436b48be1420d6ea5fcff50d58bc4b448fd6b875af` |
| engine_review | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Review/semantic_release_gate.txt` | 21 | `21d6192febd41b60567937bfbe312a27dd028771d9105819ae8316d200603c4b` |
| derived_copybook | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/Generated Copybooks/VMDZ205I.cpy` | 1414 | `2833e918d09b4ac3d0869bfe5aa747da130f01220dcecd767f77f4a57986f593` |
| derived_copybook | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/Generated Copybooks/VMDZ270I.cpy` | 23 | `dc180b0c545c1017260f0fdba657ffbbc0d0464c3d1038a1cf9558bce0fef74b` |
| derived_copybook | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/Generated Copybooks/VMDZ510I.cpy` | 1632 | `66b815b9d71c3c87cc42f8c44d5fab4e95bb2c97a47a54014202968cc89626b3` |
| engine_receipt | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/receipt.json` | 954 | `8253fcced5d83d676932314cde25743fc623222c70d234d63f2dc953a8833659` |

Generation provenance: `{'documented_engine_hash_matches': True, 'engine_exit_code': 2, 'original_input_hashes_match': True, 'production_approved': False, 'status': 'BOUND_CAPTURE_RECEIPT'}`. A bound receipt records a run, not a successful conversion or business equivalence.


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

### generated: VMDZ1526

Observed: 19 paragraph/section labels, 26 out-of-line PERFORM sites, 15 EXEC SQL blocks.
Verb inventory: `{'ADD': 4, 'CALL': 5, 'CLOSE': 1, 'CONTINUE': 7, 'DISPLAY': 36, 'ELSE': 3, 'END-EVALUATE': 8, 'END-IF': 10, 'END-PERFORM': 1, 'EVALUATE': 8, 'IF': 13, 'INITIALIZE': 4, 'MOVE': 94, 'OPEN': 1, 'PERFORM': 26, 'READ': 1, 'STOP': 1, 'WHEN': 19}`.
SQL inventory: `{'COMMIT': 1, 'INCLUDE': 6, 'INSERT': 2, 'ROLLBACK': 1, 'SELECT': 3, 'UPDATE': 2}`.

| Caller | PERFORM target | THROUGH endpoint | Source lines |
|---|---|---|---|
| `<mainline>` | `600-GET-TIMESTAMP` | `-` | L192-L192 |
| `000-STUUR` | `100-INITIALISATIE` | `-` | L196-L196 |
| `000-STUUR` | `700-RESTART-CONTROL` | `-` | L197-L197 |
| `000-STUUR` | `200-VERWERK-INFIL` | `-` | L199-L199 |
| `000-STUUR` | `800-PROCESS-COMMIT` | `-` | L201-L201 |
| `100-INITIALISATIE` | `900-LEES-INFIL` | `-` | L217-L217 |
| `110-POSITIONEREN-INFIL` | `900-LEES-INFIL` | `-` | L222-L222 |
| `110-POSITIONEREN-INFIL` | `STOP01` | `-` | L224-L224 |
| `200-VERWERK-INFIL` | `800-TEST-FFRECAB` | `-` | L234-L234 |
| `200-VERWERK-INFIL` | `800-PROCESS-COMMIT` | `-` | L239-L239 |
| `200-VERWERK-INFIL` | `900-LEES-INFIL` | `-` | L242-L242 |
| `210-STORE-EFF` | `SQLERROR` | `-` | L333-L333 |
| `210-STORE-EFF` | `SQLERROR` | `-` | L337-L337 |
| `210-STORE-EFF` | `SQLERROR` | `-` | L401-L401 |
| `210-STORE-EFF` | `IDMS-STOP` | `-` | L405-L405 |
| `220-MOD-EVEF` | `SQLERROR` | `-` | L435-L435 |
| `220-MOD-EVEF` | `SQLERROR` | `-` | L469-L469 |
| `700-RESTART-CONTROL` | `700-SELECT-DZ01RSTV` | `-` | L538-L538 |
| `700-SELECT-DZ01RSTV` | `SQLERROR` | `-` | L578-L578 |
| `700-UPDATE-DZ01RSTV` | `SQLERROR` | `-` | L601-L601 |
| `700-INSERT-DZ01RSTV` | `SQLERROR` | `-` | L619-L619 |
| `710-JOB-IS-RESTART` | `810000-CALL-USERABEN` | `-` | L630-L630 |
| `710-JOB-IS-RESTART` | `900-LEES-INFIL` | `-` | L632-L632 |
| `720-WRITE-RESTART-REC` | `700-INSERT-DZ01RSTV` | `-` | L650-L650 |
| `800-PROCESS-COMMIT` | `700-UPDATE-DZ01RSTV` | `-` | L669-L669 |
| `800-PROCESS-COMMIT` | `SQLERROR` | `-` | L681-L681 |

This is not a reachability proof. Paragraph numbering, PERFORM THRU boundaries, fall-through, SECTION scope and external routines must be reviewed separately.

SQL inventory (complete blocks and projections are in the companion JSON):

| Kind | Tables | Lines | Projection items |
|---|---|---|---:|
| INCLUDE | `` | L52-L52 | 0 |
| INCLUDE | `` | L130-L130 | 0 |
| INCLUDE | `` | L131-L131 | 0 |
| INCLUDE | `` | L132-L132 | 0 |
| INCLUDE | `` | L133-L133 | 0 |
| SELECT | `DZBEFFTV` | L285-L327 | 16 |
| INSERT | `DZEVEFTV` | L355-L395 | 0 |
| SELECT | `DZEVEFTV` | L418-L432 | 1 |
| UPDATE | `DZEVEFTV` | L454-L463 | 0 |
| ROLLBACK | `` | L507-L509 | 0 |
| INCLUDE | `` | L528-L530 | 0 |
| SELECT | `DZ01RSTV` | L552-L570 | 6 |
| UPDATE | `DZ01RSTV` | L586-L594 | 0 |
| INSERT | `DZ01RSTV` | L609-L612 | 0 |
| COMMIT | `` | L672-L674 | 0 |

Extraction limitations:

- Lexical inventory only; no COPY expansion, full CFG, byte-layout proof, compiler, or runtime execution.

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

### LEAD-e9ca288e2624d2: generated: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L333-L333` (SHA-256 `c2733eb68b3d7546...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-13ecc5155ff2d1: generated: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L337-L337` (SHA-256 `c2733eb68b3d7546...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-055405b570dcc1: generated: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L401-L401` (SHA-256 `c2733eb68b3d7546...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-6ae61c7f64dd27: generated: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L435-L435` (SHA-256 `c2733eb68b3d7546...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-7d45457590a2ef: generated: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L469-L469` (SHA-256 `c2733eb68b3d7546...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-82b0a677fd8acb: generated: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L578-L578` (SHA-256 `c2733eb68b3d7546...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-c02157697aad5c: generated: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L601-L601` (SHA-256 `c2733eb68b3d7546...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-16b7931c0fff87: generated: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L619-L619` (SHA-256 `c2733eb68b3d7546...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-6768cfaaa8868d: generated: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L681-L681` (SHA-256 `c2733eb68b3d7546...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-6cc7a01b4a34b1: generated: dependency not available by exact member name: SQLERRWS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L130-L130` (SHA-256 `c2733eb68b3d7546...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-444ca9e7b6569e: generated: dependency not available by exact member name: SQLCA

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L131-L131` (SHA-256 `c2733eb68b3d7546...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-47d765ed247c3b: generated: dependency not available by exact member name: SQLERROR

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L528-L528` (SHA-256 `c2733eb68b3d7546...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-f041ae04e7e830: Manual/generated COMMIT blocks differ lexically

Topic: `access_sql`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/05_SQL_CURSOR_AND_BUSINESS_FLOW.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1526.txt:L370-L372` (SHA-256 `a8ce3fb3704c3c12...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L672-L674` (SHA-256 `c2733eb68b3d7546...`)
generated_blocks: 1
manual_blocks: 1
qualification: Projection ordering, QUERYNO, host spelling or equivalent strategies can explain differences. Map by operation, keys and effect.

### LEAD-cd04d5038d5cea: Manual/generated INSERT blocks differ lexically

Topic: `access_sql`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/05_SQL_CURSOR_AND_BUSINESS_FLOW.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1526.txt:L450-L453` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L531-L565` (SHA-256 `a8ce3fb3704c3c12...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L355-L395` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L609-L612` (SHA-256 `c2733eb68b3d7546...`)
generated_blocks: 2
manual_blocks: 2
qualification: Projection ordering, QUERYNO, host spelling or equivalent strategies can explain differences. Map by operation, keys and effect.

### LEAD-9de48b1db41587: Manual/generated ROLLBACK blocks differ lexically

Topic: `access_sql`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/05_SQL_CURSOR_AND_BUSINESS_FLOW.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L507-L509` (SHA-256 `c2733eb68b3d7546...`)
generated_blocks: 1
manual_blocks: 0
qualification: Projection ordering, QUERYNO, host spelling or equivalent strategies can explain differences. Map by operation, keys and effect.

### LEAD-4522c962ff3787: Manual/generated SELECT blocks differ lexically

Topic: `access_sql`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/05_SQL_CURSOR_AND_BUSINESS_FLOW.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1526.txt:L402-L420` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L464-L520` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L576-L589` (SHA-256 `a8ce3fb3704c3c12...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L285-L327` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L418-L432` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L552-L570` (SHA-256 `c2733eb68b3d7546...`)
generated_blocks: 3
manual_blocks: 3
qualification: Projection ordering, QUERYNO, host spelling or equivalent strategies can explain differences. Map by operation, keys and effect.

### LEAD-47365e8845cecc: Manual/generated UPDATE blocks differ lexically

Topic: `access_sql`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/05_SQL_CURSOR_AND_BUSINESS_FLOW.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1526.txt:L431-L439` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L604-L611` (SHA-256 `a8ce3fb3704c3c12...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L454-L463` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L586-L594` (SHA-256 `c2733eb68b3d7546...`)
generated_blocks: 2
manual_blocks: 2
qualification: Projection ordering, QUERYNO, host spelling or equivalent strategies can explain differences. Map by operation, keys and effect.

### LEAD-5dcee341143666: Manual/generated READ/REWRITE/WRITE statements need effect-level comparison

Topic: `purpose_io`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/04_LR_IDMS_DB2_CONVERSION.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1526.txt:L317-L318` (SHA-256 `a8ce3fb3704c3c12...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L486-L487` (SHA-256 `c2733eb68b3d7546...`)
generated_statements: 1
manual_statements: 1
qualification: Not a missing-logic verdict. Helpers, numbering, control restructuring or SQL filtering may preserve behavior.

### LEAD-e1cad76436ae18: Manual/generated EVALUATE/IF/WHEN statements need effect-level comparison

Topic: `business_conditions`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/05_SQL_CURSOR_AND_BUSINESS_FLOW.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1526.txt:L211-L211` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L217-L218` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L221-L221` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L320-L321` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L331-L331` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L332-L332` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L333-L333` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L334-L334` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L339-L339` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L361-L362` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L373-L373` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L374-L374` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L377-L377` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L421-L421` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L422-L422` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L423-L423` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L425-L425` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L441-L441` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L442-L442` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L444-L444` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L455-L455` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L456-L456` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L458-L458` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L521-L521` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L522-L522` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L524-L524` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L566-L566` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L567-L567` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L570-L570` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L591-L591` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L592-L592` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L595-L595` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L598-L598` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L613-L613` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L614-L614` (SHA-256 `a8ce3fb3704c3c12...`)
- `mainframe/workspace/Manual Output/VMDZ1526.txt:L617-L617` (SHA-256 `a8ce3fb3704c3c12...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L223-L223` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L229-L230` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L233-L233` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L238-L238` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L257-L257` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L328-L328` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L329-L329` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L331-L331` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L334-L334` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L340-L340` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L396-L396` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L397-L397` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L399-L399` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L404-L404` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L433-L433` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L437-L437` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L464-L464` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L465-L465` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L467-L467` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L472-L472` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L489-L490` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L540-L540` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L541-L541` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L542-L542` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L543-L543` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L572-L572` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L573-L573` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L574-L574` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L576-L576` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L596-L596` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L597-L597` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L599-L599` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L614-L614` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L615-L615` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L617-L617` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L628-L629` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L659-L660` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L676-L676` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L677-L677` (SHA-256 `c2733eb68b3d7546...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L679-L679` (SHA-256 `c2733eb68b3d7546...`)
generated_statements: 40
manual_statements: 36
qualification: Not a missing-logic verdict. Helpers, numbering, control restructuring or SQL filtering may preserve behavior.

### LEAD-52daa748b1374f: Same-name declaration differs: CS-PROGRAM

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1526.txt:L59-L59` (SHA-256 `a8ce3fb3704c3c12...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L137-L137` (SHA-256 `c2733eb68b3d7546...`)
generated: PIC X(8) VALUE 'VMDZ1526'.
manual: PIC X(8).
qualification: Review type/representation and data flow; level numbers and field names alone do not establish equivalence.

### LEAD-e4e1ac3392b6f3: Same-name declaration differs: HULP-CT-OPD

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1526.txt:L72-L72` (SHA-256 `a8ce3fb3704c3c12...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L106-L106` (SHA-256 `c2733eb68b3d7546...`)
generated: PIC 999 COMP-3.
manual: PIC 999.
qualification: Review type/representation and data flow; level numbers and field names alone do not establish equivalence.

### LEAD-8d89c82900cbb5: Same-name declaration differs: HULP-CT-OPG

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1526.txt:L73-L73` (SHA-256 `a8ce3fb3704c3c12...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L107-L107` (SHA-256 `c2733eb68b3d7546...`)
generated: PIC 999 COMP-3.
manual: PIC 999.
qualification: Review type/representation and data flow; level numbers and field names alone do not establish equivalence.

### LEAD-1ee80da5ed2605: Same-name declaration differs: HULP-DA-CREA

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1526.txt:L70-L70` (SHA-256 `a8ce3fb3704c3c12...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L104-L104` (SHA-256 `c2733eb68b3d7546...`)
generated: PIC 9(8) COMP-3.
manual: PIC 9(8).
qualification: Review type/representation and data flow; level numbers and field names alone do not establish equivalence.

### LEAD-795c0e44f27bf9: Same-name declaration differs: HULP-NR-CIO

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1526.txt:L69-L69` (SHA-256 `a8ce3fb3704c3c12...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L103-L103` (SHA-256 `c2733eb68b3d7546...`)
generated: PIC 9(8) COMP-3.
manual: PIC 9(8).
qualification: Review type/representation and data flow; level numbers and field names alone do not establish equivalence.

### LEAD-c2fc3c086bdc01: Same-name declaration differs: HULP-NR-ID

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1526.txt:L71-L71` (SHA-256 `a8ce3fb3704c3c12...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L105-L105` (SHA-256 `c2733eb68b3d7546...`)
generated: PIC 9(6) COMP-3.
manual: PIC 9(6).
qualification: Review type/representation and data flow; level numbers and field names alone do not establish equivalence.

### LEAD-2cbb00f57588ba: Same-name declaration differs: KY-RESTART

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1526.txt:L62-L62` (SHA-256 `a8ce3fb3704c3c12...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L62-L62` (SHA-256 `c2733eb68b3d7546...`)
generated: PIC X(1200) VALUE SPACES.
manual: PIC X(1200).
qualification: Review type/representation and data flow; level numbers and field names alone do not establish equivalence.

### LEAD-f845e5a319d357: Same-name declaration differs: NB-READ

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1526.txt:L61-L61` (SHA-256 `a8ce3fb3704c3c12...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L61-L61` (SHA-256 `c2733eb68b3d7546...`)
generated: PIC 9(15) VALUE ZERO.
manual: PIC 9(15).
qualification: Review type/representation and data flow; level numbers and field names alone do not establish equivalence.

### LEAD-1ddeeaf8dc525a: Same-name declaration differs: SW-VMDZ205I

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1526.txt:L47-L47` (SHA-256 `a8ce3fb3704c3c12...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L55-L55` (SHA-256 `c2733eb68b3d7546...`)
generated: PIC X VALUE 'N'.
manual: PIC X.
qualification: Review type/representation and data flow; level numbers and field names alone do not establish equivalence.

### LEAD-6acbf57acafe24: Same-name declaration differs: WS-INPUT-KASBONS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1526.txt:L63-L63` (SHA-256 `a8ce3fb3704c3c12...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L63-L63` (SHA-256 `c2733eb68b3d7546...`)
generated: PIC X(1200) VALUE SPACES.
manual: PIC X(1200).
qualification: Review type/representation and data flow; level numbers and field names alone do not establish equivalence.

### LEAD-cd75e3532cbd8e: Same-name declaration differs: WS-NB-INPUT-UPD-I

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ1526.txt:L56-L56` (SHA-256 `a8ce3fb3704c3c12...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ1526_27-10-2026_003334.cbl:L65-L65` (SHA-256 `c2733eb68b3d7546...`)
generated: PIC 9(7) COMP-3 VALUE ZERO.
manual: PIC S9(5) COMP-3.
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

There are 21 primary-source chunks. An AI must read every relevant chunk and dependencies; a short report is not a claim that all paths were analyzed.

## Human/AI semantic review pending

Use `packet` to prepare the bounded source-reading task, then `review-import` to attach a source-cited review. Do not hand-edit generated reports; keep draft Markdown in prompt/temp/.

## Production decision

**NOT CERTIFIED.** This knowledge collector never grants deployment approval. Confirmed reference behavior, target metadata, compiler output, and same-input runtime results remain separate evidence obligations.
