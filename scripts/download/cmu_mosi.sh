#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir cmu_mosi)"
sdk_raw="${CMU_MOSI_SDK_RAW:-https://raw.githubusercontent.com/CMU-MultiComp-Lab/CMU-MultimodalSDK/master}"
sdk_api="${CMU_MOSI_SDK_API:-https://api.github.com/repos/CMU-MultiComp-Lab/CMU-MultimodalSDK}"
sdk_repo="${CMU_MOSI_SDK_REPO:-https://github.com/CMU-MultiComp-Lab/CMU-MultimodalSDK.git}"
multibench_raw="${CMU_MOSI_MULTIBENCH_RAW:-https://raw.githubusercontent.com/pliang279/MultiBench/main}"
multibench_api="${CMU_MOSI_MULTIBENCH_API:-https://api.github.com/repos/pliang279/MultiBench}"
multibench_repo="${CMU_MOSI_MULTIBENCH_REPO:-https://github.com/pliang279/MultiBench.git}"
paper_page="${CMU_MOSI_PAPER_PAGE:-https://arxiv.org/abs/1606.06259}"

download_url "$paper_page" "$out/paper.html"
download_url "$sdk_raw/README.md" "$out/CMU-MultimodalSDK-README.md"
download_url "$sdk_raw/LICENSE" "$out/CMU-MultimodalSDK-LICENSE"
download_url "$sdk_raw/mmsdk/mmdatasdk/dataset/standard_datasets/CMU_MOSI/cmu_mosi.py" "$out/cmu_mosi.py"
download_url "$sdk_api" "$out/CMU-MultimodalSDK-repository.json"
download_url "$multibench_raw/README.md" "$out/MultiBench-README.md"
download_url "$multibench_raw/LICENSE" "$out/MultiBench-LICENSE"
download_url "$multibench_api" "$out/MultiBench-repository.json"

if [[ "${CMU_MOSI_CLONE_SDK:-0}" == "1" ]]; then
  clone_or_update "$sdk_repo" "$out/CMU-MultimodalSDK"
else
  echo "Skipping CMU Multimodal SDK clone. Set CMU_MOSI_CLONE_SDK=1 to clone it."
fi

if [[ "${CMU_MOSI_CLONE_MULTIBENCH:-0}" == "1" ]]; then
  clone_or_update "$multibench_repo" "$out/MultiBench"
else
  echo "Skipping MultiBench clone. Set CMU_MOSI_CLONE_MULTIBENCH=1 to clone it."
fi

echo "Processed MOSI data is a manual Google Drive download:"
echo "  https://drive.google.com/drive/folders/1uEK737LXB9jAlf9kyqRs6B9N6cDncodq"
echo "The official SDK does not redistribute raw YouTube videos."
echo "CMU-MOSI metadata download complete: $out"
