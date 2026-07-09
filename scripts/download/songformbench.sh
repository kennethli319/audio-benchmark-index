#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir songformbench)"
hf_download_dataset "ASLP-lab/SongFormBench" "$out"

echo "SongFormBench download complete: $out"
