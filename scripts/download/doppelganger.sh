#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir doppelganger)"
raw_base_url="${DOPPELGANGER_RAW_BASE_URL:-https://raw.githubusercontent.com/elliottash/doppelganger/main}"
repo_api_url="${DOPPELGANGER_REPO_API_URL:-https://api.github.com/repos/elliottash/doppelganger}"
repo_url="${DOPPELGANGER_REPO_URL:-https://github.com/elliottash/doppelganger.git}"
hf_repo="${DOPPELGANGER_HF_REPO:-elliottash/doppelganger}"

download_url "$raw_base_url/README.md" "$out/README.md"
download_url "$raw_base_url/paper/DATASHEET.md" "$out/DATASHEET.md"
download_url "$raw_base_url/LICENSE" "$out/LICENSE"
download_url "$repo_api_url" "$out/github-repo.json"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/huggingface-dataset.json"

if [[ "${DOPPELGANGER_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/doppelganger"
fi

if [[ "${DOPPELGANGER_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "$hf_repo" "$out/huggingface"
fi

echo "Doppelganger docs and repository metadata downloaded to: $out"
echo "Set DOPPELGANGER_CLONE_REPO=1 for code/manifests (~10 MB)."
echo "Set DOPPELGANGER_DOWNLOAD_HF=1 for generated twins/embeddings (~8.48 GB)."
echo "Real source audio is not redistributed in bulk; follow manifest IDs and source terms."
