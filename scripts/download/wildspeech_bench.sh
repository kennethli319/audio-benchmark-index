#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir wildspeech_bench)"
hf_download_dataset "tencent/WildSpeech-Bench" "$out"

echo "WildSpeech-Bench download complete: $out"
