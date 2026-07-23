#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir lyra_sa)"

download_url \
  "https://lyracobar.y.qq.com/singvoicedataset_en.html" \
  "$out/official-dataset-page-en.html"
download_url \
  "https://lyracobar.y.qq.com/singvoicedataset.html" \
  "$out/official-dataset-page-zh.html"
download_url \
  "https://arxiv.org/abs/2607.16599" \
  "$out/song-sqa-paper.html"

manual_required \
  "Lyra-SA" \
  "Complete the official Tencent Music Lyra Lab application form:" \
  "  https://wj.qq.com/s2/11839505/8cf1/" \
  "The official page says an approved download link is emailed within three days." \
  "Review the form terms and CC BY-NC 4.0 notice before using the data."
