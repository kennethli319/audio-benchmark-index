#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir dcase2025_task2_asd)"
task_url="${DCASE2025_TASK2_TASK_URL:-https://dcase.community/challenge2025/task-first-shot-unsupervised-anomalous-sound-detection-for-machine-condition-monitoring}"
dev_base="${DCASE2025_TASK2_DEV_BASE_URL:-https://zenodo.org/api/records/15097779}"
train_base="${DCASE2025_TASK2_TRAIN_BASE_URL:-https://zenodo.org/api/records/15392814}"
eval_base="${DCASE2025_TASK2_EVAL_BASE_URL:-https://zenodo.org/api/records/15519362}"
evaluator_api="${DCASE2025_TASK2_EVALUATOR_API_URL:-https://api.github.com/repos/nttcslab/dcase2025_task2_evaluator}"

download_url "$task_url" "$out/task.html"
download_url "$dev_base" "$out/development-record.json"
download_url "$train_base" "$out/additional-training-record.json"
download_url "$eval_base" "$out/evaluation-record.json"
download_url "$evaluator_api" "$out/evaluator-repository.json"
download_url "https://raw.githubusercontent.com/nttcslab/dcase2025_task2_evaluator/main/README.md" \
  "$out/evaluator-README.md"

if [[ "${DCASE2025_TASK2_DOWNLOAD_ARCHIVES:-0}" != "1" ]]; then
  cat <<EOF
Skipping roughly 4.7 GB of audio archives. Set
DCASE2025_TASK2_DOWNLOAD_ARCHIVES=1 and DCASE2025_TASK2_PARTS to a
space-separated selection of dev, train, and eval.
EOF
  echo "DCASE 2025 Task 2 ASD metadata download complete: $out"
  exit 0
fi

parts=" ${DCASE2025_TASK2_PARTS:-} "
if [[ "$parts" == "  " ]]; then
  echo "Set DCASE2025_TASK2_PARTS to a space-separated selection of dev, train, and eval." >&2
  exit 2
fi

download_record_files() {
  local part="$1"
  local base="$2"
  local record="$3"
  local key

  [[ "$parts" == *" $part "* ]] || return 0
  while IFS= read -r key; do
    download_url "$base/files/$key/content" "$out/$key"
  done < <(python3 -c 'import json,sys; print("\n".join(f["key"] for f in json.load(open(sys.argv[1]))["files"]))' "$record")
}

download_record_files dev "$dev_base" "$out/development-record.json"
download_record_files train "$train_base" "$out/additional-training-record.json"
download_record_files eval "$eval_base" "$out/evaluation-record.json"

echo "DCASE 2025 Task 2 ASD download complete: $out"
