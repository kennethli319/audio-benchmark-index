#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir music_avqa_v2)"
raw_base="${MUSIC_AVQA_V2_RAW_BASE_URL:-https://raw.githubusercontent.com/DragonLiu1995/MUSIC-AVQA-v2.0/main}"
api_tree_url="${MUSIC_AVQA_V2_API_TREE_URL:-https://api.github.com/repos/DragonLiu1995/MUSIC-AVQA-v2.0/git/trees/main?recursive=1}"
repo_url="${MUSIC_AVQA_V2_REPO_URL:-https://github.com/DragonLiu1995/MUSIC-AVQA-v2.0.git}"

download_url "$raw_base/README.md" "$out/README.md"
download_url "$raw_base/LICENSE" "$out/LICENSE"
download_url "$api_tree_url" "$out/github-tree.json"
download_url "$raw_base/data/MUSIC-AVQA-v2.0_additional_videos.csv" "$out/MUSIC-AVQA-v2.0_additional_videos.csv"

if [[ "${MUSIC_AVQA_V2_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/MUSIC-AVQA-v2.0"
else
  echo "Skipping QA JSON repository clone. Set MUSIC_AVQA_V2_CLONE_REPO=1 to clone it."
fi

cat <<MSG
MUSIC-AVQA-v2.0 metadata download complete: $out

The 1,040-video archive is a separate manual Dropbox download. The README
limits those YouTube-derived videos to research use; upstream rights apply.
MSG
