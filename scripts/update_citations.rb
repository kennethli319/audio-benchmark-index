#!/usr/bin/env ruby
# frozen_string_literal: true

require "cgi"
require "date"
require "json"
require "net/http"
require "uri"
require "yaml"

ROOT = File.expand_path("..", __dir__)
CATALOG_PATH = File.join(ROOT, "data", "audio_benchmarks.yaml")
OUTPUT_PATH = File.join(ROOT, "data", "citation_counts.json")
CACHE_PATH = File.join(ROOT, "data", ".citation_counts.scholar-cache.json")
SCHOLAR_SEARCH = "https://scholar.google.com/scholar"
PAPER_KEYS = %w[paper arxiv doi interspeech].freeze
USER_AGENT = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) " \
             "AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36"
MINIMUM_TITLE_SCORE = 0.85
REQUEST_DELAY = Float(ENV.fetch("SCHOLAR_DELAY", "2.0"))

# A direct Scholar article URL is preferable when one has been manually verified.
SCHOLAR_URL_OVERRIDES = {
  "aishell_1" => "https://scholar.google.com/citations?view_op=view_citation&hl=en&user=Vo5xz20AAAAJ&citation_for_view=Vo5xz20AAAAJ:5nxA0vEk-isC",
}.freeze

def primary_paper_url(benchmark)
  PAPER_KEYS.map { |key| benchmark.dig("official", key) }
            .compact
            .find { |url| url.to_s.start_with?("http") }
end

def text_from_html(html)
  CGI.unescapeHTML(html.gsub(/<[^>]+>/, " ")).gsub(/\s+/, " ").strip
end

def normalized_title(title)
  title.to_s.downcase.gsub(/[^a-z0-9]+/, " ").strip
end

def title_score(expected, candidate)
  expected_tokens = normalized_title(expected).split.uniq
  candidate_tokens = normalized_title(candidate).split.uniq
  return 0.0 if expected_tokens.empty? || candidate_tokens.empty?

  intersection = (expected_tokens & candidate_tokens).length.to_f
  intersection / [expected_tokens.length, candidate_tokens.length].max
end

def scholar_url_for(id, title, paper_url)
  SCHOLAR_URL_OVERRIDES.fetch(id) do
    identifier = paper_url.to_s[%r{arxiv\.org/(?:abs|html|pdf)/(\d{4}\.\d{4,5})}i, 1]
    query = [%("#{title}"), identifier].compact.join(" ")
    uri = URI(SCHOLAR_SEARCH)
    uri.query = URI.encode_www_form("hl" => "en", "q" => query)
    uri.to_s
  end
end

def fetch_html(url, redirects: 3)
  uri = URI(url)
  request = Net::HTTP::Get.new(uri)
  request["User-Agent"] = USER_AGENT
  request["Accept-Language"] = "en-US,en;q=0.9"
  response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == "https", read_timeout: 30) do |http|
    http.request(request)
  end

  if response.is_a?(Net::HTTPRedirection) && redirects.positive?
    return fetch_html(URI.join(url, response.fetch("location")).to_s, redirects: redirects - 1)
  end
  unless response.is_a?(Net::HTTPSuccess)
    raise "Google Scholar request failed: HTTP #{response.code}"
  end
  if response.body.include?("/sorry/") || response.body.match?(/unusual traffic|not a robot/i)
    raise "Google Scholar requested a CAPTCHA; wait before resuming the refresh"
  end

  response.body.force_encoding(Encoding::UTF_8).scrub
end

def citation_from_profile(html, expected_title)
  title = CGI.unescapeHTML(html[/<meta property="og:title" content="([^"]+)"/, 1].to_s)
  description = CGI.unescapeHTML(html[/<meta name="description" content="([^"]+)"/, 1].to_s)
  return unless title_score(expected_title, title) >= MINIMUM_TITLE_SCORE

  count = description[/Cited by ([\d,]+)/, 1]
  { "citation_count" => count ? count.delete(",").to_i : 0, "paper_title" => title }
end

def citation_from_search(html, expected_title)
  matches = html.scan(/<h3 class="gs_rt"[^>]*>(.*?)<\/h3>(.*?)(?=<h3 class="gs_rt"|\z)/m).map do |title_html, tail|
    title = text_from_html(title_html).sub(/^\[[^\]]+\]\s*/, "")
    score = title_score(expected_title, title)
    count = tail[/Cited by ([\d,]+)/, 1]
    { "citation_count" => count ? count.delete(",").to_i : 0, "paper_title" => title, "score" => score }
  end.compact
  best = matches.max_by { |match| match.fetch("score") }
  return unless best && best.fetch("score") >= MINIMUM_TITLE_SCORE

  best.reject { |key, _value| key == "score" }
end

def fetch_citation(id, title, paper_url)
  url = scholar_url_for(id, title, paper_url)
  html = fetch_html(url)
  result = if SCHOLAR_URL_OVERRIDES.key?(id)
             citation_from_profile(html, title)
           else
             citation_from_search(html, title)
           end
  [url, result]
end

catalog = YAML.safe_load(File.read(CATALOG_PATH), permitted_classes: [Date], aliases: false)
benchmarks = catalog.fetch("benchmarks")
cached_entries = File.exist?(CACHE_PATH) ? JSON.parse(File.read(CACHE_PATH, encoding: "UTF-8")) : {}
entries = {}
benchmarks.each_with_index do |benchmark, index|
  id = benchmark.fetch("id")
  paper_url = primary_paper_url(benchmark)
  title = benchmark["full_name"] || benchmark.fetch("name")
  cached = cached_entries[id]
  cached_title = cached && cached["paper_title"]
  if cached && cached["scholar_url"] &&
     (cached_title.nil? || title_score(title, cached_title) >= MINIMUM_TITLE_SCORE)
    entries[id] = cached
    next
  end

  if paper_url.nil?
    entries[id] = {
      "citation_count" => nil,
      "paper_url" => nil,
      "scholar_url" => nil,
      "paper_title" => nil,
    }
    next
  end

  scholar_url, result = fetch_citation(id, title, paper_url)
  entries[id] = {
    "citation_count" => result && result.fetch("citation_count"),
    "paper_url" => paper_url,
    "scholar_url" => scholar_url,
    "paper_title" => result && result.fetch("paper_title"),
  }
  cached_entries[id] = entries.fetch(id)
  File.write(CACHE_PATH, JSON.pretty_generate(cached_entries) + "\n", encoding: "UTF-8")
  puts format("[%<position>d/%<total>d] %<id>s: %<count>s", position: index + 1,
              total: benchmarks.length, id: id, count: entries[id]["citation_count"] || "unavailable")
  sleep REQUEST_DELAY
end

payload = {
  "source" => "Google Scholar",
  "source_url" => "https://scholar.google.com/",
  "updated_at" => Date.today.iso8601,
  "definition" => "Google Scholar citation count for the benchmark's primary paper; unavailable when no primary paper or Scholar result can be matched reliably.",
  "benchmarks" => entries,
}

File.write(OUTPUT_PATH, JSON.pretty_generate(payload) + "\n", encoding: "UTF-8")
File.delete(CACHE_PATH) if File.exist?(CACHE_PATH)
available = entries.count { |_id, entry| !entry["citation_count"].nil? }
puts "Updated #{OUTPUT_PATH}: #{available}/#{entries.length} Google Scholar citation counts available."
