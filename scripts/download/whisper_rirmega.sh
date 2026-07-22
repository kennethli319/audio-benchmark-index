#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir whisper_rirmega)"
dataset_base_url="${WHISPER_RIRMEGA_DATASET_BASE_URL:-https://huggingface.co/datasets/mandipgoswami/whisper-rirmega-bench}"
dataset_api_url="${WHISPER_RIRMEGA_DATASET_API_URL:-https://huggingface.co/api/datasets/mandipgoswami/whisper-rirmega-bench}"
paper_url="${WHISPER_RIRMEGA_PAPER_URL:-https://arxiv.org/abs/2603.02252}"

download_url "$dataset_base_url/raw/main/README.md" "$out/dataset-card.md"
download_url "$dataset_api_url" "$out/huggingface-api.json"
download_url "$dataset_base_url/resolve/main/metadata.json" "$out/metadata.json"
download_url "$dataset_base_url/resolve/main/browser_subset.json" "$out/browser_subset.json"
download_url "$dataset_base_url/resolve/main/reports/leaderboard.csv" "$out/leaderboard.csv"
download_url "$dataset_base_url/resolve/main/reports/refs.csv" "$out/refs.csv"
download_url "$paper_url" "$out/arxiv-2603.02252.html"

if [[ "${WHISPER_RIRMEGA_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset \
    "mandipgoswami/whisper-rirmega-bench" \
    "$out/huggingface"
else
  cat <<'MSG'
Whisper-RIR-Mega metadata download complete.

The complete Hugging Face dataset is about 1.13 GB and includes paired clean
and reverberant FLAC files plus Arrow data. To download it explicitly, run:

  WHISPER_RIRMEGA_DOWNLOAD_HF=1 scripts/download/whisper_rirmega.sh

The benchmark card declares CC BY 4.0, but its RIR-Mega source card declares
CC BY-NC 4.0 for RIR audio. Review and apply the stricter upstream terms.
MSG
fi
