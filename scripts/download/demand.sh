#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir demand)"
record="${DEMAND_RECORD:-1227121}"
record_url="https://zenodo.org/records/$record"
api_url="https://zenodo.org/api/records/$record"

download_url "$record_url" "$out/index.html"
download_url "$api_url" "$out/record.json"
download_url "$api_url/files/DEMAND.pdf/content" "$out/DEMAND.pdf"

if [[ -n "${DEMAND_SCENE:-}" ]]; then
  case "$DEMAND_SCENE" in
    DKITCHEN|DLIVING|DWASHING|NFIELD|NPARK|NRIVER|OHALLWAY|OMEETING|OOFFICE|PCAFETER|PRESTO|PSTATION|SCAFE|SPSQUARE|STRAFFIC|TBUS|TCAR|TMETRO) ;;
    *)
      echo "Unsupported DEMAND_SCENE: $DEMAND_SCENE" >&2
      echo "Choose one of: DKITCHEN DLIVING DWASHING NFIELD NPARK NRIVER OHALLWAY OMEETING OOFFICE PCAFETER PRESTO PSTATION SCAFE SPSQUARE STRAFFIC TBUS TCAR TMETRO" >&2
      exit 2
      ;;
  esac

  case "${DEMAND_SAMPLE_RATE:-16k}" in
    16k|48k) sample_rate="${DEMAND_SAMPLE_RATE:-16k}" ;;
    *)
      echo "DEMAND_SAMPLE_RATE must be 16k or 48k." >&2
      exit 2
      ;;
  esac

  archive="${DEMAND_SCENE}_${sample_rate}.zip"
  download_url "$api_url/files/$archive/content" "$out/$archive"
else
  echo "Skipping DEMAND audio. Set DEMAND_SCENE and optionally DEMAND_SAMPLE_RATE=16k|48k to download one scene."
fi

echo "DEMAND metadata download complete: $out"
