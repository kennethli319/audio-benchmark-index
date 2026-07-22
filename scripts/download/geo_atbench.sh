#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir geo_atbench)"
repo_api_url="${GEO_ATBENCH_REPO_API_URL:-https://api.github.com/repos/WuYanru2002/Geo-ATBench}"
readme_url="${GEO_ATBENCH_README_URL:-https://raw.githubusercontent.com/WuYanru2002/Geo-ATBench/main/README.md}"
paper_url="${GEO_ATBENCH_PAPER_URL:-https://arxiv.org/abs/2603.10623}"
zenodo_api_url="${GEO_ATBENCH_ZENODO_API_URL:-https://zenodo.org/api/records/18980673}"
archive_url="${GEO_ATBENCH_ARCHIVE_URL:-https://zenodo.org/api/records/18980673/files/Geo-ATBench.zip/content}"

download_url "$repo_api_url" "$out/github-repository.json"
download_url "$readme_url" "$out/README.md"
download_url "$paper_url" "$out/paper.html"
download_url "$zenodo_api_url" "$out/zenodo-record.json"

if [[ "${GEO_ATBENCH_DOWNLOAD_DATA:-0}" != "1" ]]; then
  echo "Downloaded Geo-ATBench documentation and metadata to: $out"
  echo "Set GEO_ATBENCH_DOWNLOAD_DATA=1 to download the approximately 850 MB dataset archive."
  echo "The Zenodo record declares CC BY 4.0; review Freesound and OpenStreetMap source terms."
  exit 0
fi

download_url "$archive_url" "$out/Geo-ATBench.zip"
echo "Downloaded Geo-ATBench dataset archive to: $out/Geo-ATBench.zip"
echo "Preserve source attribution and review per-clip Freesound and OpenStreetMap terms."
