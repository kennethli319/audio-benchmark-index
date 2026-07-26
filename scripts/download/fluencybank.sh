#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir fluencybank)"

download_url "https://talkbank.org/fluency/" "$out/fluencybank-home.html"
download_url \
  "https://talkbank.org/fluency/access/" \
  "$out/fluencybank-corpus-index.html"
download_url \
  "https://talkbank.org/0share/rules.html" \
  "$out/talkbank-ground-rules.html"

manual_required \
  "FluencyBank research data" \
  "Create a TalkBank account, read the Ground Rules, and request FluencyBank consortium membership:" \
  "  https://talkbank.org/fluency/" \
  "Students and laboratory researchers require faculty sponsorship." \
  "The July 2026 timing paper does not publish the exact files in its four-hour evaluation selection."
