#!/usr/bin/env python3
import argparse, hashlib, json, sys
from pathlib import Path

def sha(p):
    h=hashlib.sha256(); h.update(p.read_bytes()); return h.hexdigest()

def main():
    ap=argparse.ArgumentParser(); ap.add_argument('--project-root',required=True); a=ap.parse_args(); root=Path(a.project_root).resolve()
    errs=[]; warns=[]
    prev=root/'Previous-Project-Snapshot/IDMS_DB2_Copilot_Project/Migration-Analysis/Phase-1/Run-001/programs'
    run=root/'Work/Phase-1-Gap-Fix/Run-001'; final=root/'Final-Output'
    prev_reports=sorted(prev.rglob('*__migration.md')); work_reports=sorted((run/'programs').rglob('*__migration.md')); final_reports=sorted((final/'programs').rglob('*__migration.md'))
    if len(prev_reports)!=41: warns.append(f'expected current baseline 41 reports, found {len(prev_reports)}')
    if len(work_reports)!=len(prev_reports): errs.append(f'Work report count {len(work_reports)} != baseline {len(prev_reports)}')
    if len(final_reports)!=len(prev_reports): errs.append(f'Final-Output report count {len(final_reports)} != baseline {len(prev_reports)}')
    byname={p.name:p for p in prev_reports}
    for p in work_reports:
        if p.name in byname and sha(p)!=sha(byname[p.name]): errs.append(f'copied original report modified: {p.name}')
    gaps=list((run/'program-gaps').glob('*__GAP_ENHANCEMENT.md'))
    if len(gaps)!=len(prev_reports): errs.append(f'program-gap file count {len(gaps)} != report count {len(prev_reports)}')
    if not (run/'program-gaps/00_INDEX.md').exists(): errs.append('missing program-gaps/00_INDEX.md')
    req_guides=['01_RETRIEVAL_WITHOUT_LRF.md','02_UPDATE_RESTART_WITHOUT_LRF.md','03_LRF_RETRIEVAL.md','04_LRF_UPDATE_RESTART.md']
    miss=[g for g in req_guides if not (run/'generic'/g).exists()]
    if miss: warns.append('semantic gap run still required; missing guides: '+', '.join(miss))
    rules=run/'machine/rules.json'
    if not rules.exists(): errs.append('missing machine/rules.json')
    else:
        try: n=len(json.loads(rules.read_text()).get('rules',[]))
        except Exception: errs.append('machine/rules.json invalid JSON'); n=0
        if n==0: warns.append('semantic machine rules not populated yet')
    for req in ['Human-Review/COBOL_TEAM_QUESTIONS.txt','README.md']:
        if not (final/req).exists(): errs.append(f'Final-Output missing {req}')
    status='FAIL' if errs else 'PASS'
    print(json.dumps({'status':status,'errors':errs,'warnings':warns,'baseline_reports':len(prev_reports),'program_gap_files':len(gaps)},indent=2))
    sys.exit(1 if errs else 0)
if __name__=='__main__': main()
