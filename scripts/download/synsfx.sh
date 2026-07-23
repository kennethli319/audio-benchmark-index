#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir synsfx)"
project_url="${SYNSFX_PROJECT_URL:-https://ofspectrum.com/news/synsfx}"
paper_url="${SYNSFX_PAPER_URL:-https://arxiv.org/abs/2607.04848}"
archive_url="${SYNSFX_ARCHIVE_URL:-https://ofspectrum.com/api/backend/storage/datasets/synsfx/download}"

download_url "$project_url" "$out/project.html"
download_url "$paper_url" "$out/arxiv-2607.04848.html"

if [[ "${SYNSFX_DOWNLOAD_ARCHIVE:-0}" == "1" ]]; then
  if [[ "${SYNSFX_ACK_RESEARCH_ONLY:-0}" != "1" ]]; then
    echo "Set SYNSFX_ACK_RESEARCH_ONLY=1 after reviewing the publisher's academic-research-only notice." >&2
    exit 1
  fi
  download_url "$archive_url" "$out/synsfx-dataset.zip"
else
  manual_required \
    "SynSFX" \
    "Saved the official project page and paper to $out." \
    "The publisher labels the dataset Academic research only but does not publish a full standalone license." \
    "Review the official page and all incorporated source-dataset terms." \
    "Then set SYNSFX_ACK_RESEARCH_ONLY=1 and SYNSFX_DOWNLOAD_ARCHIVE=1 to fetch the large uncompressed-WAV archive." \
    "Dataset route: $archive_url"
fi

echo "SynSFX metadata download complete: $out"
