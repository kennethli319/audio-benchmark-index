#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir avsbench)"
raw_base="${AVSBENCH_RAW_BASE_URL:-https://raw.githubusercontent.com/OpenNLPLab/AVSBench/main}"
project_url="${AVSBENCH_PROJECT_URL:-https://opennlplab.github.io/AVSBench/}"
repo_api_url="${AVSBENCH_REPO_API_URL:-https://api.github.com/repos/OpenNLPLab/AVSBench}"
application_url="${AVSBENCH_APPLICATION_URL:-http://www.avlbench.opennlplab.cn/download}"
legacy_drive_url="${AVSBENCH_LEGACY_DRIVE_URL:-https://drive.google.com/drive/folders/1wKFKymVYn6rNkNE_7xV6Bm-9PfCAIKdT}"

download_url "$project_url" "$out/project.html"
download_url "$raw_base/README.md" "$out/README.md"
download_url "$raw_base/LICENSE" "$out/LICENSE"
download_url "$repo_api_url" "$out/github-repository.json"

manual_required \
  "AVSBench" \
  "Saved the official project page, repository README, Apache-2.0 project license, and GitHub metadata to $out." \
  "The project page links original AVSBench-object annotations on Google Drive: $legacy_drive_url" \
  "Processed video/audio requires emailing the authors; the updated object and semantic datasets use the official application page: $application_url" \
  "Review the project page's CC BY-NC 4.0 dataset terms, any conditions presented during application, and YouTube/uploader rights before use." \
  "This helper does not automate Drive, email, application, or source-video retrieval."
