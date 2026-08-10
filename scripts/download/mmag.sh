#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir mmag)"
repo_raw="${MMAG_REPO_RAW_URL:-https://raw.githubusercontent.com/HiRookie9/MMAG/main}"
repo_api="${MMAG_REPO_API_URL:-https://api.github.com/repos/HiRookie9/MMAG}"
hf_repo="${MMAG_HF_REPO:-rookie9/MMAG}"
hf_base="${MMAG_HF_BASE_URL:-https://huggingface.co/datasets/$hf_repo}"

download_url "$repo_raw/README.md" "$out/repository-README.md"
download_url "$repo_api" "$out/github-api.json"
download_url "$hf_base/raw/main/README.md" "$out/dataset-card.md"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/hugging-face-api.json"
download_url "$hf_base/resolve/main/main_set/metadata.jsonl?download=true" "$out/main-set-metadata.jsonl"
download_url "$hf_base/resolve/main/voice_cloning_set/metadata.jsonl?download=true" "$out/voice-cloning-set-metadata.jsonl"
download_url "$hf_base/resolve/main/timestamp_set/metadata.jsonl?download=true" "$out/timestamp-set-metadata.jsonl"

if [[ "${MMAG_DOWNLOAD_AUDIO:-0}" == "1" ]]; then
  hf_download_dataset \
    "$hf_repo" \
    "$out/hugging-face" \
    --include 'audio_files/*' \
    --include 'prompt_audio/*'
else
  echo "Skipping the approximately 1.06 GB audio snapshot. Set MMAG_DOWNLOAD_AUDIO=1 to download it."
fi

cat <<MSG
MMAG metadata download complete: $out

The three public manifests contain 3,974 main, 691 voice-cloning, and 1,828
timestamp-control rows. The dataset card declares CC BY 4.0 but also says
non-commercial research use; source clips derived from AudioCaps, VGGSound,
and MECAT retain their upstream terms. The evaluation pipeline remains a TODO.
MSG
