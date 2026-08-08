#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir voxparadox)"
hf_repo="${VOXPARADOX_HF_REPO:-IHP-Lab/VoxParadox}"
repo_url="${VOXPARADOX_REPO_URL:-https://github.com/ihp-lab/VoxParadox.git}"

download_url "https://huggingface.co/datasets/$hf_repo/raw/main/README.md" "$out/dataset_README.md"
download_url "https://huggingface.co/datasets/$hf_repo/raw/main/LICENSE" "$out/dataset_LICENSE"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/huggingface-dataset.json"
download_url "https://huggingface.co/datasets/$hf_repo/resolve/main/metadata.jsonl" "$out/metadata.jsonl"
download_url "https://huggingface.co/datasets/$hf_repo/resolve/main/voxparadox.json" "$out/voxparadox.json"
download_url "https://huggingface.co/datasets/$hf_repo/resolve/main/eval.py" "$out/eval.py"
download_url "https://api.github.com/repos/ihp-lab/VoxParadox" "$out/github-repo.json"
download_url "https://raw.githubusercontent.com/ihp-lab/VoxParadox/main/README.md" "$out/repository_README.md"

if [[ "${VOXPARADOX_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "$hf_repo" "$out/hf"
else
  echo "Skipping the approximately 1.34 GB Hub snapshot. Set VOXPARADOX_DOWNLOAD_HF=1 to download it."
fi

if [[ "${VOXPARADOX_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/VoxParadox"
else
  echo "Skipping the code repository clone. Set VOXPARADOX_CLONE_REPO=1 to clone it."
fi

cat <<'EOF'
The custom USC Research License permits educational, research, and non-profit
use; commercial use requires a separate license. The dataset card also says
commercial reuse of synthesized audio is subject to the TTS vendors' terms.
EOF

echo "VoxParadox download complete: $out"
