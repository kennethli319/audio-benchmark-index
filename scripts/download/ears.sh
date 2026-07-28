#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir ears)"
dataset_repo="https://github.com/facebookresearch/ears_dataset"
dataset_raw="https://raw.githubusercontent.com/facebookresearch/ears_dataset/main"
benchmark_repo="https://github.com/sp-uhh/ears_benchmark"
benchmark_raw="https://raw.githubusercontent.com/sp-uhh/ears_benchmark/main"

download_url "https://sp-uhh.github.io/ears_dataset/" "$out/project.html"
download_url "https://arxiv.org/abs/2406.06185" "$out/paper.html"
download_url "$dataset_repo" "$out/dataset-project.html"
download_url "https://api.github.com/repos/facebookresearch/ears_dataset" \
  "$out/dataset-repository.json"
download_url "$dataset_raw/README.md" "$out/README.md"
download_url "$dataset_raw/LICENSE" "$out/LICENSE"
download_url "$dataset_raw/speaker_statistics.json" "$out/speaker_statistics.json"
download_url "$dataset_raw/transcripts.json" "$out/transcripts.json"
download_url "$benchmark_repo" "$out/benchmark-project.html"
download_url "https://api.github.com/repos/sp-uhh/ears_benchmark" \
  "$out/benchmark-repository.json"
download_url "$benchmark_raw/README.md" "$out/benchmark-README.md"

if [[ "${EARS_CLONE_BENCHMARK:-0}" == "1" ]]; then
  clone_or_update "$benchmark_repo.git" "$out/benchmark"
fi

if [[ "${EARS_DOWNLOAD_AUDIO:-0}" == "1" ]]; then
  speakers="${EARS_SPEAKERS:-}"
  if [[ -z "$speakers" ]]; then
    manual_required "EARS speaker archives" \
      "Set EARS_SPEAKERS to space-separated numeric IDs, for example:" \
      'EARS_DOWNLOAD_AUDIO=1 EARS_SPEAKERS="001 107" scripts/download/ears.sh'
  fi
  for speaker in $speakers; do
    if [[ ! "$speaker" =~ ^[0-9]{3}$ ]] ||
      ((10#$speaker < 1 || 10#$speaker > 107)); then
      echo "Invalid EARS speaker ID: $speaker (expected 001 through 107)" >&2
      exit 2
    fi
    download_url \
      "$dataset_repo/releases/download/dataset/p${speaker}.zip" \
      "$out/audio/p${speaker}.zip"
  done
fi

if [[ "${EARS_DOWNLOAD_BLIND_TEST:-0}" == "1" ]]; then
  download_url \
    "$dataset_repo/releases/download/blind_testset/blind_testset.zip" \
    "$out/blind_testset.zip"
fi

cat <<EOF
EARS metadata download complete: $out

The 107 clean speaker archives are opt-in with EARS_DOWNLOAD_AUDIO=1 and an
explicit EARS_SPEAKERS list. The noisy blind test is opt-in with
EARS_DOWNLOAD_BLIND_TEST=1; its clean references are intentionally withheld.
EARS and its benchmark derivatives are noncommercial and may retain additional
WHAM! and room-impulse-response source terms.
EOF
