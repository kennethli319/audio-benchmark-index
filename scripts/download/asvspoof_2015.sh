#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir asvspoof_2015)"
item_api="${ASVSPOOF2015_ITEM_API:-https://datashare.ed.ac.uk/server/api/core/items/a714c9b8-4acd-43a2-ac45-68eebcd070de}"
bitstreams_api="${ASVSPOOF2015_BITSTREAMS_API:-https://datashare.ed.ac.uk/server/api/core/bundles/a8516720-46e8-48bd-bf7c-9f3ce5f4526f/bitstreams?size=100}"
bitstream_base="${ASVSPOOF2015_BITSTREAM_BASE_URL:-https://datashare.ed.ac.uk/server/api/core/bitstreams}"

download_url "$item_api" "$out/datashare_item.json"
download_url "$bitstreams_api" "$out/datashare_bitstreams.json"
download_url "$bitstream_base/316b9ee4-0930-4e48-87f8-dd3698b6262b/content" "$out/README.txt"
download_url "$bitstream_base/8e97c2bf-9814-4d36-bb41-5c171de769f2/content" "$out/file_descriptions.txt"
download_url "$bitstream_base/dcbce93c-c917-4e65-a076-be538095c594/content" "$out/ExtractionInstructions.txt"
download_url "$bitstream_base/ad8c90d4-4fba-4a77-81f7-94aae9d5f667/content" "$out/evaluation_plan.pdf"
download_url "$bitstream_base/e5e5a3e2-64ad-46fd-b878-834dc8ff0868/content" "$out/summary_paper.pdf"

if [[ "${ASVSPOOF2015_DOWNLOAD_PROTOCOLS:-0}" == "1" ]]; then
  download_url "$bitstream_base/6e75c177-7387-494d-a5e9-33eb5ebf7620/content" "$out/protocol.tar.gz"
fi

if [[ "${ASVSPOOF2015_DOWNLOAD_AUDIO:-0}" != "1" ]]; then
  echo "Downloaded ASVspoof 2015 metadata and documentation to: $out"
  echo "Set ASVSPOOF2015_DOWNLOAD_PROTOCOLS=1 for the approximately 2.1 MB protocol archive."
  echo "Set ASVSPOOF2015_DOWNLOAD_AUDIO=1 for the approximately 24.1 GB three-part WAV archive."
  exit 0
fi

download_url "$bitstream_base/d3438d7f-1165-486d-9e98-ee7287172860/content" "$out/wav_data.aa.tar.gz"
download_url "$bitstream_base/dbd0b814-9541-418f-bd20-2f2312bf08bb/content" "$out/wav_data.ab.tar.gz"
download_url "$bitstream_base/77d7c0ef-35f7-4510-972a-80949bbf8573/content" "$out/wav_data.ac.tar.gz"

echo "ASVspoof 2015 requested downloads complete: $out"
