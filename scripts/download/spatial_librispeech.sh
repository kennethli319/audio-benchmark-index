#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir spatial_librispeech)"
repo_raw_url="${SPATIAL_LIBRISPEECH_REPO_RAW_URL:-https://raw.githubusercontent.com/apple/ml-spatial-librispeech/main}"
paper_url="${SPATIAL_LIBRISPEECH_PAPER_URL:-https://arxiv.org/abs/2308.09514}"
data_base_url="${SPATIAL_LIBRISPEECH_DATA_BASE_URL:-https://docs-assets.developer.apple.com/ml-research/datasets/spatial-librispeech/v1}"

download_url "$repo_raw_url/README.md" "$out/README.md"
download_url "$repo_raw_url/DATASET_SCHEMA.md" "$out/DATASET_SCHEMA.md"
download_url "$repo_raw_url/LICENSE" "$out/LICENSE"
download_url "$paper_url" "$out/arxiv-2308.09514.html"

if [[ "${SPATIAL_LIBRISPEECH_DOWNLOAD_METADATA:-0}" == "1" ]]; then
  download_url "$data_base_url/metadata.parquet" "$out/metadata.parquet"
else
  echo "Skipping ~365 MiB metadata. Set SPATIAL_LIBRISPEECH_DOWNLOAD_METADATA=1 to fetch it."
fi

if [[ -n "${SPATIAL_LIBRISPEECH_SAMPLE_ID:-}" ]]; then
  if [[ ! "$SPATIAL_LIBRISPEECH_SAMPLE_ID" =~ ^[0-9]+$ ]]; then
    echo "SPATIAL_LIBRISPEECH_SAMPLE_ID must be a non-negative integer." >&2
    exit 2
  fi
  sample_name="$(printf '%06d' "$((10#$SPATIAL_LIBRISPEECH_SAMPLE_ID))")"
  download_url "$data_base_url/ambisonics/$sample_name.flac" "$out/ambisonics/$sample_name.flac"
  if [[ "${SPATIAL_LIBRISPEECH_DOWNLOAD_NOISE_SAMPLE:-0}" == "1" ]]; then
    download_url "$data_base_url/noise_ambisonics/$sample_name.flac" "$out/noise_ambisonics/$sample_name.flac"
  else
    echo "Skipping matching noise sample. Set SPATIAL_LIBRISPEECH_DOWNLOAD_NOISE_SAMPLE=1 to fetch it."
  fi
fi

cat <<MSG
Spatial LibriSpeech documentation download complete: $out

The public release exposes first-order ambisonic audio by sample ID. Metadata
and samples are opt-in above; raw 19-channel audio is not publicly hosted.
Review Apple's CC BY 4.0 license and the preserved upstream component terms.
MSG
