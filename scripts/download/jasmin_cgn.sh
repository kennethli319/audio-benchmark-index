#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

dataset_dir jasmin_cgn >/dev/null

manual_required \
  "JASMIN-CGN" \
  "The Dutch Language Institute requires account login and a signed license; the corpus has no public CLI download URL." \
  "Official product page: https://taalmaterialen.ivdnt.org/download/tstc-jasmin-spraakcorpus/" \
  "Create an account, download and sign the supplied non-commercial license, and follow the official ordering instructions." \
  "Commercial use has a separate product and agreement linked from the official page." \
  "Do not commit downloaded speech, annotations, credentials, or signed agreements."
