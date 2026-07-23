#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir audio_alpaca)"
dataset="https://huggingface.co/datasets/declare-lab/audio-alpaca"
repo_raw="https://raw.githubusercontent.com/declare-lab/tango/master"

download_url "$dataset/raw/main/README.md" "$out/README.md"
download_url "https://huggingface.co/api/datasets/declare-lab/audio-alpaca" "$out/huggingface-api.json"
download_url "$repo_raw/README.md" "$out/tango-README.md"
download_url "$repo_raw/LICENSE.md" "$out/tango-LICENSE.md"
download_url "https://arxiv.org/abs/2404.09956" "$out/tango2-paper.html"
download_url "https://arxiv.org/abs/2607.20166" "$out/audio-zero-paper.html"

if [[ "${AUDIO_ALPACA_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "declare-lab/audio-alpaca" "$out/hf"
else
  cat <<'EOF'
Downloaded official metadata and documentation only.

Set AUDIO_ALPACA_DOWNLOAD_HF=1 to fetch the public, ungated Hugging Face
snapshot (approximately 9.71 GB). The HF card declares Apache-2.0, while the
linked official Tango repository uses CC BY-NC-ND 4.0; apply the stricter
interpretation and review AudioCaps-derived caption and generated-audio rights.
EOF
fi

echo "Audio-Alpaca metadata download complete: $out"
