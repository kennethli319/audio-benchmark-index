#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir avdc)"
hf_repo="${AVDC_HF_REPO:-KaiyingYan/AVDC}"
code_repo="${AVDC_CODE_REPO:-Radiant0726/AVDC}"

download_url "https://arxiv.org/abs/2607.10299" "$out/paper.html"
download_url "https://radiant0726.github.io/AVDC-web/" "$out/project.html"
download_url \
  "https://huggingface.co/datasets/$hf_repo/raw/main/README.md" \
  "$out/dataset-card.md"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/huggingface-api.json"
download_url \
  "https://raw.githubusercontent.com/$code_repo/main/README.md" \
  "$out/code-README.md"
download_url "https://api.github.com/repos/$code_repo" "$out/github-api.json"

if [[ "${AVDC_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "https://github.com/$code_repo.git" "$out/repository"
fi

if [[ "${AVDC_DOWNLOAD_HF:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded AVDC documentation and API metadata only.

Set AVDC_DOWNLOAD_HF=1 to download the approximately 134 MiB caption and QA
annotation snapshot. The source videos are not included; video IDs refer to
media drawn from ShareGPT4Video and Vript. No data or code license is stated.

Set AVDC_CLONE_REPO=1 to clone the training and evaluation repository.
EOF
  echo "AVDC metadata download complete: $out"
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/huggingface"
echo "AVDC annotation snapshot complete: $out/huggingface"
echo "Source videos are not included; review all upstream media terms separately."
