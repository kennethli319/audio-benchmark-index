#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir mcif)"
hf_repo="${MCIF_HF_REPO:-FBK-MT/MCIF}"
hf_base_url="${MCIF_HF_BASE_URL:-https://huggingface.co/datasets/$hf_repo}"
repo_url="${MCIF_REPO_URL:-https://github.com/hlt-mt/mcif.git}"
repo_raw_url="${MCIF_REPO_RAW_URL:-https://raw.githubusercontent.com/hlt-mt/mcif/main}"
paper_url="${MCIF_PAPER_URL:-https://arxiv.org/abs/2507.19634}"

download_url "$hf_base_url/raw/main/README.md" "$out/dataset-card.md"
download_url "https://huggingface.co/api/datasets/$hf_repo?blobs=true" "$out/hugging-face-api.json"
download_url "$repo_raw_url/README.md" "$out/evaluation-readme.md"
download_url "$repo_raw_url/LICENSE" "$out/evaluation-license.txt"
download_url "$paper_url" "$out/paper.html"

for track in long short; do
  for language in en de it zh; do
    filename="MCIF.$track.$language.ref.xml.gz"
    download_url "$hf_base_url/resolve/main/$filename" "$out/references/$filename"
  done
done

for config in long_fixedprompt long_mixedprompt short_fixedprompt short_mixedprompt; do
  download_url \
    "$hf_base_url/resolve/main/$config/test-00000-of-00001.parquet" \
    "$out/manifests/$config.parquet"
done

if [[ "${MCIF_CLONE_CODE:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/mcif"
else
  echo "Skipping evaluation-code clone. Set MCIF_CLONE_CODE=1 to clone/update it."
fi

if [[ "${MCIF_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "$hf_repo" "$out/hugging-face"
else
  echo "Skipping the approximately 7.58 GiB media snapshot. Set MCIF_DOWNLOAD_HF=1 to download it."
fi

cat <<MSG
MCIF lightweight benchmark files downloaded: $out

The default path includes manifests and references but not the shared audio and
video files. MCIF data is CC BY 4.0; evaluation code is Apache-2.0.
MSG
