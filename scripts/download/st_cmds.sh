#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir st_cmds)"
openslr_page="${ST_CMDS_OPENSLR_PAGE:-https://www.openslr.org/38/}"
base_url="${ST_CMDS_OPENSLR_BASE_URL:-https://openslr.trmal.net/resources/38}"
archive_name="${ST_CMDS_ARCHIVE_NAME:-ST-CMDS-20170001_1-OS.tar.gz}"

download_url "$openslr_page" "$out/openslr-38.html"

if [[ "${ST_CMDS_DOWNLOAD_ARCHIVE:-0}" != "1" ]]; then
  echo "Downloaded ST-CMDS OpenSLR page to: $out"
  echo "Skipping the 8.2 GiB speech/transcript archive. Set ST_CMDS_DOWNLOAD_ARCHIVE=1 to download it."
  exit 0
fi

download_url "$base_url/$archive_name" "$out/$archive_name"

echo "ST-CMDS archive download complete: $out/$archive_name"
