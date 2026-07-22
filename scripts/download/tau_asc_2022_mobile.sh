#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir tau_asc_2022_mobile)"
dev_api="${TAU_ASC2022_DEV_API_URL:-https://zenodo.org/api/records/6337421}"
eval_api="${TAU_ASC2022_EVAL_API_URL:-https://zenodo.org/api/records/15517945}"
dev_files="${TAU_ASC2022_DEV_FILES_BASE_URL:-https://zenodo.org/api/records/6337421/files}"
eval_files="${TAU_ASC2022_EVAL_FILES_BASE_URL:-https://zenodo.org/api/records/15517945/files}"

download_file() {
  local base="$1"
  local file="$2"
  download_url "$base/$file/content" "$out/$file"
}

download_url "$dev_api" "$out/zenodo-record-6337421.json"
download_url "$eval_api" "$out/zenodo-record-15517945.json"
download_file "$dev_files" TAU-urban-acoustic-scenes-2022-mobile-development.doc.zip
download_file "$dev_files" TAU-urban-acoustic-scenes-2022-mobile-development.meta.zip
download_file "$eval_files" TAU-urban-acoustic-scenes-2025-mobile-evaluation.doc.zip
download_file "$eval_files" TAU-urban-acoustic-scenes-2025-mobile-evaluation.meta.zip

if [[ "${TAU_ASC2022_DOWNLOAD_DEV_AUDIO:-0}" == "1" ]]; then
  for part in {1..16}; do
    download_file "$dev_files" "TAU-urban-acoustic-scenes-2022-mobile-development.audio.$part.zip"
  done
else
  echo "Skipping development audio (~25.6 GiB). Set TAU_ASC2022_DOWNLOAD_DEV_AUDIO=1 to download it."
fi

if [[ "${TAU_ASC2022_DOWNLOAD_EVAL_AUDIO:-0}" == "1" ]]; then
  for part in {1..12}; do
    download_file "$eval_files" "TAU-urban-acoustic-scenes-2025-mobile-evaluation.audio.$part.zip"
  done
else
  echo "Skipping evaluation audio (~19.2 GiB). Set TAU_ASC2022_DOWNLOAD_EVAL_AUDIO=1 to download it."
fi

echo "TAU Urban Acoustic Scenes 2022/2025 metadata download complete: $out"
