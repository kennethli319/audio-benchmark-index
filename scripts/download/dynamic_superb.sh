#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir dynamic_superb)"
raw_base_url="${DYNAMIC_SUPERB_RAW_BASE_URL:-https://raw.githubusercontent.com/dynamic-superb/dynamic-superb/main}"
repo_url="${DYNAMIC_SUPERB_REPO_URL:-https://github.com/dynamic-superb/dynamic-superb.git}"

download_url "$raw_base_url/README.md" "$out/README.md"
download_url "$raw_base_url/docs/leaderboard_gpt_evaluation.md" "$out/leaderboard_gpt_evaluation.md"
download_url "$raw_base_url/docs/task_submission.md" "$out/task_submission.md"
download_url "$raw_base_url/docs/score_submission.md" "$out/score_submission.md"

if [[ "${DYNAMIC_SUPERB_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/dynamic-superb"
else
  echo "Skipping Dynamic-SUPERB repo clone. Set DYNAMIC_SUPERB_CLONE_REPO=1 to clone/update it."
fi

cat <<'EOF'
Dynamic-SUPERB is a collaborative benchmark over many speech, music, and
general sound tasks. Check each task's upstream dataset license and access terms
before downloading component corpora or publishing results.
EOF

echo "Dynamic-SUPERB metadata download complete: $out"
