#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir trea)"
raw_base="${TREA_RAW_BASE_URL:-https://raw.githubusercontent.com/iiscleap/Audio-LLM-benchmarking-uncertainty/main}"
repo_url="${TREA_REPO_URL:-https://github.com/iiscleap/Audio-LLM-benchmarking-uncertainty.git}"
repo_api="${TREA_REPO_API_URL:-https://api.github.com/repos/iiscleap/Audio-LLM-benchmarking-uncertainty}"
paper_url="${TREA_PAPER_URL:-https://arxiv.org/abs/2505.13115}"

download_url "$raw_base/README.md" "$out/repository-README.md"
download_url "$raw_base/LICENSE" "$out/repository-LICENSE"
download_url "$repo_api" "$out/github-api.json"
download_url "$paper_url" "$out/arxiv-2505.13115.html"

for task in count duration order; do
  download_url \
    "$raw_base/TREA_dataset/$task/$task.csv" \
    "$out/annotations/multiple-choice/$task.csv"
  download_url \
    "$raw_base/TREA_dataset/$task/${task}_with_metadata.csv" \
    "$out/annotations/metadata/${task}_with_metadata.csv"
  download_url \
    "$raw_base/TREA_dataset_open_text/$task/${task}_nl.csv" \
    "$out/annotations/open-text/${task}_nl.csv"
done

if [[ "${TREA_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/Audio-LLM-benchmarking-uncertainty"
else
  cat <<MSG
TREA documentation and lightweight annotations downloaded to: $out

The official repository includes the derived audio and is approximately 688 MiB.
Set TREA_CLONE_REPO=1 to clone it after reviewing the repository CC0 license
and the surviving ESC-50 source-audio terms.
MSG
fi
