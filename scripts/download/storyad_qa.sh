#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir storyad_qa)"
repo_url="${STORYAD_QA_REPO_URL:-https://github.com/SEE-AI-Lab/ECCV2026_StoryTeller_StoryAD_QA.git}"
raw_base="${STORYAD_QA_RAW_BASE_URL:-https://raw.githubusercontent.com/SEE-AI-Lab/ECCV2026_StoryTeller_StoryAD_QA/main}"
api_url="${STORYAD_QA_API_URL:-https://api.github.com/repos/SEE-AI-Lab/ECCV2026_StoryTeller_StoryAD_QA}"

download_url "$raw_base/README.md" "$out/README.md"
download_url "$raw_base/DATASET_CARD.md" "$out/DATASET_CARD.md"
download_url "$raw_base/LICENSE" "$out/LICENSE"
download_url "$raw_base/data/dataset_summary.csv" "$out/dataset_summary.csv"
download_url "$raw_base/evaluation/evaluate_storyad_qa.py" "$out/evaluate_storyad_qa.py"
download_url "$api_url" "$out/github-repository.json"
download_url "$api_url/git/trees/main?recursive=1" "$out/github-tree.json"

if [[ "${STORYAD_QA_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/repository"
else
  cat <<'EOF'
Downloaded official StoryAD-QA documentation, summary, evaluator, and metadata.

Set STORYAD_QA_CLONE_REPO=1 to clone the approximately 8 MB public repository
with 2,572 annotation rows, answer keys, prompts, and evaluation code.

The repository license is explicitly pending finalization. It includes no movie
media; obtain lawful access to underlying MAD-Eval/LSMDC movies separately.
EOF
fi

echo "StoryAD-QA metadata download complete: $out"
