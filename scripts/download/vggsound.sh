#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir vggsound)"
raw_base="${VGGSOUND_RAW_BASE_URL:-https://raw.githubusercontent.com/hche11/VGGSound/master}"
model_base="${VGGSOUND_MODEL_BASE_URL:-https://www.robots.ox.ac.uk/~vgg/data/vggsound/models}"

download_url "$raw_base/data/vggsound.csv" "$out/vggsound.csv"
download_url "$raw_base/LICENCE.txt" "$out/LICENCE.txt"

if [[ "${VGGSOUND_DOWNLOAD_MODELS:-0}" == "1" ]]; then
  download_url "$model_base/H.pth.tar" "$out/H.pth.tar"
  download_url "$model_base/I.pth.tar" "$out/I.pth.tar"
else
  echo "Skipping VGGSound pretrained model files. Set VGGSOUND_DOWNLOAD_MODELS=1 to download them."
fi

cat <<MSG
VGGSound metadata download complete: $out

Note: the official VGG page currently says the original dataset download links
are no longer available from that website. This helper downloads the official
CSV metadata and license only; it does not download or redistribute YouTube
audio/video clips.
MSG
