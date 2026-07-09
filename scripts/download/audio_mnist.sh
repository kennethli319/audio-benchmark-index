#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir audio_mnist)"
raw_base="${AUDIO_MNIST_RAW_BASE_URL:-https://raw.githubusercontent.com/soerenab/AudioMNIST/master}"
repo_url="${AUDIO_MNIST_REPO_URL:-https://github.com/soerenab/AudioMNIST.git}"

download_url "$raw_base/README.md" "$out/README.md"
download_url "$raw_base/LICENSE" "$out/LICENSE"
download_url "$raw_base/data/audioMNIST_meta.txt" "$out/audioMNIST_meta.txt"

if [[ "${AUDIO_MNIST_DOWNLOAD_REPO:-0}" != "1" ]]; then
  echo "Downloaded AudioMNIST metadata to: $out"
  echo "Skipping full GitHub repository clone. Set AUDIO_MNIST_DOWNLOAD_REPO=1 to clone WAV files and examples."
  exit 0
fi

clone_or_update "$repo_url" "$out/AudioMNIST"
echo "AudioMNIST download complete: $out"
