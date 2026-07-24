#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir lrro)"
zenodo_record="${LRRO_ZENODO_RECORD:-3753559}"
zenodo_api_url="${LRRO_ZENODO_API_URL:-https://zenodo.org/api/records/$zenodo_record}"
archive_url="${LRRO_ARCHIVE_URL:-$zenodo_api_url/files/LRRo_data_set.tar.gz/content}"
raw_readme_url="${LRRO_README_URL:-https://raw.githubusercontent.com/ajitaru/2020-LRRo_data_set/master/README.md}"
repo_api_url="${LRRO_REPO_API_URL:-https://api.github.com/repos/ajitaru/2020-LRRo_data_set}"
paper_metadata_url="${LRRO_PAPER_METADATA_URL:-https://api.crossref.org/works/10.1145/3339825.3394932}"

download_url "$zenodo_api_url" "$out/zenodo-record-$zenodo_record.json"
download_url "$raw_readme_url" "$out/README.md"
download_url "$repo_api_url" "$out/github-repo.json"
download_url "$paper_metadata_url" "$out/paper-crossref.json"

if [[ "${LRRO_DOWNLOAD_ARCHIVE:-0}" == "1" ]]; then
  download_url "$archive_url" "$out/LRRo_data_set.tar.gz"
  echo "Expected upstream MD5: 17f10ef83c01e596dacf39b7cab658be"
else
  echo "Skipping the approximately 278 MiB archive. Set LRRO_DOWNLOAD_ARCHIVE=1 to fetch it."
fi

cat <<MSG
LRRo documentation download complete: $out

Zenodo declares the dataset CC BY 4.0. Wild LRRo includes Internet-derived
footage and the release contains identifiable speaker imagery, so review
source-media, privacy, likeness, and biometric-use considerations.
MSG
