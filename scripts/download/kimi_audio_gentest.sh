#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir kimi_audio_gentest)"
hf_repo="${KIMI_AUDIO_GENTEST_HF_REPO:-moonshotai/Kimi-Audio-GenTest}"
toolkit_repo="${KIMI_AUDIO_GENTEST_TOOLKIT_REPO:-https://github.com/MoonshotAI/Kimi-Audio-Evalkit.git}"

download_url "https://huggingface.co/datasets/$hf_repo/raw/main/README.md" "$out/README.md"
download_url "https://huggingface.co/datasets/$hf_repo/resolve/main/test/metadata.jsonl" "$out/metadata.jsonl"
download_url "https://arxiv.org/abs/2504.18425" "$out/paper.html"
download_url "https://raw.githubusercontent.com/MoonshotAI/Kimi-Audio-Evalkit/master/README.md" "$out/evalkit_README.md"
download_url "https://raw.githubusercontent.com/MoonshotAI/Kimi-Audio-Evalkit/master/LICENSE" "$out/evalkit_LICENSE"

if [[ "${KIMI_AUDIO_GENTEST_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "$hf_repo" "$out/hf"
else
  echo "Skipping the 191-file prompt-audio snapshot. Set KIMI_AUDIO_GENTEST_DOWNLOAD_HF=1 to download it."
fi

if [[ "${KIMI_AUDIO_GENTEST_CLONE_TOOLKIT:-0}" == "1" ]]; then
  git_clone_or_update "$toolkit_repo" "$out/Kimi-Audio-Evalkit"
else
  echo "Skipping the evaluation toolkit clone. Set KIMI_AUDIO_GENTEST_CLONE_TOOLKIT=1 to clone it."
fi

cat <<'EOF'
The public release includes benchmark inputs and labels, but not Table 7's
baseline outputs, individual human ratings, or complete subjective protocol.
The dataset card declares MIT without separately documenting prompt-audio
provenance; review recording, content, and downstream model terms before reuse.
EOF

echo "Kimi-Audio-GenTest download complete: $out"
