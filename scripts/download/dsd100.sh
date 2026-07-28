#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir dsd100)"
homepage="${DSD100_HOMEPAGE:-https://sigsep.github.io/datasets/dsd100.html}"
page_source="${DSD100_PAGE_SOURCE:-https://raw.githubusercontent.com/sigsep/website/master/content/datasets/dsd100.md}"
parser_repo="${DSD100_PARSER_REPO:-https://github.com/faroit/dsdtools.git}"
parser_raw="${DSD100_PARSER_RAW:-https://raw.githubusercontent.com/faroit/dsdtools/master}"
archive_url="${DSD100_ARCHIVE_URL:-http://liutkus.net/DSD100.zip}"

download_url "$homepage" "$out/index.html"
download_url "$page_source" "$out/dsd100.md"
download_url "$parser_raw/README.md" "$out/dsdtools-README.md"
download_url "$parser_raw/LICENSE" "$out/dsdtools-LICENSE"

if [[ "${DSD100_CLONE_PARSER:-0}" == "1" ]]; then
  clone_or_update "$parser_repo" "$out/dsdtools"
else
  echo "Skipping DSD100 parser clone. Set DSD100_CLONE_PARSER=1 to clone it."
fi

if [[ "${DSD100_DOWNLOAD_ARCHIVE:-0}" == "1" ]]; then
  echo "Review the source-track usage terms linked by the official SigSep page before continuing."
  download_url "$archive_url" "$out/DSD100.zip"
else
  echo "Skipping approximately 14.9 GB DSD100 archive. Set DSD100_DOWNLOAD_ARCHIVE=1 to download it."
fi

echo "DSD100 docs download complete: $out"
