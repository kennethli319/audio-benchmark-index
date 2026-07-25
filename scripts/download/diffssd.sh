#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir diffssd)"
hf_repo="${DIFFSSD_HF_REPO:-purdueviperlab/diffssd}"
raw="https://huggingface.co/datasets/$hf_repo/raw/main"

for file in README.md LICENSE.txt train_val_test_splits.csv text_script_0_499.csv text_script_0_4999.csv; do
  download_url "$raw/$file" "$out/$file"
done
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/huggingface_api.json"

if [[ "${DIFFSSD_DOWNLOAD_AUDIO:-0}" != "1" ]]; then
  cat <<EOF
Downloaded DiffSSD documentation, license, input texts, API metadata, and split
manifest to: $out

The split manifest references real LJ Speech and LibriSpeech files that are not
included in DiffSSD. Obtain those corpora separately under their owner terms.
Set DIFFSSD_DOWNLOAD_AUDIO=1 to download the approximately 16.9 GiB synthetic-
speech TAR from Hugging Face.
EOF
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/huggingface" --include generated_speech.tar
echo "DiffSSD synthetic-audio download complete: $out/huggingface"
