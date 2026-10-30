from pathlib import Path
import json, re
root = Path(__file__).resolve().parents[2]
answer_file = root / 'Answer.txt'
out = root / 'Phase-2' / 'audit' / 'human_answers.json'
if not answer_file.exists():
    raise SystemExit('Missing Answer.txt at project root')
text = answer_file.read_text(encoding='utf-8', errors='replace')
parts = re.split(r'(?m)^(Q-\d+)\s*$', text)
answers = {}
for i in range(1, len(parts), 2):
    qid = parts[i]
    block = parts[i+1]
    m = re.search(r'(?ms)^COBOL TEAM ANSWER:\s*(.*?)(?=\n(?:Q-\d+\s*$|\Z))', block)
    ans = m.group(1).strip() if m else ''
    answers[qid] = {'answer': ans, 'answered': bool(ans)}
out.parent.mkdir(parents=True, exist_ok=True)
out.write_text(json.dumps({'source':'Answer.txt','questions':answers}, indent=2), encoding='utf-8')
print(f'Imported {sum(v["answered"] for v in answers.values())} answered / {len(answers)} total Q IDs -> {out}')
