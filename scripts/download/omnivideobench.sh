#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir omnivideobench)"
repo_url="${OMNIVIDEOBENCH_REPO_URL:-https://github.com/NJU-LINK/OmniVideoBench.git}"
raw_base="${OMNIVIDEOBENCH_RAW_BASE_URL:-https://raw.githubusercontent.com/NJU-LINK/OmniVideoBench/main}"
hf_repo="${OMNIVIDEOBENCH_HF_REPO:-NJU-LINK/OmniVideoBench}"

download_url "$raw_base/README.md" "$out/README.md"
download_url "https://api.github.com/repos/NJU-LINK/OmniVideoBench" "$out/github-repository.json"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/huggingface-dataset.json"

if [[ "${OMNIVIDEOBENCH_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/OmniVideoBench"
else
  echo "Skipping evaluation repo clone. Set OMNIVIDEOBENCH_CLONE_REPO=1 to clone/update it."
fi

if [[ "${OMNIVIDEOBENCH_DOWNLOAD_HF:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded OmniVideoBench documentation and repository metadata only.
The approximately 114 GB Hugging Face dataset is gated. Apply through the
official dataset page, accept the non-commercial/no-redistribution conditions,
and authenticate locally before requesting the snapshot.

Set OMNIVIDEOBENCH_DOWNLOAD_HF=1 after access is approved.
EOF
  echo "OmniVideoBench metadata download complete: $out"
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/huggingface"
echo "OmniVideoBench requested download complete: $out/huggingface"
