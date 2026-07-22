#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir dcase2026_task1_hac)"
task_url="${DCASE2026_TASK1_URL:-https://dcase.community/challenge2026/task-heterogeneous-audio-classification}"
# The concept record 17233904 resolves to the current v1.2 record, 19868804;
# Zenodo file endpoints require the version record ID.
bsd10k_api="${DCASE2026_TASK1_BSD10K_API:-https://zenodo.org/api/records/19868804}"
bsd35k_api="${DCASE2026_TASK1_BSD35K_API:-https://zenodo.org/api/records/19187100}"
eval_api="${DCASE2026_TASK1_EVAL_API:-https://zenodo.org/api/records/20442928}"

download_url "$task_url" "$out/task.html"
download_url "$bsd10k_api" "$out/bsd10k-record.json"
download_url "$bsd35k_api" "$out/bsd35k-cs-record.json"
download_url "$eval_api" "$out/evaluation-record.json"
download_url "$bsd10k_api/files/README.md/content" "$out/BSD10k-README.md"
download_url "$bsd35k_api/files/README.md/content" "$out/BSD35k-CS-README.md"
download_url "$bsd10k_api/files/metadata.zip/content" "$out/BSD10k-metadata.zip"
download_url "$bsd35k_api/files/metadata.zip/content" "$out/BSD35k-CS-metadata.zip"

if [[ "${DCASE2026_TASK1_DOWNLOAD_FEATURES:-0}" == "1" ]]; then
  download_url "$bsd10k_api/files/features.zip/content" "$out/BSD10k-features.zip"
  download_url "$bsd35k_api/files/features.zip/content" "$out/BSD35k-CS-features.zip"
else
  echo "Skipping approximately 200 MB of CLAP features. Set DCASE2026_TASK1_DOWNLOAD_FEATURES=1 to download them."
fi

if [[ "${DCASE2026_TASK1_DOWNLOAD_AUDIO:-0}" == "1" ]]; then
  download_url "$bsd10k_api/files/audio.zip/content" "$out/BSD10k-audio.zip"
  download_url "$bsd35k_api/files/audio.zip/content" "$out/BSD35k-CS-audio.zip"
  download_url "$eval_api/files/dcase26_hac_eval_submission.tar.gz/content" \
    "$out/dcase26_hac_eval_submission.tar.gz"
else
  echo "Skipping roughly 47 GB of audio and evaluation archives. Set DCASE2026_TASK1_DOWNLOAD_AUDIO=1 to download them."
fi

echo "DCASE 2026 Task 1 HAC download complete: $out"
