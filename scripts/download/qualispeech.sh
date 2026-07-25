#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir qualispeech)"
hf_repo="${QUALISPEECH_HF_REPO:-tsinghua-ee/QualiSpeech}"
hf_base="https://huggingface.co/datasets/$hf_repo"

download_url "$hf_base/raw/main/README.md" "$out/dataset-card.md"
download_url "$hf_base/raw/main/download_bvcc.sh" "$out/download_bvcc.sh"
download_url "$hf_base/raw/main/merge_data.sh" "$out/merge_data.sh"
download_url "$hf_base/resolve/main/train.csv" "$out/train.csv"
download_url "$hf_base/resolve/main/val.csv" "$out/val.csv"
download_url "$hf_base/resolve/main/test.csv" "$out/test.csv"
download_url "$hf_base/resolve/main/train_bvcc.txt" "$out/train_bvcc.txt"
download_url "$hf_base/resolve/main/val_bvcc.txt" "$out/val_bvcc.txt"
download_url "$hf_base/resolve/main/test_bvcc.txt" "$out/test_bvcc.txt"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/huggingface-api.json"
download_url "https://arxiv.org/abs/2503.20290" "$out/paper.html"
download_url "https://arxiv.org/abs/2607.17079" "$out/salmonn-2-paper.html"

if [[ "${QUALISPEECH_DOWNLOAD_AUDIO:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded QualiSpeech documentation, scripts, annotations, and BVCC filename
lists only.

Set QUALISPEECH_DOWNLOAD_AUDIO=1 to download the approximately 1.46 GiB
non-BVCC WAV archive. BVCC/Blizzard audio is deliberately absent and must be
obtained separately under its original terms before using merge_data.sh.
EOF
  echo "QualiSpeech metadata download complete: $out"
  exit 0
fi

download_url "$hf_base/resolve/main/wav_part1.zip" "$out/wav_part1.zip"
echo "QualiSpeech non-BVCC audio download complete: $out"
echo "Obtain BVCC separately under its original terms before using merge_data.sh."
