#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir omnibench)"
raw_base="${OMNIBENCH_RAW_BASE_URL:-https://raw.githubusercontent.com/multimodal-art-projection/OmniBench/main}"
repo_url="${OMNIBENCH_REPO_URL:-https://github.com/multimodal-art-projection/OmniBench.git}"
hf_repo="${OMNIBENCH_HF_REPO:-m-a-p/OmniBench}"

download_url "$raw_base/README.md" "$out/README.md"
download_url "https://api.github.com/repos/multimodal-art-projection/OmniBench" "$out/github_repo.json"
download_url "https://huggingface.co/datasets/$hf_repo/raw/main/README.md" "$out/hf_README.md"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/hf_api.json"

if [[ "${OMNIBENCH_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/OmniBench"
else
  echo "Skipping repository clone. Set OMNIBENCH_CLONE_REPO=1 to clone/update it."
fi

if [[ "${OMNIBENCH_DOWNLOAD_HF:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded OmniBench documentation and repository metadata only. The public
Hugging Face release contains embedded image and audio media and reports
approximately 1.26 GB of downloads.

Set OMNIBENCH_DOWNLOAD_HF=1 to request the full snapshot after reviewing the
unspecified benchmark and component-media terms.
EOF
  echo "OmniBench metadata download complete: $out"
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/hf"

echo "OmniBench requested download complete: $out"
