#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir realman)"
repo="AISHELL/RealMAN"
github_raw_url="${REALMAN_GITHUB_RAW_URL:-https://raw.githubusercontent.com/Audio-WestlakeU/RealMAN/main}"
github_api_url="${REALMAN_GITHUB_API_URL:-https://api.github.com/repos/Audio-WestlakeU/RealMAN}"
hf_api_url="${REALMAN_HF_API_URL:-https://huggingface.co/api/datasets/$repo}"

download_url "$github_raw_url/README.md" "$out/README.md"
download_url "$github_api_url" "$out/github-api.json"
download_url "$hf_api_url" "$out/huggingface-api.json"
download_url "https://arxiv.org/abs/2406.19959" "$out/arxiv-2406.19959.html"
download_url "https://arxiv.org/abs/2607.18658" "$out/arxiv-2607.18658.html"

if [[ "${REALMAN_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "$repo" "$out/hf"
else
  cat <<'EOF'
Downloaded RealMAN documentation and repository metadata only.

Set REALMAN_DOWNLOAD_HF=1 to fetch the public, ungated Hugging Face snapshot.
The API currently reports approximately 812 GB of repository storage. Confirm
capacity and preserve the dataset's CC BY 4.0 attribution before opting in.
EOF
fi

echo "RealMAN metadata download complete: $out"
