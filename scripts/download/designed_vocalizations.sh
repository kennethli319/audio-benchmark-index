#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir designed_vocalizations)"
hf_repo="${DESIGNED_VOCALIZATIONS_HF_REPO:-NCSOFT/Designed-Vocalizations-Dataset}"
hf_raw_base="https://huggingface.co/datasets/$hf_repo/raw/main"

download_url "https://arxiv.org/abs/2607.20951" "$out/paper.html"
download_url \
  "https://ncai-official.github.io/speech/publications/designed-vocalizations-dataset/" \
  "$out/project.html"
download_url "$hf_raw_base/README.md" "$out/dataset-card.md"
download_url "$hf_raw_base/LICENSE.md" "$out/LICENSE.md"
download_url "$hf_raw_base/NOTICE" "$out/NOTICE"
download_url "$hf_raw_base/metadata/preset_info.csv" "$out/preset_info.csv"
download_url "$hf_raw_base/metadata/preset_chains.json" "$out/preset_chains.json"
download_url "$hf_raw_base/metadata/test_pairs.csv" "$out/test_pairs.csv"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/huggingface-api.json"

if [[ "${DESIGNED_VOCALIZATIONS_DOWNLOAD_HF:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded Designed Vocalizations Dataset documentation and lightweight
metadata only.

Set DESIGNED_VOCALIZATIONS_DOWNLOAD_HF=1 to download the approximately 37.1 GB
Hugging Face snapshot with embedded audio. Preserve NOTICE and each raw row's
license and attribution fields when redistributing source or designed clips.
EOF
  echo "Designed Vocalizations metadata download complete: $out"
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/huggingface"
echo "Designed Vocalizations Hugging Face snapshot complete: $out/huggingface"
echo "Preserve NOTICE and all per-source license and attribution metadata."
