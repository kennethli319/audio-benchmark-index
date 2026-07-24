#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir big_bench_audio)"
hf_repo="${BIG_BENCH_AUDIO_HF_REPO:-ArtificialAnalysis/big_bench_audio}"
hf_base_url="${BIG_BENCH_AUDIO_HF_BASE_URL:-https://huggingface.co/datasets/$hf_repo}"
hf_api_url="${BIG_BENCH_AUDIO_HF_API_URL:-https://huggingface.co/api/datasets/$hf_repo}"
mimo_loader_url="${BIG_BENCH_AUDIO_MIMO_LOADER_URL:-https://raw.githubusercontent.com/XiaomiMiMo/MiMo-Audio-Eval/main/slm_eval/datasets/bigbench_audio.py}"

download_url "$hf_base_url/raw/main/README.md" "$out/dataset-card.md"
download_url "$hf_api_url" "$out/hugging-face-api.json"
download_url "$mimo_loader_url" "$out/mimo-audio-eval-loader.py"

if [[ "${BIG_BENCH_AUDIO_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "$hf_repo" "$out/hugging-face"
else
  cat <<'MSG'
Big Bench Audio documentation and metadata download complete.

The Hugging Face API reports approximately 612 MB of repository storage
including history. To download the full public snapshot explicitly, run:

  BIG_BENCH_AUDIO_DOWNLOAD_HF=1 scripts/download/big_bench_audio.sh

The dataset card declares MIT, but the spoken questions derive from BIG-Bench
Hard and the audio uses voices from multiple synthesis providers. Review
inherited task terms and provider-generated-audio conditions before reuse.
MSG
fi
