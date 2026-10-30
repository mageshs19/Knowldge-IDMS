#!/usr/bin/env python3
import argparse, json, re
from pathlib import Path
QHEAD=re.compile(r'^(Q-\d+)\s*$')

def main():
    ap=argparse.ArgumentParser(); ap.add_argument('--input',required=True); ap.add_argument('--output',required=True); a=ap.parse_args()
    text=Path(a.input).read_text(encoding='utf-8',errors='replace').splitlines()
    items=[]; cur=None; qlines=[]; ans=[]; mode='question'
    def flush():
        nonlocal cur,qlines,ans,mode
        if cur:
            q='\n'.join(x for x in qlines if x.strip() and not x.startswith(('PROGRAM PAIR:','IMPORTANT REFERENCES:','ENGINE-IMPORTANT SUPPORT:'))).strip()
            av='\n'.join(ans).strip()
            items.append({'question_id':cur,'question_text':q,'answer':av,'answered':bool(av)})
        cur=None; qlines=[]; ans=[]; mode='question'
    for line in text:
        m=QHEAD.match(line.strip())
        if m:
            flush(); cur=m.group(1); continue
        if not cur: continue
        if line.strip()=='COBOL TEAM ANSWER:': mode='answer'; continue
        if mode=='question': qlines.append(line)
        else: ans.append(line)
    flush()
    out=Path(a.output); out.parent.mkdir(parents=True,exist_ok=True)
    out.write_text(json.dumps({'source_file':str(Path(a.input).resolve()),'answers':items},indent=2),encoding='utf-8')
    print(json.dumps({'questions':len(items),'answered':sum(1 for x in items if x['answered']),'output':str(out)},indent=2))
if __name__=='__main__': main()
