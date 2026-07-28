#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir mecat)"
repo_raw="https://raw.githubusercontent.com/xiaomi-research/mecat/main"

download_url "$repo_raw/README.md" "$out/repository-README.md"
download_url "$repo_raw/LICENSE" "$out/repository-LICENSE"
download_url \
  "https://huggingface.co/datasets/mispeech/MECAT-Caption/raw/main/README.md" \
  "$out/MECAT-Caption-README.md"
download_url \
  "https://huggingface.co/api/datasets/mispeech/MECAT-Caption" \
  "$out/MECAT-Caption-api.json"
download_url \
  "https://huggingface.co/datasets/mispeech/MECAT-QA/raw/main/README.md" \
  "$out/MECAT-QA-README.md"
download_url \
  "https://huggingface.co/api/datasets/mispeech/MECAT-QA" \
  "$out/MECAT-QA-api.json"
download_url "https://arxiv.org/abs/2507.23511" "$out/paper.html"

if [[ "${MECAT_DOWNLOAD_CAPTION:-0}" == "1" ]]; then
  hf_download_dataset "mispeech/MECAT-Caption" "$out/MECAT-Caption"
fi

if [[ "${MECAT_DOWNLOAD_QA:-0}" == "1" ]]; then
  hf_download_dataset "mispeech/MECAT-QA" "$out/MECAT-QA"
fi

if [[ "${MECAT_DOWNLOAD_CAPTION:-0}" != "1" && "${MECAT_DOWNLOAD_QA:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded official MECAT metadata and documentation only.

Set MECAT_DOWNLOAD_CAPTION=1 to fetch the approximately 16.2 GB public
MECAT-Caption snapshot. Set MECAT_DOWNLOAD_QA=1 to fetch the approximately
42.4 GB public MECAT-QA snapshot. The datasets are separate task tracks within
one MECAT benchmark family and both cards declare CC BY 3.0.
EOF
fi

echo "MECAT download complete: $out"
