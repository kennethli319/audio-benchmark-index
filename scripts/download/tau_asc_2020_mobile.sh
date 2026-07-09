#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir tau_asc_2020_mobile)"
dev_api="${TAU_ASC2020_DEV_API_URL:-https://zenodo.org/api/records/3670167}"
eval_api="${TAU_ASC2020_EVAL_API_URL:-https://zenodo.org/api/records/3685828}"
dev_files_base="${TAU_ASC2020_DEV_FILES_BASE_URL:-https://zenodo.org/api/records/3670167/files}"
eval_files_base="${TAU_ASC2020_EVAL_FILES_BASE_URL:-https://zenodo.org/api/records/3685828/files}"

download_zenodo_file() {
  local base_url="$1"
  local file="$2"
  download_url "$base_url/$file/content" "$out/$file"
}

download_url "$dev_api" "$out/zenodo-record-3670167.json"
download_url "$eval_api" "$out/zenodo-record-3685828.json"

download_zenodo_file "$dev_files_base" TAU-urban-acoustic-scenes-2020-mobile-development.doc.zip
download_zenodo_file "$dev_files_base" TAU-urban-acoustic-scenes-2020-mobile-development.meta.zip
download_zenodo_file "$eval_files_base" TAU-urban-acoustic-scenes-2020-mobile-evaluation.doc.zip
download_zenodo_file "$eval_files_base" TAU-urban-acoustic-scenes-2020-mobile-evaluation.meta.zip

if [[ "${TAU_ASC2020_DOWNLOAD_DEV_AUDIO:-0}" == "1" ]]; then
  for part in {1..16}; do
    download_zenodo_file "$dev_files_base" "TAU-urban-acoustic-scenes-2020-mobile-development.audio.$part.zip"
  done
else
  echo "Skipping development audio archives (~27.4 GiB). Set TAU_ASC2020_DOWNLOAD_DEV_AUDIO=1 to download them."
fi

if [[ "${TAU_ASC2020_DOWNLOAD_EVAL_AUDIO:-0}" == "1" ]]; then
  for part in {1..8}; do
    download_zenodo_file "$eval_files_base" "TAU-urban-acoustic-scenes-2020-mobile-evaluation.audio.$part.zip"
  done
else
  echo "Skipping evaluation audio archives (~13.1 GiB). Set TAU_ASC2020_DOWNLOAD_EVAL_AUDIO=1 to download them."
fi

echo "TAU Urban Acoustic Scenes 2020 Mobile metadata download complete: $out"
