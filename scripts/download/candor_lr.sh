#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

revision="da6f6bfc56cd9c688dfb0eb8db6a83c970e9b6fa"
out="$(dataset_dir candor_lr)/$revision"
base="https://raw.githubusercontent.com/rishabhjain16/lipreading-data-guide/$revision/Candor"

download_url "https://api.github.com/repos/rishabhjain16/lipreading-data-guide/git/trees/$revision?recursive=1" "$out/repository-tree.json"
download_url "$base/README.md" "$out/README.md"
download_url "$base/docs/DATASET_STRUCTURE.md" "$out/DATASET_STRUCTURE.md"
for split in train valid test; do
  download_url "$base/splits/candor-$split.id" "$out/splits/candor-$split.id"
done

cat <<'EOF'
Saved pinned public Candor-LR documentation and session lists only.
Manual access is required for the CANDOR recordings and matching Speechmatics
word-aligned transcripts. Start at the corpus owner's page and obtain the
applicable license and access instructions:
https://www.betterup.com/research/candor-research
https://arxiv.org/abs/2609.10394

The public pipeline and split lists have no verified reuse license:
https://github.com/rishabhjain16/lipreading-data-guide/tree/da6f6bfc56cd9c688dfb0eb8db6a83c970e9b6fa/Candor
Clarify terms before use. No media, transcripts, models, executable code,
credentials, access requests, or license acceptance are handled by this helper.

Reuse the fixed 1552/22/82 train/valid/test session lists, not the separate
random 70/15/15 split generator. Session IDs are disjoint, but full test-speaker
disjointness requires checking the licensed speaker mapping. The hour-budget
generator selects whole sessions with at least one single-session speaker.
Preserve skipped-file logs and verify final manifests before reporting WER.
EOF

echo "Candor-LR metadata saved to: $out"
exit 2
