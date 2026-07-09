#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir tau_asc_2019)"
api_url="${TAU_ASC2019_API_URL:-https://zenodo.org/api/records/2589280}"
files_base="${TAU_ASC2019_FILES_BASE_URL:-https://zenodo.org/api/records/2589280/files}"

download_zenodo_file() {
  local file="$1"
  download_url "$files_base/$file/content" "$out/$file"
}

download_url "$api_url" "$out/zenodo-record-2589280.json"
download_zenodo_file TAU-urban-acoustic-scenes-2019-development.doc.zip
download_zenodo_file TAU-urban-acoustic-scenes-2019-development.meta.zip

if [[ "${TAU_ASC2019_DOWNLOAD_AUDIO:-0}" == "1" ]]; then
  parts="${TAU_ASC2019_AUDIO_PARTS:-all}"
  if [[ "$parts" == "all" ]]; then
    parts="$(printf '%s ' {1..21})"
  fi

  for part in $parts; do
    download_zenodo_file "TAU-urban-acoustic-scenes-2019-development.audio.$part.zip"
  done
else
  echo "Skipping audio archives (~35 GiB across 21 ZIP files). Set TAU_ASC2019_DOWNLOAD_AUDIO=1 to download them."
fi

echo "TAU Urban Acoustic Scenes 2019 metadata download complete: $out"
