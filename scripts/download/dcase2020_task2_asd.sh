#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir dcase2020_task2_asd)"
task_url="https://dcase.community/challenge2020/task-unsupervised-detection-of-anomalous-sounds"
dev_base="https://zenodo.org/api/records/3678171"
train_base="https://zenodo.org/api/records/3727685"
eval_base="https://zenodo.org/api/records/3841772"
baseline="https://raw.githubusercontent.com/y-kawagu/dcase2020_task2_baseline/master"

download_url "$task_url" "$out/task.html"
download_url "$dev_base" "$out/development-record.json"
download_url "$train_base" "$out/additional-training-record.json"
download_url "$eval_base" "$out/evaluation-record.json"
download_url "https://export.arxiv.org/api/query?id_list=2607.22086" \
  "$out/recent-paper-metadata.xml"
download_url "https://api.github.com/repos/y-kawagu/dcase2020_task2_baseline" \
  "$out/baseline-repository.json"
download_url "$baseline/README.md" "$out/baseline-README.md"
download_url "$baseline/LICENSE" "$out/baseline-LICENSE"

if [[ "${DCASE2020_TASK2_DOWNLOAD_ARCHIVES:-0}" != "1" ]]; then
  cat <<EOF
Skipping approximately 13.23 GiB of audio archives. Set
DCASE2020_TASK2_DOWNLOAD_ARCHIVES=1 and DCASE2020_TASK2_PARTS to a
space-separated selection of dev, train, and eval.
EOF
  echo "DCASE 2020 Task 2 ASD metadata download complete: $out"
  exit 0
fi

parts=" ${DCASE2020_TASK2_PARTS:-} "
if [[ "$parts" == "  " ]]; then
  echo "Set DCASE2020_TASK2_PARTS to a space-separated selection of dev, train, and eval." >&2
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

echo "DCASE 2020 Task 2 ASD download complete: $out"
