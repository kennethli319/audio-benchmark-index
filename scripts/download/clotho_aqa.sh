#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir clotho_aqa)"
base_url="${CLOTHO_AQA_ZENODO_BASE_URL:-https://zenodo.org/records/6473207/files}"

download_zenodo_file() {
  local file="$1"
  download_url "$base_url/$file?download=1" "$out/$file"
}

download_zenodo_file LICENSE.txt
download_zenodo_file clotho_aqa_metadata.csv
download_zenodo_file clotho_aqa_train.csv
download_zenodo_file clotho_aqa_val.csv
download_zenodo_file clotho_aqa_test.csv

if [[ "${CLOTHO_AQA_DOWNLOAD_AUDIO:-0}" == "1" ]]; then
  download_zenodo_file audio_files.zip
else
  echo "Skipping ClothoAQA audio_files.zip (~3.1 GiB). Set CLOTHO_AQA_DOWNLOAD_AUDIO=1 to download it."
fi

echo "ClothoAQA CSV metadata download complete: $out"
