#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir mmau)"

if [[ "${MMAU_TEST_MINI:-1}" == "1" ]]; then
  hf_download_dataset "gamma-lab-umd/MMAU-test-mini" "$out/MMAU-test-mini"
fi

if [[ "${MMAU_TEST:-1}" == "1" ]]; then
  hf_download_dataset "gamma-lab-umd/MMAU-test" "$out/MMAU-test"
fi

echo "MMAU download complete: $out"
