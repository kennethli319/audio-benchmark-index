#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir vocalsound)"
raw_base="${VOCALSOUND_RAW_BASE_URL:-https://raw.githubusercontent.com/YuanGongND/vocalsound/main}"
repo_api_url="${VOCALSOUND_REPO_API_URL:-https://api.github.com/repos/YuanGongND/vocalsound}"

download_url "$raw_base/README.md" "$out/README.md"
download_url "$repo_api_url" "$out/github-repo.json"

if [[ "${VOCALSOUND_DOWNLOAD_ARCHIVE:-0}" != "1" ]]; then
  echo "Downloaded VocalSound docs to: $out"
  echo "Skipping audio archives. Set VOCALSOUND_DOWNLOAD_ARCHIVE=1 and VOCALSOUND_SAMPLE_RATE=16k or 44k to download."
  exit 0
fi

case "${VOCALSOUND_SAMPLE_RATE:-16k}" in
  16k)
    url="${VOCALSOUND_16K_URL:-https://www.dropbox.com/s/c5ace70qh1vbyzb/vs_release_16k.zip?dl=1}"
    file="vs_release_16k.zip"
    ;;
  44k | 44.1k)
    url="${VOCALSOUND_44K_URL:-https://www.dropbox.com/s/ybgaprezl8ubcce/vs_release_44k.zip?dl=1}"
    file="vs_release_44k.zip"
    ;;
  *)
    echo "Unsupported VOCALSOUND_SAMPLE_RATE='${VOCALSOUND_SAMPLE_RATE:-}'. Use 16k or 44k." >&2
    exit 2
    ;;
esac

download_url "$url" "$out/$file"
echo "VocalSound download complete: $out/$file"
