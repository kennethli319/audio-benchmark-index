#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir bah)"

download_url \
  "https://www.etsmtl.ca/en/labs/livia/datasets/bah-ambivalence-hesitancy" \
  "$out/official-dataset-page.html"
download_url \
  "https://raw.githubusercontent.com/LIVIAETS/bah-dataset/master/README.md" \
  "$out/README.md"
download_url \
  "https://raw.githubusercontent.com/LIVIAETS/bah-dataset/master/LICENSE" \
  "$out/code-LICENSE"
download_url \
  "https://api.github.com/repos/LIVIAETS/bah-dataset" \
  "$out/github-repository.json"
download_url "https://arxiv.org/abs/2505.19328" "$out/arxiv-2505.19328.html"
download_url \
  "https://affective-behavior-analysis-in-the-wild.github.io/11th/" \
  "$out/abaw11-challenge.html"
download_url \
  "https://www.crhscm.ca/redcap/surveys/?s=LDMDDJR3AT9P37JY" \
  "$out/request-form.html"

manual_required \
  "BAH" \
  "Saved official public documentation to $out." \
  "The participant dataset is proprietary, research-only, and EULA-gated." \
  "An eligible full-time faculty member must submit the official request form and list all users:" \
  "https://www.crhscm.ca/redcap/surveys/?s=LDMDDJR3AT9P37JY" \
  "Review the current EULA and owner instructions before requesting or using data." \
  "This helper intentionally does not submit the form or download participant recordings, faces, transcripts, annotations, or metadata." \
  "Do not commit downloaded data, credentials, or access links."
