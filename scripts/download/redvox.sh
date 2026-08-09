#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir redvox)"
paper_url="${REDVOX_PAPER_URL:-https://arxiv.org/abs/2606.26968}"
hf_repo="${REDVOX_HF_REPO:-FBK-MT/RedVox}"
hf_api_url="${REDVOX_HF_API_URL:-https://huggingface.co/api/datasets/$hf_repo}"
hf_tree_url="${REDVOX_HF_TREE_URL:-https://huggingface.co/api/datasets/$hf_repo/tree/main?recursive=true&expand=true}"

download_url "$paper_url" "$out/arxiv-2606.26968.html"
download_url "$hf_api_url" "$out/huggingface-api.json"
download_url "$hf_tree_url" "$out/huggingface-tree-first-page.json"

if [[ "${REDVOX_DOWNLOAD_HF:-0}" != "1" ]]; then
  echo "Downloaded RedVox public paper and live Hub metadata to: $out"
  echo "The dataset is manually gated. Obtain owner approval before opting in."
  exit 0
fi

if [[ "${REDVOX_ACK_TERMS:-0}" != "1" ]]; then
  manual_required \
    "RedVox" \
    "Log in to Hugging Face, request access, and accept the dataset repository's custom terms." \
    "Then rerun with REDVOX_ACK_TERMS=1 REDVOX_DOWNLOAD_HF=1."
fi

hf_download_dataset "$hf_repo" "$out/huggingface"
echo "RedVox Hugging Face snapshot complete: $out/huggingface"
echo "Review the approved custom terms, participant protections, and MUSAN source terms before use."
