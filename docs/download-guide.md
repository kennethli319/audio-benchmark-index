# Download guide

Download helpers use safe defaults: they fetch documentation or lightweight metadata first,
while large archives, gated resources, and restricted data require explicit opt-in.
Files are written beneath `data/raw/<benchmark-id>/`, which is ignored by Git.

For the complete helper inventory and access notes, see
[`scripts/download/README.md`](../scripts/download/README.md).

## Download Examples

Hugging Face datasets:

```python
from datasets import load_dataset

mmau_mini = load_dataset("gamma-lab-umd/MMAU-test-mini")
# Loads the original HF snapshot; use scripts/download/mmar.sh for the later
# MMAR-Rubrics JSONL without downloading audio.
mmar = load_dataset("BoJack/MMAR")
mmsu = load_dataset("ddwang2000/MMSU")
fleurs_en = load_dataset("google/fleurs", "en_us")
```

Audio-language model benchmarks:

```bash
scripts/download/air_bench.sh
AIR_BENCH_DOWNLOAD_HF=1 scripts/download/air_bench.sh
AIR_BENCH_CLONE_REPO=1 scripts/download/air_bench.sh
scripts/download/music_avqa.sh
MUSIC_AVQA_CLONE_REPO=1 scripts/download/music_avqa.sh
scripts/download/llp.sh
LLP_CLONE_REPO=1 scripts/download/llp.sh
scripts/download/avsd.sh
```

Spoken language understanding:

```bash
scripts/download/superb.sh
SUPERB_CLONE_TOOLKIT=1 scripts/download/superb.sh
scripts/download/slurp.sh
SLURP_DOWNLOAD_AUDIO=1 SLURP_AUDIO_PARTS=real scripts/download/slurp.sh
scripts/download/slue.sh
SLUE_DOWNLOAD_HF=1 SLUE_DATASETS=slue-phase-2 scripts/download/slue.sh
scripts/download/minds14.sh
MINDS14_DOWNLOAD_HF=1 MINDS14_CONFIG=en-US scripts/download/minds14.sh
scripts/download/hear.sh
HEAR_DOWNLOAD_TASKS=1 HEAR_TASKS=hear2021-mridangam_tonic-v1.5-full-48000.tar.gz scripts/download/hear.sh
scripts/download/dynamic_superb.sh
DYNAMIC_SUPERB_CLONE_REPO=1 scripts/download/dynamic_superb.sh
```

Hugging Face CLI:

```bash
scripts/download/mmar.sh
MMAR_DOWNLOAD_AUDIO=1 scripts/download/mmar.sh
huggingface-cli download --repo-type dataset Honggao/URO-Bench URO-Bench-data.zip --local-dir data/URO-Bench
```

OpenSLR:

```bash
wget -P data/LibriSpeech https://www.openslr.org/resources/12/test-clean.tar.gz
scripts/download/libri_light.sh
LIBRI_LIGHT_DOWNLOAD_FINETUNE=1 scripts/download/libri_light.sh
LIBRI_LIGHT_DOWNLOAD_UNLABELED=1 LIBRI_LIGHT_PARTS=small scripts/download/libri_light.sh
scripts/download/aishell_1.sh
AISHELL1_DOWNLOAD_ARCHIVE=1 scripts/download/aishell_1.sh
scripts/download/mls.sh
MLS_DOWNLOAD_ARCHIVES=1 MLS_LANGS=polish MLS_FORMAT=opus scripts/download/mls.sh
scripts/download/magicdata_mandarin.sh
MAGICDATA_DOWNLOAD_ARCHIVES=1 MAGICDATA_PARTS="dev test" scripts/download/magicdata_mandarin.sh
scripts/download/st_cmds.sh
ST_CMDS_DOWNLOAD_ARCHIVE=1 scripts/download/st_cmds.sh
scripts/download/thchs_30.sh
THCHS30_DOWNLOAD_PARTS=resource scripts/download/thchs_30.sh
scripts/download/primewords_chinese.sh
PRIMEWORDS_DOWNLOAD_ARCHIVE=1 scripts/download/primewords_chinese.sh
scripts/download/golos.sh
GOLOS_DOWNLOAD_OPUS=1 scripts/download/golos.sh
```

