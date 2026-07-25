#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir polysim_2026)"
raw_base="${POLYSIM2026_RAW_BASE:-https://raw.githubusercontent.com/msaadsaeed/polysim/main}"
repo_api="${POLYSIM2026_REPO_API:-https://api.github.com/repos/msaadsaeed/polysim}"
repo_url="${POLYSIM2026_REPO_URL:-https://github.com/msaadsaeed/polysim.git}"
paper_api="${POLYSIM2026_PAPER_API:-https://export.arxiv.org/api/query?id_list=2607.13669}"

download_url "$raw_base/README.md" "$out/README.md"
download_url "$repo_api" "$out/github-repository.json"
download_url "$paper_api" "$out/arxiv-metadata.xml"

if [[ "${POLYSIM2026_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/polysim"
else
  echo "Skipping POLY-SIM baseline clone. Set POLYSIM2026_CLONE_REPO=1 to clone it."
fi

cat <<'MSG'
POLY-SIM 2026 documentation download complete.

The official README links public Google Drive packages for raw data,
precomputed features, and CSV files for train, development, and test. This
helper does not automate those downloads because the release states no data
license and derives from YouTube-hosted MAV-Celeb source videos. Review
upstream rights and terms, then use the official links in the saved README.
MSG
