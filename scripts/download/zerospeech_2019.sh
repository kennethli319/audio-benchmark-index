#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir zerospeech_2019)"
english_url="${ZEROSPEECH2019_ENGLISH_URL:-https://download.zerospeech.com/archive/2019/english.tgz}"
english_small_url="${ZEROSPEECH2019_ENGLISH_SMALL_URL:-https://download.zerospeech.com/archive/2019/english_small.tgz}"
surprise_url="${ZEROSPEECH2019_SURPRISE_URL:-https://download.zerospeech.com/archive/2019/surprise.zip}"

download_url "https://zerospeech.com/challenge_archive/2019/tasks/" "$out/tasks.html"
download_url "https://zerospeech.com/challenge_archive/2019/data/" "$out/data.html"
download_url "https://zerospeech.com/challenge_archive/2019/results/" "$out/results.html"
download_url "https://www.isca-archive.org/interspeech_2019/dunbar19_interspeech.html" "$out/paper.html"

require_cmd curl
curl -L --fail --head "$english_url" > "$out/english-headers.txt"
curl -L --fail --head "$english_small_url" > "$out/english-small-headers.txt"
curl -L --fail --head "$surprise_url" > "$out/surprise-headers.txt"

if [[ "${ZEROSPEECH2019_DOWNLOAD_ENGLISH_SMALL:-0}" == "1" ]]; then
  download_url "$english_small_url" "$out/english_small.tgz"
fi

if [[ "${ZEROSPEECH2019_DOWNLOAD_ENGLISH:-0}" == "1" ]]; then
  download_url "$english_url" "$out/english.tgz"
fi

if [[ "${ZEROSPEECH2019_DOWNLOAD_SURPRISE:-0}" == "1" ]]; then
  manual_required "ZeroSpeech 2019 surprise-language data" \
    "Review and accept the custom agreement on the official data page." \
    "The archive is password protected, challenge-only, and may not be redistributed." \
    "Official page: https://zerospeech.com/challenge_archive/2019/data/"
fi

cat <<'MSG'
ZeroSpeech 2019 metadata download complete.

The public English toy and full archives are optional:

  ZEROSPEECH2019_DOWNLOAD_ENGLISH_SMALL=1 scripts/download/zerospeech_2019.sh
  ZEROSPEECH2019_DOWNLOAD_ENGLISH=1 scripts/download/zerospeech_2019.sh

No standalone license is stated for the English archives. The surprise archive
requires manual agreement acceptance and is restricted to challenge use with
redistribution prohibited; this helper does not automate that download.
MSG
