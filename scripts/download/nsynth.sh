#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir nsynth)"
homepage="${NSYNTH_HOMEPAGE:-https://magenta.withgoogle.com/datasets/nsynth}"
base_url="${NSYNTH_BASE_URL:-https://storage.googleapis.com/download.magenta.tensorflow.org/datasets/nsynth}"
splits="${NSYNTH_SPLITS:-test}"
format="${NSYNTH_FORMAT:-jsonwav}"

download_url "$homepage" "$out/nsynth.html"

if [[ "${NSYNTH_DOWNLOAD_ARCHIVES:-0}" != "1" ]]; then
  echo "Downloaded NSynth dataset page to: $out/nsynth.html"
  echo "Skipping archives. Set NSYNTH_DOWNLOAD_ARCHIVES=1 to download selected splits."
  echo "Options: NSYNTH_SPLITS=\"test valid train\" NSYNTH_FORMAT=jsonwav|tfrecord"
  exit 0
fi

case "$format" in
  jsonwav)
    suffix="jsonwav.tar.gz"
    ;;
  tfrecord)
    suffix="tfrecord"
    ;;
  *)
    echo "Unsupported NSYNTH_FORMAT: $format" >&2
    echo "Use NSYNTH_FORMAT=jsonwav or NSYNTH_FORMAT=tfrecord." >&2
    exit 2
    ;;
esac

for split in $splits; do
  case "$split" in
    train|valid|test)
      ;;
    *)
      echo "Unsupported NSYNTH split: $split" >&2
      echo "Use NSYNTH_SPLITS with any of: train valid test." >&2
      exit 2
      ;;
  esac

  filename="nsynth-$split.$suffix"
  download_url "$base_url/$filename" "$out/$filename"
done

echo "NSynth download complete: $out"
