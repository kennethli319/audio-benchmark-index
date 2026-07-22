#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir korean_speechlm_benchmarks)"
paper_url="${KOREAN_SPEECHLM_BENCHMARKS_PAPER_URL:-https://arxiv.org/abs/2605.27984}"
repo_api_url="${KOREAN_SPEECHLM_BENCHMARKS_REPO_API_URL:-https://api.github.com/repos/krafton-ai/Raon-Eval}"
repo_license_url="${KOREAN_SPEECHLM_BENCHMARKS_REPO_LICENSE_URL:-https://raw.githubusercontent.com/krafton-ai/Raon-Eval/main/LICENSE}"

download_url "$paper_url" "$out/arxiv-2605.27984.html"
download_url "$repo_api_url" "$out/raon-eval-github-api.json"
download_url "$repo_license_url" "$out/raon-eval-LICENSE"

for name in KVoiceBench KOpenAudioBench KMMAU; do
  base_url="https://huggingface.co/datasets/KRAFTON/$name"
  download_url "$base_url/raw/main/README.md" "$out/$name-dataset-card.md"
  download_url "https://huggingface.co/api/datasets/KRAFTON/$name" "$out/$name-hugging-face-api.json"
done

if [[ "${KOREAN_SPEECHLM_BENCHMARKS_DOWNLOAD_HF:-0}" == "1" ]]; then
  for name in KVoiceBench KOpenAudioBench KMMAU; do
    hf_download_dataset "KRAFTON/$name" "$out/$name"
  done
else
  echo "Skipping the approximately 9.7 GB combined dataset snapshots."
  echo "Set KOREAN_SPEECHLM_BENCHMARKS_DOWNLOAD_HF=1 to download all three releases."
fi

cat <<MSG
Korean SpeechLM benchmark metadata download complete: $out

KVoiceBench and KOpenAudioBench declare Apache-2.0; KMMAU declares
CC BY-NC-SA 4.0. Review the adapted benchmarks and source-corpus terms before
redistribution or commercial use.
MSG
