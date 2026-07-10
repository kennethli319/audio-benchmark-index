#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir air_bench)"
raw_base_url="${AIR_BENCH_RAW_BASE_URL:-https://raw.githubusercontent.com/OFA-Sys/AIR-Bench/main}"
repo_url="${AIR_BENCH_REPO_URL:-https://github.com/OFA-Sys/AIR-Bench.git}"
hf_repo="${AIR_BENCH_HF_REPO:-qyang1021/AIR-Bench-Dataset}"

download_url "$raw_base_url/README.md" "$out/README.md"
download_url "https://huggingface.co/datasets/$hf_repo/raw/main/README.md" "$out/hf_README.md"

if [[ "${AIR_BENCH_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/AIR-Bench"
else
  echo "Skipping AIR-Bench evaluation repo clone. Set AIR_BENCH_CLONE_REPO=1 to clone/update it."
fi

if [[ "${AIR_BENCH_DOWNLOAD_HF:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded AIR-Bench docs only. The Hugging Face dataset snapshot contains
audio and is large, so it is opt-in.

Set AIR_BENCH_DOWNLOAD_HF=1 to download qyang1021/AIR-Bench-Dataset.
EOF
  echo "AIR-Bench metadata download complete: $out"
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/hf"

echo "AIR-Bench requested download complete: $out"
