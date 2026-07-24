#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir bvcc)"
homepage_url="${BVCC_HOMEPAGE_URL:-https://voicemos-challenge-2022.github.io/}"
homepage_source_url="${BVCC_HOMEPAGE_SOURCE_URL:-https://raw.githubusercontent.com/VoiceMOS-Challenge-2022/VoiceMOS-Challenge-2022.github.io/main/index.md}"
zenodo_api_url="${BVCC_ZENODO_API_URL:-https://zenodo.org/api/records/6572573}"
zenodo_files_url="${BVCC_ZENODO_FILES_URL:-https://zenodo.org/api/records/6572573/files}"

download_url "$homepage_url" "$out/homepage.html"
download_url "$homepage_source_url" "$out/homepage-index.md"
download_url "$zenodo_api_url" "$out/zenodo-record-6572573.json"

if [[ "${BVCC_DOWNLOAD_MAIN:-0}" == "1" ]]; then
  download_url "$zenodo_files_url/main.tar.gz/content" "$out/main.tar.gz"
else
  echo "Skipping the approximately 273.4 MiB main-track archive. Set BVCC_DOWNLOAD_MAIN=1 to download it."
fi

if [[ "${BVCC_DOWNLOAD_OOD:-0}" == "1" ]]; then
  download_url "$zenodo_files_url/ood.tar.gz/content" "$out/ood.tar.gz"
else
  echo "Skipping the out-of-domain package. Set BVCC_DOWNLOAD_OOD=1 to download it."
fi

if [[ "${BVCC_DOWNLOAD_SCORING:-0}" == "1" ]]; then
  download_url "$zenodo_files_url/scoring_program_distribute.tar.gz/content" "$out/scoring_program_distribute.tar.gz"
else
  echo "Skipping the scoring package. Set BVCC_DOWNLOAD_SCORING=1 to download it."
fi

cat <<EOF
BVCC metadata download complete: $out
Zenodo labels the release Other (Open), but explicitly forbids redistribution
of Blizzard Challenge samples and omits those files. Review all component terms.
EOF
