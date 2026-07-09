#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir urbansound8k)"
base_url="${URBANSOUND8K_ZENODO_BASE_URL:-https://zenodo.org/records/1203745/files}"
api_url="${URBANSOUND8K_ZENODO_API_URL:-https://zenodo.org/api/records/1203745}"

download_url "$api_url" "$out/zenodo-record-1203745.json"

if [[ "${URBANSOUND8K_DOWNLOAD_AUDIO:-0}" != "1" ]]; then
  echo "Downloaded UrbanSound8K Zenodo metadata to: $out/zenodo-record-1203745.json"
  echo "Skipping the 6 GiB archive. Set URBANSOUND8K_DOWNLOAD_AUDIO=1 to download it."
  exit 0
fi

download_url "$base_url/UrbanSound8K.tar.gz?download=1" "$out/UrbanSound8K.tar.gz"

if [[ "${URBANSOUND8K_EXTRACT:-0}" == "1" ]]; then
  require_cmd tar
  tar -xzf "$out/UrbanSound8K.tar.gz" -C "$out"
  echo "UrbanSound8K extracted under: $out"
else
  echo "UrbanSound8K archive download complete: $out/UrbanSound8K.tar.gz"
fi
