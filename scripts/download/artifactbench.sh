#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

require_cmd shasum
out="$(dataset_dir artifactbench)"
revision="73f0f61d4ecf68ccb141c941a958a56f14677ba5"
code_revision="cebde51aa1cf713401930136c7095cb313acb2ac"
base="https://huggingface.co/datasets/intrect/artifactbench/resolve/$revision/v2"
code_base="https://raw.githubusercontent.com/Intrect-io/artifactbench/$code_revision"

for file in README.md LICENSE NOTICE.md; do
  download_url "$code_base/$file" "$out/runner-docs/$file"
done

# Explicit metadata/result allowlist: never fetch legacy Parquets or media.
for file in README.md LICENSES.md CHECKSUMS.sha256 \
  artifactbench_v2_primary_manifest.json fma_track_licenses.json \
  results/frozen_protocol_metrics.json \
  results/raw/artifactnet/chunk_failures.json \
  results/raw/artifactnet/finite_chunk_policy.json; do
  download_url "$base/$file" "$out/v2/$file"
done
for model in artifactnet clam deezer_ismir spectttra; do
  for file in track_probs.json inference_failures.json provenance.json; do
    download_url "$base/results/raw/$model/$file" "$out/v2/results/raw/$model/$file"
  done
done

(cd "$out/v2" && shasum --algorithm 256 --check CHECKSUMS.sha256)

cat <<'EOF'
Downloaded pinned ArtifactBench v2 metadata and results, plus runner docs.
No audio, legacy Parquet shards, weights, package installation, or code execution.

Metadata/results: CC BY-NC 4.0. Runner code: MIT. Upstream audio and model
rights remain separate; inspect LICENSES.md, FMA notices, and NOTICE.md.
The 828-entry v2 manifest is NOT a new audio bundle. Its 295 Suno/Udio
digest-only and 73 web-source references do not establish obtainable audio.
Acquire authorized originals separately and use the owner's digest-binding
tool; a full fresh-inference reproduction has not been verified by this index.

Use calibration-only thresholds, retain all 579 test attempts in coverage
reporting, and distinguish the 562-track common-success paired comparison.
Keep strict chunk-failure sensitivity and v1/v1.1 results separate from v2.
Owner runner: https://github.com/Intrect-io/artifactbench
EOF

echo "ArtifactBench metadata download complete: $out"
