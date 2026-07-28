#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir singfox)"

download_url "https://arxiv.org/abs/2606.18985" "$out/paper.html"
download_url \
  "https://raw.githubusercontent.com/Arth-Shah/SingFox/main/README.md" \
  "$out/repository-README.md"
download_url \
  "https://api.github.com/repos/Arth-Shah/SingFox" \
  "$out/repository-api.json"
download_url \
  "https://zenodo.org/api/records/20691932" \
  "$out/zenodo-record.json"

manual_required \
  "SingFox corpus audio" \
  "Review the saved paper, repository documentation, and Zenodo record in $out." \
  "The official Zenodo record is restricted and directs requesters to obtain, sign, and return author-supplied documentation." \
  "This helper does not email the authors, sign agreements, or download restricted audio."
