#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir llp)"
raw_base="${LLP_RAW_BASE_URL:-https://raw.githubusercontent.com/YapengTian/AVVP-ECCV20/master}"
repo_url="${LLP_REPO_URL:-https://github.com/YapengTian/AVVP-ECCV20.git}"
paper_url="${LLP_PAPER_URL:-https://arxiv.org/abs/2007.10558}"

download_url "$raw_base/README.md" "$out/README.md"
download_url "$paper_url" "$out/arxiv-2007.10558.html"

for annotation in \
  AVVP_dataset_full.csv \
  AVVP_train.csv \
  AVVP_val_pd.csv \
  AVVP_test_pd.csv \
  AVVP_eval_audio.csv \
  AVVP_eval_visual.csv
do
  download_url "$raw_base/data/$annotation" "$out/data/$annotation"
done

if [[ "${LLP_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/AVVP-ECCV20"
else
  echo "Skipping LLP repository clone. Set LLP_CLONE_REPO=1 to clone code and feature scripts."
fi

cat <<MSG
LLP docs and annotation download complete: $out

The official README links extracted audio/visual features through Google Drive.
Raw videos are reconstructed from the referenced YouTube segments. This helper
does not automate either path; review upstream rights and platform terms first.
MSG
