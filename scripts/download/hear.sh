#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir hear)"
record_url="${HEAR_RECORD_URL:-https://zenodo.org/api/records/5885750}"
files_url="${HEAR_FILES_URL:-https://zenodo.org/api/records/5885750/files}"
repo_raw="${HEAR_EVAL_KIT_RAW:-https://raw.githubusercontent.com/hearbenchmark/hear-eval-kit/main}"
repo_url="${HEAR_EVAL_KIT_REPO_URL:-https://github.com/hearbenchmark/hear-eval-kit.git}"
zenodo_file_base="${HEAR_ZENODO_FILE_BASE:-https://zenodo.org/api/records/5885750/files}"

download_url "$record_url" "$out/zenodo-record.json"
download_url "$files_url" "$out/zenodo-files.json"
download_url "$zenodo_file_base/LICENSE.txt/content" "$out/LICENSE.txt"
download_url "$repo_raw/README.md" "$out/hear-eval-kit-README.md"
download_url "$repo_raw/LICENSE" "$out/hear-eval-kit-LICENSE"

if [[ "${HEAR_CLONE_EVAL_KIT:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/hear-eval-kit"
else
  echo "Skipping HEAR eval kit clone. Set HEAR_CLONE_EVAL_KIT=1 to clone/update it."
fi

if [[ "${HEAR_DOWNLOAD_TASKS:-0}" != "1" ]]; then
  cat <<'EOF'
Skipping HEAR task archives. Set HEAR_DOWNLOAD_TASKS=1 and HEAR_TASKS to one
or more Zenodo archive filenames to download selected tasks, for example:
  HEAR_DOWNLOAD_TASKS=1 HEAR_TASKS=hear2021-mridangam_tonic-v1.5-full-48000.tar.gz scripts/download/hear.sh

Use HEAR_TASKS=all only if you intentionally want the full multi-archive task release.
EOF
  exit 0
fi

tasks="${HEAR_TASKS:-}"
if [[ -z "$tasks" ]]; then
  echo "HEAR_DOWNLOAD_TASKS=1 requires HEAR_TASKS to list archive filenames or 'all'." >&2
  exit 2
fi

if [[ "$tasks" == "all" ]]; then
  require_cmd python3
  mapfile -t task_files < <(
    python3 - "$out/zenodo-files.json" <<'PY'
import json
import sys

with open(sys.argv[1], "r", encoding="utf-8") as f:
    data = json.load(f)

entries = data.get("entries") or data.get("files") or []
for entry in entries:
    key = entry.get("key", "")
    if key.endswith(".tar.gz"):
        print(key)
PY
  )
else
  read -r -a task_files <<<"$tasks"
fi

for task_file in "${task_files[@]}"; do
  download_url "$zenodo_file_base/$task_file/content" "$out/$task_file"
done

echo "HEAR download complete: $out"
