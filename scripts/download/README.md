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
scripts/download/big_bench_audio.sh
scripts/download/multichallenge_audio.sh
scripts/download/nyra_verbatim_speech_benchmark.sh
scripts/download/thorsten_voice.sh
scripts/download/daps.sh
scripts/download/mmau_pro.sh
scripts/download/mugen.sh
scripts/download/trea.sh
scripts/download/lat_bench.sh
scripts/download/audio_marathon.sh
scripts/download/escucha.sh
scripts/download/ghana_speech_eval.sh
scripts/download/msu_bench.sh
scripts/download/korean_speechlm_benchmarks.sh
scripts/download/salmon.sh
scripts/download/air_bench.sh
scripts/download/audiobench.sh
scripts/download/af_reasoning_eval.sh
scripts/download/music_avqa.sh
scripts/download/omnibench.sh
scripts/download/llp.sh
scripts/download/interpet4d.sh
scripts/download/ava_active_speaker.sh
scripts/download/dave.sh
scripts/download/daily_omni.sh
scripts/download/worldsense.sh
scripts/download/mmou.sh
scripts/download/av_speakerbench.sh
scripts/download/avut.sh
scripts/download/omnigaia.sh
scripts/download/avscapbench.sh
scripts/download/vabench.sh
scripts/download/comind.sh
scripts/download/video_salmonn2_caption.sh
scripts/download/syncbench.sh
scripts/download/ave_compass.sh
scripts/download/seamless_interaction.sh
scripts/download/friend_bench.sh
scripts/download/k9_bench.sh
scripts/download/video_mme.sh
scripts/download/omniretriever_bench.sh
scripts/download/lvomnibench.sh
scripts/download/vsro_200.sh
scripts/download/lrro.sh
scripts/download/superb.sh
scripts/download/codec_superb.sh
scripts/download/emo_superb.sh
scripts/download/slurp.sh
scripts/download/slue.sh
scripts/download/minds14.sh
scripts/download/hear.sh
scripts/download/xares.sh
scripts/download/xares_llm.sh
scripts/download/dynamic_superb.sh
scripts/download/maeb.sh
scripts/download/dilemmadata.sh
scripts/download/emopia.sh
scripts/download/pop909.sh
scripts/download/melobottleneck_eval.sh
scripts/download/single_item_kawaii_measure.sh
scripts/download/kitchen20.sh
scripts/download/rul_muchomusic.sh
scripts/download/cross_era.sh
scripts/download/songformbench.sh
scripts/download/rubato.sh
scripts/download/multtipop.sh
scripts/download/madb.sh
scripts/download/songeval.sh
scripts/download/m6_music_detection.sh
scripts/download/song_describer.sh
scripts/download/concerto_accompaniment_benchmark.sh
scripts/download/cmi_rewardbench.sh
scripts/download/musica_metabench.sh
scripts/download/sonic_seasoning.sh
scripts/download/audiobook_narration_appeal.sh
scripts/download/chartgeneval.sh
scripts/download/voicebench.sh
scripts/download/uro_bench_pro.sh
scripts/download/speechrole.sh
scripts/download/wildspeech_bench.sh
scripts/download/spearbench.sh
scripts/download/stancebench.sh
scripts/download/fleurs.sh
scripts/download/fleurs_slu.sh
scripts/download/omnilingual_asr_corpus.sh
scripts/download/voicecodebench.sh
scripts/download/s_diverse.sh
scripts/download/lfr_benchmarking_factory.sh
scripts/download/ears.sh
scripts/download/jvs.sh
scripts/download/librispeech.sh
scripts/download/libriheavy.sh
scripts/download/whisper_rirmega.sh
scripts/download/libri_light.sh
scripts/download/mls.sh
scripts/download/mlc_slm_eval.sh
scripts/download/mtedx.sh
scripts/download/europarl_st.sh
scripts/download/tedx_spanish.sh
scripts/download/seed_tts_eval.sh
scripts/download/instruct_tts_eval.sh
scripts/download/capspeech.sh
scripts/download/dialogs_ru.sh
scripts/download/tts_multilingual_test_set.sh
scripts/download/cn_news_tts_bench.sh
scripts/download/podeval.sh
scripts/download/rapidata_tts_preference.sh
scripts/download/audio_alpaca.sh
scripts/download/mecat.sh
scripts/download/mmgenre.sh
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
scripts/download/ksc2.sh
scripts/download/gigaspeechbench.sh
scripts/download/indic_context_eval.sh
scripts/download/duplexchat.sh
scripts/download/biotalk_3d.sh
scripts/download/av_gc_aad.sh
scripts/download/imda_nsc.sh
scripts/download/voxpopuli.sh
scripts/download/covost2.sh
scripts/download/openstbench.sh
scripts/download/nonverbal_tts.sh
scripts/download/realsi.sh
scripts/download/earnings_22.sh
scripts/download/earnings_21.sh
scripts/download/halas.sh
scripts/download/mir_1k_vocal.sh
scripts/download/esc_50.sh
scripts/download/dcase2020_task2_asd.sh
scripts/download/eating_sound_collection.sh
scripts/download/dcase2024_task5.sh
scripts/download/dcase2022_task2_asd.sh
scripts/download/dcase2023_task2_asd.sh
scripts/download/dcase2024_task2_asd.sh
scripts/download/dcase2025_task2_asd.sh
scripts/download/dcase2026_task2_asd.sh
scripts/download/dcase2026_task1_hac.sh
scripts/download/dcase2024_sound_scene_synthesis.sh
scripts/download/dcase2024_lass.sh
scripts/download/dhauds.sh
scripts/download/spuraudio.sh
scripts/download/geo_atbench.sh
scripts/download/urban_beehive.sh
scripts/download/physionet_cinc_2016_heart_sound.sh
scripts/download/soroll_ia.sh
scripts/download/urbansound8k.sh
scripts/download/tau_asc_2019.sh
scripts/download/tau_asc_2020_mobile.sh
scripts/download/tau_asc_2022_mobile.sh
scripts/download/audioset.sh
scripts/download/vggsound.sh
scripts/download/ave.sh
scripts/download/starss22.sh
scripts/download/starss23.sh
scripts/download/audiblelight_eigenmike32.sh
scripts/download/dcase2025_stereo_seld.sh
scripts/download/locata.sh
scripts/download/spatial_librispeech.sh
scripts/download/l3das21.sh
scripts/download/l3das22.sh
scripts/download/tau_spatial_sound_events_2019.sh
scripts/download/tau_nigens_sse_2020.sh
scripts/download/tau_nigens_sse_2021.sh
scripts/download/epic_sounds.sh
scripts/download/fsd50k.sh
scripts/download/doppelganger.sh
scripts/download/foleyset.sh
scripts/download/fsdkaggle2018.sh
scripts/download/fsdkaggle2019.sh
scripts/download/desed.sh
scripts/download/maestro_real.sh
scripts/download/realdesed.sh
scripts/download/wabad.sh
scripts/download/spint.sh
scripts/download/realman.sh
scripts/download/forestir.sh
scripts/download/mmae.sh
scripts/download/pazabench.sh
scripts/download/live_gurbani_captioning_v1.sh
scripts/download/storyad_qa.sh
scripts/download/sonyc_ust_v2.sh
scripts/download/voxceleb.sh
scripts/download/polysim_2026.sh
scripts/download/voxblink2.sh
scripts/download/hi_mia.sh
scripts/download/voxconverse.sh
scripts/download/asvspoof_2015.sh
scripts/download/asvspoof_2017.sh
scripts/download/asvspoof_2019.sh
scripts/download/add_2022.sh
scripts/download/add_2023.sh
scripts/download/codecfake.sh
scripts/download/dfadd.sh
scripts/download/librisevoc.sh
scripts/download/speech_df_arena.sh
scripts/download/wavefake.sh
scripts/download/mixfake.sh
scripts/download/tfcl_afe.sh
scripts/download/diffssd.sh
scripts/download/fake_or_real.sh
scripts/download/asvspoof_2021.sh
scripts/download/asvspoof_5.sh
scripts/download/audiomarkbench.sh
scripts/download/compspoof_v2.sh
scripts/download/voxenes_2026.sh
scripts/download/voxlingua107.sh
scripts/download/speech_commands.sh
scripts/download/mswc.sh
scripts/download/audio_mnist.sh
scripts/download/designed_vocalizations.sh
scripts/download/movie_gen_audio_bench.sh
scripts/download/backgroundmellow_cinematic_trailer_eval.sh
scripts/download/covomix2_dialogue.sh
scripts/download/silent_speech_emg.sh
scripts/download/japaneeg.sh
scripts/download/avdc.sh
scripts/download/pvqd.sh
scripts/download/torgo.sh
scripts/download/parapair_audio_bench.sh
scripts/download/speecheq.sh
scripts/download/star_bench.sh
scripts/download/blab.sh
scripts/download/speech_edit_bench.sh
scripts/download/ming_freeform_audio_edit.sh
scripts/download/mcr_bench.sh
scripts/download/vocalsound.sh
scripts/download/vocalset.sh
scripts/download/emov_db.sh
scripts/download/daic_woz.sh
scripts/download/androids_corpus.sh
scripts/download/ravdess.sh
scripts/download/tess.sh
scripts/download/crema_d.sh
scripts/download/meld.sh
scripts/download/cmma.sh
scripts/download/mustard.sh
scripts/download/ch_sims.sh
scripts/download/ch_sims_v2.sh
scripts/download/cmu_mosi.sh
scripts/download/cmu_mosei.sh
# Downloads public EmoPrefer CSVs/docs and MER2025/MER2026 API metadata only.
# Audio/video remains manually gated; no token or gated file is fetched.
scripts/download/emoprefer.sh
scripts/download/musan.sh
scripts/download/ami.sh
scripts/download/chime_4.sh
scripts/download/chime_6.sh
scripts/download/alimeeting.sh
scripts/download/libriwasn.sh
scripts/download/libricss.sh
scripts/download/clotho.sh
scripts/download/clotho_aqa.sh
scripts/download/audiocaps.sh
scripts/download/uiq.sh
scripts/download/audiocards.sh
scripts/download/musiccaps.sh
scripts/download/wavcaps.sh
scripts/download/audiosetcaps.sh
scripts/download/macs.sh
scripts/download/magnatagatune.sh
scripts/download/mtg_jamendo.sh
scripts/download/fma.sh
scripts/download/million_song_dataset.sh
scripts/download/gtzan.sh
scripts/download/openmic_2018.sh
scripts/download/musicnet.sh
scripts/download/msmd.sh

