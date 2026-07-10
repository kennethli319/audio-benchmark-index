#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir asvspoof_2021)"
asvspoof_base="${ASVSPOOF2021_ASVSPOOF_BASE_URL:-https://www.asvspoof.org}"
zenodo_api="${ASVSPOOF2021_ZENODO_API_BASE:-https://zenodo.org/api/records}"

download_url "$asvspoof_base/index2021.html" "$out/index2021.html"
download_url "$asvspoof_base/asvspoof2021/asvspoof2021_evaluation_plan.pdf" "$out/asvspoof2021_evaluation_plan.pdf"
download_url "$asvspoof_base/asvspoof2021/LA-keys-full.tar.gz" "$out/LA-keys-full.tar.gz"
download_url "$asvspoof_base/asvspoof2021/PA-keys-full.tar.gz" "$out/PA-keys-full.tar.gz"
download_url "$asvspoof_base/asvspoof2021/DF-keys-full.tar.gz" "$out/DF-keys-full.tar.gz"
download_url "$asvspoof_base/asvspoof2019/ASVspoof2019_2021_VCTK_VCC_MetaInfo.tar.gz" "$out/ASVspoof2019_2021_VCTK_VCC_MetaInfo.tar.gz"

download_url "$zenodo_api/4837263" "$out/zenodo_4837263_LA.json"
download_url "$zenodo_api/4834716" "$out/zenodo_4834716_PA.json"
download_url "$zenodo_api/4835108" "$out/zenodo_4835108_DF.json"

download_archive() {
  local url="$1"
  local filename="$2"
  download_url "$url" "$out/$filename"
}

download_la() {
  download_archive "$zenodo_api/4837263/files/ASVspoof2021_LA_eval.tar.gz/content" "ASVspoof2021_LA_eval.tar.gz"
}

download_pa() {
  local part
  for part in ${ASVSPOOF2021_PA_PARTS:-00}; do
    download_archive "$zenodo_api/4834716/files/ASVspoof2021_PA_eval_part${part}.tar.gz/content" "ASVspoof2021_PA_eval_part${part}.tar.gz"
  done
}

download_df() {
  local part
  for part in ${ASVSPOOF2021_DF_PARTS:-00}; do
    download_archive "$zenodo_api/4835108/files/ASVspoof2021_DF_eval_part${part}.tar.gz/content" "ASVspoof2021_DF_eval_part${part}.tar.gz"
  done
}

if [[ "${ASVSPOOF2021_DOWNLOAD_ARCHIVES:-0}" != "1" ]]; then
  cat <<'MSG'
Downloaded ASVspoof 2021 evaluation plan, keys/metadata, file-map metadata,
and Zenodo record metadata only. Evaluation speech archives are large:
LA is about 7.8 GB, PA totals about 47 GB, and DF totals about 34.5 GB.

Set ASVSPOOF2021_DOWNLOAD_ARCHIVES=1 and ASVSPOOF2021_PARTS to fetch selected
archives, for example:
  ASVSPOOF2021_DOWNLOAD_ARCHIVES=1 ASVSPOOF2021_PARTS=LA scripts/download/asvspoof_2021.sh
  ASVSPOOF2021_DOWNLOAD_ARCHIVES=1 ASVSPOOF2021_PARTS="PA DF" ASVSPOOF2021_PA_PARTS="00 01" ASVSPOOF2021_DF_PARTS="00" scripts/download/asvspoof_2021.sh
MSG
  exit 0
fi

for part in ${ASVSPOOF2021_PARTS:-LA}; do
  case "$part" in
    LA) download_la ;;
    PA) download_pa ;;
    DF) download_df ;;
    *)
      echo "Unknown ASVspoof 2021 part: $part" >&2
      echo "Expected one or more of: LA PA DF" >&2
      exit 2
      ;;
  esac
done

echo "ASVspoof 2021 requested downloads complete: $out"
