#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir librispeech)"
parts="${LIBRISPEECH_PARTS:-test-clean test-other dev-clean dev-other}"

download_url "https://www.openslr.org/12" "$out/openslr.html"

if [[ "${LIBRISPEECH_MD5:-1}" == "1" ]]; then
  download_url "https://www.openslr.org/resources/12/md5sum.txt" "$out/md5sum.txt"
fi

if [[ "${LIBRISPEECH_DOWNLOAD_ARCHIVES:-0}" == "1" ]]; then
  for part in $parts; do
    download_url \
      "https://www.openslr.org/resources/12/$part.tar.gz" \
      "$out/$part.tar.gz"
  done
else
  echo "Metadata saved to: $out"
  echo "Set LIBRISPEECH_DOWNLOAD_ARCHIVES=1 to fetch selected corpus archives."
fi