# Cross-Era downloads official annotations, chord features, and source-backed
# work-year metadata by default. The ~244 MB chroma archive is opt-in; the
# underlying commercial recordings are unavailable from the official release.
CROSS_ERA_DOWNLOAD_CHROMA=1 scripts/download/cross_era.sh
scripts/download/singmos_pro.sh
scripts/download/nsynth.sh
scripts/download/surge_pitch.sh
scripts/download/maestro.sh
scripts/download/musdb18.sh
scripts/download/msrbench.sh
scripts/download/dsd100.sh
scripts/download/medleydb.sh
scripts/download/slakh2100.sh
scripts/download/moisesdb.sh
scripts/download/librimix.sh
scripts/download/fuss.sh
scripts/download/wsj0_2mix.sh
scripts/download/wham_whamr.sh
scripts/download/voicebank_demand.sh
scripts/download/diamond_benchmark.sh
scripts/download/dns_challenge.sh
scripts/download/ms_snsd.sh
scripts/download/nisqa.sh
scripts/download/somos.sh
scripts/download/qualispeech.sh
scripts/download/bvcc.sh
scripts/download/vctk.sh
scripts/download/adqa_bench.sh
scripts/download/multiref_compass.sh
scripts/download/clotho_moment.sh
scripts/download/castella.sh
```

# OmniBench downloads docs/API metadata by default. The approximately 1.26 GB
# Hugging Face snapshot with embedded image/audio media is opt-in.
OMNIBENCH_DOWNLOAD_HF=1 scripts/download/omnibench.sh
OMNIBENCH_CLONE_REPO=1 scripts/download/omnibench.sh

# MultiRef-Compass downloads its public CSV/JSONL manifests and official docs
# by default. The approximately 1.96 GB image/video snapshot and toolkit clone
# are separate opt-ins.
MULTIREF_COMPASS_DOWNLOAD_HF=1 scripts/download/multiref_compass.sh
MULTIREF_COMPASS_CLONE_REPO=1 scripts/download/multiref_compass.sh

# MMAR downloads its released MMAR-Rubrics metadata, docs, and evaluation
# scripts by default. The approximately 2.99 GB Hugging Face audio snapshot is
# opt-in; running the rubric evaluator separately requires an OpenAI API key.
MMAR_DOWNLOAD_AUDIO=1 scripts/download/mmar.sh

# CoMind saves the official page, paper metadata, first-party downloader, and
# annotation manifest by default. Its approximately 5.0 MiB annotations are
# opt-in; use the saved official downloader manually for large media parts.
COMIND_DOWNLOAD_ANNOTATIONS=1 scripts/download/comind.sh

## Manual Or Gated

These scripts are included as helpers, but they need an upstream password,
generated URL, or manual form step first:

```bash
COMMON_VOICE_DOWNLOAD_URL='https://...' scripts/download/common_voice.sh
scripts/download/jvs.sh
GIGASPEECH_ACK_ACCESS=1 GIGASPEECH_CONFIG=dev scripts/download/gigaspeech.sh
SPGISPEECH_ACK_TERMS=1 SPGISPEECH_CONFIG=dev scripts/download/spgispeech.sh
scripts/download/fluent_speech_commands.sh
WENETSPEECH_PASSWORD='...' scripts/download/wenetspeech.sh
KESPEECH_ARCHIVE_URL='https://...' scripts/download/kespeech.sh
scripts/download/opencpop_test.sh
OPEN_CPOP_ARCHIVE_URL='https://...' scripts/download/opencpop_test.sh
scripts/download/lyra_sa.sh
scripts/download/adress_challenges.sh
scripts/download/daic_woz.sh
scripts/download/aff_wild2.sh
scripts/download/iemocap.sh
scripts/download/fakeavceleb.sh
scripts/download/savee.sh
scripts/download/ov_merd.sh
scripts/download/mer2023.sh
scripts/download/mer2024.sh
# BAH saves owner/request/challenge documentation plus the public ABAW 2026
# calibration-paper and implementation metadata; participant data remains
# proprietary, research-only, and EULA-gated.
scripts/download/bah.sh
scripts/download/spemoc.sh
scripts/download/incaremo.sh
scripts/download/msp_podcast.sh
scripts/download/chime_7_dasr.sh
# REAL-TSE saves the challenge page, toolkit metadata, primary challenge paper,
# and SonicAGI/MERL follow-up papers, then exits because closed-registration
# audio has no public download path.
scripts/download/real_tse.sh
scripts/download/smartglasses_challenge_2026.sh
scripts/download/voicemos_challenge_2026.sh
SYNSFX_ACK_RESEARCH_ONLY=1 SYNSFX_DOWNLOAD_ARCHIVE=1 scripts/download/synsfx.sh
scripts/download/timit.sh
scripts/download/switchboard.sh
scripts/download/fisher_english.sh
scripts/download/jasmin_cgn.sh
scripts/download/dihard_iii.sh
scripts/download/tidyvoice.sh
scripts/download/seabad.sh
scripts/download/childes_aligned.sh
scripts/download/fluencybank.sh
scripts/download/voiceprivacy_challenge.sh
scripts/download/process_2.sh
scripts/download/l2_arctic.sh
scripts/download/cdsd.sh
scripts/download/ume_erj.sh
scripts/download/ume_jrf.sh
scripts/download/speak_and_improve_2025.sh
scripts/download/mlc_slm_2nd_challenge.sh
scripts/download/qivd.sh
scripts/download/dcase2025_audioqa.sh
scripts/download/birdclef_2026.sh
scripts/download/avsd.sh
scripts/download/avqa.sh
scripts/download/avsbench.sh
scripts/download/lrs2.sh
scripts/download/lrs3.sh
IFEVAL_AUDIO_DOWNLOAD_HF=1 scripts/download/ifeval_audio.sh
OMNIVIDEOBENCH_DOWNLOAD_HF=1 scripts/download/omnivideobench.sh
LVOMNIBENCH_DOWNLOAD_HF=1 scripts/download/lvomnibench.sh
SPOOFCELEB_ACK_TERMS=1 SPOOFCELEB_DOWNLOAD_HF=1 scripts/download/spoofceleb.sh
scripts/download/singfox.sh
```

Without the required environment variables, they print the manual access steps
and exit with code `2`.

## Useful Options

```bash
# DCASE 2026 Task 1 downloads official docs and development metadata by default.
# Precomputed CLAP features and roughly 47 GB of audio/evaluation data are opt-in.
DCASE2026_TASK1_DOWNLOAD_FEATURES=1 scripts/download/dcase2026_task1_hac.sh
DCASE2026_TASK1_DOWNLOAD_AUDIO=1 scripts/download/dcase2026_task1_hac.sh

# AudioBench downloads its official documentation and dataset inventory by default.
# Cloning adds the evaluation toolkit, not its separately licensed upstream corpora.
AUDIOBENCH_CLONE_REPO=1 scripts/download/audiobench.sh

# AudioMarkBench downloads official docs and repository metadata by default.
# Cloning is opt-in; released audio is a manual Drive download with upstream terms.
AUDIOMARKBENCH_CLONE_REPO=1 scripts/download/audiomarkbench.sh

# AF-Reasoning-Eval downloads all lightweight annotations by default.
# Obtain the referenced source audio through the separate upstream helpers.
scripts/download/af_reasoning_eval.sh
scripts/download/clotho_aqa.sh
scripts/download/fsd50k.sh

# ESCUCHA downloads its public JSON/TSV annotations, README, and scorer only.
# It does not download the URL-referenced source recordings.
scripts/download/escucha.sh
ESCUCHA_CLONE_REPO=1 scripts/download/escucha.sh

# Ghana Speech Eval downloads official cards and API metadata by default.
# The approximately 594 MB compressed benchmark snapshot is opt-in.
GHANA_SPEECH_EVAL_DOWNLOAD_HF=1 scripts/download/ghana_speech_eval.sh

# Tadabur downloads official docs and repository metadata by default.
# The 1,400+ hour, approximately 1.94 TB audio-bearing snapshot is opt-in.
TADABUR_DOWNLOAD_HF=1 scripts/download/tadabur.sh

# InterPet4D downloads its public card and API metadata by default.
# The approximately 10.7 GB audio and aligned-motion snapshot is opt-in.
INTERPET4D_DOWNLOAD_HF=1 scripts/download/interpet4d.sh

# FLEURS defaults to en_us. Use another locale or all.
FLEURS_CONFIG=ja_jp scripts/download/fleurs.sh
FLEURS_CONFIG=all scripts/download/fleurs.sh

# LibriSpeech downloads official metadata/checksums by default. Archives are opt-in.
LIBRISPEECH_DOWNLOAD_ARCHIVES=1 LIBRISPEECH_PARTS="test-clean" scripts/download/librispeech.sh

# LibriHeavy downloads official docs/API metadata by default. Selected
# manifests are opt-in; obtain the several-terabyte source audio via Libri-Light.
LIBRIHEAVY_DOWNLOAD_MANIFESTS=1 LIBRIHEAVY_PARTS="dev test_clean test_other" scripts/download/libriheavy.sh

# Thorsten-Voice downloads official Zenodo/project metadata by default.
# The exact 23-hour, approximately 2.74 GB v3.0 archive is opt-in.
THORSTEN_VOICE_DOWNLOAD_ARCHIVE=1 scripts/download/thorsten_voice.sh

