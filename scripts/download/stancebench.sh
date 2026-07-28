#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir stancebench)"
repo="https://github.com/YuzheWangjhu/StanceBench"
raw="https://raw.githubusercontent.com/YuzheWangjhu/StanceBench/main"
metadata="$raw/stancebench/metadata"

download_url "https://arxiv.org/abs/2607.22658" "$out/paper.html"
download_url "$repo" "$out/project.html"
download_url "https://api.github.com/repos/YuzheWangjhu/StanceBench" \
  "$out/github-repository.json"
download_url "$raw/README.md" "$out/README.md"
download_url "$raw/LICENSE" "$out/LICENSE"
download_url "$metadata/questions_main.json" "$out/questions_main.json"
download_url "$metadata/category_roles.csv" "$out/category_roles.csv"

if [[ "${STANCEBENCH_DOWNLOAD_INTERACTION_MAP:-0}" == "1" ]]; then
  download_url "$metadata/interactions_role_ABmapped.csv" \
    "$out/interactions_role_ABmapped.csv"
fi

cat <<EOF
StanceBench requested downloads complete: $out

The helper does not download or redistribute Seamless Interaction audio.
Obtain it separately from Meta's official release and retain its
CC BY-NC 4.0 terms. The approximately 8.8 MB interaction mapping requires
STANCEBENCH_DOWNLOAD_INTERACTION_MAP=1.
EOF
