#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir emphassess)"
repo_url="${EMPHASSESS_REPO_URL:-https://github.com/facebookresearch/emphassess}"
raw_url="${EMPHASSESS_RAW_URL:-https://raw.githubusercontent.com/facebookresearch/emphassess/main}"
dataset_url="${EMPHASSESS_DATASET_URL:-https://dl.fbaipublicfiles.com/speech_expressivity_evaluation/EmphAssess/EmphAssess_Dataset.tar.gz}"
classifier_url="${EMPHASSESS_CLASSIFIER_URL:-https://dl.fbaipublicfiles.com/speech_expressivity_evaluation/EmphAssess/EmphaClass/EmphaClass-en.tar.gz}"

download_url "https://arxiv.org/abs/2312.14069" "$out/paper.html"
download_url "$raw_url/README.md" "$out/README.md"
download_url "$raw_url/LICENSE.md" "$out/LICENSE.md"
download_url "https://api.github.com/repos/facebookresearch/emphassess" "$out/github-api.json"

if [[ "${EMPHASSESS_DOWNLOAD_DATASET:-0}" == "1" ]]; then
  download_url "$dataset_url" "$out/EmphAssess_Dataset.tar.gz"
fi

if [[ "${EMPHASSESS_DOWNLOAD_CLASSIFIER:-0}" == "1" ]]; then
  download_url "$classifier_url" "$out/EmphaClass-en.tar.gz"
fi

if [[ "${EMPHASSESS_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/repository"
fi

echo "Downloaded EmphAssess public documentation and metadata to: $out"
echo "The 226,646,154-byte dataset and 3,571,288,236-byte classifier are separate opt-ins."
echo "The owner publishes no cryptographic archive checksums; review CC BY-NC 4.0 and upstream terms."
