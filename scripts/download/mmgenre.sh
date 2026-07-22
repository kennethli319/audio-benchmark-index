#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir mmgenre)"
card_url="${MMGENRE_CARD_URL:-https://huggingface.co/datasets/Leaky-ReLU/MMGenre/raw/main/README.md}"
dataset_api_url="${MMGENRE_DATASET_API_URL:-https://huggingface.co/api/datasets/Leaky-ReLU/MMGenre}"
repo_readme_url="${MMGENRE_REPO_README_URL:-https://raw.githubusercontent.com/FengJin1117/mmgenre/main/README.md}"
repo_license_url="${MMGENRE_REPO_LICENSE_URL:-https://raw.githubusercontent.com/FengJin1117/mmgenre/main/LICENSE}"
paper_url="${MMGENRE_PAPER_URL:-https://arxiv.org/abs/2607.06986}"

download_url "$card_url" "$out/dataset-README.md"
download_url "$dataset_api_url" "$out/huggingface-dataset.json"
download_url "$repo_readme_url" "$out/repository-README.md"
download_url "$repo_license_url" "$out/LICENSE"
download_url "$paper_url" "$out/paper.html"

if [[ "${MMGENRE_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update_repo "https://github.com/FengJin1117/mmgenre" "$out/repo"
fi

if [[ "${MMGENRE_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "Leaky-ReLU/MMGenre" "$out/hf"
else
  cat <<'EOF'
Downloaded MMGenre documentation and metadata only.

Set MMGENRE_CLONE_REPO=1 to clone the lightweight symbolic-score/code release.
Set MMGENRE_DOWNLOAD_HF=1 to fetch the public, ungated Hugging Face snapshot
(approximately 5.54 GB). The release declares CC BY 4.0, but its source music
was generated with Suno V4.5; review applicable generation-service terms.
EOF
fi

echo "MMGenre metadata download complete: $out"
