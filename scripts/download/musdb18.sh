#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir musdb18)"
homepage="${MUSDB18_HOMEPAGE:-https://sigsep.github.io/datasets/musdb.html}"
zenodo_url="${MUSDB18_ZENODO_URL:-https://zenodo.org/records/1117372}"
hq_zenodo_url="${MUSDB18_HQ_ZENODO_URL:-https://zenodo.org/records/3338373}"
archive_url="${MUSDB18_ARCHIVE_URL:-https://zenodo.org/records/1117372/files/musdb18.zip?download=1}"
hq_archive_url="${MUSDB18_HQ_ARCHIVE_URL:-https://zenodo.org/records/3338373/files/musdb18hq.zip?download=1}"

download_url "$homepage" "$out/musdb18.html"
download_url "$zenodo_url" "$out/zenodo-musdb18.html"
download_url "$hq_zenodo_url" "$out/zenodo-musdb18-hq.html"

if [[ "${MUSDB18_ACK_TERMS:-0}" != "1" ]]; then
  echo "Skipping MUSDB18 archives. Read upstream terms, then set MUSDB18_ACK_TERMS=1 plus an archive opt-in to download."
  echo "Standard archive: MUSDB18_ACK_TERMS=1 MUSDB18_DOWNLOAD_ARCHIVE=1 scripts/download/musdb18.sh"
  echo "HQ archive: MUSDB18_ACK_TERMS=1 MUSDB18_DOWNLOAD_HQ=1 scripts/download/musdb18.sh"
  echo "MUSDB18 page download complete: $out"
  exit 0
fi

if [[ "${MUSDB18_DOWNLOAD_ARCHIVE:-0}" == "1" ]]; then
  download_url "$archive_url" "$out/musdb18.zip"
else
  echo "Skipping MUSDB18 compressed STEMS archive (~4.7 GiB). Set MUSDB18_DOWNLOAD_ARCHIVE=1 to download it."
fi

if [[ "${MUSDB18_DOWNLOAD_HQ:-0}" == "1" ]]; then
  download_url "$hq_archive_url" "$out/musdb18hq.zip"
else
  echo "Skipping MUSDB18-HQ uncompressed archive (~22.7 GiB). Set MUSDB18_DOWNLOAD_HQ=1 to download it."
fi

echo "MUSDB18 page/archive download complete: $out"
