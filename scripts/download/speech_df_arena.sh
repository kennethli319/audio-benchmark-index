#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir speech_df_arena)"
repo_url="${SPEECH_DF_ARENA_REPO_URL:-https://github.com/Speech-Arena/speech_df_arena}"
space_api="${SPEECH_DF_ARENA_SPACE_API_URL:-https://huggingface.co/api/spaces/Speech-Arena-2025/Speech-DF-Arena}"

download_url "https://arxiv.org/abs/2509.02859" "$out/paper.html"
download_url "$repo_url/raw/main/README.md" "$out/repository-README.md"
download_url "https://api.github.com/repos/Speech-Arena/speech_df_arena" "$out/repository-api.json"
download_url "$space_api" "$out/leaderboard-api.json"

if [[ "${SPEECH_DF_ARENA_CLONE_TOOLKIT:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/toolkit"
fi

if [[ "${SPEECH_DF_ARENA_CLONE_TOOLKIT:-0}" != "1" ]]; then
  cat <<EOF
Downloaded Speech DF Arena paper, repository documentation/API metadata, and
leaderboard metadata to:
$out

The public toolkit repository is approximately 400 MB because it includes
protocol CSVs. Set SPEECH_DF_ARENA_CLONE_TOOLKIT=1 to clone it. Component audio
is not downloaded by this helper; obtain each dataset from its own official
source and review its terms. SONAR's primary release and data terms remain
unresolved.
EOF
  exit 0
fi

echo "Speech DF Arena requested downloads complete: $out"
