#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir maestro_real)"
record_base="${MAESTRO_REAL_RECORD_BASE_URL:-https://zenodo.org/api/records/7244360}"

download_url "$record_base" "$out/zenodo-record.json"
download_url "$record_base/files/README.md/content" "$out/README.md"
download_url "$record_base/files/LICENSE.txt/content" "$out/LICENSE.txt"
download_url "$record_base/files/development_annotation.zip/content" \
  "$out/development_annotation.zip"

if [[ "${MAESTRO_REAL_DOWNLOAD_AUDIO:-0}" == "1" ]]; then
  download_url "$record_base/files/development_audio.zip/content" \
    "$out/development_audio.zip"
else
  cat <<EOF
Skipping the approximately 2.43 GiB development audio archive. Set
MAESTRO_REAL_DOWNLOAD_AUDIO=1 to download it from the official Zenodo record.
EOF
fi

echo "MAESTRO Real metadata and annotations download complete: $out"
