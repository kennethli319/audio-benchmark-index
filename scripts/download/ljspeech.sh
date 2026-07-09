#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir ljspeech)"
homepage="${LJSPEECH_HOMEPAGE:-https://keithito.com/LJ-Speech-Dataset/}"
archive_url="${LJSPEECH_ARCHIVE_URL:-https://data.keithito.com/data/speech/LJSpeech-1.1.tar.bz2}"

download_url "$homepage" "$out/ljspeech.html"

if [[ "${LJSPEECH_DOWNLOAD_ARCHIVE:-0}" != "1" ]]; then
  echo "Downloaded LJSpeech dataset page to: $out/ljspeech.html"
  echo "Skipping 2.6 GiB archive. Set LJSPEECH_DOWNLOAD_ARCHIVE=1 to download it."
  exit 0
fi

download_url "$archive_url" "$out/LJSpeech-1.1.tar.bz2"

echo "LJSpeech archive download complete: $out"
