# VMDZ4302: Engine output gap analysis

Analysis fingerprint: `30f4a1e91dd65f231e9d2752647924d1b7153e79f6423c8f1dfcb53de3c1cfe7`.

**Automated evidence inventory. Business equivalence is NOT established. No compiler or DB2 runtime validation is implied.**

The baseline excludes generated output and converter behavior. The gap track cannot establish its own expected behavior from the generated output.

## Input identities

| Role | File | Physical lines | SHA-256 |
|---|---|---:|---|
| idms | `mainframe/workspace/Program/VM4BD302.cbl` | 337 | `a51d9730816ce366497308324b517da42e389c055f64ee6b746aca872f0e7c17` |
| manual | `mainframe/workspace/Manual Output/VMDZ4302.txt` | 671 | `25f5d74ab01f76fc77157cb77d5bd83b36511e58320f8737f1225d8a3ffc2d5c` |
| generated | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl` | 568 | `5f73d6616a30299e873b7a9038ec01279668345a8492edfb3a7561fb8898b637` |
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
| engine_review | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Review/VMDZ4302_27-10-2026_003337_27-10-2026_003345.csv` | 180 | `4e124ade9245231a8411982dd9fa894a955a278f6560499c771749e2bc679f4a` |
| engine_review | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Review/VMDZ4302_27-10-2026_003337_27-10-2026_003345.txt` | 151 | `59bff04f78c176338d01b6a3ea5d5a01ebd68949c3b074b89f6499069a6c371d` |
| engine_review | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Review/semantic_release_gate.txt` | 21 | `21d6192febd41b60567937bfbe312a27dd028771d9105819ae8316d200603c4b` |
| derived_copybook | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/Generated Copybooks/VMDZ205I.cpy` | 1414 | `2833e918d09b4ac3d0869bfe5aa747da130f01220dcecd767f77f4a57986f593` |
| derived_copybook | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/Generated Copybooks/VMDZ270I.cpy` | 23 | `dc180b0c545c1017260f0fdba657ffbbc0d0464c3d1038a1cf9558bce0fef74b` |
| derived_copybook | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/Generated Copybooks/VMDZ510I.cpy` | 1632 | `66b815b9d71c3c87cc42f8c44d5fab4e95bb2c97a47a54014202968cc89626b3` |
| engine_receipt | `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/receipt.json` | 954 | `8253fcced5d83d676932314cde25743fc623222c70d234d63f2dc953a8833659` |

Generation provenance: `{'documented_engine_hash_matches': True, 'engine_exit_code': 2, 'original_input_hashes_match': True, 'production_approved': False, 'status': 'BOUND_CAPTURE_RECEIPT'}`. A bound receipt records a run, not a successful conversion or business equivalence.


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

### generated: VMDZ4302

Observed: 13 paragraph/section labels, 20 out-of-line PERFORM sites, 15 EXEC SQL blocks.
Verb inventory: `{'ACCEPT': 1, 'ADD': 3, 'CALL': 1, 'CLOSE': 1, 'CONTINUE': 5, 'DISPLAY': 31, 'ELSE': 5, 'END-EVALUATE': 6, 'END-IF': 12, 'END-READ': 2, 'EVALUATE': 6, 'IF': 12, 'INITIALIZE': 5, 'MOVE': 59, 'OPEN': 1, 'PERFORM': 20, 'READ': 2, 'SET': 6, 'STOP': 1, 'SUBTRACT': 2, 'WHEN': 14, 'WRITE': 1}`.
SQL inventory: `{'CLOSE': 2, 'DECLARE': 2, 'FETCH': 2, 'INCLUDE': 6, 'OPEN': 2, 'SELECT': 1}`.

| Caller | PERFORM target | THROUGH endpoint | Source lines |
|---|---|---|---|
| `<mainline>` | `600-GET-TIMESTAMP` | `-` | L228-L228 |
| `<mainline>` | `VERWERK-EMISSIONS` | `-` | L263-L263 |
| `VERWERK-EMISSIONS` | `CALL-VM9BC50T` | `-` | L281-L281 |
| `VERWERK-EMISSIONS` | `2100-OPEN-DZBEFFC1` | `-` | L314-L314 |
| `VERWERK-EMISSIONS` | `2200-FETCH-DZBEFFC1` | `-` | L315-L315 |
| `VERWERK-EMISSIONS` | `VERWERK-EFFEKT` | `-` | L320-L320 |
| `VERWERK-EMISSIONS` | `2300-CLOSE-DZBEFFC1` | `-` | L321-L321 |
| `VERWERK-EFFEKT` | `3100-OPEN-DZEVEFC1` | `-` | L336-L336 |
| `VERWERK-EFFEKT` | `3200-FETCH-DZEVEFC1` | `-` | L337-L337 |
| `VERWERK-EFFEKT` | `NEXT-VMBEVEF` | `-` | L340-L340 |
| `VERWERK-EFFEKT` | `3300-CLOSE-DZEVEFC1` | `-` | L341-L341 |
| `VERWERK-EFFEKT` | `WRITE-REFFEKT-O` | `-` | L343-L343 |
| `VERWERK-EFFEKT` | `2200-FETCH-DZBEFFC1` | `-` | L346-L346 |
| `NEXT-VMBEVEF` | `3200-FETCH-DZEVEFC1` | `-` | L399-L399 |
| `2100-OPEN-DZBEFFC1` | `SQLERROR` | `-` | L434-L434 |
| `2200-FETCH-DZBEFFC1` | `SQLERROR` | `-` | L464-L464 |
| `2300-CLOSE-DZBEFFC1` | `SQLERROR` | `-` | L481-L481 |
| `3100-OPEN-DZEVEFC1` | `SQLERROR` | `-` | L498-L498 |
| `3200-FETCH-DZEVEFC1` | `SQLERROR` | `-` | L529-L529 |
| `3300-CLOSE-DZEVEFC1` | `SQLERROR` | `-` | L546-L546 |

This is not a reachability proof. Paragraph numbering, PERFORM THRU boundaries, fall-through, SECTION scope and external routines must be reviewed separately.

SQL inventory (complete blocks and projections are in the companion JSON):

| Kind | Tables | Lines | Projection items |
|---|---|---|---:|
| INCLUDE | `` | L135-L135 | 0 |
| INCLUDE | `` | L136-L136 | 0 |
| INCLUDE | `` | L137-L137 | 0 |
| INCLUDE | `` | L138-L138 | 0 |
| INCLUDE | `` | L139-L139 | 0 |
| DECLARE | `DZBEFFTV` | L150-L161 | 4 |
| DECLARE | `DZEVEFTV` | L163-L175 | 3 |
| SELECT | `DZWCEFTV` | L294-L305 | 1 |
| OPEN | `` | L425-L427 | 0 |
| FETCH | `` | L443-L449 | 0 |
| CLOSE | `` | L472-L474 | 0 |
| OPEN | `` | L489-L491 | 0 |
| FETCH | `` | L507-L512 | 0 |
| CLOSE | `` | L537-L539 | 0 |
| INCLUDE | `` | L566-L568 | 0 |

Extraction limitations:

- Lexical inventory only; no COPY expansion, full CFG, byte-layout proof, compiler, or runtime execution.
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

### LEAD-1545068d2be236: generated: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L434-L434` (SHA-256 `5f73d6616a30299e...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-f658787cc4efe0: generated: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L464-L464` (SHA-256 `5f73d6616a30299e...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-adda89ff9fd0e9: generated: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L481-L481` (SHA-256 `5f73d6616a30299e...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-7c1070babaa743: generated: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L498-L498` (SHA-256 `5f73d6616a30299e...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-e63883993b8cb4: generated: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L529-L529` (SHA-256 `5f73d6616a30299e...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-227a1b96826780: generated: PERFORM target not resolved in this member: SQLERROR

Topic: `paragraph_wiring`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/08_POSTPROCESS_FORMATTING_NUMBERING.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L546-L546` (SHA-256 `5f73d6616a30299e...`)
qualification: May be defined in an external COPY/SQL INCLUDE; not automatically a broken call.

### LEAD-301a26fc803848: generated: dependency not available by exact member name: SQLERRWS

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L135-L135` (SHA-256 `5f73d6616a30299e...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-82e9e3e3d2c72f: generated: dependency not available by exact member name: SQLCA

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L136-L136` (SHA-256 `5f73d6616a30299e...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-7b6fae3910cfc6: generated: dependency not available by exact member name: SQLERROR

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L566-L566` (SHA-256 `5f73d6616a30299e...`)
qualification: No implicit renamed-copybook equivalence. Collect authoritative definition or explicit provenance.

### LEAD-dba019887c34f3: Manual/generated DECLARE blocks differ lexically

Topic: `access_sql`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/05_SQL_CURSOR_AND_BUSINESS_FLOW.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4302.txt:L215-L227` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L232-L247` (SHA-256 `25f5d74ab01f76fc...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L150-L161` (SHA-256 `5f73d6616a30299e...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L163-L175` (SHA-256 `5f73d6616a30299e...`)
generated_blocks: 2
manual_blocks: 2
qualification: Projection ordering, QUERYNO, host spelling or equivalent strategies can explain differences. Map by operation, keys and effect.

### LEAD-2c925e197a40da: Manual/generated FETCH blocks differ lexically

Topic: `access_sql`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/05_SQL_CURSOR_AND_BUSINESS_FLOW.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4302.txt:L550-L557` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L621-L629` (SHA-256 `25f5d74ab01f76fc...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L443-L449` (SHA-256 `5f73d6616a30299e...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L507-L512` (SHA-256 `5f73d6616a30299e...`)
generated_blocks: 2
manual_blocks: 2
qualification: Projection ordering, QUERYNO, host spelling or equivalent strategies can explain differences. Map by operation, keys and effect.

### LEAD-a9eef1f606900c: Manual/generated SELECT blocks differ lexically

Topic: `access_sql`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/05_SQL_CURSOR_AND_BUSINESS_FLOW.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4302.txt:L492-L500` (SHA-256 `25f5d74ab01f76fc...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L294-L305` (SHA-256 `5f73d6616a30299e...`)
generated_blocks: 1
manual_blocks: 1
qualification: Projection ordering, QUERYNO, host spelling or equivalent strategies can explain differences. Map by operation, keys and effect.

### LEAD-0b041a761a8f8c: Manual/generated READ/REWRITE/WRITE statements need effect-level comparison

Topic: `purpose_io`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/04_LR_IDMS_DB2_CONVERSION.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4302.txt:L305-L306` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L374-L374` (SHA-256 `25f5d74ab01f76fc...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L259-L260` (SHA-256 `5f73d6616a30299e...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L323-L324` (SHA-256 `5f73d6616a30299e...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L358-L358` (SHA-256 `5f73d6616a30299e...`)
generated_statements: 3
manual_statements: 2
qualification: Not a missing-logic verdict. Helpers, numbering, control restructuring or SQL filtering may preserve behavior.

### LEAD-6198b1292193af: Manual/generated EVALUATE/IF/WHEN statements need effect-level comparison

Topic: `business_conditions`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/05_SQL_CURSOR_AND_BUSINESS_FLOW.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4302.txt:L266-L266` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L275-L275` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L309-L309` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L326-L326` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L365-L365` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L388-L388` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L389-L389` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L391-L391` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L393-L393` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L400-L400` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L404-L406` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L409-L409` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L416-L416` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L421-L422` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L425-L426` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L435-L437` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L502-L502` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L503-L503` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L505-L505` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L513-L513` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L535-L535` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L536-L536` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L538-L538` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L559-L559` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L560-L560` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L563-L563` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L565-L565` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L587-L587` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L588-L588` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L590-L590` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L606-L606` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L607-L607` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L609-L609` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L631-L631` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L632-L632` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L634-L634` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L636-L636` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L660-L660` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L661-L661` (SHA-256 `25f5d74ab01f76fc...`)
- `mainframe/workspace/Manual Output/VMDZ4302.txt:L663-L663` (SHA-256 `25f5d74ab01f76fc...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L229-L229` (SHA-256 `5f73d6616a30299e...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L238-L238` (SHA-256 `5f73d6616a30299e...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L286-L286` (SHA-256 `5f73d6616a30299e...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L307-L307` (SHA-256 `5f73d6616a30299e...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L312-L312` (SHA-256 `5f73d6616a30299e...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L342-L342` (SHA-256 `5f73d6616a30299e...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L364-L365` (SHA-256 `5f73d6616a30299e...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L368-L368` (SHA-256 `5f73d6616a30299e...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L375-L375` (SHA-256 `5f73d6616a30299e...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L380-L381` (SHA-256 `5f73d6616a30299e...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L384-L385` (SHA-256 `5f73d6616a30299e...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L390-L392` (SHA-256 `5f73d6616a30299e...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L429-L429` (SHA-256 `5f73d6616a30299e...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L430-L430` (SHA-256 `5f73d6616a30299e...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L432-L432` (SHA-256 `5f73d6616a30299e...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L451-L451` (SHA-256 `5f73d6616a30299e...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L452-L452` (SHA-256 `5f73d6616a30299e...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L454-L454` (SHA-256 `5f73d6616a30299e...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L456-L456` (SHA-256 `5f73d6616a30299e...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L476-L476` (SHA-256 `5f73d6616a30299e...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L477-L477` (SHA-256 `5f73d6616a30299e...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L479-L479` (SHA-256 `5f73d6616a30299e...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L493-L493` (SHA-256 `5f73d6616a30299e...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L494-L494` (SHA-256 `5f73d6616a30299e...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L496-L496` (SHA-256 `5f73d6616a30299e...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L514-L514` (SHA-256 `5f73d6616a30299e...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L515-L515` (SHA-256 `5f73d6616a30299e...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L517-L517` (SHA-256 `5f73d6616a30299e...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L519-L519` (SHA-256 `5f73d6616a30299e...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L541-L541` (SHA-256 `5f73d6616a30299e...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L542-L542` (SHA-256 `5f73d6616a30299e...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L544-L544` (SHA-256 `5f73d6616a30299e...`)
generated_statements: 32
manual_statements: 40
qualification: Not a missing-logic verdict. Helpers, numbering, control restructuring or SQL filtering may preserve behavior.

### LEAD-ad7aa274df9156: Same-name declaration differs: CT-OPD

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4302.txt:L91-L91` (SHA-256 `25f5d74ab01f76fc...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L95-L95` (SHA-256 `5f73d6616a30299e...`)
generated: PIC S9(3) COMP-3.
manual: PIC 9(3) VALUE ZEROES.
qualification: Review type/representation and data flow; level numbers and field names alone do not establish equivalence.

### LEAD-72a6c78d7567b6: Same-name declaration differs: HULP-DA-UB-TRANSF

Topic: `fields_layout`. Status: **REVIEW_REQUIRED**. Root cause: **NOT_ESTABLISHED**.
Suggested engine guide: `prompt/06_RECORD_COPYBOOK_AND_DATE_CONTRACTS.md` (routing hint only).

- `mainframe/workspace/Manual Output/VMDZ4302.txt:L89-L89` (SHA-256 `25f5d74ab01f76fc...`)
- `prompt/knowledge/engine_runs/20261027T003329Z-d98d6b77/Output/VMDZ4302_27-10-2026_003337.cbl:L93-L93` (SHA-256 `5f73d6616a30299e...`)
generated: PIC 9(8) COMP-3.
manual: PIC 9(8) VALUE ZEROES.
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

There are 22 primary-source chunks. An AI must read every relevant chunk and dependencies; a short report is not a claim that all paths were analyzed.

## Human/AI semantic review pending

Use `packet` to prepare the bounded source-reading task, then `review-import` to attach a source-cited review. Do not hand-edit generated reports; keep draft Markdown in prompt/temp/.

## Production decision

**NOT CERTIFIED.** This knowledge collector never grants deployment approval. Confirmed reference behavior, target metadata, compiler output, and same-input runtime results remain separate evidence obligations.
