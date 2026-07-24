#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir mmae)"
hf_repo="${MMAE_HF_REPO:-BoJack/MMAE}"
repo_url="${MMAE_REPO_URL:-https://github.com/ddlBoJack/MMAE.git}"
raw_base_url="${MMAE_RAW_BASE_URL:-https://raw.githubusercontent.com/ddlBoJack/MMAE/main}"
repo_api_url="${MMAE_REPO_API_URL:-https://api.github.com/repos/ddlBoJack/MMAE}"

download_url "$raw_base_url/README.md" "$out/README.md"
download_url "$raw_base_url/LICENSE" "$out/LICENSE"
download_url "$repo_api_url" "$out/github-repo.json"
download_url "https://huggingface.co/datasets/$hf_repo/raw/main/README.md" "$out/hf_README.md"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/hf-dataset.json"

if [[ "${MMAE_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/MMAE"
else
  echo "Skipping evaluation repo clone. Set MMAE_CLONE_REPO=1 to clone/update it."
fi

if [[ "${MMAE_DOWNLOAD_HF:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded MMAE documentation and repository metadata only.
The public Hugging Face repository uses approximately 4.43 GB of storage and
contains benchmark audio, so the full snapshot is opt-in.

Set MMAE_DOWNLOAD_HF=1 to download the snapshot. The dataset card does not
declare a data license or identify source-audio licenses; review the underlying
media rights before reuse, redistribution, or commercial use.
EOF
  echo "MMAE metadata download complete: $out"
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/hf"
echo "MMAE requested download complete: $out"
