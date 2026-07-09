#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir rul_muchomusic)"

download_url \
  "https://raw.githubusercontent.com/yongyizang/AreYouReallyListening/main/RUL-MuchoMusic.json" \
  "$out/RUL-MuchoMusic.json"

if [[ "${RUL_DOWNLOAD_HF:-1}" == "1" ]]; then
  hf_download_dataset "yongyizang/RUListening" "$out/RUListening"
fi

if [[ "${RUL_DOWNLOAD_UPSTREAM_MUCHOMUSIC:-0}" == "1" ]]; then
  download_url \
    "https://zenodo.org/record/12709974/files/muchomusic.csv" \
    "$out/muchomusic.csv"
fi

echo "RUL-MuchoMusic download complete: $out"
