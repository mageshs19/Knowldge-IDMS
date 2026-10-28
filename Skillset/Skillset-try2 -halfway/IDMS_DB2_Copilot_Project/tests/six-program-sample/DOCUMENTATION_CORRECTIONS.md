# Corrections found during the Phase 2 recheck

The completed Phase 1 baseline is preserved byte for byte. These corrections are made in the revised Phase 2 analysis and are explicit here so that an earlier statement cannot be mistaken for the current conclusion. Original application and dependency files were never changed.

## 1. Q-000025: archive parameter input versus output

The issued Phase 1 question incorrectly called `VMDZ270I` an archive-output copybook. Its own impact statement referred to cutoff input, and the program report correctly described a 20-byte parameter member. The Phase 2 source recheck resolved this inconsistency:

| Evidence | Meaning |
| --- | --- |
| `Copybook/VMBZ270I.cpy`, physical lines 10–14 | Supplied 20-byte archive parameter layout |
| `DB2 Manual converted Programs/VMDZ7200.cbl`, physical line 200 | Missing target `COPY VMDZ270I` |
| The same target, physical lines 410–423 | `READ DAARCH INTO VMDZ270I-REC` and use of `DA-ARCH-YMD` as the cutoff parameter |
| The same target, physical lines 75–194 and 879 | Separate inline output group and `WRITE FORM-REC FROM REC-FORM` |

The current Q-000025 question and synthetic answer refer to the **20-byte parameter input**. The test assumes the legacy input layout is retained with the level-01 name changed. It does not create the missing target member or establish compilation. The separate **530-byte output** and its filler/consumer compatibility remain under Q-000005.

The stable question ID is unchanged because the missing artifact is still `VMDZ270I`. Its original internal key is retained for identity continuity, with a descriptive input-role alias. The original unanswered wording remains in [the Phase 1 snapshot](Migration-Analysis/Phase-1/Run-001/_audit/questions/Q-000025.md). The corrected version is [the Phase 2 snapshot](Migration-Analysis/Phase-2/Run-001/_audit/questions/Q-000025.md).

An initial synthetic answer also inherited the wrong output label. It was superseded before Phase 2 was finalized; an intermediate corrected draft was then made consistent with its dedicated supersession field. [ANSWER_REVISIONS.json](answer-revisions/ANSWER_REVISIONS.json) records the exact old and current hashes and links both retained prior drafts. All other 38 answer versions were unchanged by this correction. All retained versions are assistant-written test data; none is human approval.

The skill now explicitly requires source checking of a question's premise and interface role before applying an answer.

## 2. One displayed source hash

The Phase 1 `VM7BD200.cbl` report's dependency table accidentally inserted a space after the first character of the displayed `Schema/VMBTS03.txt` hash during prose formatting. The correct SHA-256 is:

```text
a1578229fa9086afc8b074cbd526c256099c1ddecfacf30acf5aaa64bdef6fdd
```

The source bytes, SOURCE_MANIFEST.json and machine audit hashes were correct throughout. Phase 2 fixes the display. The frozen Phase 1 report retains the typographical error as issued; the baseline integrity checks therefore remain meaningful. No other split hexadecimal hash was found in the baseline Markdown review.

## 3. Scope clarifications retained in the revised analysis

- Q-000019 for VMDZ4310 assumes immutable input on a rerun; it does **not** establish a frozen database snapshot for the two SELECTs. Output equivalence under concurrent database changes remains unresolved. Q-000007 for VMDZ7200 explicitly assumes a frozen read snapshot, while Q-000038 and Q-000039 separately state a stable database snapshot for the navigation outputs.
- Q-000031's empty target/checkpoint fixture cannot mean required parent/form business rows are absent from a successful update fixture. Literal empty business tables are rejection cases; successful fixtures need the separately scoped parent/key conditions.
- Q-000017's minimum-date convention does not prove that the VMDZ1526 key builder converts zero creation-date components. That builder's actual assignment and the missing load rule remain part of the assessment.

These are limits on the synthetic assumptions. They do not alter any source-based defect or provide missing production evidence.
