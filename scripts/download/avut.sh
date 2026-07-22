#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir avut)"
raw_base="${AVUT_RAW_BASE_URL:-https://raw.githubusercontent.com/lark-png/AVUT/main}"
hf_repo="${AVUT_HF_REPO:-tsinghua-ee/AVUTBenchmark}"

download_url "$raw_base/README.md" "$out/README.md"
download_url "https://huggingface.co/datasets/$hf_repo/raw/main/README.md" "$out/hf_README.md"

for annotation in \
  AV_Human_data.json \
  AV_Human_filtered_data.json \
  AV_Gemini_data.json \
  AV_Gemini_filtered_data.json; do
  download_url "https://huggingface.co/datasets/$hf_repo/resolve/main/$annotation" "$out/$annotation"
done

if [[ "${AVUT_DOWNLOAD_HF:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded AVUT documentation and annotation JSON only. The public Hugging Face
repository uses approximately 24.0 GB and appears to include YouTube-derived
video files, although the paper says AVUT distributes links rather than copies.
No data or code license is stated.

Set AVUT_DOWNLOAD_HF=1 to request the full snapshot after reviewing source-video
rights, YouTube terms, and the release discrepancy.
EOF
  echo "AVUT metadata download complete: $out"
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/hf"

echo "AVUT requested download complete: $out"
