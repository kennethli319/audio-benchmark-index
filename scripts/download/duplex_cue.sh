#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir duplex_cue)"
revision="a9c305ca39a89dd84b7ce9dda88f868a58eb8d56"
base="https://huggingface.co/datasets/besimple-ai/duplex-cue/resolve/$revision"

download_url "https://huggingface.co/api/datasets/besimple-ai/duplex-cue/revision/$revision" "$out/huggingface-dataset.json"
for file in README.md LICENSE_DATA.md LICENSE_CODE.md ETHICS_AND_CONSENT.md \
  THIRD_PARTY_NOTICES.md sample_manifest.json scripts/README.md \
  paper/README.md paper/duplex-cue.tex \
  paper/provenance/camera-ready-release.json paper/provenance/cohort-audit.json \
  paper/provenance/response-results.json trials/selection.json trials/results.json; do
  download_url "$base/$file" "$out/$file"
done

cat <<'EOF'
Downloaded pinned Duplex Cue documentation, public-subset manifest/results,
and manuscript source. No audio, models, or executable code were fetched.

Only 8 conversations and 15 trials are public, not the 300-trial paper study.
The October 2 manuscript update does not expand this small, unbalanced subset.
It cannot reproduce the full-study aggregates. Review LICENSE_DATA.md (CC BY-NC
4.0), LICENSE_CODE.md (MIT), participant safeguards, and third-party notices.

The approximately 2.83 GB snapshot remains a manual download through the owner
dataset page. Scoring requires individual response review; running the upstream
pipeline may invoke external transcription, voice-conversion, and GPU services.
Nothing here installs or executes that pipeline or accepts provider terms.
EOF

echo "Duplex Cue lightweight-artifact download complete: $out"
