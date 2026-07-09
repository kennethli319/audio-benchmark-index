# Download Scripts

Each script downloads one benchmark into `data/raw/<benchmark-id>/` by default.
Override the root directory with `DATASET_DOWNLOAD_DIR=/path/to/data`.

These scripts do not mirror or re-license data. Read each upstream license
before downloading or using a dataset.

## Requirements

- `curl` for direct archives and raw files.
- Hugging Face Hub tooling for Hugging Face datasets. The scripts use
  `huggingface-cli download` when available, otherwise they fall back to the
  Python `huggingface_hub` package:

```bash
python3 -m pip install -U "huggingface_hub[cli]"
huggingface-cli login
```

- `git` for WenetSpeech, because its official downloader lives in its repo.

## CLI Supported

```bash
scripts/download/mmau.sh
scripts/download/mmar.sh
scripts/download/mmsu.sh
scripts/download/rul_muchomusic.sh
scripts/download/songformbench.sh
scripts/download/voicebench.sh
scripts/download/uro_bench_pro.sh
scripts/download/speechrole.sh
scripts/download/wildspeech_bench.sh
scripts/download/fleurs.sh
scripts/download/librispeech.sh
scripts/download/mir_1k_vocal.sh
scripts/download/esc_50.sh
scripts/download/audioset.sh
scripts/download/clotho.sh
```

## Manual Or Gated

These scripts are included as helpers, but they need an upstream password,
generated URL, or manual form step first:

```bash
COMMON_VOICE_DOWNLOAD_URL='https://...' scripts/download/common_voice.sh
WENETSPEECH_PASSWORD='...' scripts/download/wenetspeech.sh
KESPEECH_ARCHIVE_URL='https://...' scripts/download/kespeech.sh
OPEN_CPOP_ARCHIVE_URL='https://...' scripts/download/opencpop_test.sh
```

Without the required environment variables, they print the manual access steps
and exit with code `2`.

## Useful Options

```bash
# FLEURS defaults to en_us. Use another locale or all.
FLEURS_CONFIG=ja_jp scripts/download/fleurs.sh
FLEURS_CONFIG=all scripts/download/fleurs.sh

# LibriSpeech defaults to dev/test splits. Add large training splits explicitly.
LIBRISPEECH_PARTS="test-clean train-clean-100" scripts/download/librispeech.sh

# MMAU downloads both test-mini and test by default.
MMAU_TEST=0 scripts/download/mmau.sh

# RUL-MuchoMusic can also pull the upstream MuChoMusic CSV.
RUL_DOWNLOAD_UPSTREAM_MUCHOMUSIC=1 scripts/download/rul_muchomusic.sh

# SpeechRole downloads both eval and data by default.
SPEECHROLE_DATA=0 scripts/download/speechrole.sh

# MIR-1K defaults to the Figshare mirror because the MIR Lab archive currently 404s.
MIR1K_SOURCE=official scripts/download/mir_1k_vocal.sh

# ESC-50 defaults to the official GitHub archive.
ESC50_ARCHIVE_URL='https://...' scripts/download/esc_50.sh

# AudioSet downloads CSV metadata by default. Features are about 2.4 GiB.
AUDIOSET_DOWNLOAD_FEATURES=1 AUDIOSET_REGION=us scripts/download/audioset.sh

# Clotho downloads captions/metadata by default. Audio archives are about 7.1 GiB.
CLOTHO_DOWNLOAD_AUDIO=1 scripts/download/clotho.sh
```
