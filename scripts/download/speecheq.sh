#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir speecheq)"
hf_repo="${SPEECHEQ_HF_REPO:-SpeechEQ/SpeechEQ}"
raw_base_url="${SPEECHEQ_RAW_BASE_URL:-https://raw.githubusercontent.com/binomial14/SpeechEQ/main}"

download_url "https://arxiv.org/abs/2606.25990" "$out/paper.html"
download_url "https://huggingface.co/datasets/$hf_repo/raw/main/README.md" "$out/dataset-card.md"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/huggingface-api.json"
download_url "$raw_base_url/README.md" "$out/code-README.md"
download_url "https://api.github.com/repos/binomial14/SpeechEQ" "$out/github-repo.json"

if [[ "${SPEECHEQ_DOWNLOAD_HF:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded SpeechEQ documentation and repository metadata only.

Set SPEECHEQ_DOWNLOAD_HF=1 to download the five Parquet shards with embedded
audio (approximately 2.45 GB). Neither the dataset nor code release currently
states a license; clarify rights before redistribution or commercial use.
EOF
  echo "SpeechEQ metadata download complete: $out"
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/huggingface"
echo "SpeechEQ requested snapshot download complete: $out/huggingface"
