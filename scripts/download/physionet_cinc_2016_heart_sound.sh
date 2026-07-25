#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir physionet_cinc_2016_heart_sound)"
base_url="${PHYSIONET_CINC_2016_BASE_URL:-https://physionet.org}"

download_url \
  "$base_url/content/challenge-2016/1.0.0/" \
  "$out/challenge-2016.html"
download_url \
  "$base_url/content/challenge-2016/view-license/1.0.0/" \
  "$out/license.html"

if [[ "${PHYSIONET_CINC_2016_DOWNLOAD_AUDIO:-0}" != "1" ]]; then
  echo "Downloaded official PhysioNet challenge and license pages to: $out"
  echo "Skipping the approximately 190 MB training archive."
  echo "Set PHYSIONET_CINC_2016_DOWNLOAD_AUDIO=1 to download it."
  exit 0
fi

download_url \
  "$base_url/files/challenge-2016/1.0.0/training.zip" \
  "$out/training.zip"

echo "PhysioNet/CinC 2016 training archive downloaded to: $out/training.zip"
