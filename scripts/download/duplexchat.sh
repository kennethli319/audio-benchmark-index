#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir duplexchat)"
hf_repo="${DUPLEXCHAT_HF_REPO:-sarulab-speech/DuplexChat}"
hf_base="${DUPLEXCHAT_HF_BASE_URL:-https://huggingface.co/datasets/$hf_repo}"
hf_api="${DUPLEXCHAT_HF_API_URL:-https://huggingface.co/api/datasets/$hf_repo}"
repo_url="${DUPLEXCHAT_REPO_URL:-https://github.com/sarulab-speech/DuplexChat}"

download_url "https://arxiv.org/abs/2607.04941" "$out/paper.html"
download_url "$hf_base/raw/main/README.md" "$out/hf-README.md"
download_url "$hf_api" "$out/hf-api.json"
download_url "$hf_base/resolve/main/manifest_counts.json" "$out/manifest_counts.json"
download_url "$repo_url/raw/master/README.md" "$out/repository-README.md"
download_url "$repo_url/raw/master/LICENSE" "$out/LICENSE"

if [[ "${DUPLEXCHAT_CLONE_TOOLKIT:-0}" == "1" ]]; then
  clone_repo "$repo_url.git" "$out/toolkit"
fi

if [[ "${DUPLEXCHAT_DOWNLOAD_HF:-0}" != "1" ]]; then
  echo "Downloaded DuplexChat documentation and counts to: $out"
  echo "The release contains metadata only; it does not redistribute podcast audio."
  echo "Set DUPLEXCHAT_DOWNLOAD_HF=1 to download the approximately 791.5 MB manifest snapshot."
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/huggingface"
echo "DuplexChat manifest snapshot complete: $out/huggingface"
