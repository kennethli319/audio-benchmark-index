#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir wildsongbench)"
revision="e361b85a8d7365d3079fa9647641a87ce3c8c5b5"
base="https://huggingface.co/datasets/m-a-p/WildSongBench/resolve/$revision"

download_url "https://huggingface.co/api/datasets/m-a-p/WildSongBench/revision/$revision" "$out/huggingface-dataset.json"
for file in README.md SHA256SUMS prompts.jsonl \
  benchmark/reproduction_manifest.jsonl benchmark/results.md \
  benchmark/benchmark-results.csv benchmark/benchmark-results.json; do
  download_url "$base/$file" "$out/$file"
done

cat <<'EOF'
Downloaded pinned WildSongBench prompts, exact inputs/seeds, reference results,
and metadata. No audio, evaluator archive, weights, or executable code fetched.

Review the official dataset card and component terms before use: benchmark
licensing is unspecified and SongBench has academic-only/noncommercial terms.
The official 506 MB evaluator archive and roughly 83 GB of evaluator weights
remain manual downloads. Q3O requires an 80 GB GPU; other metrics support 24 GB.
Keep candidate-selection protocols separate when comparing reported results.
The upstream README checksum is stale at this revision; see the research audit.
The release audit verified the five benchmark payloads against published hashes.
EOF

echo "WildSongBench lightweight-artifact download complete: $out"
