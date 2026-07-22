#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir dcase2024_task5)"
dev_base="${DCASE2024_TASK5_DEV_BASE_URL:-https://zenodo.org/api/records/10829604}"
eval_base="${DCASE2024_TASK5_EVAL_BASE_URL:-https://zenodo.org/api/records/7879692}"

download_url "$dev_base" "$out/development-record.json"
download_url "$eval_base" "$out/evaluation-record.json"
download_url "$dev_base/files/DCASE2024_task5_training_set_classes.csv/content" \
  "$out/DCASE2024_task5_training_set_classes.csv"
download_url "$dev_base/files/DCASE2024_task5_validation_set_classes.csv/content" \
  "$out/DCASE2024_task5_validation_set_classes.csv"
download_url "$dev_base/files/Development_set_annotations.zip/content" \
  "$out/Development_set_annotations.zip"
download_url "$eval_base/files/Annotations_only.zip/content" \
  "$out/Evaluation_set_annotations.zip"

if [[ "${DCASE2024_TASK5_DOWNLOAD_AUDIO:-0}" == "1" ]]; then
  download_url "$dev_base/files/Development_set.zip/content" "$out/Development_set.zip"
  download_url "$eval_base/files/eval_1.zip/content" "$out/eval_1.zip"
  download_url "$eval_base/files/eval_2.zip/content" "$out/eval_2.zip"
  download_url "$eval_base/files/eval_3.zip/content" "$out/eval_3.zip"
else
  cat <<EOF
Skipping approximately 23.4 GiB of development and evaluation waveform
archives. Set DCASE2024_TASK5_DOWNLOAD_AUDIO=1 to download them from the
official Zenodo records.
EOF
fi

echo "DCASE 2024 Task 5 download complete: $out"
