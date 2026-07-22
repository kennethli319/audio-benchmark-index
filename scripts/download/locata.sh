#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir locata)"
homepage_url="${LOCATA_HOMEPAGE_URL:-https://www.locata.lms.tf.fau.de/}"
dataset_url="${LOCATA_DATASET_URL:-https://www.locata.lms.tf.fau.de/datasets/}"
corpus_url="${LOCATA_CORPUS_URL:-https://www.locata.lms.tf.fau.de/corpus/}"
tasks_url="${LOCATA_TASKS_URL:-https://www.locata.lms.tf.fau.de/tasks/}"
zenodo_url="${LOCATA_ZENODO_URL:-https://zenodo.org/api/records/3630471}"
documentation_url="${LOCATA_DOCUMENTATION_URL:-https://locata.cms.rrze.uni-erlangen.de/files/2020/01/Documentation_LOCATA_final_release_V1.pdf}"
io_raw_url="${LOCATA_IO_RAW_URL:-https://raw.githubusercontent.com/cevers/sap_locata_io/master/README.md}"
eval_raw_url="${LOCATA_EVAL_RAW_URL:-https://raw.githubusercontent.com/cevers/sap_locata_eval/master/README.md}"

download_url "$homepage_url" "$out/homepage.html"
download_url "$dataset_url" "$out/datasets.html"
download_url "$corpus_url" "$out/corpus.html"
download_url "$tasks_url" "$out/tasks.html"
download_url "$zenodo_url" "$out/zenodo-3630471.json"
download_url "$documentation_url" "$out/Documentation_LOCATA_final_release_V1.pdf"
download_url "$io_raw_url" "$out/io-README.md"
download_url "$eval_raw_url" "$out/evaluation-README.md"

if [[ "${LOCATA_CLONE_TOOLS:-0}" == "1" ]]; then
  clone_or_update "https://github.com/cevers/sap_locata_io.git" "$out/sap_locata_io"
  clone_or_update "https://github.com/cevers/sap_locata_eval.git" "$out/sap_locata_eval"
else
  echo "Skipping tool clones. Set LOCATA_CLONE_TOOLS=1 to clone them."
fi

cat <<MSG
LOCATA metadata download complete: $out

The public dev.zip and eval.zip archives total about 19.3 GB, so this helper
does not download them. Review the ODC-By-1.0 data terms and retrieve the
corpus from the official final-release record:
https://zenodo.org/records/3630471
MSG
