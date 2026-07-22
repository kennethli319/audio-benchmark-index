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

- `git` for WenetSpeech, LibriMix, and other helpers that use official repos.

## CLI Supported

```bash
scripts/download/mmau.sh
scripts/download/mmar.sh
scripts/download/mmsu.sh
scripts/download/air_bench.sh
scripts/download/music_avqa.sh
scripts/download/daily_omni.sh
scripts/download/worldsense.sh
scripts/download/av_speakerbench.sh
scripts/download/avut.sh
scripts/download/omnigaia.sh
scripts/download/video_mme.sh
scripts/download/superb.sh
scripts/download/slurp.sh
scripts/download/slue.sh
scripts/download/minds14.sh
scripts/download/hear.sh
scripts/download/dynamic_superb.sh
scripts/download/rul_muchomusic.sh
scripts/download/songformbench.sh
scripts/download/voicebench.sh
scripts/download/uro_bench_pro.sh
scripts/download/speechrole.sh
scripts/download/wildspeech_bench.sh
scripts/download/fleurs.sh
scripts/download/librispeech.sh
scripts/download/libri_light.sh
scripts/download/mls.sh
scripts/download/mtedx.sh
scripts/download/europarl_st.sh
scripts/download/tedx_spanish.sh
scripts/download/seed_tts_eval.sh
scripts/download/instruct_tts_eval.sh
scripts/download/tts_multilingual_test_set.sh
scripts/download/libritts.sh
scripts/download/ljspeech.sh
scripts/download/aishell_1.sh
scripts/download/aishell_3.sh
scripts/download/hifitts.sh
scripts/download/magicdata_mandarin.sh
scripts/download/st_cmds.sh
scripts/download/thchs_30.sh
scripts/download/primewords_chinese.sh
scripts/download/pansori_tedxkr.sh
scripts/download/golos.sh
scripts/download/voxpopuli.sh
scripts/download/covost2.sh
scripts/download/earnings_22.sh
scripts/download/mir_1k_vocal.sh
scripts/download/esc_50.sh
scripts/download/spuraudio.sh
scripts/download/urbansound8k.sh
scripts/download/tau_asc_2019.sh
scripts/download/tau_asc_2020_mobile.sh
scripts/download/audioset.sh
scripts/download/vggsound.sh
scripts/download/ave.sh
scripts/download/starss23.sh
scripts/download/epic_sounds.sh
scripts/download/fsd50k.sh
scripts/download/fsdkaggle2018.sh
scripts/download/fsdkaggle2019.sh
scripts/download/desed.sh
scripts/download/realdesed.sh
scripts/download/sonyc_ust_v2.sh
scripts/download/voxceleb.sh
scripts/download/hi_mia.sh
scripts/download/voxconverse.sh
scripts/download/asvspoof_2019.sh
scripts/download/asvspoof_2021.sh
scripts/download/voxlingua107.sh
scripts/download/speech_commands.sh
scripts/download/mswc.sh
scripts/download/audio_mnist.sh
scripts/download/parapair_audio_bench.sh
scripts/download/ming_freeform_audio_edit.sh
scripts/download/vocalsound.sh
scripts/download/vocalset.sh
scripts/download/emov_db.sh
scripts/download/ravdess.sh
scripts/download/crema_d.sh
scripts/download/meld.sh
scripts/download/musan.sh
scripts/download/ami.sh
scripts/download/chime_6.sh
scripts/download/alimeeting.sh
scripts/download/clotho.sh
scripts/download/audiocaps.sh
scripts/download/musiccaps.sh
scripts/download/wavcaps.sh
scripts/download/macs.sh
scripts/download/magnatagatune.sh
scripts/download/mtg_jamendo.sh
scripts/download/fma.sh
scripts/download/gtzan.sh
scripts/download/openmic_2018.sh
scripts/download/musicnet.sh
scripts/download/nsynth.sh
scripts/download/maestro.sh
scripts/download/musdb18.sh
scripts/download/medleydb.sh
scripts/download/slakh2100.sh
scripts/download/librimix.sh
scripts/download/wsj0_2mix.sh
scripts/download/wham_whamr.sh
scripts/download/voicebank_demand.sh
scripts/download/dns_challenge.sh
scripts/download/ms_snsd.sh
scripts/download/nisqa.sh
scripts/download/vctk.sh
```

## Manual Or Gated

These scripts are included as helpers, but they need an upstream password,
generated URL, or manual form step first:

```bash
COMMON_VOICE_DOWNLOAD_URL='https://...' scripts/download/common_voice.sh
GIGASPEECH_ACK_ACCESS=1 GIGASPEECH_CONFIG=dev scripts/download/gigaspeech.sh
SPGISPEECH_ACK_TERMS=1 SPGISPEECH_CONFIG=dev scripts/download/spgispeech.sh
scripts/download/fluent_speech_commands.sh
WENETSPEECH_PASSWORD='...' scripts/download/wenetspeech.sh
KESPEECH_ARCHIVE_URL='https://...' scripts/download/kespeech.sh
OPEN_CPOP_ARCHIVE_URL='https://...' scripts/download/opencpop_test.sh
scripts/download/iemocap.sh
scripts/download/timit.sh
scripts/download/switchboard.sh
scripts/download/fisher_english.sh
scripts/download/dihard_iii.sh
scripts/download/l2_arctic.sh
scripts/download/qivd.sh
IFEVAL_AUDIO_DOWNLOAD_HF=1 scripts/download/ifeval_audio.sh
```

