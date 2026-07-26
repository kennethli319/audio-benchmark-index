#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir foleyset)"
record_id="${FOLEYSET_ZENODO_RECORD:-20735877}"
record_url="https://zenodo.org/records/$record_id"
api_url="https://zenodo.org/api/records/$record_id"
archive_url="$api_url/files/FoleySet.zip/content"

download_url "https://arxiv.org/abs/2606.25980" "$out/paper.html"
download_url "$record_url" "$out/zenodo.html"
download_url "$api_url" "$out/zenodo-record.json"

if [[ "${FOLEYSET_DOWNLOAD_ARCHIVE:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded FoleySet paper and Zenodo metadata only.

Set FOLEYSET_DOWNLOAD_ARCHIVE=1 to download the approximately 2.16 GB ZIP.
The Zenodo record reports MD5 9eb1b8230abf6741b9daa92fbd118cc5.
Preserve the source IDs, URLs, uploader names, and other Freesound provenance.
EOF
  echo "FoleySet metadata download complete: $out"
  exit 0
fi

download_url "$archive_url" "$out/FoleySet.zip"
echo "FoleySet archive download complete: $out/FoleySet.zip"
