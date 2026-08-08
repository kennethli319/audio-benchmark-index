#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir common_sense_facts_audio)"
dataset="slprl/common-sense-facts-audio"

download_url "https://arxiv.org/abs/2606.22473" "$out/paper.html"
download_url "https://pages.cs.huji.ac.il/adiyoss-lab/slm_work_in_text/" \
  "$out/project.html"
download_url "https://huggingface.co/datasets/$dataset/raw/main/README.md" \
  "$out/README.md"
download_url "https://huggingface.co/api/datasets/$dataset" \
  "$out/huggingface-dataset.json"
download_url "https://huggingface.co/api/datasets/$dataset/tree/main?recursive=true&expand=true" \
  "$out/huggingface-tree.json"

if [[ "${COMMON_SENSE_FACTS_AUDIO_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "$dataset" "$out/huggingface" \
    --include README.md \
    --include 'data/*.parquet'
fi

cat <<EOF
Common-Sense Facts Audio requested downloads complete: $out

The official Parquet file is about 52.8 MB and requires
COMMON_SENSE_FACTS_AUDIO_DOWNLOAD_HF=1. The dataset card declares only the
generic "other" license tag; confirm reuse terms with the owners.
EOF
