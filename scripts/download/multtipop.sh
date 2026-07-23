#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir multtipop)"
hf_base_url="${MULTTIPOP_HF_BASE_URL:-https://huggingface.co/datasets/gclef-cmu/multtipop}"
hf_api_url="${MULTTIPOP_HF_API_URL:-https://huggingface.co/api/datasets/gclef-cmu/multtipop}"
paper_url="${MULTTIPOP_PAPER_URL:-https://arxiv.org/abs/2607.08756}"
homepage_url="${MULTTIPOP_HOMEPAGE_URL:-https://gclef-cmu.org/multtipop}"

download_url "$hf_base_url/raw/main/README.md" "$out/dataset-README.md"
download_url "$hf_api_url" "$out/huggingface-dataset.json"
download_url "$hf_base_url/resolve/main/dev.json" "$out/dev.json"
download_url "$hf_base_url/resolve/main/test.json" "$out/test.json"
download_url "$hf_base_url/resolve/main/metadata.json" "$out/metadata.json"
download_url "$paper_url" "$out/paper.html"
download_url "$homepage_url" "$out/homepage.html"

if [[ "${MULTTIPOP_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "gclef-cmu/multtipop" "$out/hf"
else
  cat <<'EOF'
Downloaded MulTTiPop documentation and lightweight split metadata only.

Set MULTTIPOP_DOWNLOAD_HF=1 to fetch the public aligned MIDI/metadata snapshot.
The release does not include source audio. Its metadata references commercial
music segments on YouTube; obtain only authorized audio, follow platform and
music rights, and observe the authors' recommendation to use it for evaluation.
EOF
fi

echo "MulTTiPop metadata download complete: $out"
