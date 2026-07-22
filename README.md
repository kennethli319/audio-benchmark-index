# Audio Benchmark Index

A living index of speech, audio, music, and multimodal audio benchmarks.

**Browse the public, searchable index:**
[kennethli319.github.io/audio-benchmark-index](https://kennethli319.github.io/audio-benchmark-index/)

The initial seed list came from the Audio -> Text evaluation benchmarks cited in
the Qwen3.5-Omni technical report, section 5.1. The index has since expanded
into a broader map of the audio evaluation landscape: ASR, speech translation,
speech synthesis, speech dialogue, audio understanding, environmental sound,
sound event detection, keyword spotting, speaker recognition, spoken language
identification, speech instruction following, self-supervised speech representation,
emotion, captioning, speech separation, speech enhancement, music tagging,
music genre classification, instrument recognition, music transcription, speaker
verification anti-spoofing, speaker diarization, music synthesis, speech quality
assessment, and spoken digit classification.

The goal is simple: for each benchmark, keep a pointer to the official project,
how to get the data, and the upstream license or access terms. When practical,
the repo also includes a small helper script that fetches metadata or safe
non-gated files while making large archives and restricted datasets explicit
opt-ins. This repository does not mirror datasets or grant rights to use any
upstream data.

Last checked: 2026-07-21. Current index size: 112 distinct benchmarks
or benchmark families, with FLEURS de-duplicated across S2TT and ASR.

Seed source: [Qwen3.5-Omni Technical Report](https://arxiv.org/html/2604.15804v1#S5),
Audio -> Text evaluation block. The Qwen report remains useful provenance, but
the repository is no longer limited to that paper's benchmark list.

## Coverage

Current coverage includes:

- Audio understanding and speech dialogue benchmarks from recent omni/audio LLM reports.
- Core speech benchmarks for ASR, speech-to-text translation, meeting ASR, and singing voice.
- Speech generation benchmarks for TTS and voice quality research.
- Non-speech audio benchmarks for events, scenes, sound event detection, captioning, and music.
- Speech and music source separation benchmarks with realistic access constraints.
- Human-centered speech tasks such as speaker recognition, spoken language identification, keyword spotting, emotion recognition, instruction following, and speech/audio/music representation evaluation.
- Speech quality and MOS prediction benchmarks with explicit source-license caveats.

## Benchmark Table

| Benchmark | Task area | Download pointer | Upstream license / terms |
| --- | --- | --- | --- |
| [MMAU](https://github.com/Sakshi113/MMAU) | Audio understanding | [MMAU-test-mini](https://huggingface.co/datasets/gamma-lab-umd/MMAU-test-mini), [MMAU-test](https://huggingface.co/datasets/gamma-lab-umd/MMAU-test) | HF cards list `cc-by-nc-4.0` for test-mini and `mit` for test; code repo is Apache-2.0 |
| [MMAR](https://github.com/ddlBoJack/MMAR) | Audio understanding | [BoJack/MMAR](https://huggingface.co/datasets/BoJack/MMAR) | HF card lists `cc-by-nc-4.0`; code repo had no detected license |
| [MMSU](https://github.com/dingdongwang/MMSU) | Audio understanding | [ddwang2000/MMSU](https://huggingface.co/datasets/ddwang2000/MMSU) | HF card lists `mit`; code repo had no detected license |
| [AIR-Bench](https://github.com/OFA-Sys/AIR-Bench) | Audio-language model evaluation | Official [ACL paper](https://aclanthology.org/2024.acl-long.109/), [evaluation repo](https://github.com/OFA-Sys/AIR-Bench), and [qyang1021/AIR-Bench-Dataset](https://huggingface.co/datasets/qyang1021/AIR-Bench-Dataset); helper downloads docs by default and makes the large HF snapshot opt-in | HF dataset card lists CC BY-NC 4.0 and mixed component-source terms; evaluation code is Apache-2.0 |
| [MUSIC-AVQA](https://gewu-lab.github.io/MUSIC-AVQA/) | Audio-visual question answering | Official [project page](https://gewu-lab.github.io/MUSIC-AVQA/), [GitHub repo](https://github.com/GeWu-Lab/MUSIC-AVQA), and public JSON annotations; helper downloads docs/annotations by default while raw videos remain manual | Dataset license not specified; code license is conflicting across GitHub LICENSE/API and README, so re-check before reuse |
| [SUPERB](https://superbbenchmark.org/) | Speech representation evaluation | Official [S3PRL SUPERB docs](https://github.com/s3prl/s3prl/blob/master/s3prl/downstream/docs/superb.md) and toolkit; helper downloads docs/license by default and can clone the toolkit with opt-in | Benchmark suite uses multiple external corpora with mixed terms; S3PRL toolkit is mostly Apache-2.0, with noted CC BY-NC files |
| [SLURP](https://github.com/pswietojanski/slurp) | Spoken language understanding | Official GitHub annotation/code repository plus [Zenodo audio archives](https://zenodo.org/records/4274930); helper clones annotations and makes multi-GB audio opt-in | Textual annotations are CC BY 4.0; Zenodo-hosted audio is non-commercial, with GitHub README stating CC BY-NC 4.0 |
| [SLUE](https://asappresearch.github.io/slue-toolkit/) | Spoken language understanding | Official [SLUE toolkit](https://github.com/asappresearch/slue-toolkit), [asapp/slue](https://huggingface.co/datasets/asapp/slue), and [asapp/slue-phase-2](https://huggingface.co/datasets/asapp/slue-phase-2); helper downloads docs/licenses by default and makes HF snapshots opt-in | SLUE-VoxPopuli is CC0; SLUE-VoxCeleb is CC BY 4.0; toolkit code is MIT |
| [MInDS-14](https://huggingface.co/datasets/PolyAI/minds14) | Spoken language understanding | [PolyAI/minds14](https://huggingface.co/datasets/PolyAI/minds14); helper saves the dataset card by default and snapshots a selected locale only with opt-in | HF dataset card lists CC BY 4.0 |
| [Fluent Speech Commands](https://fluent.ai/fluent-speech-commands-a-dataset-for-spoken-language-understanding-research/) | Spoken language understanding | Official Fluent.ai dataset page, [Google Groups access path](https://groups.google.com/a/fluent.ai/forum/#!forum/fluent-speech-commands), and [license PDF](https://fluent.ai/wp-content/uploads/2021/04/Fluent_Speech_Commands_Public_License.pdf); helper saves docs and prints access steps | Academic research only under CC BY-NC-ND 4.0; official page says commercial use is not authorized |
| [HEAR](https://hearbenchmark.com/) | Speech/audio/music representation evaluation | Official [HEAR eval kit](https://github.com/hearbenchmark/hear-eval-kit) and [Zenodo HEAR 2021 task archive](https://zenodo.org/records/5885750); helper downloads record metadata/license by default and makes task archives opt-in | Mixed component dataset terms; Zenodo lists CC BY 4.0 but says each task has its own LICENSE.txt; eval kit is Apache-2.0 |
| [Dynamic-SUPERB](https://github.com/dynamic-superb/dynamic-superb) | Speech instruction benchmark | Official Dynamic-SUPERB repository, [leaderboard](https://huggingface.co/spaces/DynamicSuperb/leaderboard), and docs; helper downloads docs by default and can clone the repo with opt-in | Mixed component dataset terms; GitHub API reported no repository license, so check each task source before use |
| [RUL-MuchoMusic](https://github.com/yongyizang/AreYouReallyListening) | Audio understanding | [RUL-MuchoMusic.json](https://raw.githubusercontent.com/yongyizang/AreYouReallyListening/main/RUL-MuchoMusic.json), [RUListening](https://huggingface.co/datasets/yongyizang/RUListening) | RUL repo/HF card list MIT; upstream MuChoMusic dataset is CC BY-SA 4.0 |
| [SongFormBench](https://huggingface.co/datasets/ASLP-lab/SongFormBench) | Audio understanding | `load_dataset("ASLP-lab/SongFormBench")` | HF card and SongFormer repo list CC BY 4.0 |
| [MagnaTagATune](https://mirg.city.ac.uk/codeapps/the-magnatagatune-dataset) | Music tagging | Official MIRG-hosted metadata, annotations, comparisons, optional Echo Nest features, and optional MP3 split archives | CC BY-NC-SA 3.0 for data; GPLv3 for scripts; Magnatune audio excerpts are non-commercial research redistribution |
| [MTG-Jamendo](https://mtg.github.io/mtg-jamendo-dataset/) | Music tagging | Official [metadata/scripts repo](https://github.com/MTG/mtg-jamendo-dataset), [Zenodo metadata archive](https://zenodo.org/records/3826813), and upstream downloader for large audio/features with opt-in | Metadata is CC BY-NC-SA 4.0; code is Apache-2.0; audio keeps per-track Creative Commons licenses and is limited to non-commercial research/academic use unless Jamendo authorizes otherwise |
| [FMA](https://github.com/mdeff/fma) | Music information retrieval | Official README/license by default; optional [metadata archive](https://os.unil.cloud.switch.ch/fma/fma_metadata.zip) and opt-in FMA audio subsets from small through full | Metadata is CC BY 4.0 and code is MIT; audio uses each artist's chosen license, so check per-track terms |
| [GTZAN](https://huggingface.co/datasets/marsyas/gtzan) | Music genre classification | Hugging Face `marsyas/gtzan`; helper saves the dataset card by default and downloads the full snapshot only with opt-in | License not specified on the reachable HF card; original Marsyas terms should be confirmed before redistribution or commercial use |
| [OpenMIC-2018](https://zenodo.org/records/1432913) | Music information retrieval | Official Zenodo record and [OpenMIC archive](https://zenodo.org/api/records/1432913/files/openmic-2018-v1.0.0.tgz/content); helper saves metadata by default and makes the 2.6 GiB archive opt-in | Zenodo lists CC BY 4.0; included metadata contains per-recording licenses |
| [MusicNet](https://zenodo.org/records/5120004) | Music transcription | Official Zenodo record, metadata CSV, reference MIDI archive, and opt-in 10.3 GiB audio/label archive | Zenodo lists CC BY 4.0; source recordings are Creative Commons licensed or public domain, with per-recording provenance in the metadata |
| [NSynth](https://magenta.withgoogle.com/datasets/nsynth) | Music synthesis | Official Magenta TFRecord or JSON/WAV split archives; helper saves the page by default and downloads archives only with opt-in | CC BY 4.0 for data; Magenta code is Apache-2.0 |
| [MAESTRO](https://magenta.withgoogle.com/datasets/maestro) | Music transcription and synthesis | Official Magenta v3.0.0 CSV/JSON metadata by default, optional MIDI-only archive, and opt-in 101 GiB WAV+MIDI archive | CC BY-NC-SA 4.0 |
| [MUSDB18](https://sigsep.github.io/datasets/musdb.html) | Music source separation | Official SigSep page plus Zenodo [MUSDB18](https://zenodo.org/records/1117372) and [MUSDB18-HQ](https://zenodo.org/records/3338373) archives; helper saves pages by default and requires acknowledgement before large archives | Zenodo lists Other (Non-Commercial); official pages state educational/academic use only, with mixed upstream track sources |
| [MedleyDB](https://medleydb.weebly.com/) | Music multitrack MIR | Official [downloads page](https://medleydb.weebly.com/downloads.html), public sample archive, GitHub annotation/metadata/tooling repo, and Zenodo request records for full MedleyDB and MedleyDB 2.0 audio | Dataset is CC BY-NC-SA 4.0 for non-commercial research use; official page asks users not to republish without consent; tooling repo is MIT |
| [Slakh2100](http://www.slakh.com/) | Music source separation and transcription | Official Slakh page, [Slakh2100 Zenodo record](https://zenodo.org/record/4599666), [tiny prototyping subset](https://zenodo.org/record/4603870), and [slakh-utils](https://github.com/ethman/slakh-utils); helper downloads docs by default and can save Zenodo landing pages or clone utilities with opt-in | CC BY 4.0 for Slakh2100/Flakh2100; slakh-utils code is MIT; synthesized from Lakh MIDI Dataset v0.1, so keep source MIDI attribution/provenance |
| [VoiceBench](https://github.com/MatthewCYM/VoiceBench) | End-to-end speech dialogue | [hlt-lab/voicebench](https://huggingface.co/datasets/hlt-lab/voicebench) | Apache-2.0 |
| [URO-Bench-pro](https://github.com/Ruiqi-Yan/URO-Bench) | End-to-end speech dialogue | [Honggao/URO-Bench](https://huggingface.co/datasets/Honggao/URO-Bench) | MIT |
| [SpeechRole](https://github.com/yuhui1038/SpeechRole) | End-to-end speech dialogue | [SpeechRole-Eval](https://huggingface.co/datasets/yuhui1038/SpeechRole-Eval), [SpeechRole-Data](https://huggingface.co/datasets/yuhui1038/SpeechRole-Data) | HF cards list MIT; repo has no separate detected license |
| [WildSpeech-Bench](https://github.com/Tencent/WildSpeech-Bench) | End-to-end speech dialogue | [tencent/WildSpeech-Bench](https://huggingface.co/datasets/tencent/WildSpeech-Bench) | License.txt says CC BY 4.0 except third-party datasets with their own terms |
| [FLEURS](https://huggingface.co/datasets/google/fleurs) | S2TT and ASR | `load_dataset("google/fleurs", "en_us")` or another locale | CC BY 4.0 |
| [VoxPopuli](https://github.com/facebookresearch/voxpopuli) | ASR and S2TT | [facebook/voxpopuli](https://huggingface.co/datasets/facebook/voxpopuli); select a language/config and split before downloading the large HF repository | Data is CC0-1.0; code and pretrained models are CC BY-NC 4.0; raw data also points to European Parliament legal notice |
| [mTEDx](https://www.openslr.org/100) | ASR and S2TT | [OpenSLR SLR100](https://www.openslr.org/100) ASR language archives, speech-translation language-pair archives, IWSLT 2021 test sets, and small metadata; archives are opt-in in the helper | CC BY-NC-ND 4.0; derived from TEDx Talks, so TED/TEDx source terms also apply |
| [TEDx Spanish Corpus](https://www.openslr.org/67/) | ASR | [OpenSLR SLR67](https://www.openslr.org/67/) Spanish speech/transcript archive; helper saves the page by default and makes the 2.3 GiB archive opt-in | CC BY-NC-ND 4.0; derived from TEDx Talks, so TED/TEDx source terms also apply |
| [Europarl-ST](https://www.mllp.upv.es/europarl-st/) | S2TT | Official [Europarl-ST page](https://www.mllp.upv.es/europarl-st/), [README](https://www.mllp.upv.es/europarl-st/README.md), and v1.1 archive; helper saves docs by default and makes the ~21 GB corpus opt-in | Corpus construction work is CC BY-NC 4.0; underlying debate data rights remain with the European Union and respective copyright holders |
| [CoVoST 2](https://github.com/facebookresearch/covost) | S2TT and ASR | Official CoVoST 2 translation TSV archives from Meta plus Common Voice 4 audio/transcripts obtained separately; [facebook/covost2](https://huggingface.co/datasets/facebook/covost2) also exists | Meta/GitHub list CoVoST data as CC0; current HF and Mozilla packaged views may list CC BY-NC 4.0, so re-check active source terms |
| [GigaSpeech](https://github.com/SpeechColab/GigaSpeech) | ASR | [speechcolab/gigaspeech](https://huggingface.co/datasets/speechcolab/gigaspeech) after access approval; default helper config is `dev` | HF terms restrict data to non-commercial research and educational use; code repo is Apache-2.0 |
| [SPGISpeech](https://huggingface.co/datasets/kensho/spgispeech) | ASR | [kensho/spgispeech](https://huggingface.co/datasets/kensho/spgispeech) after accepting Kensho/Hugging Face terms; helper defaults to `dev` | Gated terms allow academic research/internal use and prohibit redistribution without prior written consent |
| [Earnings-22](https://github.com/revdotcom/speech-datasets/tree/main/earnings22) | ASR | Official Rev.com [speech-datasets](https://github.com/revdotcom/speech-datasets) repository; helper downloads README/license/metadata by default and makes sparse checkout plus Git LFS audio pull opt-in | Dataset README/LICENSE list CC BY-SA 4.0 for transcripts and associated text; repository has no detected top-level license, so re-check audio/LFS terms before redistribution |
| [L2-ARCTIC](https://psi.engr.tamu.edu/l2-arctic-corpus/) | ASR and accented speech | Official TAMU corpus page and documentation; access requires accepting license terms and submitting the download form to receive a generated Google Drive link by email | CC BY-NC 4.0; current release has 24 non-native English speakers plus suitcase-corpus material, while the Interspeech 2018 paper describes v1.0 |
| [Common Voice](https://github.com/common-voice/cv-dataset) | ASR | [Mozilla Data Collective Common Voice](https://mozilladatacollective.com/organization/cmfh0j9o10006ns07jq45h7xk) | Common Voice datasets are CC0-1.0; metadata repo is MPL-2.0 |
| [LibriSpeech](https://www.openslr.org/12) | ASR and speech-codec reconstruction | OpenSLR SLR12 metadata/checksums by default, opt-in archives, or [openslr/librispeech_asr](https://huggingface.co/datasets/openslr/librispeech_asr); Qwen3-TTS §4.1.2 uses all 2,620 `test-clean` utterances | CC BY 4.0 |
| [Libri-Light](https://github.com/facebookresearch/libri-light) | ASR and self-supervised speech representation | Official repository docs and Meta public-file archives; helper downloads docs by default and makes 0.6 GiB finetuning, ABX, and 35 GiB to 3.05 TiB unlabeled archives opt-in | Code is MIT; reviewed docs do not state a standalone data license, and audio comes from open-source LibriVox audiobooks with source-term/attribution caution |
| [TIMIT](https://catalog.ldc.upenn.edu/LDC93S1) | ASR and phone recognition | LDC catalog [LDC93S1](https://catalog.ldc.upenn.edu/LDC93S1) or MS-WAV version [LDC93S1W](https://catalog.ldc.upenn.edu/LDC93S1W) after login/licensing; helper prints official access steps | Custom LDC license/paid access; portions copyright 1993 Trustees of the University of Pennsylvania |
| [Switchboard](https://catalog.ldc.upenn.edu/LDC97S62) | Conversational telephone ASR | LDC catalog [LDC97S62](https://catalog.ldc.upenn.edu/LDC97S62) for Switchboard-1 Release 2 plus [LDC2002S09](https://catalog.ldc.upenn.edu/LDC2002S09) for 2000 HUB5 English Evaluation Speech; helper prints official access steps | Custom LDC license/paid access; re-check current LDC agreement before use or redistribution |
| [Fisher English](https://catalog.ldc.upenn.edu/LDC2004S13) | Conversational telephone ASR | LDC catalogs for [speech part 1](https://catalog.ldc.upenn.edu/LDC2004S13), [transcripts part 1](https://catalog.ldc.upenn.edu/LDC2004T19), [speech part 2](https://catalog.ldc.upenn.edu/LDC2005S13), and [transcripts part 2](https://catalog.ldc.upenn.edu/LDC2005T19); helper prints official access steps | Custom LDC license/paid access; re-check current LDC agreement before use or redistribution |
| [MLS](https://www.openslr.org/94/) | ASR | OpenSLR SLR94 links to Meta public-file archives for 8 LibriVox-derived languages; helper saves the page/checksums and downloads selected language archives only with opt-in | CC BY 4.0 |
| [Seed-TTS Eval](https://github.com/BytedanceSpeech/seed-tts-eval) | Zero-shot speech synthesis and voice cloning | Official ByteDance repository and public objective EN/ZH set on Google Drive; helper downloads evaluation docs/code by default while the dataset remains a manual Drive download | No data or code license specified; objective data selects Common Voice and DiDiSpeech-2 samples, and the subjective set is explicitly unreleased |
| [InstructTTSEval](https://github.com/KexinHUANG19/InstructTTSEval) | Controllable speech synthesis and instruction following | Official evaluation repo and public, ungated [CaasiHUANG/InstructTTSEval](https://huggingface.co/datasets/CaasiHUANG/InstructTTSEval); helper downloads docs by default and makes the ~1.8 GB embedded-audio snapshot opt-in | HF card lists MIT, but paper limits the dataset to academic/research use and describes film/TV-derived audio; code license is unspecified and source-media rights require review |
| [CV3-Eval](https://github.com/FunAudioLLM/CV3-Eval) | In-the-wild zero-shot and cross-lingual speech synthesis | Official CosyVoice 3 repository with multilingual, cross-lingual, emotion, expressive, continuation, and Chinese-accent evaluation subsets; helper downloads docs by default and makes the roughly 760 MiB repository opt-in | Repository is Apache-2.0, but reference audio includes Common Voice, FLEURS, EmoBox, and web-crawled sources whose component rights require review |
| [LibriTTS](https://www.openslr.org/60/) | Speech synthesis | OpenSLR SLR60 tarballs; helper downloads the landing page by default and archives only with opt-in | CC BY 4.0 |
| [LJSpeech](https://keithito.com/LJ-Speech-Dataset/) | Speech synthesis | Official 2.6 GiB archive or [keithito/lj_speech](https://huggingface.co/datasets/keithito/lj_speech); helper downloads the dataset page by default and archive only with opt-in | Public domain; HF mirror lists `unlicense` |
| [VCTK](https://datashare.ed.ac.uk/handle/10283/3443) | Speech synthesis | Official DataShare README/license files by default; 10.94 GiB corpus ZIP is opt-in | CC BY 4.0 |
| [AISHELL-3](https://www.openslr.org/93/) | Speech synthesis | [OpenSLR SLR93](https://www.openslr.org/93/) page by default; 19 GiB Mandarin multi-speaker TTS archive is opt-in | OpenSLR lists Apache License v2.0 |
| [Hi-Fi TTS](https://www.openslr.org/109/) | Speech synthesis | [OpenSLR SLR109](https://www.openslr.org/109/) page by default; 39-41 GiB multi-speaker English TTS archive is opt-in | OpenSLR lists CC BY 4.0; derived from public-domain LibriVox audio and Project Gutenberg text |
| [WenetSpeech](https://github.com/wenet-e2e/WenetSpeech) | ASR | Apply for password on the [official site](https://wenet-e2e.github.io/WenetSpeech/), then use repo scripts | Non-commercial use under CC BY 4.0; original audio copyrights remain with owners |
| [AISHELL-1](https://www.openslr.org/33/) | ASR | [OpenSLR SLR33](https://www.openslr.org/33/) supplementary resources by default; 15 GiB Mandarin speech/transcript archive is opt-in | OpenSLR lists Apache License v2.0 and also says the data is free for academic use |
| [MAGICDATA Mandarin](https://www.openslr.org/68/) | ASR and speaker recognition | [OpenSLR SLR68](https://www.openslr.org/68/) metadata by default; 52 GiB train, 1.0 GiB dev, and 2.2 GiB test archives are opt-in | CC BY-NC-ND 4.0; OpenSLR says freely published for non-commercial or academic use |
| [ST-CMDS](https://www.openslr.org/38/) | ASR | [OpenSLR SLR38](https://www.openslr.org/38/) page by default; 8.2 GiB Mandarin speech/transcript archive is opt-in | CC BY-NC-ND 4.0 |
| [THCHS-30](https://www.openslr.org/18/) | ASR | [OpenSLR SLR18](https://www.openslr.org/18/) page by default; 6.4 GiB Mandarin speech/transcript, 1.9 GiB noisy test, and 24 MiB resource archives are opt-in | Apache License v2.0; OpenSLR description also says free to academic users |
| [Golos](https://www.openslr.org/114/) | ASR | [OpenSLR SLR114](https://www.openslr.org/114/) page, SberDevices README/checksums/license PDFs by default; 18 GiB Opus speech archive and models are opt-in | Custom SberDevices Golos license PDFs; OpenSLR links the English/Russian license documents, so re-check before redistribution or commercial use |
| [Primewords Chinese Corpus Set 1](https://www.openslr.org/47/) | ASR | [OpenSLR SLR47](https://www.openslr.org/47/) page by default; 9.0 GiB Mandarin speech/transcript archive is opt-in | CC BY-NC-ND 4.0; OpenSLR says the corpus is free for academic use |
| [Pansori-TEDxKR](https://www.openslr.org/58/) | ASR | [OpenSLR SLR58](https://www.openslr.org/58/) metadata by default; 174 MB Korean TEDx speech/transcript archive is opt-in | CC BY-NC-ND 4.0; derived from TEDx talks, so source media terms still apply |
| [KeSpeech](https://github.com/tzyll/KeSpeech) | ASR | Baidu Pan link in repo, password `b6fy` | Custom terms: non-commercial, no adaptations, no third-party distribution |
| [Opencpop-test](https://github.com/wenet-e2e/opencpop) | ASR / singing voice | Apply via the [official download page](https://wenet-e2e.github.io/opencpop/download/) and use the test split | CC BY-NC-ND 4.0 |
| [MIR-1K vocal](http://mirlab.org/dataset/public/) | ASR / singing voice | [Figshare mirror](https://figshare.com/articles/dataset/MIR-1K_rar/5802891); official MIR Lab archive currently returns 404 | Official page does not state a license; Figshare mirror lists CC BY 4.0 |
| [ESC-50](https://github.com/karolpiczak/ESC-50) | Environmental sound classification | [GitHub archive](https://github.com/karolpiczak/ESC-50/archive/refs/heads/master.zip) or `git clone https://github.com/karolpiczak/ESC-50.git` | ESC-50 is CC BY-NC 3.0; ESC-10 subset clips are CC BY |
| [UrbanSound8K](https://urbansounddataset.weebly.com/urbansound8k.html) | Environmental sound classification | [Zenodo archive](https://zenodo.org/records/1203745) or the official browser/Python download page | Zenodo lists CC BY-NC 4.0; official site says free for non-commercial use under Creative Commons BY-NC 3.0 |
| [TAU Urban Acoustic Scenes 2019](https://dcase.community/challenge2019/task-acoustic-scene-classification) | Acoustic scene classification | [Development Zenodo record](https://zenodo.org/records/2589280); helper downloads doc/meta files by default and makes 21 audio shards opt-in | Zenodo record lists `Other (Non-Commercial)` without a more specific SPDX-style license |
| [TAU Urban Acoustic Scenes 2020 Mobile](https://dcase.community/challenge2020/task-acoustic-scene-classification) | Acoustic scene classification | [Development](https://zenodo.org/records/3670167) and [evaluation](https://zenodo.org/records/3685828) Zenodo records; helper downloads doc/meta files by default and makes multi-GB audio archives opt-in | Zenodo records list `Other (Non-Commercial)` without a more specific SPDX-style license |
| [AudioSet](https://research.google.com/audioset/) | Audio event classification | Official [CSV metadata](https://research.google.com/audioset/download.html) and optional precomputed features archive | Dataset annotations/features are CC BY 4.0; ontology is CC BY-SA 4.0; original YouTube media terms still apply |
| [VGGSound](https://www.robots.ox.ac.uk/~vgg/data/vggsound/) | Audio-visual event classification | Official [CSV metadata](https://github.com/hche11/VGGSound/blob/master/data/vggsound.csv) with YouTube IDs, start times, labels, and split; helper fetches metadata/license only by default | CC BY 4.0 for the dataset metadata/release; original video copyright and YouTube availability/terms still apply |
| [AVE](https://github.com/YapengTian/AVE-ECCV18) | Audio-visual event localization | Official [project page](https://sites.google.com/view/audiovisualresearch), [ECCV repo](https://github.com/YapengTian/AVE-ECCV18), and Google Drive dataset/features links; helper saves docs by default and can clone the repo | Dataset and code licenses are not specified in the official repo; unconstrained source videos and Drive-hosted features require upstream-term review |
| [EPIC-SOUNDS](https://epic-kitchens.github.io/epic-sounds/site) | Egocentric audio event recognition | Official [annotation repository](https://github.com/epic-kitchens/epic-sounds-annotations) with public train/validation/test timestamp CSVs; helper downloads docs/CSV annotations by default while raw audio follows EPIC-KITCHENS-100 access/extraction steps | Annotation README states CC BY-NC 4.0; raw audio derives from EPIC-KITCHENS-100 videos and may require separate access/HDF5 approval |
| [FSD50K](https://fsannotator.upf.edu/fsd/release/FSD50K/) | Audio event classification | [Zenodo record](https://zenodo.org/records/4060432); helper downloads docs/labels/metadata by default and audio only with opt-in | Mixed Creative Commons: per-clip Freesound licenses include CC0, CC-BY, CC-BY-NC, and CC Sampling+; curated dataset is CC BY with upstream caveats |
| [FSDKaggle2018](https://zenodo.org/records/2552860) | Audio event classification | [Zenodo record](https://zenodo.org/records/2552860) for docs, metadata, train audio, and test audio; helper downloads docs/metadata by default and audio only with opt-in | Zenodo license id is `other-at`; dataset curation is CC BY, while individual Freesound clips keep per-clip Creative Commons licenses in the metadata |
| [FSDKaggle2019](https://zenodo.org/records/3612637) | Audio event classification | [Zenodo record](https://zenodo.org/records/3612637) for docs, metadata, curated/noisy train audio, and test audio; helper downloads docs/metadata by default and audio only with opt-in | Zenodo license id is `other-at`; dataset curation is CC BY, while Freesound/Flickr clips keep per-clip Creative Commons licenses in the metadata |
| [DESED](https://project.inria.fr/desed/) | Sound event detection | Official [DESED repo](https://github.com/turpaultn/DESED), [real metadata](https://zenodo.org/records/3588179), and [synthetic soundscape files](https://zenodo.org/records/6026841); helper downloads repo/metadata/JAMS by default and makes audio opt-in | Zenodo real and synthetic records list CC BY 4.0; Python code is MIT; component source-media terms still need checking |
| [SONYC-UST-V2](https://zenodo.org/records/3966543) | Urban sound tagging | [Zenodo v2.3 record](https://zenodo.org/records/3966543) for annotations, taxonomy, README, and 19 audio shards; helper downloads metadata by default and makes audio opt-in | CC BY 4.0; DCASE task rules restrict private external data for reproducible challenge submissions |
| [VoxCeleb](https://www.robots.ox.ac.uk/~vgg/data/voxceleb/) | Speaker recognition | [OpenSLR SLR49 metadata/trial lists](https://www.openslr.org/49/); official VGG pages currently say original audio/URL files are no longer available there | VGG metadata is CC BY-SA 4.0; OpenSLR SLR49 lists its small metadata resource as not copyrighted; original YouTube media rights still apply |
| [HI-MIA](https://www.openslr.org/85/) | Far-field text-dependent speaker verification | [OpenSLR SLR85](https://www.openslr.org/85/) page and filename mapping by default; train/dev/test archives are opt-in because they are multi-GB | Apache License v2.0 |
| [VoxConverse](https://www.robots.ox.ac.uk/~vgg/data/voxconverse/) | Speaker diarization | Official [annotation repository](https://github.com/joonson/voxconverse) plus dev/test WAV ZIPs on the VGG page; helper clones annotations by default and makes audio opt-in | CC BY 4.0 for research use; original video copyrights remain with upstream owners |
| [DIHARD III](https://dihardchallenge.github.io/dihard3/) | Speaker diarization | LDC [development](https://catalog.ldc.upenn.edu/LDC2022S12) and [evaluation](https://catalog.ldc.upenn.edu/LDC2022S14) web-download releases after LDC access; helper prints official access steps | LDC user agreement access; development/evaluation data require LDC membership or non-member licensing |
| [ASVspoof 2019](https://datashare.ed.ac.uk/handle/10283/3336) | Speaker verification anti-spoofing | Edinburgh DataShare record with README, license, evaluation plan, paper PDF, and opt-in LA/PA archives | Open Data Commons Attribution License on the DataShare record; derived from VCTK, so component terms should be re-checked |
| [ASVspoof 2021](https://www.asvspoof.org/index2021.html) | Speaker verification anti-spoofing and speech deepfake detection | Official ASVspoof page, [baseline repo](https://github.com/asvspoof-challenge/2021), [LA](https://zenodo.org/record/4837263), [PA](https://zenodo.org/record/4834716), and [DF](https://zenodo.org/record/4835108) Zenodo records; helper downloads eval plan and keys/metadata by default, with large speech archives opt-in | Official page says Open Data Commons Attribution Licence; Zenodo lists ODC-BY for LA/PA and ODC-ODbL for DF; baseline repo had no detected license |
| [VoxLingua107](https://huggingface.co/datasets/TalTechNLP/VoxLingua107) | Spoken language identification | TalTechNLP [Hugging Face mirror](https://huggingface.co/datasets/TalTechNLP/VoxLingua107); helper downloads metadata by default and requires opt-in for the larger snapshot | HF card lists CC BY-NC 4.0; YouTube-derived source media availability and platform terms still apply |
| [Speech Commands](https://www.tensorflow.org/datasets/catalog/speech_commands) | Keyword spotting | Official TensorFlow archives: [v0.02](https://storage.googleapis.com/download.tensorflow.org/data/speech_commands_v0.02.tar.gz), [v0.01](https://storage.googleapis.com/download.tensorflow.org/data/speech_commands_v0.01.tar.gz), or [google/speech_commands](https://huggingface.co/datasets/google/speech_commands) | CC BY 4.0; HF card asks users not to try to identify speakers |
| [MSWC](https://mlcommons.org/datasets/multilingual-spoken-words/) | Multilingual keyword spotting and spoken term search | Official MLCommons page, [MLCommons/ml_spoken_words](https://huggingface.co/datasets/MLCommons/ml_spoken_words), and per-language MLCommons archive mirrors; helper saves docs by default and makes audio/splits/alignments opt-in | CC BY 4.0; derived from crowd-sourced sentence-level speech, so preserve attribution and re-check source terms |
| [AudioMNIST](https://github.com/soerenab/AudioMNIST) | Spoken digit classification | Official GitHub repository with 30,000 spoken-digit WAV files and speaker metadata; helper downloads README/LICENSE/metadata by default and clones the repository only with opt-in | Repository-level LICENSE is MIT; recorded-voice consent/privacy obligations should still be considered for downstream use |
| [VocalSound](https://github.com/YuanGongND/vocalsound) | Human vocal sound classification | Official GitHub README and direct Dropbox archives for 16 kHz and 44.1 kHz releases; helper saves docs by default and makes archives opt-in | Dataset README says CC BY-SA 4.0; GitHub API reports no repository-level license, so code license is not specified |
| [VocalSet](https://zenodo.org/records/1193957) | Singing voice analysis | Official [Zenodo record](https://zenodo.org/records/1193957), DOI, and [ISMIR paper](https://archives.ismir.net/ismir2018/paper/000105.pdf); helper saves record metadata by default and makes the 2.1 GB archive opt-in | Zenodo lists CC BY 4.0; treat singer voice data with normal consent/attribution care |
| [EmoV-DB](https://github.com/numediart/EmoV-DB) | Emotional speech synthesis and speech emotion | [OpenSLR SLR115](https://www.openslr.org/115/) per-speaker/per-emotion archives; helper saves docs/license by default and downloads selected archives only with opt-in | Custom non-commercial terms for research, teaching, scientific publication, and personal experimentation; commercial use requires contacting the owner |
| [RAVDESS](https://zenodo.org/records/1188976) | Speech emotion recognition | [Zenodo record](https://zenodo.org/records/1188976); helper saves metadata by default and downloads audio-only speech/song ZIPs with opt-in | CC BY-NC-SA 4.0; commercial licenses are separate |
| [CREMA-D](https://github.com/CheyneyComputerScience/CREMA-D) | Speech emotion recognition | Official GitHub/GitLab repositories; helper downloads README/license/CSV metadata by default and keeps the full Git LFS media clone opt-in | Database is ODbL 1.0; individual contents are Database Contents License 1.0 |
| [MELD](https://affective-meld.github.io/) | Speech emotion recognition | Official project/GitHub/Hugging Face metadata by default; raw audio/video and feature/model tarballs are opt-in | GitHub and HF list GPL-3.0; clips derive from Friends TV media, so re-check media rights before redistribution or commercial use |
| [IEMOCAP](https://sail.usc.edu/iemocap/) | Speech emotion recognition | Official [release page](https://sail.usc.edu/iemocap/iemocap_release.htm) after reading the [USC/SAIL data release form](https://sail.usc.edu/iemocap/Data_Release_Form_IEMOCAP.pdf) and submitting the request form | Custom USC/SAIL data release terms; access is manual/form-gated |
| [MUSAN](https://www.openslr.org/17/) | Speech/music/noise classification | [OpenSLR SLR17](https://www.openslr.org/17/) corpus archive; helper downloads the OpenSLR page by default and requires opt-in for the 11 GiB archive | CC BY 4.0 |
| [AMI](https://groups.inf.ed.ac.uk/ami/corpus/) | Meeting ASR | Official [annotation ZIPs](https://groups.inf.ed.ac.uk/ami/download/), optional [OpenSLR SLR16](https://www.openslr.org/16/) acoustic archives, or [edinburghcstr/ami](https://huggingface.co/datasets/edinburghcstr/ami) | Official AMI pages list CC BY 4.0; OpenSLR mirror still shows an older modified CC BY-NC-SA v2.0 notice |
| [CHiME-6](https://www.chimechallenge.org/datasets/chime6) | Meeting ASR / diarization | [OpenSLR SLR150](https://www.openslr.org/150/) transcriptions/floorplans by default; large train/dev/eval audio archives are opt-in | CC BY-SA 4.0 |
| [AliMeeting](https://www.openslr.org/119/) | Meeting ASR / diarization | [OpenSLR SLR119](https://www.openslr.org/119/) metadata by default; large Mandarin meeting archives are opt-in | CC BY-SA 4.0 |
| [LibriMix](https://github.com/JorisCos/LibriMix) | Speech separation | Official generator/metadata repo; helper clones it by default and runs generation only with `LIBRIMIX_RUN_GENERATION=1` plus a large storage directory | Code/scripts are MIT; generated data is derived from LibriSpeech CC BY 4.0 plus WHAM noise, so re-check component terms |
| [WSJ0-2mix / wsj0-mix](https://www.merl.com/research/highlights/deep-clustering) | Speech separation | Official MERL page and generation scripts by default; optional Python generator clone; mixture generation requires separately licensed local WSJ0 audio from LDC | Generated mixtures derive from LDC CSR-I WSJ0 and follow the active LDC agreement; pywsj0-mix code is MIT; MERL script license was not specified on the reachable page |
| [WHAM! / WHAMR!](http://wham.whisper.ai/) | Noisy and reverberant speech separation | Official page and generation scripts by default; 17 GiB WHAM! noise and 68.1 GiB WHAM!48kHz archives are opt-in | WHAM noise datasets are CC BY-NC 4.0; generated mixtures also require separately licensed WSJ0/wsj0-2mix access |
| [VoiceBank-DEMAND](https://datashare.ed.ac.uk/handle/10283/2791) | Speech enhancement | Edinburgh DataShare record for paired clean/noisy train and test ZIPs; helper saves metadata/license by default and makes text/audio archives opt-in | CC BY 4.0 on the DataShare record; derived from VCTK speech and DEMAND plus other noise sources, so component/source terms should be re-checked |
| [DNS Challenge](https://github.com/microsoft/DNS-Challenge) | Speech enhancement | Official DNS Challenge repo and Microsoft Research challenge page; helper saves README/license/downloader scripts by default and makes multi-GB DNS5 test archives opt-in | Repository content/docs are CC BY 4.0 and code is MIT; training data combines multiple upstream sources, so component terms still need checking |
| [MS-SNSD](https://github.com/microsoft/MS-SNSD) | Speech enhancement | Official Microsoft GitHub repo and [Interspeech 2019 paper](https://www.isca-archive.org/interspeech_2019/reddy19_interspeech.html); helper saves README/license/generator files by default and makes the large repo clone opt-in | Code is MIT; data is mixed upstream terms listed in the README, including PTDB-TUG ODbL, VoiceBank/DataShare terms, Freesound CC0 clips, and DEMAND CC BY-SA 3.0 |
| [NISQA](https://github.com/gabrielmittag/NISQA) | Speech quality assessment | Official NISQA repo/wiki and [Zenodo corpus mirror](https://zenodo.org/records/4728081); helper saves docs/licenses/record metadata by default and makes the 15.9 GiB corpus opt-in | Corpus uses mixed original source speech/noise terms; Zenodo reports `other-at`; code is MIT and model weights are CC BY-NC-SA 4.0 |
| [Clotho](https://zenodo.org/records/4783391) | Audio captioning | [Zenodo v2.1 record](https://zenodo.org/records/4783391); captions/metadata are small, audio archives are about 7.1 GiB | Mixed terms: audio clips keep per-file Freesound licenses; captions use the Tampere University license, mainly non-commercial with attribution |
| [ClothoAQA](https://zenodo.org/records/6473207) | Audio question answering | [Zenodo record](https://zenodo.org/records/6473207) with train/validation/test QA CSVs, metadata, license, and optional 3.1 GiB audio archive; helper downloads CSV metadata by default | QA CSVs are MIT; audio files keep per-file Freesound licenses, mostly Creative Commons with attribution, recorded in the metadata CSV |
| [AudioCaps](https://audiocaps.github.io/) | Audio captioning | Official [CSV metadata](https://github.com/cdjkim/audiocaps/tree/master/dataset) and [AudioCaps 2.0 CSV metadata](https://github.com/cdjkim/audiocaps/tree/master/dataset2.0); raw audio/video requires the upstream form | README says code and dataset are free for academic purposes only; repo license is MIT, but raw clips inherit AudioSet/YouTube availability and terms |
| [MusicCaps](https://huggingface.co/datasets/google/MusicCaps) | Music captioning | Official Google/Kaggle release mirrored at [google/MusicCaps](https://huggingface.co/datasets/google/MusicCaps); helper downloads the public CSV metadata by default | Annotation CSV is CC BY-SA 4.0; raw clips are AudioSet/YouTube-derived and remain subject to upstream media availability and terms |
| [WavCaps](https://github.com/XinhaoMei/WavCaps) | Audio captioning | [cvssp/WavCaps](https://huggingface.co/datasets/cvssp/WavCaps) JSON metadata and waveform ZIPs; helper downloads README/JSON metadata by default and makes large ZIP archives source-selective opt-ins | Academic use only for dataset audio; HF metadata advertises CC BY 4.0 but the card also requires checking FreeSound, BBC Sound Effects, SoundBible, and AudioSet source terms |
| [MACS](https://zenodo.org/records/5114771) | Audio captioning | [Zenodo MACS annotations](https://zenodo.org/records/5114771) plus upstream [TAU Urban Acoustic Scenes 2019](https://zenodo.org/records/2589280) audio; helper downloads annotations/docs by default and makes audio opt-in | Zenodo and LICENSE.txt use non-commercial terms for MACS; upstream TAU audio also lists Other (Non-Commercial) |

## Download Examples

Hugging Face datasets:

```python
from datasets import load_dataset

mmau_mini = load_dataset("gamma-lab-umd/MMAU-test-mini")
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
huggingface-cli download --repo-type dataset BoJack/MMAR --local-dir data/MMAR
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

Large or gated ASR:

```bash
GIGASPEECH_ACK_ACCESS=1 GIGASPEECH_CONFIG=dev scripts/download/gigaspeech.sh
GIGASPEECH_ACK_ACCESS=1 GIGASPEECH_CONFIG=xs scripts/download/gigaspeech.sh
SPGISPEECH_ACK_TERMS=1 SPGISPEECH_CONFIG=dev scripts/download/spgispeech.sh
scripts/download/earnings_22.sh
EARNINGS22_SPARSE_CHECKOUT=1 scripts/download/earnings_22.sh
scripts/download/l2_arctic.sh
```

Direct archives:

```bash
scripts/download/esc_50.sh
URBANSOUND8K_DOWNLOAD_AUDIO=1 scripts/download/urbansound8k.sh
scripts/download/tau_asc_2019.sh
TAU_ASC2019_DOWNLOAD_AUDIO=1 TAU_ASC2019_AUDIO_PARTS="1 2 21" scripts/download/tau_asc_2019.sh
scripts/download/tau_asc_2020_mobile.sh
TAU_ASC2020_DOWNLOAD_DEV_AUDIO=1 scripts/download/tau_asc_2020_mobile.sh
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
scripts/download/hi_mia.sh
HIMIA_DOWNLOAD_ARCHIVES=1 HIMIA_PARTS="dev test_v2" scripts/download/hi_mia.sh
scripts/download/voxconverse.sh
VOXCONVERSE_DOWNLOAD_AUDIO=1 VOXCONVERSE_AUDIO_SPLITS=dev scripts/download/voxconverse.sh
scripts/download/dihard_iii.sh
scripts/download/asvspoof_2019.sh
ASVSPOOF2019_DOWNLOAD_ARCHIVES=1 ASVSPOOF2019_PARTS=LA scripts/download/asvspoof_2019.sh
scripts/download/asvspoof_2021.sh
ASVSPOOF2021_DOWNLOAD_ARCHIVES=1 ASVSPOOF2021_PARTS=LA scripts/download/asvspoof_2021.sh
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
scripts/download/alimeeting.sh
ALIMEETING_DOWNLOAD_ARCHIVES=1 ALIMEETING_PARTS="Eval_Ali.tar.gz Test_Ali.tar.gz" scripts/download/alimeeting.sh
```

Speech separation:

```bash
scripts/download/librimix.sh
LIBRIMIX_RUN_GENERATION=1 LIBRIMIX_STORAGE_DIR=/large/storage scripts/download/librimix.sh
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
- TIMIT: license the corpus through LDC catalog LDC93S1 or LDC93S1W, then use the LDC web download flow; the helper prints official access pointers only.
- Fisher English: license the four LDC catalog releases for speech/transcripts parts 1 and 2, then use the LDC web download flow; the helper prints official access pointers only.

## Data File

The editable source of truth is [data/audio_benchmarks.yaml](data/audio_benchmarks.yaml).
Use it for scripts, sorting, or future additions.

## Public Website

The public page is generated from the YAML source of truth, including benchmark
cards, search metadata, access guidance, license cautions, and helper commands:

```bash
ruby scripts/build_site.rb
ruby scripts/build_site.rb --check
```

Generated artifacts live under `docs/` and are mirrored to the personal GitHub
Pages repository at `audio-benchmark-index/`. Edit the YAML or site template,
then regenerate instead of hand-editing `docs/index.html`.

## Updating The Index

This index is meant to keep growing as audio model reports, benchmark papers,
and dataset hosting pages change. Updates should preserve three things for each
entry:

- **Official provenance:** link the project page, paper, repository, dataset
  card, or archive that a practitioner should cite or trust first.
- **Access reality:** say whether data is public, gated, form-based,
  password-based, split across mirrors, or only available as metadata.
- **License caution:** record the upstream license or terms as seen at the time
  of review, and note conflicts between mirrors instead of flattening them.

Good future additions include benchmarks cited by new audio/omni model technical
reports, widely used task leaderboards, DCASE-style challenge datasets, and
production-relevant speech/audio datasets with clear access paths. For large,
restricted, or expensive datasets, helper scripts should default to metadata,
checksums, landing pages, or dry-run instructions, with archive downloads behind
explicit environment-variable opt-ins.

## Download Scripts

Per-benchmark CLI helpers live in [scripts/download](scripts/download).
They download into `data/raw/<benchmark-id>/` by default, which is ignored by git.
For example:

```bash
scripts/download/mmar.sh
scripts/download/slurp.sh
scripts/download/minds14.sh
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
scripts/download/voxlingua107.sh
scripts/download/speech_commands.sh
scripts/download/emov_db.sh
scripts/download/ravdess.sh
scripts/download/crema_d.sh
scripts/download/meld.sh
scripts/download/iemocap.sh
scripts/download/musan.sh
scripts/download/ami.sh
scripts/download/macs.sh
scripts/download/chime_6.sh
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

## License Notes

The license of this repository covers only this index. Each benchmark keeps its
own license and access conditions. Before training, redistribution, commercial
use, or benchmark publication, re-check the upstream license page and cite the
benchmark authors.