# DAPS downloads official owner/Zenodo metadata and cross-verification docs by
# default. The approximately 14.95 GiB corpus and notebook clone are opt-in.
DAPS_DOWNLOAD_ARCHIVE=1 scripts/download/daps.sh
DAPS_CLONE_CROSS_VERIFICATION=1 scripts/download/daps.sh

# DCASE 2020-2025 Task 2 ASD helpers download official metadata by default.
# Select archive groups explicitly.
DCASE2020_TASK2_DOWNLOAD_ARCHIVES=1 DCASE2020_TASK2_PARTS="dev eval" scripts/download/dcase2020_task2_asd.sh
DCASE2021_TASK2_DOWNLOAD_ARCHIVES=1 DCASE2021_TASK2_PARTS="dev eval" scripts/download/dcase2021_task2_asd.sh
DCASE2022_TASK2_DOWNLOAD_ARCHIVES=1 DCASE2022_TASK2_PARTS="dev eval" scripts/download/dcase2022_task2_asd.sh
DCASE2023_TASK2_DOWNLOAD_ARCHIVES=1 DCASE2023_TASK2_PARTS="dev eval" scripts/download/dcase2023_task2_asd.sh
DCASE2024_TASK2_DOWNLOAD_ARCHIVES=1 DCASE2024_TASK2_PARTS="dev eval" scripts/download/dcase2024_task2_asd.sh
DCASE2025_TASK2_DOWNLOAD_ARCHIVES=1 DCASE2025_TASK2_PARTS="dev eval" scripts/download/dcase2025_task2_asd.sh

# DCASE 2026 Task 2 ASD downloads official metadata by default. Its roughly
# 8.16 GB of synchronized near/far microphone audio is opt-in by record.
DCASE2026_TASK2_DOWNLOAD_ARCHIVES=1 DCASE2026_TASK2_PARTS="dev eval" scripts/download/dcase2026_task2_asd.sh

# Libri-Light downloads official docs by default. Finetuning, ABX, and unlabeled archives are opt-in.
LIBRI_LIGHT_DOWNLOAD_FINETUNE=1 scripts/download/libri_light.sh
LIBRI_LIGHT_DOWNLOAD_ABX=1 scripts/download/libri_light.sh

# L3DAS21 downloads official docs/metadata by default. Select large Zenodo archives explicitly.
L3DAS21_DOWNLOAD_DATA=1 L3DAS21_PARTS=Task1_dev scripts/download/l3das21.sh
L3DAS21_DOWNLOAD_DATA=1 L3DAS21_PARTS='Task2_train Task2_dev' scripts/download/l3das21.sh
LIBRI_LIGHT_DOWNLOAD_UNLABELED=1 LIBRI_LIGHT_PARTS=small scripts/download/libri_light.sh

# MLS downloads the OpenSLR page and checksums by default. Language archives are large and opt-in.
MLS_DOWNLOAD_ARCHIVES=1 MLS_LANGS=polish MLS_FORMAT=opus scripts/download/mls.sh
MLS_DOWNLOAD_ARCHIVES=1 MLS_LANGS="italian portuguese" MLS_FORMAT=opus scripts/download/mls.sh

# InstructTTSEval downloads official docs by default. The ~1.8 GB HF audio snapshot is opt-in.
INSTRUCT_TTS_EVAL_DOWNLOAD_HF=1 scripts/download/instruct_tts_eval.sh
INSTRUCT_TTS_EVAL_CLONE_REPO=1 scripts/download/instruct_tts_eval.sh

# Speech DF Arena downloads official paper/repository/leaderboard metadata by
# default. Its approximately 400 MB protocol/toolkit repository is opt-in;
# component datasets must be acquired separately under their own terms.
SPEECH_DF_ARENA_CLONE_TOOLKIT=1 scripts/download/speech_df_arena.sh

# WaveFake downloads the paper, official docs, Zenodo metadata, dataset
# license, and datasheet by default. Its 28.9 GB generated-audio ZIP and
# evaluation-toolkit clone are separate opt-ins.
WAVEFAKE_DOWNLOAD_ARCHIVE=1 scripts/download/wavefake.sh
WAVEFAKE_CLONE_TOOLKIT=1 scripts/download/wavefake.sh

# MixFake downloads the paper, official docs, and repository/Hub metadata by
# default. Its 67-volume, approximately 66.7 GiB public snapshot and baseline
# repository are separate opt-ins.
MIXFAKE_DOWNLOAD_DATA=1 scripts/download/mixfake.sh
MIXFAKE_CLONE_TOOLKIT=1 scripts/download/mixfake.sh

# In-the-Wild downloads official docs and Hub metadata by default.
# The approximately 7.60 GiB public ZIP is opt-in; review the conflicting license signals.
IN_THE_WILD_DOWNLOAD_HF=1 scripts/download/in_the_wild_audio_deepfake.sh

# CapSpeech downloads docs and API metadata by default. Its ~4.31 GB metadata snapshot is opt-in.
# Source recordings are obtained separately under their respective upstream terms.
CAPSPEECH_DOWNLOAD_HF=1 scripts/download/capspeech.sh
CAPSPEECH_CLONE_REPO=1 scripts/download/capspeech.sh

# Dialogs downloads docs and lightweight validation/test tables by default.
DIALOGS_RU_DOWNLOAD_PREVIEW=1 scripts/download/dialogs_ru.sh
DIALOGS_RU_DOWNLOAD_HF=1 scripts/download/dialogs_ru.sh

# SILMA Arabic TTS downloads prompts/docs by default; generated comparison audio is opt-in.
SILMA_ARABIC_TTS_CLONE_SPACE=1 scripts/download/silma_open_source_arabic_tts.sh

# ParaPairAudioBench downloads official docs by default. Cloning adds pair annotations/builders, not source audio.
PARAPAIR_AUDIO_BENCH_CLONE_REPO=1 scripts/download/parapair_audio_bench.sh

# SpeechEQ downloads official docs/metadata by default; its approximately 2.45 GB embedded-audio snapshot is opt-in.
SPEECHEQ_DOWNLOAD_HF=1 scripts/download/speecheq.sh

# STAR-Bench downloads question metadata by default; its approximately 2.74 GB audio snapshot is opt-in.
STAR_BENCH_DOWNLOAD_HF=1 scripts/download/star_bench.sh
STAR_BENCH_CLONE_REPO=1 scripts/download/star_bench.sh

# BLAB downloads docs/API metadata by default. Its approximately 535 MB
# question, answer, and timestamp snapshot is opt-in; source audio is not redistributed.
BLAB_DOWNLOAD_HF=1 scripts/download/blab.sh
BLAB_CLONE_TOOLKIT=1 scripts/download/blab.sh

# SpeechEditBench downloads docs and sample JSONL files by default; the approximately 3.75 GB audio release is opt-in.
SPEECH_EDIT_BENCH_DOWNLOAD_HF=1 scripts/download/speech_edit_bench.sh
SPEECH_EDIT_BENCH_CLONE_REPO=1 scripts/download/speech_edit_bench.sh

# SALMon downloads official docs/metadata by default; the approximately 562 MB snapshot is opt-in.
SALMON_DOWNLOAD_HF=1 scripts/download/salmon.sh

# Audio Agent Bench Suite downloads six component cards/API records by default; the ~209 MB snapshots are opt-in.
AUDIO_AGENT_BENCH_DOWNLOAD_HF=1 scripts/download/audio_agent_bench_suite.sh

# CoDeTT downloads official docs/metadata by default; the approximately 51.1 GB archive is opt-in.
CODETT_DOWNLOAD_HF=1 scripts/download/codett.sh
CODETT_CLONE_REPO=1 scripts/download/codett.sh

# CMI-RewardBench downloads official docs plus the lightweight CMI-Pref and
# composite test manifests; the approximately 15.0 GB HF snapshot is opt-in.
CMI_REWARDBENCH_DOWNLOAD_HF=1 scripts/download/cmi_rewardbench.sh

# MusICA-MetaBench downloads documentation, component licenses, configs, and
# two 300-item benchmark TSVs by default. The repository clone is opt-in.
MUSICA_METABENCH_CLONE_REPO=1 scripts/download/musica_metabench.sh

# Sonic Seasoning downloads docs, metadata, and the approximately 34 KB
# ratings/path table by default. Audio (~797 MB) and the code clone are opt-in.
SONIC_SEASONING_DOWNLOAD_HF=1 scripts/download/sonic_seasoning.sh
SONIC_SEASONING_CLONE_REPO=1 scripts/download/sonic_seasoning.sh

# Diamond Benchmark downloads its card, API metadata, and manifest by default.
# The approximately 340 MB audio snapshot is opt-in; upstream rights are unclear.
DIAMOND_BENCHMARK_DOWNLOAD_HF=1 scripts/download/diamond_benchmark.sh

# SyncBench downloads docs, metadata, and small score JSONs by default; the ~12.9 GB videos are opt-in.
SYNCBENCH_DOWNLOAD_HF=1 scripts/download/syncbench.sh
SYNCBENCH_CLONE_REPO=1 scripts/download/syncbench.sh

# video-SALMONN 2 downloads the approximately 3.5 MB annotations, evaluator,
# and official docs by default; the approximately 1.70 GB video snapshot is opt-in.
VIDEO_SALMONN2_DOWNLOAD_HF=1 scripts/download/video_salmonn2_caption.sh
VIDEO_SALMONN2_CLONE_REPO=1 scripts/download/video_salmonn2_caption.sh

# AVE-Compass downloads official docs/API metadata by default. Benchmark
# annotations and the approximately 442 MB full snapshot are separate opt-ins.
AVE_COMPASS_DOWNLOAD_METADATA=1 scripts/download/ave_compass.sh
AVE_COMPASS_DOWNLOAD_HF=1 scripts/download/ave_compass.sh

# Friend Bench downloads official docs/API metadata by default. The two JSONL
# tables and approximately 433 MB full snapshot are separate opt-ins.
FRIEND_BENCH_DOWNLOAD_METADATA=1 scripts/download/friend_bench.sh
FRIEND_BENCH_DOWNLOAD_HF=1 scripts/download/friend_bench.sh

