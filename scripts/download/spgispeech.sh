#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

config="${SPGISPEECH_CONFIG:-dev}"
out="$(dataset_dir spgispeech)"

if [[ "${SPGISPEECH_ACK_TERMS:-0}" != "1" ]]; then
  manual_required \
    "SPGISpeech" \
    "SPGISpeech is gated on Hugging Face. Accept the Kensho terms and log in first." \
    "HF dataset: https://huggingface.co/datasets/kensho/spgispeech" \
    "Paper: https://arxiv.org/abs/2104.02014" \
    "After your account has access and is logged in, run:" \
    "  SPGISPEECH_ACK_TERMS=1 SPGISPEECH_CONFIG=dev scripts/download/spgispeech.sh" \
    "Configs include dev, test, S, M, and L. Even dev/test are about 11 GiB each."
fi

echo "Downloading gated SPGISpeech config '$config'."
echo "This requires accepted Kensho/Hugging Face terms and an authenticated Hugging Face CLI/session."

hf_download_dataset \
  "kensho/spgispeech" \
  "$out/$config" \
  --include "README.md" \
  --include "$config/*"

echo "SPGISpeech download complete: $out/$config"