VoxPopuli:

```bash
VOXPOPULI_CONFIG=en VOXPOPULI_SPLITS="test validation" scripts/download/voxpopuli.sh
```

CoVoST 2:

```bash
scripts/download/covost2.sh
COVOST2_DIRECTIONS=all scripts/download/covost2.sh
```

Multilingual TEDx:

```bash
scripts/download/mtedx.sh
MTEDX_DOWNLOAD_ARCHIVES=1 MTEDX_PARTS=mtedx_iwslt2021.tgz scripts/download/mtedx.sh
scripts/download/tedx_spanish.sh
TEDX_SPANISH_DOWNLOAD_ARCHIVE=1 scripts/download/tedx_spanish.sh
scripts/download/pansori_tedxkr.sh
PANSORI_TEDXKR_DOWNLOAD_ARCHIVE=1 scripts/download/pansori_tedxkr.sh
```

Parliamentary speech translation:

```bash
scripts/download/europarl_st.sh
EUROPARL_ST_DOWNLOAD_ARCHIVE=1 scripts/download/europarl_st.sh
```

Multidimensional speech-translation evaluation:

```bash
scripts/download/openstbench.sh
OPENSTBENCH_DOWNLOAD_PAIRED_SET=1 scripts/download/openstbench.sh
```

Large or gated ASR:

```bash
GIGASPEECH_ACK_ACCESS=1 GIGASPEECH_CONFIG=dev scripts/download/gigaspeech.sh
GIGASPEECH_ACK_ACCESS=1 GIGASPEECH_CONFIG=xs scripts/download/gigaspeech.sh
SPGISPEECH_ACK_TERMS=1 SPGISPEECH_CONFIG=dev scripts/download/spgispeech.sh
scripts/download/earnings_22.sh
EARNINGS22_SPARSE_CHECKOUT=1 scripts/download/earnings_22.sh
scripts/download/earnings_21.sh
EARNINGS21_SPARSE_CHECKOUT=1 scripts/download/earnings_21.sh
scripts/download/l2_arctic.sh
```

Direct archives:

```bash
scripts/download/esc_50.sh
scripts/download/dcase2024_task5.sh
DCASE2024_TASK5_DOWNLOAD_AUDIO=1 scripts/download/dcase2024_task5.sh
scripts/download/dcase2025_audioqa.sh
scripts/download/adqa_bench.sh
URBANSOUND8K_DOWNLOAD_AUDIO=1 scripts/download/urbansound8k.sh
scripts/download/tau_asc_2019.sh
TAU_ASC2019_DOWNLOAD_AUDIO=1 TAU_ASC2019_AUDIO_PARTS="1 2 21" scripts/download/tau_asc_2019.sh
scripts/download/tau_asc_2020_mobile.sh
TAU_ASC2020_DOWNLOAD_DEV_AUDIO=1 scripts/download/tau_asc_2020_mobile.sh
scripts/download/tau_asc_2022_mobile.sh
TAU_ASC2022_DOWNLOAD_DEV_AUDIO=1 scripts/download/tau_asc_2022_mobile.sh
```

Audio event metadata:

```bash
scripts/download/audioset.sh
AUDIOSET_DOWNLOAD_FEATURES=1 AUDIOSET_REGION=us scripts/download/audioset.sh
scripts/download/vggsound.sh
VGGSOUND_DOWNLOAD_MODELS=1 scripts/download/vggsound.sh
scripts/download/ave.sh
AVE_CLONE_REPO=1 scripts/download/ave.sh
scripts/download/epic_sounds.sh
EPIC_SOUNDS_CLONE_ANNOTATIONS=1 scripts/download/epic_sounds.sh
scripts/download/fsd50k.sh
FSD50K_DOWNLOAD_AUDIO=1 scripts/download/fsd50k.sh
scripts/download/fsdkaggle2018.sh
FSDKAGGLE2018_DOWNLOAD_AUDIO=1 scripts/download/fsdkaggle2018.sh
scripts/download/fsdkaggle2019.sh
FSDKAGGLE2019_DOWNLOAD_AUDIO=1 FSDKAGGLE2019_AUDIO_PARTS="curated test" scripts/download/fsdkaggle2019.sh
scripts/download/desed.sh
DESED_DOWNLOAD_REAL_AUDIO=1 scripts/download/desed.sh
scripts/download/sonyc_ust_v2.sh
SONYC_UST_V2_DOWNLOAD_AUDIO=1 SONYC_UST_V2_AUDIO_PARTS="audio-0.tar.gz audio-18.tar.gz" scripts/download/sonyc_ust_v2.sh
```

