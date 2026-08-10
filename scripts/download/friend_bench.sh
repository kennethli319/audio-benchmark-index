#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir friend_bench)"
dataset="https://huggingface.co/datasets/fluid-concepts/friend-bench"

download_url "$dataset/raw/main/README.md" "$out/dataset-card.md"
download_url "$dataset/raw/main/TERMS.md" "$out/TERMS.md"
download_url "https://huggingface.co/api/datasets/fluid-concepts/friend-bench" "$out/huggingface-api.json"
download_url \
  "https://huggingface.co/datasets/facebook/seamless-interaction/raw/main/README.md" \
  "$out/seamless-interaction-card.md"

if [[ "${FRIEND_BENCH_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "fluid-concepts/friend-bench" "$out/hf"
elif [[ "${FRIEND_BENCH_DOWNLOAD_METADATA:-0}" == "1" ]]; then
  hf_download_dataset \
    "fluid-concepts/friend-bench" \
    "$out/hf-metadata" \
    --include "CITATION.cff" \
    --include "TERMS.md" \
    --include "validation/data/metadata.csv" \
    --include "validation/ratings/human_ratings.csv" \
    --include "validation/ratings/model_predictions.csv" \
    --include "validation/baselines/results.csv" \
    --include "validation/eval.py"
else
  cat <<'EOF'
Downloaded official FriendBench and Seamless Interaction documentation only.

Set FRIEND_BENCH_DOWNLOAD_METADATA=1 to fetch the lightweight manifest,
ratings, model predictions, baseline results, evaluator, terms, and citation.
Set FRIEND_BENCH_DOWNLOAD_HF=1 to fetch the complete public snapshot
(approximately 433 MB, including audio/video). The MINT 2026 paper covers only
the released validation config. Review the CC BY-NC 4.0 and source-corpus
responsible-use terms.
EOF
fi

echo "Friend Bench metadata download complete: $out"
