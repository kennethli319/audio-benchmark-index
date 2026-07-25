#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir tidyvoice)"
challenge_url="${TIDYVOICE_CHALLENGE_URL:-https://tidyvoice2026.github.io/}"
download_page_url="${TIDYVOICE_DOWNLOAD_PAGE_URL:-https://tidyvoice2026.github.io/2_dataset_download/}"
dataset_url="${TIDYVOICE_DATASET_URL:-https://datacollective.mozillafoundation.org/datasets/cmihtsewu023so207xot1iqqw}"
raw_base="${TIDYVOICE_RAW_BASE_URL:-https://raw.githubusercontent.com/areffarhadi/wespeaker/master/examples/tidyvocie}"

download_url "$challenge_url" "$out/challenge.html"
download_url "$download_page_url" "$out/dataset-download.html"
download_url "$dataset_url" "$out/mozilla-data-collective.html"
download_url "$raw_base/README.md" "$out/baseline-README.md"
download_url "https://arxiv.org/abs/2601.16358" "$out/tidyvoice-paper.html"
download_url "https://arxiv.org/abs/2601.21960" "$out/challenge-plan.html"
download_url "https://arxiv.org/abs/2607.16532" "$out/amecxsv-evaluation.html"

manual_required \
  "TidyVoiceX_ASV" \
  "Saved official challenge, dataset, baseline, and paper documentation to $out." \
  "The approximately 36.72 GB public archive requires a Mozilla Data Collective account and API key:" \
  "  $dataset_url" \
  "Follow the official API instructions linked from the challenge download page:" \
  "  $download_page_url" \
  "Do not place API keys in scripts, shell history, commits, or issue reports." \
  "The dataset page forbids speaker identification and identity recovery and permits only speaker-verification use; review the current Common Voice terms before download."
