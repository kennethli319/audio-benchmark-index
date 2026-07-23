#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir ave_compass)"
repo="https://github.com/NJU-LINK/AVE-Compass"
dataset="https://huggingface.co/datasets/NJU-LINK/AVE-Compass"

download_url "$repo/raw/main/README.md" "$out/README.md"
download_url "https://api.github.com/repos/NJU-LINK/AVE-Compass" "$out/github-api.json"
download_url "$dataset/raw/main/README.md" "$out/dataset-card.md"
download_url "https://huggingface.co/api/datasets/NJU-LINK/AVE-Compass" "$out/huggingface-api.json"

if [[ "${AVE_COMPASS_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "NJU-LINK/AVE-Compass" "$out/hf"
elif [[ "${AVE_COMPASS_DOWNLOAD_METADATA:-0}" == "1" ]]; then
  hf_download_dataset \
    "NJU-LINK/AVE-Compass" \
    "$out/hf-metadata" \
    --include "edit_instructions/*.json" \
    --include "checklists/*.json" \
    --include "videos/metadata.jsonl"
else
  cat <<'EOF'
Downloaded official AVE-Compass documentation and repository metadata only.

Set AVE_COMPASS_DOWNLOAD_METADATA=1 to fetch the lightweight instructions,
checklists, and Dataset Viewer metadata. Set AVE_COMPASS_DOWNLOAD_HF=1 to fetch
the complete public snapshot (approximately 442 MB, including source videos).
The dataset is CC BY-NC 4.0; review source-video rights before redistribution.
EOF
fi

echo "AVE-Compass metadata download complete: $out"
