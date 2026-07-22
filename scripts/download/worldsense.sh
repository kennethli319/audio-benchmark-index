#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir worldsense)"
raw_base="${WORLDSENSE_RAW_BASE_URL:-https://raw.githubusercontent.com/JaaackHongggg/WorldSense/main}"
repo_url="${WORLDSENSE_REPO_URL:-https://github.com/JaaackHongggg/WorldSense.git}"
hf_repo="${WORLDSENSE_HF_REPO:-honglyhly/WorldSense}"

download_url "$raw_base/README.md" "$out/README.md"
download_url "https://huggingface.co/datasets/$hf_repo/raw/main/README.md" "$out/hf_README.md"
download_url "https://huggingface.co/datasets/$hf_repo/resolve/main/worldsense_qa.json" "$out/worldsense_qa.json"

if [[ "${WORLDSENSE_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/WorldSense"
else
  echo "Skipping project repo clone. Set WORLDSENSE_CLONE_REPO=1 to clone/update it."
fi

if [[ "${WORLDSENSE_DOWNLOAD_HF:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded WorldSense documentation and QA metadata only. The public Hugging
Face repository uses approximately 18.1 GB. The paper and dataset card conflict
on licensing, and the videos retain component-source media considerations.

Set WORLDSENSE_DOWNLOAD_HF=1 to request the full snapshot after reviewing terms.
EOF
  echo "WorldSense metadata download complete: $out"
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/hf"

echo "WorldSense requested download complete: $out"
