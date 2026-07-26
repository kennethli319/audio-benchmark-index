#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

dataset_dir fakeavceleb >/dev/null

manual_required \
  "FakeAVCeleb" \
  "The owner requires a dataset request and approval before providing its download script." \
  "Project: https://sites.google.com/view/fakeavcelebdash-lab/" \
  "Repository: https://github.com/DASH-Lab/FakeAVCeleb" \
  "Request form: https://docs.google.com/forms/d/e/1FAIpQLSfPDd3oV0auqmmWEgCSaTEQ6CGpFeB-ozQJ35x-B_0Xjd93bw/viewform" \
  "The repository states no separate data license and marks the source videos as not rights-cleared." \
  "After approval, follow the authors' instructions locally; do not commit downloaded data or private URLs."
