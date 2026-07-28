#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir xares)"
repo_raw="https://raw.githubusercontent.com/jimbozhang/xares/main"
repo_url="https://github.com/jimbozhang/xares.git"

download_url "$repo_raw/README.md" "$out/repository-README.md"
download_url "$repo_raw/LICENSE" "$out/repository-LICENSE"
download_url \
  "https://api.github.com/repos/jimbozhang/xares" \
  "$out/repository-api.json"
download_url \
  "https://zenodo.org/api/communities/mispeech" \
  "$out/zenodo-community.json"
download_url \
  "https://zenodo.org/api/records/14614287" \
  "$out/example-ESC-50-record.json"
download_url \
  "https://www.isca-archive.org/interspeech_2025/zhang25d_interspeech.html" \
  "$out/interspeech-paper.html"
download_url "https://arxiv.org/abs/2505.16369" "$out/arxiv-paper.html"

if [[ "${XARES_CLONE_TOOLKIT:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/xares"
else
  cat <<'EOF'
Downloaded official X-ARES metadata, documentation, and license text only.

Set XARES_CLONE_TOOLKIT=1 to clone the Apache-2.0 evaluation toolkit. This
helper intentionally does not run X-ARES: the toolkit automatically downloads
large, mixed-license component datasets from Zenodo when tasks are executed.
Five repository tasks use private, unreleased datasets and are skipped by the
runner. Review every selected Zenodo record and original corpus license first.
EOF
fi

echo "X-ARES metadata download complete: $out"
