#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir libricss)"
repo_raw_url="${LIBRICSS_REPO_RAW_URL:-https://raw.githubusercontent.com/chenzhuo1011/libri_css/master}"
repo_api_url="${LIBRICSS_REPO_API_URL:-https://api.github.com/repos/chenzhuo1011/libri_css}"
paper_url="${LIBRICSS_PAPER_URL:-https://arxiv.org/abs/2001.11482}"
archive_url="${LIBRICSS_ARCHIVE_URL:-https://drive.usercontent.google.com/download?id=1Piioxd5G_85K9Bhcr8ebdhXx0CnaHy7l&export=download&confirm=t}"

download_url "$repo_raw_url/README.md" "$out/README.md"
download_url "$repo_raw_url/LICENSE" "$out/LICENSE"
download_url "$repo_raw_url/dataprep/scripts/dataprep.sh" "$out/dataprep.sh"
download_url "$repo_api_url" "$out/github-api.json"
download_url "$paper_url" "$out/arxiv-2001.11482.html"

if [[ "${LIBRICSS_DOWNLOAD_ARCHIVE:-0}" == "1" ]]; then
  download_url "$archive_url" "$out/for_release.zip"
else
  echo "Skipping the approximately 5.97 GiB archive. Set LIBRICSS_DOWNLOAD_ARCHIVE=1 to fetch it."
fi

cat <<MSG
LibriCSS documentation download complete: $out

The repository applies MIT to software/documentation and identifies its source
LibriSpeech corpus as CC BY 4.0, but does not state a separate recording
license. Confirm recording-level rights before redistribution or commercial use.
MSG
