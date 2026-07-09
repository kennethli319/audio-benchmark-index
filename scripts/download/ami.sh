#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=../lib/common.sh
source "$SCRIPT_DIR/../lib/common.sh"

OUT_DIR="$(dataset_dir ami)"

AMI_MANUAL_ANNOTATIONS_URL="${AMI_MANUAL_ANNOTATIONS_URL:-https://groups.inf.ed.ac.uk/ami/AMICorpusAnnotations/ami_public_manual_1.6.2.zip}"
AMI_AUTO_ANNOTATIONS_URL="${AMI_AUTO_ANNOTATIONS_URL:-https://groups.inf.ed.ac.uk/ami/AMICorpusAnnotations/ami_public_auto_1.5.1.zip}"
AMI_DOWNLOAD_OPENSLR_AUDIO="${AMI_DOWNLOAD_OPENSLR_AUDIO:-0}"
AMI_OPENSLR_MIRROR="${AMI_OPENSLR_MIRROR:-https://openslr.trmal.net/resources/16}"
AMI_OPENSLR_PARTS="${AMI_OPENSLR_PARTS:-headset.tar.gz}"
AMI_DOWNLOAD_HF="${AMI_DOWNLOAD_HF:-0}"
AMI_HF_INCLUDE="${AMI_HF_INCLUDE:-}"

download_url "$AMI_MANUAL_ANNOTATIONS_URL" "$OUT_DIR/ami_public_manual_1.6.2.zip"
download_url "$AMI_AUTO_ANNOTATIONS_URL" "$OUT_DIR/ami_public_auto_1.5.1.zip"

if [[ "$AMI_DOWNLOAD_OPENSLR_AUDIO" == "1" ]]; then
  for part in $AMI_OPENSLR_PARTS; do
    download_url "$AMI_OPENSLR_MIRROR/$part" "$OUT_DIR/$part"
  done
else
  cat <<'MSG'
Skipped AMI acoustic archives. They are large; set AMI_DOWNLOAD_OPENSLR_AUDIO=1
and AMI_OPENSLR_PARTS, for example:
  AMI_DOWNLOAD_OPENSLR_AUDIO=1 AMI_OPENSLR_PARTS="headset.tar.gz" scripts/download/ami.sh
MSG
fi

if [[ "$AMI_DOWNLOAD_HF" == "1" ]]; then
  if [[ -n "$AMI_HF_INCLUDE" ]]; then
    # shellcheck disable=SC2086
    hf_download_dataset edinburghcstr/ami "$OUT_DIR/hf" --include $AMI_HF_INCLUDE
  else
    hf_download_dataset edinburghcstr/ami "$OUT_DIR/hf"
  fi
else
  cat <<'MSG'
Skipped the Hugging Face converted AMI dataset. It is about 29 GiB; set
AMI_DOWNLOAD_HF=1 to download it, optionally with AMI_HF_INCLUDE patterns.
MSG
fi
