#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir fsdkaggle2019)"
base_url="${FSDKAGGLE2019_ZENODO_BASE_URL:-https://zenodo.org/api/records/3612637/files}"
api_url="${FSDKAGGLE2019_ZENODO_API_URL:-https://zenodo.org/api/records/3612637}"

download_zenodo_file() {
  local file="$1"
  download_url "$base_url/$file/content" "$out/$file"
}

download_zenodo_file_if_selected() {
  local key="$1"
  local file="$2"
  if [[ " $selected_parts " == *" $key "* || " $selected_parts " == *" all "* ]]; then
    download_zenodo_file "$file"
  fi
}

download_url "$api_url" "$out/zenodo-record-3612637.json"
download_zenodo_file FSDKaggle2019.doc.zip
download_zenodo_file FSDKaggle2019.meta.zip

if [[ "${FSDKAGGLE2019_DOWNLOAD_AUDIO:-0}" != "1" ]]; then
  echo "Downloaded FSDKaggle2019 documentation and metadata to: $out"
  echo "Skipping audio archives (~25 GiB). Set FSDKAGGLE2019_DOWNLOAD_AUDIO=1 to download them."
  echo "Use FSDKAGGLE2019_AUDIO_PARTS='curated test noisy' to select subsets; default is all."
  exit 0
fi

selected_parts="${FSDKAGGLE2019_AUDIO_PARTS:-all}"

download_zenodo_file_if_selected curated FSDKaggle2019.audio_train_curated.zip
download_zenodo_file_if_selected test FSDKaggle2019.audio_test.zip

if [[ " $selected_parts " == *" noisy "* || " $selected_parts " == *" all "* ]]; then
  download_zenodo_file FSDKaggle2019.audio_train_noisy.z01
  download_zenodo_file FSDKaggle2019.audio_train_noisy.z02
  download_zenodo_file FSDKaggle2019.audio_train_noisy.z03
  download_zenodo_file FSDKaggle2019.audio_train_noisy.z04
  download_zenodo_file FSDKaggle2019.audio_train_noisy.z05
  download_zenodo_file FSDKaggle2019.audio_train_noisy.z06
  download_zenodo_file FSDKaggle2019.audio_train_noisy.zip
fi

echo "FSDKaggle2019 archive download complete: $out"
