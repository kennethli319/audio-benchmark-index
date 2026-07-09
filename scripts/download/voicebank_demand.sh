#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir voicebank_demand)"
item_api="${VOICEBANK_DEMAND_ITEM_API:-https://datashare.ed.ac.uk/server/api/core/items/6ed35425-bf14-4d2b-93a1-0a4984952757}"
bitstreams_api="${VOICEBANK_DEMAND_BITSTREAMS_API:-https://datashare.ed.ac.uk/server/api/core/bundles/bdb21ae9-97ad-46dc-89b6-c1884783df6a/bitstreams?size=100}"
license_url="${VOICEBANK_DEMAND_LICENSE_URL:-https://datashare.ed.ac.uk/server/api/core/bitstreams/7e7bc32f-e94a-436a-8e97-416a972c7e1a/content}"

download_url "$item_api" "$out/datashare_item.json"
download_url "$bitstreams_api" "$out/datashare_bitstreams.json"
download_url "$license_url" "$out/license_text.txt"

base_url="${VOICEBANK_DEMAND_BITSTREAM_BASE_URL:-https://datashare.ed.ac.uk/server/api/core/bitstreams}"

download_part() {
  local part="$1"
  local uuid=""
  local filename=""

  case "$part" in
    clean_test)
      uuid="dec213d3-bf57-4777-9663-c24bdce92d5e"
      filename="clean_testset_wav.zip"
      ;;
    noisy_test)
      uuid="13c1bfbf-14a6-41db-9b41-8f7310f01ad5"
      filename="noisy_testset_wav.zip"
      ;;
    clean_train_28)
      uuid="245452b6-6235-44b6-a6f9-e7eb19797769"
      filename="clean_trainset_28spk_wav.zip"
      ;;
    noisy_train_28)
      uuid="ecb5a102-bb00-46d3-8af5-40c79823b837"
      filename="noisy_trainset_28spk_wav.zip"
      ;;
    clean_train_56)
      uuid="386ac199-5d34-402f-8112-2a123577dd57"
      filename="clean_trainset_56spk_wav.zip"
      ;;
    noisy_train_56)
      uuid="60506429-e89f-4ae5-a28f-da63238d11cb"
      filename="noisy_trainset_56spk_wav.zip"
      ;;
    logfiles)
      uuid="11185dc8-9cf1-405b-b858-35bd6a04aedd"
      filename="logfiles.zip"
      ;;
    test_txt)
      uuid="09e12592-879e-4749-bf6d-e34cf0d1ddf6"
      filename="testset_txt.zip"
      ;;
    train_txt_28)
      uuid="fb55b5de-c2db-4451-ac0a-134e98011ffa"
      filename="trainset_28spk_txt.zip"
      ;;
    train_txt_56)
      uuid="5dd7f013-dfde-45b0-a9ee-3818ca00951b"
      filename="trainset_56spk_txt.zip"
      ;;
    *)
      echo "Unknown VoiceBank-DEMAND part: $part" >&2
      echo "Known parts: clean_test noisy_test clean_train_28 noisy_train_28 clean_train_56 noisy_train_56 logfiles test_txt train_txt_28 train_txt_56" >&2
      exit 2
      ;;
  esac

  download_url "$base_url/$uuid/content" "$out/$filename"
}

if [[ "${VOICEBANK_DEMAND_DOWNLOAD_TEXT:-0}" == "1" ]]; then
  for part in ${VOICEBANK_DEMAND_TEXT_PARTS:-logfiles test_txt train_txt_28 train_txt_56}; do
    download_part "$part"
  done
fi

if [[ "${VOICEBANK_DEMAND_DOWNLOAD_AUDIO:-0}" != "1" ]]; then
  echo "Downloaded VoiceBank-DEMAND metadata and license to: $out"
  echo "Skipping audio archives. Set VOICEBANK_DEMAND_DOWNLOAD_AUDIO=1 to download selected archives."
  echo "Example: VOICEBANK_DEMAND_DOWNLOAD_AUDIO=1 VOICEBANK_DEMAND_PARTS=\"clean_test noisy_test\" $0"
  exit 0
fi

parts="${VOICEBANK_DEMAND_PARTS:-clean_test noisy_test}"
if [[ "$parts" == "all" ]]; then
  parts="clean_test noisy_test clean_train_28 noisy_train_28 clean_train_56 noisy_train_56"
fi

for part in $parts; do
  download_part "$part"
done

echo "VoiceBank-DEMAND requested downloads complete: $out"
