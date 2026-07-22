#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir omni_cloze)"
raw_base="${OMNI_CLOZE_RAW_BASE_URL:-https://raw.githubusercontent.com/ddlBoJack/Omni-Captioner/main}"
hf_repo="${OMNI_CLOZE_HF_REPO:-BoJack/Omni-Cloze}"

download_url "$raw_base/README.md" "$out/README.md"
download_url "https://huggingface.co/datasets/$hf_repo/raw/main/README.md" "$out/hf_README.md"
download_url "https://huggingface.co/datasets/$hf_repo/resolve/main/generate_prediction.py" "$out/generate_prediction.py"
download_url "https://huggingface.co/datasets/$hf_repo/resolve/main/compute_acc.py" "$out/compute_acc.py"

if [[ "${OMNI_CLOZE_DOWNLOAD_METADATA:-0}" == "1" ]]; then
  download_url "https://huggingface.co/datasets/$hf_repo/resolve/main/omni_cloze.jsonl" "$out/omni_cloze.jsonl"
else
  echo "Skipping the 25.1 MB metadata file. Set OMNI_CLOZE_DOWNLOAD_METADATA=1 to download it."
fi

if [[ "${OMNI_CLOZE_DOWNLOAD_HF:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded Omni-Cloze documentation and evaluation scripts only. The public,
ungated release includes several GB of video tar files and has no stated data
license or source-media terms, so the full snapshot is opt-in.

Set OMNI_CLOZE_DOWNLOAD_HF=1 to request the full Hugging Face snapshot. Review
and clarify the data, code, and source-media rights before reuse or redistribution.
EOF
  echo "Omni-Cloze documentation download complete: $out"
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/hf"

echo "Omni-Cloze requested download complete: $out"
