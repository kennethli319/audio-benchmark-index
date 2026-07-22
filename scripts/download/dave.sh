#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir dave)"
raw_repo="${DAVE_RAW_REPO:-https://raw.githubusercontent.com/gorjanradevski/dave/main}"
hf_repo="${DAVE_HF_REPO:-gorjanradevski/dave}"

download_url "$raw_repo/README.md" "$out/README.md"
download_url "https://huggingface.co/datasets/$hf_repo/raw/main/README.md" "$out/hf_README.md"
download_url "https://huggingface.co/datasets/$hf_repo/resolve/main/dave.py" "$out/dave.py"
download_url "https://huggingface.co/datasets/$hf_repo/resolve/main/epic.json" "$out/epic.json"
download_url "https://huggingface.co/datasets/$hf_repo/resolve/main/ego4d.json" "$out/ego4d.json"

if [[ "${DAVE_DOWNLOAD_HF:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded DAVE documentation, loader, and JSON annotations only. The public
Hugging Face repository uses about 113.3 GB and includes media derived from
EPIC-KITCHENS and Ego4D, whose upstream terms still apply.

Set DAVE_DOWNLOAD_HF=1 to request the full snapshot.
EOF
  echo "DAVE metadata download complete: $out"
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/hf"

echo "DAVE requested download complete: $out"
