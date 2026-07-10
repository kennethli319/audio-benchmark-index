#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

dataset_dir l2_arctic >/dev/null

manual_required \
  "L2-ARCTIC" \
  "L2-ARCTIC access is granted through the official TAMU form after reviewing the CC BY-NC 4.0 license terms." \
  "Homepage and download form: https://psi.engr.tamu.edu/l2-arctic-corpus/" \
  "Documentation: https://psi.engr.tamu.edu/l2-arctic-corpus-docs/" \
  "Paper: https://www.isca-archive.org/interspeech_2018/zhao18b_interspeech.html" \
  "The project emails a generated Google Drive link; do not commit the email link, downloaded corpus, or private access details."
