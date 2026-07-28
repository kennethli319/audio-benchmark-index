#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir xares_llm)"
repo_raw="https://raw.githubusercontent.com/xiaomi-research/xares-llm/main"
repo_url="https://github.com/xiaomi-research/xares-llm.git"

download_url "$repo_raw/README.md" "$out/repository-README.md"
download_url "$repo_raw/LICENSE" "$out/repository-LICENSE"
download_url \
  "https://api.github.com/repos/xiaomi-research/xares-llm" \
  "$out/repository-api.json"
download_url \
  "$repo_raw/src/xares_llm/tasks/task1/eval/eval_task1_config.yaml" \
  "$out/public-track-a-eval.yaml"
download_url \
  "$repo_raw/src/xares_llm/tasks/task2/eval/eval_task2_config.yaml" \
  "$out/public-track-b-eval.yaml"
download_url \
  "https://huggingface.co/datasets/mispeech/xares_llm_data/raw/main/README.md" \
  "$out/xares_llm_data-README.md"
download_url \
  "https://huggingface.co/api/datasets/mispeech/xares_llm_data" \
  "$out/xares_llm_data-api.json"
download_url "https://arxiv.org/abs/2603.22728" "$out/paper.html"

if [[ "${XARES_LLM_CLONE_TOOLKIT:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/xares-llm"
fi

if [[ "${XARES_LLM_DOWNLOAD_DATA:-0}" == "1" ]]; then
  hf_download_dataset "mispeech/xares_llm_data" "$out/xares_llm_data"
  hf_download_dataset "mispeech/MECAT-Caption" "$out/MECAT-Caption"
else
  cat <<'EOF'
Downloaded official XARES-LLM metadata, public-track configs, and license text.

Set XARES_LLM_CLONE_TOOLKIT=1 to clone the Apache-2.0 evaluation toolkit.
Set XARES_LLM_DOWNLOAD_DATA=1 to fetch both public dataset snapshots. The main
WebDataset repository reports about 128.7 GB of storage and MECAT-Caption is
approximately 16.2 GB, so review disk space and every component corpus license
before opting in. Hidden Interspeech 2026 challenge shards are not public.
EOF
fi

echo "XARES-LLM metadata download complete: $out"
