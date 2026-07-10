#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir vocalset)"
record_url="${VOCALSET_RECORD_URL:-https://zenodo.org/api/records/1193957}"
archive_url="${VOCALSET_ARCHIVE_URL:-https://zenodo.org/api/records/1193957/files/VocalSet.zip/content}"

download_url "$record_url" "$out/zenodo-record.json"

if [[ "${VOCALSET_DOWNLOAD_ARCHIVE:-0}" != "1" ]]; then
  echo "Downloaded VocalSet metadata to: $out"
  echo "Skipping 2.1 GiB archive. Set VOCALSET_DOWNLOAD_ARCHIVE=1 to download VocalSet.zip."
  exit 0
fi

download_url "$archive_url" "$out/VocalSet.zip"
echo "VocalSet download complete: $out/VocalSet.zip"
