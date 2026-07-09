#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir magnatagatune)"
base_url="${MAGNATAGATUNE_BASE_URL:-https://mirg.city.ac.uk/datasets/magnatagatune}"

download_mtt_file() {
  local file="$1"
  download_url "$base_url/$file" "$out/$file"
}

download_mtt_file clip_info_final.csv
download_mtt_file annotations_final.csv
download_mtt_file comparisons_final.csv
download_mtt_file clip_info_final.sql.zip

if [[ "${MAGNATAGATUNE_DOWNLOAD_FEATURES:-0}" == "1" ]]; then
  download_mtt_file mp3_echonest_xml.zip
else
  echo "Skipping MagnaTagATune Echo Nest feature ZIP (~359 MiB). Set MAGNATAGATUNE_DOWNLOAD_FEATURES=1 to download it."
fi

if [[ "${MAGNATAGATUNE_DOWNLOAD_AUDIO:-0}" == "1" ]]; then
  download_mtt_file mp3.zip.001
  download_mtt_file mp3.zip.002
  download_mtt_file mp3.zip.003
else
  echo "Skipping MagnaTagATune MP3 split archives (~3 GiB). Set MAGNATAGATUNE_DOWNLOAD_AUDIO=1 to download them."
fi

echo "MagnaTagATune metadata/features download complete: $out"
