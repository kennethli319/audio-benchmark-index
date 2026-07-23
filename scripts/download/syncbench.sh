#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir syncbench)"
repo="https://github.com/chenhaoqcdyq/BeyondTimeShifts"
dataset="https://huggingface.co/datasets/qianyijie/SyncBench"

download_url "$repo/raw/main/README.md" "$out/README.md"
download_url "$repo/raw/main/LICENSE" "$out/LICENSE"
download_url "https://api.github.com/repos/chenhaoqcdyq/BeyondTimeShifts" "$out/github-api.json"
download_url "https://huggingface.co/api/datasets/qianyijie/SyncBench" "$out/huggingface-api.json"
download_url "$dataset/resolve/main/closed_ours_scores.json" "$out/closed_ours_scores.json"
download_url "$dataset/resolve/main/ltx_ours_scores.json" "$out/ltx_ours_scores.json"

if [[ "${SYNCBENCH_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo.git" "$out/BeyondTimeShifts"
fi

if [[ "${SYNCBENCH_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "qianyijie/SyncBench" "$out/hf"
else
  cat <<'EOF'
Downloaded official documentation, metadata, and lightweight score files only.

Set SYNCBENCH_DOWNLOAD_HF=1 to fetch the public, ungated Hugging Face snapshot
(approximately 12.9 GB). The dataset has no stated license; repository MIT
terms cover the code, not necessarily the generated benchmark videos.
EOF
fi

echo "SyncBench metadata download complete: $out"
