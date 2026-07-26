#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir k9_bench)"
project_url="${K9BENCH_PROJECT_URL:-https://ogmenrobotics.github.io/K9Bench/}"
repo_api_url="${K9BENCH_REPO_API_URL:-https://api.github.com/repos/ogmenrobotics/K9Bench-eval-code}"
raw_readme_url="${K9BENCH_README_URL:-https://raw.githubusercontent.com/ogmenrobotics/K9Bench-eval-code/main/README.md}"
hf_repo="${K9BENCH_HF_REPO:-ogmen/K9Bench}"

download_url "$project_url" "$out/project.html"
download_url "$repo_api_url" "$out/github-repository.json"
download_url "$raw_readme_url" "$out/evaluation-README.md"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/huggingface-dataset.json"
download_url "https://arxiv.org/abs/2607.02680" "$out/paper.html"

if [[ "${K9BENCH_DOWNLOAD_METADATA:-0}" != "1" ]]; then
  manual_required \
    "K9-Bench metadata" \
    "Saved public project, paper, repository, and Hugging Face API documentation to $out." \
    "The dataset table is auto-approved gated on Hugging Face. Review and accept its non-commercial/no-redistribution terms:" \
    "https://huggingface.co/datasets/$hf_repo" \
    "Then authenticate locally and set K9BENCH_ACK_TERMS=1 K9BENCH_DOWNLOAD_METADATA=1." \
    "This helper never retrieves the linked YouTube videos."
fi

if [[ "${K9BENCH_ACK_TERMS:-0}" != "1" ]]; then
  manual_required \
    "K9-Bench metadata" \
    "Set K9BENCH_ACK_TERMS=1 only after accepting the official Hugging Face access terms." \
    "The metadata cannot be redistributed, used commercially, or turned into a derivative dataset without permission."
fi

hf_download_dataset "$hf_repo" "$out/huggingface" --include "*.parquet"
echo "K9-Bench gated metadata download complete: $out/huggingface"
echo "Linked YouTube videos were not downloaded."
