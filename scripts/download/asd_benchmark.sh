#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir asd_benchmark)"
repo="https://github.com/yucongzh/ASD_Benchmark"

download_url "https://arxiv.org/abs/2607.10596" "$out/paper.html"
download_url "https://raw.githubusercontent.com/yucongzh/ASD_Benchmark/master/README.md" \
  "$out/README.md"
download_url "https://raw.githubusercontent.com/yucongzh/ASD_Benchmark/master/LICENSE" \
  "$out/LICENSE"
download_url "https://api.github.com/repos/yucongzh/ASD_Benchmark" \
  "$out/repository.json"

if [[ "${ASD_BENCHMARK_CLONE_REPO:-0}" != "1" ]]; then
  cat <<EOF
Downloaded ASD Benchmark documentation and repository metadata only.
Set ASD_BENCHMARK_CLONE_REPO=1 to clone the small MIT evaluation toolkit.
Obtain DCASE 2020-2025 Task 2 audio from the official challenge links in
$out/README.md and review each release's data terms.
EOF
  echo "ASD Benchmark metadata download complete: $out"
  exit 0
fi

git_clone_if_missing "$repo" "$out/repo"
echo "ASD Benchmark toolkit clone complete: $out/repo"
