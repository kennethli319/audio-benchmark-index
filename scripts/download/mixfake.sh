#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir mixfake)"
hf_repo="${MIXFAKE_HF_REPO:-Tnxts/MixFake}"
github_repo="${MIXFAKE_GITHUB_REPO:-https://github.com/saltfish233/MixFake}"

download_url "https://arxiv.org/abs/2605.23201" "$out/paper.html"
download_url \
  "https://raw.githubusercontent.com/saltfish233/MixFake/main/README.md" \
  "$out/repository-README.md"
download_url \
  "https://api.github.com/repos/saltfish233/MixFake" \
  "$out/repository-api.json"
download_url \
  "https://huggingface.co/datasets/${hf_repo}/raw/main/README.md" \
  "$out/huggingface-README.md"
download_url \
  "https://huggingface.co/api/datasets/${hf_repo}?blobs=true" \
  "$out/huggingface-api.json"

if [[ "${MIXFAKE_DOWNLOAD_DATA:-0}" == "1" ]]; then
  hf_download_dataset "$hf_repo" "$out/huggingface-data"
fi

if [[ "${MIXFAKE_CLONE_TOOLKIT:-0}" == "1" ]]; then
  clone_or_update "$github_repo" "$out/repository"
fi

if [[ "${MIXFAKE_DOWNLOAD_DATA:-0}" != "1" ]] &&
   [[ "${MIXFAKE_CLONE_TOOLKIT:-0}" != "1" ]]; then
  cat <<EOF
Downloaded MixFake paper, first-party documentation, and repository/Hub
metadata to:
$out

The public dataset is split across 67 7-Zip volumes totaling approximately
66.7 GiB. Set MIXFAKE_DOWNLOAD_DATA=1 to fetch the snapshot. Set
MIXFAKE_CLONE_TOOLKIT=1 to clone the baseline code and released score files.
EOF
  exit 0
fi

echo "MixFake requested downloads complete: $out"
