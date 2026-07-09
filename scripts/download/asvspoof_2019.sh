#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir asvspoof_2019)"
item_api="${ASVSPOOF2019_ITEM_API:-https://datashare.ed.ac.uk/server/api/core/items/31074a11-b6f6-4e92-a4ad-07093f8c0c45}"
bitstreams_api="${ASVSPOOF2019_BITSTREAMS_API:-https://datashare.ed.ac.uk/server/api/core/bundles/d7e9ad8b-23c2-4a84-b9e7-0cd307dfec46/bitstreams?size=100}"
bitstream_base="${ASVSPOOF2019_BITSTREAM_BASE_URL:-https://datashare.ed.ac.uk/server/api/core/bitstreams}"

download_url "$item_api" "$out/datashare_item.json"
download_url "$bitstreams_api" "$out/datashare_bitstreams.json"
download_url "$bitstream_base/765597d6-633f-418a-96b0-39274a8d56c9/content" "$out/README.txt"
download_url "$bitstream_base/60c7de6d-37d3-45c1-b52e-9f18b0338e47/content" "$out/LICENSE_text.txt"
download_url "$bitstream_base/8dd50200-9778-4eae-863b-f6f3bfc21983/content" "$out/asvspoof2019_evaluation_plan.pdf"
download_url "$bitstream_base/bed1c1fb-5430-41c6-944e-9e079e61f5af/content" "$out/asvspoof2019_Interspeech2019_submission.pdf"

download_part() {
  local part="$1"
  case "$part" in
    LA)
      download_url "$bitstream_base/a9f87c35-f055-4015-80e2-2fdff0d46269/content" "$out/LA.zip"
      ;;
    PA)
      download_url "$bitstream_base/852ec9ad-fe51-48e7-93bd-5259b94e25d6/content" "$out/PA.zip"
      ;;
    *)
      echo "Unknown ASVspoof 2019 part: $part" >&2
      echo "Known parts: LA PA" >&2
      exit 2
      ;;
  esac
}

if [[ "${ASVSPOOF2019_DOWNLOAD_ARCHIVES:-0}" != "1" ]]; then
  echo "Downloaded ASVspoof 2019 metadata, license, README, and PDFs to: $out"
  echo "Skipping LA/PA archives. Set ASVSPOOF2019_DOWNLOAD_ARCHIVES=1 to download selected archives."
  echo "Example: ASVSPOOF2019_DOWNLOAD_ARCHIVES=1 ASVSPOOF2019_PARTS=\"LA PA\" $0"
  exit 0
fi

parts="${ASVSPOOF2019_PARTS:-LA PA}"
if [[ "$parts" == "all" ]]; then
  parts="LA PA"
fi

for part in $parts; do
  download_part "$part"
done

echo "ASVspoof 2019 requested downloads complete: $out"
