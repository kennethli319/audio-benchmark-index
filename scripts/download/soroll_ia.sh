#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir soroll_ia)"
kaggle_ref="${SOROLL_IA_KAGGLE_REF:-itiresearch/soroll-ia-weakly-labeled-audio-port-monitoring}"
kaggle_metadata_url="${SOROLL_IA_KAGGLE_METADATA_URL:-https://www.kaggle.com/api/v1/datasets/view/$kaggle_ref}"
paper_url="${SOROLL_IA_PAPER_URL:-https://arxiv.org/abs/2606.26195}"
repo_readme_url="${SOROLL_IA_README_URL:-https://raw.githubusercontent.com/anp-iti/sorollia_baseline/main/README.md}"

download_url "$kaggle_metadata_url" "$out/kaggle-metadata.json"
download_url "$paper_url" "$out/paper.html"
download_url "$repo_readme_url" "$out/benchmark-README.md"

if [[ "${SOROLL_IA_DOWNLOAD_DATA:-0}" != "1" ]]; then
  echo "Downloaded Soroll-IA metadata, paper, and benchmark documentation to: $out"
  echo "Set SOROLL_IA_DOWNLOAD_DATA=1 to download the approximately 2.17 GB Kaggle dataset."
  echo "The dataset is CC BY-NC 4.0; review the non-commercial restriction before use."
  exit 0
fi

require_cmd kaggle
mkdir -p "$out/kaggle"
kaggle datasets download --dataset "$kaggle_ref" --path "$out/kaggle"

echo "Soroll-IA Kaggle download complete: $out/kaggle"
echo "The dataset is CC BY-NC 4.0; the benchmark repository's code license is unspecified."
