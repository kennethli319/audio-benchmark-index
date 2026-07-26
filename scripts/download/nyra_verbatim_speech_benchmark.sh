#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir nyra_verbatim_speech_benchmark)"
repo_url="https://github.com/nyrahealth/nyra_verbatim_speech_benchmark.git"
repo_raw="https://raw.githubusercontent.com/nyrahealth/nyra_verbatim_speech_benchmark/main"

download_url "$repo_raw/README.md" "$out/evaluator-README.md"
download_url \
  "https://huggingface.co/datasets/nyralabs/disfluency_speech_english/raw/main/README.md" \
  "$out/english-dataset-card.md"
download_url \
  "https://huggingface.co/api/datasets/nyralabs/disfluency_speech_english" \
  "$out/english-dataset-api.json"
download_url \
  "https://huggingface.co/datasets/nyralabs/disfluency_speech_german/raw/main/README.md" \
  "$out/german-dataset-card.md"
download_url \
  "https://huggingface.co/api/datasets/nyralabs/disfluency_speech_german" \
  "$out/german-dataset-api.json"

if [[ "${NYRA_VERBATIM_DOWNLOAD_DATASETS:-0}" == "1" ]]; then
  hf_download_dataset \
    "nyralabs/disfluency_speech_english" \
    "$out/disfluency_speech_english"
  hf_download_dataset \
    "nyralabs/disfluency_speech_german" \
    "$out/disfluency_speech_german"
else
  echo "Skipping approximately 1.17 GB of dataset files."
  echo "Set NYRA_VERBATIM_DOWNLOAD_DATASETS=1 to download both public snapshots."
fi

if [[ "${NYRA_VERBATIM_CLONE_EVALUATOR:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/evaluator"
else
  echo "Skipping evaluator clone and cached predictions."
  echo "Set NYRA_VERBATIM_CLONE_EVALUATOR=1 to clone the official repository."
fi

cat <<MSG
Nyra Verbatim Speech Benchmark metadata download complete: $out

The English dataset card declares Apache-2.0. The German dataset card declares
its license as unknown. The evaluator README says MIT, but the repository
currently has no LICENSE file; verify terms with the owner before reuse that
depends on a formal license grant.
MSG
