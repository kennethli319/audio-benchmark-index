#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir hyporadise)"
repo_api="https://api.github.com/repos/Hypotheses-Paradise/Hypo2Trans"
v0_base="https://huggingface.co/datasets/PeacefulData/HyPoradise-v0"
v0_api="https://huggingface.co/api/datasets/PeacefulData/HyPoradise-v0"
v1_base="https://huggingface.co/datasets/PeacefulData/HyPoradise-v1-GigaSpeech"
v1_api="https://huggingface.co/api/datasets/PeacefulData/HyPoradise-v1-GigaSpeech"
robust_base="https://huggingface.co/datasets/PeacefulData/Robust-HyPoradise"
robust_api="https://huggingface.co/api/datasets/PeacefulData/Robust-HyPoradise"

download_url "https://arxiv.org/abs/2309.15701" "$out/hyporadise-paper.html"
download_url "https://arxiv.org/abs/2401.10446" "$out/robust-hyporadise-paper.html"
download_url "https://arxiv.org/abs/2607.26410" "$out/voice-memory-paper.html"
download_url "$repo_api" "$out/hypo2trans-github-api.json"
download_url "$v0_base/raw/main/README.md" "$out/v0-README.md"
download_url "$v0_api" "$out/v0-hugging-face-api.json"
download_url "$v1_base/raw/main/README.md" "$out/v1-gigaspeech-README.md"
download_url "$v1_api" "$out/v1-gigaspeech-hugging-face-api.json"
download_url "$robust_base/raw/main/README.md" "$out/robust-README.md"
download_url "$robust_api" "$out/robust-hugging-face-api.json"
download_url "https://huggingface.co/api/models/huckiyang/voice-memory" "$out/voice-memory-hugging-face-api.json"

if [[ "${HYPORADISE_DOWNLOAD_V0:-0}" == "1" ]]; then
  hf_download_dataset "PeacefulData/HyPoradise-v0" "$out/v0"
else
  echo "Skipping the approximately 384 MB v0 snapshot. Set HYPORADISE_DOWNLOAD_V0=1 to download it."
fi

if [[ "${HYPORADISE_DOWNLOAD_V1:-0}" == "1" ]]; then
  hf_download_dataset "PeacefulData/HyPoradise-v1-GigaSpeech" "$out/v1-gigaspeech"
else
  echo "Skipping the approximately 40.8 MB GigaSpeech subset. Set HYPORADISE_DOWNLOAD_V1=1 to download it."
fi

if [[ "${HYPORADISE_DOWNLOAD_ROBUST:-0}" == "1" ]]; then
  hf_download_dataset "PeacefulData/Robust-HyPoradise" "$out/robust"
else
  echo "Skipping the approximately 115 MB Robust snapshot. Set HYPORADISE_DOWNLOAD_ROBUST=1 to download it."
fi

echo "Downloaded HyPoradise documentation and release metadata to: $out"
echo "The benchmark snapshots do not include upstream source-corpus audio."
