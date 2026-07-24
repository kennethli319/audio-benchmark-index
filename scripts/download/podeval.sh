#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir podeval)"
repo_url="${PODEVAL_REPO_URL:-https://github.com/yujxx/PodEval.git}"
raw="${PODEVAL_RAW_URL:-https://raw.githubusercontent.com/yujxx/PodEval/main}"

download_url "$raw/README.md" "$out/README.md"
download_url "$raw/Real_Pod/README.md" "$out/Real-Pod-README.md"
download_url "$raw/Real_Pod/Podcast_51topics.json" "$out/Podcast_51topics.json"
download_url "$raw/LICENSE" "$out/LICENSE"
download_url "https://api.github.com/repos/yujxx/PodEval" "$out/github-repo.json"
download_url "https://export.arxiv.org/api/query?id_list=2510.00485" "$out/paper-arxiv.xml"

if [[ "${PODEVAL_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/PodEval"
else
  echo "Skipping the PodEval toolkit clone. Set PODEVAL_CLONE_REPO=1 to clone it."
fi

cat <<'EOF'
PodEval documentation and the Real-Pod link manifest are ready.

The repository does not redistribute the linked podcast recordings. Review
creator, publisher, platform, voice, music, and other media rights before
downloading or reusing third-party podcast audio.
EOF

echo "PodEval metadata download complete: $out"
