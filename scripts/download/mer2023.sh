#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir mer2023)"
repo_raw="https://raw.githubusercontent.com/CASIA-Affective-Computing-Group/MER2023-Baseline/master"

download_url "$repo_raw/README.md" "$out/README.md"
download_url \
  "https://api.github.com/repos/CASIA-Affective-Computing-Group/MER2023-Baseline" \
  "$out/github-repository.json"
download_url \
  "https://huggingface.co/api/datasets/MERChallenge/MER2023" \
  "$out/mer2023-huggingface-api.json"
download_url "https://arxiv.org/abs/2304.08981" "$out/arxiv-2304.08981.html"

manual_required \
  "MER2023" \
  "Saved official paper, repository, and public Hugging Face API metadata to $out." \
  "The roughly 140 GB dataset is request-gated and password-protected." \
  "Review and accept its CC BY-NC 4.0, academic-only, no-redistribution, and no-modification conditions:" \
  "https://huggingface.co/datasets/MERChallenge/MER2023" \
  "This helper intentionally does not request access or download benchmark files." \
  "Do not commit downloaded media, annotations, passwords, or access tokens."
