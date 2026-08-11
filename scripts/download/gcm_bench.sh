#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir gcm_bench)"
repo_url="https://github.com/CodeForZzc/GCM-Bench"
raw_base="https://raw.githubusercontent.com/CodeForZzc/GCM-Bench/main"

download_url "https://arxiv.org/abs/2608.07631" "$out/arxiv-2608.07631.html"
download_url "https://api.github.com/repos/CodeForZzc/GCM-Bench" "$out/github-api.json"
download_url "$raw_base/README.md" "$out/github-README.md"
download_url "$raw_base/LICENSE" "$out/LICENSE"
download_url "$raw_base/THIRD_PARTY_NOTICES.md" "$out/THIRD_PARTY_NOTICES.md"
download_url "$raw_base/raa_bench/data/samples.json" "$out/samples.json"
download_url "$raw_base/raa_bench/data/scenarios.json" "$out/scenarios.json"

if [[ "${GCM_BENCH_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/repository"
else
  echo "Skipping the repository and roughly 130 MB of WAV files. Set GCM_BENCH_CLONE_REPO=1 to clone it."
fi

echo "Downloaded GCM-Bench documentation, metadata, and lightweight manifests to: $out"
echo "End-to-end inference and judging require user-supplied DashScope/Qwen credentials."
