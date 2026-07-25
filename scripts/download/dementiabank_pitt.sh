#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir dementiabank_pitt)"

download_url "https://talkbank.org/dementia/" "$out/dementiabank-access.html"
download_url "https://talkbank.org/dementia/access/" "$out/corpus-index.html"
download_url \
  "https://talkbank.org/dementia/access/English/Pitt.html" \
  "$out/pitt-corpus.html"
download_url \
  "https://talkbank.org/0share/rules.html" \
  "$out/talkbank-ground-rules.html"

manual_required \
  "DementiaBank Pitt Corpus" \
  "Saved public corpus and access documentation to $out." \
  "Request DementiaBank membership through https://talkbank.org/dementia/." \
  "Students require faculty sponsorship. Do not share, repost, or automate access to password-protected clinical recordings."
