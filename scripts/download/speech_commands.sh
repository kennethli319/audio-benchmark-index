#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

version="${SPEECH_COMMANDS_VERSION:-v0.02}"
out="$(dataset_dir speech_commands)"

case "$version" in
  v0.02)
    url="https://storage.googleapis.com/download.tensorflow.org/data/speech_commands_v0.02.tar.gz"
    archive="speech_commands_v0.02.tar.gz"
    ;;
  v0.01)
    url="https://storage.googleapis.com/download.tensorflow.org/data/speech_commands_v0.01.tar.gz"
    archive="speech_commands_v0.01.tar.gz"
    ;;
  *)
    echo "Unsupported SPEECH_COMMANDS_VERSION: $version" >&2
    echo "Use v0.02 or v0.01." >&2
    exit 2
    ;;
esac

echo "Downloading Speech Commands $version direct archive."
echo "This is a large download; v0.02 is about 2.37 GiB compressed."
download_url "$url" "$out/$archive"

echo "Speech Commands download complete: $out/$archive"