# K9-Bench saves public first-party docs by default, then prints the manual
# auto-gated HF terms step. After accepting them, fetch only the ~1.8 MB table;
# the helper never downloads the linked YouTube videos.
K9BENCH_ACK_TERMS=1 K9BENCH_DOWNLOAD_METADATA=1 scripts/download/k9_bench.sh

# IFEval-Audio downloads official docs/metadata by default. Accept the gated HF terms before opting in.
IFEVAL_AUDIO_DOWNLOAD_HF=1 scripts/download/ifeval_audio.sh

# OmniVideoBench downloads public docs/API metadata by default. Apply for gated
# HF access before opting into the approximately 114 GB snapshot.
OMNIVIDEOBENCH_DOWNLOAD_HF=1 scripts/download/omnivideobench.sh
OMNIVIDEOBENCH_CLONE_REPO=1 scripts/download/omnivideobench.sh

# LVOmniBench downloads public docs/API metadata by default. Apply for gated
# HF access before opting into the approximately 187.4 GB snapshot.
LVOMNIBENCH_DOWNLOAD_HF=1 scripts/download/lvomnibench.sh
LVOMNIBENCH_CLONE_REPO=1 scripts/download/lvomnibench.sh

# SpurAudio downloads official docs/metadata by default; the approximately 7.69 GB snapshot is opt-in.
SPURAUDIO_DOWNLOAD_HF=1 scripts/download/spuraudio.sh
SPURAUDIO_CLONE_REPO=1 scripts/download/spuraudio.sh

# DHAuDS downloads docs and metadata for all four corruption benchmarks by
# default; select snapshots explicitly because they total about 50.0 GB.
DHAUDS_DOWNLOAD_HF=1 DHAUDS_DATASETS="SpeechCommandsV2-C" scripts/download/dhauds.sh
DHAUDS_DOWNLOAD_HF=1 DHAUDS_DATASETS="VocalSound-C ReefSet-C" scripts/download/dhauds.sh
DHAUDS_DOWNLOAD_HF=1 DHAUDS_DATASETS=all scripts/download/dhauds.sh
DHAUDS_CLONE_REPO=1 scripts/download/dhauds.sh

# Designed Vocalizations downloads docs and lightweight metadata by default;
# the approximately 37.1 GB embedded-audio snapshot is opt-in.
DESIGNED_VOCALIZATIONS_DOWNLOAD_HF=1 scripts/download/designed_vocalizations.sh

# Movie Gen Audio Bench downloads both prompt manifests and official terms by
# default; its approximately 8.05 GiB SFX and 8.08 GiB SFX+music archives are
# independent opt-ins.
MOVIE_GEN_AUDIO_DOWNLOAD_SFX=1 scripts/download/movie_gen_audio_bench.sh
MOVIE_GEN_AUDIO_DOWNLOAD_SFX_MUSIC=1 scripts/download/movie_gen_audio_bench.sh

# BackgroundMellow downloads docs, repository metadata, lightweight evaluation
# mappings, and aggregate ablations by default. The approximately 7.1 MB
# results sheet and 121 MB repository are independent opt-ins.
BACKGROUNDMELLOW_DOWNLOAD_RESULTS=1 scripts/download/backgroundmellow_cinematic_trailer_eval.sh
BACKGROUNDMELLOW_CLONE_REPO=1 scripts/download/backgroundmellow_cinematic_trailer_eval.sh

# Eating Sound Collection downloads public Kaggle metadata and baseline docs
# by default. The approximately 6.27 GiB archive requires an authenticated
# Kaggle CLI and explicit opt-in; review its YouTube source-media rights.
EATING_SOUND_COLLECTION_DOWNLOAD_DATA=1 scripts/download/eating_sound_collection.sh

# CoVoMix2 Dialogue downloads the paper, 1,000-row manifest, and provenance by
# default; cloning the small repository with all transcript files is opt-in.
COVOMIX2_DIALOGUE_CLONE_REPO=1 scripts/download/covomix2_dialogue.sh

# Silent Speech EMG downloads official metadata/docs by default; the public
# approximately 3.92 GB Zenodo corpus archive is checksum-verified and opt-in.
SILENT_SPEECH_EMG_DOWNLOAD_ARCHIVE=1 scripts/download/silent_speech_emg.sh

# JapanEEG downloads ds007808 metadata/provenance only. Select required files
# manually from the versioned OpenNeuro page; the full corpus is about 955 GB.
scripts/download/japaneeg.sh

# TFCL AFE downloads official docs and Hub metadata by default. Its ASVspoof
# 2019-derived processed audio and checkpoint are independent large opt-ins.
TFCL_AFE_DOWNLOAD_DATA=1 scripts/download/tfcl_afe.sh
TFCL_AFE_DOWNLOAD_CHECKPOINT=1 scripts/download/tfcl_afe.sh
TFCL_AFE_CLONE_REPO=1 scripts/download/tfcl_afe.sh

# ASD Benchmark downloads official protocol docs and repository metadata by
# default. Clone the small MIT evaluation toolkit explicitly; obtain each
# DCASE 2020-2025 Task 2 source release from its official challenge page.
ASD_BENCHMARK_CLONE_REPO=1 scripts/download/asd_benchmark.sh

# AVDC downloads docs and API metadata by default. The approximately 134 MiB
# caption/QA annotation snapshot and code repository are separate opt-ins;
# source videos are not included.
AVDC_DOWNLOAD_HF=1 scripts/download/avdc.sh
AVDC_CLONE_REPO=1 scripts/download/avdc.sh

# SpoofCeleb downloads public docs/API metadata by default. The approximately
# 268.3 GB snapshot requires author approval, accepted terms, and authentication.
SPOOFCELEB_ACK_TERMS=1 SPOOFCELEB_DOWNLOAD_HF=1 scripts/download/spoofceleb.sh

# LRRo downloads official metadata and documentation by default. The approximately 278 MiB archive is opt-in.
LRRO_DOWNLOAD_ARCHIVE=1 scripts/download/lrro.sh

# UrBAN downloads official docs/metadata only. Transfer the approximately
# 1.265 TB corpus manually from FRDR using its Globus workflow.
scripts/download/urban_beehive.sh

# PhysioNet/CinC 2016 saves official challenge/license pages by default.
# The approximately 190 MB public training archive is opt-in.
PHYSIONET_CINC_2016_DOWNLOAD_AUDIO=1 scripts/download/physionet_cinc_2016_heart_sound.sh

# RealDESED downloads official docs, metadata, and collection/annotation guides by default;
# the approximately 8.74 GB train, validation, and test archives are opt-in.
REALDESED_DOWNLOAD_AUDIO=1 REALDESED_PARTS="validation test" scripts/download/realdesed.sh
REALDESED_DOWNLOAD_AUDIO=1 REALDESED_PARTS=all scripts/download/realdesed.sh

# Kitchen20 downloads its split/source metadata and license by default.
# The approximately 325 MB audio and baseline repository clone is opt-in.
KITCHEN20_CLONE_REPO=1 scripts/download/kitchen20.sh

# Nonspeech7k downloads its official annotations and provenance list by default.
# The approximately 2.54 GB audio requires stricter record-term acknowledgment.
NONSPEECH7K_ACK_NONCOMMERCIAL=1 NONSPEECH7K_DOWNLOAD_AUDIO=1 scripts/download/nonspeech7k.sh

# TidyVoiceX saves public docs and prints the Mozilla Data Collective account/API path.
# It never accepts credentials or downloads the approximately 36.72 GB archive.
scripts/download/tidyvoice.sh

# SEABAD downloads official metadata by default. Its approximately 3.87 GiB
# archive retains per-recording source licenses and requires both opt-ins.
SEABAD_ACK_SOURCE_TERMS=1 SEABAD_DOWNLOAD_AUDIO=1 scripts/download/seabad.sh

# Synth-DoPaCo downloads official docs and API metadata by default. The public
# approximately 14.6 GB train/dev snapshot is opt-in; BeTraC test data is withheld.
SYNTH_DOPACO_DOWNLOAD_HF=1 scripts/download/synth_dopaco.sh

# MCIF downloads its small manifests, multilingual references, and official
# documentation by default. The approximately 7.58 GiB media snapshot is opt-in.
MCIF_DOWNLOAD_HF=1 scripts/download/mcif.sh

# WABAD downloads its record, metadata, annotations, and species list by default.
# Its 72 site archives total approximately 19.8 GiB and require explicit site IDs.
WABAD_DOWNLOAD_AUDIO=1 WABAD_SITES="ARD BAM" scripts/download/wabad.sh

# SpInt downloads its record, reconstruction script, and 2.7 MB metadata by default.
# The approximately 807 MiB noise and 3.08 GiB mask archives are opt-in.
SPINT_DOWNLOAD_ARCHIVES=1 SPINT_PARTS="noise masks" scripts/download/spint.sh

# RealMAN downloads official docs/API metadata by default. Its approximately
# 812 GB public Hugging Face snapshot is opt-in.
REALMAN_DOWNLOAD_HF=1 scripts/download/realman.sh

# ForestIR downloads official docs, license, repository metadata, and the paper
# by default. Clone the approximately 31 MB simulator/input repository explicitly.
FORESTIR_CLONE_REPO=1 scripts/download/forestir.sh

# MMAE downloads official docs/metadata by default; the approximately 4.43 GB
# Hugging Face audio snapshot and the evaluation-repo clone are separate opt-ins.
MMAE_DOWNLOAD_HF=1 scripts/download/mmae.sh
MMAE_CLONE_REPO=1 scripts/download/mmae.sh

# PazaBench downloads official leaderboard documentation and metadata only.
# Obtain each evaluation corpus separately under its upstream provider terms.
scripts/download/pazabench.sh

# Live Gurbani Captioning v1 downloads official docs/metadata by default; clone the small annotation/scorer repo explicitly.
LIVE_GURBANI_CAPTIONING_CLONE_REPO=1 scripts/download/live_gurbani_captioning_v1.sh

