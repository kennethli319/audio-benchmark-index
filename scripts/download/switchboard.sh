#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

dataset_dir switchboard >/dev/null

manual_required \
  "Switchboard" \
  "Switchboard-1 Release 2 is distributed by LDC after login/licensing and cannot be fetched by a public CLI URL." \
  "Switchboard-1 Release 2 catalog: https://catalog.ldc.upenn.edu/LDC97S62" \
  "2000 HUB5 English Evaluation Speech catalog: https://catalog.ldc.upenn.edu/LDC2002S09" \
  "Original corpus paper: https://aclanthology.org/H92-1045/" \
  "After access is granted, use the LDC web download flow and do not commit downloaded data."
