#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir desed)"
repo_dir="$out/DESED"
real_base_url="${DESED_REAL_ZENODO_BASE_URL:-https://zenodo.org/api/records/3588179/files}"
real_api_url="${DESED_REAL_ZENODO_API_URL:-https://zenodo.org/api/records/3588179}"
synthetic_base_url="${DESED_SYNTHETIC_ZENODO_BASE_URL:-https://zenodo.org/api/records/6026841/files}"
synthetic_api_url="${DESED_SYNTHETIC_ZENODO_API_URL:-https://zenodo.org/api/records/6026841}"

download_real_file() {
  local file="$1"
  download_url "$real_base_url/$file/content" "$out/real/$file"
}

download_synthetic_file() {
  local file="$1"
  download_url "$synthetic_base_url/$file/content" "$out/synthetic/$file"
}

clone_or_update https://github.com/turpaultn/DESED "$repo_dir"
download_url "$real_api_url" "$out/real/zenodo-record-3588179.json"
download_url "$synthetic_api_url" "$out/synthetic/zenodo-record-6026841.json"

download_real_file DESED_real_metadata.tar.gz
download_real_file DESED_real_source.tar.gz

synthetic_metadata_parts="${DESED_SYNTHETIC_METADATA_PARTS:-DESED_synth_dcase2019jams.tar.gz DESED_synth_dcase20_eval_jams.tar.gz DESED_synth_dcase20_train_val_jams.tar.gz meta_infos_2021.tar.gz soundbank_validation.tsv}"
for part in $synthetic_metadata_parts; do
  download_synthetic_file "$part"
done

if [[ "${DESED_DOWNLOAD_REAL_AUDIO:-0}" == "1" ]]; then
  real_audio_parts="${DESED_REAL_AUDIO_PARTS:-eval.tar.gz training.tar.gz}"
  for part in $real_audio_parts; do
    download_url "$real_base_url/$part/content" "$out/real/$part"
  done
else
  echo "Skipping DESED real audio archives. Set DESED_DOWNLOAD_REAL_AUDIO=1 to download them."
fi

if [[ "${DESED_DOWNLOAD_SYNTHETIC_AUDIO:-0}" == "1" ]]; then
  synthetic_audio_parts="${DESED_SYNTHETIC_PARTS:-DESED_synth_soundbank.tar.gz DESED_synth_eval_dcase2019.tar.gz dcase_synth.zip}"
  for part in $synthetic_audio_parts; do
    download_synthetic_file "$part"
  done
else
  echo "Skipping DESED synthetic audio archives. Set DESED_DOWNLOAD_SYNTHETIC_AUDIO=1 to download them."
fi

echo "DESED metadata download complete: $out"
