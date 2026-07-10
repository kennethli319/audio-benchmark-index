#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir musicnet)"
record_url="${MUSICNET_RECORD_URL:-https://zenodo.org/api/records/5120004}"
metadata_url="${MUSICNET_METADATA_URL:-https://zenodo.org/api/records/5120004/files/musicnet_metadata.csv/content}"
midis_url="${MUSICNET_MIDIS_URL:-https://zenodo.org/api/records/5120004/files/musicnet_midis.tar.gz/content}"
archive_url="${MUSICNET_ARCHIVE_URL:-https://zenodo.org/api/records/5120004/files/musicnet.tar.gz/content}"

download_url "$record_url" "$out/zenodo-record.json"
download_url "$metadata_url" "$out/musicnet_metadata.csv"

if [[ "${MUSICNET_DOWNLOAD_MIDIS:-0}" == "1" ]]; then
  download_url "$midis_url" "$out/musicnet_midis.tar.gz"
else
  echo "Skipping MusicNet reference MIDI archive (~2.5 MiB). Set MUSICNET_DOWNLOAD_MIDIS=1 to download it."
fi

if [[ "${MUSICNET_DOWNLOAD_AUDIO:-0}" == "1" ]]; then
  download_url "$archive_url" "$out/musicnet.tar.gz"
else
  echo "Skipping MusicNet full audio/label archive (~10.3 GiB). Set MUSICNET_DOWNLOAD_AUDIO=1 to download it."
fi

echo "MusicNet metadata download complete: $out"
