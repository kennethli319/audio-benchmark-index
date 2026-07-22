#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir msu_bench)"
repo_base_url="${MSU_BENCH_REPO_BASE_URL:-https://raw.githubusercontent.com/ASLP-lab/MSU-Bench/main}"
repo_api_url="${MSU_BENCH_REPO_API_URL:-https://api.github.com/repos/ASLP-lab/MSU-Bench}"
hf_base_url="${MSU_BENCH_HF_BASE_URL:-https://huggingface.co/datasets/ASLP-lab/MSU-Benchmark}"
hf_api_url="${MSU_BENCH_HF_API_URL:-https://huggingface.co/api/datasets/ASLP-lab/MSU-Benchmark}"
paper_url="${MSU_BENCH_PAPER_URL:-https://arxiv.org/abs/2606.22868}"

download_url "$repo_base_url/README.md" "$out/repository-README.md"
download_url "$repo_base_url/LICENSE" "$out/repository-LICENSE"
download_url "$repo_api_url" "$out/github-api.json"
download_url "$hf_base_url/raw/main/README.md" "$out/dataset-card.md"
download_url "$hf_api_url" "$out/hugging-face-api.json"
download_url "$paper_url" "$out/arxiv-2606.22868.html"
download_url "$hf_base_url/resolve/main/data/test.jsonl" "$out/test.jsonl"

if [[ "${MSU_BENCH_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "ASLP-lab/MSU-Benchmark" "$out/hugging-face"
else
  echo "Skipping the approximately 2.5 GB audio/annotation snapshot. Set MSU_BENCH_DOWNLOAD_HF=1 to download it."
fi

cat <<MSG
MSU-Bench metadata and QA download complete: $out

The dataset card declares CC BY-NC 4.0 and non-commercial academic-research
use. Review the terms and provenance of the third-party source media before
redistribution; the repository's MIT license applies only to code.
MSG
