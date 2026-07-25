#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir ch_sims_v2)"
homepage="${CH_SIMS_V2_HOMEPAGE:-https://thuiar.github.io/sims.github.io/chsims}"
repo_raw="${CH_SIMS_V2_REPO_RAW:-https://raw.githubusercontent.com/thuiar/ch-sims-v2/main}"
repo_api="${CH_SIMS_V2_REPO_API:-https://api.github.com/repos/thuiar/ch-sims-v2}"
repo_url="${CH_SIMS_V2_REPO_URL:-https://github.com/thuiar/ch-sims-v2.git}"
paper_api="${CH_SIMS_V2_PAPER_API:-https://export.arxiv.org/api/query?id_list=2209.02604}"

download_url "$homepage" "$out/homepage.html"
download_url "$repo_raw/README.md" "$out/README.md"
download_url "$repo_api" "$out/github-repository.json"
download_url "$paper_api" "$out/arxiv-metadata.xml"

if [[ "${CH_SIMS_V2_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/ch-sims-v2"
else
  echo "Skipping CH-SIMS v2 repository clone. Set CH_SIMS_V2_CLONE_REPO=1 to clone it."
fi

echo "CH-SIMS v2 data is a manual download from the official Drive folders:"
echo "  Supervised Google Drive: https://drive.google.com/drive/folders/1wFvGS0ebKRvT3q6Xolot-sDtCNfz7HRA"
echo "  Unsupervised Google Drive: https://drive.google.com/drive/folders/1llIbm3gwyJRwwk58RUQHWBNKjHI9vGGB"
echo "  Supervised Baidu: https://pan.baidu.com/s/13Ds2_XDIGUqMHt4lXNLQSQ (code: icmi)"
echo "  Unsupervised Baidu: https://pan.baidu.com/s/1tezEDR3Y23hJ6Mp5fmcp-w (code: icmi)"
echo "CH-SIMS v2 metadata download complete: $out"
