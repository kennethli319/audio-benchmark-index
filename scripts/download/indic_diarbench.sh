#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir indic_diarbench)"
hf_repo="${INDIC_DIARBENCH_HF_REPO:-sarvamai/indic-diarbench}"
hf_base="${INDIC_DIARBENCH_HF_BASE_URL:-https://huggingface.co/datasets/$hf_repo}"
hf_api="${INDIC_DIARBENCH_HF_API_URL:-https://huggingface.co/api/datasets/$hf_repo}"

download_url "https://arxiv.org/abs/2607.23808" "$out/indic-diarbench-paper.html"
download_url "$hf_base/raw/main/README.md" "$out/hf-README.md"
download_url "$hf_api" "$out/hf-api.json"

if [[ "${INDIC_DIARBENCH_DOWNLOAD_HF:-0}" != "1" ]]; then
  echo "Downloaded Indic DiarBench metadata to: $out"
  echo "Skipping the approximately 30.3 GB Hugging Face snapshot."
  echo "Set INDIC_DIARBENCH_DOWNLOAD_HF=1 to download it."
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/huggingface"
echo "Indic DiarBench snapshot complete: $out/huggingface"
