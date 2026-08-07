#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir speechjbb)"
paper_url="${SPEECHJBB_PAPER_URL:-https://arxiv.org/abs/2606.06037}"
hf_repo="${SPEECHJBB_HF_REPO:-McGill-NLP/SpeechJBB}"
hf_api_url="${SPEECHJBB_HF_API_URL:-https://huggingface.co/api/datasets/$hf_repo}"
hf_card_url="${SPEECHJBB_HF_CARD_URL:-https://huggingface.co/datasets/$hf_repo/raw/main/README.md}"
repo_url="${SPEECHJBB_REPO_URL:-https://github.com/virginiaceccatelli/speechJBB.git}"
repo_api_url="${SPEECHJBB_REPO_API_URL:-https://api.github.com/repos/virginiaceccatelli/speechJBB}"
repo_readme_url="${SPEECHJBB_REPO_README_URL:-https://raw.githubusercontent.com/virginiaceccatelli/speechJBB/main/README.md}"

download_url "$paper_url" "$out/arxiv-2606.06037.html"
download_url "$hf_api_url" "$out/huggingface-api.json"
download_url "$hf_card_url" "$out/huggingface-README.md"
download_url "$repo_api_url" "$out/github-api.json"
download_url "$repo_readme_url" "$out/github-README.md"

if [[ "${SPEECHJBB_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/repository"
fi

if [[ "${SPEECHJBB_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "$hf_repo" "$out/huggingface"
fi

echo "Downloaded SpeechJBB public documentation and metadata to: $out"
echo "Set SPEECHJBB_DOWNLOAD_HF=1 for the approximately 6.82 GB audio snapshot."
echo "Set SPEECHJBB_CLONE_REPO=1 separately for evaluation code and selected outputs."
