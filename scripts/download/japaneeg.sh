#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir japaneeg)"
repo_raw="https://raw.githubusercontent.com/Motoshige496/JapanEEG/main"

download_url \
  "https://openneuro.org/crn/datasets/ds007808/snapshots/1.0.0/files/dataset_description.json" \
  "$out/dataset_description.json"
download_url "https://arxiv.org/abs/2606.01264" "$out/paper.html"
download_url "$repo_raw/README.md" "$out/companion-repository-README.md"
download_url "$repo_raw/LICENSE" "$out/companion-repository-LICENSE"
download_url \
  "$repo_raw/src/japaneeg/download.py" \
  "$out/companion-repository-download.py"
download_url \
  "https://api.github.com/repos/Motoshige496/JapanEEG" \
  "$out/companion-repository.json"

cat <<EOF
Downloaded JapanEEG ds007808 metadata and provenance only: $out

The version 1.0.0 corpus is approximately 955 GB. Select and download only the
needed files from:
  https://openneuro.org/datasets/ds007808/versions/1.0.0

The companion repository currently targets older dataset identifiers and is
saved only for provenance. Use ds007808 for the corpus described by
arXiv:2606.01264. Review privacy, biometric-data, and research-ethics
obligations before handling participant EEG, facial EMG, voice, or transcripts.
EOF
