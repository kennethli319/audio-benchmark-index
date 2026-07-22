#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir l3das21)"
homepage_url="${L3DAS21_HOMEPAGE_URL:-https://www.l3das.com/mlsp2021/index.html}"
dataset_url="${L3DAS21_DATASET_URL:-https://www.l3das.com/mlsp2021/dataset.html}"
task1_url="${L3DAS21_TASK1_URL:-https://www.l3das.com/mlsp2021/task1.html}"
task2_url="${L3DAS21_TASK2_URL:-https://www.l3das.com/mlsp2021/task2.html}"
paper_url="${L3DAS21_PAPER_URL:-https://arxiv.org/pdf/2104.05499}"
datacite_url="${L3DAS21_DATACITE_URL:-https://api.datacite.org/dois/10.5281/zenodo.4642005}"
repo_readme_url="${L3DAS21_REPO_README_URL:-https://raw.githubusercontent.com/l3das/L3DAS21/main/README.md}"
zenodo_files_url="${L3DAS21_ZENODO_FILES_URL:-https://zenodo.org/records/4642005/files}"

download_url "$homepage_url" "$out/homepage.html"
download_url "$dataset_url" "$out/dataset.html"
download_url "$task1_url" "$out/task1.html"
download_url "$task2_url" "$out/task2.html"
download_url "$paper_url" "$out/2104.05499.pdf"
download_url "$datacite_url" "$out/datacite-metadata.json"
download_url "$repo_readme_url" "$out/repository-README.md"

if [[ "${L3DAS21_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "https://github.com/l3das/L3DAS21.git" "$out/L3DAS21"
else
  echo "Skipping repository clone. Set L3DAS21_CLONE_REPO=1 to clone it."
fi

if [[ "${L3DAS21_DOWNLOAD_DATA:-0}" == "1" ]]; then
  parts="${L3DAS21_PARTS:-}"
  if [[ -z "$parts" ]]; then
    echo "L3DAS21_PARTS is required when L3DAS21_DOWNLOAD_DATA=1." >&2
    echo "Allowed parts: Task1_train100 Task1_train360 Task1_dev Task2_train Task2_dev" >&2
    exit 2
  fi

  for part in $parts; do
    case "$part" in
      Task1_train100|Task1_train360|Task1_dev|Task2_train|Task2_dev)
        archive="L3DAS_${part}.zip"
        ;;
      *)
        echo "Unknown L3DAS21 part: $part" >&2
        exit 2
        ;;
    esac
    download_url "$zenodo_files_url/$archive?download=1" "$out/$archive"
  done
else
  echo "Skipping large audio archives. Set L3DAS21_DOWNLOAD_DATA=1 and choose L3DAS21_PARTS to download them."
fi

cat <<MSG
L3DAS21 metadata download complete: $out

DataCite lists the dataset as CC BY 4.0, but the mixtures incorporate
LibriSpeech and FSD50K sources. Review their attribution and per-clip terms.
MSG
