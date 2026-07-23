#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir ghana_speech_eval)"
benchmark="ghananlpcommunity/ghana-speech-eval"
source_dataset="AfriSpeech/african-speech-public_v1"

download_url \
  "https://huggingface.co/datasets/$benchmark/raw/main/README.md" \
  "$out/README.md"
download_url \
  "https://huggingface.co/api/datasets/$benchmark" \
  "$out/huggingface-api.json"
download_url \
  "https://huggingface.co/datasets/$source_dataset/raw/main/README.md" \
  "$out/AfriSpeech-README.md"
download_url \
  "https://huggingface.co/api/datasets/$source_dataset" \
  "$out/AfriSpeech-huggingface-api.json"

if [[ "${GHANA_SPEECH_EVAL_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "$benchmark" "$out/huggingface"
else
  cat <<'EOF'
Downloaded official benchmark/source cards and API metadata only.

Set GHANA_SPEECH_EVAL_DOWNLOAD_HF=1 to download the approximately 594 MB
compressed benchmark snapshot. The benchmark card declares CC BY 4.0, but the
current AfriSpeech source card does not state a repository-level license;
confirm upstream collection, consent, and reuse terms before redistribution.
EOF
fi

echo "Ghana Speech Eval metadata download complete: $out"
