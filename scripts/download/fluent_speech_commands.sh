#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir fluent_speech_commands)"

download_url \
  "https://fluent.ai/fluent-speech-commands-a-dataset-for-spoken-language-understanding-research/" \
  "$out/fluent_speech_commands_page.html"

download_url \
  "https://fluent.ai/wp-content/uploads/2021/04/Fluent_Speech_Commands_Public_License.pdf" \
  "$out/Fluent_Speech_Commands_Public_License.pdf"

manual_required \
  "Fluent Speech Commands" \
  "The public Fluent.ai page points dataset access to the Fluent Speech Commands Google Group." \
  "Homepage: https://fluent.ai/fluent-speech-commands-a-dataset-for-spoken-language-understanding-research/" \
  "Access group: https://groups.google.com/a/fluent.ai/forum/#!forum/fluent-speech-commands" \
  "Paper: https://arxiv.org/abs/1904.03670" \
  "License PDF: https://fluent.ai/wp-content/uploads/2021/04/Fluent_Speech_Commands_Public_License.pdf" \
  "Terms: academic research only under CC BY-NC-ND 4.0; do not commit granted links, audio, or private access details."
