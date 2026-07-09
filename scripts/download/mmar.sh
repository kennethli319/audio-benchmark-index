#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir mmar)"
hf_download_dataset "BoJack/MMAR" "$out"

echo "MMAR download complete: $out"
