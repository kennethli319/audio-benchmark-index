#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir moisesdb)"
homepage="${MOISESDB_HOMEPAGE:-https://music.ai/research/}"
raw_base="${MOISESDB_RAW_BASE:-https://raw.githubusercontent.com/moises-ai/moises-db/main}"
repo_url="${MOISESDB_REPO_URL:-https://github.com/moises-ai/moises-db.git}"

download_url "$homepage" "$out/music-ai-research.html"
download_url "$raw_base/README.md" "$out/README.md"
download_url "$raw_base/LICENSE" "$out/LICENSE"

if [[ "${MOISESDB_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/moises-db"
else
  echo "Skipping MoisesDB loader/evaluation repo clone. Set MOISESDB_CLONE_REPO=1 to clone it."
fi

echo "The audio dataset uses the Download button on the official Music AI research page:"
echo "$homepage"
echo "MoisesDB docs download complete: $out"
