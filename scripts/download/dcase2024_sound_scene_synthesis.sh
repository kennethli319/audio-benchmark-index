#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir dcase2024_sound_scene_synthesis)"
task_url="${DCASE2024_TASK7_URL:-https://dcase.community/challenge2024/task-sound-scene-synthesis}"
record_url="${DCASE2024_TASK7_RECORD_URL:-https://zenodo.org/api/records/15630417}"
archive_url="${DCASE2024_TASK7_ARCHIVE_URL:-https://zenodo.org/api/records/15630417/files/DCASE-TASK7-2024-Open-Source.zip/content}"

download_url "$task_url" "$out/dcase-2024-task-7.html"
download_url "$record_url" "$out/zenodo-15630417.json"

if [[ "${DCASE2024_TASK7_DOWNLOAD_AUDIO:-0}" == "1" ]]; then
  download_url "$archive_url" "$out/DCASE-TASK7-2024-Open-Source.zip"
else
  cat <<MSG
Skipping the approximately 140 MiB public audio/prompt archive. Set
DCASE2024_TASK7_DOWNLOAD_AUDIO=1 to download it from the official Zenodo record.

The original challenge evaluation prompts and reference audio remain secret;
this helper accesses only the later open-source release.
MSG
fi

echo "DCASE 2024 Task 7 metadata download complete: $out"