Without the required environment variables, they print the manual access steps
and exit with code `2`.

## Useful Options

```bash
# FLEURS defaults to en_us. Use another locale or all.
FLEURS_CONFIG=ja_jp scripts/download/fleurs.sh
FLEURS_CONFIG=all scripts/download/fleurs.sh

# LibriSpeech downloads official metadata/checksums by default. Archives are opt-in.
LIBRISPEECH_DOWNLOAD_ARCHIVES=1 LIBRISPEECH_PARTS="test-clean" scripts/download/librispeech.sh

# Libri-Light downloads official docs by default. Finetuning, ABX, and unlabeled archives are opt-in.
LIBRI_LIGHT_DOWNLOAD_FINETUNE=1 scripts/download/libri_light.sh
LIBRI_LIGHT_DOWNLOAD_ABX=1 scripts/download/libri_light.sh
LIBRI_LIGHT_DOWNLOAD_UNLABELED=1 LIBRI_LIGHT_PARTS=small scripts/download/libri_light.sh

# MLS downloads the OpenSLR page and checksums by default. Language archives are large and opt-in.
MLS_DOWNLOAD_ARCHIVES=1 MLS_LANGS=polish MLS_FORMAT=opus scripts/download/mls.sh
MLS_DOWNLOAD_ARCHIVES=1 MLS_LANGS="italian portuguese" MLS_FORMAT=opus scripts/download/mls.sh

# InstructTTSEval downloads official docs by default. The ~1.8 GB HF audio snapshot is opt-in.
INSTRUCT_TTS_EVAL_DOWNLOAD_HF=1 scripts/download/instruct_tts_eval.sh
INSTRUCT_TTS_EVAL_CLONE_REPO=1 scripts/download/instruct_tts_eval.sh

# ParaPairAudioBench downloads official docs by default. Cloning adds pair annotations/builders, not source audio.
PARAPAIR_AUDIO_BENCH_CLONE_REPO=1 scripts/download/parapair_audio_bench.sh

# IFEval-Audio downloads official docs/metadata by default. Accept the gated HF terms before opting in.
IFEVAL_AUDIO_DOWNLOAD_HF=1 scripts/download/ifeval_audio.sh

# SpurAudio downloads official docs/metadata by default; the approximately 7.69 GB snapshot is opt-in.
SPURAUDIO_DOWNLOAD_HF=1 scripts/download/spuraudio.sh
SPURAUDIO_CLONE_REPO=1 scripts/download/spuraudio.sh

# RealDESED downloads official docs/metadata by default; the approximately 8.74 GB archives are opt-in.
REALDESED_DOWNLOAD_AUDIO=1 REALDESED_PARTS="validation test" scripts/download/realdesed.sh
REALDESED_DOWNLOAD_AUDIO=1 REALDESED_PARTS=all scripts/download/realdesed.sh

# Ming-Freeform-Audio-Edit downloads official docs by default; the ~1.07 GB HF snapshot is opt-in.
MING_FREEFORM_AUDIO_EDIT_DOWNLOAD_HF=1 scripts/download/ming_freeform_audio_edit.sh
MING_FREEFORM_AUDIO_EDIT_CLONE_REPO=1 scripts/download/ming_freeform_audio_edit.sh

# CV3-Eval downloads official docs by default. Its roughly 760 MiB repo with audio is opt-in.
CV3_EVAL_CLONE_REPO=1 scripts/download/cv3_eval.sh

# TTS Multilingual Test Set downloads its official card by default; the ~7.3 MB snapshot is opt-in.
TTS_MULTILINGUAL_TEST_SET_DOWNLOAD_HF=1 scripts/download/tts_multilingual_test_set.sh

# AV-SpeakerBench downloads official docs by default; the approximately 123 GB HF snapshot is opt-in.
AV_SPEAKERBENCH_DOWNLOAD_HF=1 scripts/download/av_speakerbench.sh
AV_SPEAKERBENCH_CLONE_REPO=1 scripts/download/av_speakerbench.sh

# AVUT downloads docs and annotation JSON by default; its approximately 24.0 GB HF snapshot is opt-in.
AVUT_DOWNLOAD_HF=1 scripts/download/avut.sh

# Daily-Omni downloads docs and QA metadata by default; its approximately 3.9 GB media snapshot is opt-in.
DAILY_OMNI_DOWNLOAD_HF=1 scripts/download/daily_omni.sh
DAILY_OMNI_CLONE_REPO=1 scripts/download/daily_omni.sh

# WorldSense downloads docs and QA metadata by default; its approximately 18.1 GB archive snapshot is opt-in.
WORLDSENSE_DOWNLOAD_HF=1 scripts/download/worldsense.sh
WORLDSENSE_CLONE_REPO=1 scripts/download/worldsense.sh

# OmniGAIA downloads docs and test metadata by default; the approximately 9.9 GB media snapshot is opt-in.
OMNIGAIA_DOWNLOAD_HF=1 scripts/download/omnigaia.sh
OMNIGAIA_CLONE_REPO=1 scripts/download/omnigaia.sh

# Omni-Cloze downloads docs/evaluation scripts by default. Metadata and the multi-GB snapshot are separate opt-ins.
OMNI_CLOZE_DOWNLOAD_METADATA=1 scripts/download/omni_cloze.sh
OMNI_CLOZE_DOWNLOAD_HF=1 scripts/download/omni_cloze.sh

# Video-MME downloads docs by default. Its approximately 389 GB snapshot requires acknowledgment and opt-in.
VIDEO_MME_ACK_TERMS=1 VIDEO_MME_DOWNLOAD_HF=1 scripts/download/video_mme.sh
VIDEO_MME_CLONE_REPO=1 scripts/download/video_mme.sh

# LibriTTS saves the OpenSLR page by default. Archives are large and opt-in.
LIBRITTS_DOWNLOAD_ARCHIVES=1 LIBRITTS_PARTS="dev-clean test-clean" scripts/download/libritts.sh
LIBRITTS_OPENSLR_BASE_URL=https://openslr.elda.org/resources/60 LIBRITTS_DOWNLOAD_ARCHIVES=1 scripts/download/libritts.sh

# LJSpeech saves the dataset page by default. The 2.6 GiB archive is opt-in.
LJSPEECH_DOWNLOAD_ARCHIVE=1 scripts/download/ljspeech.sh
LJSPEECH_ARCHIVE_URL=https://data.keithito.com/data/speech/LJSpeech-1.1.tar.bz2 scripts/download/ljspeech.sh

# AISHELL-3 saves the OpenSLR page by default. The 19 GiB archive is opt-in.
AISHELL3_DOWNLOAD_ARCHIVE=1 scripts/download/aishell_3.sh
AISHELL3_OPENSLR_BASE_URL=https://openslr.elda.org/resources/93 AISHELL3_DOWNLOAD_ARCHIVE=1 scripts/download/aishell_3.sh

# Hi-Fi TTS saves the OpenSLR page by default. The 39-41 GiB archive is opt-in.
HIFITTS_DOWNLOAD_ARCHIVE=1 scripts/download/hifitts.sh
HIFITTS_OPENSLR_BASE_URL=https://openslr.elda.org/resources/109 HIFITTS_DOWNLOAD_ARCHIVE=1 scripts/download/hifitts.sh

# AISHELL-1 downloads OpenSLR metadata/resources by default. The 15 GiB corpus is opt-in.
AISHELL1_DOWNLOAD_ARCHIVE=1 scripts/download/aishell_1.sh
AISHELL1_OPENSLR_BASE_URL=https://openslr.elda.org/resources/33 AISHELL1_DOWNLOAD_ARCHIVE=1 scripts/download/aishell_1.sh

# MAGICDATA downloads the OpenSLR page and metadata by default. The speech archives are large and opt-in.
MAGICDATA_DOWNLOAD_ARCHIVES=1 MAGICDATA_PARTS="dev test" scripts/download/magicdata_mandarin.sh
MAGICDATA_OPENSLR_BASE_URL=https://openslr.elda.org/resources/68 MAGICDATA_DOWNLOAD_ARCHIVES=1 scripts/download/magicdata_mandarin.sh

# ST-CMDS saves the OpenSLR page by default. The 8.2 GiB archive is opt-in.
ST_CMDS_DOWNLOAD_ARCHIVE=1 scripts/download/st_cmds.sh
ST_CMDS_OPENSLR_BASE_URL=https://openslr.elda.org/resources/38 ST_CMDS_DOWNLOAD_ARCHIVE=1 scripts/download/st_cmds.sh

# THCHS-30 saves the OpenSLR page by default. The data/noisy-test/resource archives are opt-in.
THCHS30_DOWNLOAD_PARTS=resource scripts/download/thchs_30.sh
THCHS30_DOWNLOAD_PARTS="data test_noise resource" scripts/download/thchs_30.sh
THCHS30_OPENSLR_BASE_URL=https://openslr.elda.org/resources/18 THCHS30_DOWNLOAD_PARTS=data scripts/download/thchs_30.sh

# Primewords Chinese saves the OpenSLR page by default. The 9.0 GiB archive is opt-in.
PRIMEWORDS_DOWNLOAD_ARCHIVE=1 scripts/download/primewords_chinese.sh
PRIMEWORDS_OPENSLR_BASE_URL=https://openslr.elda.org/resources/47 PRIMEWORDS_DOWNLOAD_ARCHIVE=1 scripts/download/primewords_chinese.sh

# Golos downloads OpenSLR/GitHub metadata, checksums, and license PDFs by default.
GOLOS_DOWNLOAD_OPUS=1 scripts/download/golos.sh
GOLOS_DOWNLOAD_MODEL=1 scripts/download/golos.sh
GOLOS_DOWNLOAD_LMS=1 scripts/download/golos.sh
GOLOS_OPENSLR_BASE_URL=https://openslr.elda.org/resources/114 GOLOS_DOWNLOAD_MODEL=1 scripts/download/golos.sh

# VoxPopuli defaults to the English test split. Use another config/split explicitly.
VOXPOPULI_CONFIG=en VOXPOPULI_SPLITS="test validation" scripts/download/voxpopuli.sh
VOXPOPULI_CONFIG=en_accented VOXPOPULI_SPLITS=test scripts/download/voxpopuli.sh

# CoVoST 2 downloads official translation TSV archives only; get Common Voice 4 audio separately.
COVOST2_DIRECTIONS="en_de fr_en" scripts/download/covost2.sh
COVOST2_DIRECTIONS=all scripts/download/covost2.sh
COVOST2_DIRECTIONS=none scripts/download/covost2.sh

# mTEDx downloads the OpenSLR page and small annotation CSV by default. Archives are large and opt-in.
MTEDX_DOWNLOAD_ARCHIVES=1 MTEDX_PARTS=mtedx_iwslt2021.tgz scripts/download/mtedx.sh
MTEDX_DOWNLOAD_ARCHIVES=1 MTEDX_PARTS="mtedx_es-en.tgz mtedx_fr-en.tgz" scripts/download/mtedx.sh
MTEDX_OPENSLR_BASE_URL=https://openslr.elda.org/resources/100 scripts/download/mtedx.sh

# Europarl-ST downloads the official page and README by default. The v1.1 archive is about 21 GB.
EUROPARL_ST_DOWNLOAD_ARCHIVE=1 scripts/download/europarl_st.sh
EUROPARL_ST_ARCHIVE_NAME=v1.0.tar.gz EUROPARL_ST_DOWNLOAD_ARCHIVE=1 scripts/download/europarl_st.sh

# TEDx Spanish saves the OpenSLR page by default. The 2.3 GiB archive is opt-in.
TEDX_SPANISH_DOWNLOAD_ARCHIVE=1 scripts/download/tedx_spanish.sh
TEDX_SPANISH_OPENSLR_BASE_URL=https://openslr.elda.org/resources/67 TEDX_SPANISH_DOWNLOAD_ARCHIVE=1 scripts/download/tedx_spanish.sh

# Pansori-TEDxKR downloads the OpenSLR page, info, about page, and checksum by default.
PANSORI_TEDXKR_DOWNLOAD_ARCHIVE=1 scripts/download/pansori_tedxkr.sh
PANSORI_TEDXKR_OPENSLR_BASE_URL=https://openslr.elda.org/resources/58 PANSORI_TEDXKR_DOWNLOAD_ARCHIVE=1 scripts/download/pansori_tedxkr.sh

# GigaSpeech is gated on Hugging Face and defaults to the dev config.
GIGASPEECH_ACK_ACCESS=1 GIGASPEECH_CONFIG=dev scripts/download/gigaspeech.sh
GIGASPEECH_ACK_ACCESS=1 GIGASPEECH_CONFIG=xs scripts/download/gigaspeech.sh

# SPGISpeech is gated on Hugging Face and defaults to the dev config.
SPGISPEECH_ACK_TERMS=1 SPGISPEECH_CONFIG=dev scripts/download/spgispeech.sh
SPGISPEECH_ACK_TERMS=1 SPGISPEECH_CONFIG=test scripts/download/spgispeech.sh

# Earnings-22 downloads README, license, and metadata by default. Sparse checkout and Git LFS media pull are opt-in.
EARNINGS22_SPARSE_CHECKOUT=1 scripts/download/earnings_22.sh
EARNINGS22_SPARSE_CHECKOUT=1 EARNINGS22_LFS_PULL=1 scripts/download/earnings_22.sh

# MMAU downloads both test-mini and test by default.
MMAU_TEST=0 scripts/download/mmau.sh

# AIR-Bench downloads official docs by default. The HF audio snapshot is large and opt-in.
AIR_BENCH_DOWNLOAD_HF=1 scripts/download/air_bench.sh
AIR_BENCH_CLONE_REPO=1 scripts/download/air_bench.sh

# MUSIC-AVQA downloads official docs and JSON annotations by default. Raw videos are manual/large.
MUSIC_AVQA_CLONE_REPO=1 scripts/download/music_avqa.sh

# HI-MIA downloads the OpenSLR page and filename mapping by default. Archives are large and opt-in.
HIMIA_DOWNLOAD_ARCHIVES=1 HIMIA_PARTS="dev test_v2" scripts/download/hi_mia.sh
HIMIA_OPENSLR_BASE_URL=https://openslr.elda.org/resources/85 HIMIA_DOWNLOAD_ARCHIVES=1 scripts/download/hi_mia.sh

# RUL-MuchoMusic can also pull the upstream MuChoMusic CSV.
RUL_DOWNLOAD_UPSTREAM_MUCHOMUSIC=1 scripts/download/rul_muchomusic.sh

# MusicNet downloads Zenodo metadata by default. MIDI and the large audio/label archive are opt-in.
MUSICNET_DOWNLOAD_MIDIS=1 scripts/download/musicnet.sh
MUSICNET_DOWNLOAD_AUDIO=1 scripts/download/musicnet.sh

# MedleyDB downloads official pages and repo docs by default. Zenodo checks, sample archive, and repo clone are opt-in; full audio is request gated.
MEDLEYDB_CHECK_ZENODO=1 scripts/download/medleydb.sh
MEDLEYDB_DOWNLOAD_SAMPLE=1 scripts/download/medleydb.sh
MEDLEYDB_CLONE_REPO=1 scripts/download/medleydb.sh

# SpeechRole downloads both eval and data by default.
SPEECHROLE_DATA=0 scripts/download/speechrole.sh

# SLURP clones the annotation/code repo and Zenodo license by default.
SLURP_DOWNLOAD_AUDIO=1 SLURP_AUDIO_PARTS=real scripts/download/slurp.sh
SLURP_DOWNLOAD_AUDIO=1 SLURP_AUDIO_PARTS="real synth" scripts/download/slurp.sh

# SLUE downloads official docs/licenses by default. Hugging Face snapshots are opt-in.
SLUE_DOWNLOAD_HF=1 scripts/download/slue.sh
SLUE_DOWNLOAD_HF=1 SLUE_DATASETS=slue-phase-2 scripts/download/slue.sh
SLUE_CLONE_TOOLKIT=1 scripts/download/slue.sh

# MInDS-14 saves the HF dataset card by default. Audio snapshots are opt-in.
MINDS14_DOWNLOAD_HF=1 MINDS14_CONFIG=en-US scripts/download/minds14.sh
MINDS14_DOWNLOAD_HF=1 MINDS14_CONFIG=all scripts/download/minds14.sh

# SUPERB downloads official S3PRL benchmark docs/license by default.
SUPERB_CLONE_TOOLKIT=1 scripts/download/superb.sh

# HEAR downloads Zenodo metadata/license and eval-kit docs by default. Task archives are large and opt-in.
HEAR_DOWNLOAD_TASKS=1 HEAR_TASKS=hear2021-mridangam_tonic-v1.5-full-48000.tar.gz scripts/download/hear.sh
HEAR_CLONE_EVAL_KIT=1 scripts/download/hear.sh

# Dynamic-SUPERB downloads official docs by default. Clone the repo with opt-in.
DYNAMIC_SUPERB_CLONE_REPO=1 scripts/download/dynamic_superb.sh

# MIR-1K defaults to the Figshare mirror because the MIR Lab archive currently 404s.
MIR1K_SOURCE=official scripts/download/mir_1k_vocal.sh

# ESC-50 defaults to the official GitHub archive.
ESC50_ARCHIVE_URL='https://...' scripts/download/esc_50.sh

# UrbanSound8K is a 6 GiB archive. The helper downloads it only when opted in.
URBANSOUND8K_DOWNLOAD_AUDIO=1 scripts/download/urbansound8k.sh
URBANSOUND8K_EXTRACT=1 URBANSOUND8K_DOWNLOAD_AUDIO=1 scripts/download/urbansound8k.sh

# TAU ASC 2019 downloads doc/meta ZIPs by default. Audio is split across 21 large shards.
TAU_ASC2019_DOWNLOAD_AUDIO=1 scripts/download/tau_asc_2019.sh
TAU_ASC2019_DOWNLOAD_AUDIO=1 TAU_ASC2019_AUDIO_PARTS="1 2 21" scripts/download/tau_asc_2019.sh

# TAU ASC 2020 Mobile downloads doc/meta ZIPs by default. Audio is split across large archives.
TAU_ASC2020_DOWNLOAD_DEV_AUDIO=1 scripts/download/tau_asc_2020_mobile.sh
TAU_ASC2020_DOWNLOAD_EVAL_AUDIO=1 scripts/download/tau_asc_2020_mobile.sh

# AudioSet downloads CSV metadata by default. Features are about 2.4 GiB.
AUDIOSET_DOWNLOAD_FEATURES=1 AUDIOSET_REGION=us scripts/download/audioset.sh

# VGGSound downloads official CSV metadata/license by default. Model files are opt-in.
VGGSOUND_DOWNLOAD_MODELS=1 scripts/download/vggsound.sh

# AVE downloads official docs by default. Dataset/features are Google Drive files.
AVE_CLONE_REPO=1 scripts/download/ave.sh

# EPIC-SOUNDS downloads official docs and public annotation CSVs by default.
EPIC_SOUNDS_CLONE_ANNOTATIONS=1 scripts/download/epic_sounds.sh

# FSD50K downloads docs, labels, and metadata by default. Audio is about 31 GiB.
FSD50K_DOWNLOAD_AUDIO=1 scripts/download/fsd50k.sh

# FSDKaggle2018 downloads Zenodo docs/metadata by default. Audio is about 4.6 GiB.
FSDKAGGLE2018_DOWNLOAD_AUDIO=1 scripts/download/fsdkaggle2018.sh

# FSDKaggle2019 downloads Zenodo docs/metadata by default. Audio is about 25 GiB.
FSDKAGGLE2019_DOWNLOAD_AUDIO=1 FSDKAGGLE2019_AUDIO_PARTS="curated test" scripts/download/fsdkaggle2019.sh
FSDKAGGLE2019_DOWNLOAD_AUDIO=1 FSDKAGGLE2019_AUDIO_PARTS=noisy scripts/download/fsdkaggle2019.sh

# DESED clones the official repo and downloads small metadata/JAMS by default. Audio is opt-in.
DESED_DOWNLOAD_REAL_AUDIO=1 scripts/download/desed.sh
DESED_DOWNLOAD_SYNTHETIC_AUDIO=1 DESED_SYNTHETIC_PARTS="DESED_synth_eval_dcase2019.tar.gz" scripts/download/desed.sh

# SONYC-UST-V2 downloads annotations/taxonomy by default. Audio is split into 19 large shards.
SONYC_UST_V2_DOWNLOAD_AUDIO=1 SONYC_UST_V2_AUDIO_PARTS="audio-0.tar.gz audio-18.tar.gz" scripts/download/sonyc_ust_v2.sh
SONYC_UST_V2_DOWNLOAD_AUDIO=1 SONYC_UST_V2_AUDIO_PARTS=all scripts/download/sonyc_ust_v2.sh

# VoxCeleb downloads small OpenSLR metadata/trial lists only.
VOXCELEB_OPENSLR_BASE_URL=https://openslr.elda.org/resources/49 scripts/download/voxceleb.sh

# VoxConverse clones official RTTM annotations by default. WAV ZIPs are large and opt-in.
VOXCONVERSE_DOWNLOAD_AUDIO=1 VOXCONVERSE_AUDIO_SPLITS=dev scripts/download/voxconverse.sh
VOXCONVERSE_DOWNLOAD_AUDIO=1 VOXCONVERSE_AUDIO_SPLITS="dev test" scripts/download/voxconverse.sh

# ASVspoof 2019 downloads README/license/evaluation docs by default. LA/PA are large and opt-in.
ASVSPOOF2019_DOWNLOAD_ARCHIVES=1 ASVSPOOF2019_PARTS=LA scripts/download/asvspoof_2019.sh
ASVSPOOF2019_DOWNLOAD_ARCHIVES=1 ASVSPOOF2019_PARTS="LA PA" scripts/download/asvspoof_2019.sh

# ASVspoof 2021 downloads evaluation plan and keys/metadata by default. LA/PA/DF speech archives are large and opt-in.
ASVSPOOF2021_DOWNLOAD_ARCHIVES=1 ASVSPOOF2021_PARTS=LA scripts/download/asvspoof_2021.sh
ASVSPOOF2021_DOWNLOAD_ARCHIVES=1 ASVSPOOF2021_PARTS="PA DF" ASVSPOOF2021_PA_PARTS="00 01" ASVSPOOF2021_DF_PARTS="00" scripts/download/asvspoof_2021.sh

# VoxLingua107 downloads HF metadata by default. The mirrored dataset snapshot is opt-in.
VOXLINGUA107_DOWNLOAD_HF=1 scripts/download/voxlingua107.sh

# Speech Commands defaults to the official v0.02 archive, about 2.37 GiB.
SPEECH_COMMANDS_VERSION=v0.01 scripts/download/speech_commands.sh

# MSWC saves official docs by default. Language archives are opt-in; audio can be many GiB.
MSWC_DOWNLOAD_ARCHIVES=1 MSWC_LANGS="ta vi" MSWC_PARTS="splits alignments" scripts/download/mswc.sh
MSWC_DOWNLOAD_ARCHIVES=1 MSWC_LANGS=ta MSWC_PARTS=audio scripts/download/mswc.sh

# AudioMNIST downloads README/LICENSE/speaker metadata by default. Full repo clone is opt-in.
AUDIO_MNIST_DOWNLOAD_REPO=1 scripts/download/audio_mnist.sh

# VocalSound downloads official README/repo metadata by default. Archives are 1.7 GiB or 4.5 GiB and opt-in.
VOCALSOUND_DOWNLOAD_ARCHIVE=1 VOCALSOUND_SAMPLE_RATE=16k scripts/download/vocalsound.sh
VOCALSOUND_DOWNLOAD_ARCHIVE=1 VOCALSOUND_SAMPLE_RATE=44k scripts/download/vocalsound.sh

# VocalSet saves Zenodo metadata by default. The 2.1 GiB singing voice archive is opt-in.
VOCALSET_DOWNLOAD_ARCHIVE=1 scripts/download/vocalset.sh

# EmoV-DB downloads OpenSLR/GitHub docs by default. Speech archives are opt-in.
EMOV_DB_DOWNLOAD_ARCHIVES=1 EMOV_DB_PARTS="bea_Neutral.tar.gz sam_Neutral.tar.gz" scripts/download/emov_db.sh
EMOV_DB_OPENSLR_BASE_URL=https://openslr.elda.org/resources/115 EMOV_DB_DOWNLOAD_ARCHIVES=1 scripts/download/emov_db.sh

# RAVDESS saves Zenodo metadata by default. Audio-only archives are opt-in.
RAVDESS_DOWNLOAD_AUDIO=1 scripts/download/ravdess.sh

# CREMA-D saves README/license/CSV metadata by default. Full media needs Git LFS and is opt-in.
CREMAD_DOWNLOAD_MEDIA=1 scripts/download/crema_d.sh
CREMAD_REPO_URL=https://github.com/CheyneyComputerScience/CREMA-D.git CREMAD_DOWNLOAD_MEDIA=1 scripts/download/crema_d.sh

# MELD downloads official project metadata by default. Raw media and feature/model tarballs are opt-in.
MELD_DOWNLOAD_RAW=1 scripts/download/meld.sh
MELD_DOWNLOAD_FEATURES=1 scripts/download/meld.sh
MELD_BASE_URL=https://huggingface.co/datasets/declare-lab/MELD/resolve/main scripts/download/meld.sh

# IEMOCAP is form-gated by USC SAIL. The helper prints official request steps.
scripts/download/iemocap.sh

# TIMIT is paid/licensed through LDC. The helper prints official access steps.
scripts/download/timit.sh

# Switchboard is paid/licensed through LDC. The helper prints official access steps.
scripts/download/switchboard.sh

# MUSAN downloads the OpenSLR page by default. The corpus archive is about 11 GiB.
MUSAN_DOWNLOAD_ARCHIVE=1 scripts/download/musan.sh
MUSAN_OPENSLR_BASE_URL=https://openslr.elda.org/resources/17 MUSAN_DOWNLOAD_ARCHIVE=1 scripts/download/musan.sh

# AMI downloads official annotation ZIPs by default. Audio/HF mirrors are large.
AMI_DOWNLOAD_OPENSLR_AUDIO=1 AMI_OPENSLR_PARTS="headset.tar.gz" scripts/download/ami.sh
AMI_DOWNLOAD_HF=1 AMI_HF_INCLUDE="data/ihm/*validation*" scripts/download/ami.sh

# CHiME-6 downloads transcriptions/floorplans by default. Audio archives are large.
CHIME6_DOWNLOAD_AUDIO=1 CHIME6_PARTS="CHiME6_dev.tar.gz CHiME6_eval.tar.gz" scripts/download/chime_6.sh
CHIME6_OPENSLR_BASE_URL=https://openslr.elda.org/resources/150 scripts/download/chime_6.sh

# AliMeeting downloads OpenSLR metadata by default. Corpus archives are large.
ALIMEETING_DOWNLOAD_ARCHIVES=1 ALIMEETING_PARTS="Eval_Ali.tar.gz Test_Ali.tar.gz" scripts/download/alimeeting.sh

# WHAM!/WHAMR! downloads the page and small generation scripts by default. Noise archives are large.
WHAM_DOWNLOAD_NOISE=1 scripts/download/wham_whamr.sh
WHAM_DOWNLOAD_48KHZ=1 scripts/download/wham_whamr.sh
WHAM_DOWNLOAD_SCRIPTS=0 scripts/download/wham_whamr.sh

# VoiceBank-DEMAND downloads DataShare metadata/license by default. Text and audio archives are opt-in.
VOICEBANK_DEMAND_DOWNLOAD_TEXT=1 scripts/download/voicebank_demand.sh
VOICEBANK_DEMAND_DOWNLOAD_AUDIO=1 VOICEBANK_DEMAND_PARTS="clean_test noisy_test" scripts/download/voicebank_demand.sh
VOICEBANK_DEMAND_DOWNLOAD_AUDIO=1 VOICEBANK_DEMAND_PARTS=all scripts/download/voicebank_demand.sh

# DNS Challenge downloads official metadata/license/downloader scripts by default.
DNS_CHALLENGE_DOWNLOAD_DEV_TESTSET=1 scripts/download/dns_challenge.sh
DNS_CHALLENGE_DOWNLOAD_BLIND_TESTSET=1 scripts/download/dns_challenge.sh
DNS_CHALLENGE_CLONE_REPO=1 scripts/download/dns_challenge.sh

# MS-SNSD downloads official metadata/generator files by default. The repo clone is large.
MS_SNSD_CLONE_REPO=1 scripts/download/ms_snsd.sh
MS_SNSD_RUN_SYNTHESIS=1 scripts/download/ms_snsd.sh

# NISQA downloads official docs/license files and Zenodo metadata by default.
NISQA_DOWNLOAD_CORPUS=1 scripts/download/nisqa.sh

# Clotho downloads captions/metadata by default. Audio archives are about 7.1 GiB.
CLOTHO_DOWNLOAD_AUDIO=1 scripts/download/clotho.sh

# ClothoAQA downloads QA CSVs, metadata, and license by default. Audio is about 3.1 GiB.
CLOTHO_AQA_DOWNLOAD_AUDIO=1 scripts/download/clotho_aqa.sh

# AudioCaps downloads caption CSV metadata only. Use 2.0 for the larger 2025 CSV release.
AUDIOCAPS_VERSION=2.0 scripts/download/audiocaps.sh

# MusicCaps downloads the HF dataset card and public CSV annotations by default.
MUSICCAPS_DOWNLOAD_HF=1 scripts/download/musiccaps.sh

# WavCaps downloads README and JSON metadata by default. Select waveform ZIP sources explicitly.
WAVCAPS_DOWNLOAD_ZIPS=1 WAVCAPS_ZIP_SOURCES=SoundBible scripts/download/wavcaps.sh
WAVCAPS_DOWNLOAD_ZIPS=1 WAVCAPS_ZIP_SOURCES="AudioSet_SL BBC_Sound_Effects" scripts/download/wavcaps.sh

# MACS downloads annotations plus TAU 2019 docs/metadata by default. Audio shards are large.
MACS_DOWNLOAD_TAU_AUDIO=1 scripts/download/macs.sh

# GTZAN saves the HF dataset card by default. Full audio/data snapshot is opt-in.
GTZAN_DOWNLOAD_HF=1 scripts/download/gtzan.sh

# MagnaTagATune downloads CSV metadata by default. Features/audio are opt-in.
MAGNATAGATUNE_DOWNLOAD_FEATURES=1 scripts/download/magnatagatune.sh
MAGNATAGATUNE_DOWNLOAD_AUDIO=1 scripts/download/magnatagatune.sh
MAGNATAGATUNE_BASE_URL=https://mirg.city.ac.uk/datasets/magnatagatune scripts/download/magnatagatune.sh

# MTG-Jamendo clones metadata/scripts by default. The upstream media/features archives are large.
MTG_JAMENDO_DOWNLOAD_ZENODO_DATA=1 scripts/download/mtg_jamendo.sh
MTG_JAMENDO_DOWNLOAD_MEDIA=1 MTG_JAMENDO_DATASET=autotagging_moodtheme MTG_JAMENDO_TYPE=audio-low scripts/download/mtg_jamendo.sh

# FMA downloads official README/license by default. Metadata/audio are opt-in.
FMA_DOWNLOAD_METADATA=1 scripts/download/fma.sh
FMA_DOWNLOAD_AUDIO=1 FMA_AUDIO_PARTS=small scripts/download/fma.sh
FMA_DOWNLOAD_AUDIO=1 FMA_AUDIO_PARTS="small medium" scripts/download/fma.sh

# OpenMIC-2018 downloads Zenodo metadata and the official README by default.
OPENMIC_DOWNLOAD_ARCHIVE=1 scripts/download/openmic_2018.sh

# NSynth downloads the official page by default. Archives are large and opt-in.
NSYNTH_DOWNLOAD_ARCHIVES=1 NSYNTH_SPLITS=test NSYNTH_FORMAT=jsonwav scripts/download/nsynth.sh
NSYNTH_DOWNLOAD_ARCHIVES=1 NSYNTH_SPLITS="valid test" NSYNTH_FORMAT=tfrecord scripts/download/nsynth.sh

# MAESTRO downloads v3.0.0 metadata by default. MIDI and audio archives are opt-in.
MAESTRO_DOWNLOAD_MIDI=1 scripts/download/maestro.sh
MAESTRO_DOWNLOAD_AUDIO=1 scripts/download/maestro.sh
MAESTRO_BASE_URL=https://storage.googleapis.com/magentadata/datasets/maestro/v3.0.0 scripts/download/maestro.sh

# MUSDB18 saves official pages by default. Large archives require terms acknowledgement and opt-in.
MUSDB18_ACK_TERMS=1 MUSDB18_DOWNLOAD_ARCHIVE=1 scripts/download/musdb18.sh
MUSDB18_ACK_TERMS=1 MUSDB18_DOWNLOAD_HQ=1 scripts/download/musdb18.sh

# Slakh2100 downloads the official page and slakh-utils README/LICENSE by default.
SLAKH_CHECK_ZENODO=1 scripts/download/slakh2100.sh
SLAKH_CLONE_UTILS=1 scripts/download/slakh2100.sh
SLAKH_CLONE_GENERATION=1 scripts/download/slakh2100.sh

# LibriMix clones the official generator/metadata repo by default. Generation is very large.
LIBRIMIX_RUN_GENERATION=1 LIBRIMIX_STORAGE_DIR=/large/storage scripts/download/librimix.sh

# WSJ0-2mix downloads MERL public pages/scripts by default. Actual mixture generation requires local licensed WSJ0 access.
WSJ0_2MIX_CLONE_PYTHON_REPO=1 scripts/download/wsj0_2mix.sh
WSJ0_2MIX_RUN_GENERATION=1 WSJ0_PATH=/path/to/wsj0 WSJ0_2MIX_OUTPUT=/large/storage/wsj0-mix scripts/download/wsj0_2mix.sh

# VCTK downloads the official README and license by default. The corpus ZIP is large and opt-in.
VCTK_DOWNLOAD_ARCHIVE=1 scripts/download/vctk.sh
VCTK_ARCHIVE_URL=https://datashare.ed.ac.uk/bitstreams/535f4286-e54c-4038-838c-a02285e32cb2/download scripts/download/vctk.sh
```
