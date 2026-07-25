#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir mer2024)"
repo_raw="https://raw.githubusercontent.com/zeroQiaoba/MERTools/master/MER2024"

download_url "$repo_raw/README.md" "$out/README.md"
download_url \
  "https://api.github.com/repos/zeroQiaoba/MERTools" \
  "$out/github-repository.json"
download_url \
  "https://huggingface.co/api/datasets/MERChallenge/MER2024" \
  "$out/mer2024-huggingface-api.json"
download_url \
  "https://huggingface.co/api/datasets/MERChallenge/MER2024/tree/main?recursive=true&expand=true" \
  "$out/mer2024-huggingface-tree.json"
download_url "https://arxiv.org/abs/2404.17113" "$out/arxiv-2404.17113.html"
download_url \
  "https://zeroqiaoba.github.io/MER2024-website/" \
  "$out/challenge.html"

manual_required \
  "MER2024" \
  "Saved official paper, project, repository, and public Hugging Face metadata to $out." \
  "The approximately 218.4 GB dataset is request-gated." \
  "Review and accept its CC BY-NC 4.0, academic-only, non-commercial, no-redistribution, no-modification, and no-upload conditions:" \
  "https://huggingface.co/datasets/MERChallenge/MER2024" \
  "This helper intentionally does not request access or download benchmark files." \
  "Do not commit downloaded media, annotations, or access tokens."
