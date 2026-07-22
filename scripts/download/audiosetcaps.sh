#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir audiosetcaps)"
repo_id="${AUDIOSETCAPS_HF_REPO:-baijs/AudioSetCaps}"

hf_download_dataset "$repo_id" "$out" --include README.md

download_url \
  "https://api.github.com/repos/JishengBai/AudioSetCaps" \
  "$out/github-repository.json"
download_url \
  "https://huggingface.co/api/datasets/$repo_id" \
  "$out/huggingface-dataset.json"

if [[ "${AUDIOSETCAPS_DOWNLOAD_METADATA:-0}" == "1" ]]; then
  hf_download_dataset "$repo_id" "$out" --include 'Dataset/*.csv'
else
  cat >&2 <<'EOF'
Skipping AudioSetCaps caption and Q&A CSV files. The Hugging Face repository is
about 20.2 GB. Set AUDIOSETCAPS_DOWNLOAD_METADATA=1 to download Dataset/*.csv.
The release does not bundle the full AudioSet, YouTube-8M, or VGGSound audio.
EOF
fi

echo "AudioSetCaps documentation download complete: $out"
