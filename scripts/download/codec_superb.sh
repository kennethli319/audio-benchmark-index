#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir codec_superb)"
repo_raw_url="${CODEC_SUPERB_REPO_RAW_URL:-https://raw.githubusercontent.com/voidful/Codec-SUPERB/main}"
hf_card_url="${CODEC_SUPERB_HF_CARD_URL:-https://huggingface.co/datasets/voidful/codec-superb-tiny/raw/main/README.md}"

download_url "$repo_raw_url/README.md" "$out/repository-README.md"
download_url "$hf_card_url" "$out/dataset-README.md"

if [[ "${CODEC_SUPERB_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "voidful/codec-superb-tiny" "$out/hf"
else
  cat <<'EOF'
Downloaded the official Codec-SUPERB repository and dataset documentation only.

Set CODEC_SUPERB_DOWNLOAD_HF=1 to fetch the public, ungated 6,000-row
codec-superb-tiny snapshot (approximately 3.2 GB). The dataset card does not
state a license or source-audio terms; review provenance before reuse.
EOF
fi

if [[ "${CODEC_SUPERB_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "https://github.com/voidful/Codec-SUPERB.git" "$out/repo"
fi

echo "Codec-SUPERB metadata download complete: $out"
