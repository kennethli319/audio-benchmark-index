#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir art)"
hf_download_dataset "amu-cai/ART" "$out"

cat <<'EOF'
Downloaded the public ART dataset, including all nine task configurations.
The dataset is licensed CC BY 4.0.

Load the complete test split with:
  from datasets import load_dataset
  dataset = load_dataset("amu-cai/ART", "all", split="test")
EOF

echo "ART download complete: $out"
