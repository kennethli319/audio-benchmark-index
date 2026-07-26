#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir multichallenge_audio)"
mimo_repo="${MULTICHALLENGE_AUDIO_HF_REPO:-XiaomiMiMo/MiMo-Audio-Evalset}"
mimo_base_url="${MULTICHALLENGE_AUDIO_HF_BASE_URL:-https://huggingface.co/datasets/$mimo_repo}"
mimo_api_url="${MULTICHALLENGE_AUDIO_HF_API_URL:-https://huggingface.co/api/datasets/$mimo_repo}"
scale_repo="${MULTICHALLENGE_AUDIO_SOURCE_HF_REPO:-ScaleAI/MultiChallenge}"
scale_base_url="${MULTICHALLENGE_AUDIO_SOURCE_HF_BASE_URL:-https://huggingface.co/datasets/$scale_repo}"
loader_url="${MULTICHALLENGE_AUDIO_LOADER_URL:-https://raw.githubusercontent.com/XiaomiMiMo/MiMo-Audio-Eval/main/slm_eval/datasets/multi_challenge.py}"
evaluator_url="${MULTICHALLENGE_AUDIO_EVALUATOR_URL:-https://raw.githubusercontent.com/XiaomiMiMo/MiMo-Audio-Eval/main/slm_eval/evaluator/multi_challenge_evaluator.py}"

download_url "$mimo_base_url/raw/main/README.md" "$out/mimo-dataset-card.md"
download_url "$mimo_api_url" "$out/mimo-hugging-face-api.json"
download_url "$scale_base_url/raw/main/README.md" "$out/source-dataset-card.md"
download_url "$loader_url" "$out/mimo-audio-eval-loader.py"
download_url "$evaluator_url" "$out/mimo-audio-evaluator.py"

if [[ "${MULTICHALLENGE_AUDIO_DOWNLOAD_ARCHIVE:-0}" == "1" ]]; then
  hf_download_dataset \
    "$mimo_repo" \
    "$out/speech-release" \
    --include "multi_challenge.tar.gz"
else
  cat <<'MSG'
MultiChallenge Audio documentation and metadata download complete.

The public speech archive is approximately 1.55 GB. To fetch it explicitly:

  MULTICHALLENGE_AUDIO_DOWNLOAD_ARCHIVE=1 scripts/download/multichallenge_audio.sh

The MiMo card declares MIT but disclaims ownership of included datasets.
Scale AI's source text is CC BY 4.0, and the MiMo report does not identify the
commercial TTS provider or separately state generated-voice rights. Review all
applicable upstream and synthesis-provider terms before reuse.
MSG
fi
