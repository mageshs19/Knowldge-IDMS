#!/usr/bin/env python3
import argparse, re
from pathlib import Path

Q_RE=re.compile(r'\bQ-(\d+)\b')
RULE_RE=re.compile(r'\b((?:PLAT|CPY|HLP|DATE|LRO|LRM|LRS|ERR|RST|CMT|CNT|AUD|PROC|ORD|SEQ|NAME|MSG|KEY|XPG|DSP|ARI)(?:-[A-Z0-9]+)+)\b')
PAIR_KEYS=('Legacy program','DB2 program','Legacy |','DB2 |','Pairing','Program type','IDMS access','Completion')
FINDING_RE=re.compile(r'^\s*\|\s*(D-|C-|V-|L-|E-|R-|T-)[^|]*\|', re.I)
SEVERITY_WORDS=('High','Medium','Low','decision needed','cross-program','FAIL','NO (','CONFLICT')
CONCEPTS={
 'LRF':['lrf','logical record','lr-status','lr status'],
 'Restart':['restart','ffrecab','dz01rst','checkpoint','commit'],
 'Cursor_SQL':['cursor','fetch','open ','close ','select ','update ','insert ','delete '],
 'Error_Handling':['sqlcode','sqlerror','useraben','abend','error-status','return code'],
 'Field_Mapping':['dclgen','mapping','char(','decimal(','date','comp-3','packed','display'],
 'Storage':['occurs','redefines','working-storage','helper','unsigned','signed'],
 'Ordering_Relationships':['set order','order by','duplicates','owner','member','foreign key','calc key'],
 'Decommission':['decommission'],
}

def uniq(seq):
    out=[]; seen=set()
    for x in seq:
        if x not in seen: seen.add(x); out.append(x)
    return out

def main():
    ap=argparse.ArgumentParser(); ap.add_argument('--programs',required=True); ap.add_argument('--out',required=True); a=ap.parse_args()
    src=Path(a.programs); out=Path(a.out); out.mkdir(parents=True,exist_ok=True)
    reports=sorted(src.rglob('*__migration.md'))
    index=['# 41-program gap and enhancement index','',f'Program reports assessed: **{len(reports)}**','',
           'These files do not replace the original reports. They are Copilot work-queue summaries generated only from evidence already present in each report.','',
           '| Program report | Open Q IDs | Important findings | Concepts to extract |','|---|---:|---:|---|']
    for p in reports:
        text=p.read_text(encoding='utf-8',errors='replace'); lines=text.splitlines(); low=text.lower()
        qids=[]; rules=[]; context=[]; findings=[]
        for i,line in enumerate(lines,1):
            for q in Q_RE.findall(line):
                qid=f'Q-{int(q):02d}' if int(q)<100 else f'Q-{int(q)}'; qids.append(qid)
            rules.extend(RULE_RE.findall(line))
            if any(k.lower() in line.lower() for k in PAIR_KEYS) and len(context)<12:
                context.append((i,line.strip()))
            if FINDING_RE.search(line) and (any(w.lower() in line.lower() for w in SEVERITY_WORDS) or len(findings)<8):
                findings.append((i,line.strip()))
        qids=uniq(qids); rules=uniq(rules)
        active=[]
        for c,kws in CONCEPTS.items():
            if any(k in low for k in kws): active.append(c)
        name=p.name.replace('__migration.md','').replace('.cbl','')
        md=[f'# Gap / enhancement assessment — {name}','',
            f'- Source report: `{p.relative_to(src)}`',
            '- Authority: original Phase-1 report remains the evidence source.',
            '- Purpose: tell Copilot what this report must contribute to the production concept/rule library and what remains unresolved.','',
            '## Existing report context','']
        md += [f'- L{i}: {line}' for i,line in context] or ['- No compact context line extracted; read the original report header.']
        md += ['', '## Open / referenced COBOL-team questions','']
        md += [f'- `{q}`' for q in qids] or ['- None detected.']
        md += ['', '## Important report findings to preserve','']
        md += [f'- L{i}: {line}' for i,line in findings[:20]] or ['- No severity-marked finding extracted automatically; semantic review still required.']
        md += ['', '## Reusable rule IDs already present','']
        md += [f'- `{r}`' for r in rules] or ['- None detected by known rule-prefix pattern.']
        md += ['', '## Concepts this program must contribute to','']
        md += [f'- {c}' for c in active] or ['- Semantic review required to classify.']
        md += ['', '## Required production enhancement for Copilot','',
               '1. Read the full original program report before creating or changing any generic rule.',
               '2. Extract each reusable behavior into the appropriate concept rule file; do not copy narrative blindly.',
               '3. Record rule conditions, exceptions, legacy operation/status, DB2 replacement, field/type dependencies, and evidence anchors.',
               '4. Add or update the corresponding semantic entry in `machine/rules.json`.',
               '5. Add this program to the program × rule coverage matrix with APPLIES_SUPPORTS / APPLIES_VARIANT / APPLIES_CONTRADICTS / NOT_APPLICABLE / UNKNOWN.',
               '6. Keep every unresolved business decision tied to the existing Q ID; do not invent a replacement Q ID.',
               '7. If the existing report itself is incomplete, add a continuation addendum under `program-enhancements/`; do not edit the copied original report.',
               '', '## Completion checklist','',
               '- [ ] Full report semantically reviewed',
               '- [ ] Reusable concepts extracted',
               '- [ ] Machine rules updated',
               '- [ ] Coverage matrix updated',
               '- [ ] Questions linked',
               '- [ ] Program enhancement addendum created if needed',
               '- [ ] No original report modified','']
        of=out/f'{name}__GAP_ENHANCEMENT.md'; of.write_text('\n'.join(md),encoding='utf-8')
        index.append(f'| `{p.name}` | {len(qids)} | {len(findings[:20])} | {", ".join(active) if active else "Review required"} |')
    (out/'00_INDEX.md').write_text('\n'.join(index)+'\n',encoding='utf-8')
    print(f'generated {len(reports)} program gap files + index')
if __name__=='__main__': main()
