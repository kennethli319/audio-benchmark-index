#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

config="${VOXPOPULI_CONFIG:-en}"
splits="${VOXPOPULI_SPLITS:-test}"
out="$(dataset_dir voxpopuli)"

if [[ "${VOXPOPULI_ALL:-0}" == "1" ]]; then
  echo "VOXPOPULI_ALL=1 downloads the full VoxPopuli Hugging Face repository (~673 GiB)."
  hf_download_dataset "facebook/voxpopuli" "$out/all"
else
  echo "Downloading VoxPopuli config '$config' split(s): $splits"
  echo "Set VOXPOPULI_ALL=1 only if you really want the full repository."
  args=(--include "README.md")
  for split in $splits; do
    args+=(--include "$config/${split}-*.parquet")
  done
  hf_download_dataset "facebook/voxpopuli" "$out/$config" "${args[@]}"
fi

echo "VoxPopuli download complete: $out"
