#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir spuraudio)"
hf_repo="${SPURAUDIO_HF_REPO:-spuraudioNips/SpurAudio-neurips-anonym}"
repo_url="${SPURAUDIO_REPO_URL:-https://github.com/Jerryaa98/SpurAudio.git}"
raw_base_url="${SPURAUDIO_RAW_BASE_URL:-https://raw.githubusercontent.com/Jerryaa98/SpurAudio/main}"
repo_api_url="${SPURAUDIO_REPO_API_URL:-https://api.github.com/repos/Jerryaa98/SpurAudio}"

download_url "$raw_base_url/README.md" "$out/README.md"
download_url "$raw_base_url/LICENSE" "$out/LICENSE"
download_url "$repo_api_url" "$out/github-repo.json"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/huggingface-dataset.json"
download_url "https://huggingface.co/datasets/$hf_repo/raw/main/README.md" "$out/huggingface-README.md"

if [[ "${SPURAUDIO_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/SpurAudio"
fi

if [[ "${SPURAUDIO_DOWNLOAD_HF:-0}" != "1" ]]; then
  echo "Downloaded SpurAudio docs and repository metadata to: $out"
  echo "Set SPURAUDIO_DOWNLOAD_HF=1 to download the approximately 7.69 GB audio snapshot."
  echo "Review all five component-dataset licenses before reuse."
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/huggingface"
echo "SpurAudio Hugging Face snapshot complete: $out/huggingface"
echo "Preserve upstream component-dataset terms, including applicable non-commercial restrictions."
