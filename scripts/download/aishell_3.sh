#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir aishell_3)"
page_url="${AISHELL3_PAGE_URL:-https://www.openslr.org/93/}"
base_url="${AISHELL3_OPENSLR_BASE_URL:-https://openslr.trmal.net/resources/93}"
archive_name="${AISHELL3_ARCHIVE_NAME:-data_aishell3.tgz}"

download_url "$page_url" "$out/openslr_93.html"

if [[ "${AISHELL3_DOWNLOAD_ARCHIVE:-0}" == "1" ]]; then
  download_url "$base_url/$archive_name" "$out/$archive_name"
else
  cat <<'MSG'
Skipping AISHELL-3 speech archive. OpenSLR lists data_aishell3.tgz as 19 GiB.
Set AISHELL3_DOWNLOAD_ARCHIVE=1 to download it, for example:
  AISHELL3_DOWNLOAD_ARCHIVE=1 scripts/download/aishell_3.sh
MSG
fi

echo "AISHELL-3 metadata download complete: $out"
