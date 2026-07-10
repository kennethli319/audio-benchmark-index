#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir meld)"
homepage="${MELD_HOMEPAGE:-https://affective-meld.github.io/}"
repo_raw="${MELD_REPO_RAW:-https://raw.githubusercontent.com/declare-lab/MELD/master}"
hf_card="${MELD_HF_CARD:-https://huggingface.co/datasets/declare-lab/MELD/raw/main/README.md}"
base_url="${MELD_BASE_URL:-https://huggingface.co/datasets/declare-lab/MELD/resolve/main}"

download_url "$homepage" "$out/affective-meld.html"
download_url "$repo_raw/README.md" "$out/README.md"
download_url "$repo_raw/LICENSE" "$out/LICENSE"
download_url "$hf_card" "$out/huggingface-README.md"

if [[ "${MELD_DOWNLOAD_RAW:-0}" == "1" ]]; then
  download_url "$base_url/MELD.Raw.tar.gz" "$out/MELD.Raw.tar.gz"
else
  echo "Skipping MELD raw audio/video tarball. Set MELD_DOWNLOAD_RAW=1 to download it."
fi

if [[ "${MELD_DOWNLOAD_FEATURES:-0}" == "1" ]]; then
  download_url "$base_url/MELD.Features.Models.tar.gz" "$out/MELD.Features.Models.tar.gz"
else
  echo "Skipping MELD feature/model tarball. Set MELD_DOWNLOAD_FEATURES=1 to download it."
fi

echo "MELD metadata download complete: $out"
