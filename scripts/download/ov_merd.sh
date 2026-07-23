#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir ov_merd)"
repo_root="https://raw.githubusercontent.com/zeroQiaoba/AffectGPT/master/OV-MER"

download_url "$repo_root/README.md" "$out/README.md"
download_url "$repo_root/LICENSE" "$out/LICENSE"
download_url \
  "https://api.github.com/repos/zeroQiaoba/AffectGPT" \
  "$out/github-repo.json"
download_url \
  "https://huggingface.co/api/datasets/MERChallenge/MER2025" \
  "$out/mer2025-api.json"
download_url "https://arxiv.org/abs/2410.01495" "$out/arxiv-2410.01495.html"

manual_required \
  "OV-MERD" \
  "Saved official documentation, repository metadata, and the public Hugging Face API response to $out." \
  "Benchmark media and annotation tables are gated through MER2025." \
  "Review and accept its CC BY-NC 4.0, academic-only, no-redistribution, and no-modification conditions:" \
  "https://huggingface.co/datasets/MERChallenge/MER2025" \
  "The Hugging Face API reports about 442 GB of repository storage; this helper intentionally does not download it." \
  "Do not commit downloaded media, annotations, or access tokens."
