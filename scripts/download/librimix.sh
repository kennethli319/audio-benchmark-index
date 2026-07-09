#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir librimix)"
repo_url="${LIBRIMIX_REPO_URL:-https://github.com/JorisCos/LibriMix.git}"
repo_dir="${LIBRIMIX_REPO_DIR:-$out/repo}"
storage_dir="${LIBRIMIX_STORAGE_DIR:-$out/generated}"

clone_or_update "$repo_url" "$repo_dir"

if [[ "${LIBRIMIX_RUN_GENERATION:-0}" != "1" ]]; then
  echo "Cloned/updated LibriMix generator and metadata repo: $repo_dir"
  echo "Skipping generation. It downloads LibriSpeech/WHAM sources and can create hundreds of GiB."
  echo "Set LIBRIMIX_RUN_GENERATION=1 and LIBRIMIX_STORAGE_DIR=/large/storage to run upstream generation."
  exit 0
fi

require_cmd bash
require_cmd python
require_cmd sox
require_cmd wget
require_cmd unzip

mkdir -p "$storage_dir"
(
  cd "$repo_dir"
  bash ./generate_librimix.sh "$storage_dir"
)

echo "LibriMix generation complete: $storage_dir"
