#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir mugen)"
repo_base_url="${MUGEN_REPO_BASE_URL:-https://raw.githubusercontent.com/danielqwer/MUGEN/main}"
repo_api_url="${MUGEN_REPO_API_URL:-https://api.github.com/repos/danielqwer/MUGEN}"
hf_org_url="${MUGEN_HF_ORG_URL:-https://huggingface.co/MUGEN-Benchmark}"
hf_api_url="${MUGEN_HF_API_URL:-https://huggingface.co/api/datasets?author=MUGEN-Benchmark&limit=100&full=true}"
paper_url="${MUGEN_PAPER_URL:-https://arxiv.org/abs/2603.09714}"

download_url "$repo_base_url/README.md" "$out/repository-README.md"
download_url "$repo_base_url/data/README.md" "$out/data-README.md"
download_url "$repo_base_url/evaluation/README.md" "$out/evaluation-README.md"
download_url "$repo_base_url/LICENSE" "$out/repository-LICENSE"
download_url "$repo_api_url" "$out/github-api.json"
download_url "$hf_api_url" "$out/hugging-face-task-inventory.json"
download_url "$paper_url" "$out/arxiv-2603.09714.html"

task="${MUGEN_DOWNLOAD_TASK:-}"
if [[ -z "$task" ]]; then
  cat <<MSG
MUGEN documentation and the 35-task inventory are available in: $out

The Hugging Face task cards do not state a data license, and the complete
collection currently reports about 10.7 GB of compressed files. Download one
task explicitly, for example:

  MUGEN_DOWNLOAD_TASK=Keyword_Spotting scripts/download/mugen.sh

See $repo_base_url/data/README.md or $hf_org_url for all task names.
MSG
  exit 0
fi

case "$task" in
  Accent_Identification|Accent_Tempo_Filtering|Cocktail_Party_Extraction|Disfluency_Detection|Duration_Extremes_Extraction|Duration_Ordinal_Selection|Duration_Precise_Selection|Dysarthria_Detection|Emotion_Intensity_Comparison|Emotion_Recognition|Gender_Classification|Gender_Emotion_Filtering|Genre_Classification|Instrument_Classification|Intent_Classification|Interruption_Detection|Key_Detection|Keyword_Spotting|Language_Identification|Max_Attribute_Selection|Music_Tagging|Negative_Constraint_Filtering|Noise_Environment_Classification|Ordinal_Speaking_Rate|Pitch_Level_Distinction|Prosodic_Stress_Matching|Prosody_Semantic_Mismatch|Signal_to_Noise_Comparison|Speaker_Verification|Speaking_Rate_Extremes|Specific_Speaker_State|Speech_Concurrent_Event_Detection|Vocal_Effort_Recognition|Vocal_Fry_Detection|Vocal_Technique_Detection)
    hf_download_dataset "MUGEN-Benchmark/$task" "$out/$task"
    ;;
  *)
    echo "Unknown MUGEN task: $task" >&2
    echo "Choose an exact task name from $out/data-README.md" >&2
    exit 2
    ;;
esac

echo "MUGEN task download complete: $out/$task"
