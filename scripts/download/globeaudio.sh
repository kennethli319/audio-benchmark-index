#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir globeaudio)"
hf_repo="${GLOBEAUDIO_HF_REPO:-iNLP-Lab/GlobeAudio}"

download_url "https://huggingface.co/datasets/$hf_repo/raw/main/README.md" "$out/README.md"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/hf_api.json"
download_url "https://huggingface.co/api/datasets/$hf_repo/tree/main?recursive=true&expand=true&limit=100" "$out/hf_tree.json"

if [[ "${GLOBEAUDIO_DOWNLOAD_HF:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded GlobeAudio documentation and live Hugging Face metadata only.

The public snapshot contains 29 Parquet shards totaling approximately 12.54 GB.
The dataset card declares CC BY-NC 4.0, but the embedded clips derive from
YouTube media; review upstream rights, privacy, and platform terms separately.

Set GLOBEAUDIO_DOWNLOAD_HF=1 to request the full Hugging Face snapshot.
EOF
  echo "GlobeAudio metadata download complete: $out"
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/hf"

echo "GlobeAudio requested download complete: $out"
