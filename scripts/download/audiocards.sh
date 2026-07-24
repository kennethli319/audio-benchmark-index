#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir audiocards)"
zenodo_api="${AUDIOCARDS_ZENODO_API:-https://zenodo.org/api/records/17237181}"

download_url "$zenodo_api" "$out/zenodo-record.json"
download_url \
  "$zenodo_api/files/asfx_eval_cards.csv/content" \
  "$out/asfx_eval_cards.csv"
download_url \
  "https://sites.google.com/view/audiocards/" \
  "$out/project.html"
download_url \
  "https://arxiv.org/abs/2602.13835" \
  "$out/audiocards-paper.html"
download_url \
  "https://arxiv.org/abs/2607.21424" \
  "$out/evaluation-framework-paper.html"
download_url \
  "https://www.adobe.com/products/audition/offers/adobeauditiondlcsfx.html" \
  "$out/adobe-sound-effects.html"

cat <<'EOF'
AudioCards metadata download complete.

The CSV contains filenames and structured annotations, not audio. Download the
matching Adobe Audition Sound Effects archives from Adobe's official page after
reviewing the Adobe Audition and related-software EULA. The four extra acoustic
fields described by arXiv:2607.21424 are not in the current Zenodo release.
EOF
echo "AudioCards requested download complete: $out"
