#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir halas)"
paper_url="${HALAS_PAPER_URL:-https://arxiv.org/abs/2606.23048}"
repo_base_url="${HALAS_REPO_BASE_URL:-https://raw.githubusercontent.com/DSP-AGH/HALAS/main}"
repo_api_url="${HALAS_REPO_API_URL:-https://api.github.com/repos/DSP-AGH/HALAS}"
hf_base_url="${HALAS_HF_BASE_URL:-https://huggingface.co/datasets/MatBar99/HALAS}"
hf_api_url="${HALAS_HF_API_URL:-https://huggingface.co/api/datasets/MatBar99/HALAS}"

download_url "$paper_url" "$out/arxiv-2606.23048.html"
download_url "$repo_base_url/README.md" "$out/README.md"
download_url "$repo_base_url/inference_parameters.md" "$out/inference_parameters.md"
download_url "$repo_base_url/prompt.txt" "$out/prompt.txt"
download_url "$repo_api_url" "$out/github-api.json"
download_url "$hf_base_url/raw/main/README.md" "$out/huggingface-README.md"
download_url "$hf_api_url" "$out/huggingface-api.json"

if [[ "${HALAS_DOWNLOAD_TEST:-0}" == "1" ]]; then
  download_url "$hf_base_url/resolve/main/test.csv" "$out/test.csv"
else
  echo "Skipping the approximately 0.86 MB test annotations. Set HALAS_DOWNLOAD_TEST=1 to download them."
fi

if [[ "${HALAS_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "MatBar99/HALAS" "$out/huggingface"
else
  echo "Skipping the approximately 7.2 MB Hugging Face snapshot. Set HALAS_DOWNLOAD_HF=1 to download it."
fi

cat <<MSG
HALAS metadata download complete: $out

The release provides annotations and Earnings-22 identifiers, not audio.
Obtain source audio separately and review its terms. The dataset card currently
declares license "unknown"; descriptive CC BY-SA language is not a standalone
license file.
MSG
