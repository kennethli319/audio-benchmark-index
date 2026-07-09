#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir librispeech)"
parts="${LIBRISPEECH_PARTS:-test-clean test-other dev-clean dev-other}"

for part in $parts; do
  download_url \
    "https://www.openslr.org/resources/12/$part.tar.gz" \
    "$out/$part.tar.gz"
done

if [[ "${LIBRISPEECH_MD5:-1}" == "1" ]]; then
  download_url "https://www.openslr.org/resources/12/md5sum.txt" "$out/md5sum.txt"
fi

echo "LibriSpeech download complete: $out"
