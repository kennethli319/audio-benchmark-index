#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir asvspoof_2017)"
item_api="${ASVSPOOF2017_ITEM_API:-https://datashare.ed.ac.uk/server/api/core/items/59543650-e9b0-415d-8058-0567f908ce37}"
bitstreams_api="${ASVSPOOF2017_BITSTREAMS_API:-https://datashare.ed.ac.uk/server/api/core/bundles/6897bad8-7045-4ad8-851e-597cd426a786/bitstreams?size=100}"
bitstream_base="${ASVSPOOF2017_BITSTREAM_BASE_URL:-https://datashare.ed.ac.uk/server/api/core/bitstreams}"

download_url "$item_api" "$out/datashare_item.json"
download_url "$bitstreams_api" "$out/datashare_bitstreams.json"
download_url "$bitstream_base/ab9df60c-3909-4667-bff3-09b4925ea00a/content" "$out/README_V2.txt"
download_url "$bitstream_base/f2efb1ab-0620-440d-92f5-dc8be29fbccc/content" "$out/CHANGE_LOG_V2.txt"
download_url "$bitstream_base/fa4160e0-616c-41d7-9c8b-87107d02d3f9/content" "$out/Instructions_V2.txt"
download_url "$bitstream_base/105a2a98-5363-4c84-a6be-ba6ed06ea886/content" "$out/evaluation_plan.pdf"
download_url "$bitstream_base/410fedb8-5732-463a-ade2-d1fe9c0849eb/content" "$out/interspeech_summary.pdf"
download_url "$bitstream_base/da4d3ffc-f7df-4f90-b201-696a8ab47b5e/content" "$out/version_2_paper.pdf"

if [[ "${ASVSPOOF2017_DOWNLOAD_PROTOCOLS:-0}" == "1" ]]; then
  download_url "$bitstream_base/dbf267c4-517e-4193-9cdf-c8eadc82ec78/content" "$out/protocol_V2.zip"
fi

if [[ "${ASVSPOOF2017_DOWNLOAD_AUDIO:-0}" != "1" ]]; then
  echo "Downloaded ASVspoof 2017 V2 metadata and documentation to: $out"
  echo "Set ASVSPOOF2017_DOWNLOAD_PROTOCOLS=1 for the approximately 104 KiB protocol archive."
  echo "Set ASVSPOOF2017_DOWNLOAD_AUDIO=1 for the approximately 1.4 GiB train/dev/eval archives."
  exit 0
fi

download_url "$bitstream_base/4c7e2262-fe78-497e-839f-0ceabbbf2d1e/content" "$out/ASVspoof2017_V2_train.zip"
download_url "$bitstream_base/4daef0d3-f9e8-49e4-9ffc-a7362842a8f2/content" "$out/ASVspoof2017_V2_dev.zip"
download_url "$bitstream_base/77c52086-76ed-4517-a72a-cc94e54a2c0a/content" "$out/ASVspoof2017_V2_eval.zip"

echo "ASVspoof 2017 V2 requested downloads complete: $out"