Speaker recognition and diarization metadata:

```bash
scripts/download/voxceleb.sh
VOXCELEB_OPENSLR_BASE_URL=https://openslr.elda.org/resources/49 scripts/download/voxceleb.sh
scripts/download/polysim_2026.sh
POLYSIM2026_CLONE_REPO=1 scripts/download/polysim_2026.sh
scripts/download/hi_mia.sh
HIMIA_DOWNLOAD_ARCHIVES=1 HIMIA_PARTS="dev test_v2" scripts/download/hi_mia.sh
scripts/download/voxconverse.sh
VOXCONVERSE_DOWNLOAD_AUDIO=1 VOXCONVERSE_AUDIO_SPLITS=dev scripts/download/voxconverse.sh
scripts/download/dihard_iii.sh
scripts/download/asvspoof_2019.sh
ASVSPOOF2019_DOWNLOAD_ARCHIVES=1 ASVSPOOF2019_PARTS=LA scripts/download/asvspoof_2019.sh
scripts/download/add_2022.sh
ADD2022_DOWNLOAD_ARCHIVES=1 ADD2022_RECORDS="adaptation track1" scripts/download/add_2022.sh
scripts/download/diffssd.sh
DIFFSSD_DOWNLOAD_AUDIO=1 scripts/download/diffssd.sh
scripts/download/fake_or_real.sh
FAKE_OR_REAL_DOWNLOAD_ARCHIVES=1 FAKE_OR_REAL_VERSIONS="2sec" scripts/download/fake_or_real.sh
scripts/download/asvspoof_2021.sh
ASVSPOOF2021_DOWNLOAD_ARCHIVES=1 ASVSPOOF2021_PARTS=LA scripts/download/asvspoof_2021.sh
scripts/download/voxenes_2026.sh
VOXENES2026_DOWNLOAD_DATA=1 scripts/download/voxenes_2026.sh
```

Spoken language identification:

```bash
scripts/download/voxlingua107.sh
VOXLINGUA107_DOWNLOAD_HF=1 scripts/download/voxlingua107.sh
```

Keyword spotting:

```bash
SPEECH_COMMANDS_VERSION=v0.02 scripts/download/speech_commands.sh
SPEECH_COMMANDS_VERSION=v0.01 scripts/download/speech_commands.sh
scripts/download/mswc.sh
MSWC_DOWNLOAD_ARCHIVES=1 MSWC_LANGS="ta vi" MSWC_PARTS="splits alignments" scripts/download/mswc.sh
scripts/download/audio_mnist.sh
AUDIO_MNIST_DOWNLOAD_REPO=1 scripts/download/audio_mnist.sh
scripts/download/vocalsound.sh
VOCALSOUND_DOWNLOAD_ARCHIVE=1 VOCALSOUND_SAMPLE_RATE=16k scripts/download/vocalsound.sh
scripts/download/vocalset.sh
VOCALSET_DOWNLOAD_ARCHIVE=1 scripts/download/vocalset.sh
```

Speech emotion recognition:

