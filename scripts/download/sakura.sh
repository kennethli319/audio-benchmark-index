#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir sakura)"
repo_api_url="${SAKURA_REPO_API_URL:-https://api.github.com/repos/ckyang1124/SAKURA}"
raw_base_url="${SAKURA_RAW_BASE_URL:-https://raw.githubusercontent.com/ckyang1124/SAKURA/main}"
repo_url="${SAKURA_REPO_URL:-https://github.com/ckyang1124/SAKURA.git}"

download_url "$raw_base_url/README.md" "$out/README.md"
download_url "$raw_base_url/data/README.md" "$out/data-README.md"
download_url "$raw_base_url/evaluation/README.md" "$out/evaluation-README.md"
download_url "$repo_api_url" "$out/github-repo.json"
download_url "$repo_api_url/git/trees/main?recursive=1" "$out/github-tree.json"

for track in GenderQA LanguageQA EmotionQA AnimalQA; do
  download_url "https://huggingface.co/api/datasets/SLLM-multi-hop/$track" \
    "$out/huggingface-$track.json"
done

case "${SAKURA_DOWNLOAD_TRACK:-}" in
  "")
    ;;
  GenderQA|LanguageQA|EmotionQA|AnimalQA)
    track="${SAKURA_DOWNLOAD_TRACK}"
    hf_download_dataset "SLLM-multi-hop/$track" "$out/$track"
    ;;
  all)
    for track in GenderQA LanguageQA EmotionQA AnimalQA; do
      hf_download_dataset "SLLM-multi-hop/$track" "$out/$track"
    done
    ;;
  *)
    echo "SAKURA_DOWNLOAD_TRACK must be GenderQA, LanguageQA, EmotionQA, AnimalQA, or all." >&2
    exit 2
    ;;
esac

if [[ "${SAKURA_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/SAKURA"
fi

echo "Downloaded SAKURA documentation and metadata to: $out"
echo "No explicit data or code license is published; review every upstream source's terms."
if [[ -z "${SAKURA_DOWNLOAD_TRACK:-}" && "${SAKURA_CLONE_REPO:-0}" != "1" ]]; then
  echo "Set SAKURA_DOWNLOAD_TRACK to a track name or all to download audio."
  echo "Set SAKURA_CLONE_REPO=1 to clone the official repository and evaluator."
fi
