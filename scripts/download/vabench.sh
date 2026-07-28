#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir vabench)"
repo="https://github.com/tanABCC/VABench"
raw="https://raw.githubusercontent.com/tanABCC/VABench/main"

download_url "$repo" "$out/project.html"
download_url "https://api.github.com/repos/tanABCC/VABench" "$out/github-repository.json"
download_url "$raw/README.md" "$out/README.md"
download_url "$raw/mapping/final_idx_to_prompt.csv" "$out/final_idx_to_prompt.csv"
download_url "https://arxiv.org/abs/2512.09299" "$out/paper.html"
download_url \
  "https://huggingface.co/datasets/tanABBCC/VABench_I2AV/raw/main/README.md" \
  "$out/VABench_I2AV-README.md"

if [[ "${VABENCH_CLONE_TOOLKIT:-0}" == "1" ]]; then
  clone_or_update "$repo.git" "$out/VABench"
fi

if [[ "${VABENCH_DOWNLOAD_I2AV_IMAGES:-0}" == "1" ]]; then
  hf_download_dataset "tanABBCC/VABench_I2AV" "$out/VABench_I2AV" \
    --include "README.md" \
    --include "images.zip"
fi

cat <<EOF
VABench requested downloads complete: $out

The approximately 36.5 GB VABENCH_CACHE_DIR release contains evaluator model
caches, not benchmark examples, and is not downloaded by this helper. Review
the terms of each third-party evaluator and weight before reproducing all
metrics.
EOF
