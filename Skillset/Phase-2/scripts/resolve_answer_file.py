#!/usr/bin/env python3
import argparse
from pathlib import Path

def main():
    ap=argparse.ArgumentParser()
    ap.add_argument('--project-root',required=True)
    a=ap.parse_args()
    root=Path(a.project_root).resolve()
    candidates=[root/'Answer.txt', root/'Work/Phase-2/input/Answer.txt']
    for p in candidates:
        if p.exists() and p.is_file():
            print(p)
            return
    raise SystemExit('Answer file not found. Put Answer.txt at project root or Work/Phase-2/input/Answer.txt')
if __name__=='__main__': main()
