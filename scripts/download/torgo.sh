#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir torgo)"
base_url="http://www.cs.toronto.edu/~complingweb/data/TORGO"

download_url "$base_url/torgo.html" "$out/torgo.html"
download_url "$base_url/doc/ERRORS.xls" "$out/ERRORS.xls"
download_url "$base_url/doc/CoilLocations.pdf" "$out/CoilLocations.pdf"

archives="${TORGO_ARCHIVES:-}"
if [[ -z "$archives" ]]; then
  cat <<'EOF'
Downloaded TORGO's official page and lightweight documentation only.

The owner permits use only for academic, non-profit purposes and requires a
TORGO paper citation. Review the saved page before downloading speaker data.

Set TORGO_ACK_TERMS=1 and TORGO_ARCHIVES to a comma-separated subset of
F,FC,M,MC to download the large archives, for example:
  TORGO_ACK_TERMS=1 TORGO_ARCHIVES=F scripts/download/torgo.sh
EOF
  echo "TORGO metadata download complete: $out"
  exit 0
fi

if [[ "${TORGO_ACK_TERMS:-0}" != "1" ]]; then
  echo "Set TORGO_ACK_TERMS=1 after reviewing the owner terms in $out/torgo.html." >&2
  exit 2
fi

IFS=',' read -r -a selected <<< "$archives"
for archive in "${selected[@]}"; do
  case "$archive" in
    F|FC|M|MC)
      download_url "$base_url/$archive.tar.bz2" "$out/$archive.tar.bz2"
      ;;
    *)
      echo "Unsupported TORGO archive '$archive'; choose only F, FC, M, or MC." >&2
      exit 2
      ;;
  esac
done

echo "TORGO selected archives download complete: $out"
