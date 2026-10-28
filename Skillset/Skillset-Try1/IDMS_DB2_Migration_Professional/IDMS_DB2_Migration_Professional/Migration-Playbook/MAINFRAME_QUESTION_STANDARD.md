# Mainframe COBOL Question Standard

Audience: senior Mainframe COBOL, IDMS and DB2 developers.

## Ask only if all conditions hold
- A material IDMS-to-DB2 conversion semantic uncertainty remains after inspecting relevant source, target and supporting artifacts.
- It is tied to named program files and exact code locations.
- Different answers change business output, control flow, SQL status/result, parent-child processing, data selection/order, update or restart/replay behavior.
- The answer cannot be derived from the artifacts or existing configuration/answers.

## Preferred question forms
**YES/NO:** “In `<program>` paragraph `<paragraph>`, when the parent record is found but no qualifying child is returned, must the DB2 program preserve the original IDMS child-missing status? YES / NO”

**Options (rare):** A/B/C only when source evidence shows multiple distinct business outcomes and YES/NO cannot express the decision.

**Open question (exceptional):** only when no finite options can capture the business decision; explain why.

## Never ask
- “Any doubts?” or “Please confirm the logic.”
- General COBOL/DB2 knowledge questions.
- Compiler, bind, JCL, environment or build questions.
- General testing plans or test approvals.
- Questions whose answer is explicit in code or reference files.
- Requests for decommission names or replacement names already designated for `MIGRATION_CONFIG.md`.
- Hypothetical edge cases without a relevant path in the actual program.
- Multiple questions in one file if they are independent.

One file per distinct material decision; consolidate the same question across programs when the same rule applies. Zero questions is valid.
