#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir muchin)"
v1_hf="${MUCHIN_V1_HF_BASE_URL:-https://huggingface.co/datasets/karl-wang/MuChin1k}"
v1_repo_raw="${MUCHIN_V1_REPO_RAW_URL:-https://raw.githubusercontent.com/CarlWangChina/MuChin/main}"
v2_hf_repo="${MUCHIN_V2_HF_REPO:-karl-wang/MuChin-v2-6066}"
v2_repo_raw="${MUCHIN_V2_REPO_RAW_URL:-https://raw.githubusercontent.com/CarlWangChina/MuChin-V2-6066/main}"

download_url "$v1_repo_raw/README.md" "$out/v1-repository-README.md"
download_url "$v1_repo_raw/dataset/README.md" "$out/v1-dataset-README.md"
download_url "$v1_repo_raw/LICENSE" "$out/v1-LICENSE"
download_url "https://api.github.com/repos/CarlWangChina/MuChin" "$out/v1-github-repository.json"
download_url "$v1_hf/raw/main/README.md" "$out/v1-huggingface-README.md"
download_url "https://huggingface.co/api/datasets/karl-wang/MuChin1k" "$out/v1-huggingface-dataset.json"
download_url "$v2_repo_raw/README.md" "$out/v2-repository-README.md"
download_url "https://huggingface.co/api/datasets/$v2_hf_repo" "$out/v2-huggingface-dataset.json"

if [[ "${MUCHIN_DOWNLOAD_V1_ANNOTATIONS:-0}" == "1" ]]; then
  download_url \
    "$v1_hf/resolve/main/MuChin-1k-%E5%BC%80%E6%BA%90%E6%96%87%E6%9C%AC%E6%A0%87%E6%B3%A8.zip?download=true" \
    "$out/MuChin-1k-text-annotations.zip"
fi

if [[ "${MUCHIN_DOWNLOAD_V1_AUDIO:-0}" == "1" ]]; then
  download_url \
    "$v1_hf/resolve/main/MuChin-1000-mp3-audio.zip?download=true" \
    "$out/MuChin-1000-mp3-audio.zip"
fi

if [[ "${MUCHIN_DOWNLOAD_V2:-0}" == "1" ]]; then
  hf_download_dataset "$v2_hf_repo" "$out/v2-hf"
else
  cat <<'EOF'
Downloaded MuChin V1/V2 documentation and metadata only.

Set MUCHIN_DOWNLOAD_V1_ANNOTATIONS=1 for the approximately 20.9 MB public V1
annotation archive. Set MUCHIN_DOWNLOAD_V1_AUDIO=1 separately for the roughly
3.59 GB V1 MP3 archive. Set MUCHIN_DOWNLOAD_V2=1 only after accepting the
Hugging Face gate for the approximately 31.3 GB expanded release.

The owner restricts song audio to legally obtained academic use and prohibits
commercial model training without copyright-holder authorization. The MIT
repository/card label does not relicense the underlying songs or recordings.
EOF
fi

echo "MuChin requested download complete: $out"
