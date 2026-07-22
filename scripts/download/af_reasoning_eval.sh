#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir af_reasoning_eval)"
raw_base_url="${AF_REASONING_EVAL_RAW_BASE_URL:-https://raw.githubusercontent.com/NVIDIA/audio-flamingo/soundCoT}"

download_url "$raw_base_url/README.md" "$out/README.md"
for file in AQA_MCQ.json AQA_Yes_No.json Classification_full.json Classification_mini.json; do
  download_url "$raw_base_url/AF_Reasoning_Eval/$file" "$out/$file"
done

echo "Downloaded AF-Reasoning-Eval annotations to: $out"
echo "Audio is not included. Use the Clotho-AQA and FSD50K helpers, subject to their upstream terms."
