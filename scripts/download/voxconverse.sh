#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir voxconverse)"
base_url="${VOXCONVERSE_BASE_URL:-https://www.robots.ox.ac.uk/~vgg/data/voxconverse}"
repo_url="${VOXCONVERSE_REPO_URL:-https://github.com/joonson/voxconverse.git}"
splits="${VOXCONVERSE_AUDIO_SPLITS:-dev test}"

download_url "$base_url/" "$out/index.html"
clone_or_update "$repo_url" "$out/annotations"

if [[ "${VOXCONVERSE_DOWNLOAD_AUDIO:-0}" != "1" ]]; then
  cat <<MSG
VoxConverse annotations/page download complete: $out

Audio archives are large and are not downloaded by default.
To download audio, run for example:
  VOXCONVERSE_DOWNLOAD_AUDIO=1 VOXCONVERSE_AUDIO_SPLITS=dev scripts/download/voxconverse.sh
  VOXCONVERSE_DOWNLOAD_AUDIO=1 VOXCONVERSE_AUDIO_SPLITS="dev test" scripts/download/voxconverse.sh
MSG
  exit 0
fi

for split in $splits; do
  case "$split" in
    dev|test)
      download_url "$base_url/data/voxconverse_${split}_wav.zip" "$out/voxconverse_${split}_wav.zip"
      ;;
    *)
      echo "Unknown VoxConverse split: $split (expected dev or test)" >&2
      exit 2
      ;;
  esac
done

cat <<MSG
VoxConverse download complete: $out

The official page lists MD5 checksums:
  dev:  2a6e07e7473d9841abb132554a698a36
  test: 834558bbd9b1ffd2d4893181556ceddd
MSG
