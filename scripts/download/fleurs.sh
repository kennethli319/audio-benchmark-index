#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

config="${FLEURS_CONFIG:-en_us}"
out="$(dataset_dir fleurs)"

if [[ "$config" == "all" ]]; then
  echo "FLEURS_CONFIG=all downloads a very large repository."
  hf_download_dataset "google/fleurs" "$out/all"
else
  hf_download_dataset \
    "google/fleurs" \
    "$out/$config" \
    --include "README.md" \
    --include "data/$config/*"
fi

echo "FLEURS download complete: $out"
