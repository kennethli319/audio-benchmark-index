#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir cose_e)"
revision="82bf4b49499bcaa6f4cf6a67bebfab3ee2affcbb"
repo="ServiceNow-AI/asr_codeswitched"

download_url "https://huggingface.co/api/datasets/$repo/revision/$revision" "$out/huggingface-metadata.json"
download_url "https://huggingface.co/api/datasets/$repo/tree/$revision?recursive=true&limit=1000" "$out/huggingface-tree.json"
download_url "https://huggingface.co/datasets/$repo/raw/$revision/README.md" "$out/README.md"

cat <<'EOF'
Downloaded pinned CoSE-E card and public release metadata only.
No audio, Parquet shards, executable code, model weights, or API evaluation.

Data reuse terms are unspecified. Review the owner release and clarify rights
before separately obtaining the five test Parquets (713,847,034 bytes):
https://huggingface.co/datasets/ServiceNow-AI/asr_codeswitched

The owner reports 1,212 records across en_de, en_es, en_fr, en_fr_ca, en_zh.
Only en_zh declares additional monolingual audio in its released schema.
No standalone CoSE-E evaluator was located; paper prompts and judge settings
are required for AER/SWER. AER is a QA proxy, not agent task completion.
Preserve language-specific normalization, per-utterance WER averaging,
reference-answer provenance, and judge-failure counts when reporting scores.
EOF

echo "CoSE-E metadata download complete: $out"
