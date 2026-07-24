#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir maeb)"
raw_base_url="${MAEB_RAW_BASE_URL:-https://raw.githubusercontent.com/embeddings-benchmark/mteb/main}"
repo_url="${MAEB_REPO_URL:-https://github.com/embeddings-benchmark/mteb.git}"

download_url "$raw_base_url/README.md" "$out/README.md"
download_url "$raw_base_url/LICENSE" "$out/LICENSE"
download_url \
  "$raw_base_url/mteb/benchmarks/benchmarks/benchmarks.py" \
  "$out/benchmarks.py"
download_url \
  "https://api.github.com/repos/embeddings-benchmark/mteb" \
  "$out/github-repository.json"

if [[ "${MAEB_CLONE_MTEB:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/mteb"
else
  echo "Skipping MTEB repo clone. Set MAEB_CLONE_MTEB=1 to clone/update it."
fi

cat <<'EOF'
MAEB is a suite of 30 component tasks in MTEB. This helper does not download
their audio or annotations. Inspect each task's MTEB metadata and upstream
dataset terms before acquiring component data or publishing results.
EOF

echo "MAEB metadata download complete: $out"
