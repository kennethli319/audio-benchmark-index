#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

config="${GIGASPEECH_CONFIG:-dev}"
out="$(dataset_dir gigaspeech)"

if [[ "${GIGASPEECH_ACK_ACCESS:-0}" != "1" ]]; then
  manual_required \
    "GigaSpeech" \
    "GigaSpeech is gated. Fill out the official form and accept the Hugging Face terms first." \
    "Official form: https://forms.gle/UuGQAPyscGRrUMLq6" \
    "HF dataset: https://huggingface.co/datasets/speechcolab/gigaspeech" \
    "After your account has access and is logged in, run:" \
    "  GIGASPEECH_ACK_ACCESS=1 GIGASPEECH_CONFIG=dev scripts/download/gigaspeech.sh" \
    "Configs include dev, test, xs, s, m, l, and xl. Avoid large configs unless intended."
fi

echo "Downloading gated GigaSpeech config '$config'."
echo "This requires prior HF access approval and an authenticated Hugging Face CLI/session."

hf_download_dataset \
  "speechcolab/gigaspeech" \
  "$out/$config" \
  --include "README.md" \
  --include "parquet-data/$config/*"

echo "GigaSpeech download complete: $out/$config"
