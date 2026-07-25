#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir surge_pitch)"
record_url="${SURGE_PITCH_RECORD_URL:-https://zenodo.org/api/records/4677097}"
archive_url="${SURGE_PITCH_ARCHIVE_URL:-https://zenodo.org/api/records/4677097/files/surge-velocity64-2K.tar/content}"

download_url "$record_url" "$out/zenodo-record.json"
download_url "https://arxiv.org/abs/2104.12922" "$out/dataset-paper.html"
download_url "https://arxiv.org/abs/2607.16688" "$out/nabeats-paper.html"

if [[ "${SURGE_PITCH_DOWNLOAD_ARCHIVE:-0}" == "1" ]]; then
  download_url "$archive_url" "$out/surge-velocity64-2K.tar"
else
  echo "Skipping the approximately 7.58 GB Surge Pitch archive."
  echo "Set SURGE_PITCH_DOWNLOAD_ARCHIVE=1 to download it."
fi

echo "Surge Pitch metadata download complete: $out"
