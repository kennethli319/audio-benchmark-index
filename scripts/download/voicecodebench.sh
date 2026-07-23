#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir voicecodebench)"
hf_base="${VOICECODEBENCH_HF_BASE_URL:-https://huggingface.co/datasets/besimple-ai/voice-code-bench}"
hf_api="${VOICECODEBENCH_HF_API_URL:-https://huggingface.co/api/datasets/besimple-ai/voice-code-bench}"

download_url "$hf_base/raw/main/README.md" "$out/README.md"
download_url "$hf_base/raw/main/DATASET_CARD.md" "$out/DATASET_CARD.md"
download_url "$hf_base/raw/main/LICENSE" "$out/LICENSE"
download_url "$hf_base/resolve/main/paper/voice-code-bench.pdf" "$out/voice-code-bench.pdf"
download_url "$hf_base/resolve/main/data/metadata.jsonl" "$out/metadata.jsonl"
download_url "$hf_api" "$out/hugging-face-api.json"

if [[ "${VOICECODEBENCH_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "besimple-ai/voice-code-bench" "$out/hugging-face"
else
  echo "Skipping the approximately 1.83 GiB full snapshot. Set VOICECODEBENCH_DOWNLOAD_HF=1 to download it."
fi

cat <<MSG
VoiceCodeBench metadata download complete: $out

The default download includes annotations but not the 300 WAV files or baseline
prediction artifacts. Review the MIT license and the dataset card's human-voice,
privacy, and intended-use guidance before using the release.
MSG
