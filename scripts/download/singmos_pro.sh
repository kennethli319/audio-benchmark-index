#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir singmos_pro)"
hf_base_url="https://huggingface.co/datasets/TangRain/SingMOS-Pro"
hf_api_url="https://huggingface.co/api/datasets/TangRain/SingMOS-Pro"
repo_raw_url="https://raw.githubusercontent.com/South-Twilight/SingMOS/main"

download_url "$hf_base_url/raw/main/README.md" "$out/dataset-README.md"
download_url "$hf_api_url" "$out/hugging-face-api.json"
download_url "$hf_base_url/resolve/main/info/split.json" "$out/split.json"
download_url "$hf_base_url/resolve/main/info/sys_info.json" "$out/sys_info.json"
download_url "$repo_raw_url/README.md" "$out/predictor-README.md"
download_url "$repo_raw_url/LICENSE" "$out/predictor-LICENSE"
download_url "https://arxiv.org/abs/2510.01812" "$out/paper.html"

if [[ "${SINGMOS_PRO_DOWNLOAD_ANNOTATIONS:-0}" == "1" ]]; then
  download_url "$hf_base_url/resolve/main/info/score.json" "$out/score.json"
  download_url "$hf_base_url/resolve/main/metadata.json" "$out/metadata.json"
else
  echo "Skipping approximately 11.6 MB of sample/rating annotations. Set SINGMOS_PRO_DOWNLOAD_ANNOTATIONS=1 to download them."
fi

if [[ "${SINGMOS_PRO_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "TangRain/SingMOS-Pro" "$out/hugging-face"
else
  cat <<'EOF'
Downloaded SingMOS-Pro documentation, split definitions, and system metadata.

Set SINGMOS_PRO_DOWNLOAD_HF=1 to fetch the public, ungated approximately
2.83 GB Hugging Face snapshot. The card declares CC BY 4.0, but the release
contains ground truth and generated singing from multiple source datasets and
systems. Review source-corpus, performer, composition, and model-output terms.
EOF
fi

echo "SingMOS-Pro metadata download complete: $out"
