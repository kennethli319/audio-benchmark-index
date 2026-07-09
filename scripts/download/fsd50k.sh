#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir fsd50k)"
base_url="${FSD50K_ZENODO_BASE_URL:-https://zenodo.org/api/records/4060432/files}"
api_url="${FSD50K_ZENODO_API_URL:-https://zenodo.org/api/records/4060432}"

download_zenodo_file() {
  local file="$1"
  download_url "$base_url/$file/content" "$out/$file"
}

download_url "$api_url" "$out/zenodo-record-4060432.json"
download_zenodo_file FSD50K.doc.zip
download_zenodo_file FSD50K.ground_truth.zip
download_zenodo_file FSD50K.metadata.zip

if [[ "${FSD50K_DOWNLOAD_AUDIO:-0}" != "1" ]]; then
  echo "Downloaded FSD50K documentation, ground truth, and metadata to: $out"
  echo "Skipping audio archives (~31 GiB). Set FSD50K_DOWNLOAD_AUDIO=1 to download them."
  exit 0
fi

for part in \
  FSD50K.dev_audio.z01 \
  FSD50K.dev_audio.z02 \
  FSD50K.dev_audio.z03 \
  FSD50K.dev_audio.z04 \
  FSD50K.dev_audio.z05 \
  FSD50K.dev_audio.zip \
  FSD50K.eval_audio.z01 \
  FSD50K.eval_audio.zip
do
  download_zenodo_file "$part"
done

echo "FSD50K archive download complete: $out"
echo "Use the upstream Zenodo instructions to merge/extract split ZIP files."
