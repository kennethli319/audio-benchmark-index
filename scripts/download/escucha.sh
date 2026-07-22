#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir escucha)"
raw_base_url="${ESCUCHA_RAW_BASE_URL:-https://raw.githubusercontent.com/ferugit/ESCUCHA/master}"
repo_url="${ESCUCHA_REPO_URL:-https://github.com/ferugit/ESCUCHA.git}"

download_url "$raw_base_url/README.md" "$out/README.md"
download_url "$raw_base_url/data/tsv/ESCUCHA.json" "$out/ESCUCHA.json"
download_url "$raw_base_url/data/tsv/ESCUCHA.tsv" "$out/ESCUCHA.tsv"
download_url "$raw_base_url/src/evaluate.py" "$out/evaluate.py"

if [[ "${ESCUCHA_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/ESCUCHA"
else
  echo "Skipping repository clone. Set ESCUCHA_CLONE_REPO=1 to clone/update it."
fi

cat <<'EOF'
Downloaded ESCUCHA annotations, documentation, and scorer only. The benchmark
does not redistribute audio; its repository provides source URLs and a separate
yt-dlp reconstruction script. Review each recording's rights and platform terms
before retrieving audio.
EOF
echo "ESCUCHA metadata download complete: $out"
