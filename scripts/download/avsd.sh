#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir avsd)"
raw_base="${AVSD_RAW_BASE_URL:-https://raw.githubusercontent.com/hudaAlamri/DSTC7-Audio-Visual-Scene-Aware-Dialog-AVSD-Challenge/master}"
paper_url="${AVSD_PAPER_URL:-https://openaccess.thecvf.com/content_CVPR_2019/html/Alamri_Audio_Visual_Scene-Aware_Dialog_CVPR_2019_paper.html}"
dataset_url="${AVSD_DATASET_URL:-https://drive.google.com/drive/folders/1SlZTySJAk_2tiMG5F8ivxCfOl_OWwd_Q?usp=sharing}"

download_url "$raw_base/README.md" "$out/README.md"
download_url "$raw_base/Data/README.md" "$out/Data-README.md"
download_url "$raw_base/LICENSE" "$out/LICENSE"
download_url "$paper_url" "$out/cvpr-2019-paper.html"

manual_required \
  "Audio Visual Scene-Aware Dialog (AVSD)" \
  "Saved official repository documentation, license, and the CVPR paper page to $out." \
  "The released challenge data is hosted in Google Drive: $dataset_url" \
  "The dialogs refer to Charades videos; obtain media through the official Charades path and review its current terms." \
  "This helper does not automate Drive or raw-video retrieval and does not establish rights to the annotations or source videos."
