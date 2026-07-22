#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir mmau_pro)"
repo_base_url="${MMAU_PRO_REPO_BASE_URL:-https://raw.githubusercontent.com/sonalkum/MMAUPro/main}"
repo_api_url="${MMAU_PRO_REPO_API_URL:-https://api.github.com/repos/sonalkum/MMAUPro}"
hf_base_url="${MMAU_PRO_HF_BASE_URL:-https://huggingface.co/datasets/gamma-lab-umd/MMAU-Pro}"
hf_api_url="${MMAU_PRO_HF_API_URL:-https://huggingface.co/api/datasets/gamma-lab-umd/MMAU-Pro}"
paper_url="${MMAU_PRO_PAPER_URL:-https://arxiv.org/abs/2508.13992}"

download_url "$repo_base_url/README.md" "$out/repository-README.md"
download_url "$repo_base_url/evaluate_mmau_pro_comprehensive.py" "$out/evaluate_mmau_pro_comprehensive.py"
download_url "$repo_api_url" "$out/github-api.json"
download_url "$hf_base_url/raw/main/README.md" "$out/dataset-card.md"
download_url "$hf_api_url" "$out/hugging-face-api.json"
download_url "$paper_url" "$out/arxiv-2508.13992.html"

if [[ "${MMAU_PRO_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "gamma-lab-umd/MMAU-Pro" "$out/hugging-face"
else
  cat <<'MSG'
MMAU-Pro documentation, evaluator, and metadata download complete.

The complete Hugging Face repository is approximately 47.5 GB. To download it
explicitly, run:

  MMAU_PRO_DOWNLOAD_HF=1 scripts/download/mmau_pro.sh

The dataset card declares CC BY-NC 4.0, but source-media and EasyCom terms may
also apply. The evaluator repository does not state a code license.
MSG
fi
