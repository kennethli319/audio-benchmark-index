#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir daic_woz)"

download_url \
  "https://dcapswoz.ict.usc.edu/" \
  "$out/owner-page.html"
download_url \
  "https://dcapswoz.ict.usc.edu/wp-content/uploads/2022/02/DAICWOZDepression_Documentation.pdf" \
  "$out/daic-woz-documentation.pdf"
download_url \
  "https://aclanthology.org/L14-1422/" \
  "$out/daic-paper.html"
download_url \
  "https://arxiv.org/abs/1907.11510" \
  "$out/avec-2019-paper.html"
download_url \
  "https://arxiv.org/abs/2607.22952" \
  "$out/recent-liwc-evaluation.html"

manual_required \
  "DAIC-WOZ / Extended DAIC" \
  "Apply through the USC ICT owner pages:" \
  "  DAIC-WOZ: https://dcapswoz.ict.usc.edu/daic-woz-database-download/" \
  "  Extended DAIC: https://dcapswoz.ict.usc.edu/extended-daic-database-download/" \
  "Do not share approved clinical interview data or credentials."
