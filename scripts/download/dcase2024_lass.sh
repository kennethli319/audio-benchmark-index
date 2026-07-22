#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir dcase2024_lass)"
task_url="${DCASE2024_LASS_TASK_URL:-https://dcase.community/challenge2024/task-language-queried-audio-source-separation}"
baseline_url="${DCASE2024_LASS_BASELINE_URL:-https://raw.githubusercontent.com/Audio-AGI/dcase2024_task9_baseline/main/README.md}"
dev_base="${DCASE2024_LASS_DEV_BASE_URL:-https://zenodo.org/api/records/10887496}"
validation_base="${DCASE2024_LASS_VALIDATION_BASE_URL:-https://zenodo.org/api/records/10886481}"
evaluation_base="${DCASE2024_LASS_EVALUATION_BASE_URL:-https://zenodo.org/api/records/11425256}"

download_url "$task_url" "$out/dcase-2024-task-9.html"
download_url "$baseline_url" "$out/baseline-README.md"
download_url "$dev_base" "$out/development-record.json"
download_url "$validation_base" "$out/validation-record.json"
download_url "$evaluation_base" "$out/evaluation-record.json"
download_url "$dev_base/files/fsd50k_dev_auto_caption.json/content" "$out/fsd50k_dev_auto_caption.json"
download_url "$dev_base/files/fsd50k_eval_auto_caption.json/content" "$out/fsd50k_eval_auto_caption.json"
download_url "$validation_base/files/lass_validation.json/content" "$out/lass_validation.json"
download_url "$validation_base/files/lass_synthetic_validation.csv/content" "$out/lass_synthetic_validation.csv"
download_url "$evaluation_base/files/lass_real_evaluation.csv/content" "$out/lass_real_evaluation.csv"
download_url "$evaluation_base/files/lass_synthetic_evaluation.csv/content" "$out/lass_synthetic_evaluation.csv"

if [[ "${DCASE2024_LASS_DOWNLOAD_AUDIO:-0}" == "1" ]]; then
  download_url "$validation_base/files/lass_validation.zip/content" "$out/lass_validation.zip"
  download_url "$evaluation_base/files/lass_evaluation_real.zip/content" "$out/lass_evaluation_real.zip"
  download_url "$evaluation_base/files/lass_evaluation_synth.zip/content" "$out/lass_evaluation_synth.zip"
else
  cat <<MSG
Skipping approximately 1.14 GB of validation and evaluation audio. Set
DCASE2024_LASS_DOWNLOAD_AUDIO=1 to download it from the official Zenodo records.

Development audio is not included in its Zenodo record; obtain FSD50K and
Clotho v2 separately under their upstream terms.
MSG
fi

echo "DCASE 2024 Task 9 LASS metadata download complete: $out"
