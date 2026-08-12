#!/usr/bin/env ruby
# frozen_string_literal: true

require "date"
require "json"
require "net/http"
require "uri"
require "yaml"

ROOT = File.expand_path("..", __dir__)
CATALOG_PATH = File.join(ROOT, "data", "audio_benchmarks.yaml")
OUTPUT_PATH = File.join(ROOT, "data", "citation_counts.json")
OPENALEX_API = "https://api.openalex.org/works"
PAPER_KEYS = %w[paper arxiv doi interspeech].freeze

def primary_paper_url(benchmark)
  PAPER_KEYS.map { |key| benchmark.dig("official", key) }
            .compact
            .find { |url| url.to_s.start_with?("http") }
end

def doi_for(url)
  return if url.to_s.empty?

  decoded = URI.decode_www_form_component(url)
  if (match = decoded.match(%r{arxiv\.org/(?:abs|html|pdf)/(\d{4}\.\d{4,5})(?:v\d+)?}i))
    return "10.48550/arxiv.#{match[1]}".downcase
  end
  if (match = decoded.match(%r{aclanthology\.org/((?:\d{4}|[A-Z]\d{2})\.[^/?#]+)}i))
    return "10.18653/v1/#{match[1]}".downcase
  end
  if (match = decoded.match(%r{doi\.org/(10\.\d{4,9}/[^?#]+)}i))
    return match[1].sub(%r{/+$}, "").downcase
  end

  nil
end

def fetch_openalex(dois)
  works = {}
  dois.each_slice(40) do |batch|
    uri = URI(OPENALEX_API)
    uri.query = URI.encode_www_form(
      "filter" => "doi:#{batch.join('|')}",
      "per-page" => 100,
      "select" => "id,display_name,cited_by_count,ids",
    )
    response = Net::HTTP.get_response(uri)
    raise "OpenAlex request failed: HTTP #{response.code} #{response.body.to_s[0, 200]}" unless response.is_a?(Net::HTTPSuccess)

    JSON.parse(response.body).fetch("results").each do |work|
      doi = work.dig("ids", "doi").to_s.sub(%r{^https?://doi\.org/}i, "").downcase
      works[doi] = work unless doi.empty?
    end
  end
  works
end

catalog = YAML.safe_load(File.read(CATALOG_PATH), permitted_classes: [Date], aliases: false)
benchmarks = catalog.fetch("benchmarks")
papers = benchmarks.to_h do |benchmark|
  url = primary_paper_url(benchmark)
  [benchmark.fetch("id"), { "paper_url" => url, "doi" => doi_for(url) }]
end
works = fetch_openalex(papers.values.map { |paper| paper["doi"] }.compact.uniq)
updated_at = Date.today.iso8601

entries = benchmarks.to_h do |benchmark|
  id = benchmark.fetch("id")
  paper = papers.fetch(id)
  work = works[paper["doi"]]
  value = {
    "citation_count" => work && work.fetch("cited_by_count"),
    "paper_url" => paper["paper_url"],
    "openalex_url" => work && work.fetch("id"),
    "paper_title" => work && work.fetch("display_name"),
  }
  [id, value]
end

payload = {
  "source" => "OpenAlex",
  "source_url" => "https://openalex.org/",
  "updated_at" => updated_at,
  "definition" => "Citation count for the benchmark's primary paper; unavailable when no primary paper or OpenAlex work can be matched reliably.",
  "benchmarks" => entries,
}

File.write(OUTPUT_PATH, JSON.pretty_generate(payload) + "\n", encoding: "UTF-8")
available = entries.count { |_id, entry| !entry["citation_count"].nil? }
puts "Updated #{OUTPUT_PATH}: #{available}/#{entries.length} citation counts available."
