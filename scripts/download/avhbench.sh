#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir avhbench)"
qa_url="${AVHBENCH_QA_URL:-https://drive.usercontent.google.com/download?id=1KcYDAv9lLy3hsx5rWdfRqMFV2NYcZ94W&export=download&confirm=t}"
video_url="${AVHBENCH_VIDEO_URL:-https://drive.usercontent.google.com/download?id=10-Qp8zxA3ITT-ileEnCgJkf5Nzx1wry7&export=download&confirm=t}"

download_url "https://arxiv.org/abs/2410.18325" "$out/arxiv-2410.18325.html"
download_url "https://avhbench.github.io/" "$out/project.html"
download_url "https://api.github.com/repos/kaist-ami/AVHBench" "$out/github-api.json"
download_url "https://raw.githubusercontent.com/kaist-ami/AVHBench/main/README.md" "$out/github-README.md"
download_url "$qa_url" "$out/QA.json"

if [[ "${AVHBENCH_DOWNLOAD_VIDEOS:-0}" == "1" ]]; then
  download_url "$video_url" "$out/videos.zip"
else
  echo "Skipping the large video archive. Set AVHBENCH_DOWNLOAD_VIDEOS=1 to download it."
fi

echo "Downloaded AVHBench documentation, metadata, and the 1.1 MB annotation file to: $out"
echo "No data or code license is stated; AudioCaps, VALOR, and source-media terms also apply."
