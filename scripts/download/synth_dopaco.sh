#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir synth_dopaco)"
challenge_url="${SYNTH_DOPACO_CHALLENGE_URL:-https://betrac.github.io/}"
rules_url="${SYNTH_DOPACO_RULES_URL:-https://raw.githubusercontent.com/betrac/betrac.github.io/main/rules.md}"
dataset_paper_url="${SYNTH_DOPACO_DATASET_PAPER_URL:-https://arxiv.org/abs/2604.06138}"
evaluation_paper_url="${SYNTH_DOPACO_EVALUATION_PAPER_URL:-https://arxiv.org/abs/2607.17230}"
hf_base_url="${SYNTH_DOPACO_HF_BASE_URL:-https://huggingface.co/datasets/BeTraC/betrac-2026}"
hf_api_url="${SYNTH_DOPACO_HF_API_URL:-https://huggingface.co/api/datasets/BeTraC/betrac-2026}"
metrics_api_url="${SYNTH_DOPACO_METRICS_API_URL:-https://api.github.com/repos/betrac/betrac-metrics}"

download_url "$challenge_url" "$out/challenge.html"
download_url "$rules_url" "$out/challenge-rules.md"
download_url "$dataset_paper_url" "$out/arxiv-2604.06138.html"
download_url "$evaluation_paper_url" "$out/arxiv-2607.17230.html"
download_url "$hf_base_url/raw/main/README.md" "$out/README.md"
download_url "$hf_api_url" "$out/hugging-face-api.json"
download_url "$metrics_api_url" "$out/metrics-repository-api.json"

if [[ "${SYNTH_DOPACO_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "BeTraC/betrac-2026" "$out/hugging-face"
else
  echo "Skipping the approximately 14.6 GB train/dev snapshot. Set SYNTH_DOPACO_DOWNLOAD_HF=1 to download it."
fi

cat <<MSG
Synth-DoPaCo metadata download complete: $out

The public CC BY 4.0 release contains train and development data only.
BeTraC's 875-item blind test set is withheld and is not downloaded here.
MSG
