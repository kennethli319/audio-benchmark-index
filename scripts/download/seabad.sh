#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir seabad)"
zenodo_api="${SEABAD_ZENODO_API_URL:-https://zenodo.org/api/records/18290494}"

download_url "$zenodo_api" "$out/zenodo-record-18290494.json"
download_url "https://arxiv.org/abs/2605.20853" "$out/seabad-paper.html"
download_url "https://arxiv.org/abs/2607.19721" "$out/drongonet-evaluation-paper.html"
download_url "https://raw.githubusercontent.com/mun3im/seabad/main/README.md" "$out/README.md"
download_url "https://api.github.com/repos/mun3im/seabad" "$out/github-repository.json"

if [[ "${SEABAD_DOWNLOAD_AUDIO:-0}" != "1" ]]; then
  echo "Downloaded SEABAD metadata to: $out"
  echo "Skipping the approximately 3.87 GiB archive."
  echo "Set SEABAD_ACK_SOURCE_TERMS=1 SEABAD_DOWNLOAD_AUDIO=1 to download it."
  exit 0
fi

if [[ "${SEABAD_ACK_SOURCE_TERMS:-0}" != "1" ]]; then
  manual_required \
    "SEABAD audio" \
    "Review the per-recording Xeno-Canto and negative-source licenses." \
    "Then set SEABAD_ACK_SOURCE_TERMS=1 with SEABAD_DOWNLOAD_AUDIO=1."
fi

download_url \
  "$zenodo_api/files/mybad.zip/content" \
  "$out/mybad.zip"

echo "SEABAD download complete: $out"
