#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir comind)"
base_url="https://comind.ethz.ch"
annotations_url="$base_url/dataset/annotations"

download_url "$base_url/" "$out/project-page.html"
download_url \
  "https://export.arxiv.org/api/query?id_list=2607.06691" \
  "$out/arxiv.xml"
download_url \
  "$base_url/scripts/comind_download.py" \
  "$out/comind_download.py"
download_url \
  "$annotations_url/healthcheck.json" \
  "$out/annotations-healthcheck.json"

if [[ "${COMIND_DOWNLOAD_ANNOTATIONS:-0}" != "1" ]]; then
  cat <<EOF
Downloaded CoMind documentation, official downloader, and annotation manifest.
The three annotation JSON files total approximately 5.0 MiB and are opt-in:

  COMIND_DOWNLOAD_ANNOTATIONS=1 scripts/download/comind.sh

The full 41-hour multimodal corpus is much larger. Review the project's
CC BY-NC 4.0 notice, then use the saved first-party component-selecting script:

  python3 "$out/comind_download.py" --help
EOF
  echo "CoMind metadata download complete: $out"
  exit 0
fi

download_url \
  "$annotations_url/dataset_handover_consolidated.json" \
  "$out/annotations/dataset_handover_consolidated.json"
download_url \
  "$annotations_url/dataset_joint_attention_consolidated.json" \
  "$out/annotations/dataset_joint_attention_consolidated.json"
download_url \
  "$annotations_url/dataset_scoia_consolidated.json" \
  "$out/annotations/dataset_scoia_consolidated.json"

echo "CoMind requested annotation download complete: $out"
