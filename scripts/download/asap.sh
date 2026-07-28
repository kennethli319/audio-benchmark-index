#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir asap)"
repo="${ASAP_REPO:-https://github.com/fosfrancesco/asap-dataset}"
raw="${ASAP_RAW_BASE:-https://raw.githubusercontent.com/fosfrancesco/asap-dataset/master}"

download_url "https://api.github.com/repos/fosfrancesco/asap-dataset" \
  "$out/repository.json"
download_url "$raw/README.md" "$out/README.md"
download_url "$raw/LICENSE.md" "$out/LICENSE.md"
download_url "$raw/metadata.csv" "$out/metadata.csv"
download_url "https://zenodo.org/api/records/4245489" \
  "$out/paper-record.json"
download_url "https://export.arxiv.org/api/query?id_list=2607.22000" \
  "$out/music-jepa-paper.xml"

if [[ "${ASAP_DOWNLOAD_ANNOTATIONS:-0}" == "1" ]]; then
  download_url "$raw/asap_annotations.json" "$out/asap_annotations.json"
else
  echo "Skipping ASAP combined annotations (~45 MB). Set ASAP_DOWNLOAD_ANNOTATIONS=1 to download them."
fi

if [[ "${ASAP_CLONE_DATASET:-0}" == "1" ]]; then
  clone_or_update "$repo" "$out/asap-dataset"
else
  echo "Skipping the ASAP repository clone (~448 MB). Set ASAP_CLONE_DATASET=1 to clone scores, MIDI performances, and annotations."
fi

cat <<'EOF'
ASAP does not redistribute audio. To reconstruct its 519 aligned audio
performances, obtain MAESTRO v2.0.0 from the official Magenta page and run
initialize_dataset.py from the cloned ASAP repository.
EOF

echo "ASAP metadata download complete: $out"
