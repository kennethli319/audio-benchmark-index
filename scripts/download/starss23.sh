#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir starss23)"
dcase_url="${STARSS23_DCASE_URL:-https://dcase.community/challenge2023/task-sound-event-localization-and-detection-evaluated-in-real-spatial-sound-scenes}"
datacite_url="${STARSS23_DATACITE_URL:-https://api.datacite.org/dois/10.5281/zenodo.7880637}"
paper_url="${STARSS23_PAPER_URL:-https://arxiv.org/abs/2306.09126}"
raw_base_url="${STARSS23_RAW_BASE_URL:-https://raw.githubusercontent.com/sharathadavanne/seld-dcase2023/master}"
repo_url="${STARSS23_REPO_URL:-https://github.com/sharathadavanne/seld-dcase2023.git}"

download_url "$dcase_url" "$out/dcase-2023-task-3.html"
download_url "$datacite_url" "$out/datacite-zenodo-7880637.json"
download_url "$paper_url" "$out/arxiv-2306.09126.html"
download_url "$raw_base_url/README.md" "$out/baseline-README.md"

if [[ "${STARSS23_CLONE_BASELINE:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/seld-dcase2023"
else
  echo "Skipping baseline clone. Set STARSS23_CLONE_BASELINE=1 to clone it."
fi

cat <<MSG
STARSS23 metadata download complete: $out

The complete public development/evaluation release is 16.3 GB. This helper does
not download that large archive. Review the MIT dataset license and retrieve the
files from the official record:
https://zenodo.org/records/7880637
MSG
