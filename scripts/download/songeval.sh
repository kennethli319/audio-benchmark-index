#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir songeval)"
hf_base_url="https://huggingface.co/datasets/ASLP-lab/SongEval"
hf_api_url="https://huggingface.co/api/datasets/ASLP-lab/SongEval"
repo_raw_url="https://raw.githubusercontent.com/ASLP-lab/SongEval/main"

download_url "$hf_base_url/raw/main/README.md" "$out/dataset-README.md"
download_url "$hf_api_url" "$out/hugging-face-api.json"
download_url "$hf_base_url/resolve/main/metadata.jsonl" "$out/metadata.jsonl"
download_url "$repo_raw_url/README.md" "$out/toolkit-README.md"
download_url "$repo_raw_url/LICENSE" "$out/toolkit-LICENSE"
download_url "https://arxiv.org/abs/2505.10793" "$out/paper.html"

if [[ "${SONGEVAL_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "ASLP-lab/SongEval" "$out/hugging-face"
else
  cat <<'EOF'
Downloaded SongEval documentation and the approximately 1.27 MB rating JSONL.

Set SONGEVAL_DOWNLOAD_HF=1 to fetch the public, ungated Hugging Face snapshot
(approximately 16.1 GB). The dataset card declares CC BY-NC-SA 4.0, but the
paper describes commercial-generator outputs and real/bad-case songs without
per-item provenance. Review service, generated-output, and music rights.
EOF
fi

echo "SongEval metadata download complete: $out"
