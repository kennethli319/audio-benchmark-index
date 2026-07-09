#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir esc_50)"
url="${ESC50_ARCHIVE_URL:-https://github.com/karolpiczak/ESC-50/archive/refs/heads/master.zip}"

download_url "$url" "$out/ESC-50-master.zip"

echo "ESC-50 download complete: $out/ESC-50-master.zip"
