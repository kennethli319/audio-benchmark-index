#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir fsdkaggle2018)"
base_url="${FSDKAGGLE2018_ZENODO_BASE_URL:-https://zenodo.org/api/records/2552860/files}"
api_url="${FSDKAGGLE2018_ZENODO_API_URL:-https://zenodo.org/api/records/2552860}"

download_zenodo_file() {
  local file="$1"
  download_url "$base_url/$file/content" "$out/$file"
}

download_url "$api_url" "$out/zenodo-record-2552860.json"
download_zenodo_file FSDKaggle2018.doc.zip
download_zenodo_file FSDKaggle2018.meta.zip

if [[ "${FSDKAGGLE2018_DOWNLOAD_AUDIO:-0}" != "1" ]]; then
  echo "Downloaded FSDKaggle2018 documentation and metadata to: $out"
  echo "Skipping audio archives (~4.6 GiB). Set FSDKAGGLE2018_DOWNLOAD_AUDIO=1 to download them."
  exit 0
fi

download_zenodo_file FSDKaggle2018.audio_test.zip
download_zenodo_file FSDKaggle2018.audio_train.zip

echo "FSDKaggle2018 archive download complete: $out"
