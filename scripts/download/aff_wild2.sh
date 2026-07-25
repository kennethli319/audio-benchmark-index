#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

dataset_dir aff_wild2 >/dev/null

manual_required \
  "Aff-Wild2" \
  "Aff-Wild2 requires an institutional-email request and a signed role-specific EULA." \
  "Owner page and current access steps: https://ibug.doc.ic.ac.uk/resources/aff-wild2/" \
  "Academic EULA: https://drive.google.com/file/d/1OVobGGYTiVUUsCYkI_sTVpuOdhTDwZo-/view" \
  "Student EULA: https://drive.google.com/file/d/1-m83qcYNR7yHQaFrDw_nYuj3Js798JEm/view" \
  "Follow the owner page for academic, supervisor, industry, or student instructions; do not commit granted data."