```bash
scripts/download/emov_db.sh
EMOV_DB_DOWNLOAD_ARCHIVES=1 EMOV_DB_PARTS="bea_Neutral.tar.gz sam_Neutral.tar.gz" scripts/download/emov_db.sh
scripts/download/ravdess.sh
RAVDESS_DOWNLOAD_AUDIO=1 scripts/download/ravdess.sh
scripts/download/crema_d.sh
CREMAD_DOWNLOAD_MEDIA=1 scripts/download/crema_d.sh
scripts/download/meld.sh
MELD_DOWNLOAD_RAW=1 scripts/download/meld.sh
MELD_DOWNLOAD_FEATURES=1 scripts/download/meld.sh
scripts/download/ch_sims.sh
CH_SIMS_CLONE_TOOLKIT=1 scripts/download/ch_sims.sh
scripts/download/ch_sims_v2.sh
CH_SIMS_V2_CLONE_REPO=1 scripts/download/ch_sims_v2.sh
scripts/download/cmu_mosi.sh
CMU_MOSI_CLONE_SDK=1 scripts/download/cmu_mosi.sh
CMU_MOSI_CLONE_MULTIBENCH=1 scripts/download/cmu_mosi.sh
scripts/download/cmu_mosei.sh
CMU_MOSEI_CLONE_SDK=1 scripts/download/cmu_mosei.sh
CMU_MOSEI_CLONE_MULTIBENCH=1 scripts/download/cmu_mosei.sh
```

Speech/music/noise classification:

```bash
scripts/download/musan.sh
MUSAN_DOWNLOAD_ARCHIVE=1 scripts/download/musan.sh
```

Speech synthesis:

```bash
scripts/download/seed_tts_eval.sh
SEED_TTS_EVAL_CLONE_REPO=1 scripts/download/seed_tts_eval.sh
scripts/download/podeval.sh
PODEVAL_CLONE_REPO=1 scripts/download/podeval.sh
scripts/download/libritts.sh
LIBRITTS_DOWNLOAD_ARCHIVES=1 LIBRITTS_PARTS="dev-clean test-clean" scripts/download/libritts.sh
scripts/download/ljspeech.sh
LJSPEECH_DOWNLOAD_ARCHIVE=1 scripts/download/ljspeech.sh
scripts/download/vctk.sh
VCTK_DOWNLOAD_ARCHIVE=1 scripts/download/vctk.sh
scripts/download/aishell_3.sh
AISHELL3_DOWNLOAD_ARCHIVE=1 scripts/download/aishell_3.sh
scripts/download/hifitts.sh
HIFITTS_DOWNLOAD_ARCHIVE=1 scripts/download/hifitts.sh
```

Meeting ASR:

```bash
scripts/download/ami.sh
AMI_DOWNLOAD_OPENSLR_AUDIO=1 AMI_OPENSLR_PARTS="headset.tar.gz" scripts/download/ami.sh
scripts/download/chime_6.sh
CHIME6_DOWNLOAD_AUDIO=1 CHIME6_PARTS="CHiME6_dev.tar.gz CHiME6_eval.tar.gz" scripts/download/chime_6.sh
scripts/download/chime_7_dasr.sh
scripts/download/alimeeting.sh
ALIMEETING_DOWNLOAD_ARCHIVES=1 ALIMEETING_PARTS="Eval_Ali.tar.gz Test_Ali.tar.gz" scripts/download/alimeeting.sh
scripts/download/smartglasses_challenge_2026.sh
```

Speech separation:

```bash
scripts/download/librimix.sh
LIBRIMIX_RUN_GENERATION=1 LIBRIMIX_STORAGE_DIR=/large/storage scripts/download/librimix.sh
scripts/download/fuss.sh
FUSS_DOWNLOAD_ARCHIVES=1 FUSS_PARTS="ssdata_reverb" scripts/download/fuss.sh
scripts/download/wsj0_2mix.sh
WSJ0_2MIX_CLONE_PYTHON_REPO=1 scripts/download/wsj0_2mix.sh
WSJ0_2MIX_RUN_GENERATION=1 WSJ0_PATH=/path/to/wsj0 WSJ0_2MIX_OUTPUT=/large/storage/wsj0-mix scripts/download/wsj0_2mix.sh
scripts/download/wham_whamr.sh
WHAM_DOWNLOAD_NOISE=1 scripts/download/wham_whamr.sh
```

Speech enhancement:

