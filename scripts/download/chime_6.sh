#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir chime_6)"
base_url="${CHIME6_OPENSLR_BASE_URL:-https://openslr.trmal.net/resources/150}"

download_openslr_file() {
  local file="$1"
  download_url "$base_url/$file" "$out/$file"
}

download_openslr_file CHiME6_transcriptions.tar.gz
download_openslr_file CHiME6_floorplans.tar.gz
download_openslr_file LICENSE.txt

if [[ "${CHIME6_DOWNLOAD_AUDIO:-0}" == "1" ]]; then
  for part in ${CHIME6_PARTS:-CHiME6_dev.tar.gz CHiME6_eval.tar.gz}; do
    download_openslr_file "$part"
  done
else
  cat <<'MSG'
Skipping CHiME-6 audio archives. They are large: train is about 97 GiB,
dev is about 11 GiB, and eval is about 12 GiB. Set CHIME6_DOWNLOAD_AUDIO=1
and CHIME6_PARTS, for example:
  CHIME6_DOWNLOAD_AUDIO=1 CHIME6_PARTS="CHiME6_dev.tar.gz CHiME6_eval.tar.gz" scripts/download/chime_6.sh
MSG
fi

echo "CHiME-6 metadata/transcriptions download complete: $out"
