#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir process_2)"

download_url \
  "https://huggingface.co/api/datasets/CognoSpeak/PROCESS-2" \
  "$out/process-2-hugging-face-api.json"
download_url \
  "https://raw.githubusercontent.com/CognoSpeak/PROCESS-2/main/README.md" \
  "$out/process-2-code-README.md"
download_url \
  "https://raw.githubusercontent.com/CognoSpeak/PROCESS-2/main/LICENSE" \
  "$out/process-2-code-LICENSE"
download_url \
  "https://api.github.com/repos/CognoSpeak/PROCESS-2" \
  "$out/process-2-code-repository.json"
download_url \
  "https://zenodo.org/api/records/19900225" \
  "$out/process-2-code-zenodo.json"

manual_required \
  "PROCESS-2 participant speech, transcripts, and clinical metadata" \
  "Sign in to Hugging Face, review the Data Use Agreement, and request owner approval:" \
  "  https://huggingface.co/datasets/CognoSpeak/PROCESS-2" \
  "The helper never authenticates, requests access, or downloads protected participant data."
