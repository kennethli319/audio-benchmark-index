#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir common_voice)"

if [[ -z "${COMMON_VOICE_DOWNLOAD_URL:-}" ]]; then
  manual_required \
    "Common Voice" \
    "Common Voice downloads are selected per release/language on Mozilla Data Collective." \
    "Get a generated download URL from the browser/API, then run:" \
    "  COMMON_VOICE_DOWNLOAD_URL='https://...' scripts/download/common_voice.sh" \
    "Optional: COMMON_VOICE_FILENAME=cv-corpus.tar.gz"
fi

filename="${COMMON_VOICE_FILENAME:-$(basename "${COMMON_VOICE_DOWNLOAD_URL%%\?*}")}"
if [[ -z "$filename" || "$filename" == "/" || "$filename" == "." ]]; then
  filename="common_voice_download"
fi

download_url "$COMMON_VOICE_DOWNLOAD_URL" "$out/$filename"
echo "Common Voice download complete: $out/$filename"
