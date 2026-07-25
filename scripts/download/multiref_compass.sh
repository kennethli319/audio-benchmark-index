#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir multiref_compass)"
repo="https://github.com/zxhhh0201/MultiRef-Compass"
hf_repo="zxhhhhhh/MultiRef-Compass"
hf_base="https://huggingface.co/datasets/$hf_repo"

download_url "$hf_base/raw/main/README.md" "$out/dataset-README.md"
download_url "https://huggingface.co/api/datasets/$hf_repo" \
  "$out/huggingface-dataset.json"
download_url "$hf_base/resolve/main/data/samples.csv" "$out/samples.csv"
download_url "$hf_base/resolve/main/data/samples.jsonl" "$out/samples.jsonl"
download_url "$repo/raw/main/README.md" "$out/project-README.md"
download_url "$repo/raw/main/LICENSE" "$out/repository-LICENSE"
download_url "https://api.github.com/repos/zxhhh0201/MultiRef-Compass" \
  "$out/github-repository.json"

if [[ "${MULTIREF_COMPASS_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo.git" "$out/MultiRef-Compass"
else
  echo "Skipping toolkit clone. Set MULTIREF_COMPASS_CLONE_REPO=1 to clone it."
fi

if [[ "${MULTIREF_COMPASS_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "$hf_repo" "$out/huggingface"
else
  echo "Skipping the approximately 1.96 GB Hugging Face snapshot."
  echo "Set MULTIREF_COMPASS_DOWNLOAD_HF=1 to download it."
fi

cat <<'EOF'
The public manifest currently contains image and video reference columns but no
reference-audio column or audio files. Explicit audio-reference conditions from
the paper therefore remain only partially reproducible.
EOF

echo "MultiRef-Compass metadata download complete: $out"
