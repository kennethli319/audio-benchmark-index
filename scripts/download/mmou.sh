#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir mmou)"
dataset_repo="${MMOU_DATASET_REPO:-nvidia/MMOU}"
video_repo="${MMOU_VIDEO_REPO:-sonalkum/MMOU-Videos}"

download_url "https://huggingface.co/datasets/$dataset_repo/raw/main/README.md" "$out/README.md"
download_url "https://huggingface.co/api/datasets/$dataset_repo" "$out/dataset-api.json"
download_url "https://huggingface.co/datasets/$video_repo/raw/main/README.md" "$out/videos-README.md"
download_url "https://huggingface.co/api/datasets/$video_repo" "$out/videos-api.json"

if [[ "${MMOU_DOWNLOAD_ANNOTATIONS:-0}" == "1" ]]; then
  download_url \
    "https://huggingface.co/datasets/$dataset_repo/resolve/main/MMOU.json" \
    "$out/MMOU.json"
  download_url \
    "https://huggingface.co/datasets/$dataset_repo/resolve/main/MMOU_TEST_MINI.json" \
    "$out/MMOU_TEST_MINI.json"
else
  echo "Skipping the approximately 48 MB annotation files. Set MMOU_DOWNLOAD_ANNOTATIONS=1 to download them."
fi

if [[ "${MMOU_DOWNLOAD_VIDEOS:-0}" == "1" ]]; then
  echo "Requesting the approximately 322.8 GB MMOU video snapshot."
  echo "Review the benchmark's non-commercial restriction and source-video rights first."
  hf_download_dataset "$video_repo" "$out/videos"
else
  echo "Skipping the approximately 322.8 GB video snapshot. Set MMOU_DOWNLOAD_VIDEOS=1 to download it."
fi

echo "MMOU metadata download complete: $out"
