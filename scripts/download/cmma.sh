#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir cmma)"
repo="https://github.com/annoymity2022/Chinese-Dataset"
raw="$repo/raw/main"

download_url "$raw/README.md" "$out/README.md"
download_url "$raw/Datacard/Datacards.pdf" "$out/Datacards.pdf"
download_url "$raw/License/License-English.txt" "$out/LICENSE.txt"
download_url "$raw/AnnotationGuidance/CMMA%20Annotation%20guidance-English.doc" \
  "$out/CMMA-Annotation-guidance-English.doc"
download_url "$raw/text/CMMA-RoleIntroduction.csv" "$out/CMMA-RoleIntroduction.csv"
download_url "$raw/text/CMMA-TopicDescription.csv" "$out/CMMA-TopicDescription.csv"
download_url "$raw/text/train.csv" "$out/train.csv"
download_url "$raw/text/dev.csv" "$out/dev.csv"
download_url "$raw/text/test.csv" "$out/test.csv"
download_url "https://api.github.com/repos/annoymity2022/Chinese-Dataset" \
  "$out/github-api.json"

if [[ "${CMMA_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo.git" "$out/Chinese-Dataset"
else
  echo "Skipping repository clone. Set CMMA_CLONE_REPO=1 to clone it."
fi

cat <<'EOF'
CMMA lightweight release files downloaded.

The approximately 12.66 GB audiovisual archive is a manual Google Drive download:
https://drive.google.com/file/d/19NgqpYLPa3bLFm4YUjuCT2sbmQemziG-/view

The repository agreement permits only attributed noncommercial use and states
that source owners retain copyright in the television conversations. Review
third-party media rights before using or redistributing the audiovisual data.
EOF

echo "CMMA metadata download complete: $out"
