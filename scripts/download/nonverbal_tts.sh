#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir nonverbal_tts)"
hf_repo="${NONVERBAL_TTS_HF_REPO:-deepvk/NonverbalTTS}"
hf_base_url="${NONVERBAL_TTS_HF_BASE_URL:-https://huggingface.co/datasets/$hf_repo}"
paper_url="${NONVERBAL_TTS_PAPER_URL:-https://arxiv.org/abs/2507.13155}"
publication_url="${NONVERBAL_TTS_PUBLICATION_URL:-https://www.isca-archive.org/ssw_2025/borisov25_ssw.html}"

download_url "$hf_base_url/raw/main/README.md" "$out/dataset-card.md"
download_url "https://huggingface.co/api/datasets/$hf_repo?blobs=true" "$out/hugging-face-api.json"
download_url "$paper_url" "$out/paper.html"
download_url "$publication_url" "$out/publication.html"

if [[ "${NONVERBAL_TTS_DOWNLOAD_TEST:-0}" == "1" ]]; then
  download_url \
    "$hf_base_url/resolve/main/default/test/0000.parquet" \
    "$out/test/0000.parquet"
else
  echo "Skipping the approximately 108 MiB test split. Set NONVERBAL_TTS_DOWNLOAD_TEST=1 to download it."
fi

if [[ "${NONVERBAL_TTS_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "$hf_repo" "$out/hugging-face"
else
  echo "Skipping the approximately 3.9 GiB full snapshot. Set NONVERBAL_TTS_DOWNLOAD_HF=1 to download it."
fi

cat <<MSG
NonverbalTTS documentation and metadata downloaded: $out

The dataset card has conflicting license fields: its prose assigns annotations
CC BY-NC-SA 4.0 and preserves VoxCeleb/Expresso terms for audio, while its
machine-readable metadata says Apache-2.0. Review the source terms before use.
MSG