# StoryAD-QA downloads official docs, summary, evaluator, and repository metadata
# by default. Clone the approximately 8 MB annotation/scorer repository explicitly.
# The license is pending finalization and movie media is not included.
STORYAD_QA_CLONE_REPO=1 scripts/download/storyad_qa.sh

# LOCATA downloads official pages, docs, Zenodo metadata, and tool READMEs by default.
# The public corpus archives total about 19.3 GB and remain on the official Zenodo record.
LOCATA_CLONE_TOOLS=1 scripts/download/locata.sh

# AudibleLight downloads official cards and release metadata by default. Its
# approximately 57.1 GB Hugging Face repository snapshot is opt-in.
AUDIBLELIGHT_DOWNLOAD_HF=1 scripts/download/audiblelight_eigenmike32.sh

# Spatial LibriSpeech downloads official docs by default. Its ~365 MiB metadata
# and individual ambisonic speech/noise samples are separate opt-ins.
SPATIAL_LIBRISPEECH_DOWNLOAD_METADATA=1 scripts/download/spatial_librispeech.sh
SPATIAL_LIBRISPEECH_SAMPLE_ID=0 scripts/download/spatial_librispeech.sh
SPATIAL_LIBRISPEECH_SAMPLE_ID=0 SPATIAL_LIBRISPEECH_DOWNLOAD_NOISE_SAMPLE=1 scripts/download/spatial_librispeech.sh

# L3DAS22 downloads official docs and metadata by default. The 105.8 GB Kaggle
# dataset and the challenge repository are separate opt-ins; data requires an
# authenticated Kaggle CLI installation.
L3DAS22_CLONE_REPO=1 scripts/download/l3das22.sh
L3DAS22_DOWNLOAD_DATA=1 scripts/download/l3das22.sh

# TAU Spatial Sound Events 2019 downloads official docs and record metadata by
# default. The small development/evaluation labels are opt-in; audio stays on Zenodo.
TAU_SSE_2019_DOWNLOAD_METADATA=1 scripts/download/tau_spatial_sound_events_2019.sh

# TAU-NIGENS SSE 2020 downloads official docs by default. The small label
# archives are opt-in; its approximately 14.0 GB audio release stays on Zenodo.
TAU_NIGENS_SSE_2020_DOWNLOAD_METADATA=1 scripts/download/tau_nigens_sse_2020.sh

# TAU-NIGENS SSE 2021 downloads official docs by default. The small development
# labels are opt-in; its approximately 14.2 GiB audio release stays on Zenodo.
TAU_NIGENS_SSE_2021_DOWNLOAD_METADATA=1 scripts/download/tau_nigens_sse_2021.sh

# Ming-Freeform-Audio-Edit downloads official docs by default; the ~1.07 GB HF snapshot is opt-in.
MING_FREEFORM_AUDIO_EDIT_DOWNLOAD_HF=1 scripts/download/ming_freeform_audio_edit.sh
MING_FREEFORM_AUDIO_EDIT_CLONE_REPO=1 scripts/download/ming_freeform_audio_edit.sh

# CV3-Eval downloads official docs by default. Its roughly 760 MiB repo with audio is opt-in.
CV3_EVAL_CLONE_REPO=1 scripts/download/cv3_eval.sh

# TTS Multilingual Test Set downloads its official card by default; the ~7.3 MB snapshot is opt-in.
TTS_MULTILINGUAL_TEST_SET_DOWNLOAD_HF=1 scripts/download/tts_multilingual_test_set.sh

# CN-NewsTTS Bench downloads its public JSONL/schema/scorer/docs by default.
# Small core/transcript archives are optional; generated TTS audio is ~2.17 GB
# and requires acknowledging that provider/API terms may still apply.
CN_NEWS_TTS_BENCH_DOWNLOAD_CORE=1 scripts/download/cn_news_tts_bench.sh
CN_NEWS_TTS_BENCH_DOWNLOAD_TRANSCRIPTS=1 scripts/download/cn_news_tts_bench.sh
CN_NEWS_TTS_BENCH_ACK_PROVIDER_TERMS=1 CN_NEWS_TTS_BENCH_DOWNLOAD_AUDIO=1 scripts/download/cn_news_tts_bench.sh

# PodEval downloads official docs and its 51-topic Real-Pod link manifest by default.
# Cloning adds the MIT evaluation toolkit but does not download third-party podcast audio.
PODEVAL_CLONE_REPO=1 scripts/download/podeval.sh

# AV-SpeakerBench downloads official docs by default; the approximately 123 GB HF snapshot is opt-in.
AV_SPEAKERBENCH_DOWNLOAD_HF=1 scripts/download/av_speakerbench.sh
AV_SPEAKERBENCH_CLONE_REPO=1 scripts/download/av_speakerbench.sh

# AVUT downloads docs and annotation JSON by default; its approximately 24.0 GB HF snapshot is opt-in.
AVUT_DOWNLOAD_HF=1 scripts/download/avut.sh

# DAVE downloads its cards, loader, and ~9 MB JSON annotations by default.
# The full ~113.3 GB HF snapshot is opt-in and retains upstream media terms.
DAVE_DOWNLOAD_HF=1 scripts/download/dave.sh

# Daily-Omni downloads docs and QA metadata by default; its approximately 3.9 GB media snapshot is opt-in.
DAILY_OMNI_DOWNLOAD_HF=1 scripts/download/daily_omni.sh
DAILY_OMNI_CLONE_REPO=1 scripts/download/daily_omni.sh

# WorldSense downloads docs and QA metadata by default; its approximately 18.1 GB archive snapshot is opt-in.
WORLDSENSE_DOWNLOAD_HF=1 scripts/download/worldsense.sh
WORLDSENSE_CLONE_REPO=1 scripts/download/worldsense.sh

# MMOU downloads official cards and API metadata by default. The approximately
# 48 MB annotation release and 322.8 GB community-hosted videos are separate opt-ins.
MMOU_DOWNLOAD_ANNOTATIONS=1 scripts/download/mmou.sh
MMOU_DOWNLOAD_VIDEOS=1 scripts/download/mmou.sh

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

# KSC2 downloads official pages, cards, API metadata, and repository
# documentation by default. Its approximately 80.8 GB multipart snapshot is opt-in.
KSC2_DOWNLOAD_HF=1 scripts/download/ksc2.sh

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

# OpenSTBench downloads docs and paired-set metadata by default. The toolkit and approximately 511 MiB paired set are separate opt-ins.
OPENSTBENCH_CLONE_REPO=1 scripts/download/openstbench.sh
OPENSTBENCH_DOWNLOAD_PAIRED_SET=1 scripts/download/openstbench.sh

# RealSI downloads docs and 20 lightweight JSON annotations by default. Cloning the repository and its approximately 351 MiB WAV payload is opt-in.
REALSI_CLONE_REPO=1 scripts/download/realsi.sh

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

# Earnings-21 downloads docs and lightweight metadata by default. The roughly 770 MB media tree is opt-in.
EARNINGS21_SPARSE_CHECKOUT=1 scripts/download/earnings_21.sh

# Earnings25 downloads the paper and Zenodo metadata by default. The single
# approximately 12.0 GB archive includes audio governed by upstream terms.
EARNINGS25_ACK_AUDIO_TERMS=1 EARNINGS25_DOWNLOAD_ARCHIVE=1 scripts/download/earnings25.sh

# Indic DiarBench downloads official paper and dataset metadata by default. The approximately 30.3 GB HF snapshot is opt-in.
INDIC_DIARBENCH_DOWNLOAD_HF=1 scripts/download/indic_diarbench.sh

# LFR Benchmarking Dataset Factory downloads public pipeline documentation and
# lightweight annotation-column metadata only. The toolkit clone is opt-in;
# source child recordings require corpus-specific access and are never fetched.
LFR_FACTORY_CLONE_TOOLKIT=1 scripts/download/lfr_benchmarking_factory.sh

# StanceBench downloads official docs and lightweight stance definitions by default.
# The 9.8k-row interaction mapping is opt-in; obtain Seamless Interaction audio separately.
STANCEBENCH_DOWNLOAD_INTERACTION_MAP=1 scripts/download/stancebench.sh

# MMAU downloads both test-mini and test by default.
MMAU_TEST=0 scripts/download/mmau.sh

# MMAU-Pro downloads official docs, evaluator, and metadata by default. The approximately 47.5 GB HF snapshot is opt-in.
MMAU_PRO_DOWNLOAD_HF=1 scripts/download/mmau_pro.sh

# AIR-Bench downloads official docs by default. The HF audio snapshot is large and opt-in.
AIR_BENCH_DOWNLOAD_HF=1 scripts/download/air_bench.sh
AIR_BENCH_CLONE_REPO=1 scripts/download/air_bench.sh

# MUSIC-AVQA downloads official docs and JSON annotations by default. Raw videos are manual/large.
MUSIC_AVQA_CLONE_REPO=1 scripts/download/music_avqa.sh

# MUSIC-AVQA-R downloads docs/tree metadata by default. Its roughly 90 MB annotation/code repository is opt-in.
MUSIC_AVQA_R_CLONE_REPO=1 scripts/download/music_avqa_r.sh

# MUSIC-AVQA-v2.0 downloads docs and the video manifest by default. QA JSONs are an opt-in clone; video is manual.
MUSIC_AVQA_V2_CLONE_REPO=1 scripts/download/music_avqa_v2.sh

# LLP downloads official docs and all annotation CSVs by default. Features are a manual Drive download.
LLP_CLONE_REPO=1 scripts/download/llp.sh

# HI-MIA downloads the OpenSLR page and filename mapping by default. Archives are large and opt-in.
HIMIA_DOWNLOAD_ARCHIVES=1 HIMIA_PARTS="dev test_v2" scripts/download/hi_mia.sh
HIMIA_OPENSLR_BASE_URL=https://openslr.elda.org/resources/85 HIMIA_DOWNLOAD_ARCHIVES=1 scripts/download/hi_mia.sh

# RUL-MuchoMusic can also pull the upstream MuChoMusic CSV.
RUL_DOWNLOAD_UPSTREAM_MUCHOMUSIC=1 scripts/download/rul_muchomusic.sh

