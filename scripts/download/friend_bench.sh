#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir friend_bench)"
dataset="https://huggingface.co/datasets/fluid-concepts/friend-bench"

download_url "$dataset/raw/main/README.md" "$out/dataset-card.md"
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
    --include "val/metadata.jsonl" \
    --include "val/human_responses.jsonl"
else
  cat <<'EOF'
Downloaded official Friend Bench and Seamless Interaction documentation only.

Set FRIEND_BENCH_DOWNLOAD_METADATA=1 to fetch the lightweight item metadata
and anonymized human-response tables. Set FRIEND_BENCH_DOWNLOAD_HF=1 to fetch
the complete public snapshot (approximately 433 MB, including audio/video).
The current release is validation-only; the card says a held-out test split is
planned. Review the CC BY-NC 4.0 and source-corpus responsible-use terms.
EOF
fi

echo "Friend Bench metadata download complete: $out"
