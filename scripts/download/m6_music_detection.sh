#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir m6_music_detection)"
hf_base_url="https://huggingface.co/datasets/yl7622/M6"
hf_api_url="https://huggingface.co/api/datasets/yl7622/M6"

download_url \
  "https://www.nature.com/articles/s41598-026-36044-w" \
  "$out/article.html"
download_url \
  "https://api.crossref.org/works/10.1038/s41598-026-36044-w" \
  "$out/crossref-metadata.json"
download_url "$hf_api_url" "$out/hugging-face-api.json"
download_url \
  "$hf_api_url/tree/main?recursive=true&expand=true" \
  "$out/hugging-face-tree.json"
download_url "$hf_base_url/resolve/main/.gitattributes" "$out/gitattributes"

if [[ "${M6_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "yl7622/M6" "$out/hugging-face"
else
  cat <<'EOF'
Downloaded M6 official article and repository metadata.

Set M6_DOWNLOAD_HF=1 to fetch the public, ungated Hugging Face snapshot. Its
sole data archive is approximately 30.2 GB.

The repository has no dataset card, license metadata, or license file. The
article's CC BY 4.0 license does not license the audio archive, which combines
multiple source corpora and generator/service outputs. Review all component
rights before redistribution or commercial use.
EOF
fi

echo "M6 metadata download complete: $out"
