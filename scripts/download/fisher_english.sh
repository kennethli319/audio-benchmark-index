#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

dataset_dir fisher_english >/dev/null

manual_required \
  "Fisher English" \
  "Fisher English speech and transcripts are distributed by LDC after login/licensing and cannot be fetched by a public CLI URL." \
  "Speech Part 1 catalog: https://catalog.ldc.upenn.edu/LDC2004S13" \
  "Transcripts Part 1 catalog: https://catalog.ldc.upenn.edu/LDC2004T19" \
  "Speech Part 2 catalog: https://catalog.ldc.upenn.edu/LDC2005S13" \
  "Transcripts Part 2 catalog: https://catalog.ldc.upenn.edu/LDC2005T19" \
  "After access is granted, use the LDC web download flow and do not commit downloaded data."
