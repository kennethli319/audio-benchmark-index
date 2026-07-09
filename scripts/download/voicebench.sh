#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir voicebench)"

if [[ -n "${VOICEBENCH_INCLUDE:-}" ]]; then
  hf_download_dataset "hlt-lab/voicebench" "$out" --include "$VOICEBENCH_INCLUDE"
else
  hf_download_dataset "hlt-lab/voicebench" "$out"
fi

echo "VoiceBench download complete: $out"
