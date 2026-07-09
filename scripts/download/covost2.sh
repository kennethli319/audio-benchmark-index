#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir covost2)"
base_url="${COVOST2_BASE_URL:-https://dl.fbaipublicfiles.com/covost}"
directions="${COVOST2_DIRECTIONS:-en_de fr_en}"

all_directions=(
  fr_en de_en es_en ca_en it_en ru_en zh-CN_en pt_en fa_en et_en mn_en
  nl_en tr_en ar_en sv-SE_en lv_en sl_en ta_en ja_en id_en cy_en
  en_de en_ca en_zh-CN en_fa en_et en_mn en_tr en_ar en_sv-SE en_lv
  en_sl en_ta en_ja en_id en_cy
)

download_url \
  "https://raw.githubusercontent.com/facebookresearch/covost/main/README.md" \
  "$out/README.md"
download_url \
  "https://raw.githubusercontent.com/facebookresearch/covost/main/get_covost_splits.py" \
  "$out/get_covost_splits.py"

if [[ "$directions" == "all" ]]; then
  directions="${all_directions[*]}"
fi

if [[ "$directions" == "none" ]]; then
  echo "Skipping CoVoST 2 translation TSV archives because COVOST2_DIRECTIONS=none."
else
  for direction in $directions; do
    archive="covost_v2.${direction}.tsv.tar.gz"
    download_url "$base_url/$archive" "$out/$archive"
  done
fi

cat <<EOF
CoVoST 2 metadata download complete: $out

Downloaded translation TSV archives only. CoVoST 2 must be paired with
Common Voice 4 clips/transcripts; obtain those separately from the current
Mozilla/Common Voice distribution and follow its active license terms.

Set COVOST2_DIRECTIONS=all to download every official CoVoST 2 translation
archive, or pass a space-separated list such as:
  COVOST2_DIRECTIONS="en_de fr_en de_en" scripts/download/covost2.sh
EOF
