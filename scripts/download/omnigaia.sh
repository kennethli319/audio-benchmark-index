#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir omnigaia)"
raw_base="${OMNIGAIA_RAW_BASE_URL:-https://raw.githubusercontent.com/RUC-NLPIR/OmniGAIA/main}"
repo_url="${OMNIGAIA_REPO_URL:-https://github.com/RUC-NLPIR/OmniGAIA.git}"
hf_repo="${OMNIGAIA_HF_REPO:-RUC-NLPIR/OmniGAIA}"

download_url "$raw_base/README.md" "$out/README.md"
download_url "https://huggingface.co/datasets/$hf_repo/raw/main/README.md" "$out/hf_README.md"
download_url "https://huggingface.co/datasets/$hf_repo/resolve/main/test_metadata.json" "$out/test_metadata.json"

if [[ "${OMNIGAIA_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/OmniGAIA"
else
  echo "Skipping evaluation repo clone. Set OMNIGAIA_CLONE_REPO=1 to clone/update it."
fi

if [[ "${OMNIGAIA_DOWNLOAD_HF:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded OmniGAIA docs and lightweight test metadata only. The public,
ungated Hugging Face snapshot uses about 9.9 GB and includes audio, image, and
video media, so it is opt-in.

Set OMNIGAIA_DOWNLOAD_HF=1 to download the full dataset snapshot. The HF card
declares Apache-2.0, but the benchmark curates media from multiple upstream
datasets; verify component rights before redistribution or commercial use.
EOF
  echo "OmniGAIA metadata download complete: $out"
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/hf"

echo "OmniGAIA requested download complete: $out"
