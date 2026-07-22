#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir dcase2025_audioqa)"
challenge_url="${DCASE2025_AUDIOQA_CHALLENGE_URL:-https://dcase.community/challenge2025/task-audio-question-answering}"
paper_url="${DCASE2025_AUDIOQA_PAPER_URL:-https://arxiv.org/abs/2505.07365}"
dataset_url="${DCASE2025_AUDIOQA_DATASET_URL:-https://huggingface.co/datasets/PeacefulData/2025_DCASE_AudioQA_Official}"
api_url="${DCASE2025_AUDIOQA_API_URL:-https://huggingface.co/api/datasets/PeacefulData/2025_DCASE_AudioQA_Official}"

download_url "$challenge_url" "$out/dcase-2025-task-5.html"
download_url "$paper_url" "$out/arxiv-2505.07365.html"
download_url "$api_url" "$out/hugging-face-api.json"

manual_required \
  "DCASE 2025 Task 5 AudioQA" \
  "Saved the official challenge page, paper page, and public repository metadata to $out." \
  "The Hugging Face dataset is auto-approved gated; sign in and submit the requested identity and affiliation fields." \
  "Dataset card: $dataset_url" \
  "After approval, run: huggingface-cli login" \
  "Then download explicitly: huggingface-cli download --repo-type dataset PeacefulData/2025_DCASE_AudioQA_Official --local-dir data/DCASE2025-AudioQA" \
  "Review the MIT card metadata and all upstream source-audio terms; do not commit audio, credentials, or tokens."
