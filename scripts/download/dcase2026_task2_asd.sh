#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir dcase2026_task2_asd)"
task_url="${DCASE2026_TASK2_TASK_URL:-https://dcase.community/challenge2026/task-first-shot-unsupervised-anomalous-sound-detection-for-machine-condition-monitoring}"
paper_url="${DCASE2026_TASK2_PAPER_URL:-https://export.arxiv.org/api/query?id_list=2606.01578}"
repo_api="${DCASE2026_TASK2_REPO_API_URL:-https://api.github.com/repos/nttcslab/dcase2023_task2_baseline_ae}"
dev_api="${DCASE2026_TASK2_DEV_API_URL:-https://zenodo.org/api/records/19336329}"
train_api="${DCASE2026_TASK2_TRAIN_API_URL:-https://zenodo.org/api/records/20151556}"
eval_api="${DCASE2026_TASK2_EVAL_API_URL:-https://zenodo.org/api/records/20437238}"

download_url "$task_url" "$out/task.html"
download_url "$paper_url" "$out/paper.xml"
download_url "$repo_api" "$out/baseline-repository.json"
download_url "$dev_api" "$out/development-record.json"
download_url "$train_api" "$out/additional-training-record.json"
download_url "$eval_api" "$out/evaluation-record.json"

if [[ "${DCASE2026_TASK2_DOWNLOAD_ARCHIVES:-0}" != "1" ]]; then
  cat <<EOF
Skipping approximately 8.16 GB of audio archives. Set
DCASE2026_TASK2_DOWNLOAD_ARCHIVES=1 and DCASE2026_TASK2_PARTS to a
space-separated selection of dev, train, and eval.
EOF
  echo "DCASE 2026 Task 2 ASD metadata download complete: $out"
  exit 0
fi

parts=" ${DCASE2026_TASK2_PARTS:-} "
if [[ "$parts" == "  " ]]; then
  echo "Set DCASE2026_TASK2_PARTS to a space-separated selection of dev, train, and eval." >&2
  exit 2
fi

download_record_files() {
  local part="$1"
  local api="$2"
  local record="$3"
  local key

  [[ "$parts" == *" $part "* ]] || return 0
  while IFS= read -r key; do
    download_url "$api/files/$key/content" "$out/$key"
  done < <(python3 -c 'import json,sys; print("\n".join(f["key"] for f in json.load(open(sys.argv[1]))["files"]))' "$record")
}

download_record_files dev "$dev_api" "$out/development-record.json"
download_record_files train "$train_api" "$out/additional-training-record.json"
download_record_files eval "$eval_api" "$out/evaluation-record.json"

echo "DCASE 2026 Task 2 ASD download complete: $out"
