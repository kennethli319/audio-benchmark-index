#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir somos)"
record_url="${SOMOS_RECORD_URL:-https://zenodo.org/records/7378801}"
api_url="${SOMOS_API_URL:-https://zenodo.org/api/records/7378801}"
archive_url="${SOMOS_ARCHIVE_URL:-https://zenodo.org/api/records/7378801/files/somos.zip/content}"

download_url \
  "https://innoetics.github.io/publications/somos-dataset/index.html" \
  "$out/project.html"
download_url "$record_url" "$out/zenodo-record.html"
download_url "$api_url" "$out/zenodo-record.json"
download_url \
  "https://www.isca-archive.org/interspeech_2022/maniati22_interspeech.html" \
  "$out/interspeech-paper.html"
download_url \
  "https://arxiv.org/abs/2607.10146" \
  "$out/recent-cross-corpus-evaluation.html"

if [[ "${SOMOS_DOWNLOAD_ARCHIVE:-0}" != "1" ]]; then
  echo "Saved SOMOS documentation and Zenodo metadata to: $out"
  echo "Set SOMOS_DOWNLOAD_ARCHIVE=1 to download the approximately 3.70 GiB archive."
  exit 0
fi

download_url "$archive_url" "$out/somos.zip"
echo "SOMOS download complete: $out"
