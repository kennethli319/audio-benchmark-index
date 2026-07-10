#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir hifitts)"
page_url="${HIFITTS_PAGE_URL:-https://www.openslr.org/109/}"
base_url="${HIFITTS_OPENSLR_BASE_URL:-https://openslr.trmal.net/resources/109}"
archive_name="${HIFITTS_ARCHIVE_NAME:-hi_fi_tts_v0.tar.gz}"

download_url "$page_url" "$out/openslr-109.html"

if [[ "${HIFITTS_DOWNLOAD_ARCHIVE:-0}" == "1" ]]; then
  download_url "$base_url/$archive_name" "$out/$archive_name"
else
  cat <<'MSG'
Skipping Hi-Fi TTS speech/text archive. OpenSLR lists hi_fi_tts_v0.tar.gz as 39-41 GiB.
Set HIFITTS_DOWNLOAD_ARCHIVE=1 to download it, for example:
  HIFITTS_DOWNLOAD_ARCHIVE=1 scripts/download/hifitts.sh
MSG
fi

echo "Hi-Fi TTS metadata download complete: $out"
