#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir corefl)"
base="https://corefl.learnercorpora.com"

download_url "$base/" "$out/homepage.html"
download_url "$base/statistics" "$out/statistics.html"
download_url "$base/user_guide/user_manual" "$out/user-manual.html"
download_url "$base/user_guide/corpus_design" "$out/corpus-design.html"
download_url "$base/user_guide/metadata" "$out/metadata.html"
download_url "$base/gdpr/terms" "$out/terms.html"
download_url "$base/about/cite" "$out/citation.html"
download_url "https://arxiv.org/abs/2607.10790" "$out/recent-evaluation-paper.html"

manual_required \
  "COREFL filtered corpus export" \
  "Review the saved documentation and CC BY-NC-ND 3.0 ES terms in $out." \
  "Choose filters at $base/search and provide the requested intended-use information." \
  "This helper does not automate participant-record or audio collection."
