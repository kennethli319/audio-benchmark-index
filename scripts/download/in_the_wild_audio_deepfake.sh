#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir in_the_wild_audio_deepfake)"
hf_repo="${IN_THE_WILD_HF_REPO:-mueller91/In-The-Wild}"
hf_base="https://huggingface.co/datasets/$hf_repo"

download_url "https://deepfake-total.com/in_the_wild" "$out/official-page.html"
download_url "https://arxiv.org/abs/2203.16263" "$out/dataset-paper.html"
download_url "https://arxiv.org/abs/2607.20023" "$out/recent-evaluation-paper.html"
download_url "$hf_base/raw/main/README.md" "$out/dataset-card.md"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/huggingface-api.json"

if [[ "${IN_THE_WILD_DOWNLOAD_HF:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded In-the-Wild official pages, dataset card, and Hub metadata only.

Set IN_THE_WILD_DOWNLOAD_HF=1 to download the approximately 7.60 GiB public
Hugging Face snapshot. The owner page says Apache-2.0 while the current dataset
card says CC BY-SA 4.0; clarify the applicable terms before redistribution or
commercial use and review source-video, voice, likeness, and privacy rights.
EOF
  echo "In-the-Wild metadata download complete: $out"
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/huggingface"
echo "In-the-Wild Hugging Face snapshot complete: $out/huggingface"
