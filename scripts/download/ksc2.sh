#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir ksc2)"
hf_repo="${KSC2_HF_REPO:-issai/Kazakh_Speech_Corpus_2}"
repo="${KSC2_REPO:-IS2AI/ISSAI_SAIDA_Kazakh_ASR}"

download_url \
  "https://issai.nu.edu.kz/kz-speech-corpus/" \
  "$out/official_homepage.html"
download_url \
  "https://www.isca-archive.org/interspeech_2022/mussakhojayeva22_interspeech.html" \
  "$out/paper.html"
download_url \
  "https://huggingface.co/datasets/$hf_repo/raw/main/README.md" \
  "$out/huggingface_README.md"
download_url \
  "https://huggingface.co/api/datasets/$hf_repo" \
  "$out/huggingface_api.json"
download_url \
  "https://raw.githubusercontent.com/$repo/master/README.md" \
  "$out/repository_README.md"
download_url \
  "https://raw.githubusercontent.com/$repo/master/LICENSE.md" \
  "$out/repository_LICENSE.md"

if [[ "${KSC2_DOWNLOAD_HF:-0}" != "1" ]]; then
  echo "Downloaded KSC2 documentation and metadata to: $out"
  echo "Set KSC2_DOWNLOAD_HF=1 to download the approximately 80.8 GB snapshot."
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/huggingface"
echo "KSC2 Hugging Face snapshot complete: $out/huggingface"
