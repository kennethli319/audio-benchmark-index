#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir ravdess)"
record_url="${RAVDESS_RECORD_URL:-https://zenodo.org/api/records/1188976}"
file_base_url="${RAVDESS_ZENODO_FILE_BASE_URL:-https://zenodo.org/api/records/1188976/files}"

download_url "$record_url" "$out/zenodo-record-1188976.json"

download_zenodo_file() {
  local file="$1"
  download_url "$file_base_url/$file/content" "$out/$file"
}

if [[ "${RAVDESS_DOWNLOAD_AUDIO:-0}" == "1" ]]; then
  download_zenodo_file Audio_Speech_Actors_01-24.zip
  download_zenodo_file Audio_Song_Actors_01-24.zip
else
  echo "Skipping RAVDESS audio-only ZIPs (~413 MB total). Set RAVDESS_DOWNLOAD_AUDIO=1 to download them."
  echo "Video archives are much larger; use the Zenodo record if you need AV or video-only files."
fi

echo "RAVDESS metadata download complete: $out"
