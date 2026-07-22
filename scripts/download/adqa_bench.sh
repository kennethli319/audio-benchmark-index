#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir adqa_bench)"
challenge_url="${ADQA_BENCH_CHALLENGE_URL:-https://dcase.community/challenge2026/task-audio-dependent-question-answering}"
paper_url="${ADQA_BENCH_PAPER_URL:-https://arxiv.org/abs/2509.21060}"
hf_base_url="${ADQA_BENCH_HF_BASE_URL:-https://huggingface.co/datasets/Harland/ADQA-Bench}"
hf_api_url="${ADQA_BENCH_HF_API_URL:-https://huggingface.co/api/datasets/Harland/ADQA-Bench}"

download_url "$challenge_url" "$out/dcase-2026-task-5.html"
download_url "$paper_url" "$out/arxiv-2509.21060.html"
download_url "$hf_base_url/raw/main/README.md" "$out/README.md"
download_url "$hf_api_url" "$out/hugging-face-api.json"
download_url "$hf_base_url/resolve/main/eval-noanswer.jsonl" "$out/eval-noanswer.jsonl"

if [[ "${ADQA_BENCH_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "Harland/ADQA-Bench" "$out/hugging-face"
else
  echo "Skipping the approximately 2.94 GB audio snapshot. Set ADQA_BENCH_DOWNLOAD_HF=1 to download it."
fi

cat <<MSG
ADQA-Bench metadata download complete: $out

The current public challenge release contains questions and choices without
answers. Review the Apache-2.0 card declaration and all component-dataset and
source-audio terms before redistributing the recordings.
MSG
