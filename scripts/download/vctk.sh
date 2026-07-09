#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir vctk)"
readme_url="${VCTK_README_URL:-https://datashare.ed.ac.uk/bitstreams/bb7edd96-5d96-4c0e-8989-1e45597e7b72/download}"
license_url="${VCTK_LICENSE_URL:-https://datashare.ed.ac.uk/bitstreams/956a1688-0b59-428c-8a2f-10837433dde3/download}"
archive_url="${VCTK_ARCHIVE_URL:-https://datashare.ed.ac.uk/bitstreams/535f4286-e54c-4038-838c-a02285e32cb2/download}"

download_url "$readme_url" "$out/README.txt"
download_url "$license_url" "$out/license_text.txt"

if [[ "${VCTK_DOWNLOAD_ARCHIVE:-0}" != "1" ]]; then
  echo "Downloaded VCTK README and license text to: $out"
  echo "Skipping 10.94 GiB archive. Set VCTK_DOWNLOAD_ARCHIVE=1 to download it."
  exit 0
fi

download_url "$archive_url" "$out/VCTK-Corpus-0.92.zip"

echo "VCTK archive download complete: $out"
