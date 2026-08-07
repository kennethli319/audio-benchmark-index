#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir full_duplex_bench)"
repo_url="${FULL_DUPLEX_BENCH_REPO_URL:-https://github.com/DanielLin94144/Full-Duplex-Bench}"
raw_base="${FULL_DUPLEX_BENCH_RAW_BASE_URL:-https://raw.githubusercontent.com/DanielLin94144/Full-Duplex-Bench/main}"

download_url "https://arxiv.org/abs/2503.04721" "$out/v1-paper.html"
download_url "https://arxiv.org/abs/2507.23159" "$out/v1.5-paper.html"
download_url "https://arxiv.org/abs/2510.07838" "$out/v2-paper.html"
download_url "https://arxiv.org/abs/2604.04847" "$out/v3-paper.html"
download_url "$raw_base/README.md" "$out/README.md"
download_url "$raw_base/LICENSE" "$out/LICENSE"
download_url "$raw_base/v1_v1.5/dataset/README.md" "$out/v1-v1.5-data-README.md"
download_url "$raw_base/v2/README.md" "$out/v2-README.md"
download_url "$raw_base/v3/README.md" "$out/v3-README.md"
download_url "https://api.github.com/repos/DanielLin94144/Full-Duplex-Bench" "$out/github-api.json"

if [[ "${FULL_DUPLEX_BENCH_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url.git" "$out/repository"
fi

echo "Downloaded Full-Duplex-Bench documentation to: $out"
echo "Set FULL_DUPLEX_BENCH_CLONE_REPO=1 to clone the public code repository."
echo "Benchmark audio is hosted on Google Drive and requires manual download:"
echo "v1/v1.5: https://drive.google.com/drive/folders/1DtoxMVO9_Y_nDs2peZtx3pw-U2qYgpd3?usp=sharing"
echo "v3: https://drive.google.com/file/d/1SO_4MTazWQ_jvCx0dtmpQ-t40bdd07yz/view?usp=sharing"
