#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir emo_superb)"
repo_raw_url="${EMO_SUPERB_REPO_RAW_URL:-https://raw.githubusercontent.com/EMOsuperb/EMO-SUPERB-submission/main}"
homepage_url="${EMO_SUPERB_HOMEPAGE_URL:-https://emosuperb.github.io}"
github_api_url="${EMO_SUPERB_GITHUB_API_URL:-https://api.github.com/repos/EMOsuperb/EMO-SUPERB-submission}"

download_url "$repo_raw_url/README.md" "$out/repository-README.md"
download_url "$homepage_url/" "$out/homepage.html"
download_url "$homepage_url/standardization.html" "$out/standardization.html"
download_url "$github_api_url" "$out/github-repository.json"

if [[ "${EMO_SUPERB_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "https://github.com/EMOsuperb/EMO-SUPERB-submission.git" "$out/repo"
else
  cat <<'EOF'
Downloaded official EMO-SUPERB documentation only.

Set EMO_SUPERB_CLONE_REPO=1 to clone the public evaluation repository
(approximately 23 MB according to the GitHub API). The repository has no
LICENSE file. It does not bundle the six source-corpus audio releases; obtain
those separately through each corpus owner's EULA, form, or repository path.
EOF
fi

echo "EMO-SUPERB metadata download complete: $out"
