#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir seamless_interaction)"
repo_raw="https://raw.githubusercontent.com/facebookresearch/seamless_interaction/main"
repo_url="https://github.com/facebookresearch/seamless_interaction.git"
dataset="https://huggingface.co/datasets/facebook/seamless-interaction"

download_url "$repo_raw/README.md" "$out/repository-README.md"
download_url "$repo_raw/LICENSE" "$out/repository-LICENSE"
download_url \
  "https://api.github.com/repos/facebookresearch/seamless_interaction" \
  "$out/repository-api.json"
download_url "$dataset/raw/main/README.md" "$out/dataset-card.md"
download_url \
  "https://huggingface.co/api/datasets/facebook/seamless-interaction" \
  "$out/huggingface-api.json"

if [[ "${SEAMLESS_INTERACTION_DOWNLOAD_METADATA:-0}" == "1" ]]; then
  download_url "$repo_raw/assets/filelist.csv" "$out/metadata/filelist.csv"
  download_url "$repo_raw/assets/interactions.csv" "$out/metadata/interactions.csv"
  download_url "$repo_raw/assets/participants.csv" "$out/metadata/participants.csv"
  download_url "$repo_raw/assets/relationships.csv" "$out/metadata/relationships.csv"
fi

if [[ "${SEAMLESS_INTERACTION_CLONE_TOOLKIT:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/seamless_interaction"
fi

if [[ "${SEAMLESS_INTERACTION_DOWNLOAD_METADATA:-0}" != "1" && \
      "${SEAMLESS_INTERACTION_CLONE_TOOLKIT:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded official Seamless Interaction documentation, metadata, and license.

Set SEAMLESS_INTERACTION_DOWNLOAD_METADATA=1 to fetch approximately 9.3 MB of
official CSV indexes. Set SEAMLESS_INTERACTION_CLONE_TOOLKIT=1 to clone the
roughly 36 MB browser/downloader toolkit. Use that toolkit or the official
Hugging Face page to select individual interactions or batches. This helper
does not download the roughly 27 TB full dataset or any approximately 50 GB
batch. The release is CC BY-NC 4.0 and contains human audiovisual interaction
data; review its privacy, consent, and responsible-use implications.
EOF
fi

echo "Seamless Interaction metadata download complete: $out"
