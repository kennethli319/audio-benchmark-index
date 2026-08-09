#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir svhalluc)"
hf_repo="${SVHALLUC_HF_REPO:-zcs15/SVHalluc}"
repo_url="${SVHALLUC_REPO_URL:-https://github.com/kaist-ami/SVHalluc.git}"

download_url "https://arxiv.org/abs/2606.02642" "$out/arxiv-2606.02642.html"
download_url "https://chenshuang-zhang.github.io/projects/svhalluc/" "$out/project.html"
download_url "https://api.github.com/repos/kaist-ami/SVHalluc" "$out/github-api.json"
download_url "https://raw.githubusercontent.com/kaist-ami/SVHalluc/main/README.md" "$out/github-README.md"
download_url "https://raw.githubusercontent.com/kaist-ami/SVHalluc/main/LICENSE_NOTICE.md" "$out/LICENSE_NOTICE.md"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/huggingface-api.json"
download_url "https://huggingface.co/datasets/$hf_repo/raw/main/README.md" "$out/huggingface-README.md"
download_url "https://huggingface.co/datasets/$hf_repo/resolve/main/samples.json" "$out/samples.json"

if [[ "${SVHALLUC_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "$hf_repo" "$out/huggingface"
else
  echo "Skipping the approximately 6.26 GB Hub snapshot. Set SVHALLUC_DOWNLOAD_HF=1 to download it."
fi

if [[ "${SVHALLUC_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/SVHalluc"
else
  echo "Skipping the small owner repository clone. Set SVHALLUC_CLONE_REPO=1 to clone it."
fi

echo "Downloaded SVHalluc documentation, terms, metadata, and annotations to: $out"
echo "The release is research-purpose only; YouCook2, YouTube, and source-video terms also apply."
