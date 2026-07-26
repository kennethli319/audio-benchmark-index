#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir voiceprivacy_challenge)"
repo="https://github.com/Voice-Privacy-Challenge/Voice-Privacy-Challenge-2024"

download_url \
  "https://raw.githubusercontent.com/Voice-Privacy-Challenge/Voice-Privacy-Challenge-2024/main/README.md" \
  "$out/voiceprivacy-2024-README.md"
download_url \
  "https://raw.githubusercontent.com/Voice-Privacy-Challenge/Voice-Privacy-Challenge-2024/main/LICENSE" \
  "$out/voiceprivacy-2024-LICENSE"
download_url \
  "https://api.github.com/repos/Voice-Privacy-Challenge/Voice-Privacy-Challenge-2024" \
  "$out/voiceprivacy-2024-repository.json"

if [[ "${VOICEPRIVACY_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo" "$out/Voice-Privacy-Challenge-2024"
fi

manual_required \
  "VoicePrivacy Challenge 2024 data and model packages" \
  "Register with the organisers to receive the password used by the official downloader:" \
  "  https://www.voiceprivacychallenge.org/vp2024/" \
  "IEMOCAP must also be requested separately from its owner:" \
  "  https://sail.usc.edu/iemocap/iemocap_release.htm" \
  "The helper does not accept credentials or fetch protected data."
