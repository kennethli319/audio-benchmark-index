#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

revision="8d4165f514befc282dc20360b2d28522d9523413"
out="$(dataset_dir vocal_affect_bench)/metadata-$revision"
base="https://huggingface.co/datasets/besimple-ai/vocal-affect-bench/resolve/$revision"

for file in README.md DATASET_CARD.md LICENSE data/metadata.jsonl data/predictions.csv data/leaderboard-summary.csv; do
  download_url "$base/$file" "$out/$file"
done

cat <<'NOTE'
Downloaded pinned VocalAffectBench documentation, license, clip manifest and
saved predictions only. No audio, executable code, credentials or API calls.

Audio has a custom license prohibiting voice cloning and requiring retention
of its copyright/license notice. Software/documentation are separately MIT.
Review the dataset card's evaluation-only intended use and contributor caveats.
Obtain the approximately 267 MB of WAV files manually after reviewing terms:
https://huggingface.co/datasets/besimple-ai/vocal-affect-bench/tree/8d4165f514befc282dc20360b2d28522d9523413

This snapshot has 280 clips, 40 per class. The arXiv abstract's 273-clip count
differs from the v2 HTML body and release. Pin the cohort for any comparison.
The released scorer excludes errors/empty mapped labels: Hume's 38.0% is
106/279; treating its failed request as incorrect gives 106/280 = 37.9%.
Reconcile all clip IDs, labels, correct flags, duplicates and missing rows.
Record provider versions, date, mappings, coverage and scoring denominators.
The nine-model release differs from the six-model paper snapshot. Running the
optional upstream model adapters may incur API costs; this helper runs none.
NOTE

echo "VocalAffectBench metadata download complete: $out"