# EMOPIA downloads official docs and metadata by default. The small MIDI archive is opt-in and checksum-verified.
EMOPIA_DOWNLOAD_DATA=1 scripts/download/emopia.sh

# POP909 downloads official docs, metadata, and the song index by default. The MIDI/annotation repository clone is opt-in.
POP909_CLONE_REPO=1 scripts/download/pop909.sh

# MusicNet downloads Zenodo metadata by default. MIDI and the large audio/label archive are opt-in.
MUSICNET_DOWNLOAD_MIDIS=1 scripts/download/musicnet.sh
MUSICNET_DOWNLOAD_AUDIO=1 scripts/download/musicnet.sh

# MedleyDB downloads official pages and repo docs by default. Zenodo checks, sample archive, and repo clone are opt-in; full audio is request gated.
MEDLEYDB_CHECK_ZENODO=1 scripts/download/medleydb.sh
MEDLEYDB_DOWNLOAD_SAMPLE=1 scripts/download/medleydb.sh
MEDLEYDB_CLONE_REPO=1 scripts/download/medleydb.sh

# DSD100 saves the official page and parser docs/license by default.
# The approximately 14.9 GB archive retains source-track-specific terms and is opt-in.
DSD100_DOWNLOAD_ARCHIVE=1 scripts/download/dsd100.sh
DSD100_CLONE_PARSER=1 scripts/download/dsd100.sh

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

# Codec-SUPERB downloads official docs by default. Its approximately 3.2 GB
# public tiny snapshot and the evaluation repository are separate opt-ins.
CODEC_SUPERB_DOWNLOAD_HF=1 scripts/download/codec_superb.sh
CODEC_SUPERB_CLONE_REPO=1 scripts/download/codec_superb.sh

# HEAR downloads Zenodo metadata/license and eval-kit docs by default. Task archives are large and opt-in.
HEAR_DOWNLOAD_TASKS=1 HEAR_TASKS=hear2021-mridangam_tonic-v1.5-full-48000.tar.gz scripts/download/hear.sh
HEAR_CLONE_EVAL_KIT=1 scripts/download/hear.sh

# Dynamic-SUPERB downloads official docs by default. Clone the repo with opt-in.
DYNAMIC_SUPERB_CLONE_REPO=1 scripts/download/dynamic_superb.sh

# MAEB downloads the MTEB docs, license, API metadata, and benchmark registry
# by default. Clone the MTEB source only with opt-in; component data is separate.
MAEB_CLONE_MTEB=1 scripts/download/maeb.sh

# MIR-1K defaults to the Figshare mirror because the MIR Lab archive currently 404s.
MIR1K_SOURCE=official scripts/download/mir_1k_vocal.sh

# ESC-50 defaults to the official GitHub archive.
ESC50_ARCHIVE_URL='https://...' scripts/download/esc_50.sh

# DCASE 2024 Task 5 downloads record metadata, class maps, and annotation-only
# archives by default. Development and evaluation waveforms total about 23.4 GiB.
DCASE2024_TASK5_DOWNLOAD_AUDIO=1 scripts/download/dcase2024_task5.sh

# MAESTRO Real downloads official docs/license and soft-label annotations by
# default. The approximately 2.43 GiB development audio archive is opt-in.
MAESTRO_REAL_DOWNLOAD_AUDIO=1 scripts/download/maestro_real.sh

# TUT Sound Events 2017 downloads both releases' docs and annotations by
# default. The approximately 1.55 GiB of development/evaluation audio is opt-in.
TUT_SOUND_EVENTS_2017_DOWNLOAD_AUDIO=1 scripts/download/tut_sound_events_2017.sh

# DCASE 2025 Task 5 AudioQA is auto-approved gated on Hugging Face. The helper
# saves public metadata and prints the login/acceptance flow; it downloads no audio.
scripts/download/dcase2025_audioqa.sh

# ADQA-Bench downloads official docs, both the benchmark and DCASE 2026 task-
# summary papers, and the no-answer JSONL by default. The approximately 2.94 GB
# Hugging Face audio snapshot is opt-in.
ADQA_BENCH_DOWNLOAD_HF=1 scripts/download/adqa_bench.sh

# AudioGrounding downloads official docs, record metadata, and approximately
# 5.2 MB of phrase-interval annotations by default. Its 2.33 GiB audio archive
# is opt-in.
AUDIOGROUNDING_DOWNLOAD_AUDIO=1 scripts/download/audiogrounding.sh

# TimeGround-1M downloads its official card, API metadata, paper page, and
# model card by default. The approximately 1.50 TB Hugging Face snapshot is
# opt-in; prefer streaming a required config/split.
TIMEGROUND_1M_DOWNLOAD_HF=1 scripts/download/timeground_1m.sh

# Clotho-Moment downloads project, dataset, paper, and license metadata by
# default. The large 51,240-recording WebDataset snapshot is opt-in.
CLOTHO_MOMENT_DOWNLOAD_HF=1 scripts/download/clotho_moment.sh

# CASTELLA downloads the six lightweight English/Japanese annotation JSONs and
# official metadata by default. CLAP features (~2.78 GB on HF) and the
# unlicensed raw-media reconstruction tools are separate opt-ins.
CASTELLA_DOWNLOAD_FEATURES=1 scripts/download/castella.sh
CASTELLA_CLONE_AUDIO_TOOLS=1 scripts/download/castella.sh

# UrbanSound8K is a 6 GiB archive. The helper downloads it only when opted in.
URBANSOUND8K_DOWNLOAD_AUDIO=1 scripts/download/urbansound8k.sh
URBANSOUND8K_EXTRACT=1 URBANSOUND8K_DOWNLOAD_AUDIO=1 scripts/download/urbansound8k.sh

# TAU ASC 2019 downloads doc/meta ZIPs by default. Audio is split across 21 large shards.
TAU_ASC2019_DOWNLOAD_AUDIO=1 scripts/download/tau_asc_2019.sh
TAU_ASC2019_DOWNLOAD_AUDIO=1 TAU_ASC2019_AUDIO_PARTS="1 2 21" scripts/download/tau_asc_2019.sh

# TAU ASC 2020 Mobile downloads doc/meta ZIPs by default. Audio is split across large archives.
TAU_ASC2020_DOWNLOAD_DEV_AUDIO=1 scripts/download/tau_asc_2020_mobile.sh
TAU_ASC2020_DOWNLOAD_EVAL_AUDIO=1 scripts/download/tau_asc_2020_mobile.sh

# TAU ASC 2022/2025 downloads record JSON plus doc/meta ZIPs by default.
# Development (16 audio parts) and evaluation (12 parts) are separate opt-ins.
TAU_ASC2022_DOWNLOAD_DEV_AUDIO=1 scripts/download/tau_asc_2022_mobile.sh
TAU_ASC2022_DOWNLOAD_EVAL_AUDIO=1 scripts/download/tau_asc_2022_mobile.sh

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

# DataSED downloads official metadata and provenance pages by default.
# Its approximately 4.20 GiB audio-and-annotations archive is opt-in.
DATASED_DOWNLOAD_AUDIO=1 scripts/download/datased.sh

# SONYC-UST-V2 downloads annotations/taxonomy by default. Audio is split into 19 large shards.
SONYC_UST_V2_DOWNLOAD_AUDIO=1 SONYC_UST_V2_AUDIO_PARTS="audio-0.tar.gz audio-18.tar.gz" scripts/download/sonyc_ust_v2.sh
SONYC_UST_V2_DOWNLOAD_AUDIO=1 SONYC_UST_V2_AUDIO_PARTS=all scripts/download/sonyc_ust_v2.sh

# VoxCeleb downloads small OpenSLR metadata/trial lists only.
VOXCELEB_OPENSLR_BASE_URL=https://openslr.elda.org/resources/49 scripts/download/voxceleb.sh

# POLY-SIM downloads official docs only. Drive-hosted data remains manual.
POLYSIM2026_CLONE_REPO=1 scripts/download/polysim_2026.sh

# VoxBlink2 downloads official docs/license only. The Drive resource bundle is manual;
# repository code and evaluation protocols can be cloned explicitly without source media.
VOXBLINK2_CLONE_REPO=1 scripts/download/voxblink2.sh

# VoxConverse clones official RTTM annotations by default. WAV ZIPs are large and opt-in.
VOXCONVERSE_DOWNLOAD_AUDIO=1 VOXCONVERSE_AUDIO_SPLITS=dev scripts/download/voxconverse.sh
VOXCONVERSE_DOWNLOAD_AUDIO=1 VOXCONVERSE_AUDIO_SPLITS="dev test" scripts/download/voxconverse.sh

# ASVspoof 2015 downloads metadata/evaluation docs by default. Protocols and the approximately 24.1 GB audio are opt-in.
ASVSPOOF2015_DOWNLOAD_PROTOCOLS=1 scripts/download/asvspoof_2015.sh
ASVSPOOF2015_DOWNLOAD_AUDIO=1 scripts/download/asvspoof_2015.sh

# ASVspoof 2017 V2 downloads metadata/evaluation docs by default. Protocols and the approximately 1.4 GiB audio are opt-in.
ASVSPOOF2017_DOWNLOAD_PROTOCOLS=1 scripts/download/asvspoof_2017.sh
ASVSPOOF2017_DOWNLOAD_AUDIO=1 scripts/download/asvspoof_2017.sh

# ASVspoof 2019 downloads README/license/evaluation docs by default. LA/PA are large and opt-in.
ASVSPOOF2019_DOWNLOAD_ARCHIVES=1 ASVSPOOF2019_PARTS=LA scripts/download/asvspoof_2019.sh
ASVSPOOF2019_DOWNLOAD_ARCHIVES=1 ASVSPOOF2019_PARTS="LA PA" scripts/download/asvspoof_2019.sh

# ADD 2022 downloads official challenge and Zenodo metadata by default. Its
# six records total approximately 49.5 GB; select records explicitly.
ADD2022_DOWNLOAD_ARCHIVES=1 ADD2022_RECORDS="adaptation track1" scripts/download/add_2022.sh

