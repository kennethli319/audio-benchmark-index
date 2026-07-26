#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir music_avqa_r)"
raw_base="${MUSIC_AVQA_R_RAW_BASE_URL:-https://raw.githubusercontent.com/mira-ai-lab/MUSIC-AVQA-R/main}"
api_tree_url="${MUSIC_AVQA_R_API_TREE_URL:-https://api.github.com/repos/mira-ai-lab/MUSIC-AVQA-R/git/trees/main?recursive=1}"
repo_url="${MUSIC_AVQA_R_REPO_URL:-https://github.com/mira-ai-lab/MUSIC-AVQA-R.git}"

download_url "$raw_base/README.md" "$out/README.md"
download_url "$api_tree_url" "$out/github-tree.json"

if [[ "${MUSIC_AVQA_R_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/MUSIC-AVQA-R"
else
  echo "Skipping the approximately 90 MB repository. Set MUSIC_AVQA_R_CLONE_REPO=1 to clone annotations and code."
fi

cat <<MSG
MUSIC-AVQA-R metadata download complete: $out

The repository contains public derived test annotations but states no data or
code license. Original MUSIC-AVQA media is not included by this helper.
MSG
