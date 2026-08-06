#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir wsyue_asr_eval)"
hf_repo="${WSYUE_ASR_EVAL_HF_REPO:-ASLP-lab/WSYue-ASR-eval}"

download_url "https://huggingface.co/datasets/$hf_repo/raw/main/README.md" "$out/README.md"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/huggingface-dataset.json"

if [[ "${WSYUE_ASR_EVAL_DOWNLOAD_DATA:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded WSYue-ASR-eval documentation and repository metadata only.
The public release contains approximately 1.06 GiB of Cantonese benchmark
audio and annotations. Set WSYUE_ASR_EVAL_DOWNLOAD_DATA=1 to fetch it.
EOF
  echo "WSYue-ASR-eval metadata download complete: $out"
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/huggingface"
echo "WSYue-ASR-eval requested download complete: $out/huggingface"
