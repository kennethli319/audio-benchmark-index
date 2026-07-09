#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir uro_bench_pro)"

if [[ "${URO_DOWNLOAD_ZIP:-0}" == "1" ]]; then
  hf_download_dataset "Honggao/URO-Bench" "$out" "URO-Bench-data.zip"
else
  hf_download_dataset "Honggao/URO-Bench" "$out"
fi

echo "URO-Bench download complete: $out"
