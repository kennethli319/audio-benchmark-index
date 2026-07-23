#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir lvomnibench)"
repo_url="${LVOMNIBENCH_REPO_URL:-https://github.com/KD-TAO/LVOmniBench.git}"
raw_base="${LVOMNIBENCH_RAW_BASE_URL:-https://raw.githubusercontent.com/KD-TAO/LVOmniBench/main}"
hf_repo="${LVOMNIBENCH_HF_REPO:-KD-TAO/LVOmniBench}"

download_url "$raw_base/README.md" "$out/README.md"
download_url "https://api.github.com/repos/KD-TAO/LVOmniBench" "$out/github-repository.json"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/huggingface-dataset.json"

if [[ "${LVOMNIBENCH_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/LVOmniBench"
else
  echo "Skipping evaluation repo clone. Set LVOMNIBENCH_CLONE_REPO=1 to clone/update it."
fi

if [[ "${LVOMNIBENCH_DOWNLOAD_HF:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded LVOmniBench documentation and repository metadata only.
The approximately 187.4 GB Hugging Face dataset is gated. Apply through the
official dataset page and authenticate locally before requesting the snapshot.
No benchmark-level data or code license is stated in the official release;
review the access form and source-video rights before use.

Set LVOMNIBENCH_DOWNLOAD_HF=1 after access is approved.
EOF
  echo "LVOmniBench metadata download complete: $out"
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/huggingface"
echo "LVOmniBench requested download complete: $out/huggingface"
