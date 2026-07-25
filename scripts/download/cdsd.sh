#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir cdsd)"

download_url "http://melab.psych.ac.cn/CDSD.html" "$out/CDSD.html"
download_url \
  "http://melab.psych.ac.cn/assets/pdf/CDSD_License_Agreement_Blank.pdf" \
  "$out/CDSD_License_Agreement_Blank.pdf"
download_url \
  "https://www.isca-archive.org/interspeech_2024/wan24b_interspeech.html" \
  "$out/paper.html"
download_url \
  "https://api.crossref.org/works/10.21437%2FInterspeech.2024-1597" \
  "$out/crossref.json"

manual_required \
  "CDSD clinical speech data" \
  "Review the saved owner page and blank agreement in $out." \
  "Complete and sign the agreement, submit it through the official application form, and wait for approval by email." \
  "This helper does not submit forms, accept terms, or download identifiable clinical recordings."
