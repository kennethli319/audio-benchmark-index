#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir spearbench)"
repo_base_url="${SPEARBENCH_REPO_BASE_URL:-https://raw.githubusercontent.com/thomasthebaud/SPEAR-benchmark-website/main}"
repo_api_url="${SPEARBENCH_REPO_API_URL:-https://api.github.com/repos/thomasthebaud/SPEAR-benchmark-website}"
paper_url="${SPEARBENCH_PAPER_URL:-https://arxiv.org/abs/2607.05365}"

download_url "$repo_base_url/README.md" "$out/repository-README.md"
download_url "$repo_base_url/LICENSE" "$out/repository-LICENSE"
download_url "$repo_base_url/benchmark.csv" "$out/benchmark.csv"
download_url "$repo_base_url/metadata-example.csv" "$out/metadata-example.csv"
download_url "$repo_base_url/inference_help_code/README.md" "$out/inference-help-README.md"
download_url "$repo_api_url" "$out/github-api.json"
download_url "$paper_url" "$out/arxiv-2607.05365.html"

cat <<'MSG'
SPEARBench metadata download complete.

The public benchmark audio package is linked from the official project's
"Add Your Model" page:
  https://thomasthebaud.github.io/SPEAR-benchmark-website/#add-your-model

Download that package manually and preserve its directory structure. The
repository's MIT license covers the website/helper code, but no separate
license is stated for the Seamless Interaction-derived benchmark audio.
Review the source corpus and download-package terms before use or redistribution.
MSG
