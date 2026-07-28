#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir biotalk_3d)"
repo_url="${BIOTALK_3D_REPO_URL:-https://github.com/2002zym/BioTalk-3D}"

download_url "$repo_url/raw/main/README.md" "$out/README.md"
download_url "$repo_url/raw/main/DATA_LICENSE.md" "$out/DATA_LICENSE.md"
download_url "$repo_url/raw/main/CITATION.cff" "$out/CITATION.cff"
download_url "https://api.github.com/repos/2002zym/BioTalk-3D" "$out/github-api.json"
download_url "https://api.github.com/repos/2002zym/BioTalk-3D/git/trees/main?recursive=1" "$out/github-tree.json"

echo "Downloaded BioTalk-3D documentation to: $out"
echo "The 18.05 GB dataset must be obtained manually from Baidu Netdisk:"
echo "https://pan.baidu.com/s/17m1xekiNR08e_CIgu-0Tbg?pwd=em25 (extraction code: em25)"
echo "Review DATA_LICENSE.md before use; redistribution is prohibited."
