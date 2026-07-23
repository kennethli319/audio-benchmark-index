#!/usr/bin/env ruby
# frozen_string_literal: true

require "cgi"
require "date"
require "digest"
require "fileutils"
require "json"
require "set"
require "uri"
require "yaml"

ROOT = File.expand_path("..", __dir__)
DATA_PATH = File.join(ROOT, "data", "audio_benchmarks.yaml")
DOWNLOAD_README_PATH = File.join(ROOT, "scripts", "download", "README.md")
TEMPLATE_PATH = File.join(ROOT, "site", "index.template.html")
OUTPUT_PATH = File.join(ROOT, "docs", "index.html")
MANIFEST_PATH = File.join(ROOT, "docs", "site-manifest.json")
OG_IMAGE_PATH = File.join(ROOT, "docs", "og.png")
CANONICAL_URL = "https://kennethli319.github.io/audio-benchmark-index/"
REPOSITORY_URL = "https://github.com/kennethli319/audio-benchmark-index"

FAMILIES = [
  {
    slug: "speech-recognition",
    label: "Speech recognition",
    description: "ASR, meeting transcription, and accented speech",
    pattern: /automatic_speech_recognition|meeting_transcription/,
  },
  {
    slug: "speech-generation",
    label: "Speech generation",
    description: "TTS, singing voice, and controllable synthesis",
    pattern: /speech_synthesis/,
  },
  {
    slug: "speech-understanding",
    label: "Speech understanding & dialogue",
    description: "Translation, instructions, dialogue, and spoken intent",
    pattern: /speech_to_text_translation|end_to_end_speech_dialogue|spoken_language_understanding|speech_instruction_benchmark|keyword_spotting|spoken_language_identification|spoken_digit_classification/,
  },
  {
    slug: "audiovisual",
    label: "Audiovisual & cross-modal",
    description: "Audio-video reasoning, retrieval, speech, and localization",
    pattern: /audio_visual|audiovisual|cross_modal.*retrieval/,
  },
  {
    slug: "speaker-human",
    label: "Speaker, identity & emotion",
    description: "Speaker recognition, diarization, anti-spoofing, and emotion",
    pattern: /speaker_|speech_emotion_recognition/,
  },
  {
    slug: "restoration-quality",
    label: "Enhancement, separation & quality",
    description: "Denoising, source separation, and perceptual quality",
    pattern: /speech_separation|audio_source_separation|universal_sound_separation|speech_enhancement|speech_quality_assessment|music_source_separation/,
  },
  {
    slug: "representation",
    label: "Representation & general suites",
    description: "Cross-task representation and general-purpose evaluation",
    pattern: /representation/,
  },
  {
    slug: "audio-understanding",
    label: "Audio understanding & events",
    description: "Audio reasoning, captioning, scenes, events, and urban sound",
    pattern: /audio_understanding|audio_visual_understanding|audio_visual_question_answering|audio_language_model_benchmark|audio_captioning|audio_event_classification|acoustic_scene_classification|environmental_sound_classification|sound_event_detection|urban_sound_tagging|speech_music_noise_classification|spatial_audio|sound_source_localization|acoustic_source_tracking|source_distance_estimation/,
  },
  {
    slug: "music",
    label: "Music",
    description: "Music tagging, MIR, transcription, synthesis, and genre",
    pattern: /music_/,
  },
].freeze

OFFICIAL_LABELS = {
  "homepage" => "Homepage",
  "project" => "Project page",
  "official" => "Official page",
  "dataset" => "Dataset",
  "openslr" => "OpenSLR",
  "zenodo" => "Zenodo",
  "ldc" => "LDC catalog",
  "challenge" => "Challenge",
  "leaderboard" => "Leaderboard",
  "repo" => "Repository",
  "repository" => "Repository",
  "toolkit" => "Toolkit",
  "paper" => "Paper",
  "arxiv" => "arXiv",
  "doi" => "DOI",
  "interspeech" => "Interspeech paper",
}.freeze

def escape(value)
  CGI.escapeHTML(value.to_s)
end

def humanize(value)
  value.to_s.tr("_", " ").split.map(&:capitalize).join(" ")
end

def normalize_search(value)
  value.to_s.downcase.gsub(/[^a-z0-9]+/, " ").strip
end

def family_matches(benchmark)
  terms = (Array(benchmark["qwen_bucket"]) + Array(benchmark["tasks"])).join(" ")
  matches = FAMILIES.select { |family| terms.match?(family[:pattern]) }
  matches.empty? ? [FAMILIES.find { |family| family[:slug] == "representation" }] : matches
end

