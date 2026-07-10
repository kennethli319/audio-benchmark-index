#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir wsj0_2mix)"
homepage="${WSJ0_2MIX_HOMEPAGE_URL:-https://www.merl.com/research/highlights/deep-clustering}"
merl_base="${WSJ0_2MIX_MERL_BASE_URL:-https://www.merl.com/research/highlights/deep-clustering}"
py_repo_url="${WSJ0_2MIX_PYTHON_REPO_URL:-https://github.com/mpariente/pywsj0-mix.git}"
py_repo_dir="${WSJ0_2MIX_PYTHON_REPO_DIR:-$out/pywsj0-mix}"

download_url "$homepage" "$out/merl-deep-clustering.html"
download_url "https://www.merl.com/publications/TR2016-003" "$out/merl-tr2016-003.html"

if [[ "${WSJ0_2MIX_DOWNLOAD_MERL_SCRIPTS:-1}" == "1" ]]; then
  download_url "$merl_base/create-speaker-mixtures.zip" "$out/create-speaker-mixtures.zip"
  download_url "$merl_base/spatialize_wsj0-mix.zip" "$out/spatialize_wsj0-mix.zip"
else
  echo "Skipping MERL generation scripts. Set WSJ0_2MIX_DOWNLOAD_MERL_SCRIPTS=1 to download them."
fi

if [[ "${WSJ0_2MIX_CLONE_PYTHON_REPO:-0}" == "1" || "${WSJ0_2MIX_RUN_GENERATION:-0}" == "1" ]]; then
  clone_or_update "$py_repo_url" "$py_repo_dir"
else
  echo "Skipping pywsj0-mix clone. Set WSJ0_2MIX_CLONE_PYTHON_REPO=1 to clone it."
fi

if [[ "${WSJ0_2MIX_RUN_GENERATION:-0}" == "1" ]]; then
  wsj0_path="${WSJ0_PATH:-}"
  output_path="${WSJ0_2MIX_OUTPUT:-$out/generated}"
  n_sources="${WSJ0_2MIX_N_SOURCES:-2}"
  sample_rate="${WSJ0_2MIX_SAMPLE_RATE:-8000}"

  if [[ -z "$wsj0_path" ]]; then
    manual_required \
      "WSJ0-2mix generation" \
      "Set WSJ0_PATH to an already licensed local WSJ0 corpus directory before generation." \
      "WSJ0 source catalog: https://catalog.ldc.upenn.edu/LDC93S6A" \
      "Example: WSJ0_2MIX_RUN_GENERATION=1 WSJ0_PATH=/path/to/wsj0 WSJ0_2MIX_OUTPUT=/large/storage/wsj0-mix scripts/download/wsj0_2mix.sh"
  fi

  require_cmd python3
  mkdir -p "$output_path"
  python3 "$py_repo_dir/generate_wsjmix.py" \
    -p "$wsj0_path" \
    -o "$output_path" \
    -n "$n_sources" \
    -sr "$sample_rate"
else
  echo "Skipping mixture generation. Set WSJ0_2MIX_RUN_GENERATION=1 with WSJ0_PATH=/path/to/wsj0 to generate locally."
fi

echo "WSJ0-2mix helper complete: $out"
echo "This helper does not download WSJ0 audio; obtain and use WSJ0 only under the active LDC agreement."
