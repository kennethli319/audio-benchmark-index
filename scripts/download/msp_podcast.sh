#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

dataset_dir msp_podcast >/dev/null

manual_required \
  "MSP-Podcast" \
  "MSP-Podcast is free for academic access but requires an institution-signed agreement." \
  "Owner page: https://lab-msp.com/MSP/MSP-Podcast.html" \
  "Academic agreement: https://lab-msp.com/MSP/publications/Busso-FDPDTUA-MSP-Podcast-v4.pdf" \
  "Have an authorized institutional representative sign the agreement and send it to Prof. Carlos Busso as directed on the owner page." \
  "After access is granted, follow the owner's delivery instructions; do not commit downloaded data."
