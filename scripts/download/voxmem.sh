#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir voxmem)"
data_revision="b1345132ca4d10988b0bd2c9e0afc5c0a9efa3a6"
code_revision="9adc4e4d357e7640332bb7693b86d33c63a27872"
base="https://huggingface.co/datasets/AudioMemory/voxmembench/resolve/$data_revision"
code_base="https://raw.githubusercontent.com/swagshaw/voxmem/$code_revision"

download_url "https://huggingface.co/api/datasets/AudioMemory/voxmembench/revision/$data_revision" "$out/huggingface-dataset.json"
for file in README.md LICENSE CITATION.cff metadata/cohort_manifest.json \
  metadata/statistics.json metadata/environmental_sources.json metadata/speakers.json \
  evaluation/answerable_judge_prompt.txt evaluation/ar_judge_prompt.txt \
  evaluation/candidate_system_prompt.txt evaluation/candidate_system_prompt.no_abstain.txt; do
  download_url "$base/$file" "$out/$file"
done
for file in README.md LICENSE; do
  download_url "$code_base/$file" "$out/code-docs/$file"
done

cat <<'EOF'
Downloaded pinned VoxMem documentation, source/cohort metadata, and prompts.
No audio, Parquet shards, weights, or executable code were fetched.

Review data LICENSE (CC BY-NC 4.0), source-clip terms, and code-docs/LICENSE
(MIT) before reuse. The 90 audio-bearing shards total about 64.4 GB. Select a
context/evidence configuration through the official dataset page if needed:
https://huggingface.co/datasets/AudioMemory/voxmembench
Streaming still transfers audio and is not a metadata-only preview.

The train-named split contains evaluation items. Score answerable and refusal
strata separately; refusal needs the abstention-permitting prompt. Exact-match
scoring is only a smoke check. Preserve the four documented nesting exceptions,
control questions, system-prompt delivery, and ungraded counts in comparisons.
Running the owner pipeline may require model weights and paid API services.
EOF

echo "VoxMem lightweight-artifact download complete: $out"
