#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir libritts)"
openslr_page="${LIBRITTS_OPENSLR_PAGE:-https://www.openslr.org/60/}"
base_url="${LIBRITTS_OPENSLR_BASE_URL:-https://openslr.trmal.net/resources/60}"
parts="${LIBRITTS_PARTS:-dev-clean dev-other test-clean test-other}"

download_url "$openslr_page" "$out/openslr-60.html"

if [[ "${LIBRITTS_DOWNLOAD_ARCHIVES:-0}" != "1" ]]; then
  echo "Downloaded LibriTTS OpenSLR page to: $out/openslr-60.html"
  echo "Skipping multi-GiB archives. Set LIBRITTS_DOWNLOAD_ARCHIVES=1 to download selected parts."
  exit 0
fi

for part in $parts; do
  download_url "$base_url/$part.tar.gz" "$out/$part.tar.gz"
done

echo "LibriTTS archive download complete: $out"
