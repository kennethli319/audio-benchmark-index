#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir step_audio_r1_5_benchmarks)"
repo="https://github.com/stepfun-ai/Step-Audio-R1"
revision="c73a43cd1f64f07b5d68ef4a41a0b2e4125ae6f8"
raw="https://raw.githubusercontent.com/stepfun-ai/Step-Audio-R1/$revision/benchmarks/Step-Audio-R1.5"

download_url "$raw/README.md" "$out/README.md"
download_url "$raw/step_caption/README.md" "$out/step_caption/README.md"
download_url "$raw/step_caption/metadata.jsonl" "$out/step_caption/metadata.jsonl"
download_url "$raw/step_dialogue_understanding/README.md" "$out/step_dialogue_understanding/README.md"
download_url "$raw/step_dialogue_understanding/metadata.jsonl" "$out/step_dialogue_understanding/metadata.jsonl"
download_url "$raw/step_spqa/README.md" "$out/step_spqa/README.md"
download_url "$raw/step_spqa/metadata.jsonl" "$out/step_spqa/metadata.jsonl"
download_url "https://api.github.com/repos/stepfun-ai/Step-Audio-R1/git/trees/$revision?recursive=1" "$out/github-tree.json"

prompt_paths=(
  step_caption/prompts/judge_system_prompt.txt
  step_caption/prompts/judge_user_prompt_template.txt
  step_caption/prompts/model_user_prompt.txt
  step_dialogue_understanding/prompts/judge_system_prompt.txt
  step_dialogue_understanding/prompts/judge_user_prompt_template.txt
  step_dialogue_understanding/prompts/model_user_prompt_template.txt
  step_spqa/prompts/judge_prompts/age.txt
  step_spqa/prompts/judge_prompts/default.txt
  step_spqa/prompts/judge_prompts/emotions.txt
  step_spqa/prompts/judge_prompts/event.txt
  step_spqa/prompts/judge_prompts/gender.txt
  step_spqa/prompts/judge_prompts/pitch.txt
  step_spqa/prompts/judge_prompts/prompt_map.json
  step_spqa/prompts/judge_prompts/rhythm.txt
  step_spqa/prompts/judge_prompts/scene.txt
  step_spqa/prompts/judge_prompts/speed.txt
  step_spqa/prompts/judge_prompts/vocalsound.txt
  step_spqa/prompts/judge_prompts/voice_styles.txt
  step_spqa/prompts/judge_prompts/voice_tone.txt
  step_spqa/prompts/model_usage_note.txt
  step_spqa/prompts/model_user_prompt_template.txt
)
for path in "${prompt_paths[@]}"; do
  download_url "$raw/$path" "$out/$path"
done

if [[ "${STEP_AUDIO_R1_5_DOWNLOAD_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo.git" "$out/repository"
else
  cat <<'EOF'
Downloaded pinned documentation, annotations, prompts, and repository-tree metadata.

Set STEP_AUDIO_R1_5_DOWNLOAD_REPO=1 to clone the complete repository, including
approximately 1.04 GB of benchmark audio and other objects. Review YouTube and
Bilibili source rights, voice consent, privacy, biometric, and publicity terms
before using or redistributing the released audio.
EOF
fi

echo "Step-Audio-R1.5 benchmark metadata download complete: $out"
