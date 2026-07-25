#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir tfcl_afe)"
hf_repo="${TFCL_AFE_HF_REPO:-JunXueTech/TFCL}"
github_repo="${TFCL_AFE_GITHUB_REPO:-https://github.com/JunXue-tech/TFCL.git}"

download_url \
  "https://huggingface.co/datasets/${hf_repo}/raw/main/README.md" \
  "$out/huggingface_README.md"
download_url \
  "https://huggingface.co/api/datasets/${hf_repo}" \
  "$out/huggingface_api.json"
download_url \
  "https://raw.githubusercontent.com/JunXue-tech/TFCL/main/README.md" \
  "$out/github_README.md"
download_url \
  "https://raw.githubusercontent.com/JunXue-tech/TFCL/main/LICENSE" \
  "$out/github_LICENSE"

if [[ "${TFCL_AFE_DOWNLOAD_DATA:-0}" == "1" ]]; then
  hf_download_dataset \
    "$hf_repo" \
    "$out/huggingface-data" \
    --include "ASVspoof2019_*_data_*.tar.gz"
fi

if [[ "${TFCL_AFE_DOWNLOAD_CHECKPOINT:-0}" == "1" ]]; then
  hf_download_dataset \
    "$hf_repo" \
    "$out/huggingface-checkpoint" \
    --include "TFCL_best_ckpt.pth"
fi

if [[ "${TFCL_AFE_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$github_repo" "$out/repository"
fi

if [[ "${TFCL_AFE_DOWNLOAD_DATA:-0}" != "1" ]] &&
   [[ "${TFCL_AFE_DOWNLOAD_CHECKPOINT:-0}" != "1" ]] &&
   [[ "${TFCL_AFE_CLONE_REPO:-0}" != "1" ]]; then
  echo "Downloaded TFCL AFE documentation and metadata to: $out"
  echo "Processed audio (~38.5 GB), checkpoint (~1.27 GB), and code are separate opt-ins."
  exit 0
fi

echo "TFCL AFE requested downloads complete: $out"
