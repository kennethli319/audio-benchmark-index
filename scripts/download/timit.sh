#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

dataset_dir timit >/dev/null

manual_required \
  "TIMIT" \
  "TIMIT is distributed by LDC after login/licensing and cannot be fetched by a public CLI URL." \
  "LDC catalog: https://catalog.ldc.upenn.edu/LDC93S1" \
  "MS-WAV version: https://catalog.ldc.upenn.edu/LDC93S1W" \
  "NIST documentation: https://nvlpubs.nist.gov/nistpubs/Legacy/IR/nistir4930.pdf" \
  "After access is granted, use the LDC web download flow and do not commit downloaded data."
