#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir speechrole)"

if [[ "${SPEECHROLE_EVAL:-1}" == "1" ]]; then
  hf_download_dataset "yuhui1038/SpeechRole-Eval" "$out/SpeechRole-Eval"
fi

if [[ "${SPEECHROLE_DATA:-1}" == "1" ]]; then
  hf_download_dataset "yuhui1038/SpeechRole-Data" "$out/SpeechRole-Data"
fi

echo "SpeechRole download complete: $out"
