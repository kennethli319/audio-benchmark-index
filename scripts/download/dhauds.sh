#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir dhauds)"
repo_url="${DHAUDS_REPO_URL:-https://github.com/Andy-Shao/DHAuDS.git}"
raw_base_url="${DHAUDS_RAW_BASE_URL:-https://raw.githubusercontent.com/Andy-Shao/DHAuDS/main}"
repo_api_url="${DHAUDS_REPO_API_URL:-https://api.github.com/repos/Andy-Shao/DHAuDS}"
hf_owner="${DHAUDS_HF_OWNER:-AndyShao90}"
available_datasets="SpeechCommandsV2-C VocalSound-C UrbanSound8K-C ReefSet-C"

download_url "$raw_base_url/README.md" "$out/README.md"
download_url "$raw_base_url/LICENSE" "$out/LICENSE"
download_url "$repo_api_url" "$out/github-repo.json"

for dataset in $available_datasets; do
  download_url \
    "https://huggingface.co/api/datasets/$hf_owner/$dataset" \
    "$out/$dataset-huggingface.json"
  download_url \
    "https://huggingface.co/datasets/$hf_owner/$dataset/raw/main/README.md" \
    "$out/$dataset-README.md"
done

if [[ "${DHAUDS_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/DHAuDS"
fi

if [[ "${DHAUDS_DOWNLOAD_HF:-0}" != "1" ]]; then
  echo "Downloaded DHAuDS docs and repository metadata to: $out"
  echo "Set DHAUDS_DOWNLOAD_HF=1 and DHAUDS_DATASETS to one or more dataset names."
  echo "Available: $available_datasets (about 50.0 GB combined)."
  exit 0
fi

selected="${DHAUDS_DATASETS:-}"
if [[ -z "$selected" ]]; then
  echo "DHAUDS_DATASETS is required when DHAUDS_DOWNLOAD_HF=1." >&2
  echo "Choose from: $available_datasets, or use all." >&2
  exit 2
fi
if [[ "$selected" == "all" ]]; then
  selected="$available_datasets"
fi

for dataset in $selected; do
  case " $available_datasets " in
    *" $dataset "*) ;;
    *)
      echo "Unsupported DHAuDS dataset: $dataset" >&2
      echo "Choose from: $available_datasets, or use all." >&2
      exit 2
      ;;
  esac
  hf_download_dataset "$hf_owner/$dataset" "$out/huggingface/$dataset"
done

echo "Selected DHAuDS Hugging Face snapshots complete under: $out/huggingface"
echo "Review every source corpus license; the Apache-2.0 card labels do not replace upstream terms."
