#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir earnings25)"
zenodo_api="${EARNINGS25_ZENODO_API_URL:-https://zenodo.org/api/records/18762168}"
archive_url="${EARNINGS25_ARCHIVE_URL:-https://zenodo.org/api/records/18762168/files/earnings25.zip/content}"

download_url "$zenodo_api" "$out/zenodo-record-18762168.json"
download_url "https://arxiv.org/abs/2607.23813" "$out/earnings25-paper.html"

if [[ "${EARNINGS25_DOWNLOAD_ARCHIVE:-0}" != "1" ]]; then
  echo "Downloaded Earnings25 metadata to: $out"
  echo "Skipping the approximately 12.0 GB archive."
  echo "Set EARNINGS25_ACK_AUDIO_TERMS=1 EARNINGS25_DOWNLOAD_ARCHIVE=1 to download it."
  exit 0
fi

if [[ "${EARNINGS25_ACK_AUDIO_TERMS:-0}" != "1" ]]; then
  manual_required \
    "Earnings25 archive" \
    "Review the applicable original earnings-call content-provider terms." \
    "Then set EARNINGS25_ACK_AUDIO_TERMS=1 with EARNINGS25_DOWNLOAD_ARCHIVE=1."
fi

download_url "$archive_url" "$out/earnings25.zip"

echo "Earnings25 download complete: $out"
