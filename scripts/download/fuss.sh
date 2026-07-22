#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir fuss)"
raw_base="${FUSS_RAW_BASE:-https://raw.githubusercontent.com/google-research/sound-separation/master/datasets/fuss}"
zenodo_api="${FUSS_ZENODO_API:-https://zenodo.org/api/records/3694384}"

download_url "$raw_base/README.md" "$out/README.md"
download_url "$raw_base/FUSS_license_doc/README.md" "$out/LICENSE_README.md"
download_url "$zenodo_api" "$out/zenodo-record.json"
download_url "$zenodo_api/files/FUSS_license_doc.tar.gz/content" "$out/FUSS_license_doc.tar.gz"

if [[ "${FUSS_DOWNLOAD_ARCHIVES:-0}" != "1" ]]; then
  echo "FUSS documentation and license archive saved to: $out"
  echo 'Large data archives skipped. Set FUSS_DOWNLOAD_ARCHIVES=1 and select FUSS_PARTS.'
  exit 0
fi

parts="${FUSS_PARTS:-}"
if [[ -z "$parts" ]]; then
  echo 'FUSS_PARTS is required. Choose from: ssdata_reverb ssdata rir_data fsd_data baseline_model' >&2
  exit 2
fi

for part in $parts; do
  case "$part" in
    ssdata_reverb|ssdata|rir_data|fsd_data|baseline_model) ;;
    *)
      echo "Unknown FUSS part: $part" >&2
      echo 'Choose from: ssdata_reverb ssdata rir_data fsd_data baseline_model' >&2
      exit 2
      ;;
  esac
  archive="FUSS_${part}.tar.gz"
  download_url "$zenodo_api/files/$archive/content" "$out/$archive"
done

echo "Selected FUSS archives saved to: $out"
