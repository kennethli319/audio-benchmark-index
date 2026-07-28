#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir blab)"
hf_repo="${BLAB_HF_REPO:-oreva/blab_long_audio}"
hf_base="${BLAB_HF_BASE_URL:-https://huggingface.co/datasets/$hf_repo}"
hf_api="${BLAB_HF_API_URL:-https://huggingface.co/api/datasets/$hf_repo}"
repo_url="${BLAB_REPO_URL:-https://github.com/orevaahia/brutally_long_audio_bench}"

download_url "https://arxiv.org/abs/2505.03054" "$out/paper.html"
download_url "$hf_base/raw/main/README.md" "$out/hf-README.md"
download_url "$hf_api" "$out/hf-api.json"
download_url "$repo_url/raw/main/README.md" "$out/repository-README.md"
download_url "https://api.github.com/repos/orevaahia/brutally_long_audio_bench" "$out/repository-api.json"

if [[ "${BLAB_CLONE_TOOLKIT:-0}" == "1" ]]; then
  clone_repo "$repo_url.git" "$out/toolkit"
fi

if [[ "${BLAB_DOWNLOAD_HF:-0}" != "1" ]]; then
  echo "Downloaded BLAB documentation and repository metadata to: $out"
  echo "The release references source videos and does not redistribute audio."
  echo "Set BLAB_DOWNLOAD_HF=1 to download the approximately 535 MB metadata snapshot."
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/huggingface"
echo "BLAB metadata snapshot complete: $out/huggingface"
