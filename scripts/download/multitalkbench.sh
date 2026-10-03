#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir multitalkbench)"
dataset_id="MultiTalk/MultiTalkBench"
dataset_url="https://huggingface.co/datasets/$dataset_id"

download_url "$dataset_url/raw/main/README.md" "$out/README.md"
download_url "https://huggingface.co/api/datasets/$dataset_id" "$out/huggingface-dataset.json"
download_url "$dataset_url/resolve/main/metadata.jsonl" "$out/metadata.jsonl"

cat <<EOF
MultiTalkBench documentation and test manifest saved to: $out

The dataset card declares CC BY-SA 4.0; upstream recording terms still apply.
The paper claims Apache-2.0 for evaluation code, but its linked code release
could not be verified on 2026-10-03. Review the official sources before use:
  $dataset_url
  https://arxiv.org/abs/2609.36903

The full snapshot is approximately 5.19 GB, including FLAC audio and an
audio-bearing Parquet copy. Download it only by explicitly setting:
  MULTITALKBENCH_DOWNLOAD_HF=1 scripts/download/multitalkbench.sh
EOF

if [[ "${MULTITALKBENCH_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "$dataset_id" "$out/hf"
fi
