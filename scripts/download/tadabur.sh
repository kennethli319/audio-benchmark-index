#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir tadabur)"
dataset="FaisaI/tadabur"

download_url \
  "https://huggingface.co/datasets/$dataset/raw/main/README.md" \
  "$out/README.md"
download_url \
  "https://huggingface.co/api/datasets/$dataset" \
  "$out/huggingface-api.json"
download_url \
  "https://raw.githubusercontent.com/fherran/tadabur/main/README.md" \
  "$out/repository-README.md"
download_url \
  "https://api.github.com/repos/fherran/tadabur" \
  "$out/github-api.json"

if [[ "${TADABUR_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "$dataset" "$out/huggingface"
else
  cat <<'EOF'
Downloaded official Tadabur documentation and repository metadata only.

Set TADABUR_DOWNLOAD_HF=1 to download the public 1,400+ hour audio-bearing
snapshot. The Hugging Face API reports approximately 1.94 TB of storage. The
card declares CC BY-NC 4.0 and
research/education use, but does not provide per-recording source-license
provenance; review source and cultural-use terms before reuse.
EOF
fi

echo "Tadabur metadata download complete: $out"
