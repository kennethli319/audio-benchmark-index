#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir chime_7_dasr)"
challenge_base="${CHIME7_DASR_CHALLENGE_BASE_URL:-https://www.chimechallenge.org/challenges/chime7/task1}"
recipe_base="${CHIME7_DASR_RECIPE_BASE_URL:-https://raw.githubusercontent.com/espnet/espnet/master/egs2/chime7_task1}"

download_url "$challenge_base/index" "$out/challenge.html"
download_url "$challenge_base/data" "$out/data.html"
download_url "$challenge_base/baseline" "$out/baseline.html"
download_url "https://arxiv.org/abs/2306.13734" "$out/paper.html"
download_url "$recipe_base/asr1/README.md" "$out/asr1-README.md"
download_url "$recipe_base/diar_asr1/README.md" "$out/diar-asr1-README.md"
download_url "https://raw.githubusercontent.com/espnet/espnet/master/LICENSE" "$out/ESPnet-LICENSE"

manual_required \
  "CHiME-7 DASR" \
  "Saved official challenge, paper, and ESPnet recipe documentation to $out." \
  "The task combines revised CHiME-6, DiPCo, and challenge-specific Mixer 6 partitions." \
  "Follow the official data page for CHiME-5/CHiME-6 access: $challenge_base/data" \
  "Submit the LDC CHiME-7 evaluation agreement linked there for the task-specific Mixer 6 release; it is not the same release as catalog item LDC2013S03." \
  "After obtaining the controlled inputs, use the official ESPnet recipe to generate the task layout. Do not commit corpus audio, agreements, credentials, or private evaluation material."
