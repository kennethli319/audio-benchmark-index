#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir medleydb)"
homepage="${MEDLEYDB_HOMEPAGE:-https://medleydb.weebly.com/}"
description_url="${MEDLEYDB_DESCRIPTION_URL:-https://medleydb.weebly.com/description.html}"
downloads_url="${MEDLEYDB_DOWNLOADS_URL:-https://medleydb.weebly.com/downloads.html}"
repo_url="${MEDLEYDB_REPO_URL:-https://github.com/marl/medleydb.git}"
raw_base="${MEDLEYDB_RAW_BASE:-https://raw.githubusercontent.com/marl/medleydb/master}"
sample_url="${MEDLEYDB_SAMPLE_URL:-https://zenodo.org/record/1438309/files/MedleyDB_Sample.tar.gz?download=1}"
full_record_url="${MEDLEYDB_FULL_RECORD_URL:-https://zenodo.org/records/1649325}"
v2_record_url="${MEDLEYDB_V2_RECORD_URL:-https://zenodo.org/records/1715175}"

download_url "$homepage" "$out/index.html"
download_url "$description_url" "$out/description.html"
download_url "$downloads_url" "$out/downloads.html"
download_url "$raw_base/README.md" "$out/README.md"
download_url "$raw_base/LICENSE" "$out/LICENSE"

if [[ "${MEDLEYDB_CHECK_ZENODO:-0}" == "1" ]]; then
  download_url "$full_record_url" "$out/zenodo-medleydb-audio.html"
  download_url "$v2_record_url" "$out/zenodo-medleydb-2-audio.html"
else
  echo "Skipping gated Zenodo record page fetches. Set MEDLEYDB_CHECK_ZENODO=1 to save them."
fi

if [[ "${MEDLEYDB_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/medleydb"
else
  echo "Skipping MedleyDB annotation/metadata/tooling repo clone. Set MEDLEYDB_CLONE_REPO=1 to clone it."
fi

if [[ "${MEDLEYDB_DOWNLOAD_SAMPLE:-0}" == "1" ]]; then
  download_url "$sample_url" "$out/MedleyDB_Sample.tar.gz"
else
  echo "Skipping public MedleyDB sample archive. Set MEDLEYDB_DOWNLOAD_SAMPLE=1 to download it."
fi

echo "Full MedleyDB and MedleyDB 2.0 audio require Zenodo access requests:"
echo "  $full_record_url"
echo "  $v2_record_url"
echo "MedleyDB docs download complete: $out"
