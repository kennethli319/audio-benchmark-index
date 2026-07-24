#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir madb)"
hf_base_url="${MADB_HF_BASE_URL:-https://huggingface.co/datasets/sirui1/MADB-Dataset}"
hf_api_url="${MADB_HF_API_URL:-https://huggingface.co/api/datasets/sirui1/MADB-Dataset}"
repo_raw_url="${MADB_REPO_RAW_URL:-https://raw.githubusercontent.com/knownree/madb/main}"
repo_api_url="${MADB_REPO_API_URL:-https://api.github.com/repos/knownree/madb}"
paper_url="${MADB_PAPER_URL:-https://arxiv.org/abs/2607.06929}"

download_url "$hf_base_url/raw/main/README.md" "$out/dataset-README.md"
download_url "$hf_api_url" "$out/huggingface-dataset.json"
download_url "$repo_raw_url/README.md" "$out/repository-README.md"
download_url "$repo_api_url" "$out/github-repository.json"
download_url "$paper_url" "$out/paper.html"

if [[ "${MADB_DOWNLOAD_ANNOTATIONS:-0}" == "1" ]]; then
  download_url "$hf_base_url/resolve/main/data/annotation/song_avg_scores.csv" "$out/song_avg_scores.csv"
  download_url "$hf_base_url/resolve/main/data/annotation/MADB_data.csv" "$out/MADB_data.csv"
  download_url "$hf_base_url/resolve/main/data/annotation/split_val_seed5.csv" "$out/split_val_seed5.csv"
fi

if [[ "${MADB_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "sirui1/MADB-Dataset" "$out/hf"
else
  cat <<'EOF'
Downloaded MADB documentation and repository metadata only.

Set MADB_DOWNLOAD_ANNOTATIONS=1 to fetch the approximately 69 MB annotation
tables. Set MADB_DOWNLOAD_HF=1 to fetch the approximately 18.6 GB public
Hugging Face snapshot, including 1,730 audio tracks.

The card declares CC BY-NC 4.0 and research-only use but warns that original
audio copyright restrictions remain. Review MuChin, generator service/output,
and unidentified online-source rights before redistributing or using audio.
EOF
fi

echo "MADB requested download complete: $out"
