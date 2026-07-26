#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir kitchen20)"
raw_base="${KITCHEN20_RAW_BASE_URL:-https://raw.githubusercontent.com/marc-moreaux/kitchen20/master}"

download_url "$raw_base/kitchen20.csv" "$out/kitchen20.csv"
download_url "$raw_base/classes.csv" "$out/classes.csv"
download_url "$raw_base/LICENSE.md" "$out/LICENSE.md"
download_url \
  "https://api.github.com/repos/marc-moreaux/kitchen20" \
  "$out/github-repository.json"

if [[ "${KITCHEN20_CLONE_REPO:-0}" != "1" ]]; then
  echo "Kitchen20 metadata download complete: $out"
  echo "Set KITCHEN20_CLONE_REPO=1 to clone the approximately 325 MB audio and code repository."
  exit 0
fi

clone_or_update \
  "https://github.com/marc-moreaux/kitchen20.git" \
  "$out/repository"

echo "Kitchen20 repository clone complete: $out/repository"
