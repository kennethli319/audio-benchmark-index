#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir mcr_bench)"
raw_base_url="${MCR_BENCH_RAW_BASE_URL:-https://raw.githubusercontent.com/WangCheng0116/MCR-BENCH/main}"
repo_api_url="${MCR_BENCH_REPO_API_URL:-https://api.github.com/repos/WangCheng0116/MCR-BENCH}"
repo_url="${MCR_BENCH_REPO_URL:-https://github.com/WangCheng0116/MCR-BENCH.git}"

download_url "$raw_base_url/README.md" "$out/README.md"
download_url "$raw_base_url/LICENSE.txt" "$out/LICENSE.txt"
download_url "$repo_api_url" "$out/github-repo.json"

echo "MCR-Bench data is a public manual download:"
echo "https://drive.google.com/file/d/1nXJCx8Neqdm0WMfe9Uq6sX2bvk_3FWUG/view"

if [[ "${MCR_BENCH_CLONE_REPO:-0}" != "1" ]]; then
  echo "Downloaded MCR-Bench docs and repository metadata to: $out"
  echo "Set MCR_BENCH_CLONE_REPO=1 to clone the small documentation repository."
  exit 0
fi

clone_or_update "$repo_url" "$out/MCR-BENCH"
echo "MCR-Bench repository clone complete: $out/MCR-BENCH"
