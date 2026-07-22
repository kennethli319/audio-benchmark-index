#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir ming_freeform_audio_edit)"
hf_repo="${MING_FREEFORM_AUDIO_EDIT_HF_REPO:-inclusionAI/Ming-Freeform-Audio-Edit-Benchmark}"
repo_url="${MING_FREEFORM_AUDIO_EDIT_REPO_URL:-https://github.com/inclusionAI/Ming-Freeform-Audio-Edit.git}"
raw_base_url="${MING_FREEFORM_AUDIO_EDIT_RAW_BASE_URL:-https://raw.githubusercontent.com/inclusionAI/Ming-Freeform-Audio-Edit/main}"
repo_api_url="${MING_FREEFORM_AUDIO_EDIT_REPO_API_URL:-https://api.github.com/repos/inclusionAI/Ming-Freeform-Audio-Edit}"

download_url "$raw_base_url/README.md" "$out/README.md"
download_url "https://huggingface.co/datasets/$hf_repo/raw/main/README.md" "$out/hf_README.md"
download_url "$repo_api_url" "$out/github-repo.json"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/hf-dataset.json"

if [[ "${MING_FREEFORM_AUDIO_EDIT_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/Ming-Freeform-Audio-Edit"
else
  echo "Skipping evaluation repo clone. Set MING_FREEFORM_AUDIO_EDIT_CLONE_REPO=1 to clone/update it."
fi

if [[ "${MING_FREEFORM_AUDIO_EDIT_DOWNLOAD_HF:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded Ming-Freeform-Audio-Edit documentation and repository metadata only.
The public Hugging Face repository uses approximately 1.07 GB of storage and
contains source speech, so the full snapshot is opt-in.

Set MING_FREEFORM_AUDIO_EDIT_DOWNLOAD_HF=1 to download the snapshot. The HF card
lists Apache-2.0, but Seed-TTS Eval, LibriTTS, GigaSpeech, and other source-audio
terms still apply. Review them before reuse, redistribution, or commercial use.
EOF
  echo "Ming-Freeform-Audio-Edit metadata download complete: $out"
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/hf"
echo "Ming-Freeform-Audio-Edit requested download complete: $out"
