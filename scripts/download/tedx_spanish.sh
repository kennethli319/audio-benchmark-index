#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir tedx_spanish)"
openslr_page="${TEDX_SPANISH_OPENSLR_PAGE:-https://www.openslr.org/67/}"
base_url="${TEDX_SPANISH_OPENSLR_BASE_URL:-https://openslr.trmal.net/resources/67}"
archive="${TEDX_SPANISH_ARCHIVE:-tedx_spanish_corpus.tgz}"

download_url "$openslr_page" "$out/openslr-67.html"

if [[ "${TEDX_SPANISH_DOWNLOAD_ARCHIVE:-0}" != "1" ]]; then
  echo "Downloaded TEDx Spanish OpenSLR page to: $out"
  echo "Skipping 2.3 GiB archive. Set TEDX_SPANISH_DOWNLOAD_ARCHIVE=1 to download it."
  exit 0
fi

if [[ "$archive" != "tedx_spanish_corpus.tgz" ]]; then
  echo "Unsupported TEDx Spanish archive name: $archive" >&2
  echo "Use the official OpenSLR archive name: tedx_spanish_corpus.tgz" >&2
  exit 2
fi

download_url "$base_url/$archive" "$out/$archive"

echo "TEDx Spanish archive download complete: $out"
