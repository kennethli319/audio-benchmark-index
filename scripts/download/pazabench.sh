#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir pazabench)"
space_root="https://huggingface.co/spaces/microsoft/paza-bench"

download_url "https://huggingface.co/api/spaces/microsoft/paza-bench" "$out/huggingface-space-api.json"
download_url "$space_root/raw/main/README.md" "$out/README.md"
download_url "$space_root/raw/main/src/about.py" "$out/about.py"
download_url "$space_root/raw/main/src/data/dataset_group_metadata.json" "$out/dataset-group-metadata.json"
download_url \
  "https://www.microsoft.com/en-us/research/blog/paza-introducing-automatic-speech-recognition-benchmarks-and-models-for-low-resource-languages/" \
  "$out/microsoft-research-announcement.html"

cat <<'EOF'
Downloaded official PazaBench documentation, Space metadata, and dataset-group
inventory only.

The public Space does not publish a standalone unified audio snapshot or frozen
item manifest. Obtain each named evaluation corpus from its upstream provider
and review its separate license/access terms. This helper intentionally does
not download source audio or model weights.
EOF

echo "PazaBench metadata download complete: $out"
