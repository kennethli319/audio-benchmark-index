#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir cn_news_tts_bench)"
raw="${CN_NEWS_TTS_BENCH_RAW_URL:-https://raw.githubusercontent.com/Jayden-X-L/cn-news-tts-bench/main}"
zenodo_api="${CN_NEWS_TTS_BENCH_ZENODO_API:-https://zenodo.org/api/records/20822327}"
zenodo_files="${CN_NEWS_TTS_BENCH_ZENODO_FILES:-https://zenodo.org/api/records/20822327/files}"

download_url "$raw/README.en.md" "$out/README.en.md"
download_url "$raw/LICENSE" "$out/LICENSE"
download_url "$raw/LICENSE-DATA.md" "$out/LICENSE-DATA.md"
download_url "$raw/data/dev.jsonl" "$out/dev.jsonl"
download_url "$raw/data/test_public.jsonl" "$out/test_public.jsonl"
download_url "$raw/data/schema.json" "$out/schema.json"
download_url "$raw/scripts/score_submission.py" "$out/score_submission.py"
download_url "$raw/release/v0.1_core_checksums.sha256" "$out/v0.1_core_checksums.sha256"
download_url "$zenodo_api" "$out/zenodo-record.json"

if [[ "${CN_NEWS_TTS_BENCH_DOWNLOAD_CORE:-0}" == "1" ]]; then
  download_url \
    "$zenodo_files/cn-news-tts-bench-v0.1-core.zip/content" \
    "$out/cn-news-tts-bench-v0.1-core.zip"
fi

if [[ "${CN_NEWS_TTS_BENCH_DOWNLOAD_TRANSCRIPTS:-0}" == "1" ]]; then
  download_url \
    "$zenodo_files/cn-news-tts-bench-v0.1-asr-transcripts-full.zip/content" \
    "$out/cn-news-tts-bench-v0.1-asr-transcripts-full.zip"
fi

if [[ "${CN_NEWS_TTS_BENCH_DOWNLOAD_AUDIO:-0}" == "1" ]]; then
  if [[ "${CN_NEWS_TTS_BENCH_ACK_PROVIDER_TERMS:-0}" != "1" ]]; then
    cat >&2 <<'EOF'
CN-NewsTTS Bench audio download was not started.

The roughly 2.17 GB Zenodo audio release contains generated outputs from seven
commercial TTS providers. The maintainers warn that reuse may remain subject
to provider/API terms. Review those terms, then set
CN_NEWS_TTS_BENCH_ACK_PROVIDER_TERMS=1 together with
CN_NEWS_TTS_BENCH_DOWNLOAD_AUDIO=1.
EOF
    exit 2
  fi
  download_url \
    "$zenodo_files/cn-news-tts-bench-v0.1-audio-dev-wav24k-mono.zip/content" \
    "$out/cn-news-tts-bench-v0.1-audio-dev-wav24k-mono.zip"
  download_url \
    "$zenodo_files/cn-news-tts-bench-v0.1-audio-public-test-wav24k-mono.zip/content" \
    "$out/cn-news-tts-bench-v0.1-audio-public-test-wav24k-mono.zip"
fi

cat <<'EOF'
CN-NewsTTS Bench metadata and lightweight benchmark files are ready.

Optional downloads:
  CN_NEWS_TTS_BENCH_DOWNLOAD_CORE=1
  CN_NEWS_TTS_BENCH_DOWNLOAD_TRANSCRIPTS=1
  CN_NEWS_TTS_BENCH_ACK_PROVIDER_TERMS=1 CN_NEWS_TTS_BENCH_DOWNLOAD_AUDIO=1
EOF

echo "CN-NewsTTS Bench download complete: $out"
