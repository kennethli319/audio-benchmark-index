#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir voxceleb)"
base_url="${VOXCELEB_OPENSLR_BASE_URL:-https://openslr.trmal.net/resources/49}"

download_url "$base_url/voxceleb1_test.txt" "$out/voxceleb1_test.txt"
download_url "$base_url/voxceleb1_test_v2.txt" "$out/voxceleb1_test_v2.txt"
download_url "$base_url/voxceleb1_sitw_overlap.txt" "$out/voxceleb1_sitw_overlap.txt"
download_url "$base_url/vox1_meta.csv" "$out/vox1_meta.csv"
download_url "$base_url/vox2_meta.csv" "$out/vox2_meta.csv"

cat <<MSG
VoxCeleb OpenSLR metadata download complete: $out

Note: the official VGG pages currently say VoxCeleb1/VoxCeleb2 audio,
URL/timestamp, and identifying metadata files are no longer available there.
This helper only downloads the small OpenSLR SLR49 recipe metadata/trial lists.
MSG
