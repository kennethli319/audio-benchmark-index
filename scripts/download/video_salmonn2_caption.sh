#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir video_salmonn2_caption)"
hf_repo="${VIDEO_SALMONN2_HF_REPO:-tsinghua-ee/video-SALMONN_2_testset}"
repo_url="${VIDEO_SALMONN2_REPO_URL:-https://github.com/bytedance/video-SALMONN-2.git}"

download_url "https://huggingface.co/datasets/$hf_repo/raw/main/README.md" "$out/README.md"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/huggingface-dataset.json"
download_url "https://huggingface.co/datasets/$hf_repo/resolve/main/video_salmonn2_test.json" "$out/video_salmonn2_test.json"
download_url "https://huggingface.co/datasets/$hf_repo/resolve/main/eval.py" "$out/eval.py"
download_url "https://raw.githubusercontent.com/bytedance/video-SALMONN-2/main/README.md" "$out/evaluation-README.md"
download_url "https://raw.githubusercontent.com/bytedance/video-SALMONN-2/main/LICENSE" "$out/LICENSE"
download_url "https://api.github.com/repos/bytedance/video-SALMONN-2" "$out/github-repository.json"

if [[ "${VIDEO_SALMONN2_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/video-SALMONN-2"
else
  echo "Skipping evaluation repo clone. Set VIDEO_SALMONN2_CLONE_REPO=1 to clone/update it."
fi

if [[ "${VIDEO_SALMONN2_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "$hf_repo" "$out/huggingface"
else
  cat <<'EOF'
Downloaded official documentation, evaluator, and lightweight annotations.

Set VIDEO_SALMONN2_DOWNLOAD_HF=1 to fetch the public, ungated Hugging Face
snapshot (approximately 1.70 GB). The card labels the release Apache-2.0, but
the source-video, audio, music, speech, likeness, and platform rights are not
documented separately and still require review.
EOF
fi

echo "video-SALMONN 2 Caption Benchmark metadata download complete: $out"
