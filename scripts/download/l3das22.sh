#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir l3das22)"
homepage_url="${L3DAS22_HOMEPAGE_URL:-https://www.l3das.com/icassp2022/}"
dataset_url="${L3DAS22_DATASET_URL:-https://www.l3das.com/icassp2022/dataset.html}"
task1_url="${L3DAS22_TASK1_URL:-https://www.l3das.com/icassp2022/task1.html}"
task2_url="${L3DAS22_TASK2_URL:-https://www.l3das.com/icassp2022/task2.html}"
documentation_url="${L3DAS22_DOCUMENTATION_URL:-https://www.l3das.com/assets/file/L3DAS22_ICASSP_documentation.pdf}"
paper_url="${L3DAS22_PAPER_URL:-https://arxiv.org/pdf/2202.10372}"
kaggle_metadata_url="${L3DAS22_KAGGLE_METADATA_URL:-https://www.kaggle.com/api/v1/datasets/view/l3dasteam/l3das22}"
repo_readme_url="${L3DAS22_REPO_README_URL:-https://raw.githubusercontent.com/l3das/L3DAS22/main/README.md}"

download_url "$homepage_url" "$out/homepage.html"
download_url "$dataset_url" "$out/dataset.html"
download_url "$task1_url" "$out/task1.html"
download_url "$task2_url" "$out/task2.html"
download_url "$documentation_url" "$out/L3DAS22_ICASSP_documentation.pdf"
download_url "$paper_url" "$out/2202.10372.pdf"
download_url "$kaggle_metadata_url" "$out/kaggle-metadata.json"
download_url "$repo_readme_url" "$out/repository-README.md"

if [[ "${L3DAS22_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "https://github.com/l3das/L3DAS22.git" "$out/L3DAS22"
else
  echo "Skipping repository clone. Set L3DAS22_CLONE_REPO=1 to clone it."
fi

if [[ "${L3DAS22_DOWNLOAD_DATA:-0}" == "1" ]]; then
  require_cmd kaggle
  mkdir -p "$out/kaggle"
  kaggle datasets download --dataset l3dasteam/l3das22 --path "$out/kaggle"
else
  echo "Skipping the 105.8 GB dataset. Set L3DAS22_DOWNLOAD_DATA=1 to use the authenticated Kaggle CLI."
fi

cat <<MSG
L3DAS22 metadata download complete: $out

Kaggle lists the dataset as CC BY 4.0, but the mixtures incorporate LibriSpeech
and FSD50K sources. Review their attribution and per-clip terms before reuse.
MSG
