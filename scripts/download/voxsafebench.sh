#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir voxsafebench)"
paper_url="${VOXSAFEBENCH_PAPER_URL:-https://arxiv.org/abs/2604.14548}"
project_url="${VOXSAFEBENCH_PROJECT_URL:-https://amphionteam.github.io/VoxSafeBench_demopage/}"
repo_base_url="${VOXSAFEBENCH_REPO_BASE_URL:-https://raw.githubusercontent.com/AmphionTeam/VoxSafeBench/main}"
repo_api_url="${VOXSAFEBENCH_REPO_API_URL:-https://api.github.com/repos/AmphionTeam/VoxSafeBench}"
hf_repo="${VOXSAFEBENCH_HF_REPO:-YuxiangW/VoxSafeBench}"
hf_api_url="${VOXSAFEBENCH_HF_API_URL:-https://huggingface.co/api/datasets/$hf_repo}"

download_url "$paper_url" "$out/arxiv-2604.14548.html"
download_url "$project_url" "$out/project.html"
download_url "$repo_base_url/README.md" "$out/README.md"
download_url "$repo_base_url/LICENSE" "$out/LICENSE"
download_url "$repo_api_url" "$out/github-api.json"
download_url "$hf_api_url" "$out/huggingface-api.json"

if [[ "${VOXSAFEBENCH_DOWNLOAD_HF:-0}" != "1" ]]; then
  echo "Downloaded VoxSafeBench public documentation and metadata to: $out"
  echo "The approximately 23.6 GiB dataset is auto-gated. Accept its Hugging Face terms before opting in."
  exit 0
fi

if [[ "${VOXSAFEBENCH_ACK_TERMS:-0}" != "1" ]]; then
  manual_required \
    "VoxSafeBench" \
    "Log in to Hugging Face and accept the dataset repository's access conditions." \
    "Then rerun with VOXSAFEBENCH_ACK_TERMS=1 VOXSAFEBENCH_DOWNLOAD_HF=1."
fi

hf_download_dataset "$hf_repo" "$out/huggingface"
echo "VoxSafeBench Hugging Face snapshot complete: $out/huggingface"
echo "Review upstream source rights and the paper's responsible-use guidance before use."
