#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir maestro)"
homepage="${MAESTRO_HOMEPAGE:-https://magenta.withgoogle.com/datasets/maestro}"
base_url="${MAESTRO_BASE_URL:-https://storage.googleapis.com/magentadata/datasets/maestro/v3.0.0}"
version="${MAESTRO_VERSION:-v3.0.0}"

download_url "$homepage" "$out/maestro.html"
download_url "$base_url/maestro-$version.csv" "$out/maestro-$version.csv"
download_url "$base_url/maestro-$version.json" "$out/maestro-$version.json"

if [[ "${MAESTRO_DOWNLOAD_MIDI:-0}" == "1" ]]; then
  download_url "$base_url/maestro-$version-midi.zip" "$out/maestro-$version-midi.zip"
else
  echo "Skipping MAESTRO MIDI-only archive (~56 MiB). Set MAESTRO_DOWNLOAD_MIDI=1 to download it."
fi

if [[ "${MAESTRO_DOWNLOAD_AUDIO:-0}" == "1" ]]; then
  download_url "$base_url/maestro-$version.zip" "$out/maestro-$version.zip"
else
  echo "Skipping MAESTRO full WAV+MIDI archive (~101 GiB). Set MAESTRO_DOWNLOAD_AUDIO=1 to download it."
fi

echo "MAESTRO metadata download complete: $out"
