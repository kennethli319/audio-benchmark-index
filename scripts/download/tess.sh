#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir tess)"
dataset_pid="${TESS_DATASET_PID:-doi:10.5683/SP2/E8H2MF}"
api_base="${TESS_API_BASE_URL:-https://borealisdata.ca/api}"

download_url \
  "$api_base/datasets/:persistentId/?persistentId=$dataset_pid" \
  "$out/borealis-dataset-metadata.json"

if [[ "${TESS_DOWNLOAD_AUDIO:-0}" == "1" ]]; then
  download_url \
    "$api_base/access/dataset/:persistentId/?persistentId=$dataset_pid" \
    "$out/tess-complete.zip"
else
  echo "Skipping the complete 2,800-file TESS ZIP. Set TESS_DOWNLOAD_AUDIO=1 to download it."
fi

echo "TESS metadata download complete: $out"
