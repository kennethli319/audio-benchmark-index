#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir common_voice)"

if [[ -z "${COMMON_VOICE_DOWNLOAD_URL:-}" ]]; then
  manual_required \
    "Common Voice" \
    "Select modality, release and language on Mozilla Data Collective:" \
    "https://mozilladatacollective.com/organization/cmfh0j9o10006ns07jq45h7xk" \
    "September 2026 releases: Scripted Speech 27.0 / Spontaneous Speech 5.0." \
    "Keep CV15 when reproducing Qwen's CV15 results." \
    "Review each package's access terms, including speaker identification and redistribution restrictions." \
    "Get a generated download URL from the browser/API, then run:" \
    "  COMMON_VOICE_DOWNLOAD_URL='https://...' scripts/download/common_voice.sh" \
    "Optional: COMMON_VOICE_FILENAME=cv-corpus.tar.gz"
fi

filename="${COMMON_VOICE_FILENAME:-$(basename "${COMMON_VOICE_DOWNLOAD_URL%%\?*}")}"
if [[ -z "$filename" || "$filename" == "/" || "$filename" == "." ]]; then
  filename="common_voice_download"
fi

# The shared downloader logs its URL; do not expose a private generated URL.
require_cmd curl
if [[ -s "$out/$filename" ]]; then
  echo "Already exists: $out/$filename"
else
  echo "Downloading authorized Common Voice archive."
  curl --silent --show-error --location --fail --continue-at - \
    --output "$out/$filename" "$COMMON_VOICE_DOWNLOAD_URL"
fi
echo "Common Voice download complete: $out/$filename"
