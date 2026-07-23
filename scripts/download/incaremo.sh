#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir incaremo)"

download_url \
  "https://raw.githubusercontent.com/zkw52/InCarEmo/main/readme" \
  "$out/README.md"
download_url \
  "https://api.github.com/repos/zkw52/InCarEmo" \
  "$out/github-repo.json"
download_url \
  "https://export.arxiv.org/api/query?id_list=2607.14683" \
  "$out/arxiv.xml"

manual_required \
  "InCarEmo" \
  "Public documentation was saved to: $out" \
  "The official release contains feature-level data only; raw participant audio and video are not public because of privacy concerns." \
  "Open the public Drive folder manually: https://drive.google.com/drive/folders/1YlwzDLG45BA3oIrOrjdCaIV9dHOPKtL5" \
  "The paper limits the dataset to non-commercial academic research and use, but no full data-license text is linked. Review the folder and any displayed terms before downloading." \
  "Do not commit downloaded data."
