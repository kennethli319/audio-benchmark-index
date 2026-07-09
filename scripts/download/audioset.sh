#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir audioset)"
base_url="https://storage.googleapis.com/us_audioset/youtube_corpus/v1"

download_url "$base_url/csv/eval_segments.csv" "$out/eval_segments.csv"
download_url "$base_url/csv/balanced_train_segments.csv" "$out/balanced_train_segments.csv"
download_url "$base_url/csv/unbalanced_train_segments.csv" "$out/unbalanced_train_segments.csv"
download_url "$base_url/csv/class_labels_indices.csv" "$out/class_labels_indices.csv"
download_url "$base_url/qa/qa_true_counts.csv" "$out/qa_true_counts.csv"
download_url "$base_url/qa/rerated_video_ids.txt" "$out/rerated_video_ids.txt"

if [[ "${AUDIOSET_DOWNLOAD_FEATURES:-0}" == "1" ]]; then
  region="${AUDIOSET_REGION:-us}"
  case "$region" in
    asia|eu|us) ;;
    *)
      echo "AUDIOSET_REGION must be one of: us, eu, asia" >&2
      exit 2
      ;;
  esac
  feature_url="https://storage.googleapis.com/${region}_audioset/youtube_corpus/v1/features/features.tar.gz"
  download_url "$feature_url" "$out/features.tar.gz"
else
  echo "Skipping AudioSet features archive (~2.4 GiB). Set AUDIOSET_DOWNLOAD_FEATURES=1 to download it."
fi

echo "AudioSet metadata download complete: $out"
