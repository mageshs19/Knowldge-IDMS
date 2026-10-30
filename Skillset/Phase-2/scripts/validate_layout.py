from pathlib import Path
root = Path(__file__).resolve().parents[2]
required = [root/'IDMS_DB2_Copilot_Project', root/'Answer.txt', root/'Phase-2', root/'Phase-2'/'prompts'/'RUN_PHASE_2.prompt.md']
missing=[str(p) for p in required if not p.exists()]
if missing:
    print('FAIL')
    for p in missing: print('MISSING', p)
    raise SystemExit(1)
print('PASS: simplified Phase-2 layout is valid')
