#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir seed_tts_eval)"
raw_base="${SEED_TTS_EVAL_RAW_BASE_URL:-https://raw.githubusercontent.com/BytedanceSpeech/seed-tts-eval/main}"
repo_url="${SEED_TTS_EVAL_REPO_URL:-https://github.com/BytedanceSpeech/seed-tts-eval.git}"

download_url "$raw_base/README.md" "$out/README.md"
download_url "$raw_base/cal_wer.sh" "$out/cal_wer.sh"
download_url "$raw_base/cal_sim.sh" "$out/cal_sim.sh"
download_url "$raw_base/requirements.txt" "$out/requirements.txt"

if [[ "${SEED_TTS_EVAL_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/seed-tts-eval"
else
  echo "Skipping repository clone. Set SEED_TTS_EVAL_CLONE_REPO=1 to clone the evaluation code."
fi

cat <<MSG
Seed-TTS Eval metadata download complete: $out

The official public objective EN/ZH test set is linked from the README:
https://drive.google.com/file/d/1GlSjVfSHkW3-leKKBlfrjuuTGqQ_xaLP/edit

This helper does not automate Google Drive downloads. The Seed-TTS paper says
the separate subjective set is not released because of copyright restrictions.
No standalone data or code license is specified by the official repository;
review Common Voice and DiDiSpeech-2 source terms before use or redistribution.
MSG
