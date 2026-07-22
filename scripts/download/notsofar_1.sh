#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir notsofar_1)"
repo_url="${NOTSOFAR1_REPO_URL:-https://github.com/microsoft/NOTSOFAR1-Challenge}"

download_url \
  "https://raw.githubusercontent.com/microsoft/NOTSOFAR1-Challenge/main/README.md" \
  "$out/README.md"
download_url \
  "https://raw.githubusercontent.com/microsoft/NOTSOFAR1-Challenge/main/DATA_LICENSE" \
  "$out/DATA_LICENSE"
download_url \
  "https://raw.githubusercontent.com/microsoft/NOTSOFAR1-Challenge/main/LICENSE" \
  "$out/LICENSE"
download_url \
  "https://huggingface.co/api/datasets/microsoft/NOTSOFAR" \
  "$out/huggingface-dataset.json"
download_url \
  "https://www.isca-archive.org/interspeech_2024/vinnikov24_interspeech.html" \
  "$out/interspeech-paper.html"

if [[ "${NOTSOFAR1_CLONE_REPO:-0}" == "1" ]]; then
  git_clone_or_update "$repo_url" "$out/repo"
else
  cat <<'MSG'
Skipping the official baseline repository. Set NOTSOFAR1_CLONE_REPO=1 to
clone it, then follow its versioned download_meeting_subset instructions for
selected public subsets. Do not snapshot the full Hugging Face repository:
its historical storage is extremely large.
MSG
fi

echo "NOTSOFAR-1 documentation download complete: $out"
