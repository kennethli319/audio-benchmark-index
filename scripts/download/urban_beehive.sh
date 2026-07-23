#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir urban_beehive)"
dataset_page="https://www.frdr-dfdr.ca/repo/dataset/487f5583-250a-464b-bb71-f2da85410b13"
repo_api="https://api.github.com/repos/mahsa-abdollahi/UrBAN"

download_url "$dataset_page" "$out/frdr-dataset.html"
download_url "https://www.nature.com/articles/s41597-025-04869-1" "$out/scientific-data-paper.html"
download_url "https://raw.githubusercontent.com/mahsa-abdollahi/UrBAN/main/README.md" "$out/README.md"
download_url "$repo_api" "$out/github-repository.json"

cat <<'EOF'
Downloaded official UrBAN dataset, paper, and repository metadata only.

The FRDR landing page reports approximately 1.265 TB of files and directs
whole-dataset users to its Globus Transfer workflow, which may require a Globus
account and client. This helper intentionally does not start that transfer.
The dataset record lists CC BY 4.0; the GitHub analysis code has no detected
license, and the Scientific Data article uses separate CC BY-NC-ND 4.0 terms.
EOF

echo "UrBAN metadata download complete: $out"
