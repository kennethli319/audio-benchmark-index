#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir soulx_singer_eval)"
repo_raw="https://raw.githubusercontent.com/Soul-AILab/SoulX-Singer-Eval/main"
repo_api="https://api.github.com/repos/Soul-AILab/SoulX-Singer-Eval"
hf_repo="Soul-AILab/SoulX-Singer-Eval-Dataset"
hf_base="https://huggingface.co/datasets/$hf_repo"

download_url "$repo_raw/README.md" "$out/evaluation-suite-README.md"
download_url "$repo_raw/LICENSE" "$out/evaluation-suite-LICENSE"
download_url "$repo_api" "$out/evaluation-suite-api.json"
download_url "$hf_base/raw/main/README.md" "$out/dataset-card.md"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/dataset-api.json"

annotations=(
  "gmo-svs/annotation/opensource_eval.phone.prompt.jsonl"
  "gmo-svs/annotation/opensource_eval.phone.target.jsonl"
  "gmo-svs/annotation/opensource_eval.word.prompt.jsonl"
  "gmo-svs/annotation/opensource_eval.word.target.jsonl"
  "soulx-singer-eval/annotation/soulxsinger_eval.phone.prompt.jsonl"
  "soulx-singer-eval/annotation/soulxsinger_eval.phone.target.jsonl"
  "soulx-singer-eval/annotation/soulxsinger_eval.word.prompt.jsonl"
  "soulx-singer-eval/annotation/soulxsinger_eval.word.target.jsonl"
)
for path in "${annotations[@]}"; do
  download_url "$hf_base/resolve/main/$path?download=true" "$out/$path"
done

if [[ "${SOULX_SINGER_EVAL_CLONE_REPO:-0}" == "1" ]]; then
  require_cmd git
  if [[ -d "$out/evaluation-suite/.git" ]]; then
    echo "Already cloned: $out/evaluation-suite"
  else
    git clone --depth 1 https://github.com/Soul-AILab/SoulX-Singer-Eval.git "$out/evaluation-suite"
  fi
else
  echo "Skipping the evaluation-suite clone. Set SOULX_SINGER_EVAL_CLONE_REPO=1 to fetch it."
fi

if [[ "${SOULX_SINGER_EVAL_DOWNLOAD_AUDIO:-0}" == "1" ]]; then
  hf_download_dataset "$hf_repo" "$out/hugging-face" --include '*/audio/*'
else
  echo "Skipping the approximately 888 MiB audio snapshot. Set SOULX_SINGER_EVAL_DOWNLOAD_AUDIO=1 to fetch it."
fi

cat <<MSG
SoulX-Singer-Eval metadata and annotations downloaded to: $out

The dataset card declares CC BY-NC 4.0 and the evaluation code is Apache-2.0.
GMO-SVS source corpora, Mixing Secrets recordings, compositions, performer
consent, and voice rights retain their own terms.
MSG
