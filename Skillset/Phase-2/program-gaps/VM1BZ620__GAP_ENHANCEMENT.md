# Gap / enhancement assessment — VM1BZ620

- Source report: `IDMS Programs/VM1BZ620.cbl__migration.md`
- Authority: original Phase-1 report remains the evidence source.
- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.

## Existing report context

- L12: ## 1. Identity, scope and completion
- L16: | Legacy | `IDMS Programs/VM1BZ620.cbl` (243 lines). J-M Boogaerts 07-11-86. Changes: Boogaerts 90/05 "COMMIT TOUS LES 100 RECORDS" (L13); Clement 93/11 and Hannes 93/11 layout VMGDIFC → VMGDIFCS → VMGDIFCX; **De Schepper 94/10 "EFFECTEN MET FYSISCHE COUPONS OOK AANPASSEN"** (L20); Theuwissen 03/10 layout → VMBD205I and "ENKEL AANPASSEN DB ALS NOG NIET GEBEURD ONLINE (ONLINE = CO-STCIRC OP '9')" (L25-28). |
- L17: | DB2 | `DB2 Manual converted Programs/VMDZ1623.cbl` (500 lines). A. Dhuri 02/2026. `CBL ARITH(EXTEND)`. |
- L18: | Pairing | Legacy header "COUPONS BCI : MAJ D.B. TITRES DERNIER COUPON PAYE" (L10) = DB2 header "BCI COUPONS: DB UPDATE TITLES LAST COUPON PAID" (seq 000082), an exact translation. Same FD `COUP-PAY` / DD010 / 1200 bytes, same paragraph names (D-PROG, TRAIT, ACCEPT-DATE, OPEN-FICHIER, LECT-COUP-PAY), same `RANK-DERN` COMPUTE and `NOT <` test [OBS]. **Confidence: High.** VM1BD620 is a different program (own report). |
- L23: | IDMS access | Subschema VMBTS07 (L66), LR `VMBTL07-R01` paths OB-VMBEFF / MO-VMBEFF; explicit BIND RUN-UNIT / VMBEFF / FFRECAB (L205-207, `IDMS-RECORDS MANUAL` L43); READY AR-VMBEFF1 + AR-VMBRFFB UPDATE (L208-209); direct DML on FFRECAB. |
- L26: | Completion | All paths analysed end to end. Open: Q-99..Q-102, Q-48, Q-69, Q-29. |
- L60: | Kind | Legacy | DB2 |
- L74: | # | Legacy verb | Line | DB2 | Rule |
- L138: | Aspect | DB2 | Verdict |
- L151: | Situation | Legacy | DB2 | Equal? |
- L172: | LR request | Path (VMBTS07) | Legacy statuses | DB2 |
- L198: | Aspect | Legacy | DB2 |

## Open / referenced COBOL-team questions

- `Q-102`
- `Q-99`
- `Q-48`
- `Q-69`
- `Q-29`
- `Q-21`
- `Q-101`
- `Q-100`
- `Q-25`

## Important report findings to preserve

- L217: | D-02 | Low | seq 013700-013900 | Skip loop without EOF guard: input ≥ 2 records shorter than NB-READ → status 46 abend; legacy ends cleanly (L228). | `UNTIL VMDZFINI-EOF` guard (ERR-N170-1 style; legacy has no message) |
- L218: | D-03 | Low | seq 027500 vs 015000 | TE-CH-RS-DATA-LEN 15 at commit, 1215 at insert; KY-RESTART truncated, NB-READ intact → no functional effect. | 1215 |
- L219: | D-04 | Info | seq 000084-000092 | Header cloned ("KASBONS", WCEF parent, TB names). | cosmetic |
- L220: | D-05 | Info | seq 008956, 010570, 014000, 002700-003500 | redundant `MOVE ZEROES` ×2 and `MOVE NB-READ TO WS-NB-INPUT-COUNT`; dead DA-YYMMDD / DA-DDMMCCYY | cosmetic |
- L221: | D-06 | Info | seq 023800 | singleton SELECT without FETCH FIRST 1 ROW ONLY (LRO-01) | safe if unique (Q-69) |
- L222: | D-07 | Info | seq 025900 | UPDATE SQLCODE 100 → SQLERROR (Q-48, ERR-N620-1) | note |
- L223: | L-01 | Low (legacy) | L170-172, L227-230 | TELLER / NS-REC-FF-IN skip '9' records but the restart loop skips physical records → restart repositions too early and re-processes committed records. Harmless: max rule is idempotent. Comment "100 RECORDS INPUT" (L169) is inexact. | retain; DB2 template exact (RST-Z620-1) |
- L224: | L-02 | Info (legacy) | L159-160 | RANK-DERN unsigned 9(3), no ON SIZE ERROR: NS-RANK 0 + NB-CPSEQ 0 → −1 stored as 1; sum > 1000 truncated. Same in DB2 (ARI-01). | retain (Q-101) |
- L245: | T-06 | CO-STCIRC-OORD '9', stock exists, rank higher | no access, no update | same, PASS |
- L249: | T-11 | restart, file ≥ 2 records shorter than count | clean end | status 46 abend, **FAIL D-02** |
- L252: | T-14 | forced -911 on UPDATE | abort as VM1BZ620 | SQLERROR shows 'VMDZ1593', **FAIL D-01** |

## Reusable rule IDs already present

- `DATE-IND`
- `CPY-01`
- `PLAT-01`
- `NAME-03`
- `PLAT-Z190-1`
- `PLAT-02`
- `RST-07`
- `LRO-01`
- `LRO-N170-1`
- `LRO-Z620-1`
- `ERR-03`
- `LRM-01`
- `AUD-02`
- `RST-LR-01`
- `RST-Z620-1`
- `RST-10`
- `ERR-01`
- `DATE-04`
- `NAME-02`
- `HLP-06`
- `ARI-01`
- `AUD-N140-1`
- `CNT-01`
- `DSP-Z250-1`
- `MSG-01`
- `PROC-01`
- `CMT-N590-1`
- `DATE-05`
- `RST-09`
- `XPG-01`
- `XPG-Z620-1`
- `ERR-N170-1`
- `ERR-N620-1`
- `CMT-01`
- `XPG-N575-1`

## Concepts this program must contribute to

- LRF
- Restart
- Cursor_SQL
- Error_Handling
- Field_Mapping
- Storage
- Ordering_Relationships
- Decommission

## Required production enhancement for Copilot

1. Read the full original program report before creating or changing any generic rule.
2. Extract each reusable behavior into the appropriate concept rule file; do not copy narrative blindly.
3. Record rule conditions, exceptions, legacy operation/status, DB2 replacement, field/type dependencies, and evidence anchors.
4. Add or update the corresponding semantic entry in `machine/rules.json`.
5. Add this program to the program × rule coverage matrix with APPLIES_SUPPORTS / APPLIES_VARIANT / APPLIES_CONTRADICTS / NOT_APPLICABLE / UNKNOWN.
6. Keep every unresolved business decision tied to the existing Q ID; do not invent a replacement Q ID.
7. If the existing report itself is incomplete, add a continuation addendum under `program-enhancements/`; do not edit the copied original report.

## Completion checklist

- [ ] Full report semantically reviewed
- [ ] Reusable concepts extracted
- [ ] Machine rules updated
- [ ] Coverage matrix updated
- [ ] Questions linked
- [ ] Program enhancement addendum created if needed
- [ ] No original report modified
