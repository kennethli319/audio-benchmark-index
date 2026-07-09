#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir mir_1k_vocal)"
source_name="${MIR1K_SOURCE:-figshare}"

case "$source_name" in
  figshare)
    url="https://ndownloader.figshare.com/files/10256751"
    ;;
  official)
    echo "Warning: the MIR Lab archive returned 404 when checked on 2026-07-09." >&2
    url="http://mirlab.org/dataset/public/MIR-1K.rar"
    ;;
  *)
    echo "Unsupported MIR1K_SOURCE: $source_name" >&2
    echo "Use MIR1K_SOURCE=figshare or MIR1K_SOURCE=official." >&2
    exit 2
    ;;
esac

download_url "$url" "$out/MIR-1K.rar"

echo "MIR-1K download complete: $out/MIR-1K.rar"
