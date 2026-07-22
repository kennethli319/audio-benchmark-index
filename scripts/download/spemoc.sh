#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir spemoc)"

download_url \
  "https://skvipparthi.com/spemoc.html" \
  "$out/project.html"
download_url \
  "https://skvipparthi.com/spemoc/spemoc_eula.pdf" \
  "$out/spemoc_eula.pdf"
download_url \
  "https://raw.githubusercontent.com/saniajmi/SpEmoC-ECCV2026/main/README.md" \
  "$out/README.md"
download_url \
  "https://api.github.com/repos/saniajmi/SpEmoC-ECCV2026" \
  "$out/github-repo.json"
download_url \
  "https://export.arxiv.org/api/query?id_list=2607.18109" \
  "$out/arxiv.xml"

manual_required \
  "SpEmoC" \
  "Public documentation was saved to: $out" \
  "The full movie/TV-derived dataset requires a signed access agreement." \
  "Project and instructions: https://skvipparthi.com/spemoc.html" \
  "Agreement: https://skvipparthi.com/spemoc/spemoc_eula.pdf" \
  "Complete it with requestor and faculty advisor/PI signatures, then submit it from an institutional email address as directed by the project page." \
  "Do not commit downloaded data or share access links."
