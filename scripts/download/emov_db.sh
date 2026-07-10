#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir emov_db)"
openslr_page="${EMOV_DB_OPENSLR_PAGE_URL:-https://www.openslr.org/115/}"
base_url="${EMOV_DB_OPENSLR_BASE_URL:-https://openslr.trmal.net/resources/115}"
raw_base="${EMOV_DB_RAW_BASE_URL:-https://raw.githubusercontent.com/numediart/EmoV-DB/master}"

download_url "$openslr_page" "$out/openslr_115.html"
download_url "$raw_base/README.md" "$out/README.md"
download_url "$raw_base/LICENSE.md" "$out/LICENSE.md"

if [[ "${EMOV_DB_DOWNLOAD_ARCHIVES:-0}" != "1" ]]; then
  cat <<'MSG'
Downloaded EmoV-DB docs/license only. OpenSLR hosts per-speaker/per-emotion
speech archives; set EMOV_DB_DOWNLOAD_ARCHIVES=1 and EMOV_DB_PARTS to fetch
selected archives, for example:
  EMOV_DB_DOWNLOAD_ARCHIVES=1 EMOV_DB_PARTS="bea_Neutral.tar.gz sam_Neutral.tar.gz" scripts/download/emov_db.sh
MSG
  exit 0
fi

for part in ${EMOV_DB_PARTS:-bea_Neutral.tar.gz sam_Neutral.tar.gz}; do
  download_url "$base_url/$part" "$out/$part"
done

echo "EmoV-DB download complete: $out"
