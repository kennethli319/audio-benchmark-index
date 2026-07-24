#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir sonic_seasoning)"
hf_repo="${SONIC_SEASONING_HF_REPO:-csc-unipd/sonic-seasoning}"
card_url="${SONIC_SEASONING_CARD_URL:-https://huggingface.co/datasets/$hf_repo/raw/main/README.md}"
dataset_api_url="${SONIC_SEASONING_DATASET_API_URL:-https://huggingface.co/api/datasets/$hf_repo}"
ratings_url="${SONIC_SEASONING_RATINGS_URL:-https://huggingface.co/datasets/$hf_repo/resolve/main/data/train-00000-of-00001.parquet}"
repo_raw="${SONIC_SEASONING_REPO_RAW:-https://raw.githubusercontent.com/CSCPadova/wav2taste/master}"
repo_api_url="${SONIC_SEASONING_REPO_API_URL:-https://api.github.com/repos/CSCPadova/wav2taste}"
paper_url="${SONIC_SEASONING_PAPER_URL:-https://arxiv.org/abs/2607.03296}"

download_url "$card_url" "$out/dataset-README.md"
download_url "$dataset_api_url" "$out/huggingface-dataset.json"
download_url "$ratings_url" "$out/ratings.parquet"
download_url "$repo_raw/README.md" "$out/repository-README.md"
download_url "$repo_raw/LICENSE" "$out/LICENSE-code"
download_url "$repo_api_url" "$out/github-repository.json"
download_url "$paper_url" "$out/paper.html"

if [[ "${SONIC_SEASONING_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "https://github.com/CSCPadova/wav2taste" "$out/repo"
fi

if [[ "${SONIC_SEASONING_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "$hf_repo" "$out/hf"
else
  cat <<'EOF'
Downloaded Sonic Seasoning documentation, metadata, and ratings/path table only.

Set SONIC_SEASONING_CLONE_REPO=1 to clone the approximately 642 KB code repo.
Set SONIC_SEASONING_DOWNLOAD_HF=1 to fetch the public, ungated Hugging Face
snapshot (approximately 797 MB including audio). The dataset is CC BY-NC 4.0,
and its source clips retain additional music, study, performer, or generated-
output rights that require review.
EOF
fi

echo "Sonic Seasoning metadata download complete: $out"
