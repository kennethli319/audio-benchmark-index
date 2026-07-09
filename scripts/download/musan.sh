#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir musan)"
openslr_page="${MUSAN_OPENSLR_PAGE:-https://www.openslr.org/17/}"
base_url="${MUSAN_OPENSLR_BASE_URL:-https://openslr.trmal.net/resources/17}"

download_url "$openslr_page" "$out/openslr-17.html"

if [[ "${MUSAN_DOWNLOAD_ARCHIVE:-0}" != "1" ]]; then
  echo "Downloaded MUSAN OpenSLR page to: $out/openslr-17.html"
  echo "Skipping the 11 GiB corpus archive. Set MUSAN_DOWNLOAD_ARCHIVE=1 to download it."
  exit 0
fi

download_url "$base_url/musan.tar.gz" "$out/musan.tar.gz"

echo "MUSAN archive download complete: $out/musan.tar.gz"
