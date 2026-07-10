#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir pansori_tedxkr)"
openslr_page="${PANSORI_TEDXKR_OPENSLR_PAGE:-https://www.openslr.org/58/}"
base_url="${PANSORI_TEDXKR_OPENSLR_BASE_URL:-https://openslr.trmal.net/resources/58}"
archive="${PANSORI_TEDXKR_ARCHIVE:-pansori-tedxkr-corpus-1.0.tar.gz}"

download_url "$openslr_page" "$out/openslr-58.html"
download_url "$base_url/about.html" "$out/about.html"
download_url "$base_url/info.txt" "$out/info.txt"
download_url "$base_url/checksum.md5" "$out/checksum.md5"

if [[ "${PANSORI_TEDXKR_DOWNLOAD_ARCHIVE:-0}" != "1" ]]; then
  echo "Downloaded Pansori-TEDxKR OpenSLR metadata to: $out"
  echo "Skipping 174 MB corpus archive. Set PANSORI_TEDXKR_DOWNLOAD_ARCHIVE=1 to download it."
  exit 0
fi

if [[ "$archive" != "pansori-tedxkr-corpus-1.0.tar.gz" ]]; then
  echo "Unsupported Pansori-TEDxKR archive name: $archive" >&2
  echo "Use the official OpenSLR archive name: pansori-tedxkr-corpus-1.0.tar.gz" >&2
  exit 2
fi

download_url "$base_url/$archive" "$out/$archive"

echo "Pansori-TEDxKR archive download complete: $out"
