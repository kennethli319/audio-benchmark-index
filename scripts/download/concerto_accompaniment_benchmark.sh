#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir concerto_accompaniment_benchmark)"
raw_base="${CONCERTO_ACCOMPANIMENT_RAW_BASE_URL:-https://raw.githubusercontent.com/HMC-MIR/PianoConcertoAccompaniment/main}"
repo_url="${CONCERTO_ACCOMPANIMENT_REPO_URL:-https://github.com/HMC-MIR/PianoConcertoAccompaniment.git}"

download_url "$raw_base/README.md" "$out/README.md"
download_url "$raw_base/LICENSE" "$out/LICENSE"
download_url "$raw_base/cfg_files/AudioDataSummary.csv" "$out/AudioDataSummary.csv"
download_url "$raw_base/cfg_files/train.list" "$out/train.list"

annotations=(
  bach5_mov1_O1.beats
  bach5_mov1_PO2.beats
  beeth1_mov1_O1.beats
  beeth1_mov1_PO1.beats
  beeth3_mov2_O1.beats
  chopin1_mov2_O1.beats
  mozart21_mov1_O1.beats
  mozart21_mov1_PO2.beats
  rach2_mov1_O1.beats
  rach2_mov1_PO2.beats
  rach2_mov2_O1.beats
  rach2_mov3_O1.beats
)
for annotation in "${annotations[@]}"; do
  download_url "$raw_base/annot/$annotation" "$out/annot/$annotation"
done

if [[ "${CONCERTO_ACCOMPANIMENT_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/PianoConcertoAccompaniment"
else
  echo "Downloaded Concerto Accompaniment Benchmark metadata and annotations to: $out"
  echo "Set CONCERTO_ACCOMPANIMENT_CLONE_REPO=1 to clone the official code repository."
fi

echo "Commercial Music Minus One recordings are not public; obtain them separately."
echo "The repository currently exposes no solo-piano audio download."
