#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir instruct_tts_eval)"
raw_base_url="${INSTRUCT_TTS_EVAL_RAW_BASE_URL:-https://raw.githubusercontent.com/KexinHUANG19/InstructTTSEval/main}"
repo_url="${INSTRUCT_TTS_EVAL_REPO_URL:-https://github.com/KexinHUANG19/InstructTTSEval.git}"
hf_repo="${INSTRUCT_TTS_EVAL_HF_REPO:-CaasiHUANG/InstructTTSEval}"

download_url "$raw_base_url/README.md" "$out/README.md"
download_url "https://huggingface.co/datasets/$hf_repo/raw/main/README.md" "$out/hf_README.md"

if [[ "${INSTRUCT_TTS_EVAL_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/InstructTTSEval"
else
  echo "Skipping evaluation repo clone. Set INSTRUCT_TTS_EVAL_CLONE_REPO=1 to clone/update it."
fi

if [[ "${INSTRUCT_TTS_EVAL_DOWNLOAD_HF:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded InstructTTSEval docs only. The public Hugging Face snapshot uses
about 1.8 GB and contains embedded reference audio, so it is opt-in.

Set INSTRUCT_TTS_EVAL_DOWNLOAD_HF=1 to download CaasiHUANG/InstructTTSEval.
The HF card lists MIT, but the paper describes film/TV-derived source audio and
academic/research-only use. Verify source-media rights before redistribution.
EOF
  echo "InstructTTSEval metadata download complete: $out"
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/hf"

echo "InstructTTSEval requested download complete: $out"
