#!/usr/bin/env python3
import argparse, json, shutil
from pathlib import Path

def copytree(src,dst):
    if not src.exists(): return
    if dst.exists(): shutil.rmtree(dst)
    shutil.copytree(src,dst)

def main():
    ap=argparse.ArgumentParser()
    ap.add_argument('--project-root',required=True)
    ap.add_argument('--phase',choices=['phase1','phase2'],default='phase1')
    a=ap.parse_args(); root=Path(a.project_root).resolve(); work=root/'Work'; final=root/'Final-Output'
    final.mkdir(parents=True,exist_ok=True)
    run = work/'Phase-1-Gap-Fix/Run-001' if a.phase=='phase1' else work/'Phase-2'
    if not run.exists(): raise SystemExit(f'run not found: {run}')
    for name in ['programs','generic','concepts','machine','program-gaps','program-enhancements']:
        copytree(run/name, final/name)
    copytree(work/'Human-Review', final/'Human-Review')
    if a.phase=='phase2':
        copytree(run/'normalized', final/'normalized-answers')
        copytree(run/'audit', final/'audit')
        answer_candidates=[root/'Answer.txt', run/'input/Answer.txt']
        for ans in answer_candidates:
            if ans.exists():
                shutil.copy2(ans, final/'Answer.txt')
                break
    for f in ['GAP_LEDGER.md','CURRENT_STATUS.md','COVERAGE_AND_VALIDATION.md','ANSWER_IMPACT.md']:
        src=run/f
        if src.exists(): shutil.copy2(src,final/f)
    meta={'published_from':str(run.relative_to(root)),'phase':a.phase}
    (final/'PUBLISH_MANIFEST.json').write_text(json.dumps(meta,indent=2),encoding='utf-8')
    readme=['# Final Output','',f'Published from `{meta["published_from"]}`.','',
            'This folder is the complete handoff surface. It contains the copied original program reports plus the latest generic guides, concept rules, machine rules, program gap/enhancement addenda, human-review material, and validation/coverage records.','',
            'For Phase 2, the consumed Answer.txt, normalized answers, and audit evidence are also copied here.','',
            'Do not use only the generic folder as the handoff. The Python engine and Phase 2 need the whole package.','']
    (final/'README.md').write_text('\n'.join(readme),encoding='utf-8')
    print(final)
if __name__=='__main__': main()
