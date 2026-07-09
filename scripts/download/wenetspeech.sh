#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir wenetspeech)"
repo_dir="$out/WenetSpeech"

if [[ -z "${WENETSPEECH_PASSWORD_FILE:-}" && -z "${WENETSPEECH_PASSWORD:-}" ]]; then
  manual_required \
    "WenetSpeech" \
    "Request the password on the official WenetSpeech site and accept the license first." \
    "Then run one of:" \
    "  WENETSPEECH_PASSWORD='...' scripts/download/wenetspeech.sh" \
    "  WENETSPEECH_PASSWORD_FILE=/path/to/password scripts/download/wenetspeech.sh"
fi

clone_or_update "https://github.com/wenet-e2e/WenetSpeech.git" "$repo_dir"
mkdir -p "$repo_dir/SAFEBOX"

if [[ -n "${WENETSPEECH_PASSWORD_FILE:-}" ]]; then
  cp "$WENETSPEECH_PASSWORD_FILE" "$repo_dir/SAFEBOX/password"
else
  printf '%s\n' "$WENETSPEECH_PASSWORD" > "$repo_dir/SAFEBOX/password"
fi

download_dir="${WENETSPEECH_DOWNLOAD_DIR:-$out/archives}"
untar_dir="${WENETSPEECH_UNTAR_DIR:-$out/extracted}"
mkdir -p "$download_dir" "$untar_dir"

bash "$repo_dir/utils/download_wenetspeech.sh" "$download_dir" "$untar_dir"

echo "WenetSpeech download complete: $out"
