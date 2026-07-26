#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir melobottleneck_eval)"
raw_base_url="${MELOBOTTLENECK_RAW_BASE_URL:-https://raw.githubusercontent.com/m-july/Supplementary-Files-For-MelobottleNeck-arXiv-Submission/main}"
repo_api_url="${MELOBOTTLENECK_REPO_API_URL:-https://api.github.com/repos/m-july/Supplementary-Files-For-MelobottleNeck-arXiv-Submission}"

download_url "$raw_base_url/README.md" "$out/README.md"
download_url "$repo_api_url" "$out/github-repo.json"
download_url "$repo_api_url/git/trees/main?recursive=1" "$out/github-tree.json"

if [[ "${MELOBOTTLENECK_DOWNLOAD_CODEBASE:-0}" != "1" ]]; then
  echo "Downloaded MeloBottleneck docs and repository metadata to: $out"
  echo "Set MELOBOTTLENECK_DOWNLOAD_CODEBASE=1 to fetch the 4.76 MB code/data ZIP."
  echo "The repository states no license; review upstream symbolic-corpus terms."
  exit 0
fi

download_url "$raw_base_url/melobottleneck-codebase.zip" "$out/melobottleneck-codebase.zip"
if command -v sha256sum >/dev/null 2>&1; then
  sha256sum "$out/melobottleneck-codebase.zip" > "$out/melobottleneck-codebase.zip.sha256"
elif command -v shasum >/dev/null 2>&1; then
  shasum -a 256 "$out/melobottleneck-codebase.zip" > "$out/melobottleneck-codebase.zip.sha256"
else
  echo "Missing required checksum command: sha256sum or shasum" >&2
  exit 127
fi
echo "MeloBottleneck code/data archive download complete: $out"
