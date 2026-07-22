#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir daily_omni)"
raw_base="${DAILY_OMNI_RAW_BASE_URL:-https://raw.githubusercontent.com/Lliar-liar/Daily-Omni/main}"
repo_url="${DAILY_OMNI_REPO_URL:-https://github.com/Lliar-liar/Daily-Omni.git}"
hf_repo="${DAILY_OMNI_HF_REPO:-liarliar/Daily-Omni}"

download_url "$raw_base/README.md" "$out/README.md"
download_url "https://huggingface.co/datasets/$hf_repo/raw/main/README.md" "$out/hf_README.md"
download_url "https://huggingface.co/datasets/$hf_repo/resolve/main/qa.json" "$out/qa.json"

if [[ "${DAILY_OMNI_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/Daily-Omni"
else
  echo "Skipping evaluation repo clone. Set DAILY_OMNI_CLONE_REPO=1 to clone/update it."
fi

if [[ "${DAILY_OMNI_DOWNLOAD_HF:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded Daily-Omni documentation and QA metadata only. The public Hugging
Face repository uses approximately 3.9 GB and includes source videos governed
by component-dataset and source-media terms.

Set DAILY_OMNI_DOWNLOAD_HF=1 to request the full snapshot.
EOF
  echo "Daily-Omni metadata download complete: $out"
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/hf"

echo "Daily-Omni requested download complete: $out"
