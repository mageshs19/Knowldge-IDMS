#!/usr/bin/env python3
import argparse, hashlib, json, re
from pathlib import Path
from collections import defaultdict

RULE_RE = re.compile(r'\b((?:PLAT|CPY|HLP|DATE|LRO|LRM|LRS|ERR|RST|CMT|CNT|AUD|PROC|ORD|SEQ|NAME|MSG|KEY|XPG|DSP|ARI)(?:-[A-Z0-9]+)+)\b')
Q_RE = re.compile(r'\bQ-(\d+)\b')

CONCEPT_PREFIX = {
    'PLAT':'01_platform','CPY':'01_platform','NAME':'15_program_naming',
    'LRO':'02_retrieval','SEQ':'03_store_insert','LRM':'04_update_modify','LRS':'05_lrf',
    'ERR':'07_error_handling','MSG':'07_error_handling','RST':'08_restart_recovery','CMT':'08_restart_recovery','CNT':'08_restart_recovery',
    'DATE':'09_field_mapping_types','KEY':'12_relationships_ordering','ORD':'12_relationships_ordering',
    'HLP':'10_working_storage_helpers','ARI':'11_occurs_redefines_storage','AUD':'14_audit_fields',
    'PROC':'05_lrf','DSP':'02_retrieval','XPG':'01_platform'
}
CONCEPTS = [
'01_platform','02_retrieval','03_store_insert','04_update_modify','05_lrf','06_cursor_sql','07_error_handling','08_restart_recovery','09_field_mapping_types','10_working_storage_helpers','11_occurs_redefines_storage','12_relationships_ordering','13_decommission','14_audit_fields','15_program_naming'
]

def sha256(p):
    h=hashlib.sha256()
    with p.open('rb') as f:
        for chunk in iter(lambda:f.read(1024*1024), b''): h.update(chunk)
    return h.hexdigest()

