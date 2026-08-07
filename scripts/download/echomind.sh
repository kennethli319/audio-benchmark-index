#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir echomind)"
paper_url="${ECHOMIND_PAPER_URL:-https://arxiv.org/abs/2510.22758}"
project_url="${ECHOMIND_PROJECT_URL:-https://hlt-cuhksz.github.io/EchoMind/}"
repo_base_url="${ECHOMIND_REPO_BASE_URL:-https://raw.githubusercontent.com/hlt-cuhksz/EchoMind/main}"
repo_api_url="${ECHOMIND_REPO_API_URL:-https://api.github.com/repos/hlt-cuhksz/EchoMind}"
hf_repo="${ECHOMIND_HF_REPO:-hlt-cuhksz/EchoMind}"
hf_api_url="${ECHOMIND_HF_API_URL:-https://huggingface.co/api/datasets/$hf_repo}"

download_url "$paper_url" "$out/arxiv-2510.22758.html"
download_url "$project_url" "$out/project.html"
download_url "$repo_base_url/README.md" "$out/README.md"
download_url "$repo_api_url" "$out/github-api.json"
download_url "$hf_api_url" "$out/huggingface-api.json"

if [[ "${ECHOMIND_DOWNLOAD_HF:-0}" != "1" ]]; then
  echo "Downloaded EchoMind public documentation and metadata to: $out"
  echo "The approximately 7.4 GB dataset is ungated but requires explicit opt-in."
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/huggingface"
echo "EchoMind Hugging Face snapshot complete: $out/huggingface"
echo "Review source-media, voice, consent, and service terms before use."
