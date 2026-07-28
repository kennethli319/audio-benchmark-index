#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir drone_audio_dataset)"
dataset_raw="https://raw.githubusercontent.com/saraalemadi/DroneAudioDataset/master"
echohawk_raw="https://raw.githubusercontent.com/shulm/echohawk/main"

download_url "$dataset_raw/README.md" "$out/dataset-README.md"
download_url \
  "https://api.github.com/repos/saraalemadi/DroneAudioDataset" \
  "$out/dataset-repository.json"
download_url \
  "https://api.github.com/repos/saraalemadi/DroneAudioDataset/git/trees/master?recursive=1" \
  "$out/dataset-tree.json"
download_url \
  "https://api.crossref.org/works/10.1109/IWCMC.2019.8766732" \
  "$out/primary-paper-metadata.json"
download_url \
  "https://export.arxiv.org/api/query?id_list=2606.29589" \
  "$out/echohawk-paper-metadata.xml"
download_url "$echohawk_raw/README.md" "$out/echohawk-README.md"
download_url "$echohawk_raw/LICENSE" "$out/echohawk-LICENSE"
download_url "$echohawk_raw/data/README.md" "$out/echohawk-data-README.md"
download_url \
  "https://api.github.com/repos/shulm/echohawk" \
  "$out/echohawk-repository.json"

if [[ "${DRONE_AUDIO_DATASET_CLONE_DATA:-0}" == "1" ]]; then
  clone_or_update \
    "https://github.com/saraalemadi/DroneAudioDataset.git" \
    "$out/DroneAudioDataset"
else
  echo "Skipping the audio repository. Set DRONE_AUDIO_DATASET_CLONE_DATA=1 to clone it."
fi

if [[ "${DRONE_AUDIO_DATASET_CLONE_ECHOHAWK:-0}" == "1" ]]; then
  clone_or_update "https://github.com/shulm/echohawk.git" "$out/echohawk"
else
  echo "Skipping the evaluation toolkit. Set DRONE_AUDIO_DATASET_CLONE_ECHOHAWK=1 to clone it."
fi

echo "DroneAudioDataset metadata download complete: $out"
