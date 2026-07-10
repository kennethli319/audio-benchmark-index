#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir earnings_22)"
repo_url="${EARNINGS22_REPO_URL:-https://github.com/revdotcom/speech-datasets.git}"
raw_base="${EARNINGS22_RAW_BASE:-https://raw.githubusercontent.com/revdotcom/speech-datasets/main}"

download_url "$raw_base/README.md" "$out/speech-datasets-README.md"
download_url "$raw_base/earnings22/README.md" "$out/README.md"
download_url "$raw_base/earnings22/LICENSE.md" "$out/LICENSE.md"
download_url "$raw_base/earnings22/metadata.csv" "$out/metadata.csv"

if [[ "${EARNINGS22_SPARSE_CHECKOUT:-0}" != "1" ]]; then
  echo "Downloaded Earnings-22 README, license, and metadata to: $out"
  echo "Skipping sparse checkout. Set EARNINGS22_SPARSE_CHECKOUT=1 to fetch the earnings22 tree."
  echo "Audio uses Git LFS; set EARNINGS22_LFS_PULL=1 as a separate opt-in after sparse checkout."
  exit 0
fi

require_cmd git
repo_dir="$out/speech-datasets"
if [[ -d "$repo_dir/.git" ]]; then
  echo "Updating sparse repository: $repo_dir"
  git -C "$repo_dir" pull --ff-only
else
  echo "Creating sparse checkout: $repo_url -> $repo_dir"
  GIT_LFS_SKIP_SMUDGE=1 git clone --depth 1 --filter=blob:none --sparse "$repo_url" "$repo_dir"
  git -C "$repo_dir" sparse-checkout init --cone
  GIT_LFS_SKIP_SMUDGE=1 git -C "$repo_dir" sparse-checkout set earnings22
fi

if [[ "${EARNINGS22_LFS_PULL:-0}" != "1" ]]; then
  echo "Sparse checkout complete without Git LFS media pull: $repo_dir"
  echo "Set EARNINGS22_LFS_PULL=1 to run git lfs pull inside earnings22."
  exit 0
fi

if ! git -C "$repo_dir" lfs version >/dev/null 2>&1; then
  echo "Missing git-lfs. Install Git LFS before setting EARNINGS22_LFS_PULL=1." >&2
  exit 127
fi

git -C "$repo_dir/earnings22" lfs pull

echo "Earnings-22 sparse checkout and LFS pull complete: $repo_dir/earnings22"
