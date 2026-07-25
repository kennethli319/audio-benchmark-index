#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir savee)"
base_url="http://kahlan.eps.surrey.ac.uk/savee"

download_url "$base_url/" "$out/home.html"
download_url "$base_url/Database.html" "$out/database.html"
download_url "$base_url/Evaluation.html" "$out/evaluation.html"
download_url "$base_url/References.html" "$out/references.html"
download_url "$base_url/Download.html" "$out/download.html"
download_url "https://arxiv.org/abs/2607.16803" "$out/recent-evaluation.html"

cat <<'EOF'
Downloaded public SAVEE provenance pages only.

The owner requires registration before approved users can log in to download
the corpus:
http://www.ee.surrey.ac.uk/Personal/P.Jackson/SAVEE/Register.html

The public terms say only that SAVEE is free of charge for research purposes.
No standard data license or redistribution permission is stated. This helper
does not register, authenticate, accept terms, or download recordings.
EOF
echo "SAVEE documentation download complete: $out"
