#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir ihbench)"
hf_repo="${IHBENCH_HF_REPO:-bosonai/IHBench}"
hf_base_url="${IHBENCH_HF_BASE_URL:-https://huggingface.co/datasets/$hf_repo}"
hf_api_url="${IHBENCH_HF_API_URL:-https://huggingface.co/api/datasets/$hf_repo}"
repo_url="${IHBENCH_REPO_URL:-https://github.com/boson-ai/ihbench.git}"
raw_repo_url="${IHBENCH_RAW_REPO_URL:-https://raw.githubusercontent.com/boson-ai/ihbench/main}"
repo_api_url="${IHBENCH_REPO_API_URL:-https://api.github.com/repos/boson-ai/ihbench}"
paper_url="${IHBENCH_PAPER_URL:-https://arxiv.org/abs/2606.19595}"

download_url "$hf_base_url/raw/main/README.md" "$out/dataset-card.md"
download_url "$hf_api_url" "$out/hugging-face-api.json"
download_url "$paper_url" "$out/paper.html"
download_url "$raw_repo_url/README.md" "$out/toolkit-README.md"
download_url "$raw_repo_url/LICENSE" "$out/toolkit-LICENSE"
download_url "$repo_api_url" "$out/github-api.json"

if [[ "${IHBENCH_DOWNLOAD_BASELINE:-0}" == "1" ]]; then
  hf_download_dataset "$hf_repo" "$out/baseline" --include "baseline.parquet"
fi

if [[ "${IHBENCH_DOWNLOAD_AUDIO:-0}" == "1" ]]; then
  hf_download_dataset "$hf_repo" "$out/conversations" --include "conversations.parquet"
fi

if [[ "${IHBENCH_CLONE_TOOLKIT:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/toolkit"
fi

echo "IHBench documentation and metadata download complete: $out"
echo "Set IHBENCH_DOWNLOAD_BASELINE=1 for the 79 KB baseline-response table."
echo "Set IHBENCH_DOWNLOAD_AUDIO=1 for the approximately 216 MB conversation/audio table."
echo "Set IHBENCH_CLONE_TOOLKIT=1 to clone the Apache-2.0 evaluation toolkit."
