#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir omnilingual_asr_corpus)"
hf_repo="${OMNILINGUAL_ASR_HF_REPO:-facebook/omnilingual-asr-corpus}"
repo_raw="${OMNILINGUAL_ASR_REPO_RAW_URL:-https://raw.githubusercontent.com/facebookresearch/omnilingual-asr/main}"

download_url "https://huggingface.co/datasets/$hf_repo/raw/main/README.md" "$out/hf-README.md"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/hf-api.json"
download_url "$repo_raw/README.md" "$out/repo-README.md"
download_url "$repo_raw/LICENSE" "$out/repo-LICENSE"

if [[ "${OMNILINGUAL_ASR_DOWNLOAD_CONFIG:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded Omnilingual ASR Corpus documentation and API metadata only. The
public Hugging Face repository is approximately 491 GB.

To request one language-script configuration, set both variables, for example:
  OMNILINGUAL_ASR_CONFIG=lij_Latn OMNILINGUAL_ASR_DOWNLOAD_CONFIG=1 scripts/download/omnilingual_asr_corpus.sh
EOF
  echo "Omnilingual ASR Corpus metadata download complete: $out"
  exit 0
fi

config="${OMNILINGUAL_ASR_CONFIG:-}"
if [[ -z "$config" || "$config" == "default" ]]; then
  echo "Set OMNILINGUAL_ASR_CONFIG to one language-script configuration; the full default snapshot is intentionally disabled." >&2
  exit 2
fi

hf_download_dataset \
  "$hf_repo" \
  "$out/$config" \
  --include "README.md" \
  --include "data/$config/*"

echo "Omnilingual ASR Corpus configuration download complete: $out/$config"
