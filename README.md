# Audio Benchmark Index

A living index of speech, audio, music, and multimodal audio benchmarks.

**Browse the public, searchable index:**
[kennethli319.github.io/audio-benchmark-index](https://kennethli319.github.io/audio-benchmark-index/)

The initial seed list came from the Audio -> Text evaluation benchmarks cited in
the Qwen3.5-Omni technical report, section 5.1. The index has since expanded
into a broader map of the audio evaluation landscape: ASR, multidimensional
offline and streaming speech-translation evaluation,
speech synthesis, style-captioned, nonverbal-vocalization, and
sound-effect-conditioned TTS,
speech dialogue, audio understanding, environmental sound,
text-to-audio environmental sound-scene synthesis, synthetic-to-real sound-effect retrieval,
sound event detection, keyword spotting, speaker recognition, spoken language
identification, speech instruction following, self-supervised speech representation,
emotion, voice-based depression detection, captioning, speech separation, speech enhancement, real-recorded
microphone-array enhancement and localization, music tagging,
long-form clinical conversation understanding and audio-to-SOAP summarization,
forest-acoustic impulse-response simulation for bioacoustic arrays,
global bird-species and tropical bird-activity detection for passive acoustic monitoring,
music genre classification, instrument recognition, music transcription, asynchronous
distributed-microphone meeting recognition, speaker
verification anti-spoofing, speaker diarization, target-speaker extraction,
egocentric smart-glasses speech recognition and understanding,
music synthesis, song-aesthetics, music reward-model and compositional multimodal
preference evaluation, machine-generated-music detection, full-song
singing-quality assessment, long-form
podcast-generation evaluation, audiobook narration-appeal prediction,
rhythm-game chart-generation evaluation, and score-free
piano-concerto accompaniment alignment, speech quality
assessment, child-speech recognition, spatial audio localization, cross-modal audio-video-text retrieval,
Qur'anic ASR and reciter identification,
programmatic multimodal music-perception evaluation and atomic-event-based
audio-visual caption completeness and hallucination evaluation,
long-form audio-description narrative-comprehension evaluation,
spatio-temporal and multi-audio reasoning,
language-based moment retrieval, user-intent and exclusion-aware audio retrieval,
phrase-level temporal audio grounding, massive multilingual
audio-embedding evaluation, and human-captioned
real-world moment retrieval in long audio, plus time-aware localization,
timestamped description, and timed summarization over recordings up to two hours,
audio-visual segmentation, audio-video editing, audio-visual speech recognition,
causal-semantic audio-visual synchronization evaluation,
diagnostic evaluation of AI-generated cover songs,
spoken digit classification,
L2 spoken-English proficiency assessment and shortcut-reliance evaluation,
instruction-based multi-attribute speech editing, general-purpose multitask
audio editing, human-preference evaluation of synthesized speech, and
multi-turn spoken-dialogue emotional-intelligence evaluation and expressive
Russian conversational speech synthesis, non-human voice conversion and
designed-vocalization timbre transfer, multimodal ambivalence and hesitancy
recognition,
multimodal spoken-sarcasm and dialogue-pragmatics evaluation,
few-shot robustness under foreground/background shifts, dynamic heterogeneous
corruption robustness for test-time audio adaptation, few-shot bioacoustic
event detection, multi-domain audio question answering, Spanish speech
reasoning under heterogeneous acoustic conditions, and bilingual robustness
evaluation for modern speech deepfake detectors and diffusion-TTS forensics, plus speaker-centric reasoning
over bilingual multi-speaker conversations, reverberant-room ASR robustness,
audio-conditioned human-pet interaction and multimodal motion generation,
and multimodal speaker-segment, open-vocabulary audio-visual, in-cabin
driver emotion recognition, audio-visual social-relationship inference, and
speech-conditioned collaborative egocentric social reasoning, exact structured-token
recovery in workplace ASR, in-the-wild neurological Spanish ASR,
spontaneous-speech cognitive-impairment detection, as well as multi-turn voice-agent
tool use, grounding, state tracking, conversational memory, and context-aware
turn-taking decisions.
The index also covers likelihood-based acoustic consistency and semantic-acoustic
alignment evaluation for speech language models, plus closed-vocabulary live
tracking and captioning of sung scripture.

The goal is simple: for each benchmark, keep a pointer to the official project,
how to get the data, and the upstream license or access terms. When practical,
the repo also includes a small helper script that fetches metadata or safe
non-gated files while making large archives and restricted datasets explicit
opt-ins. This repository does not mirror datasets or grant rights to use any
upstream data.

Last checked: 2026-07-25. Current index size: 309 distinct benchmarks
or benchmark families, with FLEURS de-duplicated across S2TT and ASR.

Seed source: [Qwen3.5-Omni Technical Report](https://arxiv.org/html/2604.15804v1#S5),
Audio -> Text evaluation block. The Qwen report remains useful provenance, but
the repository is no longer limited to that paper's benchmark list.

Qwen3-TTS sections 4.1-4.2 are fully inventoried in the source YAML. Its named
public evaluation sets map to Common Voice, FLEURS, LibriSpeech `test-clean`,
Seed-TTS Eval, TTS Multilingual Test Set, CV3-Eval, and InstructTTSEval. The
target-speaker evaluation in section 4.2.5 reuses a 10-language subset of the
public TTS Multilingual Test Set, although the exact text rows are not
identified. The section 4.2.6 long-speech set is not a public benchmark: the
report describes an internal set of 100 Chinese and English texts (200-2,000
words) and provides no text manifest, generated audio, or download link.

Qwen3.5-Omni section 5.2 is also inventoried in the source YAML. Its public
speech-generation sets map to Seed-TTS Eval, TTS Multilingual Test Set, and
CV3-Eval. The FLEURS-derived multilingual set used for nine additional
languages and part of the custom-voice evaluation is explicitly internal and
has no released row mapping or download; the public FLEURS corpus is indexed
separately and must not be treated as that derived evaluation set.

Qwen3.5-Omni section 5.1's Audio-to-Text evaluation is fully inventoried in
the source YAML across audio understanding, end-to-end dialogue, S2TT, and
ASR. The audit records Table 5's exact dataset variants and protocols,
including the SongForm-HX-8Class prompt, URO-Bench pro track, FLEURS top-59
S2TT/top-60 ASR sets, Common Voice 15 languages, and vocal-only MIR-1K.

Qwen3.5-Omni section 5.1.4's complete audiovisual-to-text evaluation is
inventoried in the source YAML: DailyOmni, WorldSense, AVUT, AV-SpeakerBench,
audio-enabled Video-MME, Qualcomm IVD, Omni-Cloze, and OmniGAIA. Protocol notes
preserve the report's audio-enabled Video-MME setting and its OmniGAIA
prompt/judge configuration.

The June 2026 MuseBench paper is recorded as an announced audiovisual-arts
protocol rather than a downloadable benchmark family. Its official
[project page](https://musebench.github.io/) describes 4,016 single- and
multi-select questions over narrator-removed evidence clips, while the
[official repository](https://github.com/musebench/musebench-code) releases
MIT-licensed construction, adapter, and metric code. The repository requires
users to supply `benchmark.json` and the clips, however, and neither those
files nor a working dataset-card link is currently public. Paper and code
licenses therefore must not be treated as licensing the absent benchmark data
or source-platform media.

The July 2026 traceback-translator paper adds the official
[ADD 2022](http://addchallenge.cn/downloadADD2022) challenge family. Its
Mandarin continual-learning evaluation complements the already indexed
ASVspoof 2019, Fake-or-Real, and In-the-Wild families, although the paper does
not identify the exact ADD track or split combination. All six public Zenodo
records are CC BY-NC-ND 4.0 and total approximately 49.5 GB; the helper saves
official metadata by default and requires explicit archive and record choices.

The July 2026 Re-Sonance paper adds CDSD provenance to the index. Sections 3.4
and 4 evaluate Mandarin dysarthric speech conversion on the Chinese Dysarthria
Speech Database, using ten speakers for a twenty-listener subjective study,
thirty speakers for WER/MER/WIL by severity, and 200 clips for latency. CDSD's
owner page describes 133 hours from 44 speakers, but access requires a signed
license agreement and approval; the paper-specific row selections, generated
speech, listener records, and latency manifest are not released.

The July 2026 efficient audio-visual event-recognition paper is mapped to the
existing AVE family rather than counted as a new benchmark. Sections 4-5 use
AVE's predefined train, validation, and test subsets, split each approximately
10-second video into ten one-second segments, and evaluate frozen VideoMAE/AST
features with teacher, distilled-student, and INT8-student models. The paper
does not release its preprocessing manifests, cached features, checkpoints,
predictions, or per-item scores. AVE remains a manual Google Drive download
with no standalone dataset license, and source-video rights still apply.

The July 2026 FlowSonic paper is recorded as two unreleased, paper-specific
music-editing protocols rather than a benchmark family. Section 4.1 describes
separate 40-clip timbre-transfer and genre-transfer sets manually selected
from public YouTube recordings, resampled to 16 kHz, and standardized to
10 seconds. The official repository publishes implementation code, aggregate
logs, and one example WAV, but no 80-item manifest, source URLs, source or
target prompts, curated evaluation audio, generated comparison corpus, or
listener records. Public YouTube availability does not release the authors'
exact selection or clear uploader and media rights, and the repository states
no license, so the index adds neither a dataset link nor a helper.

The July 2026 layer-wise decision-fusion paper is inventoried across sections
3-5. Its in-domain evaluation maps to the existing ASVspoof 2019 Logical Access
family, while its cross-dataset evaluation adds the public, ungated
[In-the-Wild](https://deepfake-total.com/in_the_wild) family: 37.9 hours of
bona fide and deepfake English speech from 58 public figures. The owner page
says Apache-2.0 but its official Hugging Face card says CC BY-SA 4.0, so the
index records the conflict rather than choosing one license.

The July 2026 CHARM paper is inventoried across sections 4.1 and 4.3. Its
English audio-text sarcasm evaluation maps to the newly indexed public
[MUStARD](https://github.com/soujanyaporia/MUStARD) family: 690
sitcom-derived audiovisual utterances with labels, dialogue context, and fixed
fold indices. The repository and dataset card say MIT, but those labels must
not be assumed to relicense the underlying television excerpts. CHARM's CMMA
evaluation is recorded as a follow-up candidate because this audit verified
the primary NeurIPS paper but not an author-controlled public archive with
clear access and reuse terms.

The July 2026 LALM audio-judge reliability paper is recorded as a
claimed-public-supplement audit. It evaluates 152 production full-duplex
conversations and 57 defect-injected clips, but says the production audio will
not be released and the adversarial WAVs await a later clearance review. Its
cited Hugging Face supplement is currently authentication-required and exposes
no public card or file inventory, so the index does not add a benchmark family
or infer a download helper from the paper's release claim.

The July 2026 L2 auto-marker shortcut-reliance paper adds the official
Speak & Improve Corpus 2025 family. Its four open-speaking task types provide
fixed train, development, and evaluation partitions for proficiency scoring,
ASR, disfluency detection, and spoken grammatical-error correction. Cambridge
distributes the roughly 315-hour corpus after registration under a custom
non-commercial license that prohibits redistribution and requires prior
approval for corpus-derived releases; the helper therefore prints only the
official manual access path.

The July 2026 TFCL paper adds a public acoustic-front-end robustness family
derived from ASVspoof 2019 Logical Access. Its ungated Hugging Face release
contains approximately 38.5 GB of paired VAD-processed train/development audio
and six-stage AFE evaluation audio covering echo, AEC, additive noise, noise
suppression, AGC, and VAD. The helper fetches only official documentation and
metadata by default; audio, the 1.27 GB checkpoint, and the MIT-licensed code
are separate opt-ins. The dataset card says only `license: other`, so the index
does not infer reuse rights and preserves all ASVspoof/RIR/noise-source terms.

The June 2026 LA-RAG paper is recorded as an existing-family and unreleased
derived-protocol audit. Its two 24-hour synthetic Home-IoT and Industrial-IoT
benchmarks and its CASTELLA-QA question rows are not released. The public
CASTELLA annotations remain indexed separately, but they do not reproduce the
paper's derived questions, negative sampling, IoT streams, predictions, or
scores; no download link is inferred for those artifacts.

The July 2026 Audio-Visual Flamingo report is inventoried across sections 3-4.
Its audio, ASR, and omni-modal evaluations map to eleven existing families,
including MMAR, MMSU, MMAU, WorldSense, DailyOmni, MMOU, and the report's ASR
corpora. One named source cannot currently be added safely: the citation maps
TEDLIUM to TED-LIUM Release 3, but the official OpenSLR SLR51 page and archive
now return not found. The index records that upstream outage without
substituting an unofficial mirror or publishing a dead download helper.

The July 2026 Light-MER paper's nine-family multimodal emotion evaluation is
also inventoried. Its public MER2023, MER2024, CH-SIMS, CH-SIMS v2, CMU-MOSI,
and CMU-MOSEI families are now indexed. MER2023 provides multi-label,
corrupted-modality, and semi-supervised multimodal emotion tracks through a
request-gated Hugging Face release. The roughly 140 GB, password-protected
repository is academic-only and prohibits redistribution or modification
without written consent; its baseline repository states no code license.
MER2024 extends the family with 5,030 labeled and 115,595 unlabeled clips plus
semi-supervised, corrupted-modality, and open-vocabulary tracks. Its roughly
218.4 GB Hugging Face release is likewise request-gated and non-commercial.
CH-SIMS v2 releases 4,402 supervised multimodal/unimodal sentiment segments
and 10,161 unlabeled segments through official Drive folders. The helper saves
primary-source metadata and keeps the repository clone opt-in; the official
sources state no data or code license.
CMU-MOSI contains 2,199 English opinion segments from 93 YouTube review videos;
the official CMU SDK releases labels and anonymized processed features, while
MultiBench provides an additional word-aligned processed package. Raw source
videos are not redistributed. The helper saves primary-source documentation
and keeps toolkit clones opt-in. Both repositories are MIT-licensed, but the
official sources do not expressly license the MOSI data or source media, so
dataset terms remain unspecified. CMU-MOSEI covers more than 65 hours from
more than 1,000 speakers across 250 topics, with sentiment and six
non-exclusive emotion scores. Its official SDK and MultiBench releases expose
processed features and labels, while data and source-media terms likewise
remain unspecified.

The July 2026 GigaChat Audio report is inventoried across sections 3.6 and
4.1. Its AudioGrounding and TimeGround-1M evaluations map to existing public
families. The AMI source corpus is public, but the paper's 150 automatically
generated phrase-localization questions are not released. Likewise, the
public but gated DCASE 2025 AudioQA family does not identify the paper's
144 selected start-time questions without a row manifest or filtering script.
The audit records those as unreleased paper-specific protocols rather than
new downloadable benchmarks.

The July 2026 ECHOv2 paper's ASD Benchmark is public and reproducible at the
protocol layer. Its MIT evaluation repository unifies DCASE 2020-2025 Task 2
under frozen-embedding and lightweight-adaptation protocols while retaining
each year's official split and AUC/pAUC logic. Source recordings remain
separate official DCASE downloads with year-specific terms; the helper does
not fetch the repository's convenience Drive copy because no separate
redistribution terms are stated for it.

The July 2026 WanSong v1.0 report is recorded as a mixed
existing-coverage/internal-protocol audit rather than a benchmark addition.
Section 4.1 randomly samples 2,000 clips from the public Seed-TTS family but
does not publish the row selection, and its 200-clip Wan-song reconstruction
set is internal. Section 4.2's WanSong Bench, 90s-bench, generated comparison
audio, internal 80,000-song musicality evaluator, and score records are also
unreleased. SongEval maps to the existing public family; its availability does
not make the report's 200 four-minute multilingual cases public. The rendered
v3 report leaves its SongEval, SongBench, MuQ, and AudioBox citations
unresolved, so the index does not infer additional dataset links from those
names.

The July 2026 Auto-AEG paper's AEGBench is recorded as an announced
open-vocabulary audio-event-grounding protocol rather than a downloadable
family. The paper reports 3,427 human-verified items and 9,790 temporal queries,
but its linked Hugging Face repository currently contains only
`.gitattributes` and reports zero bytes of dataset storage. Appendix K promises
CC BY 4.0 data and MIT code upon acceptance while preserving source-audio
terms; those promises do not license absent artifacts. Recheck the release
before adding a benchmark entry or helper.

The April 2026 “All That Glitters Is Not Audio” paper is recorded as an
existing-coverage audit rather than a new benchmark family. It evaluates the
already indexed MMAU, MMAR, and MMAU-Pro releases under full-audio, no-audio,
text-backbone, and segmented partial-audio conditions to measure text priors
and audio reliance. Version 1 publishes no official repository, derived item
labels, score records, or evaluation code, so the index does not imply that
its model-dependent item categories form a downloadable dataset. The paper's
CC BY 4.0 license applies to the article, not absent evaluation artifacts or
the three benchmarks' upstream data.

The July 2026 Qwen-Audio-VAE report is inventoried across sections 4.1-4.5.
Its three public reconstruction benchmarks—LibriSpeech for speech, AudioCaps
for general sound, and Song Describer for music—were already indexed. The
audit also records AudioCaps test-set use for downstream text-to-audio
evaluation and does not misclassify the report's LAION-Audio-630K training
corpus as a new benchmark.

The July 2026 DONDO report is recorded as a model-release audit, not a new
benchmark family. It reports WER for 21 monolingual and five regional
multilingual ASR models across 27 African language varieties, but identifies
the underlying data only as predominantly religious-text read speech and
provides no named evaluation corpus, split sizes, row manifests, or stable
dataset download. The public KhayaAI Hugging Face repositories contain
Apache-2.0 model checkpoints; that does not release or license the unnamed
training and test audio.

The July 2026 VibeVoice-ASR-BitNet report is inventoried across sections 3.1
and 3.3. Its 15 WER/CER rows map to seven existing families: MLC-SLM Eval,
AISHELL-4, AMI, AliMeeting, FLEURS, LibriSpeech, and VoxPopuli. The audit also
preserves a naming conflict: the report expands MLC as “Multilingual
LibriSpeech Corpus,” while the official challenge calls MLC-SLM the
Multilingual Conversational Speech Language Model Challenge. The public
MLC-SLM release contains annotations but no currently documented public audio
URL, so the index does not imply full reproducibility.

The July 2026 FillGauss paper is recorded as an unreleased-protocol audit.
It describes FillImpact as more than 5,000 impact recordings from 88 objects
with paired 3D representations and fine-grained container, striker, strike
position, and fill-state conditions. Version 1 publishes no owner repository,
dataset card, archive, row manifest, code, generated outputs, listener records,
or data license. The index therefore does not advertise FillImpact as a
downloadable family and will recheck it after an official release appears.

The July 2026 X3-OPD paper is also inventoried across sections 5.1-5.4. MMSU,
MMAU, MMAR, WorldSense, and DailyOmni map to existing public families. Its
uncited “BIG Bench Audio” aggregate remains unmapped: the paper describes
acoustic QA, multi-event reasoning, temporal grounding, and paralinguistic
inference but provides no item count, split, repository, dataset card, or
download. That description does not match the four spoken BIG-Bench Hard tasks
in the separately indexed public Artificial Analysis Big Bench Audio release,
so the index does not conflate the two names.

The July 2026 ReMo token-compression paper is fully inventoried in the source
YAML. All six evaluation families were already indexed: WorldSense, DailyOmni,
Video-MME, OmniVideoBench, the video-SALMONN 2 caption benchmark, and
VGGSound. The audit preserves the paper's under-one-minute filtering of
long-video question-answer pairs and its 50-seed VGGSound retrieval analysis
rather than presenting those derived selections as separately released
benchmarks.

The July 2026 RPPNet symbolic-melody paper is recorded as a partial-source
coverage audit rather than a new downloadable family. Its 274,300-item
MelodyNet variant is smaller than the original paper's 444,102-piece assembly,
but RPPNet publishes no item manifest, filtering recipe, random seed, or
18:1:1 split files. The public MelodyGLM page links or bundles selected source
corpora and publishes processing code; it does not release the complete
assembled MelodyNet corpus. RPPNet's Apache-2.0 repository also omits the
paper's generated MIDI comparison set, selected human references, and listener
ratings, so the index does not invent an aggregate download or data license.

The June 2026 STEB expressive speech-to-speech translation benchmark is
release-audited but not counted as a public family. Its evaluation code and
prompts are public, while the official Hugging Face dataset repository still
contains only a placeholder README. The paper's 32.6-hour Chinese-English
normal/NV evaluation data therefore remains announced but unreleased; no
download helper or invented data link is provided.

The July 2026 Sound Scene Story Benchmark (S3Bench) for narrative
text-to-audio instruction following is also release-audited but not counted as
a downloadable family. The paper defines 1,200 multi-event and overlapping
temporal prompts. Its public project page provides selected prompt/output demos
and aggregate results, but not the complete prompt manifest or evaluation
assets; the linked GitHub repository is not public, and no data or demo license
is stated.

The June 2026 CASU paper is likewise recorded as an audited protocol rather
than a downloadable family. It describes semi-synthetic scenes combining
speech, discrete events, and background ambience for scene description and
four context-aware reasoning tasks, but version 1 provides no project,
repository, dataset card, item manifest, archive, code, or download link. Its
promised Appendix A.1 statistics and appendix examples are also absent from the
arXiv HTML and source package, so the index does not infer a benchmark size or
license absent evaluation assets.

The June 2026 AOR-Bench paper is also recorded as an unreleased audio-safety
protocol rather than a public benchmark family. It reports 3,000
pseudo-harmful samples across six scenario categories after varying speaker
gender, emotion, and rate, but version 1 provides no official project,
repository, dataset card, item manifest, audio archive, evaluation code, or
download link. The paper's arXiv license does not establish reuse terms for
the absent benchmark or redistribution rights for its generated Sora-2 and
CosyVoice outputs.

Qwen-Music sections 4.1-4.2 are also inventoried in the source YAML. Its
bilingual text-to-music, two cover-song reference, and bilingual rendering
sets are internal and unreleased. The public exception is the
[Song Describer Dataset](https://zenodo.org/records/10072001): section 4.2.2
uses all 546 tracks in its validated subset for codec-reconstruction
evaluation. The index does not infer download links for Qwen's internal sets.

The January 2026 SYAUDIO paper is recorded as an audited protocol rather than
a downloadable family. It describes 4,319 audio questions for testing
audio-language-model sycophancy across perception, reasoning, mathematics, and
ethics, including 1,319 GSM8K and 1,000 MMLU moral questions converted to
speech. The paper provides no official project, repository, dataset card,
archive, item manifest, generated audio, evaluation code, or data-license
statement. Public upstream MMAU, MMAR, GSM8K, and MMLU resources do not release
SYAUDIO's selected rows, speech, prompts, or acoustic perturbations.

The June 2026 OpenMIC instrument-grounding paper is likewise recorded as an
announced but unreleased protocol sequence. It defines five evaluations:
9,332 binary instrument-presence questions, a 590-item genre-prior-reduced
subset, 1,051 related-instrument discrimination items, 1,028 concatenated
30-second multi-label items, and 3,579 concatenated temporal-localization
items. The public [OpenMIC-2018](https://zenodo.org/records/1432913) corpus is
already indexed, but the paper only says its derived metadata, prompts, and
evaluation code *will* be released. No official project, repository, dataset
card, archive, item manifest, or separate license is currently supplied, so
the index does not claim that the five derived evaluations are downloadable.

The June 2026 DDPO-VC paper is recorded as an existing-coverage audit, not a
new benchmark family. Its ADReSS evaluation maps to the indexed, membership-
restricted DementiaBank challenge release, while its random FHS Gold 92 split
and examiner-filtering timestamps are not public. The official repository
currently contains only a README and MIT license and says code will be released
later; its demo's ten selected ADReSS examples are qualitative model outputs,
not a reusable evaluation package or a new clinical-data download path.

The July 2026 speech-based cognitive-impairment paper is also recorded as an
existing-coverage audit. It uses the indexed ADReSS20 and ADReSSo21 releases in
both a merged train/test setting and a cross-dataset generalization setting,
retaining only full enhanced audio and generating transcripts through a common
ASR pipeline. Although the paper calls the benchmarks publicly available, the
official DementiaBank release remains password protected and limited to
approved members under non-commercial, confidentiality, no-sharing, and
no-LLM-incorporation rules; the paper supplies no alternate public download.

The July 2026 black-box dynamic-range-control paper is likewise recorded as an
existing-coverage audit. It randomly selects 25 thirty-second mono excerpts
from the indexed MedleyDB family, then applies 30 compression and 30 expansion
profiles for 750 processed samples per task. The paper does not publish the
source track IDs or timestamps, processed audio, manifest, implementation,
predictions, or scores. Its source package only comments that code will follow
acceptance, so the derived evaluation is not treated as a downloadable family.

The July 2026 Kenyan-language Nemotron 3.5 adaptation report is recorded as
an internal-protocol audit, not a new benchmark family. Its Kikuyu, Dholuo,
and Kalenjin true-streaming evaluations use versioned project manifests drawn
from African Next Voices data; the paper says they were repeatedly consulted
during development and are not pristine external benchmarks. The Dholuo
manifest contains 5,480 rows (12.16 hours), but the manifests, reports, source
audio, checkpoints, and private preservation mirrors are not released.
PazaBench is mentioned only as a public comparison target and was not actually
run, so the audit maps that name to the existing PazaBench entry without
inventing a result or download path.

The July 2026 CCBR paper adds recent provenance for the indexed Million Song
Dataset family. Its music-recommendation evaluation preprocesses MSD to 31,046
items and 166,188 users, uses an unseen-user split and 80 tag descriptors, and
generates cached item descriptions from separately obtained audio. The official
MSD release provides features, metadata, tags, and Taste Profile play counts
but no listenable audio; CCBR does not release its exact item mapping, user
split, descriptions, prompts, or audio, so those remain a derived protocol
rather than a claimed public download.

The July 2026 Faster IndexTTS-2 paper is likewise recorded as an
existing-coverage audit rather than a new benchmark family. It evaluates the
indexed Seed-TTS objective set under precision, streaming, and batching
configurations, but reports 1,088 English and 2,020 Chinese samples while the
official Seed-TTS repository states 1,000 Common Voice and 2,000 DiDiSpeech-2
samples. Because the paper publishes no item manifest, split mapping, or
alternate evaluation download, the index preserves both counts and does not
infer that the extra cases are part of the public release.

The July 2026 OPOD paper is likewise recorded as an existing-coverage audit.
Its audio-relevant evaluation consists only of the indexed MMAU, AVQA, and
OmniBench families; the other nine columns are text or visual benchmarks.
The paper reports accuracy and averages all twelve columns, but publishes no
official repository, derived evaluation manifest, predictions, or score
records. No duplicate family or paper-specific helper is added, and AVQA's
non-commercial copying and redistribution restrictions remain in force.

The July 2026 honey-bee colony-strength paper is also recorded as an
existing-coverage audit. It evaluates the indexed public UrBAN family using
nested random segment-level evaluation and five hive-independent folds, with
linearly interpolated frame-of-bees targets, MAE, and Pearson correlation.
UrBAN remains a public CC BY 4.0 corpus delivered through a large manual
FRDR/Globus transfer, but the paper does not release its exact folds, derived
per-segment targets, models, predictions, or score records. Those artifacts
are not presented as a separate downloadable benchmark.

The July 2026 compact Hindi TTS paper is likewise recorded as an
existing-coverage audit. Its independent benchmark selects 50 Hindi sentences
from the indexed FLEURS `hi_in` test split and compares IndicF5, a released
190M student, and MMS-TTS-hin using WER/CER, speaker similarity, UTMOS, and
real-time factor. The public model repository releases the exact sentence
list, evaluation scripts, and per-sentence scores and timings, but not the
generated evaluation audio. This released selection maps to FLEURS rather than
creating a duplicate family; repository artifacts are MIT while the selected
FLEURS material retains CC BY 4.0 attribution obligations.

The July 2026 OmniReasoner paper is also recorded as an existing-coverage
audit. Its main evaluation uses the indexed OmniVideoBench, LVOmniBench,
Daily-Omni, WorldSense, and Video-MME audio-video families; VideoHolmes is a
visual-only control outside this index's scope. Its audio-removal ablation on
OmniVideoBench, LVOmniBench, and WorldSense creates no new public split or
score package. OmniReasoner does not re-license these benchmarks, so their
gated, non-commercial, conflicting-license, or custom academic-use terms
continue to apply.

The July 2026 PolySim paper is also recorded as an existing-coverage audit.
Its six-dataset cross-modal retrieval evaluation contains two audio-text
families, AudioCaps and Clotho, both already indexed; MS-COCO, Flickr30K,
MSR-VTT, and VATEX are image- or video-text datasets outside this audio
index's scope. PolySim reports bidirectional retrieval and quantization
experiments but releases no new benchmark data, so no duplicate family or
paper-specific helper is added. AudioCaps still depends on externally hosted
YouTube audio, and both corpora retain their original terms.

The July 2026 LH-AVLN paper is recorded as an unreleased-protocol audit. It
defines ordered and unordered long-horizon navigation missions with two to
four category, description, or image goals, alternating spatialized target
sounds, and RGB-D/pose/binaural observations, and reports a 550-episode
validation split built on SoundSpaces 2.0 and Matterport3D. ArXiv version 2
provides no official project, repository, episode manifest, goal cues, rendered
audio, simulator configuration, or evaluation code, so LH-AVLN is not counted
as a downloadable benchmark family and no download link is inferred.

The July 2026 Caption Studio paper is recorded as a system audit rather than a
benchmark family. It specifies WER, NIST-style diarization error rate, and
measured/derived/unavailable transparency labels, but explicitly says its
scoring harness has only been checked against hand-worked examples—not a large,
diverse, production-representative audio corpus. Version 1 releases no official
repository, dataset, evaluation manifest, predictions, or score records.
LibriSpeech, DIHARD, and NIST Rich Transcription appear as methodological
references, not reported Caption Studio evaluation sets, so no duplicate
families or paper-specific helper are added.

The July 2026 diagnostic cover-song evaluation paper is recorded as a
partial-release protocol rather than a downloadable benchmark family. Its
official MIT repository publishes the 30-row expert-score table, anonymized
sample map, extracted MIR features, and analysis pipeline for five songs
crossed with six generation systems. It explicitly omits all source and
generated audio because of song copyright and commercial API terms, and its
audio-example directory is only a placeholder. The public artifacts therefore
support analysis of the reported scores but cannot reproduce listening or
feature extraction; the paper also relies on a single expert annotator.

The April 2026 CAST paper is recorded as an audited speech-generation protocol,
not a downloadable family. It defines 113 contrastive context pairs (226
textual items) for testing whether TTS systems realize discourse-conditioned
word-level stress, plus a separate approximately 10,000-sample synthetic
training corpus. Although the paper says the benchmark, framework, pipeline,
and corpus are released, v1 provides no project, repository, dataset card,
archive, item file, code link, or data-license statement. The paper's CC BY
4.0 license does not license absent benchmark or corpus files.

The July 2026 RW-Voice-EQ paper has also been audited across sections 2 and
4-7 as a public-leaderboard, private-data protocol. Its public
[voice-system](https://huggingface.co/spaces/HumeAI/rw-voice-eq) and
[ASR](https://huggingface.co/spaces/HumeAI/asr-leaderboard) leaderboards expose
Apache-2.0 application code and aggregate results, but the Space source tree
contains no benchmark data and loads tables and optional samples from a
separately configured dataset. The paper explicitly describes its roughly
17-hour ASR evaluation as four private sets and does not release the fixed TTS
prompts, speech-to-speech scenarios, speech-understanding clips and labels,
source-item manifests, generations, human ratings, or standalone data terms.

The July 2026 SongSQA paper is also audited as a mixed public/internal
evaluation. Its public Lyra-SA component maps to the indexed, application-based
Tencent Music release, but the paper's separate 2,035-recording expert-rated
dataset is explicitly proprietary. The five random 8:1:1 evaluation splits are
not published, and the paper's demo streams only selected segments from its
five-song subjective study rather than a reusable benchmark package.

The July 2026 CaReCoS paper is recorded as an audited medical-acoustic
spectrogram reasoning protocol rather than a downloadable family. It derives
explicit and inferred question-answer pairs from seven named public cardiac,
respiratory, and cough datasets, but v1 provides no official project,
repository, dataset card, item manifest, generated spectrograms, questions,
answers, split definitions, or benchmark license. The public source corpora do
not themselves release CaReCoS's derived evaluation package.

The June 2026 SpeechDx paper is recorded as an audited clinical-speech
evaluation protocol rather than a downloadable family. It defines 27
classification and regression tasks over 12 named clinical speech datasets,
plus zero-shot cross-condition transfer. Version 1 provides no official
project, repository, unified manifest, processed clips, custom
speaker-disjoint splits, task mappings, evaluation code, or benchmark license.
The source corpora retain separate clinical-data access, consent, privacy, and
reuse terms, and independently obtaining them would not reproduce SpeechDx's
paper-specific evaluation package.

The July 2026 room-acoustics protocol study
[arXiv:2607.15243](https://arxiv.org/abs/2607.15243) is also recorded as an
audit rather than a benchmark family. It cleanly separates row-random
condition interpolation from receiver-grouped spatial prediction and audits
whether model inputs would exist at an unmeasured position. Its two-hall
impulse-response campaign and derived ISO 3382-1 parameter tables are
request-only, while scripts, split definitions, seeds, and per-fold results
are promised for a public repository only after acceptance. Version 1 links
no such repository and states no data or artifact license, so the index adds
neither a download helper nor an inferred release URL.

The June 2026 BCoughBench paper is likewise recorded as an audited respiratory
health protocol rather than a downloadable family. It evaluates nine
classification and three age-regression tasks over five named cough corpora,
each under smartphone audio and five EBEN-simulated body-coupled sensor
conditions. Version 1 releases no official benchmark manifest, subject splits,
transformed cough audio, code, or license for the derived evaluation package.
The public CC BY 4.0 Cough-COPD(CC) Zenodo archive and any independently
available source corpora or EBEN checkpoints do not reproduce BCoughBench's
exact selections and simulated evaluation artifacts.

The June 2026 Preference-ASR paper is also recorded as an audited protocol,
not a downloadable family. It describes 3,210 English preference-aware ASR
triples plus 335 standard items across normalization, entities, disfluencies,
and case. The official
[companion repository](https://github.com/nithinraok/preference-asr-bench)
contains evaluation and source-corpus reconstruction code but no benchmark
JSONL or audio, while its linked
[Hugging Face dataset](https://huggingface.co/datasets/nvidia/preference-asr-bench)
currently returns HTTP 401 to unauthenticated requests. The repository states
CC BY-SA 4.0 for author-created annotations and Apache-2.0 for code, but the
seven source corpora retain mixed open, gated, and research-only terms.

The July 2026 MeetingToM paper is likewise recorded as an announced protocol,
not a downloadable family. It describes 1,800 synchronized audiovisual AMI
meeting clips for mental-state, referential, and consensus reasoning, but its
official [GitHub repository](https://github.com/oliviaziyi/MeetingToM) still
promises benchmark files and evaluation code "Coming Soon," and its official
[Hugging Face repository](https://huggingface.co/datasets/OliviaWang1101/MeetingToM)
contains only a README. AMI's public source corpus does not make MeetingToM's
unreleased annotations, splits, or derived clips public.

The July 2026 VIP-MINGLE paper is also recorded as an announced multimodal
conversation corpus rather than a downloadable family. It describes roughly
59 hours of paired in-person and Zoom sessions from 32 groups, with raw
audio/video, diarized speech, transcripts, psychometrics, facial features, and
time-resolved ratings. Its official
[Zenodo record](https://doi.org/10.5281/zenodo.20670131) currently contains
only a README and explicitly says the full dataset will be released upon
publication. The record's CC BY-NC-ND 4.0 tag therefore applies only to the
placeholder release currently available, not absent media or code.

The July 2026 SceneBind paper is recorded as an audited protocol rather than a
downloadable family. It reports a human-verified 1,066-clip Binaural benchmark
and a 97-clip Sphere360 hard benchmark for semantic-spatial retrieval and
grounding, but the official [project page](https://scenebind.github.io/) exposes
only selected qualitative examples. No benchmark archive, item manifest,
repository, dataset card, license, or evaluation-code link is currently
provided, despite the paper describing its training split as released.

The July 2026 structured-audio-caption evaluation paper is also recorded as an
announced protocol rather than a downloadable family. It selects 499 public
AudioCards clips, uses ten released semantic fields, and adds five unreleased
targets for loudness, pitch, active onset, active offset, and ten-band spectral
profiles, then validates field-specific metrics with controlled perturbations.
Version 1 says the augmented dataset will be released but provides no project,
repository, dataset card, selected-item manifest, computed targets,
perturbation artifacts, evaluation code, or standalone data license. The
public AudioCards family remains indexed separately and must not be treated as
the unreleased augmented subset.

The July 2026 StellarTTS paper is recorded as existing Seed-TTS Eval coverage
rather than a new benchmark family. Section IV evaluates the public Mandarin
`test-zh` and `test-hard` configurations for objective intelligibility,
speaker similarity, latency, subjective quality, and duration-control
robustness. The official StellarTTS page provides selected listening samples
but no generated benchmark archive, item-level scores, comparison manifest,
listener records, evaluation repository, or artifact license; those
paper-specific materials remain unreleased.

The July 2026 *Sidewalk Moments* paper is recorded as a request-only
multimodal protocol rather than a public benchmark family. Its CityWalk Corpus
segments 61 public first-person YouTube walks into more than 50,000 ten-second
clips and evaluates video, temporally averaged image, audio, and text
representations against replay-heat engagement. The paper publicly releases
neither its video list nor clip boundaries, replay labels, ImageBind audio
embeddings, splits, human annotations, or code; its Data and Code Availability
statements instead direct requests to the corresponding author. Public source
videos do not provide a redistribution license for those derived artifacts,
so no dataset link or download helper is inferred.

The July 2026 Harness TTS paper is likewise recorded as two internal,
unreleased evaluation protocols rather than downloadable benchmark families.
Its routing evaluation contains 630 LLM-generated cases over a simulated
42-tool registry, while its synthesis evaluation uses 135 generated utterance
cases and a private 25-clip single-speaker prompt library. Version 2 and its
official arXiv source package provide no cases, registry, prompt audio,
generated speech, teacher labels, judge records, scores, code, artifact
license, or author-controlled repository. A similarly named third-party
GitHub repository explicitly describes an independent reproduction and is not
treated as the paper's official release.

The July 2026 Chengdu Mandarin forced-alignment paper is recorded as an
unreleased protocol rather than a downloadable family. It evaluates
text-dependent alignment and transcript-free phonetic segmentation against 50
minutes of expert word- and phone-level boundaries selected from a 17.7-hour,
15-speaker corpus. Although version 1 says that its Chengdu-MFA and Chengdu-FC
models and reviewed 2,876-character G2P dictionary are released, the paper and
source package provide no project, repository, model card, archive, code URL,
artifact license, corpus files, selected-item manifest, or manual annotations.

The July 2026 Instruct-FD paper is likewise recorded as an unreleased
full-duplex spoken-dialogue protocol rather than a downloadable family. It
reports 912 English test cases across 29 scenarios for instructed listening,
backchanneling, interruption, continuation, and acknowledgment behavior.
Version 1 provides schemas and prompt examples but no official project,
repository, dataset card, scenario files, selected persona rows, synthesized
audio, timestamp manifests, test-case JSON, orchestrator, judge implementation,
human annotations, or data license. The linked
[Nemotron-Personas-USA](https://huggingface.co/datasets/nvidia/Nemotron-Personas-USA)
corpus is only an upstream input to some synthetic conversations and is not an
Instruct-FD release.

The July 2026 StemFX paper is recorded as a mixing-style representation
protocol over the existing FMA and MUSDB18 families rather than a new benchmark
dataset. It trains on source-separated, randomly effect-augmented FMA and
evaluates retrieval and style transfer on balanced ten-second MUSDB18 windows.
The official [StemFX repository](https://github.com/barry-mir/stemfx) releases
MIT-licensed model code, weights, and evaluation entry points, but expects
locally prepared derived directories and does not publish the exact selected
windows, paired FX audio, effect seeds or chains, listener responses, or score
records. The existing FMA and MUSDB18 access paths and their upstream license
constraints therefore remain authoritative.

The July 2026 Andha-Dhun paper is recorded as an announced Hindi
audio-description dataset and evaluation protocol rather than a downloadable
family. It reports 5,870 timestamped descriptions synchronized to eight
full-length movies, then uses short video-description pairs for zero-shot
generation evaluation and a four-movie bilingual subset for translation and
cultural-adaptation analysis. The official
[repository](https://github.com/katha-ai/AndhaDhun-HindiAD) currently contains
only a 93-byte README saying “Coming soon!”, with no transcripts, media
manifest, splits, annotations, evaluation artifacts, code, or license. The
paper's CC BY-NC-ND 4.0 terms do not license absent files or the underlying
movie, AudioVault, public-platform, and IMDb-derived materials.

The July 2026 artifact-specific speech-deepfake paper is recorded once as a
coverage audit rather than a new benchmark family. Section 4.1 uses ASVspoof
2015 only for selected calibration attacks, then draws training or held-out
evaluation speech from ASVspoof 2019, ASVspoof 5, and SpoofCeleb; section 5
reports results on those same corpus families. All four are already indexed
with their official access and license constraints. The paper's artifact
transformations create an internal training protocol, not a separately
released evaluation dataset.

The July 2026 speech-to-speech assistant safeguards paper is also recorded as
an unreleased protocol rather than a benchmark family. Its automotive case
study crosses three vendor systems, three guardrail configurations, and
malicious versus non-malicious speech, repeating each of the 18 setups 300
times to measure response latency and guardrail execution. The malicious input
is synthetic speech containing the benign trigger word “whale,” and detection
accuracy is explicitly outside the study. Version 1 and its official arXiv
source package provide no prompt or audio manifest, per-run measurements,
outputs, code, project page, repository, or dataset release; the article's CC
BY-NC-ND 4.0 license must not be treated as licensing absent experiment
artifacts or vendor API outputs.

The July 2026 TF-MossFormer paper is also recorded as existing coverage rather
than a new family. Sections 3.1-3.3 evaluate only the indexed WSJ0-2Mix
benchmark: 8 kHz two-speaker mixtures with 20,000 training, 5,000 validation,
and 3,000 speaker-disjoint test examples scored with SI-SDRi and SDRi. The
paper introduces a separation model, not a new public mixture manifest, and it
does not change the underlying LDC WSJ0 access and redistribution constraints.

The July 2026 audit of protocol-level shortcuts in audio-language-model judges
uses four established speech corpora. RAVDESS, FLEURS, and VoxCeleb were
already indexed; this sweep adds the missing public
[BVCC](https://zenodo.org/records/6572573) family used for its naturalness
probe. The paper's balanced RAVDESS selection, four-language FLEURS selection,
60 BVCC test pairs, and 100 VoxCeleb1 triplets remain unreleased derived
protocols, so the index does not imply that their item manifests or evaluation
code are public.

The July 2026 codec-internal latent-watermarking paper is likewise recorded as
an audited model protocol, not a downloadable benchmark family. Sections
4.1-4.7 use an unspecified 1,000-sample slice of gated Emilia-English to measure
32-bit recovery and speech quality under signal-processing and neural-codec
attacks, but v1 provides no item manifest, split recipe, checkpoints, attack
implementation, score records, project page, or code repository. The official
[Emilia repository](https://huggingface.co/datasets/amphion/Emilia-Dataset)
also has a material terms conflict: its metadata tag says CC BY 4.0 while its
gated access agreement says the original Emilia data is CC BY-NC. Neither
designation releases or identifies the paper's evaluation subset.

The July 2026 BirdCLEF working-paper sweep adds the official
[BirdCLEF++ 2026](https://www.imageclef.org/BirdCLEF2026) family. The primary
paper reports 522.1 hours of focal recordings and Pantanal soundscapes, with
1.03 labeled soundscape hours and 234 target species for multi-label
five-second-window prediction. Data access remains behind Kaggle account login
and competition-rule acceptance. The official LifeCLEF page does not state a
standalone data license, and Xeno-canto-derived focal recordings may retain
recording-specific terms, so the helper saves provenance only and prints the
manual access path.

The July 2026 SSTMark paper is also recorded as existing-family coverage rather
than a new benchmark. Sections 5.1-5.4 reuse the indexed AudioMarkBench no-box
perturbation categories and use LibriSpeech `train-clean-100` prompts to
generate speech, including 1,000 clean samples for detector-threshold
calibration. The authors add stronger attack settings, but version 1 exposes no
official project page, code or data repository, prompt-row manifest, generated
speech, watermarked or attacked variants, predictions, or per-item scores.
AudioMarkBench's MPL-2.0 covers its public evaluation code, not SSTMark's absent
artifacts; its released audio also retains mixed upstream terms.

The July 2026 TalTech BeTraC system paper adds the public
[Synth-DoPaCo](https://huggingface.co/datasets/BeTraC/betrac-2026) family for
long-form audio-to-SOAP evaluation. Its ungated CC BY 4.0 release contains
7,200 training and 400 development conversations with audio, transcripts,
metadata, and reference notes. The challenge's 875-item blind test set mixes
600 synthetic, 272 acted, and three realistic recordings and remains withheld;
the index does not imply public access or license coverage for those test
recordings.

The public [MCIF](https://huggingface.co/datasets/FBK-MT/MCIF) release adds a
multimodal, crosslingual instruction-following family built from ACL 2023
scientific talks. It evaluates 13 recognition, translation, question-answering,
and summarization tasks across speech, video, and text, with fixed or varied
instructions and English, German, Italian, and Chinese outputs. Lightweight
manifests and references are fetched by default; the shared 7.58 GiB media
snapshot is opt-in.

The July 2026 AIS-aligned passive-acoustic labelling paper is recorded as an
audited data-construction protocol rather than a downloadable family. It
describes aligning approximately 950,000 hydrophone windows with 6.9 million
AIS reports to create range-aware no-, single-, and two-contact classes, but
v1 provides no source archive, station/date manifest, AIS source, Parquet
product, SQL/code release, repository, DOI, access instructions, or data
license. Its deterministic method does not make the inputs or resulting data
public, and the paper explicitly treats AIS-derived labels as weak contextual
indicators rather than acoustic ground truth.

The July 2026 RIME paper is recorded as an audited agentic music
post-production protocol rather than a downloadable family. Its evaluation
uses approximately 3,000 input, edited-audio, and instruction triples derived
from 297 MTG-Jamendo tracks, plus 300 artifact-removal triples. The paper and
its arXiv source package provide no official project, repository, dataset card,
archive, source-track manifest, recipes, prompts, processed audio, evaluation
records, code link, or derived-data license. Public access to the indexed
MTG-Jamendo source corpus therefore does not reproduce or release RIME.

The March 2026 DEAF paper is also recorded as an audited protocol rather than a
downloadable family. It describes 2,756 acoustic-semantic conflict stimuli for
emotion, background sound, and speaker identity, but v2 provides no official
project, repository, dataset card, archive, or download URL. Public source
components such as DEMAND do not make DEAF's derived stimuli, prompts, labels,
or evaluation code public.

The July 2026 NegEval-Audio paper is recorded as an audited protocol rather
than a downloadable family. It derives negation-aware retrieval and
multiple-choice tasks from AudioCaps and Clotho and reports a 96.7% human
agreement audit over 460 automatically verified negative concepts. It also
constructs 1,000 controlled ESC-50 target-distractor mixtures for a text-side
diagnostic. Version 1 provides no official project, repository, dataset card,
item files, concepts, queries, MCQs, prompts, human judgments, mixture recipes,
derived audio, evaluation code, or score records. The public source datasets
do not make or license NegEval-Audio's derived artifacts.

The July 2026 sound-symbolism paper is likewise recorded as an audited
speech-perception protocol rather than a downloadable family. It tests two
spoken bouba/kiki stimuli across 25 prompt languages, 536 human-recorded
pseudowords, audio-to-shape matching, and a 90-shape visual control. Its sole
cited anonymous code interface currently requires authentication and exposes
no verifiable files, revision, prompts, item manifest, model outputs, scores,
or standalone artifact license. Some source-study stimuli are public or
available from their corresponding author for academic research, but that
does not release the paper's exact evaluation package.

The July 2026 *Production-Oriented Framework for Evaluation of SFX
Generation* paper is likewise recorded as an audited protocol rather than a
new downloadable family. It adapts five systems on ESC-50 folds 1-3, validates
on fold 4, and generates 4,000 variants per system from the 400 fold-5
references. Its official
[project page](https://melodiedesbos.github.io/A-PRODUCTION-ORIENTED-FRAMEWORK-FOR-EVALUATION-OF-SFX-GENERATION/)
streams selected demonstrations and aggregate results, but provides no
repository, complete generated-output set, trial manifest, listener ratings,
evaluation code, or artifact license. Public CC BY-NC 3.0 ESC-50 data
therefore makes the source protocol reproducible only in part; it does not
constitute a released derived benchmark.

The July 2026 *Multimodal Speaker Verification as a Threat to Speaker
Anonymization* paper is also recorded as an audited protocol. It evaluates
speaker-disjoint Fisher English trials using up to five original or
Stream-Voice-Anon-anonymized utterances and acoustic, linguistic, and prosodic
representations. Its official
[repository](https://github.com/Ashigarg123/multimodal-speaker-verification)
currently contains only a README promising code and pretrained models; it does
not release the custom speaker splits, trial lists, anonymized derivatives, or
evaluation implementation. Licensed access to Fisher English therefore does
not reproduce the paper's protocol.

The July 2026 *Do Speech Tokens Leak Voiceprints?* paper is recorded as a
coverage audit over the already indexed VoxCeleb family. It trains and tests
SpInv on standard speaker-disjoint VoxCeleb1 and VoxCeleb2 partitions to
measure voiceprint leakage from Moshi, Higgs3, Kimi-Audio, and Qwen3-Omni
frontends. Version 1 provides no project page, repository, attack checkpoints,
extracted frontend representations, per-item predictions, or score files.
VoxCeleb's surviving public metadata and trial lists therefore cover the
source family but not the new attack implementation, so no duplicate family
or download helper is added. The original YouTube media is no longer available
from the owner pages and retains separate rights, privacy, and platform terms.

The July 2026 *From Read Speech to Spoken Digits* paper is recorded as a
coverage audit over the already indexed AudioMNIST, Speech Commands, and
LibriSpeech families. It evaluates isolated digits and constructed ten-digit
sequences against informed ASR and digit-specific attackers under three
obfuscation methods, but the cited
[PPCA repository](https://github.com/ol-MEGA/ppca) currently provides only
general speech-privacy and SpeechBrain recipes. It does not release the
paper-specific sequence manifests, concatenated audio, oracle boundaries,
trained informed models, digit-recognition evaluation code, or per-item
scores. Public access to the three source corpora therefore does not reproduce
the derived protocol, and no duplicate family or download helper is added.

The July 2026 *Self-supervised Speech Comparison for L2 Phone, Rhythm, and
Intonation Scoring* paper maps to the official
[UME-ERJ](https://doi.org/10.32130/src.UME-ERJ) and
[UME-JRF](https://doi.org/10.32130/src.UME-JRF) source families. Their rated
English and Japanese sentence and word subsets support phone, holistic
pronunciation, rhythm, intonation, and difficult-sound scoring for L2 learners.
NII/SRC provides both corpora only after a usage pledge and review and permits
research use only. The paper's TIMIT and LibriSpeech dependencies map to
existing entries.

The July 2026 *Towards a reproducible cross-venue method for quantifying crowd
noise in stadiums* paper is recorded as a proposed-protocol audit. It defines
Class 1 instrumentation, far-field placement, fast-integrated A-weighted
levels, and single- versus multi-anchor stadium crowd-level metrics. Section
5.2.2 explicitly states that no test cases are shared and that a sports-venue
crowd-noise database remains future work. Its PSV Eindhoven–RKC Waalwijk goal
measurement is an explanatory figure rather than a released test set, so the
index adds no benchmark family, download link, or helper.

The July 2026 *X-Translator* paper is likewise recorded as a mixed
existing-coverage and unreleased-selection audit. Its short-form evaluation
uses the indexed OpenSTBench protocol; the long-form, multi-speaker, and
multilingual experiments draw from WenetSpeech, VoxConverse, FLEURS,
TEDLIUM-3, and unspecified public Bilibili interviews. The official
[repository](https://github.com/zhaoyx239/X-Translator) currently releases
the demo and backend adapters but explicitly lists evaluation code as future
work. It provides no sampled recording or sentence-ID manifests, interview
URLs, generated speech, runtime logs, predictions, or scores. OpenSLR resource
51, historically associated with TEDLIUM Release 3, currently reports
“Resource not found,” so the index does not invent a replacement download
link or claim that the paper-specific selections are public.

The July 2026 *Audio Diarization* paper is likewise recorded as existing
coverage rather than a new benchmark family. Its known-class experiment uses
the indexed DESED evaluation subset, while DMix-known and DMix-unknown mix six
known or six unseen ESC-50 classes into eligible DESED clips. Version 1
provides no official project, repository, dataset card, mixture manifest,
random seed, generated audio, energy-threshold labels, evaluation code, or
per-item scores. The public DESED and ESC-50 source corpora therefore do not
reproduce the two derived DMix evaluations, and their respective upstream
terms still apply.

The July 2026 *A Production-Oriented Framework for Evaluation of SFX
Generation* paper is also recorded as existing ESC-50 coverage plus a partial
demo release. Its shared audio-to-audio variation protocol trains on official
folds 1-3, validates on fold 4, and generates ten variants for each of eight
fold-5 references per class, or 4,000 outputs per model. The official
[project repository](https://github.com/melodiedesbos/A-PRODUCTION-ORIENTED-FRAMEWORK-FOR-EVALUATION-OF-SFX-GENERATION)
publishes 72 illustrative WAV files and result figures, but no complete
generated corpus, reference/output manifest, evaluation code, randomized
listening-test selection, listener responses, or per-item scores. ESC-50
therefore remains the indexed public family; the demo-only artifacts do not
justify a duplicate family or helper. The repository states no license for
its demo audio, while upstream ESC-50 remains CC BY-NC 3.0.

The July 2026 AMECxSV paper led to a new TidyVoice family entry. Its main
experiment uses a speaker-disjoint held-out split derived from the public
TidyVoiceX development protocol, rather than the challenge's hidden evaluation
set. The official Mozilla Data Collective release contains 321,711 utterances
(457 hours) from 4,474 multilingual speakers across 40 languages and requires
an account/API key. Although its page labels the data CC0-1.0, it expressly
permits only speaker verification and forbids speaker identification or
identity recovery; the index and helper preserve that restriction.

The July 2026 voice-concept bottleneck paper adds public clinical-voice
coverage through the Perceptual Voice Qualities Database (PVQD). Section 3.1
uses an 80:20 speaker split and VAD-derived vowel and sentence segments, while
the official release provides 296 whole-speaker WAV files plus CAPE-V, GRBAS,
and demographic spreadsheets. The index therefore links the public PVQD
family without claiming that the paper's derived split or segments are
released. Its Androids Corpus and TORGO sources are also indexed. The TORGO
entry preserves the paper's headMic-only, leave-one-speaker-out protocol
without claiming that this derived split is separately released.

The July 2026 AV-SyncBench paper is recorded as an announced audiovisual
synchronization protocol, not a downloadable family. It describes 3,269
in-the-wild videos and 38,390 temporal and semantic challenge samples, but the
official [GitHub repository](https://github.com/fgt7t6g/AV-SyncBench) says the
evaluation code and dataset will be released soon, while the official
[Hugging Face repository](https://huggingface.co/datasets/coming245/AV-SyncBench)
contains only README metadata and no dataset files. Its MIT card tag therefore
does not establish reuse rights for the unreleased benchmark or source videos.

The July 2026 MultiRef-Compass paper is also recorded as an audited protocol,
not a downloadable family. It defines 350 multi-reference audio-video
generation samples and a 14-sub-metric evaluation across basic quality,
reference consistency, audio-visual consistency, and instruction following,
but v1 provides no official project, repository, dataset card, archive, item
file, or evaluation-code link. The paper's CC BY 4.0 license does not release
its prompts, reference assets, metric routing, judge prompts, or implementation.

The July 2026 PC-Mix paper is recorded as an audited partial-component audio
spoofing benchmark rather than a downloadable family. It describes 126,586
mixed-audio recordings (140.65 hours) with speech and environmental-sound
authenticity labels and five evaluation conditions, but its sole official
[anonymous repository](https://anonymous.4open.science/r/PC-Mix-3AFE/)
currently redirects to an API response of HTTP 401 `not_connected`. No files,
manifest, license, or alternative official release can be verified, so the
paper's claim of a public code/data release is not treated as a usable download.
The mixed source corpora and generated components would also retain their own
terms if the release becomes available.

The July 2026 ECoM Reasoning paper is likewise recorded as an audited spoken
math protocol rather than a downloadable family. Section 4.1 evaluates the
complete STITCH synthesized-speech set derived from AddSub, SingleEq,
MultiArith, and SVAMP, plus a Llama Questions subset through UltraEval-Audio.
The official [ECoM code release](https://github.com/FunAudioLLM/FunResearch/tree/main/ECoM-Reasoning)
contains data-construction utilities and placeholder manifests that require
user-supplied JSONL paths; it does not release the exact synthesized audio,
selected items, or evaluation manifests. The parent repository is Apache-2.0,
but that code license does not license the absent evaluation data or its
upstream datasets.

Version 2 of the July 2026 full-song generation report is also recorded as an audited
protocol rather than a downloadable family. Section 3.2 reports a 500-case
test set balanced across eight genres and five languages, evaluated with
SongBench, SongEval, AudioBox-Aesthetic, and CMI-Reward, while section 3.1 uses
separate 200-song codec-ablation sets and a 100-song expert listening study.
Version 2 clarifies that prompts, lyrics, codec tokens, song lengths, seeds,
and sampling recipes are fixed across its four controlled ablation variants,
but does not publish those inputs.
The official [project page](https://hifi-song-generation.github.io/) streams
selected qualitative and comparison examples but does not release the complete
prompts, held-out songs, codec inputs, per-item outputs, scores, ratings, or a
data license. Public SongEval and CMI-RewardBench releases are indexed
separately and must not be mistaken for the report's unreleased evaluation
sets.

The July 2026 human-versus-ASR diverse-speech study is recorded as a coverage
audit of the existing JASMIN-CGN family. It selects 120 human-machine-dialogue
utterances—40 each for Dutch children, Dutch older adults, and Flemish
teenagers or older adults—and separately reports three ASR systems on the full
group test sets. The paper does not publish the selected utterance identifiers,
normalization or selection scripts, listener transcriptions, ASR hypotheses,
or evaluation code. JASMIN-CGN's official signed-license access path remains
indexed, but access to that corpus does not reconstruct this listening-study
protocol, so no duplicate family or download helper is added.

ChronosAudio is recorded as an audited long-audio protocol rather than a
downloadable family. The paper describes 36,000 English test instances over
6,000 synthetic clips and more than 200 hours, with dictation, localization,
transcription, multispeaker, comprehension, and summary tasks spanning 30
seconds to 20 minutes. Its only official code/data link is an anonymous
[4open.science repository](https://anonymous.4open.science/r/ChronosAudio-D49A)
that currently returns HTTP 401 `not_connected`, so no files, exact manifest,
or benchmark-data license can be verified. The paper is CC BY 4.0 and attributes
its source text to SQuAD/Wikipedia under CC BY-SA 4.0, but those statements do
not establish rights for the unavailable annotations or generated audio.

The July 2026 RaagBase paper is recorded as an audited symbolic-music
classification protocol rather than a downloadable family. It describes a
single CSV of 116 manually transcribed Hindustani compositions across Bhairav,
Poorvi, and Todi, represented as note sequences and frequency features for
graph clustering. Its sole claimed
[4open.science release](https://anonymous.4open.science/r/RaagBase-5427/)
currently returns HTTP 401 `not_connected`, so no files, schema, code, or
dataset-specific license can be verified. The paper's CC BY 4.0 license does
not license the unavailable CSV or establish rights for its notation
transcriptions, and no download helper is added.

The July 2026 SCoPE paper is recorded as a coverage audit of IEMOCAP and MELD
rather than a new benchmark family. Sections 4-5 use the conventional
six-class IEMOCAP task and seven-class MELD task with pre-extracted multimodal
features attributed to the SDT baseline, then derive same-speaker emotion-shift
labels and report Accuracy and weighted F1 over ten runs. The paper provides no
project page, code repository, exact feature or split package, shift-label
file, checkpoints, predictions, or score records. Existing access and license
caveats remain authoritative: IEMOCAP is request-gated, while MELD declares
GPL-3.0 but contains Friends-derived media requiring separate rights review.
No duplicate family or download helper is added.

The July 2026 *Cumsum-Composable Phase Transport for Low-Cost Streaming
Keyword Spotting* paper is recorded as a coverage audit over the already
indexed Speech Commands v2 family. Sections 3-4 use one-second 16 kHz clips in
the conventional 12-class setup, subsample the unknown class, synthesize
silence from the corpus background-noise clips, and report single-seed
clip-classification accuracy. Although the architecture has an exact online
form, the paper does not evaluate continuous-stream trigger metrics and
publishes no official code, configuration, split manifest, checkpoints,
predictions, or score records. The public CC BY 4.0 Speech Commands release and
its existing helper therefore remain authoritative; no duplicate family or
paper-specific helper is added.

The July 2026 *Scalable Keyword Spotting via Modular Network Expansion* paper
is likewise recorded as an existing-family audit rather than a new benchmark.
Sections 4.1-4.4 run five paired-command expansion tasks over the official
Speech Commands v2 splits, using Common Voice v17 test audio only as negatives
to calibrate per-keyword thresholds at 1% false accept rate. False reject rate
is then measured on Speech Commands positives over eight seeds. The paper
releases no official code, exact Common Voice negative manifest, processed
features, configurations, checkpoints, predictions, or score records. The
public Speech Commands and Common Voice access paths and licenses therefore
remain authoritative, and no duplicate family or paper-specific helper is
added.

The July 2026 hybrid-feature ASV paper is likewise recorded as an
existing-coverage audit over Speech Commands rather than a new benchmark
family. It randomly selects 30 speakers and 100 utterances per speaker,
concatenates five-utterance sequences, and tests 3,600 speaker/model trials per
setup under clean conditions and NOISEX-92 babble and Volvo noise at five SNR
levels. The paper releases no selected-file list, random seed, concatenation
manifest, noisy derivatives, trial keys, code, or scores. Speech Commands
remains publicly available under CC BY 4.0, while the cited primary NOISEX-92
paper does not establish a current official public archive or redistribution
terms; the index therefore adds neither an invented noise download nor a
paper-specific helper.

The July 2026 *Explainable-by-Design Audio Deepfake Detection via Wiener-Hopf
Linear Prediction* paper adds recent evaluation provenance for ASVspoof 2019,
FakeOrReal, and DiffSSD. The public, ungated
[DiffSSD](https://huggingface.co/datasets/purdueviperlab/diffssd) release has
70,000 English synthetic utterances from ten TTS systems plus a 94,226-row
real/synthetic train-validation-test manifest. The approximately 16.9 GiB
synthetic-audio archive is opt-in, while real LJ Speech and LibriSpeech files
must be obtained separately. DiffSSD applies CC BY-NC-ND 4.0 only to its
synthetic voices and incorporates the source-corpus, text-generation, and TTS
system terms. The paper publishes no implementation or perturbation artifacts.
The [Fake-or-Real](https://bil.eecs.yorku.ca/datasets/) owner page publicly
serves more than 195,000 real and synthetic utterances in original, normalized,
two-second, and rerecorded variants. Its four archives total approximately
16.0 GiB and remain explicit helper opt-ins. The page states no
dataset-specific license or reuse terms, so users must review and obtain any
needed permissions for its CMU Arctic, LJ Speech, VoxForge, generated-voice,
and lab-recording components.

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
| [MMAR / MMAR-Rubrics](https://github.com/ddlBoJack/MMAR) | Deep audio reasoning and chain-of-thought quality evaluation | Public 1,000-item benchmark plus released instance-level reasoning/rubric metadata and evaluator from the [Interspeech 2026 Audio Reasoning Challenge](https://arxiv.org/abs/2602.14224); helper downloads the approximately 2.7 MB metadata/docs/scripts by default while the approximately 2.99 GB [BoJack/MMAR](https://huggingface.co/datasets/BoJack/MMAR) audio snapshot is opt-in | HF card declares CC BY-NC 4.0 for its snapshot, but the GitHub repository states no separate license for later rubric annotations or code; original media rights and platform terms remain relevant |
| [MMSU](https://github.com/dingdongwang/MMSU) | Audio understanding | [ddwang2000/MMSU](https://huggingface.co/datasets/ddwang2000/MMSU) | HF card lists `mit`; code repo had no detected license |
| [Big Bench Audio](https://huggingface.co/datasets/ArtificialAnalysis/big_bench_audio) | Spoken question answering and reasoning | Public, ungated 1,000-recording English set with 250 questions each from the BIG-Bench Hard formal-fallacies, navigate, object-counting, and web-of-lies tasks; helper downloads official docs/API metadata and Xiaomi's evaluator loader by default while the approximately 612 MB repository snapshot is opt-in | HF card declares MIT and Xiaomi evaluator code is Apache-2.0; review inherited BIG-Bench Hard task terms and OpenAI/Azure/AWS synthesized-voice output conditions |
| [MMAU-Pro](https://sonalkum.github.io/mmau-pro/) | Holistic audio understanding and reasoning | Public, ungated [gamma-lab-umd/MMAU-Pro](https://huggingface.co/datasets/gamma-lab-umd/MMAU-Pro) with 5,305 expert-authored QA items across 49 speech, sound, music, long-form, multi-audio, and spatial skills; helper downloads official docs/evaluator/metadata by default while the approximately 47.5 GB snapshot is opt-in | HF card declares CC BY-NC 4.0, but in-the-wild source media and the EasyCom-derived spatial subset retain upstream terms; evaluator code has no stated license |
| [MUGEN](https://github.com/danielqwer/MUGEN) | Multi-audio grounding and understanding | Public, ungated [35-task Hugging Face collection](https://huggingface.co/MUGEN-Benchmark) with 1,750 five-way problems and 9,250 clips across speech, sound, music, paralinguistics, temporal analysis, and compositional reasoning; helper downloads official metadata by default and requires an explicit task name before fetching audio | Dataset cards state no data license; repository software/docs are MIT, while embedded audio retains mixed public-corpus, academic-corpus, Mozilla Data Collective, and synthesis-source terms |
| [TREA](https://github.com/iiscleap/Audio-LLM-benchmarking-uncertainty) | Fine-grained temporal audio reasoning | Public, ungated 600-item benchmark with 200 ordering, 200 counting, and 200 duration questions in multiple-choice and open-text formats; helper downloads official docs and lightweight CSV annotations by default while the approximately 688 MiB repository/audio clone is opt-in | Repository declares CC0-1.0, but all audio is derived from ESC-50, whose CC BY-NC 3.0 terms and per-clip attribution remain relevant; do not assume the repository waiver clears upstream audio rights |
| [LAT-Bench](https://huggingface.co/datasets/mcshao/LAT-Bench) | Long-form temporal audio understanding and captioning | Public, ungated Chinese/English metadata and task annotations for 40 hours of URL-referenced audio up to 30 minutes, covering dense audio captioning, temporal grounding, and targeted captioning; helper downloads the approximately 2.6 MB release and docs by default without retrieving source media | HF card declares CC BY-NC 4.0 and evaluation repository is Apache-2.0; externally hosted source recordings retain their own rights and platform terms |
| [ESCUCHA](https://github.com/ferugit/ESCUCHA) | Spanish speech understanding and reasoning | Public JSON/TSV annotations for 1,000 questions spanning MCQA, multi-audio comparison, spoken questions, and audio instruction following; helper downloads the approximately 2.2 MB annotations/docs/scorer while source audio remains URL-based and is not redistributed | No data or code license is specified; arXiv's CC BY 4.0 covers the paper, not the release or source recordings, whose rights and platform terms still apply |
| [Ghana Speech Eval](https://huggingface.co/datasets/ghananlpcommunity/ghana-speech-eval) | Low-resource multilingual ASR | Public, ungated fixed evaluation set with 9,967 clips across 10 Ghanaian languages sampled from AfriSpeech; helper downloads official cards and metadata by default while the approximately 594 MB snapshot is opt-in | Benchmark card declares CC BY 4.0, but the current AfriSpeech source card/API state no repository-level license; confirm upstream collection, consent, and reuse terms |
| [MSU-Bench](https://github.com/ASLP-lab/MSU-Bench) | Speaker-centric multi-speaker conversational understanding | Public, ungated [ASLP-lab/MSU-Benchmark](https://huggingface.co/datasets/ASLP-lab/MSU-Benchmark) with 2,847 bilingual QA items over 241 clips; helper downloads official docs and the approximately 5.8 MB test JSONL by default while the approximately 2.5 GB audio/annotation snapshot is opt-in | HF card declares CC BY-NC 4.0 and non-commercial academic-research use; third-party film/TV, telephone, meeting, and podcast media terms remain controlling; code is MIT |
| [KVoiceBench / KOpenAudioBench / KMMAU](https://arxiv.org/abs/2605.27984) | Korean spoken QA and audio understanding | Three public, ungated KRAFTON releases with 12,345 samples: [KVoiceBench](https://huggingface.co/datasets/KRAFTON/KVoiceBench), [KOpenAudioBench](https://huggingface.co/datasets/KRAFTON/KOpenAudioBench), and [KMMAU](https://huggingface.co/datasets/KRAFTON/KMMAU); helper downloads official metadata by default while the approximately 9.7 GB combined snapshots are opt-in | Spoken-QA cards declare Apache-2.0 and KMMAU declares CC BY-NC-SA 4.0; adapted benchmark content and KSS/KMSAV/Seoul Corpus source terms may also apply; evaluation code is Apache-2.0 |
| [AIR-Bench](https://github.com/OFA-Sys/AIR-Bench) | Audio-language model evaluation | Official [ACL paper](https://aclanthology.org/2024.acl-long.109/), [evaluation repo](https://github.com/OFA-Sys/AIR-Bench), and [qyang1021/AIR-Bench-Dataset](https://huggingface.co/datasets/qyang1021/AIR-Bench-Dataset); helper downloads docs by default and makes the large HF snapshot opt-in | HF dataset card lists CC BY-NC 4.0 and mixed component-source terms; evaluation code is Apache-2.0 |
| [AudioBench](https://github.com/AudioLLMs/AudioBench) | Universal audio-language model evaluation | Public evaluation toolkit, supported-dataset inventory, and [NAACL 2025 paper](https://aclanthology.org/2025.naacl-long.350/); helper downloads lightweight official metadata by default and makes the toolkit clone opt-in without fetching upstream corpora | Each component dataset retains its own terms; the toolkit license only says Creative Commons NonCommercial without naming a version |
| [AF-Reasoning-Eval](https://github.com/NVIDIA/audio-flamingo/tree/soundCoT/AF_Reasoning_Eval) | Sound question answering, classification, and common-sense reasoning | Public NVIDIA release with 150 Clotho-AQA-derived questions and 7,227 FSD50K-derived classification items (plus a 300-item mini subset); helper downloads all four annotation JSONs while source audio remains with Clotho-AQA and FSD50K | Benchmark metadata is CC BY 4.0 and code is MIT; upstream audio retains mixed per-file Freesound/FSD50K Creative Commons terms |
| [MUSIC-AVQA](https://gewu-lab.github.io/MUSIC-AVQA/) | Audio-visual question answering | Official [project page](https://gewu-lab.github.io/MUSIC-AVQA/), [GitHub repo](https://github.com/GeWu-Lab/MUSIC-AVQA), and public JSON annotations; helper downloads docs/annotations by default while raw videos remain manual | Dataset license not specified; code license is conflicting across GitHub LICENSE/API and README, so re-check before reuse |
| [AVQA](https://mn.cs.tsinghua.edu.cn/avqa) | Audio-visual question answering and cross-modal reasoning | Public QA annotations, VGGSound-derived video manifest, and feature/raw-video pointers through the official OneDrive/Baidu release; helper saves primary-source docs and leaves archive/media retrieval manual | Official page permits noncommercial personal/classroom copying and requires permission for broader redistribution; code license is unspecified, and VGGSound/YouTube source-media rights also apply |
| [OmniBench](https://m-a-p.ai/OmniBench/) | Tri-modal image, audio, and text question answering | Public, ungated [m-a-p/OmniBench](https://huggingface.co/datasets/m-a-p/OmniBench) with 1,142 four-choice questions across seven task types and speech, sound-event, and music audio; helper downloads docs/API metadata by default and makes the approximately 1.26 GB snapshot opt-in; OPOD evaluates it as its omni-modal benchmark | Data and code licenses are unspecified; the project footer's CC BY-SA 4.0 link does not clearly license the benchmark or component media, so clarify terms and source-media rights before redistribution or commercial use |
| [LLP](https://github.com/YapengTian/AVVP-ECCV20) | Weakly supervised audio-visual video parsing | Official annotation CSVs for 11,849 ten-second YouTube segments, including dense audio/visual labels for validation and test; helper downloads docs and annotations by default while extracted features remain a manual Google Drive download | No clear data or code license; the README claims GPLv3 but links to an unrelated repository's license, and source videos retain YouTube/upstream terms |
| [AVSD](https://github.com/hudaAlamri/DSTC7-Audio-Visual-Scene-Aware-Dialog-AVSD-Challenge) | Audio-visual scene-aware dialogue and response generation | Official DSTC7 repository and released Google Drive data for dialogs over more than 11,000 Charades videos; helper saves public docs/license and prints the manual dataset/media paths | Repository code is MIT; no separate license statement was found for the Drive-hosted annotations or underlying Charades videos, so review upstream terms and media provenance |
| [InterPet4D](https://huggingface.co/datasets/ohicarip/interpet4d) | Audio-conditioned human-pet interaction and multimodal motion generation | Public, ungated v1 release with 227 egocentric audio clips plus aligned MERT, human-body, hand, dog-skeleton, and SMAL motion data; helper downloads official metadata by default and makes the approximately 10.7 GB snapshot opt-in | HF card declares CC BY-NC 4.0, while the paper requires a data-use agreement prohibiting redistribution, surveillance, and biometric identification; apply the stricter paper terms pending clarification |
| [AVA Active Speaker](https://research.google.com/ava/) | Audio-visual active speaker detection and visible-speaker localization | Public v1.0 labels for 3.65 million frames across about 39,000 face tracks and 160 available AVA clips; helper downloads docs and the video manifest by default, with the approximately 23 MB annotation archives opt-in | Google releases the listed AVA datasets under CC BY 4.0; repository code has no stated license, and source-movie/media terms and availability still require review |
| [DAVE](https://github.com/gorjanradevski/dave) | Diagnostic audio-visual alignment and temporal reasoning | Public, ungated [gorjanradevski/dave](https://huggingface.co/datasets/gorjanradevski/dave) with EPIC-KITCHENS and Ego4D splits; helper downloads cards, loader, and about 9 MB of JSON annotations by default and makes the approximately 113.3 GB media snapshot opt-in | HF card labels DAVE MIT and the repo README says everything is MIT, but the repo lacks a LICENSE file; EPIC-KITCHENS and Ego4D upstream media/access terms still apply |
| [Daily-Omni](https://lliar-liar.github.io/Daily-Omni/) | Temporal audio-visual question answering and cross-modal reasoning | Public, ungated [liarliar/Daily-Omni](https://huggingface.co/datasets/liarliar/Daily-Omni) with 684 videos and 1,197 questions; helper downloads docs and QA metadata by default and makes the approximately 3.9 GB media snapshot opt-in | Benchmark is CC BY-NC-SA 4.0 and code is GPL-3.0; videos derive from AudioSet, Video-MME, and FineVideo, so component-media terms also apply |
| [WorldSense](https://jaaackhongggg.github.io/WorldSense/) | Real-world omni-modal video understanding and audio-visual reasoning | Public, ungated [honglyhly/WorldSense](https://huggingface.co/datasets/honglyhly/WorldSense) with 1,662 videos and 3,172 questions; helper downloads docs and QA metadata by default and makes the approximately 18.1 GB archive snapshot opt-in | Paper v3 says CC BY-NC-SA 4.0 while the repo/HF card say CC BY 4.0; apply the stricter terms pending clarification and verify FineVideo/MUSIC-AVQA component-media rights |
| [MMOU](https://mmou.pages.dev/) | Long-form omni-modal video understanding and audio-visual reasoning | Public, ungated [nvidia/MMOU](https://huggingface.co/datasets/nvidia/MMOU) with 20,000 questions over 11,877 web videos; 5,000 labeled Test Mini items support local evaluation while main-split answers use the official evaluator; helper downloads docs by default, with approximately 48 MB of annotations and the approximately 322.8 GB community-hosted video snapshot as separate opt-ins | HF cards declare Apache-2.0, but the paper restricts the dataset to non-commercial research; apply the stricter terms and review source-platform/per-video rights |
| [AV-SpeakerBench](https://plnguyen2908.github.io/AV-SpeakerBench-project-page/) | Speaker-centric audio-visual understanding | Public, ungated [plnguyen2908/AV-SpeakerBench](https://huggingface.co/datasets/plnguyen2908/AV-SpeakerBench) with 3,212 questions and aligned audio/visual clips; helper downloads docs by default and makes the approximately 123 GB snapshot opt-in | Project page and README say CC BY-NC 4.0, while HF front matter says MIT; use the more restrictive non-commercial terms and verify source-video rights |
| [AVUT](https://github.com/lark-png/AVUT) | Audio-centric video understanding without text shortcuts | Public, ungated [tsinghua-ee/AVUTBenchmark](https://huggingface.co/datasets/tsinghua-ee/AVUTBenchmark) with 2,662 videos and 11,609 questions; helper downloads docs and annotations by default and makes the approximately 24.0 GB snapshot opt-in | No data or code license stated; paper says only YouTube links are distributed while the HF release appears to include video files, so review source-video rights and YouTube terms |
| [QIVD](https://www.qualcomm.com/developer/software/qualcomm-interactive-video-dataset-qivd) | Real-time situated audio-visual question answering | Official Qualcomm release with 2,900 short videos, spoken questions, text answers, and when-to-answer timestamps; helper saves the landing page and prints the manual Qualcomm account/download flow | No public dataset license text was found; the paper says contributors permitted research and commercial use, but users must review the terms presented by Qualcomm before downloading or reusing data |
| [OmniGAIA](https://github.com/RUC-NLPIR/OmniGAIA) | Omni-modal agent reasoning and tool use | Public, ungated [RUC-NLPIR/OmniGAIA](https://huggingface.co/datasets/RUC-NLPIR/OmniGAIA) with 360 audio/image/video tasks; helper downloads docs and lightweight test metadata by default and makes the approximately 9.9 GB media snapshot opt-in | HF card declares Apache-2.0 and code is MIT; verify terms for component media curated from multiple upstream datasets |
| [Omni-Cloze](https://github.com/ddlBoJack/Omni-Captioner) | Detailed audio, visual, and audio-visual captioning | Public, ungated [BoJack/Omni-Cloze](https://huggingface.co/datasets/BoJack/Omni-Cloze) with 2,320 audio-visual items and about 70,000 cloze blanks; helper downloads docs and evaluation scripts by default, with metadata and the multi-GB media snapshot as separate opt-ins | No data or code license is stated; source-media provenance and reuse terms are undocumented, so clarify rights before redistribution or commercial use |
| [AVSCapBench](https://nju-link.github.io/AVSCap/) | Omni-modal audio-visual video captioning and event binding | Public, ungated [NJU-LINK/AVSCapBench](https://huggingface.co/datasets/NJU-LINK/AVSCapBench) with 1,226 clips, dense captions, and visual, speech, music, SFX, and synergy events; helper downloads docs by default and makes the approximately 19.6 GB snapshot opt-in | Card/README declare CC BY-NC-SA 4.0, while the paper describes academic-research-only use; source YouTube, TikTok, and Video-MME media rights still apply |
| [AVDC](https://radiant0726.github.io/AVDC-web/) | Decoupled audio-only, visual-only, and joint audio-visual captioning; visible/invisible sound-event evaluation; and audio-visual QA | Public, ungated [KaiyingYan/AVDC](https://huggingface.co/datasets/KaiyingYan/AVDC) annotation release for 10,000 long-form videos and 10,000 caption-derived QA pairs; helper downloads docs/API metadata by default and makes the approximately 134 MiB caption/QA snapshot opt-in; source videos are referenced by ID and are not redistributed | No data or code license is stated; generated annotations and reasoning traces are not licensed by the paper, and ShareGPT4Video/Vript source-media and platform terms remain applicable |
| [CoMind](https://comind.ethz.ch/) | Speech-conditioned collaborative egocentric/exocentric social reasoning | Official public 41-hour, 80-session release with synchronized audio/transcripts and three benchmarks for joint attention, object-interaction anticipation, and handover prediction; helper saves first-party docs/downloader/manifest by default and makes the approximately 5.0 MiB annotations opt-in while leaving large recordings to the official component-selecting downloader | Project page declares CC BY-NC 4.0, but its displayed license/terms links are placeholder anchors; preserve attribution and review identifiable face, voice, gaze, biometric, consent, and non-commercial-use constraints |
| [video-SALMONN 2 Caption Benchmark](https://huggingface.co/datasets/tsinghua-ee/video-SALMONN_2_testset) | Detailed audio-visual video captioning, completeness, and hallucination evaluation | Public, ungated release with 483 audio-bearing 30-60 second videos, human captions, manually refined atomic events, and an LLM-based evaluator; helper downloads the approximately 3.5 MB annotations and evaluator by default while the approximately 1.70 GB media snapshot is opt-in | HF card labels the dataset Apache-2.0 and code is Apache-2.0, but per-video provenance and underlying video, audio, music, speech, likeness, and platform rights are undocumented and require separate review |
| [SyncBench](https://chenhaoqcdyq.github.io/BeyondTimeShifts/) | Causal-semantic audio-visual synchronization evaluation for generative models | Public, ungated [qianyijie/SyncBench](https://huggingface.co/datasets/qianyijie/SyncBench) with 1,185 generated clips and evaluator scores; helper fetches docs, metadata, and small score JSONs by default while the approximately 12.9 GB media snapshot is opt-in | Dataset license is unspecified; the paper's CC BY 4.0 and repository's MIT license do not establish rights for generated videos or prompts |
| [AVE-Compass](https://ave-compass.github.io/) | Instruction-based audio-video editing evaluation | Public, ungated [NJU-LINK/AVE-Compass](https://huggingface.co/datasets/NJU-LINK/AVE-Compass) with 145 source videos, 196 human-verified instructions, and 2,688 diagnostic checklist items; helper downloads docs by default, offers lightweight annotations as an opt-in, and keeps the approximately 442 MB full snapshot behind a separate opt-in | Dataset card declares CC BY-NC 4.0; evaluation code has no stated license, and source-video uploader/platform/media rights still require review |
| [Friend Bench](https://huggingface.co/datasets/fluid-concepts/friend-bench) | Audio-visual social-relationship recognition | Public 96-clip validation set with audio, video, transcripts, binary familiar/stranger labels, six-way relationship labels, and anonymized human judgments; helper downloads docs by default, offers lightweight JSONL metadata as an opt-in, and keeps the approximately 433 MB snapshot behind a separate opt-in; a label-held-out test split is only planned | CC BY-NC 4.0 inherited from Seamless Interaction; review the source corpus's privacy, consent, biometric, and responsible-use terms for recorded participants |
| [Video-MME](https://video-mme.github.io/) | Audio-enabled video question answering and long-video understanding | Public, ungated [lmms-lab/Video-MME](https://huggingface.co/datasets/lmms-lab/Video-MME) with 900 videos and 2,700 QA pairs; Qwen3.5-Omni evaluates it with audio enabled; helper downloads docs by default and requires explicit terms acknowledgment before the approximately 389 GB snapshot | Custom academic-research-only terms prohibit commercial use and, without approval, redistribution, publication, copying, dissemination, or modification; video rights remain with owners |
| [OmniVideoBench](https://omnivideobench.github.io/omnivideobench_home/) | Complementary audio-visual reasoning and long-video understanding | Gated [NJU-LINK/OmniVideoBench](https://huggingface.co/datasets/NJU-LINK/OmniVideoBench) with 628 videos and 1,000 reasoning-annotated QA pairs; helper downloads public docs/API metadata by default and requires approved access plus explicit opt-in for the approximately 114 GB snapshot; OmniReasoner evaluates it across audio type and duration | Official GitHub README says CC BY-NC-SA 4.0, while HF declares CC BY-NC-ND 4.0 and requires non-commercial/no-redistribution terms; apply the stricter terms, and review raw-video rights separately |
| [LVOmniBench](https://kd-tao.github.io/LVOmniBench/) | Long-form audio-video understanding and temporal reasoning | Gated [KD-TAO/LVOmniBench](https://huggingface.co/datasets/KD-TAO/LVOmniBench) with 275 videos totaling 140 hours and 1,014 manually authored QA pairs; helper downloads public docs/API metadata by default and requires approved access plus explicit opt-in for the approximately 187.4 GB snapshot; OmniReasoner evaluates it as an audio-visual benchmark | Paper says source videos are Creative Commons licensed, but the dataset card/repository state no benchmark-level license or per-video CC variants and the code has no license; review the access form, source-video attribution/rights, and YouTube terms |
| [StoryAD-QA](https://github.com/SEE-AI-Lab/ECCV2026_StoryTeller_StoryAD_QA) | Long-form audio-description narrative comprehension | Public official release with 2,572 verified five-option questions, answer keys, prompts, and an accuracy scorer across segment-only and context-conditioned tracks; helper downloads lightweight docs/evaluator metadata by default and makes the approximately 8 MB repository clone opt-in; no movie media is included | License is explicitly pending finalization; suggested MIT/Apache and CC BY-NC terms are not grants, and underlying MAD-Eval/LSMDC movie rights remain separate |
| [OmniRetriever-Bench](https://huggingface.co/datasets/YunzeLiu/OmniRetriever-Bench) | 12-direction audio-video-text retrieval | Public, ungated CSV with 3,782 held-out triples, source URLs, clip intervals, and human-corrected English captions; helper downloads the sub-1 MB annotations and official docs, while users obtain source media separately | HF card labels annotations Apache-2.0 but adds a biometric-identification/profiling/surveillance prohibition and the paper calls it custom research-use; TikTok media stays under uploader/platform terms; evaluator code has no stated license |
| [AVSBench](https://opennlplab.github.io/AVSBench/) | Audio-visual segmentation and sounding-object localization | Official project/repository for S4, MS3, and semantic AVSS evaluation; original object annotations are publicly linked on Google Drive, while processed media and the updated object/semantic release require the official email/application path; helper downloads docs only | Project page licenses its published dataset under CC BY-NC 4.0 and repository code is Apache-2.0; underlying YouTube videos retain uploader/platform terms, and applicants should review any additional updated-release conditions |
| [LRS2-BBC](https://www.robots.ox.ac.uk/~vgg/data/lip_reading/lrs2.html) | Visual and audio-visual speech recognition | Official VGG page documents 144,482 BBC utterances and a 50 GB password-protected package; access requires a signed [BBC LRS2 agreement](https://www.bbc.co.uk/rd/projects/lip-reading-datasets) from an eligible academic or public-service research organization; helper saves official metadata and the agreement only | Non-commercial research under the controlling BBC agreement; companies and independent researchers are ineligible, and publication of sample images requires BBC approval |
| [LRS3-TED](https://www.robots.ox.ac.uk/~vgg/data/lip_reading/) | Visual and audio-visual speech recognition | Official VGG landing page and primary paper describe more than 400 hours of TED/TEDx face tracks with audio, subtitles, and word alignments; helper saves live official metadata, but the linked LRS3 download page returned HTTP 404 on 2026-07-22 | No current official data license was found; obtain official terms before use and review TED/TEDx source-media rights rather than relying on third-party mirror claims |
| [LRRo](https://zenodo.org/records/3753559) | Romanian isolated-word visual speech recognition and lip reading | Public, ungated Wild and Lab collections totaling more than 25 hours, with official train/validation/test subsets; VSRo-200 section 4.6 evaluates both subsets; helper saves official metadata/docs by default and makes the approximately 278 MiB archive opt-in | Zenodo declares CC BY 4.0; review attribution, privacy, likeness, biometric-use, and source-media rights for identifiable speakers and Internet-derived Wild LRRo footage |
| [SUPERB](https://superbbenchmark.org/) | Speech representation evaluation | Official [S3PRL SUPERB docs](https://github.com/s3prl/s3prl/blob/master/s3prl/downstream/docs/superb.md) and toolkit; helper downloads docs/license by default and can clone the toolkit with opt-in | Benchmark suite uses multiple external corpora with mixed terms; S3PRL toolkit is mostly Apache-2.0, with noted CC BY-NC files |
| [Codec-SUPERB](https://eric-lam.com/Codec-SUPERB/) | Neural audio codec and tokenizer evaluation | Official [ACL 2024 paper](https://aclanthology.org/2024.findings-acl.616/), evaluation repo, and public ungated [6,000-row speech/audio/music tiny set](https://huggingface.co/datasets/voidful/codec-superb-tiny); helper downloads docs by default and makes the approximately 3.2 GB snapshot opt-in | Data terms are unspecified; repo claims MIT but its linked LICENSE file is absent and GitHub detects no license, so code terms are also treated as unspecified |
| [EMO-SUPERB](https://emosuperb.github.io/) | Standardized speech emotion recognition and representation evaluation | Public evaluation code, corpus adapters, and standardized speaker-independent partitions for six component corpora; helper downloads official docs by default and makes the approximately 23 MB repository clone opt-in, but does not fetch corpus audio | Component corpora retain mixed EULA/license terms; the benchmark repository has no LICENSE file, so code and released partition/label-file terms are unspecified |
| [SLURP](https://github.com/pswietojanski/slurp) | Spoken language understanding | Official GitHub annotation/code repository plus [Zenodo audio archives](https://zenodo.org/records/4274930); helper clones annotations and makes multi-GB audio opt-in | Textual annotations are CC BY 4.0; Zenodo-hosted audio is non-commercial, with GitHub README stating CC BY-NC 4.0 |
| [SLUE](https://asappresearch.github.io/slue-toolkit/) | Spoken language understanding | Official [SLUE toolkit](https://github.com/asappresearch/slue-toolkit), [asapp/slue](https://huggingface.co/datasets/asapp/slue), and [asapp/slue-phase-2](https://huggingface.co/datasets/asapp/slue-phase-2); helper downloads docs/licenses by default and makes HF snapshots opt-in | SLUE-VoxPopuli is CC0; SLUE-VoxCeleb is CC BY 4.0; toolkit code is MIT |
| [MInDS-14](https://huggingface.co/datasets/PolyAI/minds14) | Spoken language understanding | [PolyAI/minds14](https://huggingface.co/datasets/PolyAI/minds14); helper saves the dataset card by default and snapshots a selected locale only with opt-in | HF dataset card lists CC BY 4.0 |
| [Fluent Speech Commands](https://fluent.ai/fluent-speech-commands-a-dataset-for-spoken-language-understanding-research/) | Spoken language understanding | Official Fluent.ai dataset page, [Google Groups access path](https://groups.google.com/a/fluent.ai/forum/#!forum/fluent-speech-commands), and [license PDF](https://fluent.ai/wp-content/uploads/2021/04/Fluent_Speech_Commands_Public_License.pdf); helper saves docs and prints access steps | Academic research only under CC BY-NC-ND 4.0; official page says commercial use is not authorized |
| [HEAR](https://hearbenchmark.com/) | Speech/audio/music representation evaluation | Official [HEAR eval kit](https://github.com/hearbenchmark/hear-eval-kit) and [Zenodo HEAR 2021 task archive](https://zenodo.org/records/5885750); helper downloads record metadata/license by default and makes task archives opt-in | Mixed component dataset terms; Zenodo lists CC BY 4.0 but says each task has its own LICENSE.txt; eval kit is Apache-2.0 |
| [Dynamic-SUPERB](https://github.com/dynamic-superb/dynamic-superb) | Speech instruction benchmark | Official Dynamic-SUPERB repository, [leaderboard](https://huggingface.co/spaces/DynamicSuperb/leaderboard), and docs; helper downloads docs by default and can clone the repo with opt-in | Mixed component dataset terms; GitHub API reported no repository license, so check each task source before use |
| [MAEB](https://github.com/embeddings-benchmark/mteb) | Multilingual speech, music, environmental-sound, and audio-text embedding evaluation | Public 30-task beta suite in the official MTEB registry, spanning retrieval, classification, clustering, pair classification, reranking, multilabel classification, and zero-shot classification in more than 100 languages; helper downloads lightweight official metadata/docs by default and makes the approximately 55 MB MTEB source clone opt-in | MTEB code and registry are Apache-2.0, but all component datasets retain their own mixed licenses, access controls, attribution requirements, and media rights |
| [RUL-MuchoMusic](https://github.com/yongyizang/AreYouReallyListening) | Audio understanding | [RUL-MuchoMusic.json](https://raw.githubusercontent.com/yongyizang/AreYouReallyListening/main/RUL-MuchoMusic.json), [RUListening](https://huggingface.co/datasets/yongyizang/RUListening) | RUL repo/HF card list MIT; upstream MuChoMusic dataset is CC BY-SA 4.0 |
| [SongFormBench](https://huggingface.co/datasets/ASLP-lab/SongFormBench) | Audio understanding | `load_dataset("ASLP-lab/SongFormBench")` | HF card and SongFormer repo list CC BY 4.0 |
| [RUBATO](https://zenodo.org/records/21407832) | Robust music transcription and analysis across multiple versions of the same works | Public Zenodo v0.3 release with 566 versions of 15 works (about 42.9 hours), aligned audio/score/video representations, and note, beat, measure, local-key, structure, and warping-path annotations; helper downloads the 83 KB metadata by default while the approximately 6.26 GB archive is opt-in | Zenodo labels the deposit CC BY 3.0, but per-recording metadata includes CC0, attribution, ShareAlike, NoDerivatives, non-commercial, ambiguous, and EEF terms; review each recording before reuse |
| [MulTTiPop](https://gclef-cmu.org/multtipop) | Multitrack pop-music transcription and audio-MIDI alignment | Public, ungated [gclef-cmu/multtipop](https://huggingface.co/datasets/gclef-cmu/multtipop) with aligned MIDI and metadata for 572 commercial-pop segments (about 3.5 hours) in artist-disjoint dev/test splits; helper downloads docs and lightweight manifests by default and makes the full MIDI/metadata snapshot opt-in; source audio is not redistributed | Released MIDI and metadata are CC BY 4.0, with MIDI adapted from the CC BY 4.0 Lakh MIDI Dataset; referenced YouTube/commercial audio retains platform and music rights, and the authors recommend evaluation-only use |
| [SongEval](https://huggingface.co/datasets/ASLP-lab/SongEval) | Full-song aesthetics and music-generation quality assessment | Public, ungated 2,399-song English/Chinese release with about 140 hours and expert ratings for coherence, memorability, vocal naturalness, structural clarity, and musicality; helper downloads docs and the approximately 1.27 MB rating JSONL by default while the approximately 16.1 GB MP3 snapshot is opt-in | Dataset card declares CC BY-NC-SA 4.0 and toolkit is Apache-2.0, but songs include commercial-generator outputs and real/bad-case samples without per-item provenance, so generated-output, service, and underlying music rights require review |
| [Concerto Accompaniment Benchmark](https://github.com/HMC-MIR/PianoConcertoAccompaniment) | Score-free piano-concerto accompaniment alignment | Public code, configuration, IMSLP source inventory, and measure-downbeat annotations for a 150-scenario, four-movement alignment protocol; helper fetches lightweight released artifacts by default and makes the repository clone opt-in; commercial orchestra recordings remain private and solo-piano audio is not exposed | Repository code and released annotations/config are MIT; commercial Music Minus One recordings are excluded, IMSLP recordings retain mixed per-item terms, and solo-piano recording terms are unspecified |
| [SingMOS-Pro](https://huggingface.co/datasets/TangRain/SingMOS-Pro) | Singing-quality assessment and MOS prediction | Public, ungated 7,981-clip Chinese/Japanese release with 11.15 hours, overall MOS for every clip, and lyrics/melody scores for 4,155 clips; helper downloads docs and lightweight split/system metadata by default, makes annotations opt-in, and keeps the approximately 2.83 GB audio snapshot behind a separate opt-in | HF card declares CC BY 4.0 and predictor code is MIT; the release mixes ground truth and outputs from many source datasets and generation systems without per-file license inventory, so source-corpus, performer, composition, model-output, and service terms still apply |
| [Song Describer Dataset](https://zenodo.org/records/10072001) | Music captioning, retrieval, text-to-music, and codec-reconstruction evaluation | Public, ungated 706-track MTG-Jamendo release with 1,106 captions and a human-validated 546-track/746-caption evaluation subset; Qwen-Music §4.2.2 uses all 546 validated tracks; helper downloads annotations, licenses, metadata, and docs by default while the approximately 3.09 GiB audio archive is opt-in | Dataset is CC BY-SA 4.0 and code is MIT; audio retains per-track Creative Commons licenses listed in the release, so preserve attribution and apply each track's terms |
| [CMI-RewardBench / CMI-Pref](https://github.com/Haiwen-Xia/CMI-RewardBench) | Music reward-model, preference, quality, and compositional multimodal alignment evaluation | Public, ungated [CMI-Pref](https://huggingface.co/datasets/HaiwenXia/cmi-pref) with 4,027 human votes, a balanced 500-vote test split, and 133.8 hours; helper downloads docs and lightweight test manifests by default while the approximately 15.0 GB audio snapshot is opt-in | CMI-Pref is CC BY-NC-SA 4.0 and toolkit code is Apache-2.0; commercial-generator service/output terms and the separate PAM, MusicEval, and Music Arena subset rights still apply |
| [MusICA-MetaBench](https://github.com/tomsouri/MusICA-MetaBench-preprint) | Programmatic music-perception QA across audio, symbolic notation, and sheet images | Public pipeline plus two released 300-item benchmark instances derived from ChoraleBricks and ChoralSynth; helper downloads docs, licenses, configs, and the sub-500 KB TSVs by default while the approximately 49 MB repository clone is opt-in; source media is obtained separately | Code/templates/configs are GPL-3.0-or-later; ChoraleBricks-derived instances are CC BY 4.0 and ChoralSynth-derived instances are CC BY-SA 4.0; model outputs/logs have no separate license, and source media retains upstream terms |
| [Sonic Seasoning](https://huggingface.co/datasets/csc-unipd/sonic-seasoning) | Taste-from-audio regression, taste-conditioned music retrieval, and music-representation evaluation | Public, ungated 377-clip release with fixed 269/68/40 train/validation/test partitions and normalized taste ratings; helper downloads docs plus the approximately 34 KB ratings/path table by default while the approximately 797 MB audio snapshot and code clone are separate opt-ins | Dataset card declares CC BY-NC 4.0 and code is Apache-2.0; audio combines pre-existing music, MusicGen outputs, and prior-study stimuli, so underlying music, publication, performer, and generated-output rights still require review |
| [Audiobook Narration Appeal](https://github.com/spotify-research/audiobook-narrations-interspeech) | Audiobook appeal prediction, narration-quality analysis, and intra-title ranking | Public, ungated 8,854-row LibriVox/Internet Archive metadata release spanning 1,206 narrators and 65 genres; helper downloads the approximately 3.1 MB CSV, docs, license, paper, and supplement; source audiobook audio remains separately hosted, and the paper's Spotify engagement analysis is proprietary and unreleased | Released CSV, supplement, and code are Apache-2.0; LibriVox/Internet Archive terms and attribution still apply, and users must verify per-item recording/text public-domain status in their jurisdiction |
| [Lyra-SA](https://lyracobar.y.qq.com/singvoicedataset_en.html) | Full-song singing-quality assessment and score prediction | Official Tencent Music Lyra Lab release with 1,000 complete mobile-karaoke recordings, listener scores, timed lyrics, and reference MIDI; access requires the official application and an emailed download link, so the helper saves documentation and prints the manual path only | Official page states CC BY-NC 4.0 for non-commercial use with attribution, reserves Tencent Music copyright, and requires separate commercial permission; rely on the official authorization/application terms for WeSing performances and song rights |
| [ChartGenEval](https://github.com/JacobLinCool/ChartGenEval) | Rhythm-game chart-generation evaluation | Public MIT evaluation toolkit, calibration, corruption probes, and metric-only records for timing, audio response, structure, grammar, and human-reference gap measurements; helper downloads docs by default and makes the approximately 44 MB repository clone opt-in; the 3,880-chart calibration corpus and audio are explicitly not distributed | MIT covers released code and artifacts, not the absent potentially copyrighted community/commercial chart and audio corpus; full corpus-dependent reproduction requires a separately sourced rights-compatible snapshot |
| [AI-Generated Cover Song Diagnostics](https://github.com/TiaaL/songecho-cover-metrics) | Diagnostic evaluation of cover-song generation across melody, harmony, key, style, and production | Public score table, anonymized 30-sample manifest, nine extracted features, and analysis pipeline; helper downloads all lightweight released tables/docs by default, but the paper explicitly withholds copyrighted source and generated audio | Released repository tables/code are MIT; the license does not grant rights to absent source songs or generated covers, and rerunning audio analysis requires locally authorized files |
| [MADB](https://huggingface.co/datasets/sirui1/MADB-Dataset) | Multi-dimensional music-aesthetics and quality assessment | Public, ungated annotations for 9,999 tracks plus 1,730 Suno/Levo audio files; helper downloads docs by default, makes approximately 69 MB of annotation tables opt-in, and keeps the approximately 18.6 GB Hugging Face snapshot behind a separate opt-in; another 4,400 tracks are sourced separately from MuChin | HF card declares CC BY-NC 4.0 and research-only use, but original audio copyright, MuChin, generator-output/service, and unidentified online-source rights still apply; repository code has no stated license |
| [MagnaTagATune](https://mirg.city.ac.uk/codeapps/the-magnatagatune-dataset) | Music tagging | Official MIRG-hosted metadata, annotations, comparisons, optional Echo Nest features, and optional MP3 split archives | CC BY-NC-SA 3.0 for data; GPLv3 for scripts; Magnatune audio excerpts are non-commercial research redistribution |
| [MTG-Jamendo](https://mtg.github.io/mtg-jamendo-dataset/) | Music tagging | Official [metadata/scripts repo](https://github.com/MTG/mtg-jamendo-dataset), [Zenodo metadata archive](https://zenodo.org/records/3826813), and upstream downloader for large audio/features with opt-in | Metadata is CC BY-NC-SA 4.0; code is Apache-2.0; audio keeps per-track Creative Commons licenses and is limited to non-commercial research/academic use unless Jamendo authorizes otherwise |
| [FMA](https://github.com/mdeff/fma) | Music information retrieval | Official README/license by default; optional [metadata archive](https://os.unil.cloud.switch.ch/fma/fma_metadata.zip) and opt-in FMA audio subsets from small through full | Metadata is CC BY 4.0 and code is MIT; audio uses each artist's chosen license, so check per-track terms |
| [Million Song Dataset](http://millionsongdataset.com/) | Scalable music information retrieval and recommendation | Public Echo Nest-derived features/metadata for one million tracks plus a 48.4-million-row Taste Profile play-count release; helper downloads official docs, terms, and the tag vocabulary by default while the approximately 500 MB interactions, 1.8 GB feature subset, and code clone are opt-in; no listenable audio is included | Custom archived Echo Nest terms permit non-commercial use with attribution; MusicBrainz years are public domain and tags/counts are CC BY-NC-SA 2.0; complementary datasets retain separate terms, and code is described only as GNU Public License without a version |
| [GTZAN](https://huggingface.co/datasets/marsyas/gtzan) | Music genre classification | Hugging Face `marsyas/gtzan`; helper saves the dataset card by default and downloads the full snapshot only with opt-in | License not specified on the reachable HF card; original Marsyas terms should be confirmed before redistribution or commercial use |
| [OpenMIC-2018](https://zenodo.org/records/1432913) | Music information retrieval | Official Zenodo record and [OpenMIC archive](https://zenodo.org/api/records/1432913/files/openmic-2018-v1.0.0.tgz/content); helper saves metadata by default and makes the 2.6 GiB archive opt-in | Zenodo lists CC BY 4.0; included metadata contains per-recording licenses |
| [MusicNet](https://zenodo.org/records/5120004) | Music transcription | Official Zenodo record, metadata CSV, reference MIDI archive, and opt-in 10.3 GiB audio/label archive | Zenodo lists CC BY 4.0; source recordings are Creative Commons licensed or public domain, with per-recording provenance in the metadata |
| [NSynth](https://magenta.withgoogle.com/datasets/nsynth) | Music synthesis | Official Magenta TFRecord or JSON/WAV split archives; helper saves the page by default and downloads archives only with opt-in | CC BY 4.0 for data; Magenta code is Apache-2.0 |
| [Surge Pitch Dataset](https://zenodo.org/records/4677097) | Musical-pitch classification, ranking, and audio-representation evaluation | Public, ungated 3.4-hour release generated from 2,084 human-authored Surge presets across MIDI pitches 21-108; NABEATs evaluates downstream pitch classification under clean and constructed noisy conditions; helper saves official metadata/docs by default and makes the approximately 7.58 GB archive opt-in | Zenodo declares CC BY 4.0; retain the dataset citation and review the separate Surge synthesizer/preset terms when regenerating or redistributing modified renders |
| [MAESTRO](https://magenta.withgoogle.com/datasets/maestro) | Music transcription and synthesis | Official Magenta v3.0.0 CSV/JSON metadata by default, optional MIDI-only archive, and opt-in 101 GiB WAV+MIDI archive | CC BY-NC-SA 4.0 |
| [MUSDB18](https://sigsep.github.io/datasets/musdb.html) | Music source separation | Official SigSep page plus Zenodo [MUSDB18](https://zenodo.org/records/1117372) and [MUSDB18-HQ](https://zenodo.org/records/3338373) archives; helper saves pages by default and requires acknowledgement before large archives | Zenodo lists Other (Non-Commercial); official pages state educational/academic use only, with mixed upstream track sources |
| [MedleyDB](https://medleydb.weebly.com/) | Music multitrack MIR | Official [downloads page](https://medleydb.weebly.com/downloads.html), public sample archive, GitHub annotation/metadata/tooling repo, and Zenodo request records for full MedleyDB and MedleyDB 2.0 audio | Dataset is CC BY-NC-SA 4.0 for non-commercial research use; official page asks users not to republish without consent; tooling repo is MIT |
| [Slakh2100](http://www.slakh.com/) | Music source separation and transcription | Official Slakh page, [Slakh2100 Zenodo record](https://zenodo.org/record/4599666), [tiny prototyping subset](https://zenodo.org/record/4603870), and [slakh-utils](https://github.com/ethman/slakh-utils); helper downloads docs by default and can save Zenodo landing pages or clone utilities with opt-in | CC BY 4.0 for Slakh2100/Flakh2100; slakh-utils code is MIT; synthesized from Lakh MIDI Dataset v0.1, so keep source MIDI attribution/provenance |
| [MoisesDB](https://music.ai/research/) | Music source separation beyond four stems | Public 240-song, 14.4-hour multitrack research dataset from Music AI with a hierarchical stem/source taxonomy; helper saves official docs and license by default, leaves audio to the official browser download flow, and makes the loader/evaluation repo clone opt-in | CC BY-NC-SA 4.0 for non-commercial research; attribution and ShareAlike apply to data and repository materials |
| [VoiceBench](https://github.com/MatthewCYM/VoiceBench) | End-to-end speech dialogue | [hlt-lab/voicebench](https://huggingface.co/datasets/hlt-lab/voicebench) | Apache-2.0 |
| [CoDeTT](https://yingaowang-casia.github.io/CoDeTT.github.io/) | Context-aware turn-taking decisions for full-duplex spoken dialogue | Public, ungated bilingual release with more than 300 hours, four action labels, and 14 fine-grained intent scenarios; helper downloads docs/metadata by default and makes the approximately 51.1 GB LZ4 archive opt-in | HF card declares Apache-2.0, but repository code is unlicensed and upstream Candor, MagicData-RAMC, KeSpeech, and Emilia terms still require review |
| [Audio Agent Bench Suite](https://huggingface.co/datasets/arcada-labs/audio-agent-bench-suite) | Multi-turn voice-agent dialogue, tool use, grounding, state tracking, and memory | Six public, ungated English domain releases totaling 221 scripted turns with human-recorded user audio; helper downloads official cards/API metadata by default and makes the approximately 209 MB combined snapshots opt-in | Suite card declares CC BY 4.0 while all six component cards declare MIT; no separate license file or code license is linked, so confirm intended terms |
| [URO-Bench-pro](https://github.com/Ruiqi-Yan/URO-Bench) | End-to-end speech dialogue | [Honggao/URO-Bench](https://huggingface.co/datasets/Honggao/URO-Bench) | MIT |
| [SpeechRole](https://github.com/yuhui1038/SpeechRole) | End-to-end speech dialogue | [SpeechRole-Eval](https://huggingface.co/datasets/yuhui1038/SpeechRole-Eval), [SpeechRole-Data](https://huggingface.co/datasets/yuhui1038/SpeechRole-Data) | HF cards list MIT; repo has no separate detected license |
| [WildSpeech-Bench](https://github.com/Tencent/WildSpeech-Bench) | End-to-end speech dialogue | [tencent/WildSpeech-Bench](https://huggingface.co/datasets/tencent/WildSpeech-Bench) | License.txt says CC BY 4.0 except third-party datasets with their own terms |
| [SPEARBench](https://thomasthebaud.github.io/SPEAR-benchmark-website/) | Streaming speech-to-speech conversational naturalness | Public SharePoint package with 5,419 Seamless Interaction-derived question-answer dialogues (37.33 hours); helper downloads official docs, leaderboard metadata, and submission examples only | Website/helper code is MIT; the downloadable derived audio has no separately stated license, so verify Seamless Interaction and package terms before reuse |
| [FLEURS](https://huggingface.co/datasets/google/fleurs) | S2TT and ASR | `load_dataset("google/fleurs", "en_us")` or another locale | CC BY 4.0 |
| [PazaBench](https://huggingface.co/spaces/microsoft/paza-bench) | Low-resource multilingual ASR accuracy and efficiency | Public Microsoft Research Africa leaderboard reporting WER, CER, and inverse real-time factor across 61 African languages, 53 models, and 11 named upstream dataset groups; helper saves official docs, Space metadata, and the dataset inventory only because no standalone unified audio snapshot or frozen item manifest is published | Space metadata declares MIT for the leaderboard implementation; the source datasets retain mixed CC0, attribution, share-alike, non-commercial, gated, Apache-2.0, and other provider terms |
| [VoiceCodeBench](https://huggingface.co/datasets/besimple-ai/voice-code-bench) | Exact structured-token and entity recovery in workplace ASR | Public, ungated test-only release with 300 human-recorded English segments, 1,482 targets across 26 entity types, and released baseline predictions/scoring; helper downloads docs, paper, license, and the 1.1 MB annotations by default while the approximately 1.83 GiB snapshot is opt-in | Repository and card declare MIT; the card documents contributor consent but excludes model training, speaker identification, biometric modeling, voice cloning, and demographic profiling from intended use |
| [S-DiverSe](https://github.com/ferugit/s-diverse) | In-the-wild neurological Spanish ASR | Public TSV annotations for 444 segments (3.2 hours, 22 speakers) across ALS, Parkinson's disease, and post-stroke speech; audio is not redistributed and must be reconstructed from timestamped public-video links; helper downloads annotations/docs/code only | No data or code license is specified; arXiv's CC BY 4.0 covers the paper, not the release or linked recordings; review health-data privacy, consent, ethics, source rights, and platform terms |
| [ADReSS / ADReSSo](https://talkbank.org/dementia/ADReSS-2020/) | Spontaneous-speech Alzheimer's detection, MMSE regression, and cognitive-decline prediction | Official age- and gender-balanced 2020 and audio-only 2021 challenge releases require approved DementiaBank membership; helper saves public challenge/access documentation and prints the manual membership path without accessing clinical recordings | TalkBank defaults to CC BY-NC-SA 3.0 plus strict password-protected clinical-data rules: non-commercial use, no LLM incorporation, no sharing with non-members, confidentiality and ethics duties, and faculty sponsorship for student access |
| [DementiaBank Pitt Corpus](https://talkbank.org/dementia/access/English/Pitt.html) | Alzheimer's detection, spontaneous-speech analysis, and speech-privacy evaluation | Password-protected clinical corpus with dementia/control recordings, transcripts, and media across four language tasks; helper saves public documentation and prints the membership path without authenticating or downloading data; arXiv:2607.17098 evaluates 552 Cookie Theft recordings | TalkBank defaults to CC BY-NC-SA 3.0 and prohibits commercial products or LLM incorporation; access requires membership, students need faculty sponsorship, and clinical data cannot be shared with non-members or reposted |
| [VoxPopuli](https://github.com/facebookresearch/voxpopuli) | ASR and S2TT | [facebook/voxpopuli](https://huggingface.co/datasets/facebook/voxpopuli); select a language/config and split before downloading the large HF repository | Data is CC0-1.0; code and pretrained models are CC BY-NC 4.0; raw data also points to European Parliament legal notice |
| [mTEDx](https://www.openslr.org/100) | ASR and S2TT | [OpenSLR SLR100](https://www.openslr.org/100) ASR language archives, speech-translation language-pair archives, IWSLT 2021 test sets, and small metadata; archives are opt-in in the helper | CC BY-NC-ND 4.0; derived from TEDx Talks, so TED/TEDx source terms also apply |
| [OpenSTBench](https://github.com/sjtuayj/OpenSTBench) | Multidimensional offline and streaming speech-translation evaluation | Public evaluation toolkit plus an ungated [300-sample LibriTTS-based paired-speaker set](https://huggingface.co/datasets/ayj111/openstbench-paired-set); helper downloads docs/metadata by default, while the approximately 511 MiB paired set and toolkit clone are separate opt-ins | Paired-set card declares `other` and preserves upstream/synthesis terms; original code is MIT, adapted SimulEval components are CC BY-SA 4.0, and each component evaluation corpus retains its own terms |
| [NonverbalTTS](https://huggingface.co/datasets/deepvk/NonverbalTTS) | Expressive TTS and paralinguistic-fidelity evaluation | Public 17-hour English corpus with ten nonverbal-vocalization types and eight emotion categories; OpenSTBench evaluates its 359-sample test split for English-to-Chinese speech-translation fidelity; helper downloads docs by default, while the approximately 108 MiB test split and 3.9 GiB full snapshot are opt-in | Card prose assigns annotations CC BY-NC-SA 4.0 and preserves VoxCeleb/Expresso terms for audio, conflicting with its machine-readable Apache-2.0 tag; use the more restrictive source-specific terms pending clarification |
| [RealSI](https://github.com/byteresearchcla/RealSI) | Long-form simultaneous Chinese-English speech translation | Public timestamped transcripts/translations for 20 natural recordings (95:29, 778 segments) across ten domains; current repository also contains about 351 MiB of WAV derivatives; helper downloads docs and lightweight JSON annotations by default while the repository clone is opt-in | Repository declares CC BY 4.0, but authors disclaim ownership of source videos; treat attribution licensing as covering author annotations and separately review recording copyright, platform terms, and the README disclaimer |
| [TEDx Spanish Corpus](https://www.openslr.org/67/) | ASR | [OpenSLR SLR67](https://www.openslr.org/67/) Spanish speech/transcript archive; helper saves the page by default and makes the 2.3 GiB archive opt-in | CC BY-NC-ND 4.0; derived from TEDx Talks, so TED/TEDx source terms also apply |
| [Europarl-ST](https://www.mllp.upv.es/europarl-st/) | S2TT | Official [Europarl-ST page](https://www.mllp.upv.es/europarl-st/), [README](https://www.mllp.upv.es/europarl-st/README.md), and v1.1 archive; helper saves docs by default and makes the ~21 GB corpus opt-in | Corpus construction work is CC BY-NC 4.0; underlying debate data rights remain with the European Union and respective copyright holders |
| [CoVoST 2](https://github.com/facebookresearch/covost) | S2TT and ASR | Official CoVoST 2 translation TSV archives from Meta plus Common Voice 4 audio/transcripts obtained separately; [facebook/covost2](https://huggingface.co/datasets/facebook/covost2) also exists | Meta/GitHub list CoVoST data as CC0; current HF and Mozilla packaged views may list CC BY-NC 4.0, so re-check active source terms |
| [GigaSpeech](https://github.com/SpeechColab/GigaSpeech) | ASR | [speechcolab/gigaspeech](https://huggingface.co/datasets/speechcolab/gigaspeech) after access approval; default helper config is `dev` | HF terms restrict data to non-commercial research and educational use; code repo is Apache-2.0 |
| [SPGISpeech](https://huggingface.co/datasets/kensho/spgispeech) | ASR | [kensho/spgispeech](https://huggingface.co/datasets/kensho/spgispeech) after accepting Kensho/Hugging Face terms; helper defaults to `dev` | Gated terms allow academic research/internal use and prohibit redistribution without prior written consent |
| [Earnings-22](https://github.com/revdotcom/speech-datasets/tree/main/earnings22) | ASR | Official Rev.com [speech-datasets](https://github.com/revdotcom/speech-datasets) repository; helper downloads README/license/metadata by default and makes sparse checkout plus Git LFS audio pull opt-in | Dataset README/LICENSE list CC BY-SA 4.0 for transcripts and associated text; repository has no detected top-level license, so re-check audio/LFS terms before redistribution |
| [Earnings-21](https://github.com/revdotcom/speech-datasets/tree/main/earnings21) | ASR and named-entity recognition | Official Rev.com release with 44 earnings calls (about 39 hours), a representative 10-hour Eval-10 subset, transcripts, entity annotations, and speaker/file metadata; helper fetches lightweight docs/metadata by default and makes the approximately 770 MB media tree opt-in | CC BY-SA 4.0 explicitly covers transcripts and associated alignment text; audio and repository code terms are not clearly specified, so confirm before redistribution or commercial use |
| [HALAS](https://huggingface.co/datasets/MatBar99/HALAS) | ASR hallucination detection and error analysis | Public, ungated annotations for seven ASR systems on 3,611 Earnings-22 segments, with meeting-disjoint train/test splits, corrected references, and utterance/span-level hallucination labels; source audio is obtained separately; helper downloads docs by default and makes the 0.86 MB test CSV or approximately 7.2 MB snapshot opt-in | HF metadata declares `unknown`; the card describes intended CC BY-SA 4.0 compatibility with Earnings-22 but no standalone license file exists, so treat annotation/code rights as unspecified and retain upstream audio terms |
| [CHILDES-Aligned](https://huggingface.co/datasets/MagicLuke/CHILDES-Aligned) | Child-speech ASR and timestamp alignment | Manually gated release with a 413.3-hour general-purpose English child-speech configuration and a quality-controlled 283-hour ASR configuration; helper prints access steps and requires explicit terms acknowledgement before downloading a selected config | HF card declares CC BY-NC-SA 4.0 plus non-commercial-research-only TalkBank terms, source-corpus citation requirements, manual review, and no audio redistribution; linked code repository was unavailable when checked |
| [Tadabur](https://fherran.github.io/tadabur/) | Qur'anic Arabic ASR, reciter identification, and word alignment | Public, ungated [FaisaI/tadabur](https://huggingface.co/datasets/FaisaI/tadabur) with more than 365,000 verse-level examples, 1,400+ hours, and 600+ reciters; helper downloads official metadata by default while the approximately 1.94 TB snapshot is opt-in | Card declares CC BY-NC 4.0, research/education use, and respectful-use expectations; source repositories and archives lack per-recording license provenance, and the linked code repository has no standalone license |
| [L2-ARCTIC](https://psi.engr.tamu.edu/l2-arctic-corpus/) | ASR and accented speech | Official TAMU corpus page and documentation; access requires accepting license terms and submitting the download form to receive a generated Google Drive link by email | CC BY-NC 4.0; current release has 24 non-native English speakers plus suitcase-corpus material, while the Interspeech 2018 paper describes v1.0 |
| [Speak & Improve Corpus 2025](https://researchdatasets.cambridge.org/datasets/speak-and-improve-corpus-2025) | L2 English proficiency scoring, ASR, disfluency detection, and spoken grammatical-error correction | Official Cambridge release with about 315 hours, more than 45,000 utterances, fixed train/dev/eval partitions, holistic CEFR-aligned scores, and about 55 manually transcribed hours; registration and license acceptance are required, so the helper prints the manual path only | Custom non-commercial research-and-education license prohibits sharing any corpus portion and requires prior approval for derived releases or statistics; avoid services that retain submitted data for training |
| [GigaSpeechBench](https://github.com/SpeechColab/GigaSpeechBench) | Multilingual in-the-wild ASR, speech translation, accents, dialects, terminology, and age variation | Public, ungated [speechcolab/GigaSpeechBench](https://huggingface.co/datasets/speechcolab/GigaSpeechBench); the current ~86.3 GB release exposes low-resource-language, Chinese-dialect/English-accent, and vertical-domain modules, while the paper-described age module is not yet visible; helper downloads docs/metadata by default and makes the full snapshot opt-in | No data or code license is declared; public access does not establish redistribution or commercial-use rights |
| [IndicContextEval](https://huggingface.co/datasets/AI4Bharat/IndicContextEval) | Context-aware multilingual ASR and named-entity recognition | Public, ungated 16,884-utterance release with 55.93 hours across eight Indian languages, 555 speakers, 23 professional domains, and seven controlled prompt levels including native-script entities and adversarial incorrect-domain context; helper downloads docs/results/supplements by default and makes the 6.48 GB current data snapshot opt-in | Dataset card and repository README declare CC BY 4.0; repository outputs and forthcoming evaluation code have no standalone LICENSE file, so confirm their terms separately |
| [Common Voice](https://github.com/common-voice/cv-dataset) | ASR | [Mozilla Data Collective Common Voice](https://mozilladatacollective.com/organization/cmfh0j9o10006ns07jq45h7xk) | Common Voice datasets are CC0-1.0; metadata repo is MPL-2.0 |
| [JASMIN-CGN](https://taalmaterialen.ivdnt.org/download/tstc-jasmin-spraakcorpus/) | Diverse Dutch/Flemish ASR and demographic robustness | Official Dutch Language Institute release with approximately 115 hours of read speech and human-machine dialogues from adolescents, non-native speakers, and seniors; free non-commercial access requires login and a signed license, and the helper prints the official steps only | Custom signed non-commercial license; commercial users are directed to a separate product, so review the current agreement before use or redistribution |
| [LibriSpeech](https://www.openslr.org/12) | ASR and speech-codec reconstruction | OpenSLR SLR12 metadata/checksums by default, opt-in archives, or [openslr/librispeech_asr](https://huggingface.co/datasets/openslr/librispeech_asr); Qwen3-TTS §4.1.2 uses all 2,620 `test-clean` utterances | CC BY 4.0 |
| [Whisper-RIR-Mega](https://huggingface.co/datasets/mandipgoswami/whisper-rirmega-bench) | Paired clean/reverberant ASR robustness | Public, ungated 2,000-pair English benchmark with 400 validation and 1,600 test pairs; helper downloads docs and lightweight leaderboard metadata by default and makes the approximately 1.13 GB snapshot opt-in | Dataset card says CC BY 4.0, but the RIR-Mega source audio is CC BY-NC 4.0, so apply the stricter non-commercial upstream terms; cited code repository was unavailable when checked |
| [Libri-Light](https://github.com/facebookresearch/libri-light) | ASR and self-supervised speech representation | Official repository docs and Meta public-file archives; helper downloads docs by default and makes 0.6 GiB finetuning, ABX, and 35 GiB to 3.05 TiB unlabeled archives opt-in | Code is MIT; reviewed docs do not state a standalone data license, and audio comes from open-source LibriVox audiobooks with source-term/attribution caution |
| [TIMIT](https://catalog.ldc.upenn.edu/LDC93S1) | ASR and phone recognition | LDC catalog [LDC93S1](https://catalog.ldc.upenn.edu/LDC93S1) or MS-WAV version [LDC93S1W](https://catalog.ldc.upenn.edu/LDC93S1W) after login/licensing; helper prints official access steps | Custom LDC license/paid access; portions copyright 1993 Trustees of the University of Pennsylvania |
| [Switchboard](https://catalog.ldc.upenn.edu/LDC97S62) | Conversational telephone ASR | LDC catalog [LDC97S62](https://catalog.ldc.upenn.edu/LDC97S62) for Switchboard-1 Release 2 plus [LDC2002S09](https://catalog.ldc.upenn.edu/LDC2002S09) for 2000 HUB5 English Evaluation Speech; helper prints official access steps | Custom LDC license/paid access; re-check current LDC agreement before use or redistribution |
| [Fisher English](https://catalog.ldc.upenn.edu/LDC2004S13) | Conversational telephone ASR | LDC catalogs for [speech part 1](https://catalog.ldc.upenn.edu/LDC2004S13), [transcripts part 1](https://catalog.ldc.upenn.edu/LDC2004T19), [speech part 2](https://catalog.ldc.upenn.edu/LDC2005S13), and [transcripts part 2](https://catalog.ldc.upenn.edu/LDC2005T19); helper prints official access steps | Custom LDC license/paid access; re-check current LDC agreement before use or redistribution |
| [MLS](https://www.openslr.org/94/) | ASR | OpenSLR SLR94 links to Meta public-file archives for 8 LibriVox-derived languages; helper saves the page/checksums and downloads selected language archives only with opt-in | CC BY 4.0 |
| [MLC-SLM Eval](https://huggingface.co/datasets/bsmu/MLC-SLM-Eval) | Multilingual conversational ASR, diarization, and speaker-attributed ASR | Public, ungated 6.55 MB release of Eval-1/Eval-2 segmentation, speaker labels, and transcripts across 11 languages; helper downloads docs by default and makes annotations opt-in, but the official repository contains no audio and no current public audio URL is documented | HF card labels annotations CC BY-SA 4.0; no separate license file covers absent audio, and baseline code terms are unspecified |
| [2nd MLC-SLM Challenge 2026](https://www.nexdata.ai/competition/mlc-slm) | Multilingual conversational ASR, diarization, acoustic understanding, and semantic understanding | Registration-gated challenge with approximately 2,100 training hours across 14 languages plus development and evaluation sets; helper downloads public documentation and prints the official registration path without attempting restricted data access | Custom agreement limits data to the 2026 workshop, prohibits redistribution and other use, and requires return or destruction after termination; public baseline repositories have no detected code license |
| [Seed-TTS Eval](https://github.com/BytedanceSpeech/seed-tts-eval) | Zero-shot speech synthesis and voice cloning | Official ByteDance repository and public objective EN/ZH set on Google Drive; helper downloads evaluation docs/code by default while the dataset remains a manual Drive download | No data or code license specified; objective data selects Common Voice and DiDiSpeech-2 samples, and the subjective set is explicitly unreleased |
| [InstructTTSEval](https://github.com/KexinHUANG19/InstructTTSEval) | Controllable speech synthesis and instruction following | Official evaluation repo and public, ungated [CaasiHUANG/InstructTTSEval](https://huggingface.co/datasets/CaasiHUANG/InstructTTSEval); helper downloads docs by default and makes the ~1.8 GB embedded-audio snapshot opt-in | HF card lists MIT, but paper limits the dataset to academic/research use and describes film/TV-derived audio; code license is unspecified and source-media rights require review |
| [CapSpeech](https://wanghelin1997.github.io/CapSpeech-demo/) | Style-, accent-, emotion-, sound-effect-, and agent-conditioned speech synthesis | Public, ungated [OpenSound/CapSpeech](https://huggingface.co/datasets/OpenSound/CapSpeech) with more than 10 million machine-annotated and approximately 360,000 human-annotated audio-caption records plus fixed evaluation splits; helper downloads docs/API metadata by default and makes the approximately 4.31 GB metadata snapshot opt-in; source audio is obtained separately | CapSpeech resources are CC BY-NC 4.0, but referenced recordings span many upstream corpora with separate attribution, non-commercial, access, privacy, and media-rights constraints |
| [Dialogs](https://huggingface.co/datasets/langswap/dialogs-ru-emotional-conversations) | Expressive conversational Russian TTS, ASR, and emotion classification | Public, ungated 20.6-hour studio corpus with 11,796 utterances, three professional performers, 12 style/emotion labels, and fixed train/dev/test splits; helper downloads docs and lightweight dev/test tables by default while the 29.3 MB preview and 5.56 GB full snapshot are separate opt-ins | Custom OpenRAIL responsible-use license permits commercial use subject to use-based restrictions; the paper/card state performers consented to public and commercial release; baseline code is MIT |
| [SILMA Open-source Arabic TTS Benchmark](https://huggingface.co/spaces/silma-ai/opensource-arabic-tts-benchmark) | MSA, Egyptian, and Saudi Arabic speech synthesis listening evaluation | Public fixed prompts and generated outputs for direct auditory comparison across open-source Arabic TTS systems; helper downloads docs and prompt CSVs by default while the approximately 29.6 MB Space clone with audio is opt-in | Space metadata declares Apache-2.0, but no separate license file or prompt provenance is provided and evaluated-model output terms may still apply |
| [CV3-Eval](https://github.com/FunAudioLLM/CV3-Eval) | In-the-wild zero-shot and cross-lingual speech synthesis | Official CosyVoice 3 repository with multilingual, cross-lingual, emotion, expressive, continuation, and Chinese-accent subsets; Qwen3.5-Omni §5.2.3 calls its public cross-lingual subset the “Cross-Lingual benchmark” and reports 12 Chinese/English/Japanese/Korean directions; helper downloads docs by default and makes the roughly 760 MiB repository opt-in | Repository is Apache-2.0, but reference audio includes Common Voice, FLEURS, EmoBox, and web-crawled sources whose component rights require review |
| [TTS Multilingual Test Set](https://huggingface.co/datasets/MiniMaxAI/TTS-Multilingual-Test-Set) | Multilingual and target-speaker speech synthesis | Public MiniMaxAI set with 100 texts and two Common Voice-derived speaker prompts for each of 24 languages; Qwen3-TTS uses a 10-language subset in §4.2.2 and §4.2.5; helper keeps the approximately 7.3 MB snapshot opt-in | Dataset card lists CC BY-SA 4.0; speaker prompts derive from CC0-1.0 Common Voice |
| [CN-NewsTTS Bench](https://github.com/Jayden-X-L/cn-news-tts-bench) | Raw-input Chinese news TTS pronunciation and text-normalization evaluation | Public v0.1 release with 200 development and 800 test records, 1,240 auto-evaluable targets, fixed three-ASR transcripts, target-level scoring, and a reproducible leaderboard; helper downloads lightweight benchmark files by default while the roughly 2.17 GB generated-audio artifacts require explicit opt-in and provider-terms acknowledgement | Benchmark data/transcripts/results/docs are CC BY 4.0 and code is MIT; generated TTS audio may remain subject to the seven providers' API terms and should not be treated as unrestricted training data |
| [PodEval](https://github.com/yujxx/PodEval) | Multimodal long-form podcast-generation evaluation | Public evaluation toolkit plus a Real-Pod reference manifest covering 51 topics across 17 categories; helper downloads docs and the lightweight manifest by default, while the MIT toolkit clone is opt-in and podcast recordings remain third-party links rather than redistributed data | Toolkit is MIT; no separate license is stated for the manifest, and linked podcast recordings retain creator, publisher, platform, voice, music, and other media rights |
| [Text to Audio Human Preference Benchmark](https://huggingface.co/datasets/Rapidata/text-2-audio-human-preference-benchmark) | Human preference evaluation for synthesized speech | Public, ungated Rapidata metadata with 4,269 pairwise rows and about 32,000 friendliness/naturalness responses; helper saves official metadata by default and makes the approximately 0.8 MB snapshot opt-in | No license is declared; rows expose individual votes and annotator demographics, while referenced/generated-audio rights are also unspecified |
| [Audio-Alpaca](https://huggingface.co/datasets/declare-lab/audio-alpaca) | Text-to-audio preference modeling and generation alignment | Public, ungated 15,025-pair synthetic corpus from AudioCaps-derived prompts and four construction strategies; Audio-Zero samples an unreleased 2,000-pair subset; helper downloads docs by default and makes the approximately 9.71 GB snapshot opt-in | HF declares Apache-2.0, while the linked Tango repository uses CC BY-NC-ND 4.0; apply the stricter interpretation pending clarification and review caption/generated-audio rights |
| [MMGenre](https://fengjin1117.github.io/mmgenre-web/) | Multi-genre singing voice synthesis and genre alignment | Public, ungated [Leaky-ReLU/MMGenre](https://huggingface.co/datasets/Leaky-ReLU/MMGenre) with 3,152 Chinese audio-score segments spanning 10 genres and 26 subgenres; helper downloads docs/metadata by default and makes the approximately 5.54 GB snapshot opt-in | Dataset and repository declare CC BY 4.0; source music was generated with Suno V4.5, so review generation-service and generated-content terms independently |
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
| [KSC2](https://issai.nu.edu.kz/kz-speech-corpus/) | Kazakh and Kazakh-Russian code-switched ASR | Public, ungated [issai/Kazakh_Speech_Corpus_2](https://huggingface.co/datasets/issai/Kazakh_Speech_Corpus_2) with around 1,200 hours and more than 600,000 utterances; helper saves docs/metadata by default and makes the approximately 80.8 GB multipart snapshot opt-in | ISSAI owner page and DOI state CC BY 4.0; HF card's MIT tag conflicts, so use owner terms and review component broadcast/podcast/KSC/KazakhTTS2 rights |
| [Primewords Chinese Corpus Set 1](https://www.openslr.org/47/) | ASR | [OpenSLR SLR47](https://www.openslr.org/47/) page by default; 9.0 GiB Mandarin speech/transcript archive is opt-in | CC BY-NC-ND 4.0; OpenSLR says the corpus is free for academic use |
| [Pansori-TEDxKR](https://www.openslr.org/58/) | ASR | [OpenSLR SLR58](https://www.openslr.org/58/) metadata by default; 174 MB Korean TEDx speech/transcript archive is opt-in | CC BY-NC-ND 4.0; derived from TEDx talks, so source media terms still apply |
| [KeSpeech](https://github.com/tzyll/KeSpeech) | ASR | Baidu Pan link in repo, password `b6fy` | Custom terms: non-commercial, no adaptations, no third-party distribution |
| [Opencpop-test](https://wenet-e2e.github.io/opencpop/) | Mandarin singing transcription | Apply via the [official download page](https://wenet-e2e.github.io/opencpop/download/) and use the fixed five-song test split; Qwen3.5-Omni §5.1 reports CER on it; helper saves official provenance pages by default and accepts only a user-supplied emailed archive URL | Official page limits the corpus to non-commercial use under CC BY-NC-ND 4.0 and retains copyright with the Opencpop Team; repository code terms are unspecified |
| [MIR-1K vocal](http://mirlab.org/dataset/public/) | ASR / singing voice | [Figshare mirror](https://figshare.com/articles/dataset/MIR-1K_rar/5802891); official MIR Lab archive currently returns 404 | Official page does not state a license; Figshare mirror lists CC BY 4.0 |
| [ESC-50](https://github.com/karolpiczak/ESC-50) | Environmental sound classification | [GitHub archive](https://github.com/karolpiczak/ESC-50/archive/refs/heads/master.zip) or `git clone https://github.com/karolpiczak/ESC-50.git` | ESC-50 is CC BY-NC 3.0; ESC-10 subset clips are CC BY |
| [DCASE 2024 Task 5](https://dcase.community/challenge2024/task-few-shot-bioacoustic-event-detection) | Five-shot bioacoustic event detection | Public CC BY 4.0 [development set](https://zenodo.org/records/10829604) and reused [2023 evaluation set](https://zenodo.org/records/7879692); helper downloads official metadata, class maps, and annotation-only archives by default while approximately 23.4 GiB of audio is opt-in | Both official Zenodo records state CC BY 4.0; retain release attribution and review source-specific wildlife-recording constraints |
| [DCASE 2025 Task 2 ASD](https://dcase.community/challenge2025/task-first-shot-unsupervised-anomalous-sound-detection-for-machine-condition-monitoring) | First-shot unsupervised anomalous sound detection and machine-condition monitoring | Public [development](https://zenodo.org/records/15097779), [additional-training](https://zenodo.org/records/15392814), and [evaluation](https://zenodo.org/records/15519362) records with released labels/evaluator; helper downloads metadata by default and makes roughly 4.7 GB of archives opt-in by part | All three Zenodo records declare CC BY-NC-SA 4.0; evaluator uses the custom DCASE Challenge License v2.1 |
| [ASD Benchmark](https://github.com/yucongzh/ASD_Benchmark) | Unified anomalous-sound representation evaluation over DCASE 2020-2025 Task 2 | Public MIT pipeline with converted evaluation lists, official year-specific splits/scoring, and frozen-embedding plus lightweight-adaptation protocols; helper downloads docs by default and makes the small repository clone opt-in; source datasets remain separate official DCASE downloads | Code is MIT; underlying DCASE recordings retain year- and source-specific data terms, and the linked convenience Drive copy has no separately stated redistribution license |
| [DCASE 2026 Task 1 HAC](https://dcase.community/challenge2026/task-heterogeneous-audio-classification) | Hierarchical heterogeneous audio classification | Public CC BY 4.0 [BSD10k-v1.2](https://zenodo.org/records/17233904), [BSD35k-CS](https://zenodo.org/records/19187100), and held-out [evaluation](https://zenodo.org/records/20442928) releases; helper downloads official docs and about 7 MB of metadata by default while CLAP features and roughly 47 GB of audio/evaluation archives are opt-in | Zenodo records declare CC BY 4.0, but per-sound Freesound licenses and provenance still apply; baseline code license is unspecified |
| [DCASE 2024 Task 7 Sound Scene Synthesis](https://dcase.community/challenge2024/task-sound-scene-synthesis) | Text-to-audio environmental sound-scene synthesis | Public CC BY 4.0 [open-source release](https://zenodo.org/records/15630417) with 310 four-second prompt/audio pairs; helper downloads official metadata by default and makes the approximately 140 MiB archive opt-in; the original 250-item challenge evaluation set remains secret | Zenodo declares CC BY 4.0; retain packaged Freesound attribution and review per-clip provenance; baseline code terms are unspecified |
| [DCASE 2024 Task 9 LASS](https://dcase.community/challenge2024/task-language-queried-audio-source-separation) | Language-queried audio source separation | Public CC BY 4.0 [development](https://zenodo.org/records/10887496), [validation](https://zenodo.org/records/10886481), and [evaluation](https://zenodo.org/records/11425256) releases; helper downloads official docs and lightweight captions/annotations by default while approximately 1.14 GB of validation/evaluation audio is opt-in | Zenodo records declare CC BY 4.0; retain Freesound per-clip provenance and separately review FSD50K/Clotho source terms; baseline code terms are unspecified |
| [Soroll-IA](https://www.kaggle.com/datasets/itiresearch/soroll-ia-weakly-labeled-audio-port-monitoring) | Weakly labeled industrial-port audio tagging | Public 7,396-clip, 22-hour Kaggle release with 26 classes, two annotator-agreement protocols, and five-fold assignments; helper downloads official metadata/docs by default and makes the approximately 2.17 GB dataset opt-in | Dataset is CC BY-NC 4.0; benchmark repository has no stated code license |
| [DCASE 2025 Task 5 AudioQA](https://dcase.community/challenge2025/task-audio-question-answering) | Multi-domain audio question answering and temporal reasoning | Official auto-approved gated [Hugging Face release](https://huggingface.co/datasets/PeacefulData/2025_DCASE_AudioQA_Official) with Bioacoustics QA, Temporal Soundscapes QA, and Complex QA; helper saves public metadata and prints authenticated access steps without downloading audio | HF card metadata declares MIT, but upstream Watkins, AudioSet, Mira, and other source-audio terms may still apply; release-script code license is unspecified |
| [ADQA-Bench](https://dcase.community/challenge2026/task-audio-dependent-question-answering) | Audio-dependent question answering and shortcut-resistant audio reasoning | Public, ungated [Harland/ADQA-Bench](https://huggingface.co/datasets/Harland/ADQA-Bench) with 3,000 questions and WAV files; the [DCASE 2026 task summary](https://arxiv.org/abs/2607.18718) reports the finalized hidden-evaluation protocol and 36 submissions; the current release omits answers; helper downloads docs and the lightweight no-answer JSONL by default and makes the approximately 2.94 GB snapshot opt-in | HF card declares Apache-2.0, but incorporated MMAU, MMAR, MMSU, and other source recordings retain their own terms and media rights |
| [Synth-DoPaCo](https://huggingface.co/datasets/BeTraC/betrac-2026) | Long-form doctor-patient audio understanding and SOAP-note generation | Public, ungated 7,200-dialogue train and 400-dialogue development release with 16 kHz Opus audio, transcripts, metadata, and reference notes; helper downloads docs/API metadata by default and makes the approximately 14.6 GB snapshot opt-in; BeTraC's 875-item blind test set remains withheld | Public train/dev data is CC BY 4.0 and metrics code is Apache-2.0; do not infer access or redistribution rights for withheld acted and realistic test recordings |
| [MCIF](https://huggingface.co/datasets/FBK-MT/MCIF) | Multimodal crosslingual instruction following for recognition, translation, question answering, and summarization | Public, ungated fixed- and mixed-prompt test configurations with 362 long-form and 1,560 short-form examples each across speech, video, text, and four output languages; helper downloads lightweight manifests/references by default and makes the approximately 7.58 GiB shared-media snapshot opt-in | Benchmark data and ACL 2023 source talks are CC BY 4.0; evaluation code is Apache-2.0; preserve source attribution and consider presenter voice/likeness obligations |
| [AudioGrounding](https://zenodo.org/records/7269161) | Phrase-level temporal audio grounding and sound-event localization | Public, ungated v2 release with 4,974 AudioCaps/AudioSet-derived clips and phrase interval annotations; [GigaChat Audio](https://arxiv.org/abs/2607.10387) evaluates its combined 980 validation/test examples; helper downloads docs and approximately 5.2 MB of annotations by default while the approximately 2.33 GiB audio archive is opt-in | Zenodo declares CC BY 4.0 and code is MIT; underlying YouTube recordings retain source rights, availability, and platform-term caveats |
| [TimeGround-1M](https://huggingface.co/datasets/ai-sage/TimeGround-1M) | Long-form temporal localization, timestamped audio description, and timed summarization | Public, ungated English release with about 59,000 train and 4,200 test recordings spanning under 10 minutes to two hours; helper downloads docs/metadata by default and makes the approximately 1.50 TB snapshot opt-in | HF card declares CC BY 3.0; recordings derive from YODAS2 YouTube shards, so source-video rights and platform terms still apply; generation/evaluation code license is unspecified |
| [Clotho-Moment](https://h-munakata.github.io/Language-based-Audio-Moment-Retrieval/) | Language-based audio moment retrieval and temporal grounding in long audio | Public, ungated [51,240-item WebDataset](https://huggingface.co/datasets/lighthouse-emnlp2024/Clotho-Moment) used as DCASE 2026 Task 6 development data; helper downloads docs/metadata by default and makes the large audio snapshot opt-in | HF card and Lighthouse code declare Apache-2.0, but generated mixtures retain Clotho/Freesound and Walking Tours/YouTube component terms |
| [CASTELLA](https://h-munakata.github.io/CASTELLA-demo/) | Human-annotated audio moment retrieval and temporal grounding in real-world long audio | Public, ungated [English/Japanese annotations](https://huggingface.co/datasets/lighthouse-emnlp2024/CASTELLA) for 1,862 YouTube recordings, 3,925 local captions, and 11,308 temporal boundaries; helper downloads the lightweight annotations/docs by default, while CLAP features and audio tools are opt-in | Annotations and released features are CC BY 4.0; underlying YouTube media retains owner/platform rights, and the separate audio-downloader code has no stated license |
| [UrbanSound8K](https://urbansounddataset.weebly.com/urbansound8k.html) | Environmental sound classification | [Zenodo archive](https://zenodo.org/records/1203745) or the official browser/Python download page | Zenodo lists CC BY-NC 4.0; official site says free for non-commercial use under Creative Commons BY-NC 3.0 |
| [TAU Urban Acoustic Scenes 2019](https://dcase.community/challenge2019/task-acoustic-scene-classification) | Acoustic scene classification | [Development Zenodo record](https://zenodo.org/records/2589280); helper downloads doc/meta files by default and makes 21 audio shards opt-in | Zenodo record lists `Other (Non-Commercial)` without a more specific SPDX-style license |
| [TAU Urban Acoustic Scenes 2020 Mobile](https://dcase.community/challenge2020/task-acoustic-scene-classification) | Acoustic scene classification | [Development](https://zenodo.org/records/3670167) and [evaluation](https://zenodo.org/records/3685828) Zenodo records; helper downloads doc/meta files by default and makes multi-GB audio archives opt-in | Zenodo records list `Other (Non-Commercial)` without a more specific SPDX-style license |
| [TAU Urban Acoustic Scenes 2022 Mobile](https://dcase.community/challenge2025/task-low-complexity-acoustic-scene-classification-with-device-information) | Device-robust, low-complexity acoustic scene classification | Public [2022 development](https://zenodo.org/records/6337421) and [2025 evaluation](https://zenodo.org/records/15517945) releases used by DCASE 2025 Task 1; helper downloads docs/metadata by default while roughly 44.8 GiB of audio is opt-in | Both Zenodo records list `Other (Non-Commercial)` without a more specific SPDX-style license |
| [AudioSet](https://research.google.com/audioset/) | Audio event classification | Official [CSV metadata](https://research.google.com/audioset/download.html) and optional precomputed features archive | Dataset annotations/features are CC BY 4.0; ontology is CC BY-SA 4.0; original YouTube media terms still apply |
| [VGGSound](https://www.robots.ox.ac.uk/~vgg/data/vggsound/) | Audio-visual event classification | Official [CSV metadata](https://github.com/hche11/VGGSound/blob/master/data/vggsound.csv) with YouTube IDs, start times, labels, and split; helper fetches metadata/license only by default | CC BY 4.0 for the dataset metadata/release; original video copyright and YouTube availability/terms still apply |
| [AVE](https://github.com/YapengTian/AVE-ECCV18) | Audio-visual event localization | Official [project page](https://sites.google.com/view/audiovisualresearch), [ECCV repo](https://github.com/YapengTian/AVE-ECCV18), and Google Drive dataset/features links; helper saves docs by default and can clone the repo | Dataset and code licenses are not specified in the official repo; unconstrained source videos and Drive-hosted features require upstream-term review |
| [STARSS22](https://dcase.community/challenge2022/task-sound-event-localization-and-detection-evaluated-in-real-spatial-sound-scenes) | Spatial sound-event localization and detection | Public [Zenodo v1.1.0](https://zenodo.org/records/6600531) development/evaluation release with 4-channel FOA and tetrahedral-microphone recordings plus spatiotemporal labels; helper downloads official metadata only because the release is 6.0 GB | DataCite lists MIT for the dataset; the baseline README claims MIT but the repository has no LICENSE file or detected GitHub license, so clarify code terms before redistribution |
| [STARSS23](https://dcase.community/challenge2023/task-sound-event-localization-and-detection-evaluated-in-real-spatial-sound-scenes) | Spatial sound-event localization, detection, and source-distance estimation | Public [Zenodo v1.1.0](https://zenodo.org/records/7880637) development/evaluation release with 4-channel spatial audio, synchronized 360-degree video, and spatiotemporal labels; [DCASE 2024 Task 3](https://dcase.community/challenge2024/task-audio-and-audiovisual-sound-event-localization-and-detection-with-source-distance-estimation) reuses STARSS23 and adds distance estimation rather than releasing a STARSS24 dataset; helper downloads official metadata only because the archive is 16.3 GB | DataCite lists MIT for the dataset; the audio-only baseline has no detected license while Sony's audiovisual baseline is MIT; DCASE says video participants consented and visible faces were blurred |
| [DCASE2025 Task 3 Stereo SELD Dataset](https://dcase.community/challenge2025/task-stereo-sound-event-localization-and-detection-in-regular-video-content) | Stereo and audio-visual sound-event localization, detection, distance estimation, and onscreen/offscreen classification | Public [Zenodo v1.1.0](https://zenodo.org/records/15559774) release derived from STARSS23, with 30,000 labeled development clips and 10,000 evaluation clips; helper downloads official docs by default, makes the approximately 15.2 MB labels opt-in, and leaves the approximately 27.6 GB stereo-audio/perspective-video release on Zenodo | Dataset and Sony data-generator code are MIT; official baseline code has no detected license; preserve STARSS23 privacy/provenance context for the derived recordings |
| [LOCATA](https://www.locata.lms.tf.fau.de/) | Acoustic source localization and tracking | Open final [Zenodo release](https://zenodo.org/records/3630471) with corrected development/evaluation data, four microphone-array configurations, OptiTrack ground truth, and six static/moving single-/multi-source tasks; helper downloads official metadata/docs only because the two archives total about 19.3 GB | ODC-By-1.0 data; official MATLAB I/O and evaluation repositories expose no LICENSE file or detected GitHub license, so clarify software terms before redistribution |
| [Spatial LibriSpeech](https://github.com/apple/ml-spatial-librispeech) | Spatial speech localization and room-acoustics estimation | Public Apple release with more than 650 hours of first-order ambisonic speech, optional distractor noise, and labels for source pose, room geometry, C50, DRR, EDT, T20, and T30; helper downloads docs by default while the approximately 365 MiB metadata and individual FLAC samples are opt-in; advertised raw 19-channel audio remains unreleased | Apple's dataset copyrights are CC BY 4.0, while the license preserves upstream LibriSpeech, DNS/AudioSet, and Freesound component terms |
| [STAR-Bench](https://internlm.github.io/StarBench/) | Foundational acoustic perception and spatio-temporal multi-audio reasoning | Public, ungated [v1.0 release](https://huggingface.co/datasets/internlm/STAR-Bench) with 2,353 questions across perception, temporal reasoning, and spatial reasoning; helper downloads the roughly 2 MB question metadata by default and makes the 2.74 GB audio archive opt-in | Data card declares CC BY-NC 4.0 and research-only use; source-audio terms still apply; code licensing conflicts between an MIT LICENSE and an Apache-2.0/research-only README signal |
| [L3DAS21](https://www.l3das.com/mlsp2021/index.html) | 3D speech enhancement and sound-event localization/detection | Public 65-hour [Zenodo V1 release](https://zenodo.org/records/4642005) with spatial speech mixtures and one-minute SELD scenes built from one or two first-order Ambisonics microphones; helper downloads official docs and metadata by default and makes selected large archives explicit opt-ins | DataCite lists CC BY 4.0; mixtures derive from LibriSpeech and FSD50K, so their source and per-clip terms still apply; official challenge code has no stated license |
| [L3DAS22](https://www.l3das.com/icassp2022/) | 3D speech enhancement and sound-event localization/detection | Public 105.8 GB Kaggle release with nearly 90 hours of spatial speech mixtures and 7.5 hours of SELD scenes recorded through one or two first-order Ambisonics microphones; helper downloads official docs and metadata by default and makes the full Kaggle archive explicit opt-in | Kaggle lists CC BY 4.0; mixtures derive from LibriSpeech and FSD50K, so their source and per-clip terms still apply; official challenge code has no stated license |
| [TAU Spatial Sound Events 2019](https://zenodo.org/records/2599196) | Spatial sound-event localization and detection | Complete public DCASE 2019 Task 3 release with 400 development and 100 evaluation one-minute scenes in matching FOA and tetrahedral-microphone formats; helper downloads official docs by default, keeps the roughly 490 KB labels opt-in, and leaves the approximately 10.1 GB audio release on Zenodo | Custom Tampere University experimental/non-commercial terms for data and baseline code; source events derive from the DCASE 2016 Task 2 isolated-event dataset |
| [TAU-NIGENS Spatial Sound Events 2020](https://zenodo.org/records/4064792) | Spatial sound-event localization, detection, and tracking | Complete public DCASE 2020 Task 3 release with 600 development and 200 evaluation one-minute scenes in FOA and tetrahedral-microphone formats; helper downloads official docs by default, keeps the roughly 1.7 MB labels opt-in, and leaves the approximately 14.0 GB audio release on Zenodo | CC BY-NC 4.0; source events derive from NIGENS and retain provenance considerations; baseline code is mostly under a custom TAU License |
| [TAU-NIGENS Spatial Sound Events 2021](https://zenodo.org/records/4844825) | Spatial sound-event localization, detection, and tracking with directional interference | Complete public DCASE 2021 Task 3 release with 600 development and 200 evaluation one-minute scenes in FOA and tetrahedral-microphone formats; helper downloads official docs by default, keeps the roughly 1.8 MiB development labels opt-in, and leaves the approximately 14.2 GiB audio release on Zenodo | CC BY-NC 4.0; source events derive from NIGENS and retain provenance considerations; baseline code has custom experimental/non-commercial terms |
| [EPIC-SOUNDS](https://epic-kitchens.github.io/epic-sounds/site) | Egocentric audio event recognition | Official [annotation repository](https://github.com/epic-kitchens/epic-sounds-annotations) with public train/validation/test timestamp CSVs; helper downloads docs/CSV annotations by default while raw audio follows EPIC-KITCHENS-100 access/extraction steps | Annotation README states CC BY-NC 4.0; raw audio derives from EPIC-KITCHENS-100 videos and may require separate access/HDF5 approval |
| [FSD50K](https://fsannotator.upf.edu/fsd/release/FSD50K/) | Audio event classification | [Zenodo record](https://zenodo.org/records/4060432); helper downloads docs/labels/metadata by default and audio only with opt-in | Mixed Creative Commons: per-clip Freesound licenses include CC0, CC-BY, CC-BY-NC, and CC Sampling+; curated dataset is CC BY with upstream caveats |
| [Doppelganger](https://github.com/elliottash/doppelganger) | Synthetic-to-real sound-effect retrieval and audio-representation evaluation | Public, ungated 10,420-pair UCS benchmark plus a seven-class DCASE 2023 Task 7 core; official manifests/code are on GitHub and generated twins/embeddings are on [Hugging Face](https://huggingface.co/datasets/elliottash/doppelganger); helper downloads docs by default while the roughly 10 MB repo and 8.48 GB dataset are separate opt-ins | Mixed: manifests/embeddings/logs and code are MIT; Stable Audio Open twins use the Stability AI Community License, ElevenLabs twins use the author's ElevenLabs license, and real audio retains source-specific terms or is reference-by-ID only |
| [FSDKaggle2018](https://zenodo.org/records/2552860) | Audio event classification | [Zenodo record](https://zenodo.org/records/2552860) for docs, metadata, train audio, and test audio; helper downloads docs/metadata by default and audio only with opt-in | Zenodo license id is `other-at`; dataset curation is CC BY, while individual Freesound clips keep per-clip Creative Commons licenses in the metadata |
| [FSDKaggle2019](https://zenodo.org/records/3612637) | Audio event classification | [Zenodo record](https://zenodo.org/records/3612637) for docs, metadata, curated/noisy train audio, and test audio; helper downloads docs/metadata by default and audio only with opt-in | Zenodo license id is `other-at`; dataset curation is CC BY, while Freesound/Flickr clips keep per-clip Creative Commons licenses in the metadata |
| [DESED](https://project.inria.fr/desed/) | Sound event detection | Official [DESED repo](https://github.com/turpaultn/DESED), [real metadata](https://zenodo.org/records/3588179), and [synthetic soundscape files](https://zenodo.org/records/6026841); helper downloads repo/metadata/JAMS by default and makes audio opt-in | Zenodo real and synthetic records list CC BY 4.0; Python code is MIT; component source-media terms still need checking |
| [TUT Sound Events 2017](https://dcase.community/challenge2017/task-sound-event-detection-in-real-life-audio) | Polyphonic sound event detection in street recordings | Public version-2 [development](https://zenodo.org/records/814831) and [evaluation](https://zenodo.org/records/1040179) sets with verified strong annotations for six event classes; helper downloads official metadata/docs by default while approximately 1.55 GiB of audio is opt-in | Both Zenodo records say Other (Non-Commercial); packaged EULAs control use and should be reviewed before redistribution |
| [MAESTRO Real](https://zenodo.org/records/7244360) | Soft-label sound event detection | Public 49-recording development set with crowdsourced multi-annotator strong labels; helper downloads docs and the sub-megabyte annotations by default while the approximately 2.43 GiB audio archive is opt-in; DCASE 2024 Task 4's separate 26-file evaluation set is not released here; official sources conflict on total duration | Custom Tampere University terms allow experimental, non-commercial use with attribution and explicitly prohibit commercial use, including distributing results or content achieved through the dataset |
| [RealDESED](https://zenodo.org/records/20056072) | Real-world domestic sound event detection | Public Zenodo train, validation, and test archives with temporal annotations and recording metadata; helper saves official metadata/docs by default and makes the approximately 8.74 GB audio release opt-in | Audio and corresponding metadata use per-file CC0 or CC BY terms recorded in `metadata.csv`; remaining metadata and annotations are CC BY 4.0; baseline code is MIT |
| [WABAD](https://zenodo.org/records/15629388) | Global bird-species detection for passive acoustic monitoring | Public, ungated 5,047-minute release with 91,931 time-frequency-bounded vocalizations from 1,192 species across 72 sites; MetaPerch evaluates it as an 84-hour detection benchmark; helper downloads metadata and annotations by default while the approximately 19.8 GiB site archives require explicit opt-in | Zenodo's structured field says CC BY 4.0 but its description says CC BY-NC 4.0; apply the stricter noncommercial terms pending clarification |
| [BirdCLEF++ 2026](https://www.imageclef.org/BirdCLEF2026) | Multi-label animal-vocalization detection in Pantanal soundscapes | Official 522.1-hour Kaggle competition family with 344.5 hours of focal recordings and 177.6 hours of soundscapes; 1.03 soundscape hours are labeled and the task predicts 234 species on five-second windows; helper saves official provenance and prints the manual Kaggle access path | Kaggle account and competition-rule acceptance required; no standalone data license is stated on the LifeCLEF page, and Xeno-canto/source-recording terms remain applicable |
| [SEABAD](https://zenodo.org/records/18290494) | Tropical bird-activity detection and edge bioacoustic monitoring | Public, ungated 50,000-clip release with fixed 40,000/5,000/5,000 train/validation/test splits, balanced bird-present and bird-absent classes, and 1,677 Southeast Asian species; helper downloads official metadata by default while the approximately 3.87 GiB archive requires source-terms acknowledgment and explicit opt-in | Zenodo declares CC BY 4.0 for the compilation, but audio retains per-recording Xeno-Canto and negative-source licenses, including noncommercial and share-alike variants; repository README claims MIT for code but no LICENSE file is present |
| [SONYC-UST-V2](https://zenodo.org/records/3966543) | Urban sound tagging | [Zenodo v2.3 record](https://zenodo.org/records/3966543) for annotations, taxonomy, README, and 19 audio shards; helper downloads metadata by default and makes audio opt-in | CC BY 4.0; DCASE task rules restrict private external data for reproducible challenge submissions |
| [VoxCeleb](https://www.robots.ox.ac.uk/~vgg/data/voxceleb/) | Speaker recognition | [OpenSLR SLR49 metadata/trial lists](https://www.openslr.org/49/); official VGG pages currently say original audio/URL files are no longer available there | VGG metadata is CC BY-SA 4.0; OpenSLR SLR49 lists its small metadata resource as not copyrighted; original YouTube media rights still apply |
| [VoxBlink2](https://voxblink2.github.io/) | Speaker verification and open-set speaker identification | Official annotation/evaluation [repository](https://github.com/VoxBlink2/ScriptsForVoxBlink2) plus a manual Google Drive resource bundle; helper downloads docs/license by default and makes the repository clone opt-in, while source YouTube media is never redistributed | Annotation data is CC BY-NC-SA 4.0; code is not separately licensed, and YouTube media rights, platform terms, privacy, and local law remain separate |
| [TidyVoice](https://tidyvoice2026.github.io/) | Multilingual and cross-lingual read-speech speaker verification | Public [Mozilla Data Collective release](https://datacollective.mozillafoundation.org/datasets/cmihtsewu023so207xot1iqqw) with 321,711 utterances, 4,474 speakers, 40 languages, and same-/cross-language trials; account and API key are required, so the helper saves docs and prints the official access path without accepting credentials or fetching the approximately 36.72 GB archive | Data page labels the release CC0-1.0 but restricts use to speaker verification and forbids speaker identification or identity recovery; baseline code is Apache-2.0 |
| [HI-MIA](https://www.openslr.org/85/) | Far-field text-dependent speaker verification | [OpenSLR SLR85](https://www.openslr.org/85/) page and filename mapping by default; train/dev/test archives are opt-in because they are multi-GB | Apache License v2.0 |
| [VoxConverse](https://www.robots.ox.ac.uk/~vgg/data/voxconverse/) | Speaker diarization | Official [annotation repository](https://github.com/joonson/voxconverse) plus dev/test WAV ZIPs on the VGG page; helper clones annotations by default and makes audio opt-in | CC BY 4.0 for research use; original video copyrights remain with upstream owners |
| [DIHARD III](https://dihardchallenge.github.io/dihard3/) | Speaker diarization | LDC [development](https://catalog.ldc.upenn.edu/LDC2022S12) and [evaluation](https://catalog.ldc.upenn.edu/LDC2022S14) web-download releases after LDC access; helper prints official access steps | LDC user agreement access; development/evaluation data require LDC membership or non-member licensing |
| [ASVspoof 2015](https://datashare.ed.ac.uk/handle/10283/853) | Speaker verification anti-spoofing and unseen synthetic-speech attack detection | Public Edinburgh DataShare release covering ten known/unknown TTS and voice-conversion attacks; helper downloads official metadata/docs by default, makes the approximately 2.1 MB protocol archive opt-in, and keeps the approximately 24.1 GB WAV archive behind a separate opt-in | DataShare metadata declares CC BY 4.0; retain attribution and review packaged terms and source-speech provenance |
| [ASVspoof 2017 V2](https://datashare.ed.ac.uk/items/59543650-e9b0-415d-8058-0567f908ce37) | Speaker verification anti-spoofing and replay attack detection | Public Edinburgh DataShare release with 42 speakers and replayed speech from 179 sessions in 61 replay configurations; helper downloads official metadata/docs by default, makes the small protocol archive opt-in, and keeps the approximately 1.4 GiB train/dev/eval archives behind a separate opt-in | DataShare metadata declares CC BY-NC 4.0; the corpus uses genuine and replayed RedDots speech, so retain attribution and review packaged/upstream terms |
| [ASVspoof 2019](https://datashare.ed.ac.uk/handle/10283/3336) | Speaker verification anti-spoofing | Edinburgh DataShare record with README, license, evaluation plan, paper PDF, and opt-in LA/PA archives | Open Data Commons Attribution License on the DataShare record; derived from VCTK, so component terms should be re-checked |
| [ADD 2022](http://addchallenge.cn/downloadADD2022) | Low-quality, partially fake, and game-based audio deep-synthesis detection | Public, ungated train/development, adaptation, and test packages across six official Zenodo records; helper downloads challenge and record metadata by default and makes the approximately 49.5 GB release opt-in by named record | CC BY-NC-ND 4.0; commercial use and distribution of adaptations are prohibited, and source-voice, recording, and generator rights still require review |
| [TFCL AFE](https://huggingface.co/datasets/JunXueTech/TFCL) | Speech-deepfake robustness under cascaded acoustic-front-end processing | Public, ungated ASVspoof 2019 LA derivative with approximately 38.5 GB of paired VAD train/development and six-stage AFE evaluation audio; helper downloads docs/metadata by default while processed audio, the 1.27 GB checkpoint, and code are separate opt-ins | Dataset card says `license: other` without terms; code is MIT, while ASVspoof 2019, RIR, MUSAN, DNS Challenge, AudioSet, and Freesound component terms remain applicable |
| [ASVspoof 2021](https://www.asvspoof.org/index2021.html) | Speaker verification anti-spoofing and speech deepfake detection | Official ASVspoof page, [baseline repo](https://github.com/asvspoof-challenge/2021), [LA](https://zenodo.org/record/4837263), [PA](https://zenodo.org/record/4834716), and [DF](https://zenodo.org/record/4835108) Zenodo records; helper downloads eval plan and keys/metadata by default, with large speech archives opt-in | Official page says Open Data Commons Attribution Licence; Zenodo lists ODC-BY for LA/PA and ODC-ODbL for DF; baseline repo had no detected license |
| [DiffSSD](https://huggingface.co/datasets/purdueviperlab/diffssd) | Diffusion-TTS synthetic-speech detection and speech forensics | Public, ungated release with 70,000 English synthetic utterances from ten TTS systems and a 94,226-row protocol referencing 24,226 separately obtained real LJ Speech/LibriSpeech files; helper downloads docs and lightweight metadata by default and makes the approximately 16.9 GiB synthetic-audio TAR opt-in | CC BY-NC-ND 4.0 applies only to synthetic voices and incorporates source-corpus, ChatGPT, and TTS-system requirements; real speech retains its owner terms |
| [Fake-or-Real](https://bil.eecs.yorku.ca/datasets/) | Synthetic-speech and audio-deepfake detection, including rerecording robustness | Public York University release with more than 195,000 utterances across original, normalized, two-second, and rerecorded variants; helper saves the owner page by default and makes the approximately 16.0 GiB archives explicit per-version opt-ins | No dataset-specific license or reuse terms stated; CMU Arctic, LJ Speech, VoxForge, generated-voice, and lab-recording component rights require separate review |
| [ASVspoof 5](https://zenodo.org/records/14498691) | Speech spoofing, deepfake, adversarial-attack detection, and spoofing-robust speaker verification | Public ASVspoof release with 1,006,363 utterances from roughly 2,000 speakers; helper downloads official metadata/docs by default, makes the approximately 19.7 MiB protocols opt-in, and leaves the approximately 142.3 GB audio on Zenodo | Database is ODC-BY 1.0 and bona fide data is CC BY 4.0; preserve Multilingual LibriSpeech provenance and review individual-content/privacy rights; baseline code license is unspecified |
| [In-the-Wild](https://deepfake-total.com/in_the_wild) | In-the-wild audio-deepfake detection and cross-dataset generalization | Public, ungated [mueller91/In-The-Wild](https://huggingface.co/datasets/mueller91/In-The-Wild) with 37.9 hours of English bona fide and deepfake speech from 58 celebrities and politicians; helper downloads docs/metadata by default while the approximately 7.60 GiB ZIP is opt-in | Conflicting official signals: owner page says Apache-2.0, HF card says CC BY-SA 4.0; source-video copyright, platform, voice/likeness, and privacy rights also require review |
| [SpoofCeleb](https://jungjee.github.io/spoofceleb/) | In-the-wild speech deepfake detection and spoofing-robust speaker verification | Author-approved gated [jungjee/spoofceleb](https://huggingface.co/datasets/jungjee/spoofceleb) with more than 2.5 million utterances, 1,251 speakers, and 23 TTS attacks; helper downloads public docs/API metadata by default and makes the approximately 268.3 GB snapshot a terms-acknowledged opt-in | Project and HF tag state CC BY 4.0, but source human-speech copyright remains with original video owners; review video, voice, likeness, privacy, and generated-speech rights |
| [PartialEdit](https://yzyouzhang.com/PartialEdit/index.html) | Partial speech-deepfake detection and temporal localization | Public [Zenodo release](https://zenodo.org/records/15519188) of the VCTK-derived E1/E1-Codec and E2/E2-Codec subsets; helper downloads official pages and record metadata by default, with approximately 7.7 MB of protocol/text metadata and 21.9 GB of audio as separate opt-ins; Audiobox-derived E3/E4 are explicitly withheld | Zenodo declares CC BY 4.0; preserve VCTK provenance and review neural-editor output terms; the license does not cover or release E3/E4 |
| [AudioMarkBench](https://github.com/mileskuo42/AudioMarkBench) | Audio-watermark robustness, removal, forgery, and fairness evaluation | Public evaluation code and manual [Google Drive audio release](https://drive.google.com/drive/folders/1037mBf4LoGq0CDxe6hYx5fNNv56AY_9e) covering 20,000 Common Voice-derived AudioMarkData clips and 20,000 LibriSpeech clips; helper downloads docs by default and makes the small repository clone opt-in | Code is MPL-2.0; released original, watermarked, and perturbed audio has no separate stated license and retains Common Voice/LibriSpeech source-term and privacy considerations |
| [Designed Vocalizations Dataset](https://ncai-official.github.io/speech/publications/designed-vocalizations-dataset/) | Non-human voice conversion and sound-designed timbre transfer | Public, ungated [NCSOFT/Designed-Vocalizations-Dataset](https://huggingface.co/datasets/NCSOFT/Designed-Vocalizations-Dataset) with 237,574 raw and effect-processed clips plus a 5,640-reference test protocol crossing seen/unseen source timbres and presets; helper downloads docs and lightweight metadata by default and makes the approximately 37.1 GB snapshot opt-in | CC BY 4.0 covers the compilation and original contributions; VCTK/HiFi-TTS/Freesound-derived clips retain per-source CC0, CC BY 3.0, or CC BY 4.0 attribution and notice requirements |
| [SynSFX](https://ofspectrum.com/news/synsfx) | Non-speech sound-effect deepfake detection and unseen-generator robustness | Direct official academic-research-only release with 43,374 clips and 178 hours across five authentic-audio sources and seven text-to-audio generators; helper saves docs by default and requires explicit acknowledgement plus opt-in for the large uncompressed-WAV archive | Only “Academic research only” is stated; no full dataset license or redistribution terms are published, authentic source-media terms remain applicable, and no evaluation-code release was linked |
| [VoxENES 2026](https://www.kaggle.com/datasets/interspeech2712/voxenes-2026) | Bilingual speech spoofing and audio deepfake detection robustness | Public Kaggle release with 53,628 English/Spanish bona fide, TTS, voice-conversion, and post-processed samples; helper downloads metadata by default and makes the approximately 23.3 GB dataset opt-in | Kaggle declares CC BY 4.0; LibriSpeech, VoxPopuli, voice-data, and synthesis-system source/output terms still require review |
| [VoxLingua107](https://huggingface.co/datasets/TalTechNLP/VoxLingua107) | Spoken language identification | TalTechNLP [Hugging Face mirror](https://huggingface.co/datasets/TalTechNLP/VoxLingua107); helper downloads metadata by default and requires opt-in for the larger snapshot | HF card lists CC BY-NC 4.0; YouTube-derived source media availability and platform terms still apply |
| [Speech Commands](https://www.tensorflow.org/datasets/catalog/speech_commands) | Keyword spotting | Official TensorFlow archives: [v0.02](https://storage.googleapis.com/download.tensorflow.org/data/speech_commands_v0.02.tar.gz), [v0.01](https://storage.googleapis.com/download.tensorflow.org/data/speech_commands_v0.01.tar.gz), or [google/speech_commands](https://huggingface.co/datasets/google/speech_commands) | CC BY 4.0; HF card asks users not to try to identify speakers |
| [MSWC](https://mlcommons.org/datasets/multilingual-spoken-words/) | Multilingual keyword spotting and spoken term search | Official MLCommons page, [MLCommons/ml_spoken_words](https://huggingface.co/datasets/MLCommons/ml_spoken_words), and per-language MLCommons archive mirrors; helper saves docs by default and makes audio/splits/alignments opt-in | CC BY 4.0; derived from crowd-sourced sentence-level speech, so preserve attribution and re-check source terms |
| [SpInt](https://zenodo.org/records/20763580) | Spanish speech-intelligibility and enhancement-metric evaluation | Public Zenodo v1.0 release with behavioral scores and metadata for 5,148 processed utterances, complex enhancement masks, noise, and a reconstruction script; helper downloads the record and lightweight files by default while the approximately 3.87 GiB archives are opt-in | Released artifacts are CC BY 4.0; clean Spanish Matrix Test speech is intentionally excluded and must be obtained under separate terms |
| [AudioMNIST](https://github.com/soerenab/AudioMNIST) | Spoken digit classification | Official GitHub repository with 30,000 spoken-digit WAV files and speaker metadata; helper downloads README/LICENSE/metadata by default and clones the repository only with opt-in | Repository-level LICENSE is MIT; recorded-voice consent/privacy obligations should still be considered for downstream use |
| [UME-ERJ](https://doi.org/10.32130/src.UME-ERJ) | L2 English phone, rhythm, and intonation assessment | Official NII/SRC corpus with rated word and sentence recordings from 202 Japanese learners of English; access requires submitting a usage pledge and passing review, and the helper saves only public provenance before printing the manual steps | Custom research-only permission; no standard open-data license is stated, redistribution is not authorized by the public record, and identifiable learner voices and proficiency ratings warrant privacy and ethics review |
| [UME-JRF](https://doi.org/10.32130/src.UME-JRF) | L2 Japanese holistic pronunciation, rhythm, intonation, and difficult-sound assessment | Official NII/SRC corpus with read speech from 141 intermediate-to-advanced learners across 26 native-language groups; access requires submitting a usage pledge and passing review, and the helper saves only public provenance before printing the manual steps | Custom research-only permission; no standard open-data license is stated, redistribution is not authorized by the public record, and identifiable learner voices, language backgrounds, and ratings warrant privacy and ethics review |
| [SALMon](https://pages.cs.huji.ac.il/adiyoss-lab/salmon/) | Acoustic consistency and semantic-acoustic alignment for speech language models | Public, ungated [slprl/SALMon](https://huggingface.co/datasets/slprl/SALMon) with 1,600 likelihood-ranking pairs across eight configurations; helper downloads official docs/metadata by default and makes the approximately 562 MB snapshot opt-in | Dataset is CC BY-NC 4.0 and derives components from Expresso, VCTK, LJSpeech, FSD50K, EchoThief, and Azure TTS; evaluation-repository code terms are unspecified |
| [ParaPairAudioBench](https://github.com/jsujeon/ParaPairAudioBench) | Paralinguistic pairwise evaluation of audio-language-model judges | Official repository with 5,175 pair definitions across style, rate, emphasis, age, and gender; rate/emphasis/style annotations are ready to use, while age and part of gender require SVC access; helper downloads docs by default and makes the small metadata/code clone opt-in | Mixed upstream terms: SVC is non-commercial academic research, EARS/Expresso are CC BY-NC 4.0, and LibriTTS is CC BY 4.0; the benchmark repo itself has no stated data or code license |
| [SpeechEQ](https://huggingface.co/datasets/SpeechEQ/SpeechEQ) | Multi-turn spoken-dialogue emotional intelligence and paralinguistic reasoning | Public, ungated English release with 2,265 six-turn dialogues (42h 23m) across 15 EQ-i 2.0 subscales; helper downloads docs by default and makes the approximately 2.45 GB embedded-audio snapshot opt-in | Data and code licenses are not specified; the paper's CC BY-NC-SA 4.0 publication license must not be assumed to cover benchmark audio, annotations, or code |
| [SpeechEditBench](https://github.com/daxintan-cuhk/SpeechEditBench) | Bilingual multi-attribute instruction-guided speech editing | Public, ungated [DiscreteSpeech/SpeechEditBench](https://huggingface.co/datasets/DiscreteSpeech/SpeechEditBench) v1.1 with 4,700 English/Chinese samples across content, speaker, emotion, style, prosody, paralinguistic, acoustic, and compositional editing; helper downloads docs and sample JSONL metadata by default while the approximately 3.75 GB audio snapshot is opt-in | Contributor-authored assets and code are Apache-2.0, but affected audio retains mixed upstream CC BY, Apache, non-commercial, research-only, custom-license, and access-agreement terms |
| [IFEval-Audio](https://huggingface.co/datasets/YichenG170/AudioLLMInstructionFollowing) | Audio and speech instruction following | Gated Hugging Face release with 280 audio-instruction-answer triples; helper downloads official docs/metadata by default and makes the approximately 45 MB snapshot opt-in after accepting access conditions | HF card lists Apache-2.0, but source clips retain mixed terms including CC BY-SA, CC BY-NC-ND, academic-only WavCaps, and inherited AudioBench-source licenses; evaluation code says Creative Commons NonCommercial without a version |
| [Ming-Freeform-Audio-Edit](https://huggingface.co/datasets/inclusionAI/Ming-Freeform-Audio-Edit-Benchmark) | Instruction-based semantic and acoustic speech editing | Public, ungated bilingual benchmark for deletion, insertion, substitution, emotion/dialect conversion, and speed/pitch/volume alteration; helper downloads official docs by default and makes the approximately 1.07 GB Hugging Face snapshot opt-in | HF card lists Apache-2.0, but source-audio terms still apply: Seed-TTS Eval has no stated data license, LibriTTS is CC BY 4.0, and GigaSpeech has separate agreement/access conditions; evaluation-repo code license is unspecified |
| [MMAE](https://github.com/ddlBoJack/MMAE) | General-purpose instruction-based audio editing | Public, ungated 2,000-sample benchmark across sound, speech, music, and mixtures, with 17,741 rubric criteria; helper downloads docs/metadata by default and makes the approximately 4.43 GB [Hugging Face](https://huggingface.co/datasets/BoJack/MMAE) snapshot opt-in | Data and source-audio licenses are unspecified; evaluation-repository code is MIT, which must not be assumed to license the benchmark audio |
| [MCR-Bench](https://github.com/WangCheng0116/MCR-BENCH) | Audio-text conflict resolution and robustness | Public Google Drive release with approximately 3,000 samples across audio QA, speech emotion, and vocal-sound classification; helper downloads official docs/metadata by default, prints the manual Drive path, and makes the small repository clone opt-in | Mixed upstream terms: the repo has an Apache-2.0 LICENSE but an inconsistent MIT badge, neither clearly licenses the archive; ClothoAQA/Clotho, MELD/Friends, and VocalSound source-audio rights still apply |
| [DHAuDS](https://github.com/Andy-Shao/DHAuDS) | Dynamic heterogeneous corruption robustness for audio-classification test-time adaptation | Four public, ungated corruption benchmarks derived from Speech Commands V2, VocalSound, UrbanSound8K, and ReefSet; helper downloads docs/metadata by default and requires an explicit subset selection for approximately 50.0 GB of Hugging Face snapshots | Cards and code declare Apache-2.0, but source corpora and QUT-NOISE/DEMAND corruptions retain separate terms, including UrbanSound8K's non-commercial restriction |
| [SpurAudio](https://github.com/Jerryaa98/SpurAudio) | Few-shot audio classification robustness | Public, ungated [spuraudioNips/SpurAudio-neurips-anonym](https://huggingface.co/datasets/spuraudioNips/SpurAudio-neurips-anonym) with 16,381 WAV files; helper downloads docs/metadata by default and makes the approximately 7.69 GB snapshot opt-in | HF card lists CC BY 4.0, but mixtures derive from five datasets with separate terms, including non-commercial ESC-50 and UrbanSound8K restrictions; code is MIT |
| [Geo-ATBench](https://github.com/WuYanru2002/Geo-ATBench) | Geospatially contextualized multi-label audio tagging | Public, ungated [Zenodo release](https://zenodo.org/records/18980673) with 3,854 ten-second clips, 28 sound-event labels, and POI-derived context over 11 OpenStreetMap categories; helper downloads docs/metadata by default and makes the approximately 850 MB archive opt-in | Zenodo declares CC BY 4.0 and code is MIT; retain attribution and review source Freesound clip licenses plus OpenStreetMap attribution/database terms |
| [UrBAN](https://doi.org/10.20383/103.0972) | Beehive acoustic monitoring and colony-strength regression | Public FRDR release with 2021-2022 raw audio and hive-inspection/sensor metadata from a ten-hive Montréal apiary; the paper reports more than 3,000 hours while the older repository record says more than 2,000; helper saves docs/metadata only because the approximately 1.265 TB corpus uses a manual Globus transfer | FRDR data is CC BY 4.0; repository code license is unspecified, and the Scientific Data article's CC BY-NC-ND 4.0 license is separate |
| [VocalSound](https://github.com/YuanGongND/vocalsound) | Human vocal sound classification | Official GitHub README and direct Dropbox archives for 16 kHz and 44.1 kHz releases; helper saves docs by default and makes archives opt-in | Dataset README says CC BY-SA 4.0; GitHub API reports no repository-level license, so code license is not specified |
| [VocalSet](https://zenodo.org/records/1193957) | Singing voice analysis | Official [Zenodo record](https://zenodo.org/records/1193957), DOI, and [ISMIR paper](https://archives.ismir.net/ismir2018/paper/000105.pdf); helper saves record metadata by default and makes the 2.1 GB archive opt-in | Zenodo lists CC BY 4.0; treat singer voice data with normal consent/attribution care |
| [EmoV-DB](https://github.com/numediart/EmoV-DB) | Emotional speech synthesis and speech emotion | [OpenSLR SLR115](https://www.openslr.org/115/) per-speaker/per-emotion archives; helper saves docs/license by default and downloads selected archives only with opt-in | Custom non-commercial terms for research, teaching, scientific publication, and personal experimentation; commercial use requires contacting the owner |
| [Androids Corpus](https://github.com/androidscorpus/data) | Speech-based depression detection | Public owner-hosted 3.69 GB corpus with 228 Italian recordings from 118 speakers, read and interview tasks, speaker metadata, turn segmentation, and official five-fold protocols; helper downloads docs by default and requires terms acknowledgment before the archive | Custom academic-research-only terms prohibit commercial use, redistribution, broadcasting, or making the corpus publicly available elsewhere; recordings contain sensitive health labels and identifiable voices |
| [PVQD](https://data.mendeley.com/datasets/9dz247gnyb/4) | Clinical and perceptual voice-quality assessment | Public, ungated Mendeley Data v4 release with 296 whole-speaker WAV files and 13 CAPE-V, GRBAS, and demographic spreadsheets; helper downloads metadata by default, makes the approximately 0.6 MiB labels/docs opt-in, and keeps the complete approximately 514.5 MiB release behind a separate opt-in | CC BY 4.0; recordings contain identifiable human voices and clinical voice-quality information, so attribution, privacy, and health-data handling still require care |
| [TORGO](http://www.cs.toronto.edu/~complingweb/data/TORGO/torgo.html) | Dysarthria assessment, pathological ASR, and acoustic-articulatory modeling | Public University of Toronto release for eight speakers with dysarthria and seven controls; four archives total approximately 8.9 GiB compressed and 18 GB uncompressed; helper downloads lightweight official docs by default and requires terms acknowledgment plus explicit speaker-group selection for archives | Custom academic, non-profit use only with mandatory citation; no standard open-data license or commercial grant stated; identifiable voices and disability/health information require careful handling |
| [CDSD](http://melab.psych.ac.cn/CDSD.html) | Mandarin dysarthric speech recognition, intelligibility, and severity evaluation | Owner page describes 133 hours from 44 speakers; access requires completing and signing the official agreement, submitting an application, and waiting for email approval; helper saves only public provenance and application documents | Custom signed agreement; no standard open-data license stated publicly, and identifiable clinical voices plus health/disability information require ethics, privacy, storage, and sharing review |
| [RAVDESS](https://zenodo.org/records/1188976) | Speech emotion recognition | [Zenodo record](https://zenodo.org/records/1188976); helper saves metadata by default and downloads audio-only speech/song ZIPs with opt-in | CC BY-NC-SA 4.0; commercial licenses are separate |
| [TESS](https://doi.org/10.5683/SP2/E8H2MF) | Speech emotion recognition and auditory emotion perception | Owner-hosted University of Toronto Dataverse release with 2,800 acted-emotion WAV stimuli; helper saves official metadata by default and makes the complete ZIP opt-in | CC BY-NC 4.0; preserve attribution and review identifiable-voice ethics for downstream use |
| [CREMA-D](https://github.com/CheyneyComputerScience/CREMA-D) | Speech emotion recognition | Official GitHub/GitLab repositories; helper downloads README/license/CSV metadata by default and keeps the full Git LFS media clone opt-in | Database is ODbL 1.0; individual contents are Database Contents License 1.0 |
| [MELD](https://affective-meld.github.io/) | Speech emotion recognition | Official project/GitHub/Hugging Face metadata by default; raw audio/video and feature/model tarballs are opt-in | GitHub and HF list GPL-3.0; clips derive from Friends TV media, so re-check media rights before redistribution or commercial use |
| [MUStARD](https://github.com/soujanyaporia/MUStARD) | Multimodal spoken-sarcasm detection and dialogue pragmatics | Public 690-item English audiovisual corpus with binary labels, dialogue context, and fixed fold indices; helper downloads lightweight docs, labels, and folds by default while the approximately 4.63 GB Hugging Face media/features snapshot is opt-in | Repository and HF card say MIT, but sitcom-derived television clips retain third-party rights that require separate review |
| [BAH](https://www.etsmtl.ca/en/labs/livia/datasets/bah-ambivalence-hesitancy) | Multimodal ambivalence/hesitancy recognition and temporal affect localization | Proprietary research release with 1,427 videos, 10.60 hours, 300 participants, 16 kHz audio, timestamped transcripts, aligned faces, expert video/frame annotations, metadata, and participant-disjoint splits; helper saves public documentation only | Research-only proprietary EULA; access requests must come from eligible full-time faculty and name all users; BSD-3-Clause covers public baseline code, not participant data |
| [MER2023](https://arxiv.org/abs/2304.08981) | Multi-label, modality-robust, and semi-supervised multimodal emotion recognition | Request-gated [MERChallenge/MER2023](https://huggingface.co/datasets/MERChallenge/MER2023) with 3,373 Train&Val clips, 823 MER-MULTI/MER-NOISE test clips, and 73,148 unlabeled MER-SEMI clips; helper saves only public paper/repository/API metadata and leaves the roughly 140 GB password-protected release manual | CC BY-NC 4.0 plus academic-only, no-redistribution, and no-modification gated terms; baseline code license is unspecified and movie/TV source-media rights remain separate |
| [MER2024](https://arxiv.org/abs/2404.17113) | Semi-supervised, noise-robust, and open-vocabulary multimodal emotion recognition | Request-gated [MERChallenge/MER2024](https://huggingface.co/datasets/MERChallenge/MER2024) with 5,030 labeled and 115,595 unlabeled clips; helper saves only public paper/project/repository/API metadata and leaves the roughly 218.4 GB release manual | CC BY-NC 4.0 plus academic-only, non-commercial, no-redistribution, no-modification, and no-upload terms; MER2024 code license is unspecified and source-video rights remain separate |
| [CH-SIMS](https://aclanthology.org/2020.acl-main.343/) | Multimodal and modality-specific sentiment analysis | Official MMSA shared Drive folders contain raw video, processed features, and labels; helper downloads primary-source metadata and keeps the toolkit clone opt-in | MMSA code is MIT; dataset media and annotation terms are not expressly specified |
| [CH-SIMS v2](https://thuiar.github.io/sims.github.io/chsims) | Multimodal, modality-specific, and semi-supervised sentiment analysis | Official release provides 4,402 supervised and 10,161 unlabeled Chinese video segments through Google Drive and Baidu; helper saves primary-source metadata and keeps the repository clone opt-in | Official project, paper, and repository state no data or code license; review source-media, speaker, privacy, and platform rights |
| [CMU-MOSI](https://arxiv.org/abs/1606.06259) | Multimodal sentiment intensity and subjectivity analysis | Official CMU Multimodal SDK provides labels and anonymized processed acoustic, visual, and language features; MultiBench provides a word-aligned processed package; helper saves docs/metadata and makes toolkit clones opt-in | SDK and MultiBench code are MIT, but data terms are not expressly specified; raw YouTube videos are not redistributed and source-media/privacy rights remain separate |
| [CMU-MOSEI](https://aclanthology.org/P18-1208/) | Multimodal sentiment and emotion-intensity analysis | Official CMU Multimodal SDK provides sentiment/six-emotion labels and processed acoustic, visual, and language sequences for more than 65 hours of video; MultiBench provides a word-aligned processed package; helper saves docs/definitions and keeps toolkit clones opt-in | SDK and MultiBench code are MIT, but data terms are not expressly specified; source YouTube media, creator, platform, and privacy rights remain separate |
| [SpEmoC](https://skvipparthi.com/spemoc.html) | Multimodal speaker-segment emotion recognition | Official project and paper document 30,000 refined clips from 306,544 raw segments across 3,100 English-language movies and TV series; full media access requires a signed requestor and faculty/PI agreement sent from an institutional address, and the helper only saves public documentation | Custom non-commercial academic agreement prohibits redistribution; source movie/TV copyrights remain with their owners; public repository code and split/metadata terms are unspecified |
| [EmoPrefer](https://github.com/zeroQiaoba/AffectGPT/tree/master/EmoPrefer) | Multimodal emotion-description preference evaluation | Public original/V2 pairwise annotation tables (574 unanimous pairs and 2,096 individual-annotator pairs) plus reverse-order and generator-name audit variants; source audio/video remains separately gated through MER2025, while the helper downloads only public annotations/docs | Official subdirectory is Apache-2.0 but says non-commercial research only; gated MER2025 adds CC BY-NC 4.0, academic-only, no-redistribution/no-modification terms; audit code is MIT |
| [OV-MERD](https://github.com/zeroQiaoba/AffectGPT/tree/master/OV-MER) | Open-vocabulary multimodal emotion recognition | Official gated [MER2025 release](https://huggingface.co/datasets/MERChallenge/MER2025) with acoustic/visual clues, descriptions, and free-form labels spanning 236 emotion categories; helper saves public docs/metadata only and leaves the approximately 442 GB repository manual | CC BY-NC 4.0 plus academic-only, non-commercial, no-redistribution, and no-modification gated terms; repository code is Apache-2.0 with a non-commercial research-preview notice, and source movie/TV rights remain separate |
| [IEMOCAP](https://sail.usc.edu/iemocap/) | Speech emotion recognition | Official [release page](https://sail.usc.edu/iemocap/iemocap_release.htm) after reading the [USC/SAIL data release form](https://sail.usc.edu/iemocap/Data_Release_Form_IEMOCAP.pdf) and submitting the request form | Custom USC/SAIL data release terms; access is manual/form-gated |
| [MSP-Podcast](https://lab-msp.com/MSP/MSP-Podcast.html) | Naturalistic speech emotion recognition | Free academic access after an authorized institutional representative signs the official data-transfer agreement; Test3 audio is released without labels for web-based evaluation | Custom institution-signed academic license; permissive source-podcast licenses do not replace the controlling corpus agreement |
| [MUSAN](https://www.openslr.org/17/) | Speech/music/noise classification | [OpenSLR SLR17](https://www.openslr.org/17/) corpus archive; helper downloads the OpenSLR page by default and requires opt-in for the 11 GiB archive | CC BY 4.0 |
| [AMI](https://groups.inf.ed.ac.uk/ami/corpus/) | Meeting ASR | Official [annotation ZIPs](https://groups.inf.ed.ac.uk/ami/download/), optional [OpenSLR SLR16](https://www.openslr.org/16/) acoustic archives, or [edinburghcstr/ami](https://huggingface.co/datasets/edinburghcstr/ami) | Official AMI pages list CC BY 4.0; OpenSLR mirror still shows an older modified CC BY-NC-SA v2.0 notice |
| [CHiME-6](https://www.chimechallenge.org/datasets/chime6) | Meeting ASR / diarization | [OpenSLR SLR150](https://www.openslr.org/150/) transcriptions/floorplans by default; large train/dev/eval audio archives are opt-in | CC BY-SA 4.0 |
| [CHiME-7 DASR](https://www.chimechallenge.org/challenges/chime7/task1/index) | Multi-device distant speaker-attributed meeting ASR | Official protocol over revised CHiME-6, DiPCo, and task-specific Mixer 6 partitions; helper saves public documentation, while CHiME and LDC/Mixer 6 access remains manual | Mixed corpus-specific terms and agreements; ESPnet baseline code is Apache-2.0 |
| [NOTSOFAR-1](https://www.chimechallenge.org/challenges/chime8/task2/index) | Distant speaker-attributed meeting ASR and diarization | Public Microsoft open release documents 237 English meetings, including ground-truth 80-meeting eval-small and 129-meeting eval-full sets; the challenge/paper's roughly 280-meeting inventory differs because the current release removes restricted Dev-set-2 and adds eval-full; helper saves official docs and licenses only | Data is CC BY 4.0 and baseline code is MIT; challenge-only Dev-set-2 is not in the current open release and has separate publication restrictions |
| [AliMeeting](https://www.openslr.org/119/) | Meeting ASR / diarization | [OpenSLR SLR119](https://www.openslr.org/119/) metadata by default; large Mandarin meeting archives are opt-in | CC BY-SA 4.0 |
| [AISHELL-4](https://www.openslr.org/111/) | Mandarin multi-channel meeting ASR, enhancement, separation, and diarization | Public 120-hour OpenSLR release with 211 meetings, eight-channel circular-array audio, transcripts, and speaker activity; helper saves docs by default and makes the approximately 51.2 GB corpus archives opt-in; VibeVoice-ASR-BitNet evaluates its test set | Corpus is CC BY-SA 4.0; official baseline code is Apache-2.0; the paper's CC BY 4.0 terms are separate |
| [SmartGlasses Challenge 2026](https://aslp-lab.github.io/SmartGlasses/) | Egocentric time-stamped speaker-attributed ASR and spoken-language understanding | Official SLT 2026 dyadic-dialogue and multi-party-meeting benchmark with 107 hours of four-channel smart-glasses recordings; helper saves public challenge/toolkit/paper metadata only because corpus links were emailed to registered teams and registration is closed | Dataset terms and a standalone code license are not publicly specified; the public evaluation repository has no LICENSE file, and public toolkit access does not authorize corpus redistribution |
| [LibriWASN](https://zenodo.org/records/10952434) | Asynchronous distributed-microphone meeting separation, diarization, and recognition | Public 20-hour release recorded in two rooms with nine devices, 29 channels, 0%-40% speech overlap, and diarization ground truth; helper downloads official metadata/docs by default while the approximately 55.8 GB audio archives are opt-in | Data is CC BY 4.0 and official tools are MIT; preserve LibriSpeech/LibriCSS provenance and review upstream speech-data terms for derived redistribution |
| [LibriCSS](https://github.com/chenzhuo1011/libri_css) | Continuous speech separation and overlapped meeting recognition | Public ten-hour far-field release with seven-channel recordings, six overlap/gap conditions, and official utterance-wise and continuous-input WER protocols; helper saves docs by default and makes the approximately 5.97 GiB Drive archive opt-in | Software/docs are MIT and the source LibriSpeech corpus is CC BY 4.0, but the replayed recordings have no separately stated license; confirm recording-level rights |
| [LibriMix](https://github.com/JorisCos/LibriMix) | Speech separation | Official generator/metadata repo; helper clones it by default and runs generation only with `LIBRIMIX_RUN_GENERATION=1` plus a large storage directory | Code/scripts are MIT; generated data is derived from LibriSpeech CC BY 4.0 plus WHAM noise, so re-check component terms |
| [REAL-TSE Challenge](https://real-tse.github.io/challenge/) | Real-conversation target-speaker extraction | Official SLT 2026 protocol, MIT evaluation toolkit, and 6,991 Mandarin/English mixture-enrollment trials across DEV, EVAL-1, and EVAL-2; helper saves public docs only because password-protected data was distributed by email to registered teams and registration is closed | Dataset license is not publicly specified; challenge terms limit DEV/EVAL to validation or final evaluation and forbid training/fine-tuning; MIT covers the toolkit only, while source-corpus terms also apply |
| [FUSS](https://zenodo.org/records/3694384) | Universal sound separation | Public train/validation/eval mixtures and source references on Zenodo; helper saves official docs, repository metadata, and the small license archive by default while multi-GB data archives require explicit part selection | FUSS is CC BY 4.0, input Freesound clips are CC0, and Google Research code is Apache-2.0; FSD50K labels used for source selection are not included |
| [WSJ0-2mix / wsj0-mix](https://www.merl.com/research/highlights/deep-clustering) | Speech separation | Official MERL page and generation scripts by default; optional Python generator clone; mixture generation requires separately licensed local WSJ0 audio from LDC | Generated mixtures derive from LDC CSR-I WSJ0 and follow the active LDC agreement; pywsj0-mix code is MIT; MERL script license was not specified on the reachable page |
| [WHAM! / WHAMR!](http://wham.whisper.ai/) | Noisy and reverberant speech separation | Official page and generation scripts by default; 17 GiB WHAM! noise and 68.1 GiB WHAM!48kHz archives are opt-in | WHAM noise datasets are CC BY-NC 4.0; generated mixtures also require separately licensed WSJ0/wsj0-2mix access |
| [VoiceBank-DEMAND](https://datashare.ed.ac.uk/handle/10283/2791) | Speech enhancement | Edinburgh DataShare record for paired clean/noisy train and test ZIPs; helper saves metadata/license by default and makes text/audio archives opt-in | CC BY 4.0 on the DataShare record; derived from VCTK speech and DEMAND plus other noise sources, so component/source terms should be re-checked |
| [Diamond Benchmark](https://huggingface.co/datasets/nineninesix/diamond-benchmark) | Real-world degraded-speech restoration and content preservation | Public 750-clip English release with reference transcripts for paired DNSMOS-P.835 and ASR CER evaluation; helper downloads the card, API metadata, and manifest by default while the approximately 340 MB audio snapshot is opt-in | HF metadata says `other`, but no license text, source-corpus citation, consent statement, or redistribution terms are supplied; treat as evaluation-only pending clarification |
| [DNS Challenge](https://github.com/microsoft/DNS-Challenge) | Speech enhancement | Official DNS Challenge repo and Microsoft Research challenge page; helper saves README/license/downloader scripts by default and makes multi-GB DNS5 test archives opt-in | Repository content/docs are CC BY 4.0 and code is MIT; training data combines multiple upstream sources, so component terms still need checking |
| [RealMAN](https://github.com/Audio-WestlakeU/RealMAN) | Multichannel speech enhancement and source localization | Public, ungated 32-channel real-recorded corpus with 83.7 speech hours and 144.5 noise hours across diverse scenes; helper downloads official docs/API metadata by default and makes the approximately 812 GB Hugging Face snapshot opt-in | Dataset README declares CC BY 4.0, but the repository has no standalone license file; baseline-code terms are unspecified and should be checked separately |
| [ForestIR](https://github.com/TIPColin/ForestIR) | Forest impulse-response simulation and bioacoustic microphone-array localization | Public simulator with measured/synthetic geometry presets, example bird calls, environmental noise, and reproducible rendering manifests; helper saves official docs and metadata by default and makes the approximately 31 MB repository clone opt-in; processed field recordings required for the paper's full validation remain request-only | Repository code is MIT, but the paper and repository do not state separate licenses or provenance terms for bundled bird/noise recordings; clarify media rights before redistribution or commercial use |
| [MS-SNSD](https://github.com/microsoft/MS-SNSD) | Speech enhancement | Official Microsoft GitHub repo and [Interspeech 2019 paper](https://www.isca-archive.org/interspeech_2019/reddy19_interspeech.html); helper saves README/license/generator files by default and makes the large repo clone opt-in | Code is MIT; data is mixed upstream terms listed in the README, including PTDB-TUG ODbL, VoiceBank/DataShare terms, Freesound CC0 clips, and DEMAND CC BY-SA 3.0 |
| [NISQA](https://github.com/gabrielmittag/NISQA) | Speech quality assessment | Official NISQA repo/wiki and [Zenodo corpus mirror](https://zenodo.org/records/4728081); helper saves docs/licenses/record metadata by default and makes the 15.9 GiB corpus opt-in | Corpus uses mixed original source speech/noise terms; Zenodo reports `other-at`; code is MIT and model weights are CC BY-NC-SA 4.0 |
| [SOMOS](https://zenodo.org/records/7378801) | Synthetic-speech naturalness and mean-opinion-score prediction | Public, ungated Samsung release with 20,000 synthetic utterances, 100 natural utterances, 374,955 crowdsourced ratings, and 70/15/15 system/listener/text-disjoint splits; helper saves official docs and Zenodo metadata by default while the approximately 3.70 GiB archive is opt-in; a July 2026 cross-corpus MOS study evaluates all 20,100 samples | CC BY-NC-SA 4.0 for non-commercial research with citation and same-terms redistribution; preserve LJ Speech, Blizzard Challenge, Wikipedia, and source-text provenance when making derivative releases |
| [QualiSpeech](https://huggingface.co/datasets/tsinghua-ee/QualiSpeech) | Multidimensional speech-quality assessment and natural-language quality reasoning | Public, ungated train/validation/test annotations and approximately 1.46 GiB of non-BVCC audio; helper downloads docs, scripts, CSVs, and BVCC filename lists by default while audio is opt-in; SALMONN-2 evaluates it with Pearson correlation | QualiSpeech declares CC BY-NC-SA 4.0, but BVCC, NISQA, GigaSpeech, and Blizzard-derived components retain upstream restrictions; Blizzard audio is excluded and may not be redistributed |
| [BVCC](https://zenodo.org/records/6572573) | MOS prediction and synthetic-speech naturalness assessment | Public VoiceMOS Challenge 2022 release with unified MOS ratings and official splits; helper saves official pages and Zenodo metadata by default and makes the approximately 273.4 MiB main archive and small OOD/scoring packages opt-in; Blizzard audio must be obtained separately | Zenodo says Other (Open), but explicitly prohibits redistribution of Blizzard samples and omits them; Voice Conversion Challenge and ESPnet-TTS components retain their own terms |
| [VoiceMOS Challenge 2026](https://sites.google.com/view/voicemos-challenge/voicemos-challenge-2026) | MOS and human-rating prediction for speech quality, emotion, speaker similarity, and accent similarity | Official three-track challenge covering URGENT multilingual speech enhancement, emotional TTS/human speech, and 4,000 CodecMOS-Accent samples; helper saves public docs and prints the registration path because organizers distribute CodaBench access by email | Dataset reuse and redistribution terms are not publicly specified; Apache-2.0 covers baseline code only, not challenge audio or ratings |
| [Clotho](https://zenodo.org/records/4783391) | Audio captioning | [Zenodo v2.1 record](https://zenodo.org/records/4783391); captions/metadata are small, audio archives are about 7.1 GiB | Mixed terms: audio clips keep per-file Freesound licenses; captions use the Tampere University license, mainly non-commercial with attribution |
| [ClothoAQA](https://zenodo.org/records/6473207) | Audio question answering | [Zenodo record](https://zenodo.org/records/6473207) with train/validation/test QA CSVs, metadata, license, and optional 3.1 GiB audio archive; helper downloads CSV metadata by default | QA CSVs are MIT; audio files keep per-file Freesound licenses, mostly Creative Commons with attribution, recorded in the metadata CSV |
| [AudioCaps](https://audiocaps.github.io/) | Audio captioning | Official [CSV metadata](https://github.com/cdjkim/audiocaps/tree/master/dataset) and [AudioCaps 2.0 CSV metadata](https://github.com/cdjkim/audiocaps/tree/master/dataset2.0); raw audio/video requires the upstream form | README says code and dataset are free for academic purposes only; repo license is MIT, but raw clips inherit AudioSet/YouTube availability and terms |
| [User-Intent Queries (UIQ)](https://github.com/JudeJiwoo/Omni-Embed-Audio/tree/main/data/UIQ) | User-intent, query-reformulation, exclusion-aware audio retrieval, and hard-negative discrimination | Public, ungated release with 13,053 question, imperative, tagging, paraphrase, and negative text queries over AudioCaps, Clotho, and MECAT; helper downloads the approximately 12 MiB of query files and docs but no source audio; Fusion Embedding §6.3 reuses the positive Clotho UIQs | Query text is CC BY 4.0 and repository code is MIT; source audio is not redistributed and retains AudioCaps, Clotho, and MECAT terms |
| [AudioCards / ASFx Eval](https://sites.google.com/view/audiocards/) | Structured audio captioning, metadata generation, retrieval, and UCS classification | Public [Zenodo CSV](https://zenodo.org/records/17237181) with 499 released rows and 13 structured annotation fields; pair filenames with separately downloaded Adobe Audition Sound Effects; helper downloads lightweight metadata and annotations only | CSV is CC BY 4.0; Adobe describes source audio as royalty-free but subjects use to its Audition/software EULA; the five acoustic target fields used in arXiv:2607.21424 are announced but not yet released |
| [Live Gurbani Captioning Benchmark v1](https://karanbirsingh.github.io/live-gurbani-captioning-benchmark-v1/) | Closed-vocabulary live Sikh Kirtan tracking and captioning | Public official repository with ground-truth timelines for 12 evaluation cases from four recordings, a scorer, visualization tools, and baselines; helper downloads docs by default and makes the small repository clone opt-in; source audio remains external YouTube media | Ground-truth annotations and baselines are CC BY 4.0 and code/docs are MIT; those licenses do not grant rights to the referenced YouTube recordings |
| [MusicCaps](https://huggingface.co/datasets/google/MusicCaps) | Music captioning | Official Google/Kaggle release mirrored at [google/MusicCaps](https://huggingface.co/datasets/google/MusicCaps); helper downloads the public CSV metadata by default | Annotation CSV is CC BY-SA 4.0; raw clips are AudioSet/YouTube-derived and remain subject to upstream media availability and terms |
| [WavCaps](https://github.com/XinhaoMei/WavCaps) | Audio captioning | [cvssp/WavCaps](https://huggingface.co/datasets/cvssp/WavCaps) JSON metadata and waveform ZIPs; helper downloads README/JSON metadata by default and makes large ZIP archives source-selective opt-ins | Academic use only for dataset audio; HF metadata advertises CC BY 4.0 but the card also requires checking FreeSound, BBC Sound Effects, SoundBible, and AudioSet source terms |
| [AudioSetCaps](https://jishengbai.github.io/AudioSetCaps-webpage/) | Large-scale synthetic audio captioning and audio-text retrieval | Public [baijs/AudioSetCaps](https://huggingface.co/datasets/baijs/AudioSetCaps) caption/Q&A metadata for more than 6.1 million source clips; helper downloads docs by default and makes the approximately 20.2 GB CSV release opt-in | Official HF metadata says CC BY 4.0, but its card also restricts use to academic research; apply the stricter terms and review AudioSet, YouTube-8M, and VGGSound source-media rights |
| [MACS](https://zenodo.org/records/5114771) | Audio captioning | [Zenodo MACS annotations](https://zenodo.org/records/5114771) plus upstream [TAU Urban Acoustic Scenes 2019](https://zenodo.org/records/2589280) audio; helper downloads annotations/docs by default and makes audio opt-in | Zenodo and LICENSE.txt use non-commercial terms for MACS; upstream TAU audio also lists Other (Non-Commercial) |

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

## License Notes

The license of this repository covers only this index. Each benchmark keeps its
own license and access conditions. Before training, redistribution, commercial
use, or benchmark publication, re-check the upstream license page and cite the
benchmark authors.