def terms_group(benchmark)
  license = benchmark.fetch("license", {})
  data_terms = license["data"].to_s.strip.downcase
  return ["unspecified", "Not specified"] if data_terms.empty? || data_terms.match?(/not[_ ]specified|unknown|not stated/)
  return ["mixed", "Mixed / custom — review"] if data_terms.match?(/mixed|with[_ ](?:mixed[_ ])?upstream[_ ]terms/)
  return ["noncommercial", "Non-commercial / research terms"] if data_terms.match?(/non[- ]commercial|\bnc\b|by-nc|academic|research only/)
  return ["open", "Open / attribution signals"] if data_terms.match?(/\bcc0\b|public domain|\bmit\b|apache|cc[- ]?by(?:\s|$)|cc by(?:\s|$)/)

  ["mixed", "Mixed / custom — review"]
end

def primary_download_url(benchmark)
  Array(benchmark.dig("download", "primary")).find { |url| url.to_s.start_with?("http") }
end

def host_group(benchmark)
  urls = Array(benchmark.dig("download", "primary")).map(&:to_s)
  return ["hugging-face", "Hugging Face"] if urls.any? { |url| url.include?("huggingface.co") }
  return ["openslr", "OpenSLR"] if urls.any? { |url| url.include?("openslr") }
  return ["zenodo", "Zenodo"] if urls.any? { |url| url.include?("zenodo.org") }
  return ["ldc", "LDC / licensed"] if urls.any? { |url| url.include?("ldc.upenn.edu") }

  ["official", "Official / other"]
end

def official_links(benchmark)
  benchmark.fetch("official", {}).each_with_object([]) do |(key, url), links|
    next unless url.to_s.start_with?("http")

    links << [OFFICIAL_LABELS.fetch(key, humanize(key)), url]
  end
end

def action_links(benchmark)
  candidates = []
  download_url = primary_download_url(benchmark)
  candidates << ["Get data", download_url, "primary"] if download_url

  official = benchmark.fetch("official", {})
  overview_key = %w[homepage project official dataset openslr zenodo ldc challenge leaderboard repo repository].find do |key|
    official[key].to_s.start_with?("http")
  end
  candidates << ["Official source", official[overview_key], "secondary"] if overview_key

  paper_key = %w[paper arxiv doi interspeech].find { |key| official[key].to_s.start_with?("http") }
  candidates << ["Read the paper", official[paper_key], "secondary"] if paper_key

  code_key = %w[repo repository toolkit].find { |key| official[key].to_s.start_with?("http") }
  candidates << ["View code", official[code_key], "secondary"] if code_key

  seen = Set.new
  candidates.each_with_object([]) do |(label, url, style), links|
    next if url.to_s.empty? || seen.include?(url)

    seen << url
    links << [label, url, style]
  end.first(4)
end

def source_host(url)
  host = URI.parse(url).host
  host ? host.sub(/^www\./, "") : url
rescue URI::InvalidURIError
  url
end