# ADD 2023 downloads official challenge, paper, and eight Zenodo metadata
# records by default. Its approximately 65.4 GB release is opt-in.
ADD2023_DOWNLOAD_ARCHIVES=1 ADD2023_RECORDS="track1_1 track2_eval" scripts/download/add_2023.sh

# Codecfake downloads official paper/repository documentation and all six
# Zenodo metadata records by default. Its approximately 172.7 GB release is
# CC BY-NC-ND 4.0; select records explicitly.
CODECFAKE_DOWNLOAD_ARCHIVES=1 CODECFAKE_RECORDS="dev test_unseen" scripts/download/codecfake.sh

# DFADD downloads official paper/repository/dataset metadata by default. The
# approximately 28.6 GB dataset-viewer snapshot and corrected component ZIPs
# are separate explicit opt-ins.
DFADD_DOWNLOAD_HF=1 scripts/download/dfadd.sh
DFADD_DOWNLOAD_ZIPS=1 scripts/download/dfadd.sh

# DiffSSD downloads its official card, license, input texts, and approximately
# 8.2 MiB split manifest by default. Synthetic audio is approximately 16.9 GiB
# and opt-in; real LJ Speech/LibriSpeech files are obtained separately.
DIFFSSD_DOWNLOAD_AUDIO=1 scripts/download/diffssd.sh

# Fake-or-Real saves the official owner page by default. Select one or more
# approximately 1.0-7.7 GiB archives explicitly; no dataset license is stated.
FAKE_OR_REAL_DOWNLOAD_ARCHIVES=1 FAKE_OR_REAL_VERSIONS="2sec" scripts/download/fake_or_real.sh

# ASVspoof 2021 downloads evaluation plan and keys/metadata by default. LA/PA/DF speech archives are large and opt-in.
ASVSPOOF2021_DOWNLOAD_ARCHIVES=1 ASVSPOOF2021_PARTS=LA scripts/download/asvspoof_2021.sh
ASVSPOOF2021_DOWNLOAD_ARCHIVES=1 ASVSPOOF2021_PARTS="PA DF" ASVSPOOF2021_PA_PARTS="00 01" ASVSPOOF2021_DF_PARTS="00" scripts/download/asvspoof_2021.sh

# PartialEdit downloads official pages and Zenodo record metadata by default.
# Its approximately 7.7 MB protocol/text metadata and 21.9 GB audio are separate opt-ins.
PARTIALEDIT_DOWNLOAD_METADATA=1 scripts/download/partialedit.sh
PARTIALEDIT_DOWNLOAD_AUDIO=1 PARTIALEDIT_PARTS="E1 E1-Codec" scripts/download/partialedit.sh

# VoxENES 2026 downloads official Kaggle metadata and the paper page by default. The approximately 23.3 GB dataset is opt-in.
VOXENES2026_DOWNLOAD_DATA=1 scripts/download/voxenes_2026.sh

# Soroll-IA downloads official metadata, the paper, and benchmark docs by default.
# The approximately 2.17 GB CC BY-NC 4.0 Kaggle dataset is opt-in.
SOROLL_IA_DOWNLOAD_DATA=1 scripts/download/soroll_ia.sh

# VoxLingua107 downloads HF metadata by default. The mirrored dataset snapshot is opt-in.
VOXLINGUA107_DOWNLOAD_HF=1 scripts/download/voxlingua107.sh

# Speech Commands defaults to the official v0.02 archive, about 2.37 GiB.
SPEECH_COMMANDS_VERSION=v0.01 scripts/download/speech_commands.sh

# MSWC saves official docs by default. Language archives are opt-in; audio can be many GiB.
MSWC_DOWNLOAD_ARCHIVES=1 MSWC_LANGS="ta vi" MSWC_PARTS="splits alignments" scripts/download/mswc.sh
MSWC_DOWNLOAD_ARCHIVES=1 MSWC_LANGS=ta MSWC_PARTS=audio scripts/download/mswc.sh

# AudioMNIST downloads README/LICENSE/speaker metadata by default. Full repo clone is opt-in.
AUDIO_MNIST_DOWNLOAD_REPO=1 scripts/download/audio_mnist.sh

# PVQD downloads official metadata by default. Ratings/docs and the complete approximately 514.5 MiB clinical-voice release are separate opt-ins.
PVQD_DOWNLOAD_ANNOTATIONS=1 scripts/download/pvqd.sh
PVQD_DOWNLOAD_ALL=1 scripts/download/pvqd.sh

# TORGO downloads official docs by default. Large speaker-group archives require terms acknowledgment and explicit selection.
TORGO_ACK_TERMS=1 TORGO_ARCHIVES=F scripts/download/torgo.sh
TORGO_ACK_TERMS=1 TORGO_ARCHIVES=F,FC,M,MC scripts/download/torgo.sh

# CDSD saves the owner access page, blank agreement, and paper metadata, then
# stops at the signed-agreement and approval step. It never submits the form.
scripts/download/cdsd.sh

# UME-ERJ saves the official NII/SRC record and evaluation-paper metadata, then
# stops at the usage-pledge and review step. It never submits an application.
scripts/download/ume_erj.sh

# UME-JRF saves the official NII/SRC record and evaluation-paper metadata, then
# stops at the usage-pledge and review step. It never submits an application.
scripts/download/ume_jrf.sh

# EMO-SUPERB downloads official benchmark docs by default. The evaluation repository clone is opt-in; component corpus audio remains manual/EULA-gated.
EMO_SUPERB_CLONE_REPO=1 scripts/download/emo_superb.sh

# VocalSound downloads official README/repo metadata by default. Archives are 1.7 GiB or 4.5 GiB and opt-in.
VOCALSOUND_DOWNLOAD_ARCHIVE=1 VOCALSOUND_SAMPLE_RATE=16k scripts/download/vocalsound.sh
VOCALSOUND_DOWNLOAD_ARCHIVE=1 VOCALSOUND_SAMPLE_RATE=44k scripts/download/vocalsound.sh

# VocalSet saves Zenodo metadata by default. The 2.1 GiB singing voice archive is opt-in.
VOCALSET_DOWNLOAD_ARCHIVE=1 scripts/download/vocalset.sh

# EmoV-DB downloads OpenSLR/GitHub docs by default. Speech archives are opt-in.
EMOV_DB_DOWNLOAD_ARCHIVES=1 EMOV_DB_PARTS="bea_Neutral.tar.gz sam_Neutral.tar.gz" scripts/download/emov_db.sh
EMOV_DB_OPENSLR_BASE_URL=https://openslr.elda.org/resources/115 EMOV_DB_DOWNLOAD_ARCHIVES=1 scripts/download/emov_db.sh

# Androids Corpus downloads official docs by default. The 3.69 GB academic-only archive requires explicit terms acknowledgment.
ANDROIDS_CORPUS_ACK_TERMS=1 ANDROIDS_CORPUS_DOWNLOAD_DATA=1 scripts/download/androids_corpus.sh

# RAVDESS saves Zenodo metadata by default. Audio-only archives are opt-in.
RAVDESS_DOWNLOAD_AUDIO=1 scripts/download/ravdess.sh

# TESS saves official Borealis metadata by default. The complete 2,800-file ZIP is opt-in.
TESS_DOWNLOAD_AUDIO=1 scripts/download/tess.sh

# CREMA-D saves README/license/CSV metadata by default. Full media needs Git LFS and is opt-in.
CREMAD_DOWNLOAD_MEDIA=1 scripts/download/crema_d.sh
CREMAD_REPO_URL=https://github.com/CheyneyComputerScience/CREMA-D.git CREMAD_DOWNLOAD_MEDIA=1 scripts/download/crema_d.sh

# MELD downloads official project metadata by default. Raw media and feature/model tarballs are opt-in.
MELD_DOWNLOAD_RAW=1 scripts/download/meld.sh
MELD_DOWNLOAD_FEATURES=1 scripts/download/meld.sh
MELD_BASE_URL=https://huggingface.co/datasets/declare-lab/MELD/resolve/main scripts/download/meld.sh

# CH-SIMS downloads official paper/repository metadata by default. Dataset files remain a manual Drive download; the MMSA toolkit clone is opt-in.
CH_SIMS_CLONE_TOOLKIT=1 scripts/download/ch_sims.sh

# CH-SIMS v2 saves official project, repository, and paper metadata by default.
# Supervised and unlabeled releases remain manual Drive downloads; the code clone is opt-in.
CH_SIMS_V2_CLONE_REPO=1 scripts/download/ch_sims_v2.sh

# IEMOCAP is form-gated by USC SAIL. The helper prints official request steps.
scripts/download/iemocap.sh

# Aff-Wild2 requires a signed role-specific EULA and institutional-email request.
# The helper prints the current owner-controlled access steps without fetching data.
scripts/download/aff_wild2.sh

# MSP-Podcast is institution/form-gated. The helper prints the official academic access steps.
scripts/download/msp_podcast.sh

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

# CHiME-4 saves official public documentation, then prints the LDC2017S24 and
# licensed-WSJ0 access requirements. It never downloads licensed audio.
scripts/download/chime_4.sh

# CHiME-6 downloads transcriptions/floorplans by default. Audio archives are large.
CHIME6_DOWNLOAD_AUDIO=1 CHIME6_PARTS="CHiME6_dev.tar.gz CHiME6_eval.tar.gz" scripts/download/chime_6.sh
CHIME6_OPENSLR_BASE_URL=https://openslr.elda.org/resources/150 scripts/download/chime_6.sh

# CHiME-7 DASR saves public task/baseline docs, then prints the separate
# CHiME and LDC/Mixer 6 access steps required to assemble the benchmark.
scripts/download/chime_7_dasr.sh

# NOTSOFAR-1 downloads official docs/licenses only. Clone the official baseline
# to use its versioned subset downloader; never snapshot the full HF history.
NOTSOFAR1_CLONE_REPO=1 scripts/download/notsofar_1.sh

