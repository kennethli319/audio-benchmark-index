#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir ch_sims)"
repo_raw="${CH_SIMS_REPO_RAW:-https://raw.githubusercontent.com/thuiar/MMSA/master}"
repo_api="${CH_SIMS_REPO_API:-https://api.github.com/repos/thuiar/MMSA}"
paper_page="${CH_SIMS_PAPER_PAGE:-https://aclanthology.org/2020.acl-main.343/}"
repo_url="${CH_SIMS_REPO_URL:-https://github.com/thuiar/MMSA.git}"

download_url "$paper_page" "$out/paper.html"
download_url "$repo_raw/README.md" "$out/README.md"
download_url "$repo_raw/LICENSE" "$out/LICENSE"
download_url "$repo_api" "$out/github-repository.json"

if [[ "${CH_SIMS_CLONE_TOOLKIT:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/MMSA"
else
  echo "Skipping MMSA toolkit clone. Set CH_SIMS_CLONE_TOOLKIT=1 to clone it."
fi

echo "CH-SIMS data is a manual download from the official shared Drive folders:"
echo "  Google Drive: https://drive.google.com/drive/folders/1A2S4pqCHryGmiqnNSPLv7rEg63WvjCSk"
echo "  Baidu Drive: https://pan.baidu.com/s/1a1bDX5htPsZjsRyHcvCKHw?pwd=qq0b"
echo "CH-SIMS metadata download complete: $out"
