#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir opencpop_test)"

if [[ -n "${OPEN_CPOP_ARCHIVE_URL:-}" ]]; then
  filename="${OPEN_CPOP_FILENAME:-$(basename "${OPEN_CPOP_ARCHIVE_URL%%\?*}")}"
  download_url "$OPEN_CPOP_ARCHIVE_URL" "$out/$filename"
  echo "Opencpop download complete: $out/$filename"
  exit 0
fi

manual_required \
  "Opencpop-test" \
  "Fill out the official Opencpop Google Form and follow the email instructions first." \
  "If the email provides a direct archive URL, run:" \
  "  OPEN_CPOP_ARCHIVE_URL='https://...' scripts/download/opencpop_test.sh" \
  "After extraction, use the corpus test split for Opencpop-test."
