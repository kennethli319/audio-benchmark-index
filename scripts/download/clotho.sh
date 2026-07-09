#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir clotho)"
base_url="${CLOTHO_ZENODO_BASE_URL:-https://zenodo.org/records/4783391/files}"

download_zenodo_file() {
  local file="$1"
  download_url "$base_url/$file?download=1" "$out/$file"
}

download_zenodo_file clotho_captions_development.csv
download_zenodo_file clotho_captions_validation.csv
download_zenodo_file clotho_captions_evaluation.csv
download_zenodo_file clotho_metadata_development.csv
download_zenodo_file clotho_metadata_validation.csv
download_zenodo_file clotho_metadata_evaluation.csv
download_zenodo_file LICENSE

if [[ "${CLOTHO_DOWNLOAD_AUDIO:-0}" == "1" ]]; then
  download_zenodo_file clotho_audio_development.7z
  download_zenodo_file clotho_audio_validation.7z
  download_zenodo_file clotho_audio_evaluation.7z
else
  echo "Skipping Clotho audio archives (~7.1 GiB). Set CLOTHO_DOWNLOAD_AUDIO=1 to download them."
fi

echo "Clotho metadata/captions download complete: $out"
