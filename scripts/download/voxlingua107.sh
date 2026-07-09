#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir voxlingua107)"

download_url \
  "https://huggingface.co/datasets/TalTechNLP/VoxLingua107/raw/main/README.md" \
  "$out/README.md"
download_url \
  "https://huggingface.co/datasets/TalTechNLP/VoxLingua107/raw/main/VoxLingua107.py" \
  "$out/VoxLingua107.py"
download_url \
  "https://huggingface.co/datasets/TalTechNLP/VoxLingua107/raw/main/dataset_info.json" \
  "$out/dataset_info.json"

if [[ "${VOXLINGUA107_DOWNLOAD_HF:-0}" == "1" ]]; then
  echo "Downloading the mirrored VoxLingua107 Hugging Face dataset snapshot."
  echo "This may be large; make sure you have accepted the upstream terms and have enough disk space."
  hf_download_dataset "TalTechNLP/VoxLingua107" "$out/hf_snapshot"
else
  echo "Saved VoxLingua107 metadata to: $out"
  echo "Set VOXLINGUA107_DOWNLOAD_HF=1 to attempt the larger Hugging Face snapshot."
  echo "Example with datasets: load_dataset(\"TalTechNLP/VoxLingua107\", \"en\")"
fi
