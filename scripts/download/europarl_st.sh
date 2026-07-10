#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir europarl_st)"
base_url="${EUROPARL_ST_BASE_URL:-https://www.mllp.upv.es/europarl-st}"
archive_name="${EUROPARL_ST_ARCHIVE_NAME:-v1.1.tar.gz}"

download_url "$base_url/" "$out/index.html"
download_url "$base_url/README.md" "$out/README.md"

if [[ "${EUROPARL_ST_DOWNLOAD_ARCHIVE:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded Europarl-ST official page and README only.

The v1.1 corpus archive is about 21 GB. Set EUROPARL_ST_DOWNLOAD_ARCHIVE=1
to download it after reviewing the CC BY-NC 4.0 construction license and
European Parliament source-data reuse terms.
EOF
  echo "Europarl-ST metadata download complete: $out"
  exit 0
fi

case "$archive_name" in
  v1.1.tar.gz|v1.0.tar.gz) ;;
  *)
    echo "Unsupported Europarl-ST archive name: $archive_name" >&2
    echo "Use v1.1.tar.gz or v1.0.tar.gz." >&2
    exit 2
    ;;
esac

download_url "$base_url/$archive_name" "$out/$archive_name"

echo "Europarl-ST archive download complete: $out"
