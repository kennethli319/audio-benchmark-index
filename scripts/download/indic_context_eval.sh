#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir indic_context_eval)"
paper_url="${INDIC_CONTEXT_EVAL_PAPER_URL:-https://arxiv.org/abs/2606.19157}"
repo_raw_url="${INDIC_CONTEXT_EVAL_REPO_RAW_URL:-https://raw.githubusercontent.com/AI4Bharat/IndicContextEval/main}"
repo_api_url="${INDIC_CONTEXT_EVAL_REPO_API_URL:-https://api.github.com/repos/AI4Bharat/IndicContextEval}"
hf_url="${INDIC_CONTEXT_EVAL_HF_URL:-https://huggingface.co/datasets/AI4Bharat/IndicContextEval}"

download_url "$paper_url" "$out/arxiv-2606.19157.html"
download_url "$repo_raw_url/README.md" "$out/README.md"
download_url "$repo_raw_url/results/paper_results.csv" "$out/results/paper_results.csv"
download_url "$repo_raw_url/supplementary/Domain_Categories.pdf" "$out/supplementary/Domain_Categories.pdf"
download_url "$repo_raw_url/supplementary/Levels_Prompts.pdf" "$out/supplementary/Levels_Prompts.pdf"
download_url "$repo_raw_url/supplementary/domain_description.pdf" "$out/supplementary/domain_description.pdf"
download_url "$repo_api_url" "$out/github-api.json"
download_url "$repo_api_url/git/trees/main?recursive=1" "$out/github-tree.json"
download_url "$hf_url/raw/main/README.md" "$out/huggingface-README.md"
download_url "https://huggingface.co/api/datasets/AI4Bharat/IndicContextEval" "$out/huggingface-api.json"

if [[ "${INDIC_CONTEXT_EVAL_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "AI4Bharat/IndicContextEval" "$out/huggingface"
else
  echo "Skipping the 6.48 GB current Hugging Face data snapshot. Set INDIC_CONTEXT_EVAL_DOWNLOAD_HF=1 to include it."
fi

cat <<MSG
IndicContextEval metadata download complete: $out

The dataset card and official repository README declare CC BY 4.0. The GitHub
repository has no standalone LICENSE file, so confirm terms for repository
outputs and forthcoming evaluation code before reuse or redistribution.
MSG
