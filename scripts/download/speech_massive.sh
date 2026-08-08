#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir speech_massive)"
repo_url="${SPEECH_MASSIVE_REPO_URL:-https://github.com/hlt-mt/Speech-MASSIVE.git}"
main_hf_repo="${SPEECH_MASSIVE_MAIN_HF_REPO:-FBK-MT/Speech-MASSIVE}"
test_hf_repo="${SPEECH_MASSIVE_TEST_HF_REPO:-FBK-MT/Speech-MASSIVE-test}"
parts="${SPEECH_MASSIVE_PARTS:-main test}"

download_url "https://raw.githubusercontent.com/hlt-mt/Speech-MASSIVE/main/README.md" "$out/repository-README.md"
download_url "https://raw.githubusercontent.com/hlt-mt/Speech-MASSIVE/main/LICENSE" "$out/code-LICENSE"
download_url "https://huggingface.co/datasets/$main_hf_repo/raw/main/README.md" "$out/main-dataset-card.md"
download_url "https://huggingface.co/api/datasets/$main_hf_repo" "$out/main-huggingface-dataset.json"
download_url "https://huggingface.co/api/datasets/$test_hf_repo" "$out/test-huggingface-dataset.json"

if [[ "${SPEECH_MASSIVE_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/repo"
else
  echo "Skipping the evaluation-code clone. Set SPEECH_MASSIVE_CLONE_REPO=1 to clone/update it."
fi

if [[ "${SPEECH_MASSIVE_DOWNLOAD_HF:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded Speech-MASSIVE documentation, code license, and live Hub metadata.
The main snapshot uses about 23.7 GB of download storage and the test snapshot
uses about 35.8 GB of Hub storage. The test repository is auto-gated and may
require login and acceptance on Hugging Face. Set SPEECH_MASSIVE_DOWNLOAD_HF=1
to fetch selected snapshots, and use SPEECH_MASSIVE_PARTS="main" or "test" to
limit the download.
EOF
  echo "Speech-MASSIVE metadata download complete: $out"
  exit 0
fi

for part in $parts; do
  case "$part" in
    main)
      hf_download_dataset "$main_hf_repo" "$out/huggingface-main"
      ;;
    test)
      hf_download_dataset "$test_hf_repo" "$out/huggingface-test"
      ;;
    *)
      echo "Unsupported Speech-MASSIVE part: $part" >&2
      echo 'Use SPEECH_MASSIVE_PARTS with any of: main test.' >&2
      exit 2
      ;;
  esac
done

echo "Speech-MASSIVE requested download complete: $out"
