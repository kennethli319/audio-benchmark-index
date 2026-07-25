#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir mmar)"
repo_base_url="${MMAR_REPO_BASE_URL:-https://raw.githubusercontent.com/ddlBoJack/MMAR/main}"
repo_api_url="${MMAR_REPO_API_URL:-https://api.github.com/repos/ddlBoJack/MMAR}"
hf_base_url="${MMAR_HF_BASE_URL:-https://huggingface.co/datasets/BoJack/MMAR}"
hf_api_url="${MMAR_HF_API_URL:-https://huggingface.co/api/datasets/BoJack/MMAR}"

download_url "$repo_base_url/README.md" "$out/repository-README.md"
download_url "$repo_base_url/MMAR-meta.jsonl" "$out/MMAR-meta.jsonl"
download_url "$repo_base_url/code/evaluation.py" "$out/evaluation.py"
download_url "$repo_base_url/code/evaluation_rubrics.py" "$out/evaluation_rubrics.py"
download_url "$repo_api_url" "$out/github-api.json"
download_url "$hf_base_url/raw/main/README.md" "$out/dataset-card.md"
download_url "$hf_api_url" "$out/hugging-face-api.json"

if [[ "${MMAR_DOWNLOAD_AUDIO:-0}" == "1" ]]; then
  hf_download_dataset "BoJack/MMAR" "$out/hugging-face"
else
  echo "Skipping the approximately 2.99 GB Hugging Face audio snapshot. Set MMAR_DOWNLOAD_AUDIO=1 to download it."
fi

cat <<MSG
MMAR metadata download complete: $out

MMAR-meta.jsonl includes the released MMAR-Rubrics reasoning annotations and
instance-level criteria. The Hugging Face card declares CC BY-NC 4.0 for its
snapshot, but the repository does not state a separate license for the later
rubric annotations or evaluation code. Review source-media terms before use.
MSG
