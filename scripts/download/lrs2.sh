#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir lrs2)"
vgg_url="${LRS2_VGG_URL:-https://www.robots.ox.ac.uk/~vgg/data/lip_reading/lrs2.html}"
bbc_url="${LRS2_BBC_URL:-https://www.bbc.co.uk/rd/projects/lip-reading-datasets}"
agreement_url="${LRS2_AGREEMENT_URL:-https://downloads.bbc.co.uk/rd/datasets/content-analysis/LRS2-Lip%20Reading%20Sentences%20Permission%20Form-.docx}"
paper_url="${LRS2_PAPER_URL:-https://arxiv.org/abs/1809.02108}"
api_url="${LRS2_ARXIV_API_URL:-https://export.arxiv.org/api/query?id_list=1809.02108}"

download_url "$vgg_url" "$out/vgg-dataset-page.html"
download_url "$bbc_url" "$out/bbc-access-page.html"
download_url "$agreement_url" "$out/LRS2-permission-form.docx"
download_url "$paper_url" "$out/paper.html"
download_url "$api_url" "$out/arxiv-metadata.xml"

manual_required \
  "LRS2-BBC" \
  "Saved the official VGG/BBC pages, BBC permission form, and primary paper metadata to $out." \
  "Access requires signing and emailing the LRS2 agreement through the BBC process: $bbc_url" \
  "BBC restricts eligibility to universities, reputable academic institutions, and relevant public organizations conducting non-commercial research." \
  "Approved researchers receive a countersigned agreement and password; this helper does not request credentials or download the 50 GB corpus." \
  "The signed agreement controls use, and BBC approval is required before publishing sample images."
