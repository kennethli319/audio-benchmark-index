#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir ifeval_audio)"
hf_repo="${IFEVAL_AUDIO_HF_REPO:-YichenG170/AudioLLMInstructionFollowing}"
hf_api_url="${IFEVAL_AUDIO_HF_API_URL:-https://huggingface.co/api/datasets/$hf_repo}"
benchmark_readme_url="${IFEVAL_AUDIO_BENCHMARK_README_URL:-https://raw.githubusercontent.com/AudioLLMs/AudioBench/main/IFEval-Audio/README.md}"
code_license_url="${IFEVAL_AUDIO_CODE_LICENSE_URL:-https://raw.githubusercontent.com/AudioLLMs/AudioBench/main/LICENSE}"

download_url "$hf_api_url" "$out/huggingface-dataset.json"
download_url "$benchmark_readme_url" "$out/benchmark-README.md"
download_url "$code_license_url" "$out/AudioBench-LICENSE"

if [[ "${IFEVAL_AUDIO_DOWNLOAD_HF:-0}" != "1" ]]; then
  echo "Downloaded IFEval-Audio docs and repository metadata to: $out"
  echo "Set IFEVAL_AUDIO_DOWNLOAD_HF=1 after logging in and accepting the Hugging Face access conditions."
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/huggingface"
echo "IFEval-Audio Hugging Face snapshot complete: $out/huggingface"
echo "Preserve source-dataset terms; the paper identifies mixed upstream licenses."
