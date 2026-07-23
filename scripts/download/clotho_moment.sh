#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir clotho_moment)"
project_url="${CLOTHO_MOMENT_PROJECT_URL:-https://h-munakata.github.io/Language-based-Audio-Moment-Retrieval/}"
hf_repo="${CLOTHO_MOMENT_HF_REPO:-lighthouse-emnlp2024/Clotho-Moment}"
hf_url="https://huggingface.co/datasets/$hf_repo"
repo_raw="${CLOTHO_MOMENT_REPO_RAW_URL:-https://raw.githubusercontent.com/line/lighthouse/main}"

download_url "$project_url" "$out/project-page.html"
download_url "$hf_url/raw/main/README.md" "$out/dataset-README.md"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/huggingface-dataset.json"
download_url "$repo_raw/LICENSE" "$out/lighthouse-LICENSE"
download_url "https://api.github.com/repos/line/lighthouse" "$out/github-repository.json"
download_url "https://export.arxiv.org/api/query?id_list=2409.15672" "$out/paper-arxiv.xml"
download_url \
  "https://dcase.community/challenge2026/task-audio-moment-retrieval-from-long-audio" \
  "$out/dcase2026-task6.html"

if [[ "${CLOTHO_MOMENT_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "$hf_repo" "$out/hugging-face"
else
  cat <<'EOF'
Skipping the large audio snapshot. Set CLOTHO_MOMENT_DOWNLOAD_HF=1 to download it.
The DCASE page advertises 16.1 GB, while the Hugging Face API reports about
213 GB of repository storage including history. Verify disk space and consider
downloading only the required split or WebDataset shards.
EOF
fi

echo "Clotho-Moment metadata download complete: $out"
