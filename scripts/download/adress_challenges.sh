#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir adress_challenges)"

download_url \
  "https://talkbank.org/dementia/ADReSS-2020/" \
  "$out/adress-2020.html"
download_url \
  "https://talkbank.org/dementia/ADReSSo-2021/" \
  "$out/adresso-2021.html"
download_url \
  "https://talkbank.org/dementia/" \
  "$out/dementiabank-access.html"
download_url \
  "https://talkbank.org/0share/rules.html" \
  "$out/talkbank-ground-rules.html"
download_url \
  "https://arxiv.org/abs/2607.21496" \
  "$out/recent-cross-dataset-evaluation.html"

manual_required \
  "ADReSS / ADReSSo" \
  "Join DementiaBank through the official access page:" \
  "  https://talkbank.org/dementia/" \
  "Established researchers and clinicians must register and request consortium membership." \
  "Students need faculty sponsorship. Do not share password-protected clinical data."
