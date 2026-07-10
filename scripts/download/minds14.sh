#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir minds14)"
hf_repo="${MINDS14_HF_REPO:-PolyAI/minds14}"
config="${MINDS14_CONFIG:-en-US}"

download_url "https://huggingface.co/datasets/$hf_repo/raw/main/README.md" "$out/README.md"

if [[ "${MINDS14_DOWNLOAD_HF:-0}" != "1" ]]; then
  echo "Downloaded MInDS-14 dataset card to: $out"
  echo "Skipping Hugging Face audio snapshot. Set MINDS14_DOWNLOAD_HF=1 to download a config."
  echo "Example: MINDS14_DOWNLOAD_HF=1 MINDS14_CONFIG=en-US $0"
  exit 0
fi

if [[ "$config" == "all" ]]; then
  hf_download_dataset "$hf_repo" "$out/hf-all"
else
  hf_download_dataset "$hf_repo" "$out/hf-$config" --include "$config/*"
fi

echo "MInDS-14 requested download complete: $out"
