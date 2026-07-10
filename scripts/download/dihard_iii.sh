#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

dataset_dir dihard_iii >/dev/null

manual_required \
  "DIHARD III" \
  "The Third DIHARD Challenge development and evaluation data are distributed by LDC after login/licensing." \
  "Challenge page: https://dihardchallenge.github.io/dihard3/" \
  "Evaluation plan: https://dihardchallenge.github.io/dihard3/docs/third_dihard_eval_plan_v1.2.pdf" \
  "Development set: https://catalog.ldc.upenn.edu/LDC2022S12" \
  "Evaluation set: https://catalog.ldc.upenn.edu/LDC2022S14" \
  "After access is granted, use the LDC web download flow and do not commit downloaded data."
