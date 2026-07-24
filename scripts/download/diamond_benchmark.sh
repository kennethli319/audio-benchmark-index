#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir diamond_benchmark)"
repo="nineninesix/diamond-benchmark"
base="https://huggingface.co/datasets/$repo"

download_url "$base/raw/main/README.md" "$out/README.md"
download_url "https://huggingface.co/api/datasets/$repo" "$out/huggingface-api.json"
download_url "$base/raw/main/manifest.csv" "$out/manifest.csv"

if [[ "${DIAMOND_BENCHMARK_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "$repo" "$out/hf"
else
  cat <<'EOF'
Downloaded official metadata and the lightweight manifest only.

Set DIAMOND_BENCHMARK_DOWNLOAD_HF=1 to fetch the public, ungated
approximately 340 MB audio snapshot. Hugging Face labels the license "other",
but the card does not state source-recording or redistribution terms. Review
those rights before use, especially for training or commercial purposes.
EOF
fi

echo "Diamond Benchmark metadata download complete: $out"
