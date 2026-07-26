#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir dilemmadata)"

download_url \
  "https://raw.githubusercontent.com/johentsch/dilemmadata/main/README.md" \
  "$out/README.md"
download_url \
  "https://raw.githubusercontent.com/johentsch/dilemmadata/main/.zenodo.json" \
  "$out/zenodo-metadata.json"
download_url \
  "https://raw.githubusercontent.com/johentsch/dilemmadata/main/.gitmodules" \
  "$out/gitmodules.txt"
download_url \
  "https://api.github.com/repos/johentsch/dilemmadata" \
  "$out/github-repository.json"
download_url \
  "https://api.github.com/repos/johentsch/dilemmadata/releases/tags/v1.0" \
  "$out/github-release-v1.0.json"

if [[ "${DILEMMADATA_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update \
    "https://github.com/johentsch/dilemmadata.git" \
    "$out/repo"
fi

echo "Dilemmadata metadata download complete: $out"
echo "Set DILEMMADATA_CLONE_REPO=1 to clone the processed symbolic dataset."
