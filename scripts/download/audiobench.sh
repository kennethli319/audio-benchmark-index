#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir audiobench)"
raw_base_url="${AUDIOBENCH_RAW_BASE_URL:-https://raw.githubusercontent.com/AudioLLMs/AudioBench/main}"
repo_api_url="${AUDIOBENCH_REPO_API_URL:-https://api.github.com/repos/AudioLLMs/AudioBench}"
repo_url="${AUDIOBENCH_REPO_URL:-https://github.com/AudioLLMs/AudioBench.git}"

download_url "$raw_base_url/README.md" "$out/README.md"
download_url "$raw_base_url/examples/supported_datasets.md" "$out/supported_datasets.md"
download_url "$raw_base_url/LICENSE" "$out/LICENSE"
download_url "$repo_api_url" "$out/github-repository.json"

if [[ "${AUDIOBENCH_CLONE_REPO:-0}" != "1" ]]; then
  echo "Downloaded AudioBench documentation and repository metadata to: $out"
  echo "Set AUDIOBENCH_CLONE_REPO=1 to clone the evaluation toolkit."
  echo "AudioBench uses upstream datasets with separate access paths and licenses; this helper does not download them."
  exit 0
fi

clone_or_update "$repo_url" "$out/AudioBench"
echo "AudioBench evaluation toolkit clone complete: $out/AudioBench"
