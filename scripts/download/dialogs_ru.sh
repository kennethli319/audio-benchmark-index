#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir dialogs_ru)"
repo="langswap/dialogs-ru-emotional-conversations"
base="https://huggingface.co/datasets/$repo"

download_url "$base/raw/main/README.md" "$out/README.md"
download_url "$base/raw/main/LICENSE.md" "$out/LICENSE.md"
download_url "https://huggingface.co/api/datasets/$repo" "$out/hf-api.json"
download_url "$base/resolve/main/val.csv" "$out/val.csv"
download_url "$base/resolve/main/test.csv" "$out/test.csv"

if [[ "${DIALOGS_RU_DOWNLOAD_PREVIEW:-0}" == "1" ]]; then
  download_url "$base/resolve/main/preview.parquet" "$out/preview.parquet"
fi

if [[ "${DIALOGS_RU_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "$repo" "$out/huggingface"
else
  cat <<'EOF'
Downloaded official documentation, API metadata, and validation/test tables.

Set DIALOGS_RU_DOWNLOAD_PREVIEW=1 for the approximately 29.3 MB, 60-item
embedded-audio preview. Set DIALOGS_RU_DOWNLOAD_HF=1 for the approximately
5.56 GB full corpus. Review the linked OpenRAIL responsible-use terms first.
EOF
fi

echo "Dialogs Russian corpus metadata download complete: $out"