# AliMeeting downloads OpenSLR metadata by default. Corpus archives are large.
ALIMEETING_DOWNLOAD_ARCHIVES=1 ALIMEETING_PARTS="Eval_Ali.tar.gz Test_Ali.tar.gz" scripts/download/alimeeting.sh

# AISHELL-4 downloads OpenSLR and baseline docs by default. The roughly 51.2 GB corpus is opt-in.
AISHELL4_DOWNLOAD_ARCHIVES=1 AISHELL4_PARTS="test.tar.gz" scripts/download/aishell_4.sh
AISHELL4_DOWNLOAD_ARCHIVES=1 AISHELL4_PARTS=all scripts/download/aishell_4.sh

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

# SOMOS saves official pages and Zenodo metadata by default. The 3.70 GiB archive is opt-in.
SOMOS_DOWNLOAD_ARCHIVE=1 scripts/download/somos.sh

# QualiSpeech downloads docs, scripts, annotations, and BVCC filename lists by
# default. The approximately 1.46 GiB non-BVCC WAV archive is opt-in; obtain
# BVCC separately under its original terms before running merge_data.sh.
QUALISPEECH_DOWNLOAD_AUDIO=1 scripts/download/qualispeech.sh

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

# RUBATO downloads the Zenodo record and 83 KB version metadata by default.
RUBATO_DOWNLOAD_ARCHIVE=1 scripts/download/rubato.sh

# MulTTiPop downloads docs and lightweight dev/test manifests by default.
# Its released snapshot contains MIDI/metadata, not the referenced source audio.
MULTTIPOP_DOWNLOAD_HF=1 scripts/download/multtipop.sh

# SingMOS-Pro downloads docs plus split/system metadata by default.
# Rating/sample annotations are about 11.6 MB; the full snapshot is about 2.83 GB.
SINGMOS_PRO_DOWNLOAD_ANNOTATIONS=1 scripts/download/singmos_pro.sh
SINGMOS_PRO_DOWNLOAD_HF=1 scripts/download/singmos_pro.sh

# AI-Generated Cover Song Diagnostics downloads its public score, manifest,
# feature tables, README, and MIT license. Raw cover audio is not released.
scripts/download/ai_cover_song_diagnostics.sh
AI_COVER_SONG_DIAGNOSTICS_CLONE_REPO=1 scripts/download/ai_cover_song_diagnostics.sh

# MADB downloads official docs and repository metadata by default.
# Annotation tables are about 69 MB; the HF snapshot is about 18.6 GB.
MADB_DOWNLOAD_ANNOTATIONS=1 scripts/download/madb.sh
MADB_DOWNLOAD_HF=1 scripts/download/madb.sh

# Concerto Accompaniment Benchmark downloads public metadata and downbeat
# annotations by default. The code clone is opt-in; commercial orchestra
# recordings and absent solo-piano audio are never downloaded.
CONCERTO_ACCOMPANIMENT_CLONE_REPO=1 scripts/download/concerto_accompaniment_benchmark.sh

# Lyra-SA saves the official Tencent Music pages and SongSQA paper, then prints
# the application form. The archive URL is emailed after approval.
scripts/download/lyra_sa.sh

# Audiobook Narration Appeal downloads the public 8,854-row metadata CSV,
# official paper/supplement, documentation, and license. It does not download
# separately hosted LibriVox audiobook recordings.
scripts/download/audiobook_narration_appeal.sh

# Single-Item Kawaii Measure saves the paper by default. The public workbook
# contains participant-level ratings, states no data license, and bundles no audio.
SINGLE_ITEM_KAWAII_ACK_UNSPECIFIED_LICENSE=1 SINGLE_ITEM_KAWAII_DOWNLOAD_XLSX=1 scripts/download/single_item_kawaii_measure.sh

# ADReSS and ADReSSo save public challenge/access documentation, then print
# the DementiaBank membership path. Clinical recordings stay password protected.
scripts/download/adress_challenges.sh

# DAIC-WOZ / E-DAIC saves USC ICT documentation and primary paper pages, then
# prints the separate owner application routes. No clinical data is fetched.
scripts/download/daic_woz.sh

# DementiaBank Pitt saves public corpus/access documentation, then prints the
# membership path. It never authenticates or downloads clinical recordings.
scripts/download/dementiabank_pitt.sh

# SmartGlasses Challenge 2026 saves the official challenge page, public
# evaluation-toolkit metadata, and paper. Corpus links were emailed only to
# registered teams; registration is closed and no public corpus URL is listed.
scripts/download/smartglasses_challenge_2026.sh

# NSynth downloads the official page by default. Archives are large and opt-in.
NSYNTH_DOWNLOAD_ARCHIVES=1 NSYNTH_SPLITS=test NSYNTH_FORMAT=jsonwav scripts/download/nsynth.sh
NSYNTH_DOWNLOAD_ARCHIVES=1 NSYNTH_SPLITS="valid test" NSYNTH_FORMAT=tfrecord scripts/download/nsynth.sh

# Surge Pitch saves the official Zenodo record and papers by default; the
# approximately 7.58 GB synthesized-audio tar archive is opt-in.
SURGE_PITCH_DOWNLOAD_ARCHIVE=1 scripts/download/surge_pitch.sh

# MAESTRO downloads v3.0.0 metadata by default. MIDI and audio archives are opt-in.
MAESTRO_DOWNLOAD_MIDI=1 scripts/download/maestro.sh
MAESTRO_DOWNLOAD_AUDIO=1 scripts/download/maestro.sh
MAESTRO_BASE_URL=https://storage.googleapis.com/magentadata/datasets/maestro/v3.0.0 scripts/download/maestro.sh

# MUSDB18 saves official pages by default. Large archives require terms acknowledgement and opt-in.
MUSDB18_ACK_TERMS=1 MUSDB18_DOWNLOAD_ARCHIVE=1 scripts/download/musdb18.sh
MUSDB18_ACK_TERMS=1 MUSDB18_DOWNLOAD_HQ=1 scripts/download/musdb18.sh

# MSRBench saves official documentation and metadata by default. Select one
# large CC BY-NC 4.0 instrument ZIP explicitly; the full Hub repo is ~28.4 GB.
MSRBENCH_STEM=Vocals scripts/download/msrbench.sh
MSRBENCH_STEM="Orchestral Elements" scripts/download/msrbench.sh
MSRBENCH_CLONE_TOOLKIT=1 scripts/download/msrbench.sh

# MSMD downloads official repository, paper, release, and recent score-following
# metadata by default. Its approximately 9.56 GB original feature archive and
# 1.92 GB score-following NPZ/WAV package are opt-in.
MSMD_DOWNLOAD_ARCHIVES=1 MSMD_PARTS="score_following" scripts/download/msmd.sh
MSMD_DOWNLOAD_ARCHIVES=1 MSMD_PARTS="original score_following" scripts/download/msmd.sh

# Slakh2100 downloads the official page and slakh-utils README/LICENSE by default.
SLAKH_CHECK_ZENODO=1 scripts/download/slakh2100.sh
SLAKH_CLONE_UTILS=1 scripts/download/slakh2100.sh
SLAKH_CLONE_GENERATION=1 scripts/download/slakh2100.sh

# MoisesDB saves the official release page and repository docs by default. Audio uses the official browser download flow.
MOISESDB_CLONE_REPO=1 scripts/download/moisesdb.sh

# LibriMix clones the official generator/metadata repo by default. Generation is very large.
LIBRIMIX_RUN_GENERATION=1 LIBRIMIX_STORAGE_DIR=/large/storage scripts/download/librimix.sh

# LibriCSS saves official docs by default. The direct dataset archive is about 5.97 GiB.
LIBRICSS_DOWNLOAD_ARCHIVE=1 scripts/download/libricss.sh

# FUSS saves official docs and its small license archive by default. Select multi-GB archives explicitly.
FUSS_DOWNLOAD_ARCHIVES=1 FUSS_PARTS="ssdata_reverb" scripts/download/fuss.sh
FUSS_DOWNLOAD_ARCHIVES=1 FUSS_PARTS="ssdata rir_data" scripts/download/fuss.sh

# WSJ0-2mix downloads MERL public pages/scripts by default. Actual mixture generation requires local licensed WSJ0 access.
WSJ0_2MIX_CLONE_PYTHON_REPO=1 scripts/download/wsj0_2mix.sh
WSJ0_2MIX_RUN_GENERATION=1 WSJ0_PATH=/path/to/wsj0 WSJ0_2MIX_OUTPUT=/large/storage/wsj0-mix scripts/download/wsj0_2mix.sh

# VCTK downloads the official README and license by default. The corpus ZIP is large and opt-in.
VCTK_DOWNLOAD_ARCHIVE=1 scripts/download/vctk.sh
VCTK_ARCHIVE_URL=https://datashare.ed.ac.uk/bitstreams/535f4286-e54c-4038-838c-a02285e32cb2/download scripts/download/vctk.sh

# DuplexChat downloads documentation and manifest counts by default. The
# approximately 791.5 MB metadata snapshot and toolkit clone are separate
# opt-ins; the release does not redistribute referenced podcast audio.
DUPLEXCHAT_DOWNLOAD_HF=1 scripts/download/duplexchat.sh
DUPLEXCHAT_CLONE_TOOLKIT=1 scripts/download/duplexchat.sh

# BioTalk-3D downloads official lightweight documentation only. The 18.05 GB
# multimodal package is hosted on Baidu Netdisk and must be obtained manually
# with extraction code em25; redistribution is prohibited by its custom terms.
scripts/download/biotalk_3d.sh

# AV-GC-AAD saves the official Zenodo metadata and README by default. Its
# approximately 2.04 GB of participant MAT files require explicit selection.
AV_GC_AAD_DOWNLOAD_DATA=1 AV_GC_AAD_SUBJECTS="01 14" scripts/download/av_gc_aad.sh

# IMDA NSC downloads the official page, paper, and public-mirror metadata by
# default. Official audio access requires registration and Dropbox; the
# multi-terabyte third-party mirror is a separate explicit opt-in.
IMDA_NSC_DOWNLOAD_MIRROR=1 scripts/download/imda_nsc.sh
```
