#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir mmsu)"
hf_download_dataset "ddwang2000/MMSU" "$out"

echo "MMSU download complete: $out"
