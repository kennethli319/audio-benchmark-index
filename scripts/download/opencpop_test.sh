#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir opencpop_test)"
homepage_url="${OPEN_CPOP_HOMEPAGE_URL:-https://wenet-e2e.github.io/opencpop/}"
download_page_url="${OPEN_CPOP_DOWNLOAD_PAGE_URL:-https://wenet-e2e.github.io/opencpop/download/}"
license_url="${OPEN_CPOP_LICENSE_URL:-https://wenet-e2e.github.io/opencpop/liscense/}"
testset_url="${OPEN_CPOP_TESTSET_URL:-https://wenet-e2e.github.io/opencpop/resources/testset/}"
paper_url="${OPEN_CPOP_PAPER_URL:-https://arxiv.org/abs/2201.07429}"
qwen_report_url="${OPEN_CPOP_QWEN_REPORT_URL:-https://arxiv.org/abs/2604.15804}"

download_url "$homepage_url" "$out/homepage.html"
download_url "$download_page_url" "$out/download.html"
download_url "$license_url" "$out/license.html"
download_url "$testset_url" "$out/testset.html"
download_url "$paper_url" "$out/arxiv-2201.07429.html"
download_url "$qwen_report_url" "$out/arxiv-2604.15804.html"

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
  "After extraction, use the five-song corpus test split for Opencpop-test." \
  "Official provenance pages were saved under: $out"
