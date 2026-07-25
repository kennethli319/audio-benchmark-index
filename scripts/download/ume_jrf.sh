#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir ume_jrf)"

download_url "https://doi.org/10.32130/src.UME-JRF" "$out/official-record.html"
download_url "https://export.arxiv.org/api/query?id_list=2607.13721" "$out/recent-evaluation.atom"
download_url "https://arxiv.org/abs/2607.13721" "$out/recent-evaluation.html"

manual_required \
  "UME-JRF learner-speech corpus" \
  "Review the saved NII/SRC official record in $out." \
  "Submit the required usage pledge through the official NII/SRC process and wait for review." \
  "The public record permits research use only; this helper does not submit an application, accept terms, or download recordings."
