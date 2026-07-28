#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir librisevoc)"
repo_url="${LIBRISEVOC_REPO_URL:-https://github.com/csun22/Synthetic-Voice-Detection-Vocoder-Artifacts}"
hf_repo="${LIBRISEVOC_HF_REPO:-csun22/LibriSeVoc}"
hf_base="${LIBRISEVOC_HF_BASE_URL:-https://huggingface.co/datasets/$hf_repo}"
hf_api="${LIBRISEVOC_HF_API_URL:-https://huggingface.co/api/datasets/$hf_repo}"
archive_url="${LIBRISEVOC_ARCHIVE_URL:-https://drive.usercontent.google.com/download?id=1Zh6b51S1WIsFjdCDRTQhYW61CQ0Ue1lk&export=download&confirm=t}"

download_url \
  "https://openaccess.thecvf.com/content/CVPR2023W/WMF/html/Sun_AI-Synthesized_Voice_Detection_Using_Neural_Vocoder_Artifacts_CVPRW_2023_paper.html" \
  "$out/paper.html"
download_url "$repo_url/raw/main/README.md" "$out/repository-README.md"
download_url "$repo_url/raw/main/LICENSE" "$out/repository-LICENSE"
download_url \
  "https://api.github.com/repos/csun22/Synthetic-Voice-Detection-Vocoder-Artifacts" \
  "$out/repository-api.json"
download_url "$hf_base/raw/main/README.md" "$out/hf-README.md"
download_url "$hf_api" "$out/hf-api.json"

if [[ "${LIBRISEVOC_CLONE_TOOLKIT:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/toolkit"
fi

if [[ "${LIBRISEVOC_DOWNLOAD_ARCHIVE:-0}" == "1" ]]; then
  download_url "$archive_url" "$out/LibriSeVoc.zip"
fi

if [[ "${LIBRISEVOC_DOWNLOAD_ARCHIVE:-0}" != "1" && "${LIBRISEVOC_CLONE_TOOLKIT:-0}" != "1" ]]; then
  cat <<EOF
Downloaded LibriSeVoc paper, repository, license, and dataset-card metadata to:
$out

The public Google Drive archive is 45,046,253,997 bytes (approximately 45.0 GB).
Set LIBRISEVOC_DOWNLOAD_ARCHIVE=1 to fetch it. Set
LIBRISEVOC_CLONE_TOOLKIT=1 to clone the author repository. Neither large
operation runs by default.

The repository is MIT-licensed, but the audio archive has no clearly stated
separate license. LibriTTS upstream terms also apply.
EOF
  exit 0
fi

echo "LibriSeVoc requested downloads complete: $out"
