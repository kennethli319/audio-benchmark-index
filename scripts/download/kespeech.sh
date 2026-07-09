#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir kespeech)"

if [[ -n "${KESPEECH_ARCHIVE_URL:-}" ]]; then
  filename="${KESPEECH_FILENAME:-$(basename "${KESPEECH_ARCHIVE_URL%%\?*}")}"
  download_url "$KESPEECH_ARCHIVE_URL" "$out/$filename"
  echo "KeSpeech download complete: $out/$filename"
  exit 0
fi

manual_required \
  "KeSpeech" \
  "The official repository points to Baidu Pan with password b6fy." \
  "There is no official standard CLI command in the repo." \
  "If you obtain a direct archive URL, run:" \
  "  KESPEECH_ARCHIVE_URL='https://...' scripts/download/kespeech.sh"
