#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

config="${CHILDES_ALIGNED_CONFIG:-asr}"
out="$(dataset_dir childes_aligned)"

if [[ "${CHILDES_ALIGNED_ACK_TERMS:-0}" != "1" ]]; then
  manual_required \
    "CHILDES-Aligned" \
    "Request manually reviewed access and accept the CHILDES/TalkBank terms on Hugging Face." \
    "Dataset: https://huggingface.co/datasets/MagicLuke/CHILDES-Aligned" \
    "TalkBank Ground Rules: https://talkbank.org/share/rules.html" \
    "Paper: https://arxiv.org/abs/2607.03670" \
    "After access is granted and Hugging Face authentication is configured, run:" \
    "  CHILDES_ALIGNED_ACK_TERMS=1 CHILDES_ALIGNED_CONFIG=asr scripts/download/childes_aligned.sh" \
    "Configs are 'asr' (283 hours) and 'general' (413.3 hours); the full repository is approximately 160.6 GB."
fi

case "$config" in
  asr|general) ;;
  *)
    echo "Unsupported CHILDES_ALIGNED_CONFIG: $config (expected: asr or general)" >&2
    exit 2
    ;;
esac

echo "Downloading gated CHILDES-Aligned config '$config'."
echo "This requires approved access and an authenticated Hugging Face session."

hf_download_dataset \
  "MagicLuke/CHILDES-Aligned" \
  "$out/$config" \
  --include "README.md" \
  --include "DATASHEET.md" \
  --include "corpora.tsv" \
  --include "text_normalization.md" \
  --include "$config/*"

echo "CHILDES-Aligned download complete: $out/$config"
