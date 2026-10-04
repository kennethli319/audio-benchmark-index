#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir nsv_shift)"
revision="f5ae07067659e654e66612ce8b66c1e7e73858d0"
base="https://raw.githubusercontent.com/ChenzwNina/nsv-construction/$revision"

download_url "https://api.github.com/repos/ChenzwNina/nsv-construction/git/trees/$revision?recursive=1" "$out/github-tree.json"
for file in README.md docs/data_construction.md eval_set/catalog.json \
  eval_set/gold_answers.json eval_set/verified_pairs.json; do
  download_url "$base/$file" "$out/$file"
done

cat <<'EOF'
Downloaded pinned NSV-Shift documentation, catalog, gold labels, and pair IDs.
No audio, executable code, model weights, or API evaluation were fetched/run.

The public release has no declared data or code license. Clarify reuse terms
with the owner; the paper license does not license this dataset or software.
Inspect the official package before manually obtaining its approximately
70.1 MB of WAV files (53.1 MB for the 44 complete test conversations):
https://github.com/ChenzwNina/nsv-construction

Verify every conversation.wav before evaluation: the owner loader substitutes
silence for missing files. Use the runner's 29 Q3 options, not only the 27
listed in gold JSON. Q4 uses joint matching of response text, not similarity
to generated reference replies. Ties are incorrect; report failures and retain
the full 44-condition / 22-pair scope. Historical model-run logs are absent.
The owner runner may call paid model/judge APIs; this helper does not do so.
EOF

echo "NSV-Shift lightweight-artifact download complete: $out"
