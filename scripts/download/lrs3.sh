#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir lrs3)"
landing_url="${LRS3_LANDING_URL:-https://www.robots.ox.ac.uk/~vgg/data/lip_reading/}"
paper_url="${LRS3_PAPER_URL:-https://arxiv.org/abs/1809.00496}"
api_url="${LRS3_ARXIV_API_URL:-https://export.arxiv.org/api/query?id_list=1809.00496}"
download_url="${LRS3_DOWNLOAD_PAGE_URL:-https://www.robots.ox.ac.uk/~vgg/data/lip_reading/lrs3.html}"

download_url "$landing_url" "$out/official-landing.html"
download_url "$paper_url" "$out/paper.html"
download_url "$api_url" "$out/arxiv-metadata.xml"

manual_required \
  "LRS3-TED" \
  "Saved the live official VGG landing page and primary paper metadata to $out." \
  "The official landing page identifies LRS3 and links this dataset page: $download_url" \
  "That linked page returned HTTP 404 when the index was checked on 2026-07-22; use the official route if it returns, or contact the paper authors/VGG." \
  "No current official data license was found. Review the official terms and TED/TEDx source-media rights before use." \
  "This helper does not use unofficial mirrors or download dataset archives."
