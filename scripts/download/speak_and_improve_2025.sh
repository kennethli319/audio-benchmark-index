#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

dataset_dir speak_and_improve_2025 >/dev/null

manual_required \
  "Speak & Improve Corpus 2025" \
  "Cambridge University Press & Assessment requires license acceptance and registration; no public direct archive URL is provided." \
  "Official dataset page: https://researchdatasets.cambridge.org/datasets/speak-and-improve-corpus-2025" \
  "Review the custom non-commercial research-and-education license, then complete the registration form on that page." \
  "Do not redistribute any corpus portion or derived item; the owner requires prior approval for derived releases." \
  "Do not commit downloaded speech, transcripts, scores, registration details, credentials, or license records."
