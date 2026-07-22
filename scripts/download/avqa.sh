#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir avqa)"
homepage_url="${AVQA_HOMEPAGE_URL:-https://mn.cs.tsinghua.edu.cn/avqa}"
raw_readme_url="${AVQA_README_URL:-https://raw.githubusercontent.com/AlyssaYoung/AVQA/main/README.md}"
repo_api_url="${AVQA_REPO_API_URL:-https://api.github.com/repos/AlyssaYoung/AVQA}"
onedrive_url="${AVQA_ONEDRIVE_URL:-https://tsinghuaeducn-my.sharepoint.com/:u:/g/personal/xin_wang_tsinghua_edu_cn/EQ_7OroeDPZFjajxJXsCh34BtYs-6GDdb-KFPfqgsu50cw?e=qeCgOO}"
baidu_url="${AVQA_BAIDU_URL:-https://pan.baidu.com/s/1nftHgOAGYSCF6j8MxCjPqA?pwd=awd7}"

download_url "$homepage_url" "$out/project.html"
download_url "$raw_readme_url" "$out/README.md"
download_url "$repo_api_url" "$out/github-repository.json"

manual_required \
  "AVQA" \
  "Saved the official project page, repository README, and GitHub metadata to $out." \
  "Use the official OneDrive release: $onedrive_url" \
  "The authors also provide Baidu Netdisk: $baidu_url" \
  "Review the project's noncommercial/permission language and VGGSound/YouTube source-media rights before use." \
  "This helper does not automate the combined archive, large extracted features, or source-video retrieval."
