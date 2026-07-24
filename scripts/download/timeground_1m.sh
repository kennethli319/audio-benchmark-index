#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir timeground_1m)"
hf_repo="${TIMEGROUND_1M_HF_REPO:-ai-sage/TimeGround-1M}"
hf_url="https://huggingface.co/datasets/$hf_repo"
model_url="https://huggingface.co/ai-sage/GigaChat3.1-Audio-10B-A1.8B"

download_url "$hf_url/raw/main/README.md" "$out/dataset-README.md"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/huggingface-dataset.json"
download_url "https://arxiv.org/abs/2607.10387" "$out/paper.html"
download_url "$model_url/raw/main/README.md" "$out/model-README.md"

if [[ "${TIMEGROUND_1M_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "$hf_repo" "$out/hugging-face"
else
  cat <<'EOF'
Skipping the approximately 1.50 TB Hugging Face snapshot.
Set TIMEGROUND_1M_DOWNLOAD_HF=1 only after verifying disk space.
Prefer Hugging Face streaming for a required config and split.
EOF
fi

echo "TimeGround-1M metadata download complete: $out"
