#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir earnings_21)"
repo_url="${EARNINGS21_REPO_URL:-https://github.com/revdotcom/speech-datasets.git}"
raw_base="${EARNINGS21_RAW_BASE:-https://raw.githubusercontent.com/revdotcom/speech-datasets/main}"

download_url "$raw_base/README.md" "$out/speech-datasets-README.md"
download_url "$raw_base/earnings21/README.md" "$out/README.md"
download_url "$raw_base/earnings21/LICENSE.md" "$out/LICENSE.md"
download_url "$raw_base/earnings21/UPDATES.md" "$out/UPDATES.md"
download_url "$raw_base/earnings21/earnings21-file-metadata.csv" "$out/earnings21-file-metadata.csv"
download_url "$raw_base/earnings21/eval10-file-metadata.csv" "$out/eval10-file-metadata.csv"
download_url "$raw_base/earnings21/speaker-metadata.csv" "$out/speaker-metadata.csv"

if [[ "${EARNINGS21_SPARSE_CHECKOUT:-0}" != "1" ]]; then
  echo "Downloaded Earnings-21 documentation and metadata to: $out"
  echo "Skipping the approximately 770 MB media tree. Set EARNINGS21_SPARSE_CHECKOUT=1 to fetch the earnings21 tree."
  exit 0
fi

require_cmd git
repo_dir="$out/speech-datasets"
if [[ -d "$repo_dir/.git" ]]; then
  echo "Updating sparse repository: $repo_dir"
  git -C "$repo_dir" pull --ff-only
else
  echo "Creating sparse checkout: $repo_url -> $repo_dir"
  git clone --depth 1 --filter=blob:none --sparse "$repo_url" "$repo_dir"
  git -C "$repo_dir" sparse-checkout init --cone
  git -C "$repo_dir" sparse-checkout set earnings21
fi

echo "Earnings-21 sparse checkout complete: $repo_dir/earnings21"
