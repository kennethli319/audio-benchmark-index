#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir chartgeneval)"
repo_url="https://github.com/JacobLinCool/ChartGenEval"
repo_raw_url="https://raw.githubusercontent.com/JacobLinCool/ChartGenEval/main"
repo_api_url="https://api.github.com/repos/JacobLinCool/ChartGenEval"

download_url "$repo_raw_url/README.md" "$out/README.md"
download_url "$repo_raw_url/LICENSE" "$out/LICENSE"
download_url "$repo_api_url" "$out/github-api.json"
download_url "$repo_api_url/git/trees/main?recursive=1" "$out/github-tree.json"
download_url "https://arxiv.org/abs/2607.12857" "$out/paper.html"

if [[ "${CHARTGENEVAL_CLONE_REPO:-0}" == "1" ]]; then
  git_clone_shallow "$repo_url" "$out/repository"
else
  cat <<'EOF'
Downloaded ChartGenEval documentation and repository metadata.

Set CHARTGENEVAL_CLONE_REPO=1 to clone the public evaluation toolkit and
released metric artifacts. The chart/audio corpus is not distributed because
it may contain copyrighted community and commercial content; this helper does
not attempt to reconstruct or fetch it.
EOF
fi

echo "ChartGenEval metadata download complete: $out"
