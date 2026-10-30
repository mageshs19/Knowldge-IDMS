#!/usr/bin/env python3
import argparse, hashlib, json, sys
from pathlib import Path
REQ_GUIDES=['01_RETRIEVAL_WITHOUT_LRF.md','02_UPDATE_RESTART_WITHOUT_LRF.md','03_LRF_RETRIEVAL.md','04_LRF_UPDATE_RESTART.md']
REQ_MACHINE=['source_fingerprint.json','program_inventory.json','rule_occurrences.json','question_registry.json','concept_index.json','rules.json']

def sha256(p):
    h=hashlib.sha256();
    with p.open('rb') as f:
        for c in iter(lambda:f.read(1024*1024),b''): h.update(c)
    return h.hexdigest()

def main():
    ap=argparse.ArgumentParser(); ap.add_argument('--source-run',required=True); ap.add_argument('--run',required=True); ap.add_argument('--answers'); a=ap.parse_args()
    src=Path(a.source_run).resolve(); run=Path(a.run).resolve(); errors=[]; warnings=[]
    fp=run/'machine/source_fingerprint.json'
    if not fp.exists(): errors.append('missing machine/source_fingerprint.json')
    else:
        data=json.loads(fp.read_text())
        for item in data.get('files',[]):
            p=src/item['path']
            if not p.exists(): errors.append(f'source file disappeared: {item["path"]}')
            elif sha256(p)!=item['sha256']: errors.append(f'IMMUTABLE SOURCE CHANGED: {item["path"]}')
    for f in REQ_MACHINE:
        if not (run/'machine'/f).exists(): errors.append(f'missing machine/{f}')
    inv=run/'machine/program_inventory.json'
    if inv.exists():
        n=json.loads(inv.read_text()).get('count',0)
        if n<1: errors.append('program inventory is empty')
    for c in ['01_platform','02_retrieval','03_store_insert','04_update_modify','05_lrf','06_cursor_sql','07_error_handling','08_restart_recovery','09_field_mapping_types','10_working_storage_helpers','11_occurs_redefines_storage','12_relationships_ordering','13_decommission','14_audit_fields','15_program_naming']:
        if not (run/'concepts'/c).exists(): errors.append(f'missing concepts/{c}')
    missing_guides=[g for g in REQ_GUIDES if not (run/'generic'/g).exists()]
    if missing_guides: warnings.append('semantic gap-fix not complete; missing generic guides: '+', '.join(missing_guides))
    rules=run/'machine/rules.json'
    if rules.exists() and len(json.loads(rules.read_text()).get('rules',[]))==0: warnings.append('machine/rules.json has no semantic rules yet')
    if a.answers:
        p=Path(a.answers)
        if not p.exists(): errors.append('answers file missing')
        else:
            ad=json.loads(p.read_text()); ids=[x.get('question_id') for x in ad.get('answers',[])]
            if len(ids)!=len(set(ids)): errors.append('duplicate Q IDs in answers')
    print(json.dumps({'errors':errors,'warnings':warnings,'status':'FAIL' if errors else 'PASS'},indent=2))
    sys.exit(1 if errors else 0)
if __name__=='__main__': main()
