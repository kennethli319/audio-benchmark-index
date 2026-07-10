#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir nisqa)"
readme_url="${NISQA_README_URL:-https://raw.githubusercontent.com/gabrielmittag/NISQA/master/README.md}"
wiki_url="${NISQA_WIKI_URL:-https://raw.githubusercontent.com/wiki/gabrielmittag/NISQA/NISQA-Corpus.md}"
code_license_url="${NISQA_CODE_LICENSE_URL:-https://raw.githubusercontent.com/gabrielmittag/NISQA/master/LICENSE}"
weights_license_url="${NISQA_WEIGHTS_LICENSE_URL:-https://raw.githubusercontent.com/gabrielmittag/NISQA/master/weights/LICENSE_model_weights}"
record_url="${NISQA_RECORD_URL:-https://zenodo.org/api/records/4728081}"
corpus_url="${NISQA_CORPUS_URL:-https://zenodo.org/records/4728081/files/NISQA_Corpus.zip}"

download_url "$readme_url" "$out/README.md"
download_url "$wiki_url" "$out/NISQA-Corpus.md"
download_url "$code_license_url" "$out/LICENSE"
download_url "$weights_license_url" "$out/LICENSE_model_weights"
download_url "$record_url" "$out/zenodo-record.json"

if [[ "${NISQA_DOWNLOAD_CORPUS:-0}" == "1" ]]; then
  download_url "$corpus_url" "$out/NISQA_Corpus.zip"
else
  echo "Skipping NISQA_Corpus.zip (~15.9 GiB). Set NISQA_DOWNLOAD_CORPUS=1 to download it."
fi

echo "NISQA metadata download complete: $out"
