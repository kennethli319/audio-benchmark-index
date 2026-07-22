#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir qivd)"
landing_url="${QIVD_LANDING_URL:-https://www.qualcomm.com/developer/software/qualcomm-interactive-video-dataset-qivd}"

download_url "$landing_url" "$out/qualcomm-qivd.html"

manual_required \
  "Qualcomm Interactive Video Dataset (QIVD)" \
  "Saved the official public landing page to $out/qualcomm-qivd.html." \
  "Dataset access uses Qualcomm's account/download flow and may present additional terms." \
  "Official page: $landing_url" \
  "Paper: https://arxiv.org/abs/2503.19356" \
  "Review and retain the terms shown in the official flow; do not commit videos, credentials, or generated download URLs."
