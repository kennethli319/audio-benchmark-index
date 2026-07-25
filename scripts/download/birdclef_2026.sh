#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir birdclef_2026)"

download_url "https://www.imageclef.org/BirdCLEF2026" "$out/official-challenge.html"
download_url "https://arxiv.org/abs/2607.14474" "$out/recent-evaluation.html"

manual_required \
  "BirdCLEF++ 2026 competition data" \
  "Review https://www.imageclef.org/BirdCLEF2026 and the Kaggle competition rules." \
  "Sign in at https://www.kaggle.com/competitions/birdclef-2026/data and accept the competition rules." \
  "Use Kaggle's authenticated download flow after checking the dataset and source-recording terms; this helper does not accept rules or download audio."
