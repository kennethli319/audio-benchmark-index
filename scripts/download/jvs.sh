#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir jvs)"
project_url="https://sites.google.com/site/shinnosuketakamichi/research-topics/jvs_corpus"
paper_url="https://arxiv.org/abs/1908.06248"
drive_url="https://drive.google.com/open?id=19oAw8wWn3Y7z6CKChRdAyGOB9yupL_Xt"

download_url "$project_url" "$out/project.html"
download_url "$paper_url" "$out/paper.html"

cat <<EOF
Downloaded JVS official documentation only.

The approximately 3.5 GB corpus is a manual Google Drive download:
$drive_url

The owner page permits research and personal use but prohibits redistribution
of the audio beyond small illustrative excerpts. Commercial use requires
contacting the owners. Tags are CC BY-SA 4.0 and texts retain JSUT terms.
EOF
echo "JVS metadata download complete: $out"