def main():
    ap=argparse.ArgumentParser()
    ap.add_argument('--source-run', required=True)
    ap.add_argument('--out', required=True)
    args=ap.parse_args()
    src=Path(args.source_run).resolve(); out=Path(args.out).resolve()
    if not src.exists(): raise SystemExit(f'Source run not found: {src}')
    prog_dir=src/'programs'
    reports=sorted(prog_dir.rglob('*__migration.md'))
    generic=sorted((src/'generic').glob('*.md')) if (src/'generic').exists() else []
    (out/'machine').mkdir(parents=True, exist_ok=True)
    (out/'generic').mkdir(parents=True, exist_ok=True)
    for c in CONCEPTS: (out/'concepts'/c).mkdir(parents=True, exist_ok=True)

    manifest=[]; inventory=[]; rule_occ=defaultdict(list); qreg=defaultdict(list); concept_programs=defaultdict(set)
    for p in reports+generic:
        manifest.append({'path':str(p.relative_to(src)),'sha256':sha256(p),'size':p.stat().st_size})
    for p in reports:
        rel=str(p.relative_to(src)); program=p.name.replace('__migration.md','')
        text=p.read_text(encoding='utf-8', errors='replace'); lines=text.splitlines()
        inventory.append({'program_report':rel,'program':program,'sha256':sha256(p),'line_count':len(lines)})
        for i,line in enumerate(lines,1):
            for rid in RULE_RE.findall(line):
                prefix=rid.split('-',1)[0]; concept=CONCEPT_PREFIX.get(prefix,'01_platform')
                rule_occ[rid].append({'program':program,'report':rel,'line':i,'text':line.strip(),'concept':concept})
                concept_programs[concept].add(program)
            for qm in Q_RE.finditer(line):
                qid=f"Q-{int(qm.group(1)):02d}" if int(qm.group(1))<100 else f"Q-{int(qm.group(1))}"
                if line.strip().startswith('|') or line.strip().startswith('Q-') or '**Q-' in line:
                    qreg[qid].append({'program':program,'report':rel,'line':i,'text':line.strip()})
        low=text.lower()
        keyword_map={
            '06_cursor_sql':['cursor','fetch','open ','close ','fetch first'],
            '13_decommission':['decommission','decommissioned'],
            '11_occurs_redefines_storage':[' occurs ','redefines','comp-3','signed','unsigned'],
            '10_working_storage_helpers':['helper','working-storage','working storage'],
        }
        for concept, kws in keyword_map.items():
            if any(k in low for k in kws): concept_programs[concept].add(program)

    (out/'machine'/'source_fingerprint.json').write_text(json.dumps({'source_run':str(src),'files':manifest},indent=2),encoding='utf-8')
    (out/'machine'/'program_inventory.json').write_text(json.dumps({'count':len(inventory),'programs':inventory},indent=2),encoding='utf-8')
    flat=[{'rule_id':rid,'occurrences':occ} for rid,occ in sorted(rule_occ.items())]
    (out/'machine'/'rule_occurrences.json').write_text(json.dumps({'rules':flat},indent=2),encoding='utf-8')
    (out/'machine'/'question_registry.json').write_text(json.dumps({'questions':[{'question_id':q,'occurrences':v} for q,v in sorted(qreg.items())]},indent=2),encoding='utf-8')
    concept_index=[]
    for c in CONCEPTS:
        programs=sorted(concept_programs[c]); concept_index.append({'concept':c,'programs':programs,'program_count':len(programs)})
        md=[f'# {c}', '', '## Evidence programs', '']
        md += [f'- `{x}`' for x in programs] or ['- No deterministic keyword/rule evidence indexed yet. Semantic review is still required.']
        md += ['', '## Rule occurrences', '']
        rids=[]
        for rid,occ in sorted(rule_occ.items()):
            if occ and occ[0]['concept']==c: rids.append(rid)
        md += [f'- `{r}`' for r in rids] or ['- None indexed by prefix.']
        md += ['', '> This file is a deterministic evidence index, not the final semantic conversion rule. Copilot Phase 1 gap-fix must split reusable semantics into one rule file per concept/variant and create matching machine/rules.json entries.','']
        (out/'concepts'/c/'EVIDENCE_INDEX.md').write_text('\n'.join(md),encoding='utf-8')
    (out/'machine'/'concept_index.json').write_text(json.dumps({'concepts':concept_index},indent=2),encoding='utf-8')
    (out/'machine'/'rules.json').write_text(json.dumps({'rules':[],'note':'Populate semantic rules during Phase 1 gap-fix. rule_occurrences.json is evidence only.'},indent=2),encoding='utf-8')

    required=['01_RETRIEVAL_WITHOUT_LRF.md','02_UPDATE_RESTART_WITHOUT_LRF.md','03_LRF_RETRIEVAL.md','04_LRF_UPDATE_RESTART.md']
    existing={p.name for p in generic}
    gap=[f'# Phase 1 Gap Ledger','',f'- Program reports detected: **{len(reports)}**',f'- Existing generic guides detected: **{len(generic)}**','', '## Missing high-level generic guides','']
    missing=[x for x in required if x not in existing]
    gap += [f'- `{x}`' for x in missing] or ['- None.']
    gap += ['', '## Required semantic gap-fix', '', '- Convert report-embedded rules into concept-specific rule files.', '- Populate `machine/rules.json` with executable rule semantics and evidence.', '- Build the full program x rule coverage matrix.', '- Reconcile counterexamples before marking a rule SUPPORTED.', '- Use stable existing Q IDs for blocked business decisions.', '']
    (out/'GAP_LEDGER.md').write_text('\n'.join(gap),encoding='utf-8')
    print(json.dumps({'program_reports':len(reports),'generic_existing':len(generic),'rule_ids':len(rule_occ),'question_ids':len(qreg),'output':str(out)},indent=2))

if __name__=='__main__': main()
