#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir audioagentsecurity)"
paper_url="${AUDIOAGENTSECURITY_PAPER_URL:-https://arxiv.org/abs/2607.28165}"
repo_url="${AUDIOAGENTSECURITY_REPO_URL:-https://github.com/Limax666/AudioAgentSecurity}"
repo_base_url="${AUDIOAGENTSECURITY_REPO_BASE_URL:-https://raw.githubusercontent.com/Limax666/AudioAgentSecurity/main}"
repo_api_url="${AUDIOAGENTSECURITY_REPO_API_URL:-https://api.github.com/repos/Limax666/AudioAgentSecurity}"
hf_repo="${AUDIOAGENTSECURITY_HF_REPO:-Limax11/AudioAgentSecurity}"
hf_api_url="${AUDIOAGENTSECURITY_HF_API_URL:-https://huggingface.co/api/datasets/$hf_repo}"

download_url "$paper_url" "$out/arxiv-2607.28165.html"
download_url "$repo_base_url/README.md" "$out/README.md"
download_url "$repo_api_url" "$out/github-api.json"
download_url "$repo_api_url/git/trees/main?recursive=1" "$out/github-tree.json"
download_url "$hf_api_url" "$out/huggingface-api.json"

if [[ "${AUDIOAGENTSECURITY_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/repository"
fi

if [[ "${AUDIOAGENTSECURITY_DOWNLOAD_HF:-0}" != "1" ]]; then
  echo "Downloaded AudioAgentSecurity documentation and live metadata to: $out"
  echo "The approximately 21.8 GiB benchmark snapshot is auto-gated; accept its live Hugging Face terms before opting in."
  exit 0
fi

if [[ "${AUDIOAGENTSECURITY_ACK_TERMS:-0}" != "1" ]]; then
  manual_required \
    "AudioAgentSecurity" \
    "Log in to Hugging Face and accept the dataset repository's access conditions." \
    "Then rerun with AUDIOAGENTSECURITY_ACK_TERMS=1 AUDIOAGENTSECURITY_DOWNLOAD_HF=1."
fi

hf_download_dataset "$hf_repo" "$out/huggingface"
echo "AudioAgentSecurity Hugging Face snapshot complete: $out/huggingface"
echo "Use only for authorized, responsible security evaluation and review all live upstream terms."
