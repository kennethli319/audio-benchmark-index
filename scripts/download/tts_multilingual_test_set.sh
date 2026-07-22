#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir tts_multilingual_test_set)"
card_url="${TTS_MULTILINGUAL_TEST_SET_CARD_URL:-https://huggingface.co/datasets/MiniMaxAI/TTS-Multilingual-Test-Set/raw/main/README.md}"

download_url "$card_url" "$out/README.md"

if [[ "${TTS_MULTILINGUAL_TEST_SET_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "MiniMaxAI/TTS-Multilingual-Test-Set" "$out/hf"
else
  cat <<'EOF'
Downloaded the official TTS Multilingual Test Set dataset card only.

Set TTS_MULTILINGUAL_TEST_SET_DOWNLOAD_HF=1 to fetch the public, ungated
Hugging Face snapshot (approximately 7.3 MB). The dataset card lists
CC BY-SA 4.0; its speaker prompts are selected from Mozilla Common Voice.
EOF
fi

echo "TTS Multilingual Test Set metadata download complete: $out"
