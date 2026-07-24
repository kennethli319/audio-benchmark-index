#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir audiobook_narration_appeal)"
repo_raw="https://raw.githubusercontent.com/spotify-research/audiobook-narrations-interspeech/main"

download_url "$repo_raw/README.md" "$out/README.md"
download_url "$repo_raw/LICENSE" "$out/LICENSE"
download_url "$repo_raw/dataset.csv" "$out/dataset.csv"
download_url "$repo_raw/supplementary_materials.pdf" "$out/supplementary_materials.pdf"
download_url \
  "https://api.github.com/repos/spotify-research/audiobook-narrations-interspeech" \
  "$out/repository.json"
download_url "https://arxiv.org/abs/2607.02473" "$out/paper.html"

cat <<'EOF'
Downloaded the released Audiobook Narration Appeal metadata and documentation.
The CSV links to LibriVox and Internet Archive records; it does not redistribute
audiobook audio. Review source-service terms and per-item recording/text rights
before downloading or reusing linked media.
EOF

echo "Audiobook Narration Appeal metadata download complete: $out"
