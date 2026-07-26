#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir chime_4)"
challenge_base="${CHIME4_CHALLENGE_BASE_URL:-https://www.chimechallenge.org/challenges/chime4}"
ldc_url="${CHIME4_LDC_URL:-https://catalog.ldc.upenn.edu/LDC2017S24}"
recent_paper_url="${CHIME4_RECENT_PAPER_URL:-https://arxiv.org/abs/2607.18658}"

download_url "$challenge_base/index" "$out/challenge.html"
download_url "$challenge_base/data" "$out/data-description.html"
download_url "$challenge_base/download" "$out/download-instructions.html"
download_url "$ldc_url" "$out/ldc-LDC2017S24.html"
download_url "$recent_paper_url" "$out/arxiv-2607.18658.html"

manual_required \
  "CHiME-4" \
  "Saved official public challenge, data-layout, LDC-catalog, and evaluation-paper documentation to $out." \
  "The audio and six-channel annotations are distributed through LDC2017S24 under the applicable LDC user agreement." \
  "The official challenge page also identifies licensed WSJ0 material; public baseline files do not grant rights to the recordings." \
  "Obtain access from $ldc_url and follow the current LDC and WSJ0 terms. This helper never downloads or redistributes licensed audio."
