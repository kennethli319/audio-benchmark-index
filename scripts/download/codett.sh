#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir codett)"
repo_url="${CODETT_REPO_URL:-https://github.com/YingaoWang-casia/CoDeTT.github.io.git}"
raw_base="${CODETT_RAW_BASE_URL:-https://raw.githubusercontent.com/YingaoWang-casia/CoDeTT.github.io/main}"
hf_repo="${CODETT_HF_REPO:-YingaoWang-casia/CoDeTT}"

download_url "$raw_base/README_EN.md" "$out/README_EN.md"
download_url "https://api.github.com/repos/YingaoWang-casia/CoDeTT.github.io" "$out/github-repository.json"
download_url "https://huggingface.co/datasets/$hf_repo/raw/main/README.md" "$out/huggingface-README.md"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/huggingface-dataset.json"

if [[ "${CODETT_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/CoDeTT.github.io"
else
  echo "Skipping evaluation repo clone. Set CODETT_CLONE_REPO=1 to clone/update it."
fi

if [[ "${CODETT_DOWNLOAD_HF:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded CoDeTT documentation and repository metadata only.
The public Hugging Face release contains a single approximately 51.1 GB LZ4
archive. Set CODETT_DOWNLOAD_HF=1 to download it explicitly.
EOF
  echo "CoDeTT metadata download complete: $out"
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/huggingface" --include "CoDeTT.lz4"
echo "CoDeTT requested download complete: $out/huggingface"
