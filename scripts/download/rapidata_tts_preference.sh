#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir rapidata_tts_preference)"
base="https://huggingface.co/datasets/Rapidata/text-2-audio-human-preference-benchmark"

download_url "$base/raw/main/README.md" "$out/README.md"
download_url "https://huggingface.co/api/datasets/Rapidata/text-2-audio-human-preference-benchmark" "$out/huggingface-api.json"

if [[ "${RAPIDATA_TTS_PREFERENCE_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "Rapidata/text-2-audio-human-preference-benchmark" "$out/hf"
else
  cat <<'EOF'
Downloaded official metadata only.

Set RAPIDATA_TTS_PREFERENCE_DOWNLOAD_HF=1 to fetch the public, ungated
Hugging Face snapshot (approximately 0.8 MB). No data license is declared;
review the demographic fields and referenced/generated-audio rights before use.
EOF
fi

echo "Rapidata TTS preference metadata download complete: $out"
