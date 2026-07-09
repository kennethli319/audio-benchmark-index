#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir superb)"
raw_base_url="${SUPERB_RAW_BASE_URL:-https://raw.githubusercontent.com/s3prl/s3prl/master}"
repo_url="${SUPERB_REPO_URL:-https://github.com/s3prl/s3prl.git}"

download_url "$raw_base_url/s3prl/downstream/docs/superb.md" "$out/superb.md"
download_url "$raw_base_url/README.md" "$out/S3PRL_README.md"
download_url "$raw_base_url/LICENSE" "$out/LICENSE"

if [[ "${SUPERB_CLONE_TOOLKIT:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/s3prl"
else
  echo "Skipping S3PRL toolkit clone. Set SUPERB_CLONE_TOOLKIT=1 to clone/update it."
fi

cat <<'EOF'
SUPERB is a benchmark suite over multiple upstream corpora.
Use the saved superb.md task documentation to prepare each component dataset
through its own official source and license terms.
EOF

echo "SUPERB documentation download complete: $out"
