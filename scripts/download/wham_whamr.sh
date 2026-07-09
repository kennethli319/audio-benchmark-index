#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir wham_whamr)"
homepage="${WHAM_HOMEPAGE_URL:-http://wham.whisper.ai/}"
base_url="${WHAM_S3_BASE_URL:-https://my-bucket-a8b4b49c25c811ee9a7e8bba05fa24c7.s3.amazonaws.com}"

download_url "$homepage" "$out/wham-homepage.html"

if [[ "${WHAM_DOWNLOAD_SCRIPTS:-1}" == "1" ]]; then
  download_url "$base_url/wham_scripts.tar.gz" "$out/wham_scripts.tar.gz"
  download_url "$base_url/whamr_scripts.tar.gz" "$out/whamr_scripts.tar.gz"
else
  echo "Skipping WHAM!/WHAMR! generation scripts. Set WHAM_DOWNLOAD_SCRIPTS=1 to download them."
fi

if [[ "${WHAM_DOWNLOAD_NOISE:-0}" == "1" ]]; then
  download_url "$base_url/wham_noise.zip" "$out/wham_noise.zip"
else
  echo "Skipping WHAM! noise archive, about 17 GiB compressed. Set WHAM_DOWNLOAD_NOISE=1 to download it."
fi

if [[ "${WHAM_DOWNLOAD_48KHZ:-0}" == "1" ]]; then
  download_url "$base_url/high_res_wham.zip" "$out/high_res_wham.zip"
else
  echo "Skipping WHAM!48kHz archive, about 68.1 GiB compressed. Set WHAM_DOWNLOAD_48KHZ=1 to download it."
fi

echo "WHAM!/WHAMR! helper complete: $out"
echo "Building full mixtures also requires separately licensed WSJ0/wsj0-2mix access."
