#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir sonyc_ust_v2)"
base_url="${SONYC_UST_V2_ZENODO_BASE_URL:-https://zenodo.org/api/records/3966543/files}"
api_url="${SONYC_UST_V2_ZENODO_API_URL:-https://zenodo.org/api/records/3966543}"

download_zenodo_file() {
  local file="$1"
  download_url "$base_url/$file/content" "$out/$file"
}

download_url "$api_url" "$out/zenodo-record-3966543.json"
download_zenodo_file README.md
download_zenodo_file annotations.csv
download_zenodo_file dcase-ust-taxonomy.yaml
download_zenodo_file unpack_audio.sh

if [[ "${SONYC_UST_V2_DOWNLOAD_AUDIO:-0}" != "1" ]]; then
  echo "Downloaded SONYC-UST-V2 metadata to: $out"
  echo "Skipping audio archives (~12.8 GiB). Set SONYC_UST_V2_DOWNLOAD_AUDIO=1 to download them."
  exit 0
fi

parts="${SONYC_UST_V2_AUDIO_PARTS:-all}"
if [[ "$parts" == "all" ]]; then
  parts="$(printf 'audio-%s.tar.gz ' {0..18})"
fi

for part in $parts; do
  download_zenodo_file "$part"
done

echo "SONYC-UST-V2 download complete: $out"
