#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir av_syncbench)"
dataset_url="${AV_SYNCBENCH_DATASET_URL:-https://modelscope.cn/datasets/coming245/AVSyncBench}"
dataset_api="${AV_SYNCBENCH_DATASET_API:-https://modelscope.cn/api/v1/datasets/coming245/AVSyncBench}"
tree_api="${AV_SYNCBENCH_TREE_API:-https://modelscope.cn/api/v1/datasets/coming245/AVSyncBench/repo/tree?Revision=master&Root=}"
repo_url="${AV_SYNCBENCH_REPO_URL:-https://github.com/fgt7t6g/AV-SyncBench.git}"
modelscope_git_url="${AV_SYNCBENCH_MODELSCOPE_GIT_URL:-https://www.modelscope.cn/datasets/coming245/AVSyncBench.git}"

download_url "https://arxiv.org/abs/2607.00726" "$out/paper.html"
download_url "https://fgt7t6g.github.io/AV-SyncBench/" "$out/project.html"
download_url "$dataset_api" "$out/modelscope-dataset.json"
download_url "$tree_api" "$out/modelscope-tree.json"
download_url "https://api.github.com/repos/fgt7t6g/AV-SyncBench" "$out/github-repo.json"
download_url "https://api.github.com/repos/fgt7t6g/AV-SyncBench/git/trees/main?recursive=1" "$out/github-tree.json"
download_url "https://huggingface.co/api/datasets/coming245/AV-SyncBench" "$out/huggingface-placeholder.json"

if [[ "${AV_SYNCBENCH_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/AV-SyncBench"
else
  echo "Skipping the placeholder repository clone. Set AV_SYNCBENCH_CLONE_REPO=1 to clone it."
fi

if [[ "${AV_SYNCBENCH_DOWNLOAD_DATA:-0}" == "1" ]]; then
  require_cmd git
  require_cmd git-lfs
  if [[ -d "$out/modelscope/.git" ]]; then
    git -C "$out/modelscope" pull --ff-only
    git -C "$out/modelscope" lfs pull
  else
    git clone "$modelscope_git_url" "$out/modelscope"
  fi
else
  cat <<EOF
AV-SyncBench metadata download complete.

The official ModelScope API reports approximately 68.2 GB in seven split
tar-gzip parts. To download it explicitly with Git LFS, run:

  AV_SYNCBENCH_DOWNLOAD_DATA=1 scripts/download/av_syncbench.sh

ModelScope declares MIT for the dataset repository, but source-video copyright
and public-platform terms remain separately applicable. Review the release at:
  $dataset_url
EOF
fi

