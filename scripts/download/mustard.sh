#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir mustard)"
repo_raw="https://raw.githubusercontent.com/soujanyaporia/MUStARD/master"
hf_repo="MichiganNLP/MUStARD"

download_url "https://aclanthology.org/P19-1455/" "$out/paper.html"
download_url "$repo_raw/README.md" "$out/README.md"
download_url "$repo_raw/LICENSE" "$out/LICENSE"
download_url "$repo_raw/data/sarcasm_data.json" "$out/sarcasm_data.json"
download_url "$repo_raw/data/split_indices.p" "$out/split_indices.p"
download_url \
  "https://api.github.com/repos/soujanyaporia/MUStARD" \
  "$out/github-api.json"
download_url \
  "https://huggingface.co/datasets/$hf_repo/raw/main/README.md" \
  "$out/huggingface-card.md"
download_url \
  "https://huggingface.co/api/datasets/$hf_repo" \
  "$out/huggingface-api.json"

if [[ "${MUSTARD_DOWNLOAD_MEDIA:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded MUStARD documentation, labels, and official fold indices only.

Set MUSTARD_DOWNLOAD_MEDIA=1 to download the approximately 4.63 GB Hugging Face
snapshot containing TV-derived audiovisual clips and pre-extracted features.
The repository and dataset card say MIT, but that does not necessarily
relicense the third-party television excerpts. Review media rights first.
EOF
  echo "MUStARD metadata download complete: $out"
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/huggingface"
echo "MUStARD Hugging Face snapshot complete: $out/huggingface"
echo "Review third-party television-media rights before use or redistribution."
