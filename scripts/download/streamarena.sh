#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir streamarena)"
project_url="${STREAMARENA_PROJECT_URL:-https://hkuzxc.github.io/StreamArena_web/}"
hf_repo="${STREAMARENA_HF_REPO:-hkuzxc/StreamArena}"
raw_base="${STREAMARENA_RAW_BASE_URL:-https://huggingface.co/datasets/$hf_repo/raw/main}"

download_url "$project_url" "$out/project.html"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/huggingface-dataset.json"
download_url "$raw_base/README.md" "$out/README.md"
download_url "$raw_base/question.jsonl" "$out/question.jsonl"
download_url "$raw_base/question.en.jsonl" "$out/question.en.jsonl"
download_url "$raw_base/video_meta.jsonl" "$out/video_meta.jsonl"
download_url "$raw_base/video_meta.en.jsonl" "$out/video_meta.en.jsonl"

if [[ "${STREAMARENA_DOWNLOAD_VIDEOS:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded StreamArena documentation, live metadata, and lightweight JSONL files.
The dataset card reports about 300 GB of third-party YouTube-derived video tars.
Review the conflicting license statements and source-media rights before use.

Set STREAMARENA_DOWNLOAD_VIDEOS=1 to request the videos/ directory explicitly.
EOF
  echo "StreamArena metadata download complete: $out"
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/huggingface" --include "videos/*"
echo "StreamArena requested video download complete: $out/huggingface"
