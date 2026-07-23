#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir live_gurbani_captioning_v1)"
repo_url="${LIVE_GURBANI_CAPTIONING_REPO_URL:-https://github.com/karanbirsingh/live-gurbani-captioning-benchmark-v1.git}"
raw_base_url="${LIVE_GURBANI_CAPTIONING_RAW_BASE_URL:-https://raw.githubusercontent.com/karanbirsingh/live-gurbani-captioning-benchmark-v1/main}"
repo_api_url="${LIVE_GURBANI_CAPTIONING_API_URL:-https://api.github.com/repos/karanbirsingh/live-gurbani-captioning-benchmark-v1}"

download_url "$raw_base_url/README.md" "$out/README.md"
download_url "$raw_base_url/LICENSE" "$out/LICENSE"
download_url "$repo_api_url" "$out/github-repo.json"

if [[ "${LIVE_GURBANI_CAPTIONING_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/repository"
else
  cat <<'EOF'
Downloaded official documentation and repository metadata only.

Set LIVE_GURBANI_CAPTIONING_CLONE_REPO=1 to clone the small public repository,
including CC BY 4.0 annotations, baselines, and the MIT scorer/tools.

Audio is not bundled. The official README lists four YouTube IDs and preparation
commands. Check source availability, platform terms, and recording rights before
retrieving or using those recordings.
EOF
fi

echo "Live Gurbani Captioning Benchmark v1 metadata download complete: $out"
