#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir openstbench)"
repo_url="${OPENSTBENCH_REPO_URL:-https://github.com/sjtuayj/OpenSTBench}"
paper_url="${OPENSTBENCH_PAPER_URL:-https://arxiv.org/abs/2605.30792}"
hf_base_url="${OPENSTBENCH_HF_BASE_URL:-https://huggingface.co/datasets/ayj111/openstbench-paired-set}"
hf_api_url="${OPENSTBENCH_HF_API_URL:-https://huggingface.co/api/datasets/ayj111/openstbench-paired-set}"

download_url "$paper_url" "$out/arxiv-2605.30792.html"
download_url "$repo_url/raw/main/README.md" "$out/README.md"
download_url "$repo_url/raw/main/LICENSE" "$out/LICENSE"
download_url "$repo_url/raw/main/THIRD_PARTY_NOTICES.md" "$out/THIRD_PARTY_NOTICES.md"
download_url "$hf_base_url/raw/main/README.md" "$out/paired-set-README.md"
download_url "$hf_api_url" "$out/paired-set-api.json"

if [[ "${OPENSTBENCH_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url.git" "$out/repo"
else
  echo "Skipping the evaluation-toolkit clone. Set OPENSTBENCH_CLONE_REPO=1 to clone it."
fi

if [[ "${OPENSTBENCH_DOWNLOAD_PAIRED_SET:-0}" == "1" ]]; then
  hf_download_dataset "ayj111/openstbench-paired-set" "$out/paired-set"
else
  echo "Skipping the approximately 511 MiB paired-set snapshot. Set OPENSTBENCH_DOWNLOAD_PAIRED_SET=1 to download it."
fi

cat <<MSG
OpenSTBench metadata download complete: $out

The paired-set card declares license "other". Review LibriTTS attribution,
synthesized-reference terms, OpenSTBench notices, and each separately sourced
component dataset before reuse or redistribution.
MSG
