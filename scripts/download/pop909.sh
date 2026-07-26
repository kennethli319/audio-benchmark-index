#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir pop909)"

download_url \
  "https://raw.githubusercontent.com/music-x-lab/POP909-Dataset/master/README.md" \
  "$out/README.md"
download_url \
  "https://raw.githubusercontent.com/music-x-lab/POP909-Dataset/master/LICENSE" \
  "$out/LICENSE"
download_url \
  "https://api.github.com/repos/music-x-lab/POP909-Dataset" \
  "$out/github-repository.json"
download_url \
  "https://raw.githubusercontent.com/music-x-lab/POP909-Dataset/master/POP909/index.xlsx" \
  "$out/index.xlsx"

if [[ "${POP909_CLONE_REPO:-0}" != "1" ]]; then
  echo "POP909 metadata download complete: $out"
  echo "Set POP909_CLONE_REPO=1 to clone the approximately 47 MB MIDI and annotation repository."
  exit 0
fi

clone_or_update \
  "https://github.com/music-x-lab/POP909-Dataset.git" \
  "$out/repository"

echo "POP909 repository clone complete: $out/repository"
