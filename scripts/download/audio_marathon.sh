#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir audio_marathon)"
repo_url="${AUDIO_MARATHON_REPO_URL:-https://github.com/DabDans/AudioMarathon.git}"
hf_repo="${AUDIO_MARATHON_HF_REPO:-Hezep/AudioMarathon}"
hf_base="${AUDIO_MARATHON_HF_BASE_URL:-https://huggingface.co/datasets/$hf_repo}"

download_url "$hf_base/raw/main/README.md" "$out/dataset-README.md"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/huggingface-dataset.json"
download_url "$hf_base/resolve/main/test.csv" "$out/test.csv"
download_url "https://raw.githubusercontent.com/DabDans/AudioMarathon/main/README.md" "$out/project-README.md"
download_url "https://raw.githubusercontent.com/DabDans/AudioMarathon/main/LICENSE" "$out/repository-LICENSE"
download_url "https://api.github.com/repos/DabDans/AudioMarathon" "$out/github-repository.json"

if [[ "${AUDIO_MARATHON_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/AudioMarathon"
else
  echo "Skipping evaluation repo clone. Set AUDIO_MARATHON_CLONE_REPO=1 to clone/update it."
fi

if [[ "${AUDIO_MARATHON_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "$hf_repo" "$out/huggingface"
else
  echo "Skipping the approximately 58.75 GB dataset snapshot."
  echo "Set AUDIO_MARATHON_DOWNLOAD_HF=1 to download it."
fi

echo "AudioMarathon metadata download complete: $out"