def render_card(benchmark, manual_ids)
  id = benchmark.fetch("id")
  name = benchmark.fetch("name")
  full_name = benchmark["full_name"].to_s.strip
  tasks = Array(benchmark["tasks"])
  families = family_matches(benchmark)
  family_slugs = families.map { |family| family[:slug] }
  primary_family = families.first
  manual = manual_ids.include?(id)
  access_slug = manual ? "manual" : "helper"
  access_label = manual ? "Manual or gated" : "Safe-first helper"
  host_slug, host_label = host_group(benchmark)
  terms_slug, terms_label = terms_group(benchmark)
  license = benchmark.fetch("license", {})
  data_terms = license["data"].to_s.strip
  code_terms = license["code"].to_s.strip
  license_notes = license["notes"].to_s.strip
  download_notes = benchmark.dig("download", "notes").to_s.strip
  helper = "scripts/download/#{id}.sh"
  actions = action_links(benchmark)
  official = official_links(benchmark)
  sources = Array(benchmark["sources"]).map(&:to_s).select { |url| url.start_with?("http") }.uniq
  task_tags = tasks.first(4).map { |task| %(<span class="tag">#{escape(humanize(task))}</span>) }
  if tasks.length > 4
    task_tags << %(<span class="tag tag-more">+#{tasks.length - 4} more</span>)
  end

  searchable = normalize_search([
    id,
    name,
    full_name,
    Array(benchmark["qwen_bucket"]),
    tasks,
    data_terms,
    code_terms,
    license_notes,
    download_notes,
    official.flatten,
    sources,
  ].flatten.compact.join(" "))

  action_html = actions.map do |label, url, style|
    %(<a class="card-action #{style}" href="#{escape(url)}">#{escape(label)}</a>)
  end.join("\n          ")

  official_html = official.map do |label, url|
    %(<li><a href="#{escape(url)}">#{escape(label)}</a></li>)
  end.join("\n                    ")

  source_html = sources.each_with_index.map do |url, index|
    %(<li><a href="#{escape(url)}">Source #{index + 1} · #{escape(source_host(url))}</a></li>)
  end.join("\n                    ")

  full_name_html = if full_name.empty? || full_name == name
                     ""
                   else
                     %(<p class="benchmark-full-name">#{escape(full_name)}</p>)
                   end

  access_copy = if manual
                  "Start with the helper: it prints the required form, password, license, or access-acknowledgement steps."
                else
                  "The helper starts with public documentation or metadata and keeps large or restricted downloads opt-in."
                end

  <<~HTML
    <article class="benchmark-card" id="benchmark-#{escape(id)}"
      data-name="#{escape(name.downcase)}"
      data-families="#{escape(family_slugs.join(" "))}"
      data-access="#{access_slug}"
      data-host="#{host_slug}"
      data-terms="#{terms_slug}"
      data-search="#{escape(searchable)}">
      <div class="card-heading">
        <div>
          <span class="eyebrow">#{escape(primary_family[:label])}</span>
          <h3>#{escape(name)}</h3>
          #{full_name_html}
        </div>
        <span class="access-badge #{manual ? "manual" : "helper"}">#{escape(access_label)}</span>
      </div>
      <div class="tag-list" aria-label="Tasks">
        #{task_tags.join("\n        ")}
      </div>
      <div class="card-facts">
        <div><span>Access path</span><strong>#{escape(host_label)}</strong></div>
        <div><span>Upstream terms</span><strong>#{escape(terms_label)}</strong></div>
      </div>
      <p class="access-copy">#{escape(access_copy)}</p>
      <nav class="card-actions" aria-label="#{escape(name)} links">
        #{action_html}
      </nav>
      <details class="benchmark-details">
        <summary>Access, terms &amp; download helper</summary>
        <div class="details-body">
          <dl class="terms-list">
            <div><dt>Data license / terms</dt><dd>#{escape(data_terms.empty? ? "Not specified in the source record." : data_terms)}</dd></div>
            <div><dt>Code license</dt><dd>#{escape(code_terms.empty? ? "Not specified in the source record." : code_terms)}</dd></div>
            #{license_notes.empty? ? "" : %(<div><dt>License caution</dt><dd>#{escape(license_notes)}</dd></div>)}
            #{download_notes.empty? ? "" : %(<div><dt>Download notes</dt><dd>#{escape(download_notes)}</dd></div>)}
          </dl>
          <div class="command-block">
            <div><span>Safe-first helper</span><code>#{escape(helper)}</code></div>
            <div class="helper-actions">
              <a href="#{REPOSITORY_URL}/blob/main/#{escape(helper)}">View helper</a>
              <button type="button" data-copy="#{escape(helper)}" aria-label="Copy #{escape(name)} helper path">Copy path</button>
            </div>
          </div>
          #{official_html.empty? ? "" : %(<div class="detail-links"><h4>Official links</h4><ul>#{official_html}</ul></div>)}
          #{source_html.empty? ? "" : %(<div class="detail-links"><h4>Reviewed sources</h4><ul>#{source_html}</ul></div>)}
        </div>
      </details>
    </article>
  HTML
end

def manual_ids
  text = File.read(DOWNLOAD_README_PATH, encoding: "UTF-8")
  section = text.split("## Manual Or Gated", 2).fetch(1).split(/^## /, 2).first
  section.scan(%r{scripts/download/([a-z0-9_]+)\.sh}).flatten.to_set
end

def load_catalog
  YAML.safe_load(
    File.read(DATA_PATH, encoding: "UTF-8"),
    permitted_classes: [Date],
    aliases: false,
  )
end

def validate_catalog!(catalog, manual)
  benchmarks = catalog.fetch("benchmarks")
  ids = benchmarks.map { |benchmark| benchmark.fetch("id") }
  raise "Duplicate benchmark ids found" unless ids.length == ids.uniq.length
  raise "Manual/gated ids missing from YAML: #{(manual - ids.to_set).to_a.join(", ")}" unless manual.subset?(ids.to_set)

  missing_helpers = ids.reject { |id| File.file?(File.join(ROOT, "scripts", "download", "#{id}.sh")) }
  raise "Missing download helpers: #{missing_helpers.join(", ")}" unless missing_helpers.empty?
end

def render_site(catalog, manual)
  metadata = catalog.fetch("metadata")
  benchmarks = catalog.fetch("benchmarks").sort_by { |benchmark| benchmark.fetch("name").downcase }
  family_counts = FAMILIES.to_h do |family|
    count = benchmarks.count { |benchmark| family_matches(benchmark).any? { |match| match[:slug] == family[:slug] } }
    [family[:slug], count]
  end

  family_tiles = FAMILIES.map do |family|
    <<~HTML.chomp
      <button class="family-tile" type="button" data-family-choice="#{family[:slug]}">
        <span>#{escape(family[:label])}</span>
        <strong>#{family_counts.fetch(family[:slug])}</strong>
        <small>#{escape(family[:description])}</small>
      </button>
    HTML
  end.join("\n")

  family_options = FAMILIES.map do |family|
    %(<option value="#{family[:slug]}">#{escape(family[:label])}</option>)
  end.join("\n              ")

  cards = benchmarks.map { |benchmark| render_card(benchmark, manual) }.join("\n")
  last_checked = metadata.fetch("last_checked")
  last_checked_date = last_checked.is_a?(Date) ? last_checked : Date.parse(last_checked.to_s)

  replacements = {
    "{{BENCHMARK_COUNT}}" => benchmarks.length.to_s,
    "{{HELPER_COUNT}}" => benchmarks.length.to_s,
    "{{MANUAL_COUNT}}" => manual.length.to_s,
    "{{LAST_CHECKED}}" => last_checked_date.strftime("%B %-d, %Y"),
    "{{LAST_CHECKED_ISO}}" => last_checked_date.iso8601,
    "{{FAMILY_TILES}}" => family_tiles,
    "{{FAMILY_OPTIONS}}" => family_options,
    "{{BENCHMARK_CARDS}}" => cards,
  }

  html = File.read(TEMPLATE_PATH, encoding: "UTF-8")
  replacements.each { |placeholder, value| html = html.gsub(placeholder, value) }
  html = html.each_line.map { |line| line.rstrip }.join("\n") + "\n"
  unresolved = html.scan(/\{\{[A-Z0-9_]+\}\}/).uniq
  raise "Unresolved template placeholders: #{unresolved.join(", ")}" unless unresolved.empty?

  [html, benchmarks.length, last_checked_date]
end

def manifest_for(html, benchmark_count, manual_count, last_checked)
  raise "Missing social preview image: #{OG_IMAGE_PATH}" unless File.file?(OG_IMAGE_PATH)

  JSON.pretty_generate(
    {
      "description" => "Generated public Audio Benchmark Index site artifact.",
      "canonical_url" => CANONICAL_URL,
      "repository_url" => REPOSITORY_URL,
      "generated_from" => "data/audio_benchmarks.yaml",
      "source_sha256" => Digest::SHA256.file(DATA_PATH).hexdigest,
      "template_sha256" => Digest::SHA256.file(TEMPLATE_PATH).hexdigest,
      "output_sha256" => Digest::SHA256.hexdigest(html),
      "social_image" => "docs/og.png",
      "social_image_sha256" => Digest::SHA256.file(OG_IMAGE_PATH).hexdigest,
      "benchmark_count" => benchmark_count,
      "download_helper_count" => benchmark_count,
      "manual_or_gated_count" => manual_count,
      "last_checked" => last_checked.iso8601,
    },
  ) + "\n"
end

catalog = load_catalog
manual = manual_ids
validate_catalog!(catalog, manual)
html, benchmark_count, last_checked = render_site(catalog, manual)
manifest = manifest_for(html, benchmark_count, manual.length, last_checked)
check_only = ARGV.include?("--check")

if check_only
  stale = []
  stale << OUTPUT_PATH unless File.file?(OUTPUT_PATH) && File.read(OUTPUT_PATH, encoding: "UTF-8") == html
  stale << MANIFEST_PATH unless File.file?(MANIFEST_PATH) && File.read(MANIFEST_PATH, encoding: "UTF-8") == manifest
  unless stale.empty?
    warn "Generated site artifacts are stale: #{stale.join(", ")}"
    exit 1
  end
  puts "Audio Benchmark Index site is fresh (#{benchmark_count} benchmarks, #{manual.length} manual/gated)."
  exit 0
end

FileUtils.mkdir_p(File.dirname(OUTPUT_PATH))
File.write(OUTPUT_PATH, html, mode: "w", encoding: "UTF-8")
File.write(MANIFEST_PATH, manifest, mode: "w", encoding: "UTF-8")
puts "Generated #{OUTPUT_PATH} with #{benchmark_count} benchmarks."
puts "Generated #{MANIFEST_PATH}."
