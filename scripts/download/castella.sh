#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir castella)"
hf_repo="${CASTELLA_HF_REPO:-lighthouse-emnlp2024/CASTELLA}"
features_repo="${CASTELLA_FEATURES_HF_REPO:-lighthouse-emnlp2024/CASTELLA_CLAP_features}"
annotations_raw="${CASTELLA_ANNOTATIONS_RAW_URL:-https://raw.githubusercontent.com/line/CASTELLA/main}"
audio_repo="${CASTELLA_AUDIO_REPO_URL:-https://github.com/h-munakata/CASTELLA-audio.git}"

download_url "$annotations_raw/README.md" "$out/README.md"
download_url "$annotations_raw/LICENSE.md" "$out/LICENSE.md"
download_url "https://api.github.com/repos/line/CASTELLA" "$out/github-annotations-repo.json"
download_url "https://huggingface.co/datasets/$hf_repo/raw/main/README.md" "$out/huggingface-README.md"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/huggingface-dataset.json"
download_url "https://export.arxiv.org/api/query?id_list=2511.15131" "$out/paper-arxiv.xml"

for language in en ja; do
  for split in train val test; do
    download_url \
      "https://huggingface.co/datasets/$hf_repo/resolve/main/$language/$split.json" \
      "$out/annotations/$language/$split.json"
  done
done

if [[ "${CASTELLA_CLONE_AUDIO_TOOLS:-0}" == "1" ]]; then
  clone_or_update "$audio_repo" "$out/CASTELLA-audio"
else
  echo "Skipping raw-media tools. Set CASTELLA_CLONE_AUDIO_TOOLS=1 to clone them."
  echo "The tool repository has no stated license; YouTube media rights and availability still apply."
fi

if [[ "${CASTELLA_DOWNLOAD_FEATURES:-0}" == "1" ]]; then
  hf_download_dataset "$features_repo" "$out/clap-features"
else
  echo "Skipping the approximately 2.78 GB CLAP feature snapshot."
  echo "Set CASTELLA_DOWNLOAD_FEATURES=1 to download it."
fi

echo "CASTELLA annotations and metadata download complete: $out"
