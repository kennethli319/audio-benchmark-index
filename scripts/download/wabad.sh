#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir wabad)"
record_id="${WABAD_RECORD_ID:-15629388}"
api_base="${WABAD_API_BASE_URL:-https://zenodo.org/api/records/$record_id}"

download_url "$api_base" "$out/zenodo-record.json"
download_url "$api_base/files/README.txt/content" "$out/README.txt"
download_url "$api_base/files/Metadata.txt/content" "$out/Metadata.txt"
download_url "$api_base/files/Pooled%20annotations.txt/content" "$out/Pooled-annotations.txt"
download_url "$api_base/files/Species%20list.pdf/content" "$out/Species-list.pdf"

if [[ "${WABAD_DOWNLOAD_AUDIO:-0}" != "1" ]]; then
  echo "Downloaded WABAD documentation and annotations to: $out"
  echo "Set WABAD_DOWNLOAD_AUDIO=1 and WABAD_SITES='ARD BAM' to fetch selected site archives."
  exit 0
fi

sites="${WABAD_SITES:-}"
if [[ -z "$sites" ]]; then
  echo "WABAD_SITES is required when WABAD_DOWNLOAD_AUDIO=1." >&2
  echo "Choose explicit site IDs from Metadata.txt, for example: WABAD_SITES='ARD BAM'." >&2
  exit 2
fi

for site in $sites; do
  if [[ ! "$site" =~ ^[A-Z0-9]+$ ]]; then
    echo "Invalid WABAD site ID: $site" >&2
    exit 2
  fi
  download_url "$api_base/files/$site.zip/content" "$out/$site.zip"
done

echo "WABAD site archive download complete: $out"
echo "The Zenodo license fields conflict; treat the release as CC BY-NC 4.0 pending clarification."
