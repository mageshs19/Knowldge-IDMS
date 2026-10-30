# Production gap plan

## Current halfway-state problems

The supplied halfway run has 41 program reports but only one generic guide. The existing reports contain useful evidence and many reusable rule IDs, but the knowledge is still embedded in narrative reports.

The continuation must close these production gaps:

1. **Missing generic coverage** — create/re-synthesize all four high-level generic guides from the full 41-report corpus.
2. **No semantic machine contract** — `machine/rules.json` must contain executable rule semantics, not only rule-ID occurrences.
3. **No full rule/program matrix** — every semantic rule must be tested against all 41 program reports.
4. **No per-program completion queue** — use `program-gaps/` to track what each report must contribute and what is still unresolved.
5. **Program reports may be incomplete** — add `program-enhancements/<program>__ADDENDUM.md` when additional analysis is needed. Never rewrite the copied original report.
6. **Existing generic guide may itself be incomplete** — treat the old `04_LRF_UPDATE_RESTART.md` as evidence, not as automatically production-complete. Re-synthesize it from all applicable program reports.
7. **Human answers need stable import** — consume answers by Q ID only; keep original Q wording/IDs and answer provenance.
8. **No single complete handoff folder** — always publish all current artifacts into `Final-Output/`.

## What Copilot must not do

- Do not modify `Previous-Project-Snapshot/`.
- Do not replace the 41 existing reports with shorter summaries.
- Do not infer a generic conversion rule from a single program without checking variants/counterexamples.
- Do not mark a rule production-ready merely because a human answered a question.
- Do not make the future Python engine parse long Markdown reports to rediscover semantics.