```bash
scripts/download/voicebank_demand.sh
VOICEBANK_DEMAND_DOWNLOAD_TEXT=1 scripts/download/voicebank_demand.sh
VOICEBANK_DEMAND_DOWNLOAD_AUDIO=1 VOICEBANK_DEMAND_PARTS="clean_test noisy_test" scripts/download/voicebank_demand.sh
scripts/download/dns_challenge.sh
DNS_CHALLENGE_DOWNLOAD_DEV_TESTSET=1 scripts/download/dns_challenge.sh
scripts/download/ms_snsd.sh
MS_SNSD_CLONE_REPO=1 scripts/download/ms_snsd.sh
```

Audio captioning:

```bash
scripts/download/clotho.sh
CLOTHO_DOWNLOAD_AUDIO=1 scripts/download/clotho.sh
scripts/download/clotho_aqa.sh
CLOTHO_AQA_DOWNLOAD_AUDIO=1 scripts/download/clotho_aqa.sh
scripts/download/audiocaps.sh
AUDIOCAPS_VERSION=2.0 scripts/download/audiocaps.sh
scripts/download/musiccaps.sh
scripts/download/wavcaps.sh
WAVCAPS_DOWNLOAD_ZIPS=1 WAVCAPS_ZIP_SOURCES=SoundBible scripts/download/wavcaps.sh
scripts/download/macs.sh
MACS_DOWNLOAD_TAU_AUDIO=1 scripts/download/macs.sh
```

Music tagging:

```bash
scripts/download/magnatagatune.sh
MAGNATAGATUNE_DOWNLOAD_FEATURES=1 scripts/download/magnatagatune.sh
MAGNATAGATUNE_DOWNLOAD_AUDIO=1 scripts/download/magnatagatune.sh
scripts/download/mtg_jamendo.sh
MTG_JAMENDO_DOWNLOAD_MEDIA=1 MTG_JAMENDO_DATASET=autotagging_moodtheme MTG_JAMENDO_TYPE=audio-low scripts/download/mtg_jamendo.sh
scripts/download/fma.sh
FMA_DOWNLOAD_METADATA=1 scripts/download/fma.sh
FMA_DOWNLOAD_AUDIO=1 FMA_AUDIO_PARTS=small scripts/download/fma.sh
scripts/download/gtzan.sh
GTZAN_DOWNLOAD_HF=1 scripts/download/gtzan.sh
scripts/download/openmic_2018.sh
OPENMIC_DOWNLOAD_ARCHIVE=1 scripts/download/openmic_2018.sh
scripts/download/musicnet.sh
MUSICNET_DOWNLOAD_MIDIS=1 scripts/download/musicnet.sh
MUSICNET_DOWNLOAD_AUDIO=1 scripts/download/musicnet.sh
```

Music synthesis:

```bash
scripts/download/nsynth.sh
NSYNTH_DOWNLOAD_ARCHIVES=1 NSYNTH_SPLITS=test NSYNTH_FORMAT=jsonwav scripts/download/nsynth.sh
scripts/download/maestro.sh
MAESTRO_DOWNLOAD_MIDI=1 scripts/download/maestro.sh
```

Music source separation:

```bash
scripts/download/musdb18.sh
MUSDB18_ACK_TERMS=1 MUSDB18_DOWNLOAD_ARCHIVE=1 scripts/download/musdb18.sh
scripts/download/medleydb.sh
MEDLEYDB_CHECK_ZENODO=1 scripts/download/medleydb.sh
MEDLEYDB_DOWNLOAD_SAMPLE=1 scripts/download/medleydb.sh
MEDLEYDB_CLONE_REPO=1 scripts/download/medleydb.sh
scripts/download/slakh2100.sh
SLAKH_CHECK_ZENODO=1 scripts/download/slakh2100.sh
SLAKH_CLONE_UTILS=1 scripts/download/slakh2100.sh
```

Form/password gated datasets:

