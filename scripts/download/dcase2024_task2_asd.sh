#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir dcase2024_task2_asd)"
task_url="${DCASE2024_TASK2_TASK_URL:-https://dcase.community/challenge2024/task-first-shot-unsupervised-anomalous-sound-detection-for-machine-condition-monitoring}"
dev_base="${DCASE2024_TASK2_DEV_BASE_URL:-https://zenodo.org/api/records/10902294}"
train_base="${DCASE2024_TASK2_TRAIN_BASE_URL:-https://zenodo.org/api/records/11259435}"
eval_base="${DCASE2024_TASK2_EVAL_BASE_URL:-https://zenodo.org/api/records/11363076}"
evaluator_api="${DCASE2024_TASK2_EVALUATOR_API_URL:-https://api.github.com/repos/nttcslab/dcase2024_task2_evaluator}"

download_url "$task_url" "$out/task.html"
download_url "$dev_base" "$out/development-record.json"
download_url "$train_base" "$out/additional-training-record.json"
download_url "$eval_base" "$out/evaluation-record.json"
download_url "$evaluator_api" "$out/evaluator-repository.json"
download_url "https://raw.githubusercontent.com/nttcslab/dcase2024_task2_evaluator/main/README.md" \
  "$out/evaluator-README.md"

if [[ "${DCASE2024_TASK2_DOWNLOAD_ARCHIVES:-0}" != "1" ]]; then
  cat <<EOF
Skipping approximately 4.63 GB of audio archives. Set
DCASE2024_TASK2_DOWNLOAD_ARCHIVES=1 and DCASE2024_TASK2_PARTS to a
space-separated selection of dev, train, and eval.
EOF
  echo "DCASE 2024 Task 2 ASD metadata download complete: $out"
  exit 0
fi

parts=" ${DCASE2024_TASK2_PARTS:-} "
if [[ "$parts" == "  " ]]; then
  echo "Set DCASE2024_TASK2_PARTS to a space-separated selection of dev, train, and eval." >&2
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

echo "DCASE 2024 Task 2 ASD download complete: $out"
