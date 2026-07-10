#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir ms_snsd)"
raw_base="${MS_SNSD_RAW_BASE:-https://raw.githubusercontent.com/microsoft/MS-SNSD/master}"

download_repo_file() {
  local file="$1"
  download_url "$raw_base/$file" "$out/$file"
}

download_repo_file README.md
download_repo_file LICENSE
download_repo_file requirements.txt
download_repo_file noisyspeech_synthesizer.cfg
download_repo_file noisyspeech_synthesizer.py
download_repo_file audiolib.py

if [[ "${MS_SNSD_CLONE_REPO:-0}" == "1" ]]; then
  cat <<'MSG'
Cloning the MS-SNSD repository can download several GiB of audio data.
MSG
  clone_or_update "https://github.com/microsoft/MS-SNSD.git" "$out/MS-SNSD"
fi

if [[ "${MS_SNSD_RUN_SYNTHESIS:-0}" == "1" ]]; then
  if [[ ! -d "$out/MS-SNSD/.git" ]]; then
    cat <<'MSG' >&2
MS_SNSD_RUN_SYNTHESIS requires a local repository clone with the clean speech
and noise directories. Run:
  MS_SNSD_CLONE_REPO=1 scripts/download/ms_snsd.sh
then review/edit noisyspeech_synthesizer.cfg and run synthesis from that clone.
MSG
    exit 2
  fi
  cat <<MSG >&2
Synthesis is intentionally not launched automatically. Review upstream terms,
install requirements, edit:
  $out/MS-SNSD/noisyspeech_synthesizer.cfg
then run:
  cd "$out/MS-SNSD" && python3 noisyspeech_synthesizer.py
MSG
  exit 2
fi

cat <<MSG
MS-SNSD metadata and generator files saved to: $out
Large audio data were skipped. Useful opt-ins:
  MS_SNSD_CLONE_REPO=1 scripts/download/ms_snsd.sh
  MS_SNSD_RUN_SYNTHESIS=1 scripts/download/ms_snsd.sh
MSG
