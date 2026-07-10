#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir ave)"
raw_base="${AVE_RAW_BASE_URL:-https://raw.githubusercontent.com/YapengTian/AVE-ECCV18/master}"
repo_url="${AVE_REPO_URL:-https://github.com/YapengTian/AVE-ECCV18.git}"
homepage_url="${AVE_HOMEPAGE_URL:-https://sites.google.com/view/audiovisualresearch}"
paper_url="${AVE_PAPER_URL:-https://arxiv.org/abs/1803.08842}"

download_url "$homepage_url" "$out/ave-homepage.html"
download_url "$raw_base/README.md" "$out/README.md"
download_url "$paper_url" "$out/arxiv-1803.08842.html"

if [[ "${AVE_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/AVE-ECCV18"
else
  echo "Skipping AVE repository clone. Set AVE_CLONE_REPO=1 to clone code and file references."
fi

cat <<MSG
AVE docs download complete: $out

Large dataset files are linked from the official README as Google Drive files:
- Dataset: https://drive.google.com/open?id=1FjKwe79e0u96vdjIVwfRQ1V6SoDHe7kK
- Audio feature: https://drive.google.com/file/d/1F6p4BAOY-i0fDXUOhG7xHuw_fnO5exBS/view
- Visual feature: https://drive.google.com/file/d/1hQwbhutA3fQturduRnHMyfRqdrRHgmC9/view

This helper does not automate Google Drive downloads. Review upstream terms and
use a Drive-capable tool if you decide to fetch the large files.
MSG
