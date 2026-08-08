#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir speechparaling_bench)"
hf_repo="${SPEECHPARALING_BENCH_HF_REPO:-Ruohan2/SpeechParaling-Bench}"
repo_url="${SPEECHPARALING_BENCH_REPO_URL:-https://github.com/Northern-byte-bit/SpeechParaling-Bench.git}"

download_url "https://huggingface.co/datasets/$hf_repo/raw/main/README.md" "$out/dataset_README.md"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/huggingface-dataset.json"
download_url "https://api.github.com/repos/Northern-byte-bit/SpeechParaling-Bench" "$out/github-repo.json"
download_url "https://api.github.com/repos/Northern-byte-bit/SpeechParaling-Bench/git/trees/main?recursive=1" "$out/github-tree.json"
download_url "https://raw.githubusercontent.com/Northern-byte-bit/SpeechParaling-Bench/main/README.md" "$out/repository_README.md"

if [[ "${SPEECHPARALING_BENCH_DOWNLOAD_MANIFESTS:-0}" == "1" ]]; then
  hf_download_dataset "$hf_repo" "$out/hf-manifests" \
    --include "README.md" \
    --include "test/ch/metadata.jsonl" \
    --include "test/en/metadata.jsonl"
else
  echo "Skipping the two released metadata manifests. Set SPEECHPARALING_BENCH_DOWNLOAD_MANIFESTS=1 to download them."
fi

if [[ "${SPEECHPARALING_BENCH_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "$hf_repo" "$out/hf"
else
  echo "Skipping the approximately 1.66 GB Hub snapshot. Set SPEECHPARALING_BENCH_DOWNLOAD_HF=1 to download it."
fi

if [[ "${SPEECHPARALING_BENCH_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/SpeechParaling-Bench"
else
  echo "Skipping the code and result clone. Set SPEECHPARALING_BENCH_CLONE_REPO=1 to clone it."
fi

cat <<'EOF'
The dataset card declares Apache-2.0, but the code repository has no detected
license. Treat the code, baseline generations, and judge result files as
rights-unspecified unless the owners publish separate terms.
EOF

echo "SpeechParaling-Bench download complete: $out"
