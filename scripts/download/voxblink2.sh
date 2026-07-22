#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir voxblink2)"
repo_url="${VOXBLINK2_REPO_URL:-https://github.com/VoxBlink2/ScriptsForVoxBlink2.git}"
raw_base="${VOXBLINK2_RAW_BASE:-https://raw.githubusercontent.com/VoxBlink2/ScriptsForVoxBlink2/main}"

download_url "$raw_base/README.md" "$out/README.md"
download_url "$raw_base/LICENSE" "$out/LICENSE"
download_url "https://voxblink2.github.io/" "$out/project-page.html"

cat <<'EOF'
VoxBlink2 releases annotation resources through its official Google Drive folder:
https://drive.google.com/drive/folders/1lzumPsnl5yEaMP9g2bFbSKINLZ-QRJVP

The release contains annotations and YouTube pointers, not audio or video. Review
the dataset license, source-media rights, platform terms, privacy considerations,
and local law before retrieving any source media.
EOF

if [[ "${VOXBLINK2_CLONE_REPO:-0}" != "1" ]]; then
  echo "Downloaded VoxBlink2 documentation to: $out"
  echo "Set VOXBLINK2_CLONE_REPO=1 to clone the official scripts and evaluation protocols."
  exit 0
fi

clone_or_update "$repo_url" "$out/ScriptsForVoxBlink2"
echo "VoxBlink2 repository available at: $out/ScriptsForVoxBlink2"
