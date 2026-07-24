#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir interpet4d)"
dataset="ohicarip/interpet4d"

download_url \
  "https://huggingface.co/datasets/$dataset/raw/main/README.md" \
  "$out/README.md"
download_url \
  "https://huggingface.co/api/datasets/$dataset" \
  "$out/huggingface-api.json"

if [[ "${INTERPET4D_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "$dataset" "$out/huggingface"
else
  cat <<'EOF'
Downloaded official InterPet4D documentation and API metadata only.

Set INTERPET4D_DOWNLOAD_HF=1 to download the approximately 10.7 GB audio and
motion snapshot. The public card declares CC BY-NC 4.0, while the paper states
additional data-use restrictions, including no redistribution, surveillance,
or biometric identification. Apply the stricter paper terms pending
clarification.
EOF
fi

echo "InterPet4D metadata download complete: $out"
