#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir audiocaps)"
version="${AUDIOCAPS_VERSION:-1.0}"
repo_base="${AUDIOCAPS_GITHUB_RAW_BASE:-https://raw.githubusercontent.com/cdjkim/audiocaps/master}"

case "$version" in
  1.0)
    path="dataset"
    ;;
  2.0)
    path="dataset2.0"
    ;;
  *)
    echo "AUDIOCAPS_VERSION must be one of: 1.0, 2.0" >&2
    exit 2
    ;;
esac

version_out="$out/$path"
mkdir -p "$version_out"

download_url "$repo_base/$path/train.csv" "$version_out/train.csv"
download_url "$repo_base/$path/val.csv" "$version_out/val.csv"
download_url "$repo_base/$path/test.csv" "$version_out/test.csv"
download_url "$repo_base/$path/README.md" "$version_out/README.md"

cat >&2 <<'EOF'
AudioCaps CSV metadata download complete.
Raw audio/video is not downloaded here. The official README asks users to fill
out an upstream form for raw media access, and clips remain subject to
AudioSet/YouTube availability and terms.
EOF
echo "AudioCaps metadata download complete: $version_out"
