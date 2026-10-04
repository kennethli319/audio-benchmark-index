#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir audioicl_bench)"
repo_revision="37876ef717d0931a8c4e9389be445aea7cd3c4bc"
data_revision="f0bbe5af154068aa450d089eb57942755ebc114e"
base="https://raw.githubusercontent.com/robert0518/AudioICL-Bench/$repo_revision"

download_url "$base/README.md" "$out/README.md"
download_url "$base/meta/meta_k1.jsonl" "$out/meta/meta_k1.jsonl"
download_url "https://api.github.com/repos/robert0518/AudioICL-Bench/git/trees/$repo_revision?recursive=1" "$out/repository-tree.json"
download_url "https://huggingface.co/api/datasets/hongzz-18/AudioICL-Bench/revision/$data_revision" "$out/huggingface-dataset.json"

cat <<'EOF'
Downloaded pinned documentation, repository tree, Hub metadata and k=1 episodes.
No audio, models or executable code were downloaded or run.

The five k=1..5 manifests each contain 300 episodes for each of nine tasks.
Seven tasks have all referenced waveforms in the Hub snapshot. AudioRemap's
one-shot anchors and AnomalyDetect's recordings are missing. The scorer counts
returned predictions, while the Qwen2.5 runner can skip audio-loading failures:
audit manifest coverage and duplicate IDs before interpreting scores.

Data and code licenses are unspecified; upstream recordings retain their terms.
Review the owner resources before any reuse or manual download:
https://github.com/robert0518/AudioICL-Bench/tree/37876ef717d0931a8c4e9389be445aea7cd3c4bc
https://huggingface.co/datasets/hongzz-18/AudioICL-Bench/tree/f0bbe5af154068aa450d089eb57942755ebc114e

The approximately 2.19 GB audio snapshot remains manual. Manifests reference
data/<task>/... relative to base_dir. Other manifests, the scorer and inference
scripts are in the pinned GitHub tree. Match the paper's 64-token budget,
explicit Morse alphabet bank, prompt configuration and task coverage; defaults
alone do not reproduce the paper. Never pool incomplete tasks into a full-suite
score. AudioRemap and AnomalyDetect reuse IDs with different queries across k.
EOF

echo "AudioICL-Bench metadata download complete: $out"
