#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir single_item_kawaii_measure)"
sheet_id="1h7qdgqUb7k60VuccAaOSeBVv8HrlbGJ1rrecAAqSW24"

download_url "https://arxiv.org/abs/2607.19352" "$out/paper.html"

if [[ "${SINGLE_ITEM_KAWAII_DOWNLOAD_XLSX:-0}" != "1" ]]; then
  echo "Single-Item Kawaii Measure paper download complete: $out"
  echo "Set SINGLE_ITEM_KAWAII_ACK_UNSPECIFIED_LICENSE=1 and SINGLE_ITEM_KAWAII_DOWNLOAD_XLSX=1 to export the public participant-level workbook."
  exit 0
fi

if [[ "${SINGLE_ITEM_KAWAII_ACK_UNSPECIFIED_LICENSE:-0}" != "1" ]]; then
  echo "The public workbook states no data license or reuse terms." >&2
  echo "Review participant-data and source-stimulus rights, then set SINGLE_ITEM_KAWAII_ACK_UNSPECIFIED_LICENSE=1 to acknowledge this limitation." >&2
  exit 2
fi

download_url \
  "https://docs.google.com/spreadsheets/d/$sheet_id/export?format=xlsx" \
  "$out/validating-kawaii.xlsx"

cat <<'EOF'
Downloaded the author-linked public workbook. It contains participant-level
ratings and analysis rather than bundled audio. The workbook states no data
license; do not assume the paper license covers the data or source stimuli.
EOF

echo "Single-Item Kawaii Measure workbook download complete: $out"
