#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir primewords_chinese)"
openslr_page="${PRIMEWORDS_OPENSLR_PAGE:-https://www.openslr.org/47/}"
base_url="${PRIMEWORDS_OPENSLR_BASE_URL:-https://openslr.trmal.net/resources/47}"
archive_name="${PRIMEWORDS_ARCHIVE_NAME:-primewords_md_2018_set1.tar.gz}"

download_url "$openslr_page" "$out/openslr-47.html"

if [[ "${PRIMEWORDS_DOWNLOAD_ARCHIVE:-0}" != "1" ]]; then
  echo "Downloaded Primewords Chinese OpenSLR page to: $out"
  echo "Skipping the 9.0 GiB speech archive. Set PRIMEWORDS_DOWNLOAD_ARCHIVE=1 to download it."
  exit 0
fi

download_url "$base_url/$archive_name" "$out/$archive_name"

echo "Primewords Chinese archive download complete: $out/$archive_name"
