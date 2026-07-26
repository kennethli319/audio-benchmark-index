#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir datased)"
record_url="${DATASED_ZENODO_RECORD_URL:-https://zenodo.org/api/records/15346092}"
paper_url="${DATASED_PAPER_URL:-https://www.nature.com/articles/s41597-025-05991-w}"
evaluation_url="${DATASED_EVALUATION_URL:-https://arxiv.org/abs/2607.13571}"
archive_url="${DATASED_ARCHIVE_URL:-https://zenodo.org/api/records/15346092/files/DataSED%20-%20Dataset%20for%20Sound%20Event%20Detection%20of%20environmental%20noise.zip/content}"

download_url "$record_url" "$out/zenodo-record-15346092.json"
download_url "$paper_url" "$out/data-descriptor.html"
download_url "$evaluation_url" "$out/active-learning-evaluation.html"

if [[ "${DATASED_DOWNLOAD_AUDIO:-0}" == "1" ]]; then
  download_url "$archive_url" "$out/datased.zip"
else
  echo "Skipping the approximately 4.20 GiB DataSED archive."
  echo "Set DATASED_DOWNLOAD_AUDIO=1 to download it."
fi

echo "DataSED requested download complete: $out"
