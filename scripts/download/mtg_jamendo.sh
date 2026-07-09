#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir mtg_jamendo)"
repo_url="${MTG_JAMENDO_REPO_URL:-https://github.com/MTG/mtg-jamendo-dataset.git}"
record_url="${MTG_JAMENDO_RECORD_URL:-https://zenodo.org/api/records/3826813}"
zenodo_data_url="${MTG_JAMENDO_ZENODO_DATA_URL:-https://zenodo.org/api/records/3826813/files/data.zip/content}"
dataset="${MTG_JAMENDO_DATASET:-raw_30s}"
data_type="${MTG_JAMENDO_TYPE:-audio-low}"
download_from="${MTG_JAMENDO_FROM:-mtg-fast}"

clone_or_update "$repo_url" "$out/mtg-jamendo-dataset"
download_url "$record_url" "$out/zenodo-record.json"

if [[ "${MTG_JAMENDO_DOWNLOAD_ZENODO_DATA:-0}" == "1" ]]; then
  download_url "$zenodo_data_url" "$out/data.zip"
else
  echo "Skipping MTG-Jamendo Zenodo metadata archive (about 33 MiB). Set MTG_JAMENDO_DOWNLOAD_ZENODO_DATA=1 to download it."
fi

if [[ "${MTG_JAMENDO_DOWNLOAD_MEDIA:-0}" != "1" ]]; then
  echo "Skipping MTG-Jamendo media/features archives. Set MTG_JAMENDO_DOWNLOAD_MEDIA=1 to run the upstream downloader."
  echo "Defaults: MTG_JAMENDO_DATASET=raw_30s MTG_JAMENDO_TYPE=audio-low MTG_JAMENDO_FROM=mtg-fast."
  echo "Official sizes include raw_30s/audio 508 GiB, raw_30s/audio-low 156 GiB, and autotagging_moodtheme/audio-low 46 GiB."
  exit 0
fi

require_cmd python3
python3 "$out/mtg-jamendo-dataset/scripts/download/download.py" \
  --dataset "$dataset" \
  --type "$data_type" \
  --from "$download_from" \
  "$out"

echo "MTG-Jamendo download complete: $out"
