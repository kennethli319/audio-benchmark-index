#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir macs)"
macs_base_url="${MACS_ZENODO_BASE_URL:-https://zenodo.org/api/records/5114771/files}"
tau_base_url="${MACS_TAU2019_ZENODO_BASE_URL:-https://zenodo.org/api/records/2589280/files}"

download_macs_file() {
  local file="$1"
  download_url "$macs_base_url/$file/content" "$out/$file"
}

download_tau_file() {
  local file="$1"
  download_url "$tau_base_url/$file/content" "$out/tau-urban-acoustic-scenes-2019/$file"
}

download_macs_file LICENSE.txt
download_macs_file MACS.yaml
download_macs_file MACS_competence.csv

download_tau_file TAU-urban-acoustic-scenes-2019-development.doc.zip
download_tau_file TAU-urban-acoustic-scenes-2019-development.meta.zip

if [[ "${MACS_DOWNLOAD_TAU_AUDIO:-0}" == "1" ]]; then
  for part in {1..21}; do
    download_tau_file "TAU-urban-acoustic-scenes-2019-development.audio.$part.zip"
  done
else
  echo "Skipping TAU Urban Acoustic Scenes 2019 audio shards (~36 GiB). Set MACS_DOWNLOAD_TAU_AUDIO=1 to download them."
fi

echo "MACS annotations and TAU 2019 metadata download complete: $out"
