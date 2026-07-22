#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir voxenes_2026)"
kaggle_ref="${VOXENES2026_KAGGLE_REF:-interspeech2712/voxenes-2026}"
kaggle_metadata_url="${VOXENES2026_KAGGLE_METADATA_URL:-https://www.kaggle.com/api/v1/datasets/view/$kaggle_ref}"
paper_url="${VOXENES2026_PAPER_URL:-https://arxiv.org/abs/2607.11706}"

download_url "$kaggle_metadata_url" "$out/kaggle-metadata.json"
download_url "$paper_url" "$out/paper.html"

if [[ "${VOXENES2026_DOWNLOAD_DATA:-0}" != "1" ]]; then
  echo "Downloaded VoxENES 2026 metadata and paper page to: $out"
  echo "Set VOXENES2026_DOWNLOAD_DATA=1 to download the approximately 23.3 GB Kaggle dataset."
  echo "Review LibriSpeech, VoxPopuli, voice-data, and synthesis-system terms before reuse."
  exit 0
fi

require_cmd kaggle
mkdir -p "$out/kaggle"
kaggle datasets download --dataset "$kaggle_ref" --path "$out/kaggle"

echo "VoxENES 2026 Kaggle download complete: $out/kaggle"
echo "Kaggle declares CC BY 4.0; incorporated source speech and generated voices retain provenance caveats."
