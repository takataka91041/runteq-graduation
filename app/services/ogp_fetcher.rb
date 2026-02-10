# frozen_string_literal: true

require "open-uri"
require "nokogiri"

class OgpFetcher
  def self.fetch(url)
    html = URI.open(url, "User-Agent" => "Mozilla/5.0").read
    doc = Nokogiri::HTML.parse(html)

    title = doc.at('meta[property="og:title"]')&.[]("content") ||
            doc.at("title")&.text

    image = doc.at('meta[property="og:image"]')&.[]("content")

    { title: title, image: image }
  rescue => e
    Rails.logger.warn "OgpFetcher error: #{e.class} #{e.message}"
    Rails.logger.warn "[OgpFetcher] error url=#{url} #{e.class}: #{e.message}"
    { title: nil, image: nil }
  end
end
