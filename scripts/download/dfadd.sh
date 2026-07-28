#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir dfadd)"
hf_repo="${DFADD_HF_REPO:-isjwdu/DFADD}"
hf_base="${DFADD_HF_BASE_URL:-https://huggingface.co/datasets/$hf_repo}"
hf_api="${DFADD_HF_API_URL:-https://huggingface.co/api/datasets/$hf_repo}"
repo_url="${DFADD_REPO_URL:-https://github.com/isjwdu/DFADD}"

download_url "https://arxiv.org/abs/2409.08731" "$out/paper.html"
download_url "$repo_url/raw/main/README.md" "$out/repository-README.md"
download_url "$repo_url/raw/main/LICENSE" "$out/repository-LICENSE"
download_url "https://api.github.com/repos/isjwdu/DFADD" "$out/repository-api.json"
download_url "$hf_base/raw/main/README.md" "$out/hf-README.md"
download_url "$hf_api" "$out/hf-api.json"

if [[ "${DFADD_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "$hf_repo" "$out/huggingface" \
    --include ".gitattributes" \
    --include "README.md" \
    --include "data/*"
fi

if [[ "${DFADD_DOWNLOAD_ZIPS:-0}" == "1" ]]; then
  hf_download_dataset "$hf_repo" "$out/component-zips" \
    --include "DATASET_*.zip"
fi

if [[ "${DFADD_DOWNLOAD_HF:-0}" != "1" && "${DFADD_DOWNLOAD_ZIPS:-0}" != "1" ]]; then
  cat <<EOF
Downloaded DFADD paper, repository, license, dataset card, and API metadata to:
$out

The public dataset-viewer snapshot is approximately 28.6 GB. Set
DFADD_DOWNLOAD_HF=1 to fetch it. The separately packaged ZIP release includes
an April 2025 Matcha-TTS label correction; set DFADD_DOWNLOAD_ZIPS=1 to fetch
all corrected component archives. Neither large release is downloaded by
default.
EOF
  exit 0
fi

echo "DFADD requested downloads complete: $out"
