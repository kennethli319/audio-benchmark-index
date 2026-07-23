#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir gigaspeechbench)"
repo_base_url="${GIGASPEECHBENCH_REPO_BASE_URL:-https://raw.githubusercontent.com/SpeechColab/GigaSpeechBench/main}"
repo_api_url="${GIGASPEECHBENCH_REPO_API_URL:-https://api.github.com/repos/SpeechColab/GigaSpeechBench}"
hf_api_url="${GIGASPEECHBENCH_HF_API_URL:-https://huggingface.co/api/datasets/speechcolab/GigaSpeechBench}"
paper_url="${GIGASPEECHBENCH_PAPER_URL:-https://arxiv.org/abs/2606.28884}"

download_url "$repo_base_url/README.md" "$out/repository-README.md"
download_url "$repo_api_url" "$out/github-api.json"
download_url "$hf_api_url" "$out/hugging-face-api.json"
download_url "$paper_url" "$out/arxiv-2606.28884.html"

if [[ "${GIGASPEECHBENCH_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "speechcolab/GigaSpeechBench" "$out/hugging-face"
else
  cat <<'MSG'
GigaSpeechBench documentation and repository metadata download complete.

The public Hugging Face repository is approximately 86.3 GB. To download it
explicitly, run:

  GIGASPEECHBENCH_DOWNLOAD_HF=1 scripts/download/gigaspeechbench.sh

No dataset or code license is currently declared. Public, ungated access does
not establish redistribution or commercial-use rights.
MSG
fi
