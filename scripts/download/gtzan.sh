#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir gtzan)"
hf_repo="${GTZAN_HF_REPO:-marsyas/gtzan}"
card_url="${GTZAN_CARD_URL:-https://huggingface.co/datasets/marsyas/gtzan/raw/main/README.md}"

download_url "$card_url" "$out/README.md"

if [[ "${GTZAN_DOWNLOAD_HF:-0}" != "1" ]]; then
  echo "Skipping GTZAN Hugging Face snapshot. Set GTZAN_DOWNLOAD_HF=1 to download audio/data files."
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/hf"

echo "GTZAN download complete: $out"
