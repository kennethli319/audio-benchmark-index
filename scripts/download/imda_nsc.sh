#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir imda_nsc)"
official_url="${IMDA_NSC_OFFICIAL_URL:-https://www.imda.gov.sg/how-we-can-help/national-speech-corpus}"
hf_repo="${IMDA_NSC_HF_REPO:-mesolitica/IMDA-STT}"
hf_base="${IMDA_NSC_HF_BASE_URL:-https://huggingface.co/datasets/$hf_repo}"
hf_api="${IMDA_NSC_HF_API_URL:-https://huggingface.co/api/datasets/$hf_repo}"

download_url "$official_url" "$out/imda-national-speech-corpus.html"
download_url "https://arxiv.org/abs/2607.23027" "$out/singlish-tts-paper.html"
download_url "$hf_base/raw/main/README.md" "$out/mirror-README.md"
download_url "$hf_api" "$out/mirror-api.json"

if [[ "${IMDA_NSC_DOWNLOAD_MIRROR:-0}" != "1" ]]; then
  echo "Downloaded IMDA NSC official and mirror metadata to: $out"
  echo "Official audio access requires IMDA registration and a Dropbox account."
  echo "Set IMDA_NSC_DOWNLOAD_MIRROR=1 only if you intend to download the multi-terabyte public mirror."
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/huggingface-mirror"
echo "IMDA NSC mirror download complete: $out/huggingface-mirror"
