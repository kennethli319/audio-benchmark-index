#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

dataset_dir iemocap >/dev/null

manual_required \
  "IEMOCAP" \
  "IEMOCAP is released by USC SAIL after a manual license/request step." \
  "Release page: https://sail.usc.edu/iemocap/iemocap_release.htm" \
  "License form: https://sail.usc.edu/iemocap/Data_Release_Form_IEMOCAP.pdf" \
  "Request form: https://docs.google.com/forms/d/e/1FAIpQLScBecgI2K5bFTrXi_-05IYSSwOcqL5mX7dh57xcJV1m_NoznA/viewform?usp=sf_link" \
  "After access is granted, follow the instructions from USC SAIL; do not commit downloaded data."
