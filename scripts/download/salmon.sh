#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir salmon)"
repo_api_url="${SALMON_REPO_API_URL:-https://api.github.com/repos/slp-rl/salmon}"
raw_base_url="${SALMON_RAW_BASE_URL:-https://raw.githubusercontent.com/slp-rl/salmon/main}"
hf_base_url="${SALMON_HF_BASE_URL:-https://huggingface.co/datasets/slprl/SALMon}"

download_url "$raw_base_url/README.md" "$out/repository-README.md"
download_url "$repo_api_url" "$out/github-repo.json"
download_url "$hf_base_url/raw/main/README.md" "$out/dataset-card.md"
download_url "https://huggingface.co/api/datasets/slprl/SALMon" "$out/hugging-face-api.json"

if [[ "${SALMON_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "slprl/SALMon" "$out/hugging-face"
else
  echo "Skipping the approximately 562 MB Hugging Face snapshot."
  echo "Set SALMON_DOWNLOAD_HF=1 to download all eight SALMon configurations."
fi

echo "SALMon metadata download complete: $out"
echo "Dataset terms are CC BY-NC 4.0; review component-source terms before reuse."
