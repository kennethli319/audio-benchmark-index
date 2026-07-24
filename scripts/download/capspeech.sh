#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir capspeech)"
hf_repo="${CAPSPEECH_HF_REPO:-OpenSound/CapSpeech}"
repo_url="${CAPSPEECH_REPO_URL:-https://github.com/WangHelin1997/CapSpeech.git}"
raw_base_url="${CAPSPEECH_RAW_BASE_URL:-https://raw.githubusercontent.com/WangHelin1997/CapSpeech/main}"

download_url "$raw_base_url/README.md" "$out/README.md"
download_url "$raw_base_url/LICENSE" "$out/LICENSE"
download_url "https://huggingface.co/datasets/$hf_repo/raw/main/README.md" "$out/hf_README.md"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/hf_api.json"

if [[ "${CAPSPEECH_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/CapSpeech"
else
  echo "Skipping code clone. Set CAPSPEECH_CLONE_REPO=1 to clone/update it."
fi

if [[ "${CAPSPEECH_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "$hf_repo" "$out/hf"
else
  cat <<'EOF'
Downloaded CapSpeech documentation and API metadata only.

Set CAPSPEECH_DOWNLOAD_HF=1 to fetch the public Hugging Face metadata snapshot
(approximately 4.31 GB compressed and 10.09 GB after processing). The main
snapshot stores source audio paths rather than embedded recordings; obtain
audio from the listed upstream datasets and review each source's terms.
EOF
fi

echo "CapSpeech metadata download complete: $out"
