#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir musicai_background_music)"
revision="b197f0db8f618674bc32ac0b6b970f57048b50e9"
repo="Elfsong/musicai-background-music-audio-llm-benchmark"
base="https://huggingface.co/datasets/$repo/raw/$revision"
release="releases/2026-09-18"

# Documentation and metadata only. No media/archive or executable-code glob.
download_url "https://huggingface.co/api/datasets/$repo/revision/$revision" "$out/dataset-info.json"
for file in README.md MUSIC_ATTRIBUTION.md data/full_instrumental_sources.yaml \
  data/benchmarks/selection_summary_2000.json \
  "$release/README.md" "$release/COMPLETE.json" "$release/MANIFEST.sha256" \
  "$release/analysis/data/audit/extension_selection.json"; do
  download_url "$base/$file" "$out/$file"
done
for version in audio-regenerated-20260916-v1 benchmark-extension-20260916-v1; do
  file="$release/audio/$version/AUDIO_BACKUP_COMPLETE.json"
  download_url "$base/$file" "$out/$file"
done

cat <<'NOTICE'
Saved pinned public release documentation, source-attribution configuration,
selection summaries and archive completion receipts only. No media, archive,
model weights, executable code, credentials or license acceptance.

The two audio cohorts alone contain about 149.57 GB in 550 TAR batches.
Retrieve selected artifacts manually only after reviewing upstream rights:
https://huggingface.co/datasets/Elfsong/musicai-background-music-audio-llm-benchmark
There is no aggregate data/code license. Three ChMusic tracks explicitly have
pending redistribution scope; music has mixed CC/NC/SA terms, and extension
provenance references GSM-Symbolic generated-data CC BY-NC-ND terms.

Verify each selected archive against MANIFEST.sha256 and its READY receipt.
Use a traversal-safe extractor into an empty directory and verify member hashes.
Preserve immutable manifests; keep local path resolutions in a separate index.
Regenerated audio is not the unavailable original historical speech. Retain
cohort, paired-batch, output-budget and scoring-version distinctions. Expanded
original tasks use scores-ifeval-symbols-v2; the final Voxtral Small run is
voxtral_small_24b_closed1024. Earlier scores/64-token runs are not the final matrix.
NOTICE

echo "MusicAI background-music metadata download complete: $out"
