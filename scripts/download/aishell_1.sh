#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir aishell_1)"
openslr_page="${AISHELL1_OPENSLR_PAGE:-https://www.openslr.org/33/}"
base_url="${AISHELL1_OPENSLR_BASE_URL:-https://openslr.trmal.net/resources/33}"

download_url "$openslr_page" "$out/openslr-33.html"
download_url "$base_url/resource_aishell.tgz" "$out/resource_aishell.tgz"

if [[ "${AISHELL1_DOWNLOAD_ARCHIVE:-0}" != "1" ]]; then
  echo "Downloaded AISHELL-1 OpenSLR page and supplementary resources to: $out"
  echo "Skipping the 15 GiB speech archive. Set AISHELL1_DOWNLOAD_ARCHIVE=1 to download it."
  exit 0
fi

download_url "$base_url/data_aishell.tgz" "$out/data_aishell.tgz"

echo "AISHELL-1 archive download complete: $out/data_aishell.tgz"