- WenetSpeech: read the license, request the password on the official site, put it in `SAFEBOX/password`, then run `bash utils/download_wenetspeech.sh DOWNLOAD_DIR UNTAR_DIR`.
- GigaSpeech: fill out the official form, accept the Hugging Face terms, log in locally, then run `GIGASPEECH_ACK_ACCESS=1 GIGASPEECH_CONFIG=dev scripts/download/gigaspeech.sh`.
- SPGISpeech: accept the Kensho/Hugging Face gated terms, log in locally, then run `SPGISPEECH_ACK_TERMS=1 SPGISPEECH_CONFIG=dev scripts/download/spgispeech.sh`.
- Fluent Speech Commands: read the official page/license PDF and request access through the Fluent.ai Google Group; the helper saves public docs and prints access steps only.
- Opencpop: fill out the official Google Form and follow the email instructions.
- KeSpeech: use the Baidu Pan link in the repo with password `b6fy`; downloading means accepting the custom dataset license.
- IEMOCAP: read the USC/SAIL data release form and submit the official electronic release request; follow the access instructions sent by SAIL.
- MSP-Podcast: have an authorized institutional representative sign the official academic data-transfer agreement and send it to Prof. Carlos Busso as directed on the owner page.
- TIMIT: license the corpus through LDC catalog LDC93S1 or LDC93S1W, then use the LDC web download flow; the helper prints official access pointers only.
- Fisher English: license the four LDC catalog releases for speech/transcripts parts 1 and 2, then use the LDC web download flow; the helper prints official access pointers only.
- JASMIN-CGN: create an account on the Dutch Language Institute product page, download and sign the supplied non-commercial license, and follow its ordering instructions; the helper prints official access pointers only.

## Download Scripts

Per-benchmark CLI helpers live in [`scripts/download`](../scripts/download).
They download into `data/raw/<benchmark-id>/` by default, which is ignored by git.
For example:

```bash
scripts/download/mmar.sh
scripts/download/slurp.sh
scripts/download/minds14.sh
scripts/download/nyra_verbatim_speech_benchmark.sh
scripts/download/daps.sh
FLEURS_CONFIG=ja_jp scripts/download/fleurs.sh
LIBRISPEECH_PARTS="test-clean train-clean-100" scripts/download/librispeech.sh
scripts/download/libri_light.sh
scripts/download/libritts.sh
scripts/download/mls.sh
scripts/download/vctk.sh
scripts/download/aishell_3.sh
scripts/download/aishell_1.sh
scripts/download/primewords_chinese.sh
scripts/download/golos.sh
VOXPOPULI_CONFIG=en VOXPOPULI_SPLITS="test validation" scripts/download/voxpopuli.sh
scripts/download/covost2.sh
GIGASPEECH_ACK_ACCESS=1 GIGASPEECH_CONFIG=dev scripts/download/gigaspeech.sh
scripts/download/esc_50.sh
URBANSOUND8K_DOWNLOAD_AUDIO=1 scripts/download/urbansound8k.sh
scripts/download/audioset.sh
scripts/download/vggsound.sh
scripts/download/epic_sounds.sh
scripts/download/fsd50k.sh
scripts/download/voxceleb.sh
scripts/download/asvspoof_2019.sh
scripts/download/asvspoof_2021.sh
scripts/download/voxenes_2026.sh
scripts/download/voxlingua107.sh
scripts/download/speech_commands.sh
scripts/download/emov_db.sh
scripts/download/ravdess.sh
scripts/download/crema_d.sh
scripts/download/meld.sh
scripts/download/iemocap.sh
scripts/download/msp_podcast.sh
scripts/download/musan.sh
scripts/download/ami.sh
scripts/download/macs.sh
scripts/download/chime_6.sh
scripts/download/chime_7_dasr.sh
scripts/download/clotho.sh
scripts/download/audiocaps.sh
scripts/download/musiccaps.sh
scripts/download/wavcaps.sh
scripts/download/magnatagatune.sh
scripts/download/fma.sh
scripts/download/openmic_2018.sh
scripts/download/musicnet.sh
scripts/download/librimix.sh
scripts/download/wham_whamr.sh
scripts/download/voicebank_demand.sh
scripts/download/nsynth.sh
scripts/download/maestro.sh
scripts/download/ljspeech.sh
scripts/download/superb.sh
```

Some datasets require manual upstream access first. Their helper scripts print
the required form, password, or generated URL step instead of pretending there is
a public one-command download.
