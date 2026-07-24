#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir mlc_slm_2nd_challenge)"
challenge_repo="Nexdata-AI/2nd-Challenge-Workshop-on-Multilingual-Conversational-Speech-Language-Model-"

download_url \
  "https://raw.githubusercontent.com/$challenge_repo/main/README.md" \
  "$out/challenge_README.md"
download_url \
  "https://api.github.com/repos/$challenge_repo" \
  "$out/challenge_repo.json"
download_url \
  "https://www.nexdata.ai/nexdata/static/file/doc/Data%20use%20agreement2026.docx" \
  "$out/data-use-agreement-2026.docx"
download_url \
  "https://raw.githubusercontent.com/alanshaoTT/MLC-SLM-2nd-Task1-Baseline/main/README.md" \
  "$out/task1-baseline_README.md"
download_url \
  "https://api.github.com/repos/alanshaoTT/MLC-SLM-2nd-Task1-Baseline" \
  "$out/task1-baseline_repo.json"
download_url \
  "https://raw.githubusercontent.com/DontPushMeee/MLC-SLM-2nd-Task2-Baseline/main/README.md" \
  "$out/task2-baseline_README.md"
download_url \
  "https://api.github.com/repos/DontPushMeee/MLC-SLM-2nd-Task2-Baseline" \
  "$out/task2-baseline_repo.json"
download_url \
  "https://export.arxiv.org/api/query?id_list=2607.12468" \
  "$out/task1-system-paper-arxiv.xml"

manual_required \
  "2nd MLC-SLM Challenge 2026" \
  "Register through the official organizer form:" \
  "  https://forms.gle/LfyNjfjBV3eYwzdp8" \
  "Review and accept the workshop-only data-use agreement before access." \
  "The agreement prohibits redistribution and use outside the workshop."
